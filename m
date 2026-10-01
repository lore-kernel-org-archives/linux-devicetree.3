Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F299D47279F
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870809; cv=none; b=HSB+K67/CukvKXDtXYjd4fE+DOvblPQMKKI1Ik3nnMdjkB2aeLbRIqEdqjoswCLXHPyYNpg8c4e9O+8z7ZVYfiJgHWIESxj1tUp/r3yyCyb1ikLcIiovkF5Q64abLuKg3LZ23mlqFR8zx2BkndHJGaEcPeVbwLH2rf+A4JDc5XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870809; c=relaxed/simple;
	bh=/Q2BrDG59GmMlxGGtQS3aLFT+KnRGjYRz96TAYWMkFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyCwMY7Fr9s+dqz029L4AM3mgZ2ZZCGl2bLl6uYd1fKTjJJMTh7qpcXTyVDWh9o3Nmtf+sL9070TbvCBgbeZH96ZMTLfSYe4VD8VL1pmAGuIc/UqqfbjsYwKnxu5AIHUvkHyWtr4ueYY2FXFN2JWZ5+VYeCJUebvZpFNs4XtdJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Fp3PL77K; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Fp3PL77K"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aff58e6abso1214115f8f.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870805; x=1791475605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ij5hZ/f/5ZSAVNfXmFdWrj1YYWFbkwnSZJULxesQxbM=;
        b=Fp3PL77KkPiQxkZBc2knFccmUX4dAFBbdBbjP9AojRAzbftWIMcUE579HOJbTB3VkC
         2plLXw+QuV4nn93elE/hNB6yExUFK76RIWiSYAZ3yPQB90MIkYd7h6lM5B8Rb+xhI3Zb
         PYMWE6C8j9AhZzzQbBEUyudMPTIUbJPnIpWeE4NDIWKxb3KZVzUTrg6ZD7v9L3PcY9Rt
         yv95KZBLpMNzr/J9WIC8ZHjzj7ia+0AsGWxPQ7L32na47yQ7QfsvvM2+ylKry01z/MOr
         VvH8MnNRGDY1vespw4Fo93rK1PfbQDSuxK3c4xe/eMKYEKpkrBAyaKfDWiZ3O1VMQws6
         6l6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870805; x=1791475605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ij5hZ/f/5ZSAVNfXmFdWrj1YYWFbkwnSZJULxesQxbM=;
        b=Z5RUMdhlzuwSxaHVekvQQrY1g8YzRvXM3qzL3eiWZsUzmuNt637wVxLeLRA1+xvK9I
         D1pIZXz4tkHximHR42dDG7ptxVnpijP9hO6CjlDdnHjSkbtXQD64g1xmIHcPtt+9CqpE
         WiYascSztMhIeDS1xjExrf47MVKbjY9elCaEm0gOnYiJKko6pRLfW4u/BMiVmooVLNWE
         FiF0W+WoFkIPOKnJvrwdRfLkBidXVDKvwxpiDNS6dQne1Eu0ZqScVyuJ8Qa1HDj9bmWP
         OPPbyDr1oy6HtM6WbrJ6Q7WyyY8zeAURtx/btTjngLjImoHCwb11NHwAzmMxU+uf1++P
         iyzw==
X-Forwarded-Encrypted: i=1; AKwUvByq+X/PnTrymggzddDmAABje8z7nNP8cpxN4i6kFoCxBtJNqd3MT7B+MOxHWD0cvRgn5tocoUbnOJav@vger.kernel.org
X-Gm-Message-State: AFuF++kFiZPjRwkL5i3oPZ8cZ8G4O4B3M5CqLfuoS9VdwGgqLL7i9xRx
	W4m2oowXaso/tizCLvYqaVIFU71DCSC+m9DnkiA1N17vkHuHJ4PcFY6Zjo+fbsPTkj7DDzv2O2r
	RyZwB5f8=
X-Gm-Gg: AYBFou3FAIeCNnWJjz0U5BJ0QdNL610M1zYjrNy/SYdJocPEkd7GP2TYxIleZvcKIGo
	iz+YUkW0cGVxqPhygKvIltzT68Lu/D44x3e/4gcL5r6x1a3eqK2Yfmt5xhOQ/q6B0QbOCQAg2t7
	8S1kKV1YIiHojN8+c7PaJ7XCmh7FaK+LD8xQiR3QnFXJlpdfm44x7s4XE0x1XrTI1SjxMBbjSLN
	XtBLQpw43FV7n6/S1gIlLR6NUHRXB/qFVEChrHnYyw77pQxmVdsKkZyK7AFGWwAks4YLFr/9BPi
	0J+/hZleIYo+1uElu0lX7XomsZHDCa8ktkZKM0YLcbybJAgwMymPQmAwZL0BT/RpK7BP9XwICsB
	3QVgwtwNU4AB600JAUCQkwgcqkHAYHg9ZvP18Y//zke4okqCCCDIDYncGE9rcdynrVTvQMGbLZf
	wt/f/qg5qylAm1Cwduc0XT4t/cDs3DgFaKHCPMrYVAAFiC0Vnn5u834DhHvmmJkian
X-Received: by 2002:a05:600c:6091:b0:4a0:a34:f6fe with SMTP id 5b1f17b1804b1-4a027577f81mr1689465e9.17.1790870804666;
        Thu, 01 Oct 2026 09:06:44 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:44 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:32 +0200
Subject: [PATCH v4 7/7] arm64: dts: amlogic: gx: add AUDIN node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-audin-v4-7-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3008; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=/Q2BrDG59GmMlxGGtQS3aLFT+KnRGjYRz96TAYWMkFk=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7Wrmf3L3b+J6zXq3/e8YmKettBq/Sry057jXRQ+VYt
 P1Sa2PNjhIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExkigYjQ8+B1u1S3P6FHOV2
 drLNsuWG/ybtmm7978aTy/LL5rK47GT4cbX1npJ8voJV69w52luWKnJtFVn/+U93yXtBvqmTtp3
 hBAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

AUDIN provides audio input support to Amlogic GXBB/GXL SoCs.

What's missing after this to get capture support working is to connect a
capture capable codec to the SoC. For example to test these changes an
NXP SGTL5000 chip has been connected to an OdroidC2 (GXBB) board using a
custom hat board.

The following additions/overlay are required on top of
'amlogic/meson-gxbb-odroidc2.dts' to make that hat board to work:

    &sound {
            audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture";

            dai-link-1 {
                    codec-1 {
                            sound-dai = <&sgtl5000>;
                    };
            };

            dai-link-3 {
                    sound-dai = <&audin 0>;
            };
    };

    &audin {
            status = "okay";
    };

Then, from userspace:

    $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
    $ arecord -l  # find the "FIFO Capture" device
    $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb..2b92a99ab2cb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -436,6 +436,15 @@ watchdog@98d0 {
 				reg = <0x0 0x098d0 0x0 0x10>;
 				clocks = <&xtal>;
 			};
+
+			audin: audio-controller@a000 {
+				compatible = "amlogic,gxbb-audin";
+				reg = <0x0 0xa000 0x0 0x148>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+				sound-name-prefix = "AUDIN";
+				#sound-dai-cells = <1>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@c4301000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..8f3c7ca06a3c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,11 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..de213c0b63a3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -100,6 +100,12 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,gxl-audin", "amlogic,gxbb-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &apb {
 	usb2_phy0: phy@78000 {
 		compatible = "amlogic,meson-gxl-usb2-phy";

-- 
2.47.3

