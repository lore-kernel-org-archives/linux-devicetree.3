Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EBD3F99E3
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 06:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354605; cv=none; b=Ff277rtoBBRWHSOlZQNui8t/uQa2RDR9FVErJIa4s/T5GJSaV9PSB1G+62xcnh9GYSjUZQ4CAtODpG/M5ikOZKFJogngPp3B529M1/ICloA9C2gVtdXzdc7Rfyim/DEm+DB2iVcIJjTjps395GX0zcxCSZjEBEScHQhpzgoyRuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354605; c=relaxed/simple;
	bh=UbxlUsVad51XjlMr7BHaxV3dWnxuikGfc2t4VeSwSBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGHbOGno9a8MVxwWeB/9coJmHSAuKCeNlP0BWff9rbTP0rzhC4DGj4sYgibU1dND0IQVC5XV75UiEK/Aa5GkksGJ690ha7tbQiKsd61e9uT/fjvWFpX3kzICtbQWTLLrToe9ghAKuLvlVijHD8Dv5yeZvmoytiNk8mSWmqwW1XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDa+s77j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCZ2kF1X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDa+s77j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCZ2kF1X"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974UEf21895482
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 06:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5RO6KrOqtQUt/yGDo9w7+j/X7O1yX9dfy86UnAtqqo=; b=fDa+s77j/RNxG1Vk
	7FNsYIu5E2xSFIS5YPGLdH218qQfnbCU1VeB6H1rUyYJWp2kpkuSV5xV5lOFV8In
	9WPjCfgo+uvdCu18NRNpJwFE9+lpaPz1NlG3v+MctOPuVjQ2IOfDRoOGazRKJQUU
	9edZplpEErATK3Q8YY0CZOjLPHlyj14uATqUWkhfLtZpI/sBv0PN4YZJUn2E/Al8
	WUEp4j50XBGMpE9CLw5+rXvu2AGdSAxH6d2SHE0nDt4rjouPUF8nTSEN/ckE9nsh
	DBZR1hcmzHmiUwAfrk5Ypk27dix4SDMl/Uozb+DGlopuI76ISGPJjhftH5WO7Rls
	cXpQqA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ask5u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 06:30:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a7d2f25f65so1223585a91.0
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 23:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791354602; x=1791959402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5RO6KrOqtQUt/yGDo9w7+j/X7O1yX9dfy86UnAtqqo=;
        b=UCZ2kF1XcsmWtaUn4gLL1FuYfaNJePTHn1D3W+GHK0ivvb8/VMuIBP7fGRJbGtjBlb
         oEFm5lO8auYOC1AoTqH/g6q3k5ss61Xmu90Loi4A37idzRFt3/6DcjHI43IHy6tjdTr9
         KfxcX3yDiVlGGc8q3JT6OA26dmI7iFVoj358oJdpZiqJq4ZnlwAXvqe7Wy3DHdFpowx4
         BI47mn4XcV+kD6jMmoM/3y4/k78/On5Xevw97YOnrqwh9zyynkfEaBvPffBd4HB4pU0Z
         QEhdAM8rMIllfqeILFk96M6uuk/IhgazLBn6am45R12KMYodOeUwx2nNvzImydzGC0pm
         EMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791354602; x=1791959402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5RO6KrOqtQUt/yGDo9w7+j/X7O1yX9dfy86UnAtqqo=;
        b=HqsReBpuLWjEzGyKf/TJlhZYC59CZsJVcTjM594vjBrlLZX7zs7ulumV7QOEp/sabo
         wKIzb21mH6+DO2qTxOayTDQLtyLHEznSenkRkvnjB0rDvwr8930RJIetIIuSwZ22/HH4
         RCG3ZlSIIi4RmVGRCQ46AVhznqVhbYk3xxfghIGkKm1rUWFSEz15SYPhOm0hB2wMe38R
         6n3Hrhka52JgacG54Vlc7bKMnWFFLE0lUkDoEEeC3BdvXW9iXk0KR1iUjxErwZpJLq5F
         mcCrC9meBxMxIoliLSYzP1mMg1bRpLQ7OtxtqXig+JqFFMTVxP/IBgiPWqL/cIGALFNW
         oNKA==
X-Forwarded-Encrypted: i=1; AKwUvBzZJojF9WONof+SQ3/B5CzQUriok60uqYknmCWw2SqKHtEtbtQpVMH8U2uh1XX05CQd94soZQuwjQL2@vger.kernel.org
X-Gm-Message-State: AFq9FYIqvMgqC1zuBva7tsMkXIfq3GC66FT8x18zcp8o0h4+VMC8uJPm
	hyVoQnB2PzAXWmAnMDp6cixDIjFSGyGbl+O8N51x68roG7eMbj/EW3fTXIkEcEh5k7dK1hZmFKS
	uBIPKbmusBGXnM6D4B041G3P6dhWg1cKNXsTWz16hz0bqdEfpWPsuApX5fxOUW2T0
X-Gm-Gg: AYBFou0H6ScFq0FNHoSLSzgx75MWpTDnvaZhVlqP0fivuxgOTuqsEFCnbcgjUTmK0Ki
	wagBQmAFyYBiqYh0ypIYMJe7JeQwBm5MqaWI0C78HuGgd2G/6uCuQzEjsMqPRBQN/ijO+mNVJ0J
	j5yHZGB1xC/MfOiqGVET+mcFoiRP6FZFu65EQ355EAvQqXiVjlpIk35wIaTlCTLnz2zMDhTjGRs
	+e/Al+oSvxuqwB5EKwLFQIaJkZn8kbitPafCcU59ew+ksJg7xXt8uqxE33ADAsPKUeiHS31XIuH
	MrKX1kqKMF3mhpLhSn/p+RYsL2g6LwJx3m9PWqnlGZjK7hxJy60huctVwp76bB5t8s7Uys0n6PR
	QsgBfJuLL2w9r+V0GIQ/G35LGvA==
X-Received: by 2002:a17:90b:2245:b0:3a8:21eb:2e1a with SMTP id 98e67ed59e1d1-3a8a12be15dmr869382a91.30.1791354602419;
        Tue, 06 Oct 2026 23:30:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2245:b0:3a8:21eb:2e1a with SMTP id 98e67ed59e1d1-3a8a12be15dmr869369a91.30.1791354601923;
        Tue, 06 Oct 2026 23:30:01 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89ab81bb0sm2972690a91.5.2026.10.06.23.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:30:01 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 11:59:34 +0530
Subject: [PATCH v3 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 Document Glymur QMP UFS PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-glymur_ufs_qcb_enablement-v3-1-84cf4f861415@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
In-Reply-To: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791354585; l=1186;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=UbxlUsVad51XjlMr7BHaxV3dWnxuikGfc2t4VeSwSBE=;
 b=VDlPhQHPY80/A3c4TZb87pFj8z1u1YbRnTRRqhQ3i/QTowrosI0/f+9EodGI9A2Cs8stxim/f
 vQ8IPcNv3FtCt3aaBqHedQutRr6XTMxxNDTzejfWNzNxjSVheDLW8H/
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-ORIG-GUID: z0FC43q9PWNoQ_IZhXGjqwevnixRC1OF
X-Proofpoint-GUID: z0FC43q9PWNoQ_IZhXGjqwevnixRC1OF
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac5e6eb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BahsdhlD1VgbZ89a8f0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX99DLdBLrsz03
 IKeSzX8rTlQvYjY8ZgpACTX9SVtODLlHa9++SrTY4hID2TMIMVQz1YuCJWjfb+bnrjA/m1kyNy6
 vjk0Y3lLl4l19v2KvQOYnOLmsMR7O/eMXeDbeQNTPjHszIBYhbRA80QNdT/RtzHoTJTp4+TNdT1
 AzAHRYvGtSGE1I92q4HP/FvoKsRB8uyRwEQ7LL0Xu//FW5fxzuWjxorl4I1x5riPkEgzgIR0uoA
 t3MXEznP50v9M0ZB5p+/t1VVinp7Ha8RdETM6xjPTHAk2Nly9JoCwcux2ta9qvwkhYd5PH+5iPP
 O51KIEGyJl/0OyZF3++5VgJimX2sgXEm8SlFHW9oWLzlqKa6/5F3biCPYN8YrDwheyls3YM1grd
 5BstRcWlJ9IPAjBbG/2DXf58Y3iBG6FqogSEW8Vgm+G6pCf4bNoNL+p9anANnmPb7VACd6XdZkN
 5Us7TGCVCDbGhzTzZXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNSBTYWx0ZWRfX8OhHCBWRwFIN
 +flMPbfbx69Wc0oZ0WwuZnrnEFYe8wp/NB2Tujit2GGe2r++taB6FLKPM1tsvamgDEVre+JxRCX
 j5X30OpKHeYGXdlbGokYjZkbbYlsnvw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070025

Document the QMP UFS PHY on Glymur SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index eb289c09906a..fb631f906513 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -42,6 +42,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,glymur-qmp-ufs-phy
           - qcom,hawi-qmp-ufs-phy
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
@@ -113,6 +114,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-ufs-phy
               - qcom,hawi-qmp-ufs-phy
               - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy

-- 
2.34.1

