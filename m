Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730FC36A367
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328186; cv=none; b=q//FeuNwLoEyNmHljA4VawA8SjoYgW1Ve94I/r6aEAkX6F4SV/bDzzxzLw3KaDVrL9ms1EpDkQFeQJnAzrxddfGH47ZoYyKxmL3RCDJEzFKfrturWW/I1sH4Anv5/GBqoQqosVmM/qpc4vVZ9s4r86N3ZTwzIx65Az80T4E5YbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328186; c=relaxed/simple;
	bh=vhbCTiIuQO9jGhqLY3JyEZetbh85mdHspNJQ1sUvcPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AZ2zoFK5GQQ26hPXHg8X4uXf8G7GTtl+lksadq4g16gHQl/00KA3XJsV0Rkkr/k+Qd6kSTFDqQ6kQ4idyowlOK65lZtvImIy1ho/maWNitzeRnVX7mOZ8KY5LHfb1/jLik54OA9nGA9DDaKaipDeaWFIpKfCxWu/wMXB0hWhiPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7TyvR5T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0F9rk0a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7TyvR5T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0F9rk0a"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj3p93487730
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Cl5DO2tdKTh
	EKm3ySWTPGw4AaZdMgD9aMXdgCH2W96s=; b=h7TyvR5TkOjQhm9IWYMQNSYGZlR
	31Yk/QlKlYdmIQ2xMNDZcxcyCMMN2IPNavRhHnYuaMyUM1t5OEPnKvQy7zTlLN8p
	xNRQKcR7ry80MNmkfiPIrrv0OPu287FrygT21uPkvIew538g1YLOkho+wca+N1zp
	FyE0zigESTvOKAjX2Iw4VKaIYx5tSPRwJWlevXZmdHCZe31PZb7BBd3Z5nbqDuOR
	T45lgRj+0C49a/77j5HmfTF+evkquYu2MoTHDNHEKFLDKVn0CiB96OhNfoYoLuWE
	cEOEBITBFRLiReDltDCWSz/pji5GvqvhZSjIZzzmskhQU4jR+LnDk9bvs3A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d452848-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37cb88be96dso2592385a91.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328183; x=1782932983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl5DO2tdKThEKm3ySWTPGw4AaZdMgD9aMXdgCH2W96s=;
        b=K0F9rk0a63ZmPz0uOMuH8+t565IZUQSBxzGwLf87lLkjoWsMAIur+NXw0iE6sX2kKv
         4Fe7WM7R/vTsmFC6okiJI17YJ2nHJn6bxPJ2wr+cCoeDtragaq8dza4avJPo+00fSOFL
         7h8hS4P42Zsagt8QEOMKIUarvCTKJQ/ikLW1bgjbeMTnQcFocx7Kp73xp+pU7txvBj3L
         I5VeOTY+gjr1xhXAgiYMlpipt7IvmFiB06tQgHIJawv9AzRVm9ofYhZufbpKVugvG0/Y
         7f6A36xfMAmeM7KDfKRm0HtWQXApnAMATCavLgGhI93wFmLnbvsSJQu15lj9P5+kuM3j
         LR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328183; x=1782932983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cl5DO2tdKThEKm3ySWTPGw4AaZdMgD9aMXdgCH2W96s=;
        b=XvlKLIukPGVPUFgrgdPTn0ni1zsKmcToC13/wvRQSM50C/VLkt8RUmEXLinI/TfaFa
         7cvaZJe3NpcksRJUjEU5G226hRz8QRBo/nBib3MekBJUYCfOxF3F0ZNj/wzrE/RRDXN0
         OSqLC/Eh82hSn39fZDPFXxiqRHt+f5kDiGcawv8XMPzl/IRuWlSumOuXBuxkAIO7B61/
         fcRtLvq26Uru5nIy0uj3hu+HV4EoOB0+DBDtkGoeuHt3PW1y2tyGNMOcKJvqyyEgf+Zs
         wqA7DxenKGJtDYvkm0t2WnokMdG3Ik8RC3J0i+xwxV0Y8mo9/VBOhJIOXJJWnBhrOfhJ
         Nb8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ubcm2wEg5OAuPawJojyuBIMg+GSVmpI+vsl0vaIW8dewfJ7Id2Le4zFgHjm77u/Y5XGcIeekjBOWy@vger.kernel.org
X-Gm-Message-State: AOJu0YyhA5YPH6pCMLbpcfP2zzAIEL3vqEpd8b72iEGAa3+TYDWmouea
	FUYZzdF2jGY8VGeBz8X7jamydARs8SoPNr3C9vym9zKRhAcsSGRrQaEmP8na+vUj8NjyRVekvt8
	3x4mhOZJR0PezYCYe7ALHjxf5+/8LelzaoCYw/hDTZhOWD4sLf4tli1yuwcNxaqmz
X-Gm-Gg: AfdE7cnkEtLhj7KtnOZUpyPlhl/zQp56LoAwROMUP8B8mbxrouoKXZ5eHYjK3XOUV9z
	NzKPKAUoqw82+hCnIG7+DYExxrKLEZaF/+Dx+4peQ0nJHoggcsU8bezIuJ/8F/NXO4yVLtfFDMN
	m9Akz8tme0EX1hZ1a7XtCxlgulsMR834vo+A0ad/NTFVA7vOBgIQOpFQtnn5jrbw7O2vr1XmYYd
	5ND9zsBvcAAz1CX0tIzLgp6uzipSokLMXIvqEhtlD5DGU+P1hPcwww/TGwvqGFUSqlVSK5p9ng7
	/fkeyXo3Ov6OVnqlkiX6NnQLsIu+PILxl2N21G9ckag++D+ABaMtbT0rIT2nRM6EQi4bvun8o9t
	mcBBJpXhzFNpSSk50r5aOgJI4BoOQDrn09m9zgA==
X-Received: by 2002:a05:6a21:6e97:b0:3b4:b259:6965 with SMTP id adf61e73a8af0-3bd2d099307mr5545892637.11.1782328182995;
        Wed, 24 Jun 2026 12:09:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e97:b0:3b4:b259:6965 with SMTP id adf61e73a8af0-3bd2d099307mr5545855637.11.1782328182477;
        Wed, 24 Jun 2026 12:09:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 15/19] arm64: dts: qcom: sc7180: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:26 +0530
Message-ID: <20260624190830.3131112-16-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX23yNDpCK+t9B
 Lqma6kBZyVj0c9gYTcSduL+tOAv8wRIXhhBKdrio5CskfZ5GzJ10/dCaoi6Ovbz6dgmUeVjtrTN
 sQ78acAClCaN62vXu7pCJ6a5cc91zCM=
X-Proofpoint-GUID: GfmfKyiy7kX7nnAXUyqVRoTCTHyXvJNB
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3c2b77 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=uif5S2Ty6xZypC2F6NQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: GfmfKyiy7kX7nnAXUyqVRoTCTHyXvJNB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfXxnXTDQxPkGi6
 af42ruQY+RdJldMhpdLEGTKQBZPkil7/VbLDwkdxn53B4iFktKosZlyMu3vKVqTrG5gEjBrN1C3
 N7RsjZdM3K3WyRpdcukl52BiDSKIno+OAFzf/+9AWXAHOVGlpOAkM3L9zGTwxEolHZscfbuMhJ+
 sbkcR3Va+p42y012D4IPqjo+qiiq1SfkLlb96m/R/rK1eiGJqBXk4OV+58yT3QRkyZ9qt3ulMm6
 4QPi6gcPamM3tMxGFb4r3EYUDX/qK3X3RhtcG3/xXthjmsdSCOc+DWcbfJbY6Da9Yl6LSi5Nu6f
 /7I/z5rSKrxx3hpT5wprwTEht8dcKDsWAZkLJO2FBek86tP2Pj36W2pTLLHglc9uD8NE3aAed7+
 NpM1xBBPSz0olOk6LCo6eJKs6AC4mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index fa65c485172f..1f51fd431ce5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -385,6 +385,7 @@ cluster_aoss_sleep: cluster-sleep-2 {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sc7180", "qcom,scm";
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -3596,6 +3597,10 @@ sram@14680000 {
 
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

