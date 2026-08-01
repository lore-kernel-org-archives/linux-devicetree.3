Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1835D3890F0
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 21:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618287; cv=none; b=OHYYmghHw4aoLiyvPZ5R9+Jpw3FbI4ABSDhu1yiKZ6V56NectHTLfWBnosqZiqzeFgnK0XizY1UAogF9fBpYXjdg2T1IlXKskbVX/RjAh6xwaMgAODnqX93xe+Px+HcJq84vHXUhTGbaZ+TX1EqpZU7qGpysU1Dm7tcNNZOx9+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618287; c=relaxed/simple;
	bh=mzQoX3FaTVFufhdy5cjSSr30a02VvRKHJ+kVUAXYnxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tIYVJcFG9H3jHjBPcF+4QD5+spL0Wpcj70TP9RYPhzVnWIHVpplE45zyqrReSwKwAIVk/+tk7PE5lVMZaGfQv9i3jlU23i8zRym8h7SB7v3bN6BwhU6zyqx8lCO3U9vu1cYuuOBaNkF7q/3qsWQWLeEjMpVyRUxalvyBOOrQGMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YW0CPB6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJofT5sb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YW0CPB6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJofT5sb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J08N44033794
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 21:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qh+fdpZVSvn8T4ZHxWuDVMee6L+wS7dVCUr
	MiFrt4ws=; b=YW0CPB6fwjjIyeVPXG9q92oh10n4Dqu/rXn7bqTF9Byi6WDGJrf
	u0B3Xwh+IS2u1Kfs+mrmyb/7AyBpxLe69yRYvnP20JKMOL1gze6tNtXyaOUh9S9N
	BNPeUST0y8Z4KqR8KHz1cpjv2bPea13hoBnVrFtEX8gOoxS+GTF5CZttPUZ0UYZI
	x9RSOR2NCOgR263mSV2+iD3HHfmV9U4tRXTR8e/u21d1zJ8UIheVdlFxTctwlcEp
	03FI4V5zh1jONdOqbwyX1rzqlhJJztm047Pmpvg9cGpkX3JHUD80f2RDxYb30PbI
	29CRrdBUQlaYiC5Zu6hBxvkzv/pgN9JNNyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q51qxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 21:04:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso40720001cf.1
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 14:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618284; x=1786223084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qh+fdpZVSvn8T4ZHxWuDVMee6L+wS7dVCUrMiFrt4ws=;
        b=UJofT5sbZQPU0erDcIu/2XXnuvLUukdtW/7AjRb4e20gE5VATkMMGRoyCd46Q7LbBb
         sjnS0y+BitRnm20rOBqn6I+F34qdmXP53ztLEC0lmORo1s7DOBZ4vVgT5DGloUiCArHS
         7U7r8beMW9K2mOTVQsv1cLaPoUYma2t1SN5Noj/pSjxpSye/Tzt99xBqCGW4KbqUNXMH
         9/U4pCn1bLrKLjO69irAeXpSxsmrqfWsEhIoOZpcfwrtuFSJGUutpDYh8nmXOhzCP1BF
         NifePYWSXUnuFZQ71Q9z46Sl3nDKOus+2bR8isRtW1HG8zaszUl8H7VkDwwWzBlFkBu2
         hFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618284; x=1786223084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qh+fdpZVSvn8T4ZHxWuDVMee6L+wS7dVCUrMiFrt4ws=;
        b=omoK3nYPt8DAg8mwTfKlZl06CZ1M3sTXLK0ZXDxX7eLu6nCxy9g/pv74S1j1b01X1S
         jHP5Ikqf1OAIGOMf4myXFBVR0v33usog22VlWOtxYbW66Z4kCVpap+KUXOLTLzSjV/wP
         n2u4UF2ONnSJ2kusNkbQpzqLPaY2kOO5qoUl9UUSW7DXUV8pgYjcOsTG1C5cGSjmYaDP
         lW+h9V3fKYVXtAWUoDPBOqORZhuCBLwUkCHC231Iy5tshg2TOi9WIOYh9L9dufK4+Y/D
         prPU09px89btCw/65FnXYwWMQ5sLSmNUKu8FjEHPF4kKkcukeUlLCPhG7iX0A+/emmfE
         Q42g==
X-Forwarded-Encrypted: i=1; AHgh+RrDOpHAkU4T0bDxxmAE8RUG+d1kP9oC4XpkWEzG0q5DpmTu6Sr9XCRA+8eS+zRcmic1/46/G59dxYHI@vger.kernel.org
X-Gm-Message-State: AOJu0YxIQxEu/ioOEH9JnIQsKyYRPA4CgPSQ2RS78s7e3DZpB4q+Amyz
	Q9OePJOycQQCa6Mx7rKqzcBKLfWelKvCrKrtRRyar5eKGrnBcmnFW52s3ih+PNP4mKa5l1u/I5X
	Zh12pwGhom0HLxWo9JdBxrZFFNyrp1XiJMtT0qXoXEHdeWOAWhQHYZ6ek9hO2yrU+AJc9geHc
X-Gm-Gg: AR+sD13wfT5DjIvirxRvPpG9ONsnyCBEh4Fj76qCgvb2thjT4cCcVFTLK4NohY1H2A9
	OYfdH7fGEOkATG6tmLW1CBKtImjAKx302wkqrZ/FED13l5jA+/siPm5lE6DxGXmVoHqdBWC6GXm
	MPupx2uK8U+6XAi3sNDmGH9s0gB3D267ZUKmqXUpLfbs1/8iYjufZN9y7fSFPRWKcKAuxJxpIgM
	grPfPNOV0lVPvkjsnjSdNcl7eMRiAsHSIMISPf8I5nHkFEvzTPVjmn5ymjuLX1tZCKdm4PTZvkm
	3YaTWz5aGj96KqA+kGyJ+qhA9VIg+RvzXTHhEynJ0Hq3PRDRD7a6kuADCstKVjQ9fufgko8jx/i
	qBBbHUt9PzsUrEXFm
X-Received: by 2002:ac8:5ccb:0:b0:517:2c1e:8b6 with SMTP id d75a77b69052e-52b567d8750mr102080831cf.38.1785618284133;
        Sat, 01 Aug 2026 14:04:44 -0700 (PDT)
X-Received: by 2002:ac8:5ccb:0:b0:517:2c1e:8b6 with SMTP id d75a77b69052e-52b567d8750mr102080541cf.38.1785618283742;
        Sat, 01 Aug 2026 14:04:43 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm17960617f8f.8.2026.08.01.14.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:04:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: aspeed: Correct white-space style
Date: Sat,  1 Aug 2026 23:04:38 +0200
Message-ID: <20260801210437.384040-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3611; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=mzQoX3FaTVFufhdy5cjSSr30a02VvRKHJ+kVUAXYnxg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl9leq0oNwbGaHDgxoiOOAFcXnt+3JsmUGAOM
 64VTNptbj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fZQAKCRDBN2bmhouD
 11i0D/9XPDNBCCi0S833xlthpzVxAEri51loOV7T1kVDc+cTDtb8PClIiZl/YdxwV94qwer6kq2
 Km0PMXpAv7QY6kgmhKacv39J5pbwHvBMeBVM4/k9Ksx4GVVvFsxbLlCCy/svG9lYo1SsVPPkk2K
 qcnV6A0Y3SLQj4n5sJo1t5s/vsSolJQGzyc6uA7q1TczUnDyyGxDzdXo48LuyoFIlySMlN4V8zO
 AI0ITPp92zqtgo/EtdsYiWi+yYbZ7zA2i1d8ONbcdCQ9O9EKWOr2+p2Ya4ZOiJExk/KSPqoPRj0
 oOAolMZfh5KCZoJ7HEBvIu+1LbvdSafCazkPGvzcWVY8hgdI3pI4dYQNe1i6j/yVIUmRhZCqnP/
 Gzz6bI9jCA1KJcLxb+7yuTyV1ObyOjGOehLztRM5T4dll0PawwBhxAzAnzcjHEbHoVJbDJnF3h6
 behKKc/eNMBmKIFDHVrUHA8ar9atp+qstsuza/ttVwyCNzFygyq7QU1Od3oqN3u628NGOpZfnuz
 NkAKul8eI1sjWmM0NBBND8mk9nEEhNEr2NiJtXp4ltwSYCrMkDhRXeBZ6fvVzJMx0w+ISbAjFvM
 t3Jg5xi56EhNCE3X6t3IYetuG89+Zixfd9RDga9cUMD3ZdoduG5bo7KcFTSBZTm7+IEXWsTw/PW ARdGF4yuKDV9fow==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX6MuJA75HYh+X
 Jy0thGlVqOMGH3z6KCKjzF+cZ3Ntyo44QBLh58FejXs4cydJVDWCs19YCbj6MnYwjsce7dK8XWF
 BYYrvJyUVVnpQlRVz4WkGdp1hGYJY7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX64gTmYuD7y7S
 HCPmlyrXFntWIIZT+EdJGuAd+Je92m6gVq53gB7z0hSnVpGcWCsvCYv1qbb89il/ZQhICz3G4uv
 65flp/6eGVqZ7Dv47diXYNQrIlIWYN1PG71pdOZqrfEjbs7/fFkLOuyU+UAjfsl9ZMTvGsfUBuM
 tsKzXfAWu6TuKPS/NUuges9x0bIs26V2yJA0CyP2YiPlvQGtSCta6fUJUfNPGX0+MHtJpughyv+
 GpzplVcvJzwUYdJ4D/48Oz98t8n97c2KUOGNjGd6hrQkjXFRMo/8neCUt5kwM9wK8QVkvNgo975
 YjDdD1k9Akay8xUHkfKzBw1xa3PemHXBlM8CH9dAqAkKweZRupm/VRUVi+dzJtf1a3fyIIkC3PZ
 NbX8gL3umNdoubiwvTwRtKhv32BG0gAGwDzI/cZUgzf1iax89aOmcgtfHP+8ceWdFMD8+bMSzFd
 L/7FyDSYGdmdgjdPV3w==
X-Proofpoint-GUID: idsDR5fzVkfCBifNvmaiqoUSp5MFbSJA
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6e5f6c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Sc2Gg_jFPfLOXhiJGNQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: idsDR5fzVkfCBifNvmaiqoUSp5MFbSJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts         | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 8 ++++----
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts | 2 +-
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 2 +-
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts    | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
index 64f4ed07c7d2..fe48397c2a6e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
@@ -244,7 +244,7 @@ pca9555_5_24: gpio@24 {
 		#gpio-cells = <2>;
 	};
 
-	i2c-mux@70  {
+	i2c-mux@70 {
 		compatible = "nxp,pca9546";
 		status = "okay";
 		reg = <0x70 >;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index 820d39a92974..1898093b1550 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -673,25 +673,25 @@ power-monitor@14 {
 	};
 
 	// Module 0
-	fanctl0: fan-controller@20{
+	fanctl0: fan-controller@20 {
 		compatible = "maxim,max31790";
 		reg = <0x20>;
 	};
 
 	// Module 0
-	fanctl1: fan-controller@23{
+	fanctl1: fan-controller@23 {
 		compatible = "maxim,max31790";
 		reg = <0x23>;
 	};
 
 	// Module 1
-	fanctl2: fan-controller@2c{
+	fanctl2: fan-controller@2c {
 		compatible = "maxim,max31790";
 		reg = <0x2c>;
 	};
 
 	// Module 1
-	fanctl3: fan-controller@2f{
+	fanctl3: fan-controller@2f {
 		compatible = "maxim,max31790";
 		reg = <0x2f>;
 	};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts
index b29e08cea254..041809c161a2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts
@@ -513,7 +513,7 @@ psu@5c {
 		reg = <0x5c>;
 	};
 
-	fan-controller@5e{
+	fan-controller@5e {
 		compatible = "maxim,max31790";
 		reg = <0x5e>;
 	};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 6287f80d70d9..383955cc2702 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -484,7 +484,7 @@ psu@5c {
 		reg = <0x5c>;
 	};
 
-	fan-controller@5e{
+	fan-controller@5e {
 		compatible = "maxim,max31790";
 		reg = <0x5e>;
 	};
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts
index 5143f85fbd70..61735d828d07 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dts
@@ -24,7 +24,7 @@ iio-hwmon {
 		io-channels = <&adc 0> , <&adc 1> , <&adc 2> ,  <&adc 3> ,
 		<&adc 4> , <&adc 5> , <&adc 6> ,  <&adc 7> ,
 		<&adc 8> , <&adc 9> , <&adc 10>, <&adc 11> ,
-		<&adc 12> , <&adc 13> , <&adc 14> , <&adc 15> ;
+		<&adc 12> , <&adc 13> , <&adc 14> , <&adc 15>;
 	};
 };
 
-- 
2.53.0

