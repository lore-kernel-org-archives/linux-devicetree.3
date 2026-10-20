Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485923;
	b=UeVIvPMJnNv2cttt1wHfltQHHf7blWT5WTiEaP1axmlAj+3hv0IAXOVPr/JYqMPs7rXM
	 9N3Q5uaTDXhjvgWpYh91p4LFVLBn9e1Br1F2POpS27GfPPwddoB9PN/RpwspAszDGOm/h
	 VM7J4W5o8uspv2cezNw8T+iBNrtkApht57lvOzWQey5A7NEVYgQsjeaL6FA1KZTNzj1Q9
	 xZxhfDzClSTDyWYBEXaRei6N64sbUBQtvTGX46bJ3eLFeher/fUgedbiCVj2cukBTuaoh
	 4YGQD/4xCaWdTl9dca58lyHyoFyWcDZFiappLykPXDY7L0oWmJsbNFY/jjNfWUO3I2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=erg5YrXF+Y7d6I2pDimstr4WSiE8qZGfD64QK2fOvs4=;
	b=qgwUc5d05oPC/vYRknYrl4a2JSF+PpUPzcQEIM+WBfVhquIHABpMjoBvudwMVt0wDoMq
	 F4lZWahzEo1aRaZo/bCsQq3M6S1kqW8tTx84mMxCPjc9Z5crmFqhEM3P/O0T5cD3szvBZ
	 iGwK7CwV4d8HZyQe3Idhs1yyLOxI5qik9KrffQRGZDfbB50ndGqTqB8y5gXlTeFubPFZE
	 Vgpw8Yi2xS+PnJtT23xTu169o7/ZEgRCQKzCsQQrdbKW8pPGfDjpzOj6JHchcrR3ohAon
	 SqWjd1uvow4/SFqVqEA9/V1N547b4u36gPcrDgiVf9b8Mdn7mxuoObVKTdPxguXc/QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JbGs0e1+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZaVU3lT4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE7C606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE7C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JbGs0e1+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZaVU3lT4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8MmwJ3806851
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	erg5YrXF+Y7d6I2pDimstr4WSiE8qZGfD64QK2fOvs4=; b=JbGs0e1+Xo++jHb/
	7hb49mniSKDVwJC+DX4K9Ly+vq3XfoJoAZPTQIw9xI1TFUpixZSnaZdt4kFXLp/9
	qGxCf7iE9bOH5dP5YRhHYO5+72XH5ks3De8WGrPkx9VJ1/hV5qarz/XMskZlKzKd
	uyrZ1kmqM2QGiGdlgbk34RLwgPlS1PyvHZ9VDwl+VoeGP45GXyf9gZl3VymhunRF
	kQk4xww7876pbwlJbRnTaRCiJZWUmCf8PTHk83UzjgGI42vv9scG26hl4zwonvIK
	u9rTi5B0LSbd1qReQYPLlFi5NChY0Hxk2eLmgybu2S6ucetV8wocrimC34ky139s
	TXyK3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9pv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:45:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so673508385a.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485922; x=1793090722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erg5YrXF+Y7d6I2pDimstr4WSiE8qZGfD64QK2fOvs4=;
        b=ZaVU3lT4++VD9PrNCqI8PSH6MFnLYkqg8TZJPVuztrM0bDbI5n8r5KgsZlJcYjZN1l
         cwmsuXrqyt0xx/21JN95ldxsZafmeZuMFXGhiiXoda6fIj3DV+56lKXa3+8y23OBFoSS
         wrU3eR53FPNHcfvQrTlYcW26NIKAPnBpQzFfQfCT/07Jpl5RvNjGBFwtl/hy/zeZlfss
         GNhDuHiCDo9DjbwQpICPuIctRZWAiIoLmDPl7O1B92RuArxbIznV88zPd8w7SPQn7cTG
         4TITO9ehkKc3zhE7bsSdBALHDPv8hC7BNIKF5ZMsSEasnm3EaS5Sc0pf16FTWExQOzHb
         QGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485922; x=1793090722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erg5YrXF+Y7d6I2pDimstr4WSiE8qZGfD64QK2fOvs4=;
        b=oIIxTo/MsaGOYSVEJuiMigSx/+ypAMpUJ18gSTmOIrVvqxixqUr4d2zEZSgbumEwhL
         apDoKkNeDXKu1HWaAImp87jyYZ8W0YP1mcfZfPqCeY/3pBOx9Rx2QYgEIvOjD7exgp8k
         D6DmFkzhRxMbTmxW8YsnoW2HrHbnBjnXCRLaGmAHWkc52XfO2eBOLDLtXGe6CdUUNy4e
         L0ofIk5bZoWyyEHd31HSdwbLHdysdpoufPpHq0hSCbVG+r7s2sHlNTwtBZm8k8+vcW5N
         +lQAoDjgOg6EJCqQpWW1Yk0IkuQDK9GCy30j14uXc99xhzlUe7lIy7XghM2hkSMdd7I+
         H8Gw==
X-Forwarded-Encrypted: i=1; AKwUvBwDpsoAD0zr+TsLrdNSjS1KcgNtOboBw2JgGKAmXpLNTKI180ElAB5uxkaHA6SYnW4AfAHIcTrIPqHv@vger.kernel.org
X-Gm-Message-State: AFq9FYLOON6B8WDpyB1ceTgPylCyrSkQjiwsHlVl81pl6wZs48Nqp4tA
	N/CIu2VHQ4aB+gG3MXFC8vaoxomOej7bVYBoj52ehW/bU9HD/rNEEO+/PbkKblw8keKbdrWYffh
	tkyEMNySAdlrGBlhPBqrpVpmYbxAa6QoC9O/lJmheWTN8jVEAsDHd57JxG7wpJe/e
X-Gm-Gg: AYBFou1lNieDrVGXJ1IVSh9EmSNuLjN658otALRdB6hGY443hn+Lx6wepMVbdiSMu7N
	cYGS/BaUPBrwACeuJP7JwZKGcC5Cl2wRya42I2aGWqJGtk9GrWsqCbwraKFp+WWt+J3mL/jbRpr
	JP+LgawHVzldXaoF1P7huOlaXOD8BUekefUcHw/0hueWewcmhH8P46EnXr80kcLdevmm38dqngE
	ojB+2sKDrN+2vL7hKmHdF1QVC7EBgmdJk3q6vPZ1jKF8pj2M6LU7pgBDA2mvCcblMSOvbGpcrHm
	Bx4VHdJz873koS096dlG0hH9qjEx68V31qy/lm5HsnYx1x4ivYE9f1zGLedpDMuoTd6sV+H/edb
	aztBjADTV1QGU1o3XnefXz+3lNfpiA6ZPXNJfXutY+oLy2v6DdjwHtU83CID3/7KK/ukt1+o2wD
	XHd4uw7GqnQHrM
X-Received: by 2002:a05:620a:bc5:b0:93f:1d71:41d5 with SMTP id af79cd13be357-93f29d7bca8mr1593091485a.52.1792485921683;
        Tue, 20 Oct 2026 01:45:21 -0700 (PDT)
X-Received: by 2002:a05:620a:bc5:b0:93f:1d71:41d5 with SMTP id af79cd13be357-93f29d7bca8mr1593089985a.52.1792485921258;
        Tue, 20 Oct 2026 01:45:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab20a8b3a4sm27637231fa.1.2026.10.20.01.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:45:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 11:44:53 +0300
Subject: [PATCH v3 2/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix
 ADV7535 interrupt pin
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-ifc6560-adv-v3-2-5da1a33fdcbd@oss.qualcomm.com>
References: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
In-Reply-To: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DIToGo2BfOvIpfUMC2cI3zd4SN8EqTcftxa4XLSNAxQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1yoWiGWmmOvLBooDg8c00aeCf67/Hv/JRiQY3
 zd9Gp59VhWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatcqFgAKCRCLPIo+Aiko
 1d+YB/92Fo89RpOKx9MqfGh6TuLXak9JhzxvFngwo3RP6LH80AMAszb4e6BQCjpuYBguA/5BG1K
 9L7q9pBUTbcmsGlIFvKSdDlagmHLylXrUqDRzsuD+9NMPWZ9hmsVj4Y+BHySWNEaM5Y7cvf1o0/
 Ib4SVlS5wIm1ehooO+4AUxBH7KJ1ilEPGUiERqd6Q5Uv26qEWbtyjCoyRuPqvTFF30UKMsiKhZn
 kwSsopg2vDq/7qpcr2xUkZQ7GlX6dIyaKDa2hBlInVsUgeemORFtknpUi+CqcKgRt75NnAbOIrl
 /NLg0APh/CT1l7NTqA0OT1BBTI/TxOgsCzuYexkb2WPOhNix
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: TXzjXCaZi0TxmWDstV6LqlIcdNjb1ElE
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad72a22 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=KOZXxBBog8g6AmAVVB8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX8irxO+3hZb7d
 V8u+dLYfPiSqEM12ywN/Zv4g3TTSqMlMKuZKk2vYJbLB07QWAEehyGWBeL9qVhVWc8JooEU0XMY
 rtzrBlcdcMRYxo/1yTsMpp+PgeQILPfOfdPje9nfw8zFnu9lFk6n2wHoX65MMr5yi2IkPBnodvp
 nVaxitRUI3TZ5nbI3KPVY2zJl3isG7yh/xVkYnOtduh0NcJqiZ+5JJf2yiIVKehUyIEGKZz2ADe
 2enepl/QCIAYMNpiHfsJtOQQuBfxxoK//j7DeiKFTyqtsGM3jeTEHE4McvG4dUbGXvgNKKYmECI
 Lq5SbFuEizdtfB38izfT+Xe0lkKz2qtEaDDk3dJfwSujWBZ9St/wwtUVf9bK+zdji3wgX19Wtm6
 jTNLdqt9c2CHEd5N5E1YIm8bCnqYfAu35QbZbZLaQ1/qIvT8IIlaWWu9PhtmWHBG/AzDzHdDVB6
 kzXe5l7psHURkdZ2T0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX8lCwaSlHbIrK
 DaJFSRIpYxqDpAQRhgeTRJDRAWb26mln07pZcfgGAsKo04SSZhJ/4sk6Mpmh+smvrWnHX3Giquu
 FIO426cWurGasMLAJfreq4gx3f/54wA=
X-Proofpoint-ORIG-GUID: TXzjXCaZi0TxmWDstV6LqlIcdNjb1ElE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200034

The board never configures the PM660 GPIO11 pad carrying the ADV7535
interrupt and relies on the state left by the bootloader: an input with
the internal 10 uA pull-down enabled, working against the pull-up which
the board has on that open-drain line.

Add a default pinctrl state switching the pad to a digital input with the
output buffer and the internal bias disabled, applied by
pinctrl_bind_pins() before the driver requests the interrupt.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index eef4cab8c200..b3e4a7c378b4 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -170,6 +170,9 @@ adv7533: hdmi@39 {
 		interrupt-parent = <&pm660_gpios>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 
+		pinctrl-0 = <&adv7533_int_default>;
+		pinctrl-names = "default";
+
 		clocks = <&rpmcc RPM_SMD_BB_CLK2>;
 		clock-names = "cec";
 		/*
@@ -283,6 +286,15 @@ sw_ctrl_default: sw-ctrl-default-state {
 		input-enable;
 		bias-pull-down;
 	};
+
+	adv7533_int_default: adv7533-int-default-state {
+		pins = "gpio11";
+		function = "normal";
+		input-enable;
+		output-disable;
+		/* pull-up on board */
+		bias-disable;
+	};
 };
 
 &qusb2phy0 {

-- 
2.47.3

