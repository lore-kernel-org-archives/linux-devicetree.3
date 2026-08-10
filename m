Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7034D437128
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 18:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386654; cv=none; b=gOClw9Nx8jCSxk0kXf1ApTPgbCYByVt/fxjrpxAUYtaHKMJ+lwCjBk1/Z1oiOe5taDFj3Ji2HzwSQ/f/HGeMXZHLOp/dlAdX7KU/PDkiXYqhaw8sT49MUTFMgiNgGVqcHUMa6zR5cIDm1cw7I0e48NYzGHRZRBs9XIAPpzMfmDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386654; c=relaxed/simple;
	bh=LL8LPc2ObMc8bS8GZmSlJQ5MV4/P3HeJezRLr9CAz78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fu38IVHAOj1OuY8wz1XlVRKGgL4LG+8S0qRNQAe5iTApH8rtQjpiW8SihSo77nmZ9ODazR4pci500xJYH3Igq/2CLhSeyVyckwSKtOoZraMEc9Go4Wvazhm3WjJQom0Hiq6eKs3yUGhx48cOy7ZRf+C1Ic6k7zsHuLlQOXBU4Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0jXxhdb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TY0ZW4lB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0jXxhdb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TY0ZW4lB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AGssdQ1936316
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 18:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=x9vEpcP9MBZXX1DkqscHr3
	laUSulESbFw0jUXKtXHN0=; b=X0jXxhdb/ND2LqZjtyO2bCnNSJZvfElgczmCrh
	iTRSAYLbrLtXx8HyHSewokymlkI1Rvoz8cunz0pfOWv+3AZFstPYJQc9AtWtFn8u
	ysjKrlJr24L83gNm2aVTDVqpKKY9xubcJ6wJLH41PMUnJwbzAFLZo4Ja/2NUdzBG
	e3Ydn0HQSNaskW0LFoY1PMYJkXUdg3cX+GjLOoZM/Rf5TKtCgsvYWsYTbXA+w4W6
	Y3QjDu08HUjhwqhEXfwGM+xG/1mVcYj6Gx7ic8p1pD5KNyVQIMnuZWf1Qtqf0Gcw
	po6m+vclwkeuyjlsqQwiHjJ9J/f+0j9BLmwBdot4vBzwxUhw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk60d6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 18:30:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38fcaa5f82cso2283874a91.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786386651; x=1786991451; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x9vEpcP9MBZXX1DkqscHr3laUSulESbFw0jUXKtXHN0=;
        b=TY0ZW4lBPd9f72UY9Nq4XM4X3XCacEX0HhgENeCfQZ1lpviED+y2A8RGOt4LbBrTSa
         q6+0JEFtACNKwwH641BvRDTtbMXCpW5I4bzR3WoE8xuTZ1IqSlIbUVgU6AGXShZ8ehtd
         D/l8juVYfO0lWoqJLzbih1d4wv8IjRfmpjz0As61Bp+xoXW+d/25VaCFmKHegB65yIB3
         FVthe116F7s9WrCYL3hUMh5jTax4DivFg5ZZ/iJWzUTASlllybWxTWr3rQ5octM6DghF
         WVv4PusFPibmnXwHrTrRYzyElXyI0ighHs6tCMde8NSnsmquEvd9Qaz5aLUoNP9CSyvS
         ptAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786386651; x=1786991451;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x9vEpcP9MBZXX1DkqscHr3laUSulESbFw0jUXKtXHN0=;
        b=iWM1TK27xMMRrzEUQpcIeo1TOlq/y0JwjVEKuJE56ON7KR6I1g4kuD5jQG1COJkK0r
         QfWRJWC3Ymzcs5z4JGqpjZxQzHQ9zhbwKsUkPLxIINIBRpETD6ddAjR1J7O+3K630gy2
         7iLbDLf2JEYxKddm5OSbq7GQACIGqDldddyvo2PXiVqdj6TlbFmgf/eB/W/4Op10nAg7
         LV61XK+1Ra/o/Gvm9QNqnFeOlBXQzplPhvb3tliojouGmhBJ/kVOGHeC5tV4NuZQMnc8
         /Fex4aZznFu90ye/njSCY8ZI1EX0n/p/n9YnSHRei/YjCPBBTMc0v/d/wzdRZFhnyT79
         F5vQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq116hNSjtWy50nkyWzKoY8G30bshaaS8G1OCklZMC2OVV3HACa040q/6uLvhXB+o153Sqop3pIaYy5@vger.kernel.org
X-Gm-Message-State: AOJu0YymNXNf5KJ1aHcyY3urquL9x9+t0HwIYiBodcxK/W/YKsmVHJQY
	dnQ4s/MVxAQHsDlh1HhmCVSbuwBcSzwuLW1dSDRiMpDzAJf3GHQyV5T95FFc2n5jtmmaN3jvZ/0
	Cg0rfFRRxbia2UBQ8NOxC2Qf3r5fYZ8OksrWBUdCFuJ+TG6hCv0YPKQLxsydPFx3a
X-Gm-Gg: AR+sD11sP4MBMGJVNbeT9Xs7W/fkeBBxfn/5PLGFqo3huo+G1xcHFC8JRj2arnG9EMR
	mGwB2dCbivLhcnQ06O3k7Z/xg4mTzTnid56S60IMTnM7QmOqMP/ZCaaXmF9YU2DaPyfIvk9DlP2
	chX9ol5vzvZXYW5eZCMOrpJkL2Sq+MdL0hNfxozw59AAH1NcAg27MQn71ndYllQVkEadZYb8RHC
	phQ4YMhhnc5dECq8fJ/jgLMXEAriDK21O5GtA6hdpzMyL5j/AnxxzyWjhFFhf4K9TMm8zbvTokn
	vzI9emODMSmcHJ8nETVUZAGv/94OVxCO81vmfXWDg0PPdUSYsA+1RXGjYucd9T+5+1K+OEB+KIm
	oWaXNv6dUXjFNnPL/ejGpa0OZKUbtVPeBYQHd
X-Received: by 2002:a17:90b:1c87:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-392cca14ae2mr3125040a91.13.1786386651387;
        Mon, 10 Aug 2026 11:30:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1c87:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-392cca14ae2mr3124963a91.13.1786386650815;
        Mon, 10 Aug 2026 11:30:50 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d534abfasm526427a91.11.2026.08.10.11.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:30:50 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 00:00:44 +0530
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Increase MCP2518FD SPI
 frequency to 17MHz
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-kodiak-spi-can-17mhz-freq-v1-1-1d99e360a7da@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANMYemoC/yXMQQ6CMBBA0auQWTtJBxItXsW4KGUqA7FgBwiRc
 HerLt/i/x2Uk7DCtdgh8SoqY8ygUwG+c/HBKG02lKY8G0sGh7EVN6BOgt5FpMuze2NI/EJvK2K
 ydeWChdxPiYNsv/ft/rcuTc9+/g7hOD7NHb/hfQAAAA==
X-Change-ID: 20260810-kodiak-spi-can-17mhz-freq-c831e1893af8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786386647; l=1536;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=LL8LPc2ObMc8bS8GZmSlJQ5MV4/P3HeJezRLr9CAz78=;
 b=qnlIGP3jkkLKYwseC7o8Dl0SGgmXfy/9v/sbEaRRMcNBNsZJBrLTdnpJvV0K6LlJfG4jWCqXa
 mjeH6DoorDlC0T+gvO2dmaYTO1zS0AfTVCm28Rg7Y8va2aLO1JrxG7o
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=Nb3WEWD4 c=1 sm=1 tr=0 ts=6a7a18dc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=80-5jTl7eJ6bZoIGBT0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: hmIXosU42efM02BIq-FWlrowTWhJBcZ8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE1OCBTYWx0ZWRfXx+Kqo3iy7m5R
 MoqKLR8QUy32PBO5v+cWj9qe4uyMNAHD06qncHrfyvcAXaMSj6Eib20HTgr4S93a4PxIEfE2ZfE
 SfsuWBcjeVqc4VUqoM4jIed/oYb4lSM=
X-Proofpoint-GUID: hmIXosU42efM02BIq-FWlrowTWhJBcZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE1OCBTYWx0ZWRfX3KLHgvEIIdwV
 03dIDFZocNC3lJIBuerWFfDJqDka90w09vYVNe0Dcve2sJvy3DVWn7qqsnXznf/MGmQeS+hSNNz
 DiakGOyhDzj5ZWK9ccLw+0npv9n4y+zBxL5lzYK5G2z6j9VN1h1s83QSagkvTj9VhqmTnfNT3wc
 vV+cNwxQWXsK0827asR9rq7xxYgtQAZBo22HvO+9xTgk9g4ZDPVuBDtovAYd0xw/FRS+J19/3kO
 hrYiWQ+p3CbzwaZNeZtvKRsLCxCIBA5T5G+F11ZXIQxnFr6vfuF28wRjj8C7RjX0Uov5Q/qkkj1
 X+EraXAOhIYNupBBq02kDCRLD5wK/ketZNziEXuw7Y4R9ZF8glrgR2lsguhXDd86vwrlFp+ie8z
 ZBeiG1/VZX1k/i4l32HoC97d0q9MIaQryghoqP7xq4BkgGC3+0fOnPZveWZhPo899SIkTqYSvsr
 LhbWm3TPgMlW/8/PNsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100158

The MCP2518FD CAN controller is limited to 14MHz because higher SPI
frequencies are unreliable with the current SPI3 pin drive strength.

Set the SPI3 data, clock and chip-select lines to 8mA drive strength and
raise spi-max-frequency to 17MHz, the maximum allowed by the MCP2518FD
errata:

  0.85 * Fosc / 2 = 0.85 * 40MHz / 2 = 17MHz

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 90f2eebc349f..eb8d83317f36 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1105,6 +1105,16 @@ &pon_resin {
 	status = "okay";
 };
 
+&qup_spi3_cs {
+	drive-strength = <8>;
+	bias-disable;
+};
+
+&qup_spi3_data_clk {
+	drive-strength = <8>;
+	bias-disable;
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power
@@ -1233,7 +1243,7 @@ can@0 {
 		reg = <0>;
 		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&mcp2518fd_osc>;
-		spi-max-frequency = <14000000>;
+		spi-max-frequency = <17000000>;
 		vdd-supply = <&vreg_l11c_2p8>;
 		microchip,xstbyen;
 	};

---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260810-kodiak-spi-can-17mhz-freq-c831e1893af8

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

