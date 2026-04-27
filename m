Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB0D175A81
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252889; cv=none; b=f2OH30Zrlloem7UhcoX+ldc7Jv0uYtzb+yPlCVRk5oy33oW7YRc5GGF8twBLvn4yP904lpZBQbJkC8jyKdW+vkqg//BbRlupeRGhPNbMK+dK7+WV0Yuk/PSn2nt/8WoPKCi5/KhmtsUCnawsCZvW+3Sm7oMvRibXA42KypXSXL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252889; c=relaxed/simple;
	bh=1VwINIObqsJW6y72KdClnlgbBXOSKzTZ+QUwyFNg+zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MEvY1oNATBVY6dG2S9bGMtMqNmnU8lNK5i4ABUxK5jqtPS+Dxt8z3I0tert2BmHbpuqcqZKs5/4QT3dkCfIL3j4UXz3YqFElj7HNk3uIckzi7DWymaYRX3W7k4zqVZgwkNxAB5KJZVNTd2S3X+vIzx/8FNWHCXJX7omA+JvVsEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkNpINnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U///3+EM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkNpINnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U///3+EM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QNUuQG1623433
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aMu7/aa9cp1aGEonzU1YSLOsOVRBXWAqtvA
	8WgjD/E0=; b=MkNpINnF3FxY1vUYC36o/IH4CamDEE+zauzsw6cRJ2be4X7YVJE
	CC+5RZy34kgvfmQMbJoHlFr7aHCahj4bw62e6W5Sy/dOcgDj1GA/iM9Df0eIWQch
	/EBFbRSu+Gtz/W/u9tQmYcrKsbqiICin+kVhp1AAhRHdi7yYjWDvyokJ0ayYa4m+
	t6zrCYJBI6WPsT9+goyWFsvepKJT18kl/ZJ1pqsnucveDjUmvyqgk+/FNGxfoE6Q
	NAdlTpBZEgcnt37QpRdjFBQWK/kpsfc2n8ixJlbyN4ylvAb65OE5Q2FRu8+pQVpM
	vWLyscain0/C7VzlP3zDtmoG/9eP0PbkhhQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4ustrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:21:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2e60238adb1so23918139eec.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777252886; x=1777857686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMu7/aa9cp1aGEonzU1YSLOsOVRBXWAqtvA8WgjD/E0=;
        b=U///3+EMxTgIER5xJ6MvvG9q4VndaN0h48nTNvYpnBSlozyOOy1XorXsqw28KNeZvJ
         WKy1Fgs1KfXtbYAOilkVvvbWN1Afu+qKP3Xs5QXy7kj/1itwiYRpkOPZpJLncM/1bHI7
         0CVckQ8AQkZofkOdrBA8hk+FOwAR0Fw8CCgOPr/h1EREy7a+R0QN9dcLrCOsPove4kIA
         +SO9AMR1ex8Z3PQ14lxfjXUi3pFOMWMyBjosFoZvAV7Zf1P79Hd8lTG+hMSHHUdl76SQ
         cMRfKPniQYS9bNW+aqKDjskOM/9PSz7czE9YdFRbU6ic1JnVuTEagdLAbBzVcmno1zny
         3mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252886; x=1777857686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMu7/aa9cp1aGEonzU1YSLOsOVRBXWAqtvA8WgjD/E0=;
        b=s5Jdks7k3J9hMkQovSvxN6l40NYYzoI7MHZyHPVft0g4+ryCTD0yoJR7iR7TGzNNGe
         WulaHyyIWuIuokk+VxnrIjysHJ4XfxGQBltCdHPF/EhcOwaFovPeiDdcGsC8tSO1eRih
         2U6o6dyTVT0rCzHdmDL1xawwiJjZIkLIUJU3kkFDhG97eCo6a5/5iuK0XcNvR1FhYiIm
         kqxD4ZgK4iev1rOtnRMtz/GI5CtMwU8lawuCdJBi1m6Tgakz9dakFnU1Ifgxaw0J8SHH
         km1ktPoaW1vI0xRR1TZt93rqfQ0il8FrgeeqRzCjudDZuzheQo6Ge/UIwXIJ3ms/RtRt
         z2Mg==
X-Forwarded-Encrypted: i=1; AFNElJ9AlDSm+juy1zXMZAt5X6oOE/qQ98IscSSfbT79aZUHEb11eUpyYB5bPxgKjNHpbw5hTZxaV76O7ACf@vger.kernel.org
X-Gm-Message-State: AOJu0YzteV6/Q/Cl+OHZTvafhZDFno8dfsyrIM3/mNhh9uehfeHwjy2F
	iAFG+gQdrcRqB2uxxm3AZ+ClxBM+6h49jWGR+VHBFMOBf+1tWBpIE8ktlWEOpsADy3thfwY59wT
	9SDrEnRfYIfnJPAE9qH9kyz+PGtpzQRHNs5krz0NlJAyK34BG1qqgH3EHXIHgXStA
X-Gm-Gg: AeBDieuYp9dVX+5lSeC/Do+rgDhCoyuVtIz4wzWDoIH5AEsJZY8u9MBgzr68+VAgCtg
	3rfah3y3CKxTxVEksh/bDFpwXp2HahqZLVHvT4vkwgHx0cS6Z/Hqip36A08d131yNx/xJo3U6Jb
	XyBULHpHEoLTWjJ6JBE4XQvgFz0CaAYXT1wQHC462sG02goXPlzSrYU5H7hPTZ1PXI52BDljdiX
	nbZkfMG84uRlxpQLSWSiIQKMcEGWFSI1YEe+TEYtUfZUNUH+7MqS/88SyeTjrvqctlSOpwOw2OM
	NX5BnKTfUFy4w949yGxK37Gu3DvFfql6swf2JGm3GCRDS3IsK2a5ZQGrQ+pqILk3Y8InvG3FNkW
	d0nu6OR+uIs/cxD8rubansOuG9AQ03thVBq5rHGMMluw6OPRPvYT7m25PWBJLH1n/9YQ953z5n+
	SVlli78V7dSIs4HsGw
X-Received: by 2002:a05:7300:6da1:b0:2ca:8099:ffc0 with SMTP id 5a478bee46e88-2e46538fb7bmr21490719eec.7.1777252886347;
        Sun, 26 Apr 2026 18:21:26 -0700 (PDT)
X-Received: by 2002:a05:7300:6da1:b0:2ca:8099:ffc0 with SMTP id 5a478bee46e88-2e46538fb7bmr21490699eec.7.1777252885843;
        Sun, 26 Apr 2026 18:21:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8aed43sm41138397eec.26.2026.04.26.18.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:21:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Date: Mon, 27 Apr 2026 09:21:16 +0800
Message-ID: <20260427012116.231226-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: N-yF98uwPIAVrbXm-8vBpQpNepZXSS5Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMiBTYWx0ZWRfX4sf+RurRziUp
 o7MINp5kmXMd8u9mWlccSi3p4jFEPPO1rKJcMJYvAST6gyfsLC9IK27HsmqIXUtEwYEElc2Okpx
 SSLkB7u9Sr7YpQsZForB+S1Qz3eVmIhMueJZXuaUf7BAlDU0twt/HBirh6Q655CL01fcVMWovL3
 01at4Ckko72yMJ2yV3hMpdykUruqD5FvVnXerxPEQA7lGMGmXhUqWhhMYFwsLwqV6YjcJMlNQC3
 hESGomrvALdNqTSIX3pUSTvSNnc+1f1D1k5h7g7vkBoUZ74KjfKYeqmtpURWdQnwK/oO438De1v
 9iWJimWDT+9dhWjXzfGUrDQMOyhVJifexgqF4Akur7qDlFpFC/3VY6uR0+0T56iZpvLrnExpQdR
 wKMvB0SSSpXFvh5v2LyoDe/gmoQf28lgxZEX/ZvV1RgCfBBcHKkVfEPzVuB/hJMw1zKBPKsF0Lr
 lk+6SePuMGNhloBeMKw==
X-Proofpoint-ORIG-GUID: N-yF98uwPIAVrbXm-8vBpQpNepZXSS5Z
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69eeba17 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JghOyed9f2jXz3oJZW0A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270012

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Top Control and Status Register controller on Qualcomm Nord SoC
which is compatible with 'syscon'.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420042124.1247995-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 14ae3f00ef7e..23317d1b381c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,msm8976-tcsr
           - qcom,msm8998-tcsr
+          - qcom,nord-tcsr
           - qcom,qcm2290-tcsr
           - qcom,qcs404-tcsr
           - qcom,qcs615-tcsr
-- 
2.43.0

