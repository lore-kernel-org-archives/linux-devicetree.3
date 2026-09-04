Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACDF51357E
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 17:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542189; cv=none; b=K+WlRrqyC/R4So8otuh/veGfDXUbzql35u/e1LuJ3TVOujURdL+1YPg7Tl7A9M1o+AJjCIl3qnc5GwQWpWsvgdrDRew2ZgOnsFv31RwxXs7SnopgzpGAvbkpOD6LCoHPfVcwaDmz2ayp+bdD6/B1IDSgMO+QXh9Zozizn0DLll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542189; c=relaxed/simple;
	bh=q0/jeQMpe+NIKNmF/OaRaRWoYmKqUjJ3nNw+VwjxmOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVlM8c7RwLoHNiiVXaXBiAPoQDM0graIfw+6jSt38C/8+b95VKg+9eT8CqwvJSOFnMbr8qnPliILFuLcAbJLfi5kt8WuYlUrr/nhUFNO1/zK8PoSat/XRDpibE4k03WsvgaWWhOJ6zlzLR7TsvixwO/F7NwPLFUqX8NWSdYrOeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEuNTDdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISSFoiRe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEuNTDdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISSFoiRe"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiIc2468091
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 17:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PLl6mm78EKtYKYVqBRt8BNl1RzwF+qAU+YTT22oAhXQ=; b=HEuNTDdElJfdSdwc
	esba1r4CmHqYxvzcEZyNWzvEaSNa3hlUPGoUS0o4VO0EIzJ5SbLesNbsqKZlqorY
	0ZYlUu/jYewdgyLseM1ViV4pB8uWzisUQxMrFKRyuaIcOVE84im/0UoZGrSVzRCW
	oSYf82lzB4FwHCeMNc6TQM5bHlJosqCAvrQuukGEy5IKj6LKBh8vZf8oo5XHKbtX
	F1AWC+Nv1SkUR1+GU4bXSm19MYU8V1aMmn9LEKIaTx1rtl7GF/day6omJdmrW5Ko
	bBU7Rn+vIv1nj23CEBT3laoX5TRUNrwZ0uXZntR+k690FIsvXFxO7e+NginO+4rR
	bFJ82w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg0108su7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 17:16:23 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso157901241.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788542182; x=1789146982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLl6mm78EKtYKYVqBRt8BNl1RzwF+qAU+YTT22oAhXQ=;
        b=ISSFoiReOpTbbWPPEZB/MXCplD1EJeHnGT1elUJtC8oKKrqC1uXtteMkC28ywXwD2f
         OJvb/OROIVI9APGOESVnwAmf/gxO1vRz88nndrfIN+UGsAsBpei2YA3ApbdhpoMU3XZZ
         KmKHRW1LwA4DJm6InmnY+OORLZqE2KUw9LMv6TKH3IYjmGmluwmkAUFgRry39t7NFVs4
         9NIIruys/X9EGd2rHi5v6a7oj9Bop+9Hw+dV1FbtpuH3Wp73UghQHwa6yI8ZR2ercdKw
         txwqn4Mho53OD9czevoTL8HnvnipTJPisO7h+gvMV3rgdJ5bFniwNkdLVVJKvxnbR8uJ
         L1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542182; x=1789146982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLl6mm78EKtYKYVqBRt8BNl1RzwF+qAU+YTT22oAhXQ=;
        b=pazPWN5LnOrRs+EWLlLzX4f+0K7IoFPI9dmNIOKfZYWxf7Eb36YJeB2iwr5O89qVrm
         FjCBJtdKGVHTe+e2C738TUa9W/w6cVXAISCKGVl8wnW/IGF3LZNNCF9KDWH1JNFkqO5w
         9+373bbTqRZzkP9fszKhPdmrKOwrDpjM90hjNyvDwgeR+y/ADrmF//K04PWQJLgOusTv
         6icWAMBrIvyxxE6dUgt8TFtwKR7BrCdO5MptYjTv7fDaPV47c8PVHt/OY4nXX1MU6uMa
         0VetAN5VD0J9oZVVon7lMNbF9+c7c+9CUmaIhr2QRnkhDUwlb77hSkBPRtK/C40NPj09
         UZTw==
X-Forwarded-Encrypted: i=1; AKwUvByIV45xs8Gwi1fN9s2QK6cR0x2XOF5NF0ZvrR4AXtp6XnP/01KCXsaCImIOEqnG190d/9B/djp4QYoD@vger.kernel.org
X-Gm-Message-State: AFuF++kxZnIiMeOHA75YxoFHBETDJ6Rde/aNaJ0aAa9fwOdogbLGqfL4
	EuX9WOWmj/Ec0GO0iVxO4djidH2h53NBq+DUt+NpFTdRVg5crsNXj9dyxz5a7FpUDBqjNIbPTET
	gbtv426tjsILaO6/aQjhg3jaWRHbjyKZmq4Na0h4vIT1AVdBbnp6cF2yr7QK2doEc
X-Gm-Gg: AYBFou05Wt/DaqO65fqIbIOVrAy4Ruqb/b8a3EMMzDXNKasYo2+KHFUGzkXxv4vqVJS
	OBSF1fxv834DJPW9aQ9XaW9R8sxUYlbVJjgiLJEMNURstJe8dD07rEIPsUBH0sB7VJZ5HcosVok
	8rKdN3Ki9x9ERYYrsNuFeY8cpwmrkO4/xFGiKVU+MV9BH/syxMWnuzAGXvpaS3Xs24EpPfs9QLH
	cZfOZ3/RMLhG9nL/lBqQHOPCgoeZHa+Bhr8c6P4mEcgkxJI2pA/ae+pnJ6Ae1CgfkvHfamXYsDW
	yX4gduL4LMe3N1yXmExAEeuOW7d9V4FQA+wNSrt5ZEOSAuutG0Y1Da8Na+xwZTFcMYvxv8nwamy
	kw0WVQ4WyTUVtwg==
X-Received: by 2002:a05:6102:8093:b0:779:5049:87b2 with SMTP id ada2fe7eead31-78a4a42c1a5mr2490111137.0.1788542182338;
        Fri, 04 Sep 2026 10:16:22 -0700 (PDT)
X-Received: by 2002:a05:6102:8093:b0:779:5049:87b2 with SMTP id ada2fe7eead31-78a4a42c1a5mr2490076137.0.1788542181905;
        Fri, 04 Sep 2026 10:16:21 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm184598455e9.13.2026.09.04.10.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:16:19 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 19:15:22 +0200
Subject: [PATCH v3 5/5] arm64: dts: qcom: qcs6490-rb3gen2: Enable TC9563
 embedded GPIO controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260904-pci-tc9563-aux-v3-5-5b1449d62ba2@oss.qualcomm.com>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: tDVQdFqRmsrloeZHUHkTR1geLKpkzafZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfXxdtC4CMKrvBd
 WyjKWHRnHy7z+23njKzY6EsOUzu1mdnth7Hr1jfmbfSvmwxeeZMlsa2LS7X32K9UkI8MSiLsJGZ
 sG4iSdfd+HFndB9kJTPquT22/GE14K4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE1NiBTYWx0ZWRfX6EsHZ+OVc300
 87Wy8zo5MAee74td99VLdtmnvRVpqj1WDtC3FijnkGPoIj1BnDEWZlMP6ovcT2h0jPIoldMLCxa
 OH8sPauv0xl2F0S3zkfLoE8dSw1W/N1GykKXjiqiI/H85BRza5OLbQdY1iQdiS+9ujDv7AsS5hr
 i5z2zDxxiNJhMBToVK1UInGJwcZ8v/FsCjkoqH7ZjT8/wy7Yr9Vntfd2l5zhXuopH49/RvAxd3I
 IhrLcnZArut/UvxM5Od2RK1dDBhHjd9TGE91aZXmqtPXGQFABeU4ngzfmbX/T0JawFDvAGmNfhZ
 0Nqa0+v0ruMbcgVYqCkVXKLTBtQOkrh7BroogQV6s3sttkdo95oxMZ0cj7VIDQctAwopHbc2s23
 W4IhZWtJlpFnOkYNiSfPRHSeh3V+92vqzG/JG018x+biabItWYbSogl+7kjWRkEMNomTTNqZ7za
 d8fquMR/6jcvb0f96xQ==
X-Authority-Analysis: v=2.4 cv=Zp7d7d7G c=1 sm=1 tr=0 ts=6a9afce7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xMsWz-yJVPOExfjiCSYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: tDVQdFqRmsrloeZHUHkTR1geLKpkzafZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040156

The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines. The controller is registered as an auxiliary device by the TC9563
power controller and accessed through the same i2c device.

Describe the switch node itself as the embedded GPIO controller and us
it to drive the PERST# reset lines of the two external downstream port
(pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
switching to the GPIO descriptor API for per-port resets.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb0..4da7342ca90d 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -867,7 +867,7 @@ &pcie1_phy {
 &pcie1_port0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 
-	pcie@0,0 {
+	tc9563: pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 		#address-cells = <3>;
@@ -891,6 +891,9 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		gpio-controller;
+		#gpio-cells = <2>;
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -899,6 +902,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x3 0xff>;
+			reset-gpios = <&tc9563 2 GPIO_ACTIVE_LOW>;
 		};
 
 		pcie@2,0 {
@@ -909,6 +913,7 @@ pcie@2,0 {
 			device_type = "pci";
 			ranges;
 			bus-range = <0x4 0xff>;
+			reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
 
 			/* Renesas μPD720201 PCIe USB3.0 Host Controller */
 			usb-controller@0,0 {

-- 
2.55.0

