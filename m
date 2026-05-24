Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892BF316192
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652181; cv=none; b=K4ZB358VVJXRoejxYW4fgvDzU2PJPMiHe1TTDpQc4HRM8i1d4k3awRKE2g6HPjf0lVC6wg/5pcqtTVYIT2hHrz+ABtZfOWGgqumcQHm/5x4iqAHGsz79EOnk4Xq+OBeeiIOPGV/kQPHwkvXOtsuBrwczv0xszDwEWHawzLDFEQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652181; c=relaxed/simple;
	bh=xt8fdY5E19585IRxlf2tv2dOaGtOy/UcGSJMOtFMvaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHxU5K15nkKnfeFnEfD+CeSC5ygLpK7CPTeOA0ea+Jcagubf77M6gEdyZAXH4zf+5BCGRxbdMTFbU+Zuw6POYg6tnRcuj3W6YYC0x4KggGkNuAvm59loNSq8az14lB2mIqPZZ0aWL4bGnwyOlDQ8rHL6RVxC2pa9IXuee3VvUug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qldi2ZGT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTrKB+mW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qldi2ZGT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTrKB+mW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64NLaI1G2801844
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOu0AHZCj/AqL2PiuNRn2hpGRFubVPT4lIfFRQyrc2M=; b=Qldi2ZGT1tzOY/PB
	yxsmbJyWtPfWNTz5HQff8DhOsrcyM+7945g1GDtpZWB/sIvb/ZpljzF0LnyehR1l
	Mx2FJFpfHCZmlxaZiSitl5p2/obW4W5RllFTO0HZWIZdcvG98dPKbbcvhcKhdp/r
	p1GPQr8M1hCw7JkZm/Lxy4ToL0sgWR/qX3UizZZUkNptbs0cIsVfVt68DssgiRrS
	WWIgrRv5UQzEpybuCSjZikeZ3ICOsHUn2u6Y/ydvJCUpuebtZb8uhY6QDFOvJ8cw
	Kp4ehgXt6a9DoOmbfqeasu5vtjLw0fJ13ptWAHaEuEmeOeRLcFYNai/Iu6qkZM1D
	LewO/Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmm9q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:49:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so8483907a91.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652177; x=1780256977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOu0AHZCj/AqL2PiuNRn2hpGRFubVPT4lIfFRQyrc2M=;
        b=VTrKB+mW00QQ4vSW//KqhHRuzsrB62VLyyHWKHWac3shCYolXx83Mc1mmP4A0wAqkf
         rzthK4eDinihsp35b5WffqPLQ4jbmpE92BPX+F1eD2VM1PVkn7cznKp7AtZrIqlGOCgx
         G5vOi/sMVzQiP5ibrvYxJFntChYgquj/j6ScREVyxFT8teRhJspyrYVXNOnhUMIYep3F
         PdA4FsgZATgDKWZM10vmIfOVYFzMFQyC+D4iMGm+ppO2RHA5M5hnu9xst8sFde/XqN0e
         wOrTMagG14rYv/c06x+X0u953vESmOH0+GViVgIgshZfGHSeGA/EIk9VaX6zdwtvzKz1
         75Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652177; x=1780256977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KOu0AHZCj/AqL2PiuNRn2hpGRFubVPT4lIfFRQyrc2M=;
        b=snwdyO09PsQ40ganx6AbWKVOSAIsSI7TGFvDLHCNjWSIMd3FAfylK1nOMrmaG2njhN
         WZD31CCSPFzEuTHz6abGoO80z5PmQr0lf06f+LU9L3TNmZszOejNY2SjaR0+xiZU35qZ
         9Yau4RXsHOJVmcV3H+7lnU3QtUIg1Iiopknz1UM2KBs0OyqRk6VKp1hm9m6QaiO1sDkQ
         Lxb274TOU9QF9qiJUfRLbgrdMVutVc6ID2s7Ayy0TRyROArCKnYFTR3GnqJlUhj13wld
         0cDDWUe4VZlN2T3GVDCgs+B/MM6QmI07Dq+yOhFcuBRuh5XhpXRPpJgMF+Wu7G6CSoDR
         TsWw==
X-Forwarded-Encrypted: i=1; AFNElJ+9ap7/CqxmFr2flvNdo4td3wFEJLTpD9yH+Yd4BHpQa50GFadSiETaKtMuWOGZSaa5G2XCTeC3lqB8@vger.kernel.org
X-Gm-Message-State: AOJu0YxClI+FZy6z2UNr+zgeea8rWJrak+jb/aB5aofT++T4NGm5hvPu
	A4+wfWz0b78zJPGC1n3KFe8vKgXh9xUfTS2JFT+FWJaKOHXP++SfeiJs/h3gLdhFUEnvOxVFwd8
	d5igow/0sZtqTuCsW53t7KuMMR85jvbW8bkdvP47vXGiEMw57Fjpt1NLZyjdJ2gLA
X-Gm-Gg: Acq92OHrRXqIqRi0zWhegeNTKqWzXyf7yyON5eZjojBiylOReu2MYoxeqZ443DRJi1F
	3fjmBeUblnv9wrWchRUqKokmr0jBvvu4BNez71w18SIcQSg5muSpXnH2GWzvTUB5aCYuP3OgRz4
	HUrhLOEPYKcg2lAChAiJiWeUgobLeKXEp2TsQkh8fpg7hmiR5uJWOAn5sAMD+WaQEQrlUmS13+H
	RP6jqN9WkmqPYjAwVoNuy56YMcOBMT+izfSACtf8yUbIn0dOD8qz3/8rJ/Il+1vNrJc03HB5nhM
	KXR3P79qy8fA+oGEJkrp1un6WMT6fPqjR9M0JyQfylx7ECWj2a894iwO1fs5iWVyteiP9OG7fil
	N+PonxRMHe04VzsnQ/InPTTUrO2C4mD8qZt1+
X-Received: by 2002:a17:90b:4c87:b0:369:7421:b376 with SMTP id 98e67ed59e1d1-36a6762542emr11236354a91.19.1779652177372;
        Sun, 24 May 2026 12:49:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4c87:b0:369:7421:b376 with SMTP id 98e67ed59e1d1-36a6762542emr11236340a91.19.1779652176837;
        Sun, 24 May 2026 12:49:36 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:49:36 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:06 +0530
Subject: [PATCH 02/16] dt-bindings: interconnect: qcom-bwmon: Add Shikra
 cpu-bwmon compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-2-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=1062;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=MfVD9NAJt+YvcfkJInifeQ/jWKYZMhdr3T/JUeWSDbk=;
 b=29RL4I7Ux9+C57dyAQnhNhFTDoo4eCONKIcb+Dm+cyWsxoYC8iISBS1CA1Yg86kt9nuCErdyM
 u6duK4QOoKHC+Qksbo0V8tjo0h8UF6NIh20Wpemx3XoZQ9tLQH/r9RF
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfXxxTTr/9s5tew
 X3WvEHB21q98DY0ocR5yWl7f69vZNlhnghm+gNjmAHHKxQr+Ukyu3ggewAsrrsW0bkIniM9Xips
 JfVrMvfRXGAtrWkN863hAy4HEG6XNNd9MNGasXKeNi38rNSbwOw+JVNnDHuZMOc01S0imTJlQTh
 Sejlkb7fAXD/fghlfRHSAGvpD8wB5F97AwHerVlP4qokLGq47Z59tnNTWwDuFbX1qEs5ZOZaZ8k
 sT+nNuI8xUFCmAH6BdnnqXmgoSqxMUyVUT5zYsH2CoYsu2fvNpQW5l5izub16SYpdAhTb2YbA/2
 wpdBYBcbe8atH1Kub4yl27PmftrUmwq27iSiUsqHWW2TTSfwuxj5hzJyfgcHcve8btEnjIQjZ8C
 roerYzJyG7uKIyP8mBDR6x28U2HZXyksez1i/Zzm5Y0P56o9GcydfQGDqUBswXUdcESF4xNHxgb
 wdWsaP3v0L/Yio2lM+g==
X-Proofpoint-ORIG-GUID: 6l0Ze_TxjM6Ot2ZN83ZFmYwaZRgEiUd5
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a135652 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=s2Q_muabT7T23weRVv8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 6l0Ze_TxjM6Ot2ZN83ZFmYwaZRgEiUd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add the Qualcomm Shikra SoC compatible string for the CPU-to-DDR
bandwidth monitor. Shikra has a BWMONv5 for CPU.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index ff64225e8281..8f6c937e44ce 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -52,6 +52,7 @@ properties:
               - qcom,sa8775p-llcc-bwmon
               - qcom,sc7180-llcc-bwmon
               - qcom,sc8280xp-llcc-bwmon
+              - qcom,shikra-cpu-bwmon
               - qcom,sm6350-cpu-bwmon
               - qcom,sm8250-llcc-bwmon
               - qcom,sm8550-llcc-bwmon

-- 
2.34.1

