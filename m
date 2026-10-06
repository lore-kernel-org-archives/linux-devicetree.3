Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD39440623
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 20:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318351; cv=none; b=dV9HNBH6Ho1LyUzUY7RZrD6mZEglF/NszIkb0Lk4SdKegqpg68TVXkkDSZMqyCwfj5NOVDFbknY72owjgLQPOuXrhY2jDANxK9n/GKNee8k6lTa85ZlTXLFT3qn1ELUaWY1Pf07ZRDlQ/gqMwOLTOgwdw+q/STZFKJRBWXZOwOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318351; c=relaxed/simple;
	bh=eCeuXuHqvmP/UFOQEKWmqU216/ZSkndN2WvM0HwWpA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tvT5lBNQv/v2XShRq+MqOeGebhtxWFkKuTxdYzh1DUaCM9Do521ScYdIeQL2ipNYCRLuJXSlt07R/z1P0L6BGz7kDLgcAzAQ127l1L64jrAoq7uUpeyc94yZaoHyJFpyxsvduVbqhlR9PdISS7pvy0lsIulaJe6OPWw5ie8Wpu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TADF3OG4; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TADF3OG4"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6dfd530a2d5so488429eaf.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 13:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318348; x=1791923148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7tY7hVtYcSGrMabWy9Irpy+9KqMZ8OzQ5ThjhxFTYM=;
        b=TADF3OG4ha+OP0mTziymv+DQ+mjQT9wzoF5Y9XxObdrA2qf3gTH8B6e7p4zRgTM74R
         duZ0wfycxMh6anpw5KkH7tEbnie9gkC2KTMEwnwn4vDGuOkWdRf6Hv/IY0H22h8LT5SC
         e1FlAoT1uY1vAt92SeyZM6qC4xEzOMI/s3d60TgsK7vozTlgApqz/CzRRfA96EhSJqgD
         bbpYt+9Yddx49DygONhcVMs6AyegjFAG8+YvfBGYfzOMLvUhu4BwrP5RvY7kQ6u/eNUl
         8iREXEpD8KngevGCiBWUB/9kPjC9kcUDkWBrpoFSHiNnu6hs6FK3KSFygXm+uUCkxU45
         SqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318348; x=1791923148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7tY7hVtYcSGrMabWy9Irpy+9KqMZ8OzQ5ThjhxFTYM=;
        b=xBHyYmyw5tRIR/YhHbz4OzruTfdoHPtoRgZ/X0SAI7xLFjbXgxadQ8tOcjNNsmugoC
         ClLuFEwRR40uO70B16WNm1Y5zre17g9NqnVIZ+v2OSy9H2QNN3g83eoqcgNbmbxn7e0m
         4lIJxG7P/A/JTtHMVDGD0AWr5JjrYMfi/YmzrFfysG/Riwk3KgYsbDowkG47ydHdPymh
         516bWQYNx/X2MYW1LtoaY2RpXrgBb/Ykt0FAOImRrOWDDQMPrbohv4ghd90aVceiD4MU
         nt0oRGZ+cxEr1z1yPkMEOIuNTwxi/m3O4ag+ATx9eoRiwjfjPAR6HSmd6SYzbc1uy80E
         LvGg==
X-Forwarded-Encrypted: i=1; AKwUvBwMldzerVdjnDdfzT9Qg77tTGQNEleiXEjO+rpkoJ8Ma+aC+2pDZ8SgIoPB1B16IyB8bUn0B12xiELF@vger.kernel.org
X-Gm-Message-State: AFuF++nmkIpKrjwd7wzqy9hoTSN8erfKqI4GNaRTp4zWSJt/Wjo3jjFX
	X2QlpYt+meHJOdx6XmhRW7VQ6eSYt+ojzrle+ZU3vPyLfgftcUHxrJI2npVeWCBVA5K5TKzbF7e
	QTuaP
X-Gm-Gg: AYBFou2kbrs3Eq8e75G+aMZk73HP0D5Y7wnBNGkDCP+mIwyciuKF+Dg9XMw/I4aGDwa
	wdU9wEW/HSoarT3DsLJbTDhvXO/uzNDu3ckEN7bRFdB48POgED69O0UgcR9VOH0J+K13z83HphB
	79uMdOcNapSPpV9br39hrrZUFg/L9iASAdlbMdkpkxu0Liumqbu8/vwzUU0dU4JJMHNLVFbpXY/
	O01rJ5eAAIYvH7DjqeeZMFN62uEUDpqeclDEIED6O1zqjnaeaAA5m0aVEXTZFw6+12/6P9th3Qr
	P8DV/kq7d6BTCZQp2pKvdlsKMvtX7ZrZzovKV4QhC50w4VSqsTBWMtmeD17lQ8FT2gjKm0pgdBx
	+mTOflejFCihrHl0Wjp4yF0U/RidfZr23nhM/lgKOofUB2ythAuJeTyYBzqtOI3v4aaAOnN6hRi
	sVXPbIlIjk6Brr2SAv2UdIULszFh0RA1tF1SOYElKLHtJsUo2+MKqFh1XWD7UeMU55N6xCU89En
	g==
X-Received: by 2002:a05:6820:a28f:20b0:6da:82a6:3a13 with SMTP id 006d021491bc7-6e7a7c16529mr202545eaf.28.1791318347829;
        Tue, 06 Oct 2026 13:25:47 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:03 -0500
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8390-genio-common: add the
 panel vddp-supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-3-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=eCeuXuHqvmP/UFOQEKWmqU216/ZSkndN2WvM0HwWpA4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVkzFqTYwMskBqktBAGaQIkw6mYPOB0k1bRHJ
 +8urKmt18yJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZMwAKCRDCzCAB/wGP
 wI7sB/0QM+uNZLoX1Jp8NLb2nJn7ClzLVCDOZXUqzT1od9Q9IR+Mai0hZvJJPbZyLWuWg+QKTGS
 NYg/wSz3bQw/6axBFVzO78Kh1bFlH+KP3j23zjsC9zt961U7k9ASdv0XJvU5UxSFoRHafe288eh
 yn68IMEfzt9Vm2sisR7roDYZpx6Aky7yIseJ/bRXhrXBhTQK+GY0OsZJnJUYrkmA08FBm58ZpFn
 lEEDS9l/yFPMFVQbVyrf1uNSe7s5UopCm0G94dDiFSohYZCxVZaohT81NiK3hOyVB9/fldAJvue
 uJUY7G7Yg3bPSW5541+85rKJzL/TEonFNaAps1j54drOKSST
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add the vddp-supply of the Startek KD070FHFID078 panel, now required by
the himax,hx8279 binding.

On the Genio 510 and 700 EVKs, the panel's VDDP input is on the always-on
vsys_lcm1 rail, the regulator that vdd-supply already points at.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..449af8014769 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -324,6 +324,7 @@ panel@0 {
 		reset-gpios = <&pio 25 GPIO_ACTIVE_HIGH>;
 		iovcc-supply = <&lcm1_iovcc>;
 		vdd-supply = <&lcm1_vddp>;
+		vddp-supply = <&lcm1_vddp>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&panel_default_pins>;
 

-- 
2.53.0

