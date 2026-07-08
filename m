Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A21F370AD6
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524866; cv=none; b=jpxgRcFTpH5JI8wibbxgKogBIEhqEUKa/qW3y3FUEb8YqnG0WgpScVFkDc8AdrlwqZwA23FjLAW0bdWqbz/AE4VhPDUGhwaqB7Jwfpf8HRwN7dUQbO0iGC8kFwLfoetRVAQnaqfsP9yDUyv6Bcqgq4Ey7MCL4u/JXjX4xdrUo0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524866; c=relaxed/simple;
	bh=1aU5rl/DZoeNB1kalHh4r28Mbus6zXBZW8ufrRmXANk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vu4XNRoBeLy6q9ctGcco5zQSAwl/7vvRwvufgXfnM48yWotCLZoxXQ01Idbg+z/XS7YT1w4Iacu0Vqm2D0+hjsAJjQuwTUMX6Xx7Fhj8J2hXpr4om91Dx5f6h+uXOLFPUvVCtqGICctmsbUkgjCMYL/5PhwQ4skCmKWMwxW6dl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKQOtHgt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIItZw5w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKQOtHgt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fIItZw5w"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3JOA2738495
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I254CLogHhLoGGno/xy1XO
	lBa511Yl81T69kJWHEPTo=; b=KKQOtHgtQCvLqluuFabTTzxr5HksGu4F6TcvcH
	Dmm67lZidD1wETZ0CjInylzR7JFf3fHsXT2swWlgztveTL8MDRAwps0kUPVKvHlm
	7qIezMbNCvDYdtzgZipgjyhpv1b0ONLdz8CMSTUQPZ7jvuGMyqtiSl+uqiNnhnUx
	QD+fmz+4rCqpwSIn9ht05FCsrWR1YMMNpB/fglR0DwWe3dAeyi/WJiiFg5wulPyD
	/wWMckH3WPpbB8ONmJZ3WexGjQHFS1qRhfkZLhEdEfp5j+QLSDzltbqrCXmpUHIC
	4hHQkHX6rgYCs8FFlqjSx67WBisw+WNqOOPPp0z5Lx+bN1yw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv24ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:34:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so115309685a.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783524863; x=1784129663; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I254CLogHhLoGGno/xy1XOlBa511Yl81T69kJWHEPTo=;
        b=fIItZw5wby4uGWLS7Ku8HLsrUZ7Bn395yRVopvFLHuTzir2ssqbLFOaY0Z0tjHTINC
         da99766wOCp5kD18TawePZHqZ7+6Fj3Zw4KNCy+gbOrtXufGjY5/Q4a2+6V94zsGILii
         sJi6Q9Gkadat94rbdFJtLHa1vdyWD/gLuOeBbvG48843awBgLymU+4aMn+M+H3YkxQg8
         73deFdeXW3TvAwCmRpjcGBMJuriFqG3Z29Hgri5Lk2uD7qxnBjt5T5NZhWGbh4VJfeu5
         JNvJYBvvQ611pKNHMyGlAv3J7eLfMFIJWzpebq4x0Wibcq22AKOQLHX3lLMl/88qeaB6
         +HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524863; x=1784129663;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=I254CLogHhLoGGno/xy1XOlBa511Yl81T69kJWHEPTo=;
        b=JfquCBUhYwvdFqou6u+BX763XkKq3hClyBMBHwuyancVbOKtiKO2pTpFZ+uJZbwU6O
         iYtKJRH8AJmIvvg1QuyjkrzNg05Lips/P50E0j+BRYUM5+RDQNyB4zDCRGZzdKWEMO3+
         7vPFc0liiiPPvA7b3Qil5ZzsDLn1LzGzMm4d/urT+1PziE+fYts75TzM7WsSvYGikBrX
         Q7hUwKsRdzlSYad7ULcFsHwA8rhJ8AfVM4gI93KAbHQ5ONjKu2SCW0Qfcxfqt1GuUcth
         KqmZ6TmamEgRuNoUDWtWWTG2qa30Tryt71x6NMX5zIkuym+BrGVKZSXXUYNcdhf0L0t8
         uEkA==
X-Forwarded-Encrypted: i=1; AHgh+RodShjAHs7CzIJOBisvu5FWlOB1Ad9UOy4Om1D+ibEUHwByfU/Jwi0nTZCbBgdbsrgn95SyQaZZBjcM@vger.kernel.org
X-Gm-Message-State: AOJu0YxGkw/iNQbR8/lNAGmxebeqeCyxELyG46qyGnnM5tem2OwxvjZ6
	mRKuv/m2AY/EMNiIzpcWvM2myN6pbHEc/yF9X5+ipE8CZtwZcOjhpBaH0+Qq1LnARjpKxYE/RJ+
	4ImeowMqfjHgE4KRpkuOyjsl8RopVk3dUtO5ihmmrxDvD8vDXMImYM8p/d/pLFGbS
X-Gm-Gg: AfdE7ckk7xu0i972yjIqvryai5vu+N08F19GP/+5/d86hSwU502GkUeAn2R4dBHjvc5
	swLl0fzVP3mSIN5TLBHg3lOBIgJErabOcVaU4aialyTfgXsfKcjPsNrwkNKUPhCimgl4X+/0Iu8
	aHYwo6YXxuN+rnFH4BcKQMksuLIHmkU513hjPxcZsUb0eFzmRD24aF06GG/vIhtm2/kryLfVO+u
	WkFVGf6Mtm4cZVjCWob1Dab0XeOZJ7wxq2xZkQucB0g7mZ0eeF1GHeA22zkj5wXIhPEkpq08+iG
	tjn8GzG73CjFDb6yKWY6J2enhhbekfOIdHrziqI4BWUPrQeI5nNAmBurrCDsx3w+aRFPGcog3rd
	J98b3wIg2XAGPdfqRasJRPgk5nvhOMtwMtTg/mhlGgXcQQZ9+khKoC2UFAx8vqSPPmBmcdKPsxp
	UhQzAxg/5OkcrhnY3ehKmcD5CfLWp9Xsfw6XpGdxufyoth2x2vjn2QuAgLzx69kk67Jk78istI6
	VS+ESw6vb1bRfuzY+4S
X-Received: by 2002:a05:622a:1804:b0:51c:555:7dea with SMTP id d75a77b69052e-51c8b30323amr34858771cf.30.1783524863131;
        Wed, 08 Jul 2026 08:34:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1804:b0:51c:555:7dea with SMTP id d75a77b69052e-51c8b30323amr34858191cf.30.1783524862553;
        Wed, 08 Jul 2026 08:34:22 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d4bffdbesm111607166b.45.2026.07.08.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:34:21 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 17:34:21 +0200
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add GPIO line
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-gpio-names-v1-1-9162105b9971@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPxtTmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwML3fSCzHzdvMTc1GJdU4PUJONEkzRDsxRzJaCGgqLUtMwKsGHRsbW
 1AMldCT5cAAAA
X-Change-ID: 20260708-gpio-names-50eb3a4f16d7
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e6e00 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MyBTYWx0ZWRfX4ax6JBIGWd7w
 kyrGRX6Epp3z9hQbPG4j7kxUxQWBaAToXFrWZ1N2nYTOiEHNY+VS50j1HLSD93VIfHCGykzMAuB
 UjTEMPuJOMlaiBgbuvL7G53/SB3cYjc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MyBTYWx0ZWRfX20+UmTnrYIBg
 vvkA+gIqvwys2NtHxjmumyJcsxaFAGhbTuXe+VsBiIO53Ps8HmTr8SunHkNt1vNIb05FUCBMmcF
 fOG/P9+jZoLHLndpNCxiULFKKO2CtXWrNz2V+9ZfjgQ3wD1QQWmRryx2pmpCxGT+c++dm4QazkZ
 lpHV7aDPQTissZzsgkkXnux9qXkE2VDwp9C8MVKtBy69EB9/tfQkZbZLf9b91ko+x38O4lMsmo1
 n74Y8mQbTaigV70XHf1o1kC6dmHSPHV/fFMm4RXe5JHDfSyGNg21JdfANt4lKKSGwGKZmKWHCzg
 ETLQhpQCCeAMrv3UZ4+NSRmoPAUABY0Fd8wA7T2z+Pf0zx1+HsQR8CAq9AUtHMQKAam0l4+lgIx
 OaCuzU/yXwkE55NBlrOsbGbDOx+Jipbp/uf3yvNMozJyhUzMk5K82DXXxcLIhkCCLF4VVp9WMrS
 uI1B2N64O25kVJE+Fwg==
X-Proofpoint-ORIG-GUID: IqccmqLwc3p6-0zOB_Ws4fxtDmGYEWj3
X-Proofpoint-GUID: IqccmqLwc3p6-0zOB_Ws4fxtDmGYEWj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080153

Add gpio-line-names to the tlmm node to document the PIN functions on
on the VENTUNO Q board. This covers the different headers (JMISC, JHAT,
JOMEGA and JCTL), the flat connectors, and the SoC-to-MCU interface.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 8b3ed73feb6eca6578382beca588baf42b8c9bb6..24d27046667450bf3aea7646d352fe27f0a64867 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -426,6 +426,34 @@ &pcieport1 {
 };
 
 &tlmm {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "JMISC_SPI_MISO", "JMISC_SPI_MOSI", "JMISC_SPI_SCK", "JMISC_SPI_CS0", "JMISC_SPI_CS1",
+			  "JMISC_CS2", "", "JHAT_P03_I2C_SDA", "JHAT_P05_I2C_SCL", "JHAT_P27_EEPROM_SDA",
+			  "JHAT_P28_EEPROM_SDL", "", "", "", "",
+			  "JHAT_P21_SPI_MISO", "JHAT_P19_SPI_MOSI", "JHAT_P23_SPI_SCLK", "JHAT_P24_SPI_CE0", "",
+			  "", "MCU_I2C1_SDA", "MCU_I2C1_SDL", "", "",
+			  "", "", "JOMEGA_SPI_SCK", "JOMEGA_SPI_CS", "JOMEGA_SPI_MISO",
+			  "JOMEGA_SPI_MOSI", "", "MCU_PG11", "JCTL_UART_DBG_TX", "JCTL_UART_DBG_RX",
+			  "", "", "MCU_BOOT0", "CYPD_SWCLK", "",
+			  "", "", "FORCE_USB_BOOT", "", "",
+			  "", "", "JMEDIA_SOC_CC0_SDA", "JMEDIA_SOC_CC0_SCL", "JMEDIA_SOC_CC1_SDA",
+			  "JMEDIA_SOC_CC1_SCL", "", "", "MCU_PG12", "",
+			  "FLAT0_P17_GPIO", "", "JMEDIA_SOC_CAM_MCLK0", "JMEDIA_SOC_CAM_MCLK1", "MCU_PG9",
+			  "MCU_PA13_SWDIO", "MCU_PA14_SWCLK", "", "JMISC_SOC_GPIO_0", "JMISC_SOC_GPIO_1",
+			  "FLAT1_P17_GPIO", "", "JHAT_P32_PWM0", "MCU_NRST", "USER_BUTTON",
+			  "JHAT_P31_GPIO", "JHAT_P33_GPIO",  "FLAT2_P17_GPIO", "JHAT_P07_GPCLK0", "JHAT_P36_UART_CTS",
+			  "JHAT_P11_UART_RFR", "JHAT_P08_UART_TX", "JHAT_P10_UART_RX", "JHAT_P26_SPI_CE1", "JHAT_P29_GPIO",
+			  "JHAT_P15_GPIO", "", "MCU_PG10", "", "CYPD_SWDIO",
+			  "MCU_PG13", "MCU_PG14", "", "", "",
+			  "", "", "", "", "CYPD_NRES",
+			  "JHAT_P16_GPIO", "JHAT_P18_GPIO", "JHAT_P22_GPIO", "JHAT_P37_GPIO", "JHAT_P13_GPIO",
+			  "", "", "", "", "",
+			  "", "JHAT_P12_PCM_CLK", "JHAT_P35_PCM_FS", "JHAT_P38_PCM_DIN", "JHAT_P40_PCM_DOUT",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "";
+
 	pcie0_default_state: pcie0-default-state {
 		wake-pins {
 			pins = "gpio0";

---
base-commit: f86573e68e56a7df7d54eb58101ac413ba731996
change-id: 20260708-gpio-names-50eb3a4f16d7

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

