Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D7E2836E
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 00:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779843142; cv=none; b=Fl0s+QHwLuF/HcrHl2V7VkkfzGZ+RVP957ItXaXXbb9UKsjQxPF5fqOk7XelmUHwP3pHiJ5m+xHw2j56/gghpR+j22wFC8kw4GtJlPbKCRd79My7Fjp+YqNc41l6QqZ7pwFW7LNjTVd83Aj6uLZL/JEKamWpUOLGu0MM9gxbx/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779843142; c=relaxed/simple;
	bh=BXPA79c7AXy97mro3mLUwS9xuKHDqiCGFVGiZ2aKS4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LObNPCewRx703dMhxNwqyc2tfi68zavAqCiLAXSHoYtghAuGP1uUqaYhuCHuK3UwLbLq9irjU8yfb65EvKa3R0nKnB4kxbeSs3KmRrNdu6SZP0ZuTPn6GBaZ1DSQupsxq7ZX3sayeRQvhx9eTRt97LOQAk8B5veQNpNmcVMV8gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXQYASkW; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXQYASkW"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6870f904c6bso12550195a12.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779843139; x=1780447939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vvYCYPzBbkk7mEYfuB3CXLyJoA4/Vj0QiGuls4NhH8=;
        b=VXQYASkW+Qf8/YYyuGJVciNwgsdJpKdrLNcFQre9iwOmBG+V6DjdTxx8dyWV0zaH+C
         D9G3cClb3gKr2NqT3fUlfIS6zy803mfdOqdEKxZDfC8FC1o+Kt3CzCHWXS7njQ0JsPXp
         R8ml9UYmYfK//Pb7Lu9KRhp2txALdgyzTYZkxNLMrAuRAQ4BC1+2/IhPwctf0T1EMGFu
         imZGfs6s6JO0srT/n8FJIfqw4pVJH6l1JM82SPHh++D/AEWyM3sSLhYJlJOsFY3I9iFN
         +Tztko2GqTgrZ6s3gWdl/vwz1dgivpoMrRi8Q5stz8zTcMOK/U5g+IYvQjS4cx4VC6s/
         huZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779843139; x=1780447939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2vvYCYPzBbkk7mEYfuB3CXLyJoA4/Vj0QiGuls4NhH8=;
        b=F68EDfexBZKOlWncRYdIC+9ZO3zDYXQRwIwVL0cRVX0AP/G7y58qIvvP3XqjIMb4zE
         RqGhPAflyni31UdcMOR786hviIRsdFz4PypOf3WNTj0PR079ZzCZhMu6lum0/5TyUNFF
         HskEpEpBzfZfpfAu+BQF+n6At6gTgiiAEZLtcLFyHLlAdJzLFu1oG4tfijRwJHhjQ/0A
         Cv1Un2qpEXid7H/XfKvHgTiO65kUX5zNTHVpJU73RGQPSk/f7pIAnwI6TJZxKxjP/LR/
         4Dgz+CjukIKMhg9lh8+8qdlfY0B5tPba3JJQYBtVSEKWwixSI50/RNJj+dV7c5/MI8TT
         xkeQ==
X-Gm-Message-State: AOJu0YxlpbVrDIxtIfMU6Re9no53EQFHdP69b+sWGs+UkFTEHVPRxZJI
	H4X2bKLkMslEmgfFUnoOkVZXCDmQWJ6xCdbK39E4iHFgDXSvZn+AarFN6NuMGEID
X-Gm-Gg: Acq92OFjdFCif4hIW9qP1K5V558tw2gz52e1QPXqCpviM77r50xuOXA7+8All7T6RVN
	5qUVhifKA/BRjgAlt1oHrLNhKXH1JAyGbF3Vj35rBfi7jdZxvh7LAZAXfY+PTfrIOe+NjuuJo+9
	3YA+VF9+K0/dscRzLYbJuoZHkIzaoldSjyJOd3PGTBG9Fy54mvbl3q7EsqLOep7rnUZZ+dCCnq4
	I0RAXvVw2mUKQwQzh148vM/SzpPMYNKlJ+u9FHpKpdro54jbSyqhLM1v9S7opCZOQZyAzTixY35
	2GMnDBLXzRKtXhfOeMXo+MBixn617ZtyfNgLTOt08weEjMe0sL9cpy5zhQn9khZFaquHsy9bvPO
	C9BTJ0FahIhlfl2P7DW1EeID9CN20FvnYa+G6nRvHjbWfsREXn/COs9yAe1QJj7RJKfoBfFjcYW
	y8e80=
X-Received: by 2002:a05:6402:320f:b0:67d:5c3d:8633 with SMTP id 4fb4d7f45d1cf-6889cc6f56fmr11104056a12.26.1779843139108;
        Tue, 26 May 2026 17:52:19 -0700 (PDT)
Received: from rafiki.local ([2001:470:6180::e68d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68a6fb4115csm230672a12.30.2026.05.26.17.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 17:52:18 -0700 (PDT)
From: Lech Perczak <lech.perczak@gmail.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lech Perczak <lechu@hswro.org>,
	Lech Perczak <lech.perczak@gmail.com>
Subject: [PATCH v2] ARM: dts: imx7d-pico-pi: add OV5645 camera support
Date: Wed, 27 May 2026 02:52:13 +0200
Message-ID: <20260527005213.6019-1-lech.perczak@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260524175312.10952-1-lech.perczak@gmail.com>
References: <20260524175312.10952-1-lech.perczak@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add OV5645 camera device node and enable relevant components in the
video capture data path, so output stream can be captured, and the
camera itself can be controlled over I²C bus.

This is roughly based on descriptions found in downstream kernel tree [1],
adapted to match upstream bindings.

The camera can probe successfully and establish an image path through
MIPI-CSIS and CSI peripherals, and capture the picture at 1280x960px
resolution, or even more, although i.MX7D is a bit underpowered to
stream this uncompressed.

Link: https://github.com/technexion-android/kernel_imx/blob/ce8fd74abf518dac0a09e8dcb37f3496f6375124/arch/arm/boot/dts/imx7d-pico.dtsi#L874 [1]

Signed-off-by: Lech Perczak <lech.perczak@gmail.com>

---

v2:
- Confirmed the video capture is actually possible with this setup.
  24MHz wrap clock actually works.
- Updated MIPI wrap clock to use assigned-clocks binding.

 arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts | 61 +++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
index 62221131336f..6a6c3c743b41 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
@@ -59,6 +59,33 @@ polytouch: touchscreen@38 {
 		touchscreen-size-x = <800>;
 		touchscreen-size-y = <480>;
 	};
+
+	camera@3c {
+		compatible = "ovti,ov5645";
+		reg = <0x3c>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_camera>;
+
+		clocks = <&clks IMX7D_CLKO1_ROOT_DIV>;
+		assigned-clocks = <&clks IMX7D_CLKO1_ROOT_DIV>;
+		assigned-clock-rates = <24000000>;
+
+		enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
+
+		vdda-supply = <&reg_2p5v>;
+		vdddo-supply = <&reg_vref_1v8>;
+		vddd-supply = <&reg_vref_1v8>;
+
+		port {
+			ov5645_to_mipi_csi2: endpoint {
+				remote-endpoint = <&mipi_csi2_in>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
 };
 
 &usdhc1 {
@@ -93,5 +120,39 @@ MX7D_PAD_EPDC_DATA04__GPIO2_IO4		0x14
 			MX7D_PAD_EPDC_DATA13__GPIO2_IO13	0x14
 		>;
 	};
+};
+
+&iomuxc_lpsr {
+	pinctrl_camera: cameragrp {
+		fsl,pins = <
+			MX7D_PAD_LPSR_GPIO1_IO04__GPIO1_IO4	0x15
+			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x15
+			MX7D_PAD_LPSR_GPIO1_IO02__CCM_CLKO1	0x7d
+		>;
+	};
+};
+
+&csi {
+	status = "okay";
+};
+
+&mipi_csi {
+	status = "okay";
+	assigned-clocks = <&clks IMX7D_MIPI_CSI_ROOT_CLK>;
+	assigned-clock-rates = <24000000>;
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi_csi2_in: endpoint {
+				remote-endpoint = <&ov5645_to_mipi_csi2>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
 
+&video_mux {
+	status = "okay";
 };

base-commit: 79bd2dded182b1d458b18e62684b7f82ffc682e5
-- 
2.47.3

