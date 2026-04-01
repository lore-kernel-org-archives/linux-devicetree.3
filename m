Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5225847CC84
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068537; cv=none; b=vFa0cpSFSGIRSr8sthOdmczMvjBSD72K4zys+0v16lVJyuHEl8M/Msbehy0apkguvSFitzRq9HtJJH7Ibh+JkEGTe7FEF/uZqCXmk6gS6i4OBDC7f2Qvy2B3u9Z16GDKFs33nries7MWVZHB0DaneJM6UCPmhunPOnrbFzr2VJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068537; c=relaxed/simple;
	bh=EO6wIHJczA3VvsYGnu0L7zmcO4vFjyoJImmYAJYF+Wk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T7bm+eCk28JzNHgyiU6rYpK5jOIgNmTFVIM8Oti7UhkKZBk1BQvG47sfL+M+UHkxOrrkajHAFCLtKhKR2GsCL7jcfkdkIsbI2T0NONU/guGfntmQkq8Iynwi7jMHQuXX1KEvEtoJH559PyWD/mkRqW4YeqNVNAgL5UgvxpLZIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HDtf3TqH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfB4PH71; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HDtf3TqH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfB4PH71"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631ENEtA3174212
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 18:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsX33gZ8f3xGZ42QaWROnuVbckPXzgNU++EAXR8wAik=; b=HDtf3TqHBCLb+D7+
	LxTE+7NK6EL+2Ur8HC4hXHFPv+BxIKOGBSesNESnBOfB4fCVnFhCWHxfotgT1bct
	oKdma3lj1B2Xae+h8tK5mAkkyYAShDfXIWykgRNBfvciZ80iJ3SHyIZapmxRL5Df
	uPuaK2cwqp+nmqXKMdYzoQEp7YyGGBX0Wn+zhU2re8Ak2N01D6UmgKeTG6B5mst3
	xplHoX+l0p2xyNdDiNOiIAyEH8X3W0w2KUKNz28hiAp20quDFJylQ/DhCbcSgdbX
	WZC9mEt6j7pEOT0FpCXlUARORMk6r4wjojUxqTsvorwOrjdwfSjIbWQaVgyyL7Mc
	hgxMRA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d90gbjd2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 18:35:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62da7602a0so3545a12.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775068535; x=1775673335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsX33gZ8f3xGZ42QaWROnuVbckPXzgNU++EAXR8wAik=;
        b=PfB4PH71B8PAFgxuUBAx6WJGCp0axGXrWtaaSyhePUOoKI99uxTwYUODtVn+4jcTPV
         MtZLd7CXJberD9GXhbTH7A2pbUGikIdiWw8JDou1aaSfmlifwgNnKN2NijYWB2+Q5KCS
         n/lFRzxORXv0fvKfPZH7YbdEYXCs2gEfOcTbKvXNYuv2nXok2Q9sZQuG5iN7N2e4tKE9
         Z6AA9/ed1xqYdIGNwtj2+u7YWJsgoNPpCjvjuSOwtQr9oYAoj52iIl6zPPer0ZiQLKh0
         HJVawxHGELmg7SMr5yfmF3r2mtr/svzQ44q0J6XKKK4psUEqKfVqqR3UfJ/JdrcTSRfF
         CJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775068535; x=1775673335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bsX33gZ8f3xGZ42QaWROnuVbckPXzgNU++EAXR8wAik=;
        b=Av/n+Ep6bhviALrDs6GnE6eLjubbnZSW2PUZRHUmR/3hOzZX44JDpUUspcAIE7uM1e
         IKmZQ4XrCD+35cNEx7Yy/arqp1utZ71QXz0UrELPp3q5eweODZVyZZKWf08MMbQcOCBP
         e8pfyIrAogpLUWgfJvPH+k6r/MAg+PFQqQ8iGXr6AmbbAgUVC9NNV4tDe7H+1sj71VJe
         kKZ5OKZGTwV39HWHAnsf+czDuYLajYHTyUvRf/P7pfAumua5rwuaDGgKfDnt1i18oCaX
         Cgw420wl3bYITGz7MkyGeu9O5zKpu3UGk/Gq+2yiSw7L5TRAduMPwoGtgxsSfa+JkrHr
         +uMA==
X-Forwarded-Encrypted: i=1; AJvYcCUCzSU0XJJ3bqRcFQuQRRMEFfCHme1D1xV4yxZOv0fiiyeKNww27D2zUlW8OdZKLcvrcElWkypoJgPl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywul51cTi1HgmEAi4rKU9a2F9pmywNTqTP7fo82a8gyZFEErJHY
	AQtFS65n2vQFey5zBksL358lmrvj5bY+54Rw6SKSZzuHHDoAzavEwTo+L/Ap/xCgNZsRIo0hKIO
	PoLzEYQaZsMPFW09/gH9aq475z5ExmzlpB6sBzYkJQ8I5c4SNZQMSF4ApSsmkNkL7
X-Gm-Gg: ATEYQzwehWwBikt832pXdv1z1+iXZXOFGgYNwPsxIdw79Tn087hgIz8KHqaDiw6niBW
	kpgOxdf5M4AuBfWaQ8BmUxwiB3KhGU03BGE/zqhzr/JAMZ/OszwhHJbwkQVz/Cl3zNiClrCY9uO
	mUZqdTwrUmh8IQSe3Tl36O/vvNvfquUB9YYpxt8Eftm/B1wXbcCASEUI1/nL5KcSDkFbtv9cp5+
	RiFMJK9E9+AwvBvebVZdUMXUZbmUli9xSRKwBQDIabaZOy4G0mGrreR11uxHmCu+ia3+SxBLikX
	GfPIxkDhsRbooEAFA49oD+w/Rfq/P4yjPiSY3He6TB/ZNPX2MT3INT5aVeIcDM4ezwuMg7jrAJl
	EIZdQPYgIXq4osltwxPX4R14iHcFjarFXKm4QCYi/UPERSVIAqPxqrkQ=
X-Received: by 2002:a17:903:1986:b0:2b0:73d2:219e with SMTP id d9443c01a7336-2b269d0d504mr50755155ad.47.1775068534912;
        Wed, 01 Apr 2026 11:35:34 -0700 (PDT)
X-Received: by 2002:a17:903:1986:b0:2b0:73d2:219e with SMTP id d9443c01a7336-2b269d0d504mr50754865ad.47.1775068534487;
        Wed, 01 Apr 2026 11:35:34 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af47sm5717965ad.42.2026.04.01.11.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:35:34 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 00:05:10 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: sm8450: Fix ICE reg size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ice_dt_reg_fix-v1-2-74e4c2129238@oss.qualcomm.com>
References: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
In-Reply-To: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE3NCBTYWx0ZWRfXyIzCc4+8mvf0
 8zs43ULwB23sn5/R29dcS7YQdFsXVR93k1kPwI/u0R205JbiqmR2TelSZS5FiXRPqOvLbI0Gjz1
 ddiHrAso2BKehCnDbqvL490wgboK1UgY1WRTo1zyuuHOknhsz2jc4wa2r1ZlneIb9k9hQL8vCLc
 0hA+751R/jD9dBX3tbVSG9pTLc84Wut0p0wDZocRRA8EJpf7/I23YBLLi5DDrHFNxziInhZkSdh
 Kh+3KwZs/CLBARMebkTgYyo7t3FCbYETuXmD18XHMhMOdLKmBJ2yM73v6JWCp5AnE+J0H7uOY16
 HoTEQH/EjHFDQZVxDorvYGbsKsx63RGbPqY2Qe1OFVKHEhwUybTrR0umNQoC+1qTxc9iga2GmAI
 P7seqglyVFxEyTWcUfFpS3LxS3IVJejWDmConyQNRTOexiBpAroNoL2pD3sFm+QKG3eO1f49zMV
 GEc1QWBj1bYwrkwACoA==
X-Authority-Analysis: v=2.4 cv=QJJlhwLL c=1 sm=1 tr=0 ts=69cd6577 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zOmKeGjK1Y_3dRScO7YA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: xps43bbfZzz2u4RUg6gZM9pYDw60_Fbf
X-Proofpoint-ORIG-GUID: xps43bbfZzz2u4RUg6gZM9pYDw60_Fbf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010174

The ICE register region size was originally described incorrectly when
the ICE hardware was first introduced. The same value was later carried
over unchanged when the ICE node was split out from the UFS node into
its own DT entry.

Correct the register size to match the hardware specification.

Fixes: 276ee34a40c1 ("arm64: dts: qcom: sm8450: add Inline Crypto Engine registers and clock")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 920a2d1c04d0..3984d6f8932d 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5373,7 +5373,7 @@ ufs_mem_phy: phy@1d87000 {
 		ice: crypto@1d88000 {
 			compatible = "qcom,sm8450-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
-			reg = <0 0x01d88000 0 0x8000>;
+			reg = <0 0x01d88000 0 0x18000>;
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 

-- 
2.34.1

