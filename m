Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5AE4ED183
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054750; cv=none; b=E9b0aM7xDv4w05zUS0nyyIrzZ79JknNvC3OrOjY6ezonpPcpzCmwMWnR6A8aa8YR5PXIDihYpdRqzIGcHwc37M7s6+vD5Mx5FMPd0hFvLLbe1fttE83q5oAQz/QFTRiyj2hSQ/x7ETc+2RmsJzFMohgJ45eUulWv2fg01CMkZxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054750; c=relaxed/simple;
	bh=lcd/P+nruFRhQ358i4WAml/LB0EcL8s1zTEbmnwyMQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eVfAlwNPP35QfGVuCbJNQh7WJ26sp++c6y1yl7rmSAGEgI0dtWOIXZ8AqZHBiLz4vdyJKWcPO5w9zOZvyNO3CUvzpLnCNGl9Tcq/GzGTBsxLSNanDahKH0kkPH7V/PjYFEC83Ca9G0UrLJEQkyDe9Wvqe7AmSJykA2FjJ+4KORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRE9cK4W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y64R4hl/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRE9cK4W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y64R4hl/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F8JIKB3469372
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKB3HAwwUoMAANvcjYoiAe4y9aLaTkX2vWSxD+aknP0=; b=IRE9cK4Wt02FYXYN
	TcfC9ibQz4nJfFl5hJbiHxaQR58kdsHtAOmW24zga/73b1y0Qlp42u1KK/AFCrqL
	y4Cblkxh3xj8Wth3I3mZHtrMqwqRQCptPJCtO2YfGtQsgYMWCYFH2nt+vEACAKUH
	8+ua3b10WvCgafGwnJYUvwcQhYuJXMODtMhk7wKOnfGQeoSJBf4tv53LaFHIdpdw
	LIJmLsoMuPwzWV5NrZTaKKM7F/xUsflJua3vYhlCGfAmztU303X3KgDrselI2Hmb
	Ys3cDSmN/oB2AWTloUeNMUR4+HmdQrf2fUWmI1nZGgHtvkBZAJ0zMV3orBIalvIM
	0pFMAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7bctw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:59:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bf4c0af4eso329096985a.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054744; x=1792659544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKB3HAwwUoMAANvcjYoiAe4y9aLaTkX2vWSxD+aknP0=;
        b=Y64R4hl/hH2Ew5EurFAUOF1LgxerXU8L1Ckf3xNQVzGaIF5JpGzVTEzVokfRAM8uGO
         527q/PWTL2LgapEScxtFbtoW3Tju1ve0pyTP7sNVK20hTo+Mz/M+H/jcAU0MRyeMdLeb
         AH+opthzbYd9zIccN4CXPRWkZkpKOeuK7TNOv2wgmpm0C4gPa2pQbPPV/DouU+FfyFWC
         aizOh5c//9NGHSR4TtB4eVxNbHT+QgnHhZVrJeRpw8U0DQ+UHvz+53snm8hAWsSwcbFz
         VKaTK3wLspgR8nFl9uTlrtKqxXIFZXUx0z1wNef7hRX15o0HIB8Y9MAquh9AjToRn1z7
         8V4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054744; x=1792659544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKB3HAwwUoMAANvcjYoiAe4y9aLaTkX2vWSxD+aknP0=;
        b=l/cMfeAlxQz+v85Z9+p2A6h321KY/Ycwn7mmkVyLjIxzhOpwGDGqGDp5HIDAh2i6t0
         zRfd24NZhqeDM1i2txoc7Ir3piznaJQbIv5XIvg1WkBODC7ntyh/oEF9ougX+GkXKJdb
         mWAkOVSuWnM+tjsytsSVH88DQxsYEhhGBbtFiLwH0tCS0TWmuNL6Qdx8vPN/ldrGYKrk
         Vp9toYUugqSz5hNNL3+cEuANgVVcfJb585MX46ikn4lHgb8ZVEZ5nI53Ij4IuXHrfRvT
         NkoRLz3bN9kxCYWgJp8Yrbvb69ToSaEgQMoUSEufesrOKGFXufgYTg1+PQtS99wXcAfO
         NhPA==
X-Forwarded-Encrypted: i=1; AKwUvByDrN6bLA4ey+U9FtUXsYgrL2ZvcNLGhElFQ78PhzB9Cl/F2VO4Q2kjYzIi7VVlcgIljMC5Rg2hRF+R@vger.kernel.org
X-Gm-Message-State: AFq9FYKiMaPw7jbs/Y7wC2hVtrEAlkp3/u6I2u+wKZ66J+NWgEPTjv88
	SVOgXW2GTzm9o2SlNnFeCZCs+swsDV3NdWZaW18tcc3RMo0EpNASdncOnDbI+U+9XFKmyNW5kY6
	/hEc/aTFqpiIJOL0MRAACZLlvGMpzLQLOBuIyhkBXUuEE9dZqHSjiLn9K1pKLcX+9
X-Gm-Gg: AYBFou2zWd72mrVJnfe1TvsyfbCHKo6j8v6dgLNrJzgPazstpdbIt4utD1IJ96aDKcK
	ESZl1q7Cbqkfu99bzUqGOhpmchdUKCBgf1K67xSG6NNy5gOxLiamekT7UVOjVXzq1WuhQF64Mvi
	p0fnKCCOEwey1Hl4mYDehCoq6wCiyirGv+MX8Yk/Y0jOKruXydqJIy3APGopsCyu8CPDEDwaAWB
	7GpoOTYi3gZlyz2I3TA6R3Mfku7O7x+/Fh8Vtj8h+K0b8fVyj+JcDr5t9f+MYmFWPxgssz5u4ay
	UUbxqGAQr9Y+JTb7XMLCINKutDN/nzoxHd3pRtFY6j+t8usbijr3MD6ExfWfcvESJoQ+sAupdxe
	jWKFxr57kNORIEJx/wRbCpoHOfPbIQMDkkvZr0nU/c5s/9OtKpOsWGFd8y+TMDqPwgF+TiQPvW+
	CJcb0W00ZJtajj
X-Received: by 2002:a05:620a:2985:b0:93e:c12d:4ec4 with SMTP id af79cd13be357-93ec12d54camr2604349085a.36.1792054744311;
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:93e:c12d:4ec4 with SMTP id af79cd13be357-93ec12d54camr2604345385a.36.1792054743810;
        Thu, 15 Oct 2026 01:59:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:44 +0300
Subject: [PATCH 7/9] arm64: dts: qcom: sm8150: add MDSS reset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-7-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lcd/P+nruFRhQ358i4WAml/LB0EcL8s1zTEbmnwyMQo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9aFqcd8m07PmdPRa/RC1X/HOQu9S8ms0iXHNl9mkp0aV
 TuvbeX/TkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMROIE+z+lc+Yq0xUkOnq8
 V6yKXsqvqn6thMfq9NXmSs2CeleXbyv6vzbvUK37H8WaN6NVreJc1ksFT5PFM6b6/jwxVcbtP6O
 X05L43UFO0ReKTrk1f3q3eeuk8nCBzv3G1jqem7O03ZaGtWc83a4gryN1RvQWf5rK3nR/vr4YuQ
 6dI2WPP3tf2CFepi1RL+Ozk63Eme+Z6Kd8af9l2WLhdspLWEpKoybJrytyzT00Q3muo37pNmmhk
 Klvdldw6xgv0l5w+Eux+ox0xYsKPsuXz3B7oakQ2fqTPdr1u4Mxx5kVfRu3WLV1ss6rTl317lfo
 16fG9QncgiYBqfdjsgOS45Q1VMrWsBya1xprvvXf1hYA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad095d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Bz10KyuN3JYNdhx7gBUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: TjZ4w-bKb1w3plLuTd5cT8NyvaLBPjDe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX2uvWVYCSOR9d
 dyVt9y/zkfuaowgAJLPCEUgUYAvsQMnupfbs4Auxfs1wg6L+HywCBce/bD3ZZ0U38WUXGypyqAK
 d2u8wNJ/RlgMqvsT+ebjCKOJw2+9lOyKdoYejssT8VzSnXVg6w7+/nbYdc2VBV7oYSdQR2MU2mc
 Tn54SnevtP2pLf5RPptAh0+S1jUHO/VtKRLunqvxeDRhzxOSpEfDgXeokht3xcC/dS/m6TL3cjy
 W6YX8UvJI30RulZ85ojttn5hJOtjLWqT1TJYiPR/haajkaFStIkelZ9lHqdibDwA3WFzzt5ckrQ
 I6Ts6WIgWy3r6/pkXCZPVKbryUm7TOOV7pEKSehtTIL83JIqeTOQBLY7DUs1rVGhaYYRvPyPEZ6
 SRfx3Cvjx4cA/+WjyJgsnyb2Ks4SPEskUUs1+xMobYw1X2irYue4Qdsz74CamCm2crjbRo6Sd9I
 gRtJLS7Qt4SMTH5YW+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX9bJ9DmbU7u4B
 DjqPTk2djJeWUzYHIBHRI6rDSsJDK3nPJ3h6yXWGjQlKgxE9S5U3YQ/ysQzx6fRat98SvukPaeh
 QLjZbw/iM28iSCeyKfJFu/LohbbImZw=
X-Proofpoint-ORIG-GUID: TjZ4w-bKb1w3plLuTd5cT8NyvaLBPjDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150035

The bootloader can leave the display running, as it does on the SM8150
HDK with the display card attached. Describe the MDSS reset so that the
driver can bring the hardware into a known state before using it.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 293fcbacff34..a2d6e6947c4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3817,6 +3817,7 @@ mdss: display-subsystem@ae00000 {
 
 			iommus = <&apps_smmu 0x800 0x420>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 			status = "disabled";
 
 			#address-cells = <2>;

-- 
2.47.3

