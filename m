Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945198;
	b=lzeozKPXu8LzRiI3TfFDmq9UfQ8aN9Hrcm+ReirHoQOsnI+RcaK53JGjYhJ72Dn8rYtI
	 +NgnTutN/BaHxqjVcWrFLPwVCAU9nDftG4Ti6K5xKx3rb0xBcmJk83CHJfYI31sqvFPh+
	 67ibGBRi4x+fac1Q+MGfMOixFkPcKiMoyD8vdG2+WBpHw/K6SkvVKZo93mdI9BV/S/P/L
	 Om08IQUL27M5SKwixRMWa3WYcgVXKn+5jfO5KlzuVZeWu7fVvhJh9eMDEEmXOOj74HHnS
	 lQqA6b3Yb+afBLEICkhmn/pftuUhL75ot0Ta55w591u8ra2DH1NtYdj9w65O/cbdJsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z7uEkdCEHo6cGHNCskGF0mF+TjMw6lWg3MiymD5XnkU=;
	b=S+UIYg25LSNehc4uU5cJeXNX6N4rfy0je9jd/gmZdrT+FhNzS0Sd+VHsUDPJ88S0rJzI
	 96jC5QiTzvMJzVrPigJuJzJqxyuXjADOCNvz9+lxGSMRW4+TytEbY5bvm8yuZ41GIJOD9
	 74FkuK/blaKz5oM2GoZMhIEtSwMDTaBHOIiHweivedbhselIfGCA/NB45Zcl2rrQhe9GZ
	 QBvaZ0wuZVWofDtMsSG7IwKUfKkiDlrkrLoPEolW+GXdz5Wy68EW6jSw4aklm5KWtVVj9
	 FpeUmBDNlqqxAro9a6XIIFkm8Qql3PjAk5zGa2YFQaCNU8HcZpTd12DzECL0e0j57Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ByGXx7dG;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B595606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B595606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ByGXx7dG
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so371046eec.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 22:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793945197; x=1794549997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7uEkdCEHo6cGHNCskGF0mF+TjMw6lWg3MiymD5XnkU=;
        b=ByGXx7dGgJS4ocl8TEpZ1RHmCoMqxNLbiFHaGLZxznVW3DpYbIXwk6F2wGhZMcMxRu
         Vxs1y+zSHEg4/+ctxyjyfHciZ2XY7NyiL2KXFKtjORZXIoiSeusYgtPl2rIk0KSRUNms
         NYiTM0iaQb8sfkN/ZMtb4ZuaXgqwDn6IyfLKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945197; x=1794549997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7uEkdCEHo6cGHNCskGF0mF+TjMw6lWg3MiymD5XnkU=;
        b=1njp2IW+NGe94tuMC3s86mvf4hv2XyCq8A1zSnSMWnAWZlhz7K7uMOhHi2MPX9Kl21
         fqRF0SoOHMCO4jddZTW+MOomveR3+ogiUnbtbOnae7XCaTbaLoWZqz8BD/EvUm5+qu/3
         v1CfYSFuq+fimHbnOSIDV5e6l5fWFyeV7xlMf77s6q5iyk+3++04YxTYCf7mpflQJW+d
         z23s0mAD2+PvTunBlHjRg9RbLwfgcDbUB2UOo2o2sdqw+3nCwX2yp5LBqq24jvuJ3cpl
         NQFvIa29e9PQ1Lk/2Z34VCZzbChG9Bz84BEjNn0twPyi5eC5x2SHW3ByUejNaCdyXItj
         bfTw==
X-Forwarded-Encrypted: i=1; AL+hErGRQwpyXv8w4dZ+EnxbN/lbMkB9p61/STqoFxKpNE2JmILobp5qY+tLJLZisQseKqtKmKZ9Mfg8mF07@vger.kernel.org
X-Gm-Message-State: APuU4Z/TUQKVoGvseNrWVfdImPE6/XEhgMKb23WJlKypFr6z32OV2u8w
	XbdyFuGQBBH4b533x/9UTFWTyzptldTnCHAM5FBhvHvCrFAc6c6PuUphddH6bIDWBA==
X-Gm-Gg: AYBFou2z2ThHjMEc8ITfdnd3kcJ6KrHOy1lWNl24x66m+DWeQU1eqfFjXImKX0fD+0C
	TkCPYP5Qxf0mtH+z32E7rlqxFqsxQ1VNKdV/Kt8pDsN8KPTdunCXCROg0HUHypVn6V3n/GX2+54
	1IxFZSbwodDkj0+PrP3FlG/qYz4NDjX8hns7xAJ2QW3LLhm1xJWvJ/N79RU0rLbKXOyP0dsjilB
	ZyANLXpDVaTNL5XFalJFqyrnVkE/ljRx/boQnw/Hds9ce5MWEKiOpmmHbadp/co+f6VcxzIMzXp
	2zSFW1YWOGC4CX+bg+PGYIx8WftmDdjazijT6ngeHj1/MR5g1rEt9ush0xvUw2ZjbzRHFFSyRGp
	Wwe+MQ7S0judrYPfsHabdJ5jwA14ZQ7yjfl2PDMd5hNlN4HBqH3tzWQyIg8FWLdqB5F3LRU6Fel
	tBfyTBE7aRItZaSwSntcdSPz0Ji5uq8xqUb+MIJ/O4rzKxe7DimL+X96x7elbj4PFvhV3mOfK76
	aJsVXMW6QEPUx0BGTgIE0gp0BJO8ZQg9JXIFtDyGuudWvcH5t6G6o7MbCgOq1/9xcFNa8ksasNT
	0cTsrcW6d1on2S4eEt1J0LDOofRF8+b5TThGLc2yvh3BZHJfgJ/ERq6zbCrZLA/qaq+IbcXHzew
	0GK8ZFLNSakTA
X-Received: by 2002:a05:7300:b0aa:b0:36f:4d62:2884 with SMTP id 5a478bee46e88-36f7691a412mr1986502eec.30.1793945196453;
        Thu, 05 Nov 2026 22:06:36 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:f73e:d73b:c0da:5b05])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3821809eec.6.2026.11.05.22.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:36 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable pin mux
Date: Fri,  6 Nov 2026 14:06:19 +0800
Message-ID: <20261106060621.2706658-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261106060621.2706658-1-wenst@chromium.org>
References: <20261106060621.2706658-1-wenst@chromium.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"pins-usb-hub-3v3-en" listed in "usb1-default-pins" is actually the
enable pin for the USB hub's supply regulator.

Split it out as a separate pinmux node attached to the regulator
instead.

Fixes: 7982bf7ec2e3 ("arm64: dts: mediatek: add device-tree for Genio 700 EVK board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Compile tested only.
---
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index d10ee1603103..63b4af476959 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -216,6 +216,8 @@ touch0_fixed_3v3: regulator-5 {
 
 	usb_hub_fixed_3v3: regulator-6 {
 		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_hub_3v3_pins>;
 		regulator-name = "vhub_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
@@ -1249,16 +1251,18 @@ pins-vbus {
 
 	};
 
+	usb_hub_3v3_pins: usb-hub-3v3-pins {
+		pins-usb-hub-3v3-en {
+			pinmux = <PINMUX_GPIO112__FUNC_B_GPIO112>;
+			output-high;
+		};
+	};
+
 	usb1_default_pins: usb1-default-pins {
 		pins-valid {
 			pinmux = <PINMUX_GPIO88__FUNC_I0_VBUSVALID_1P>;
 			input-enable;
 		};
-
-		pins-usb-hub-3v3-en {
-			pinmux = <PINMUX_GPIO112__FUNC_B_GPIO112>;
-			output-high;
-		};
 	};
 
 	usb2_default_pins: usb2-default-pins {
-- 
2.56.0.455.g6c5a503b38-goog

