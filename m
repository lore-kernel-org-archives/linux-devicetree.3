Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19F4384CDB
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479701; cv=none; b=iG8A7dmeZ1iJugJG5revsR6BfDaJRETGKbyGk/bENQkH8ADo+mAhE1seq7//BnU9mGlPYoiUTa0ERzg8yfviHiPgUBFLN17adaSwJw530YrfwEHSNR4p/yZIj3soOPZ+MV13KONqlGUSErTETzQzeIXDeXxHbLI4Iajtis/neh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479701; c=relaxed/simple;
	bh=UKjmU9ZL5XAcwn2dvwq3zYNCHuqXKTIRCrN+s9E66zE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltQtf5szHoftPn4W7G85cSHcqGgEDqMCFa53OADK/0csBqoo6T7owZY43ZwjsAOYrH8Gdw8QAf3w3vR2vw88EQpc41+ds8PlvWun7PamZfBfqT/E3M21YmTYGknPdu9tRhrXg2iqJAFJdELmj/uDlxA0f5UpjvLmBQaylDnvw+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/4EYOlh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NX1CjANI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/4EYOlh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NX1CjANI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MIOggc4007089
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MQozHojuwIg
	2/ZXVDnnKKPBUyMGRkmPY4RcLfe0/cI0=; b=e/4EYOlhUyP4RvGkGPD6c2Yqd2L
	Chh0b/67iweNZxZIzCCJ5F16AggBZZhM3PjTjzvxTn+WP+WhYI9c/uP1m7KJSxTE
	Ht3dRdxwLajPGnO/sxq7TeNnzJgxeT/d+PIPygm8hhxktEI2ZdMthVmT9/E5X1cM
	GF/LlE/AWXrHsyMswuu051YfFq1QMZBPf+sDBu7V7l/x8m21XdQJ1HJD10EHA80T
	U/AW6aYOLx50E8BOiDH5J98SRntL7v25Ip6pw1X43yYVs3eDDQVGDiOkzoCJidL5
	Z1uNKjH9p+EnP7NA6bYgPLuQ9d2QH0Tbc89tTMgM2Hci9RZZC2oN5jl1vrg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eavd988xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c81086bf930so5373443a12.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479698; x=1780084498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQozHojuwIg2/ZXVDnnKKPBUyMGRkmPY4RcLfe0/cI0=;
        b=NX1CjANI1THbXhO7aJFJYT3ILnq3mHzRighqkklgRamtn3tjYNtybZz7lomXcjozox
         iVrwloB8Q3P50vJ91ntflKLh1Ugmv7Lvyw22Fvk5M0tUAKIUsYQ+5zY+UQ1PLTy3YFh2
         ahcbFunMz/xC75bcmBwTPbalSqw7rzCU5gtguFXbC+hsn9Kw9pzMN53eIOWWBXNBzx2R
         xuQn5R7+4r2lqDIr5ZFWM4rqVnNxyFCH0rx8Uhx3QNjW9kYILczU6J/cYxHkBRXhroiI
         GRVJuVu4peWxilrxgoI0DOtB8QGrLa4S+CdP/JyVFXu2Tyjr6AIeh8Siak3YuM2lHoLN
         o5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479698; x=1780084498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MQozHojuwIg2/ZXVDnnKKPBUyMGRkmPY4RcLfe0/cI0=;
        b=Uxt1CUVnlM2PG3c4syRYYyuknKo/iQ+bNrkdWucq5mEl3jkMzy8wsphUjZfJy6tJfw
         dj5PXUN7BWRh0FIq8ALqAVMWU4OEd/QWZ85PWK+JonLp7OSRtAokMLvLOD4Po2bqATzS
         SSeKiqm8H7EGhuapGQJhYRpvuNFjTBrBZX9XHZxx/TEFd37Si1xaX5inkPSgiabXAkDI
         OFUirXh/2cUoDVLNHEvw9MWUq6odNllMbghft/vs4FCGAMkrWkgUokdEAKqtwbO7L+G0
         Q089NACLOuJP1KwrHk2GDqCOuSdaMNXye2J1GT/e3S9DBhZ6AK53OLRMsEJyhnT42N8y
         aTag==
X-Forwarded-Encrypted: i=1; AFNElJ9PE2xcmwzLkbaDSO/82IxONvotf1Lg4yhP1gd02v6gK7Bgl6fK/KotFW7tPGLHrNP6N6lWgvJjDRcF@vger.kernel.org
X-Gm-Message-State: AOJu0Yye1qhzon6iQVilb3KLdE7OcUAdeeJuECPc79AFaUSiUi/jTgx7
	va5yTSnJwgUC4bpXf09SZbBt0YB8FsYlutpLhqwQToUNfbr0LWUP1jIY8nX6aX6XeoBg8rSqkhm
	IsKh1nYGYfht5Z7q+vrY24FdqtOnH/P3UUF4hUo0Bu5MAG6Cro92118GRn2xacDDd
X-Gm-Gg: Acq92OH+x7smzQhLLGQPW1oyFYsH6QnOQx2kaaTpm2RPcFyC6Fkz0rsIvtQLx4d2eV6
	ZzylxQJQ30PmuIycvFTJfgYjZMK8jvEow4b9FOrNAB2OORy/4yWI97fpacjDC5mWJ2ZbCrQMmaa
	5/8boIToUtm9GzySgLEYHzNpRsPjjLruyKe8PoE88mI7L++4wO4gOlEO/JMSfsUR03cxACh5/6V
	bFKtucp0LdikkR4zf5KjZmBR8ZLiweGria+NBZ7Tmj8mBj3HmeKwipFHfOXkXoAt8Q3lAzbm6N+
	JIowFeec3Y0mIJO++XG3HZdowVNVHwvhmCtqCVTSByJZh4VgKD5DW3JyOaPi7E0QzcVq0VL2oEy
	eg4IPcC421SJ42O8QLSuyYNOl1OpRo0dsvIMCFdki039rOq9j
X-Received: by 2002:a17:902:c946:b0:2bc:e299:4b3f with SMTP id d9443c01a7336-2beb085f3d0mr44427115ad.10.1779479698318;
        Fri, 22 May 2026 12:54:58 -0700 (PDT)
X-Received: by 2002:a17:902:c946:b0:2bc:e299:4b3f with SMTP id d9443c01a7336-2beb085f3d0mr44426895ad.10.1779479697820;
        Fri, 22 May 2026 12:54:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 14/18] arm64: dts: qcom: sc7180: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:05 +0530
Message-ID: <20260522195009.2961022-15-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX4xcsqO1d+zaY
 9TRs/4fSH1M7GvHtLtB1nFHlb6k169xUFIKo6q72tpRYL8xWAiOvCNF2udvXu2vckZlYmiLcK6z
 rFzZgKzYB2vudHPBZ+vNdx/mx9RLOOTxdAMmsYhhSe/FGN9ungVM2BFuHLXPljycrzbRkq8uqkl
 zFgGGoqbnM8OyPNChQcsbgW0tvu2UYDNu38kuO/X2PMVbW7/cCm13bgZDBcpgjpelgVs1harf/k
 7p8pQC1Jyr/Egub7DsdcxoWyCNzPxdxw/R0g5dCFoEEXEJEHFTOgXkoTi1gKLDar0Hd0gNu6cDX
 hUG09N0woc9vzAUqskUvgfPz2C1M2J6685OSkAvegGNS5lKlWDVuJrX1DD8QvSAuY1mQ7s2L9lC
 KfgCkTrNCnyCuP5zvU+0LHy4ZQl1nM1ByGoxKG376BrjDk0WgOzW3eczum06WNBuJOejbG1oklW
 wOlc4HGCAwDVUz4KirA==
X-Proofpoint-GUID: Sgv2WKslxqNIC0mTuzksDJC7EOOtem5e
X-Proofpoint-ORIG-GUID: Sgv2WKslxqNIC0mTuzksDJC7EOOtem5e
X-Authority-Analysis: v=2.4 cv=F+dnsKhN c=1 sm=1 tr=0 ts=6a10b493 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VytTfPOW3k6kkw8Luf8A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8341a7c4a4c6..308a14339b3d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -385,6 +385,7 @@ cluster_aoss_sleep: cluster-sleep-2 {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sc7180", "qcom,scm";
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -3592,6 +3593,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2e000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@28000 {
 				reg = <0x28000 0x2000>;
 			};
-- 
2.53.0

