Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604182;
	b=rSQoDw/ghARTFwCwbXR5GI0Nwly/496sxEnWhVkgF19DnSOEOzk2PDkEyQ1Dv2LkEfwq
	 SKI3cGocURZyowG8+e9zkd9ofFdXTYXCl7rFAquK8H+YEctPK66JI2/1lm8bdxjkvuiHU
	 PnLlfCKnB8tKJMUar6JXzDYQIQnSeCxkGNKdo1W9c+OIKGzB+awEdqwtajOwHHT5Av6FF
	 2LC2cjdyV2yzlNgYVhpHngkGDy+KS9wtkpSfPI6CsSP4lrXxD5vLnsv6afbHNkq24frbH
	 Nd6aWg26d1Nv/YHas0j79nw/PDSjib6fkLBB1C+Kc+P6xjphHP1V7K86Z4ebPq0ZDVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
	b=ZqL9ZNvBcEC7n5dgMjiVdYv61OoeUjLW+lZjFEn9xfWapjcio+zcHdaVJtimq6pgt45S
	 squrmtUDtebd/3U/2ye4pDChavJV0rfucHbyw4GQDQzECZ9smIQ+GikI2qwUqPCQx4wH8
	 /ZH8+Qi9jsdluBE5YqANtQPy7/+079lhHygwHQ5qFmbyKP/gz+qabbn6r8qUHOMsf6bh8
	 Fe7BT3feVx7JFE1poI8+B9c71hNPHU9FJ9E/KNXNsCA8X9lZWYvHkxY0rZ53asLmwFAKN
	 dml5ud9OfyUoFi+9BthyjTjkUX0r1HRMgdRNEb2Z3yjcFNdAL7QcORbQ9Y9oUxAx5/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mL4bWoI1;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0421260A2611
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 21:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0421260A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mL4bWoI1
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37600b0db49so2205415eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604181; x=1795208981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
        b=mL4bWoI1mpeMMgydl8Xi9d2krbL4oJdwH5dCeLzhcLNDqmkJeCUaFBJPwG5csoTBCA
         yQosIHGXgtHK3esf/hwQtiVpDpS+LeYZsaNYU9xQunGvp3H22PUO/6SMho5UbuXCpeCD
         weIZd7D/MGUjs+KEXZMU/C1/MVZILtvH4SRvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604181; x=1795208981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
        b=Tx6SGH/IaAWgVB8l7NyFbdtCriKb/xdO+0EZU9vyf5PCviHu8EQNxZmLlasyX/zj32
         sm94M9qK9nI9MCW5+3t2T+QhVNbrzAL0qURg0//PVDtymyREpsLDi9M4FwcoW7qtheLw
         1ck118VLyWkQkGaNzMkts3jJYEGlsjuaSXt14E1ZTaRqLKxXL5coKmQW6h1TqOfaWrq+
         yd6mHV/QWixwTUuiy79I2NDgyvupeDLss62KbvXU9butRqGBzu9cyWXfCsbFfo2jCWQi
         ErnAZzCjfxURoPElhKjTbckFKGhddkkpXz0iiO7B3aPz6IUjvoh/sd7WW6hd+mykhCMM
         RspA==
X-Forwarded-Encrypted: i=1; AL+hErGOGLMjdyEA2az2ZTpxvgVtdD29BNVBWdgU3cOOh8UIw3szmOzWWcJqq+gmq5AMxCm+bhQ+2pvJDDwy@vger.kernel.org
X-Gm-Message-State: APuU4Z+VZIdTMjldutQ0a38Mf3PNJaRUmc836yySOLmrFgrjNzXlBTam
	EFvAAXGzdUQfiN6RBfY8YMF+eAJfGcqEPRbQaIdNssIsIWNH3ZBQzxl2Cu+ogV3Psw==
X-Gm-Gg: AYBFou2+vdIy6/rpb8DHrB+gzWJ6gG3cka/EEdiACWt/AONXBQwS6gHAhupOo6JumzL
	NLSnb0Gz2k5Bfo+IKbd5GiDeZwbTJvWARhdOoOfu7lLEN3mamwht1QGWTjXNET2KsQu9CH3YH60
	m9BJDJ+uPqsCU5ON1c4zPqk/N40iOzdSEjMN9zNBJJ6hbpOEgth9Y0M9AS611F9MoDyBCcC1PgC
	t/sQwM6wR1b6ElTLmKYy+DUegGpgRuG+6fS5owAvQa/9PRe4Y42pEV9B+QCsaArCc+jIkaiUe+p
	6D7I91hQhqe/R0sTQBPYVvWSorxDrujkAtqqHUToNlQ3f/K+1YbjCtHdgtNkNGaYeT1ZwC9JKdB
	NlEyuC8PcJ+r6br2xsu6rwECRuywZf31WZvD7UKajpQd/kKGIQdek3bv3SK6Fe4gGde+a+zog5y
	HE7nxJaH9Yz1VKjK4dibNF5Zl+ZqnYee7WXhDYK5x10KZsnRJf5S238zyergiXk01+/U+U+1taS
	CJ511N1D2pDDl3F2+zavew5rCjbcCrpjicOBRYnNABFPijT/p5YoQLHZ1ElueE6DE6ore0cZS7A
	b991liJhbnU6XfXrbx3IgP65dvR8eLQlhgWPLNkcu6A+a6I5HKfmP4bFjGcLieC3yTkoCZTk/GT
	+RJOrH93cPfwvr7HELCBI1i6hqOAMoAzi6w==
X-Received: by 2002:a05:7022:4093:b0:1b3:b455:93c3 with SMTP id a92af1059eb24-1b5030cf269mr3095118c88.22.1794604181056;
        Fri, 13 Nov 2026 13:09:41 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:40 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH v2 4/5] arm64: dts: google: lga: Add lga.fitconfig FIT configuration file
Date: Fri, 13 Nov 2026 13:09:13 -0800
Message-ID: <20261113130858.RFC.v2.4.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a FIT configuration file (`lga.fitconfig`) listing the Google Tensor
G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`, `lga-frankel.dtb`,
and `lga-mustang.dtb`) along with board and SoC ID/revision metadata in
each configuration's `match-1` subnode [1], allowing the LGA FIT image
to be built with:

  make \
    FIT_CONFIG=google/lga.fitconfig \
    FIT_COMPRESSION=none \
    FIT_FACTOR_DTBS=1 \
    FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
    image.fit

NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
image. However, packaging scripts will be able to take an image as
built above and convert it into a format that the bootloader can
handle.

Each configuration carries a `match-1` subnode (`compatible =
"google,board-id"`) with typed `board-id`, `board-rev`, `soc-id`, and
`soc-rev` properties [1] to identify which configuration to use on which
board without polluting the device trees themselves with loader
metadata. Having a structured (and upstream) place to store this data is
part of the motivation for landing this FIT configuration file.

Side note: at the moment, the Pixel bootloader can't handle picking
overlays based on the `soc-id` and `soc-rev` (it only uses those to pick
base dtb files), so for now we won't be able to support boards that
might have different SoCs. I've included the `soc-id` and `soc-rev` in
this FIT configuration in the hopes that we can improve the bootloader
in the future, though.

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Replace checked-in lga.its with a compact lga.fitconfig sidecar file
  consumed by scripts/make_fit.py (Simon Glass)
- Move board/SoC matching metadata from the configuration description
  string to a typed match-1 subnode per the proposed FIT spec extension
  (Simon Glass)

 arch/arm64/boot/dts/google/lga.fitconfig | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/lga.fitconfig

diff --git a/arch/arm64/boot/dts/google/lga.fitconfig b/arch/arm64/boot/dts/google/lga.fitconfig
new file mode 100644
index 000000000000..fd90b85c2fb6
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga.fitconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+
+[lga-blazer.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070406
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
+
+[lga-frankel.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070306
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
+
+[lga-mustang.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070506
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
-- 
2.56.0.611.g1030f0b940-goog

