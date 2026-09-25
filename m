Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733094746AD
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331202; cv=none; b=j8Jj+xHIpDJzHPKG2A8gsy350OAlv7f1zWWiFZ2xMC/X8boqpmaQPcP40hmiUyNagOSo96qyfXqznHcFFcXczv2VCtBPt0cMJzeTgLA0SZI7iOjHIHrT5GPOmnt9nsB68urUOydyXpYb20NrjUmlIV1JC95F+eTtiPLUl9BYQjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331202; c=relaxed/simple;
	bh=BGmwBTNE+NWpVWG51Ixiacse3NJ3vHPzMJL3/ficNA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hJpG2Y3GU8FiGXWIrCHNTPmJ40sR3Tj1JS/ONtYnIawr50avJT2W71wkUCF7UhVokZSrOPwpfSUd+JhRoblH8GeVVZHI5ZSkBNOdjktPnmYj0H0/BhaJVYbe54k+Kf8vU/d1MNMe/xb8cBSV9FtsRAlSNbfF1G64E+qQlSamxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhPZw327; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqWVpeWk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhPZw327";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqWVpeWk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YoX03532401
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F3MPS1T2sYYojpkykcYI8gFFNAgc2Bw7m4V
	cyg58u9o=; b=QhPZw327XrL1zG72bL1cVgTHwJ9qZBhTwMRqPGGpgkhAlGlaqot
	3HVExAjAP/42QCwpQfBWqPxZDbYO1X8QNPBBmVPXIdIP11xHhYp5AZyjlDXadLs+
	7VRy6ZofPL2XBQuwHK9qNJLvPhysc/0k7mshC9olftAS/x5aRP4I69v1jydg1D1c
	pSXhIv2OEB/3/CIcmbKwPq4okVQTpPeV94b8neMyAfYKtpMJJo1r4rTQZAKJHSzU
	xB0U8UF53JTvWHc9R5jOBZSUPDCCT8WoD6t4d4gtDCkb8EPLLYBQgFDaluy/XANG
	b4IOb/Ss41U9RmfaR09MRt9eUzWNTiK+zag==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kaqk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 10:13:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-313d1015161so2485803eec.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 03:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331200; x=1790936000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3MPS1T2sYYojpkykcYI8gFFNAgc2Bw7m4Vcyg58u9o=;
        b=dqWVpeWkJ7qt4jzyLu9cgOxj9OL7RcKp17Yl4I+dT87ItQkqxBGFjtOr1fxzKjCTaZ
         INZAXTPVQullcy6Xpq4BjthkQCrIAXvHMfgz/iPDDPsMT3eZ8spqvj+wdbMreI5lEIOH
         MV+fJvOiwikDPWcRa5FmCD2m37uNe+YcYZxprm8ENwQ0JuGJjDbFYqIOCGtQevZa1URB
         F+z0Ki244W54I3Nk2cw2RZwCcf7i19WmUphOa1FOZkbbW4gwqr+pK3Kfe5O/mTeuAxwq
         PPjRAFlLQu9HLERU7oRfWZcEgJJjynGO9dEelyTII8PAt3ni7AZdG8jqlCfTA8SrSk7z
         uwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331200; x=1790936000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3MPS1T2sYYojpkykcYI8gFFNAgc2Bw7m4Vcyg58u9o=;
        b=SHQWYIAFYw0XPZNrfJ8KV8FnozOuyX5Rxr6GpcVtxAWm3XhtidRVjl1LCot0KQqmD7
         oBAMJFfG+YNwiHsSbCjA0CK13l06xevJH0rWs2BfHAP3mdFIkaYMSOOEYCsls5e2V9Fp
         dkAFXIOq4wzFzJXj2ZeoVnmOdlyNg68Rptgml7a6jKRUc9pWu2iD+WsnSoXJHcsOcgQ+
         bjZqjOygb6Gt/snDTwqVaU6IPKXJpA3m4VVkNj8LpRk3snryGytQRUg6LNznZLhwTCrf
         CRm7kVlY+AWk5hkA9UwYlO/eWWRHVrojVTTUrpB9IIXCuKrOYroK66MuPYrySx/xcqyd
         gTDg==
X-Forwarded-Encrypted: i=1; AKwUvBzz6M3P6faYGYqireAWaLjLOaxciCfHFZHqIG2MXkeDQzVMbZ5i3BtKFYBWpxMOqi8kqiVQP/+7Omq7@vger.kernel.org
X-Gm-Message-State: AFuF++mb01KPHhLHsOdPUekxZJrFAhi4LdsfkNh3+PMYVszIeDRuEfZE
	iD1u9yEOsT7lhvh0PQVoNDfL3fAu6MYN9IiokVKfQ3CLAn+kdxeBsSvVyskp9Wfneym48eSL0rZ
	fnjTtdqGBwqKBiPl0KH1AsCb79kd3RM9pBTiM1YwTStdtvesR4PjKjIBkkZ4tuCXT
X-Gm-Gg: AYBFou1LixP7+E1Y+/OwcrIhPhbzhiN5tfzpTlfYSP42RpRwOOBM1esst0dVb/ZBRVf
	eklx8eUHw1Fxxw6TOkaXSoyGqtPeJAKyHbbT4Q6ZPR0jqPl4VvPzaDiLV2r5LsIXHysEkkYrdUi
	x3nRDA2vwHYNjxynaCLil+bniwTrnYnVsoRs7ExOZZZuis3W/yoSSd9J7wzW2rZo152xe4hn9Bu
	NGYYMeyYnWJ6jI/lQbKCPyg18Vvykg59cnTBZJOERVk8I1G71DZ34tXZmHyPYjyyaotVTZhaBfc
	3+0L9J4yqNz9Q2fBC5sFA5oFgSQvTF6sKpj7lPFMF11fQSzYsldE4s6dM0TtXveGN1/THfQQEvM
	Mye83KhyfLg95ghn7LbZd8dQp8Q==
X-Received: by 2002:a05:7301:2829:b0:33c:1f44:81dc with SMTP id 5a478bee46e88-34004592b2emr4265072eec.6.1790331199791;
        Fri, 25 Sep 2026 03:13:19 -0700 (PDT)
X-Received: by 2002:a05:7301:2829:b0:33c:1f44:81dc with SMTP id 5a478bee46e88-34004592b2emr4265036eec.6.1790331198736;
        Fri, 25 Sep 2026 03:13:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5397961eec.0.2026.09.25.03.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:13:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/4] arm64: dts: qcom: hawi: Sort IPCC client IDs
Date: Fri, 25 Sep 2026 15:43:05 +0530
Message-ID: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab64940 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dLohXW9gwQ2bYbRNfKsA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: -h3-Cy0b78KYWRqmco7pKnpy-XyCut_q
X-Proofpoint-ORIG-GUID: -h3-Cy0b78KYWRqmco7pKnpy-XyCut_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX/5ay285+6irE
 noizRTVzcUu5eCk81Za0xjrVsdXJB3Hsna+6Yx1SYKG/3AA3BkO5gKIEnrXJ6e77Bvshpvr+XoW
 PfVSqDxvUrmX6e5NavOLNx9ztls61peormTT4Y8okdz2UXfJPBOjwW51LkE1dF5JXFifovCO2pr
 ExpZ7gjP2yGHKoEzsx3kRdIK8QK1M0os1caiUFMTdKV6UEGAAyRRA9M0oRCMC3xdgDQAXuqFeh7
 o0PSUYjy2Q8VdmkNrMUdWer6YcalHDSdXgjE74yFaGoM9BakU2LMqxraYZb91zzt+A5zVOpB4fJ
 3fjqtY6KebeX58NasF+QBNEU9B9Ex4WpsgypPVQr6//E0BarR2nbTquqF8Klpeh7bZzz+4SO92D
 MgK8LmAYYxGCpdpEvU1ucacfC1zllgMdHOG0nrnUVI68syjl8K/LAE20S+gPn36Ti0aUDkO7KqH
 W1YoT0+G+9+kCRHYiLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX6Gl0fQ5O8Inp
 TwMR5a4+bPKnfr/FGsczALvHikSFXo1ZtM1vBNLaT6n8WgtBAdXgcSO1CIpWWYWXf3wRs1MDepo
 SCEWeFu0Fu931u01Py5aBdLOGPOpxvg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250040

The IPCC client ID macros within each group in hawi-ipcc.h are not
ordered by their numeric values, making it harder to cross-check
against hardware documentation and spot missing IDs at a glance.

Sort the defines in the IPCC_MPROC, IPCC_COMPUTE_L0, IPCC_COMPUTE_L1,
and IPCC_FENCE groups by ascending value.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-ipcc.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi-ipcc.h b/arch/arm64/boot/dts/qcom/hawi-ipcc.h
index 67f228e1aa0e..7659357691c1 100644
--- a/arch/arm64/boot/dts/qcom/hawi-ipcc.h
+++ b/arch/arm64/boot/dts/qcom/hawi-ipcc.h
@@ -14,11 +14,11 @@
 #define IPCC_MPROC_SDC			4
 #define IPCC_MPROC_CDSP			5
 #define IPCC_MPROC_APSS			6
-#define IPCC_MPROC_SPSS			15
-#define IPCC_MPROC_TME			16
 #define IPCC_MPROC_SOCCP		12
 #define IPCC_MPROC_DCP			13
 #define IPCC_MPROC_QECP			14
+#define IPCC_MPROC_SPSS			15
+#define IPCC_MPROC_TME			16
 
 #define IPCC_COMPUTE_L0_LPASS		1
 #define IPCC_COMPUTE_L0_CDSP		2
@@ -26,10 +26,10 @@
 #define IPCC_COMPUTE_L0_GPU		4
 #define IPCC_COMPUTE_L0_CVP		8
 #define IPCC_COMPUTE_L0_CAM		9
-#define IPCC_COMPUTE_L0_VPU		12
-#define IPCC_COMPUTE_L0_SOCCP		16
 #define IPCC_COMPUTE_L0_CAM1		10
 #define IPCC_COMPUTE_L0_DCP		11
+#define IPCC_COMPUTE_L0_VPU		12
+#define IPCC_COMPUTE_L0_SOCCP		16
 
 #define IPCC_COMPUTE_L1_LPASS		1
 #define IPCC_COMPUTE_L1_CDSP		2
@@ -37,10 +37,10 @@
 #define IPCC_COMPUTE_L1_GPU		4
 #define IPCC_COMPUTE_L1_CVP		8
 #define IPCC_COMPUTE_L1_CAM		9
-#define IPCC_COMPUTE_L1_VPU		12
-#define IPCC_COMPUTE_L1_SOCCP		16
 #define IPCC_COMPUTE_L1_CAM1		10
 #define IPCC_COMPUTE_L1_DCP		11
+#define IPCC_COMPUTE_L1_VPU		12
+#define IPCC_COMPUTE_L1_SOCCP		16
 
 #define IPCC_PERIPH_CDSP		2
 #define IPCC_PERIPH_APSS		3
@@ -53,9 +53,9 @@
 #define IPCC_FENCE_GPU			4
 #define IPCC_FENCE_CVP			8
 #define IPCC_FENCE_CAM			9
-#define IPCC_FENCE_VPU			20
-#define IPCC_FENCE_SOCCP		24
 #define IPCC_FENCE_CAM1			10
 #define IPCC_FENCE_DCP			11
+#define IPCC_FENCE_VPU			20
+#define IPCC_FENCE_SOCCP		24
 
 #endif
-- 
2.55.0

