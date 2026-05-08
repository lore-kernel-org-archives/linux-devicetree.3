Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECF2272E56
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 02:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778207418; cv=none; b=pWQgJxhqMS242De7jUqpKtILo2nA2sNSwQzbrEwhc0amf1sJrPPqydaEuAtzjuWlvb1Ac/YU7+PXkz/IyXabu5lRhsQONmGoeSTJAQOMu3G+oo4qpETKF8dHlrdo0L9ChfBP9+f4tk5YKNDUoz4pvodWtcnT9QyX6Fd9fprTluA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778207418; c=relaxed/simple;
	bh=Bi5rTiz6sS6VYbktgkLsGAorKRiZb8L2whtZyNLeSHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q6NVP8Oo1YPBTTRxA2BpGxJlAexvDSfPSXL/0uAaMIFmX/2aR5Ox8BWqUcm8oc7BiKc61h/RVtlGe9YO8v5/3KYhlUOZFlQamwdenMoFwqGDx44cjlF9et+MKxQywSk9h9IpBVmYr3Kd7wzPp/3SMseqyo8cFKXlqVVpB4vpPrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QRvQyng4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QRvQyng4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso16036925e9.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 19:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778207415; x=1778812215; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWFAHdWdNfgetWCnV9jGKJb1CsJQxtNeKq4Xom3RGVw=;
        b=QRvQyng4+lfb3j0beMhNA8ju//5xED5bBV1b7bepD60Bs6cFJgfHzLRLgPwk0FdEbt
         BfSxevnoR75m+xOqeqNKySbdEb6C5ewD8JcTIWEyT5nKB0tvpDoG97FSBLFB3GXCH2YR
         IhOV3x4UgMx1EEXJJchsswYGez0a5wbLTIb+S4wD2evq1M8vgnNeeR6JIfQH10PqDs8Z
         qH9xftIF9deddOkwramq30d076PeoSKtBR49K2LZsQoLAqPuLhGZfDr5JDl282jiG1GQ
         yHx5dd9ZjAawfvz1Oy/NoEYtRXSohwBmbEorO4Qj6bF2ed3Q0csrmpBwlEki1qtPfY3t
         GWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778207415; x=1778812215;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWFAHdWdNfgetWCnV9jGKJb1CsJQxtNeKq4Xom3RGVw=;
        b=G2nyhi5w5hlAFVOeD725mfZofV3beUe016eus+/uGkfLiUUV7HUzlX171eISoFbQMj
         DdFtkMUWqJBQ/AfldDkyVrahTTgKJ8Mv+tuiB1BMw2OazE2G0aBgqdzCgrto09fdfuh7
         nRHXqpb77B8jDLHfCtwelIAKJO8hUABiUsDaetz0hsyI5bABQMx2wAkXK3qb+D/U3M5w
         SkjXgBUK/Fq3oQC1p79MavPTDvQPgnmNEXE6q1ljZsiPfzOoDKedMavlGIF+6AT4UZDk
         Np5PWvCoIVsWFa8uN2Om5J5owPqePlig6vXulY11IL+gG7H68Ri+NxyJG+ZZoPMFZfkg
         GlAA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZFrJEVLW/1HhcBzo3dKSiTu+Mi5RYVU+rRusipL+7cdSWW4hqHPP0glyJ0FqahaGEVaQWGZsBTtte@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu0XCyPx3uZ3MPdTJgP89uMJrjNJmOkkvhnkBLAHt/0JPEzENc
	JdOJTsy32a3hlNlq5ZkB4I3iAsDMToxx84d59CSO60Vi/i+4pLT9ZrE4fYoYL+KphDn8WTgAuAF
	oJ3Pu
X-Gm-Gg: AeBDieuHaBLQ/WAoETRSW76pG/lRdHRoK55vk9Cgy+M07DplLu/1OS3jNbojtj+X1HP
	FvLOjMAgTrpmYS581e99cTmP3MAIqobQKklFWc0pRttw9cuQjE5tpf4mwT/wQ7Xt0TT++eJwxFE
	f/ctQIuAkKzZRFE/DhCZyoNrC94O2bWjwqwqCi6MC49vcHV3HLqP5wMe2HX9xYWWT0nTZj+LgYz
	XIwU+/G5ASrPc/xj4LN104MNHXmdTvYIZQYzneB28vHi10DmRZJ0MxJviEmA288pbPVSeCGNymn
	rpkoIZhP7I94J+4liNnDM6m98yvu7wazg7saWYSqTY0Pw4gZx6oQl+JiDA9bp53rIsAMRnwOMU5
	xqcrquQCriCEgUFKX568VQl7j5AZCmsIxDfPCmmWkLz6Pdz53Lphr/XfaskKTZnvjMqgbmmS6S4
	M8XXrdQYs+kiil3lSixbKNXU7NO/HLkZEgTtEZLIsRhMSh2CEBdEpidBZgcRqMiEIQCquBpgG88
	mzRvg+dXI7vWGqYuDX7X4I=
X-Received: by 2002:a05:600d:d:b0:489:1ff5:edda with SMTP id 5b1f17b1804b1-48e51e08240mr141109125e9.6.1778207415092;
        Thu, 07 May 2026 19:30:15 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com. [86.170.11.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68eb85d7sm1697905e9.7.2026.05.07.19.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 19:30:14 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 08 May 2026 03:30:06 +0100
Subject: [PATCH v2] arm64: dts: qcom: msm8996: add blsp2_spi5 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-wip-obbardc-msm8996-blsp2_spi4-v2-1-8b81a95b1ed7@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK1K/WkC/42NQQ6CMBAAv0J6dk1ZWqCe/IchBkqFTYA2W4Maw
 t+tvMDjzGFmE9ExuSgu2SbYrRTJLwnwlAk7tsvggPrEAiWWskADLwrgu67l3sIc59qYEropBrz
 HQAqq2qDSymqprEiRwO5B72NwaxKPFJ+eP8dvzX/27/SaQw66N1hJLLQzeJ1oadmfPQ+i2ff9C
 /FpWvvNAAAA
X-Change-ID: 20260329-wip-obbardc-msm8996-blsp2_spi4-7892454c504c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2834;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=Bi5rTiz6sS6VYbktgkLsGAorKRiZb8L2whtZyNLeSHI=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBp/UqxRkhiTxIL3jEZY15xAb3u7oMG5ixnQ3GsP
 O5Uub+PQV+JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaf1KsQAKCRBjTcTwaHBG
 +HPED/93hEUzRULqU1+Ec/TAwuuKM29vq4ZXYqPGssodSvkHg4MFNR1IDhie9nIzzYKfMnwJuBU
 J+aXiTB/XkhoiJYxAelyF+4iMBFqwoY5j/aikJ7C03zmQ1xlHivB4BcnBc864plfzfGn3XcFluz
 cp9y59L5ED9MtbyRJWJr7YHHoUBTse++GuO3HtqqAvDtg4kXLWPEBeV4/mnGsL+isYXVKwH3fMn
 Hv1Cz/jmPB/bvWHIRK+HFddcmMdyRfQYmCNk69dju6T9oBGKbuKP3sd11rQ+l5e9FXY02jB35Wc
 Y/8QCmbmtEI3X5pYvg4YV5LEqa37YUa22s4WpEErPp1+WFnVBuq18/uDcVYJ5fE8LWeZykdeDVn
 tplq39HHdNSjfJVmnq0RdBkoiUvB5B9MUslVCUtZlgI9rlnOEgyB14p8NWoNhKakoq4C4FJguEv
 ylqae8cTVIYXS9vAKtlIzpML/KBfdAZ8ByuGWQc9Y6O69jKDD7MnuEu+wRpDKSeXooaDG3AiXhn
 PORrVCmpYMz8HxIPLNrc+vVdCZAS2GpO/fwnUrl9bcRMaFVhYEVj8Uv1TDr8v08It92XTnchMFP
 UqL7vr4Vdo7+juudgPrWxPdAQOmnH9z9lgFNOJjtNy9sXhyFreYXFiAIoaRkFxkU4Kye8Y6LYWx
 VzVWSFm6Hu5Vwrg==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

Add the blsp2_spi5 SPI controller node together with its default and sleep
pinctrl states.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
Changes in v2:
- Rebase onto qcom/for-next.
- Rename node to blsp2_spi5 (Dmitry).
- Move blsp2_spi5 node in alphabetical order after blsp2_i2c5 (Dmitry).
- Rename pinctrl nodes for blsp2_spi5.
- Move pinctrl nodes in alphabetical order after blsp2_i2c5_default.
- Remove superfluous register property from blsp2_spi5.
- Remove superfluous interrupt property from blsp2_spi5.
- Add dmas & dma-names properties to blsp2_spi5.
- Change blsp2_spi5_default cs-pins function to blsp_spi11.
- Link to v1: https://lore.kernel.org/r/20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 2f67e665996f..818e5660df91 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1632,6 +1632,30 @@ blsp2_i2c5_default: blsp2-i2c5-state {
 
 			/* Sleep state for BLSP2_I2C5 is missing.. */
 
+			blsp2_spi5_default: blsp2-spi5-default-state {
+				spi-pins {
+					pins = "gpio58", "gpio59", "gpio61";
+					function = "blsp_spi11";
+					drive-strength = <12>;
+					bias-disable;
+				};
+
+				cs-pins {
+					pins = "gpio60";
+					function = "blsp_spi11";
+					drive-strength = <16>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			blsp2_spi5_sleep: blsp2-spi5-sleep-state {
+				pins = "gpio58", "gpio59", "gpio60", "gpio61";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			cdc_reset_active: cdc-reset-active-state {
 				pins = "gpio64";
 				function = "gpio";
@@ -3433,6 +3457,23 @@ blsp2_i2c5: i2c@75b9000 {
 			status = "disabled";
 		};
 
+		blsp2_spi5: spi@75b9000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x75b9000 0x600>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_QUP5_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_spi5_default>;
+			pinctrl-1 = <&blsp2_spi5_sleep>;
+			dmas = <&blsp2_dma 20>, <&blsp2_dma 21>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp2_i2c6: i2c@75ba000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x75ba000 0x1000>;

---
base-commit: ef5930fa9d5d5a1734e9e065d3e29bf1a064cbc3
change-id: 20260329-wip-obbardc-msm8996-blsp2_spi4-7892454c504c

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>

