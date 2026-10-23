Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756623;
	b=vjO1L30y19BR5/mtT88umZiKQSh9vTNuecjpK9ZIMDJqkUInPUeWQW2GTRK7947Zj0DS
	 2B+poEbfcTR0n+tNVkU5W/+nplqwzXf/PGNtitlTr5ulk9jGZs33JLZDPsyNaS+6C4ht6
	 1dD3EQSDM5rLB7lrNxCco7bLDVcquhmf2N6t8kkBGa2GEJ2oQ1uD3IOMHwTd96vxkfydT
	 xFgd9tPViOLHrr0yjCG+ao6ggjxLKqS3Bu6zgnjnBaas+kP8GPpqnOmsJgA2i+OwvEfcn
	 +gKLSy5LPitbU8Kb9ZvKYPOJq3ClkNOyYjQCOrFJxLHcP3FKUrQbRdNIRNfdD1OvrBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=beziaboxHddHsV7QGLlhu7YZ0ZbytuRbl01hFg+RyZA=;
	b=p/0ufBOAcS4gfjt9ekgo1uHiHVb9Jy6ZQLdUczLNCRqPWADR03xwGpBGOufPsdPPJw18
	 MvP0LzXtVt0bXvJaCHdnbDC1uc4A9U0cQvjqSjdM2teAkUZFHK9Bv7MAqf+qMnVBbF9f8
	 wHFzqVZZBp5jCNgyn2/Z0gGm66cXhNpN5Y5/YcmNk5kCSZPxeeESNgdzXjspn27Zowrfk
	 v7i/J31Du1mcL52qMdN+2ygZBgohlCkyLitjIUdjCUvoZNwHBu77GeP+uE5ryIJuPUegv
	 LcBEH+1Ev6+hjKJ5VAWfXiSV5yAustwuPZ64zXkqi5YUMtP5T1QofgP7sy6CWcWJwFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R08cRgVu;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF52606A324
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 11:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF52606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R08cRgVu
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df8fe8513so709243f8f.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 04:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792756621; x=1793361421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beziaboxHddHsV7QGLlhu7YZ0ZbytuRbl01hFg+RyZA=;
        b=R08cRgVujMYCNwwaSpezrXyElYrFbSSh50mjerNTeIqtEsPGDXCDoiaVW81rm/V5XQ
         Ypp/BF3NA/Ojg2QyCKijfD5JyVoXUKoWv3QzL4sENFXAx/8eYCiMNheesolwV90I71Na
         cXDj0Sv3uTq1LuNdI1iaSvWXkhsHgagppPTDfPnCVwIsiO9Ie54b3NBVvN1B21WNJw2s
         y3Y0YghLi69kp7XahCtWjLGBEZjRALyWT/AJCpHOPfNPYsdM78VF2mt+7rcNH0OLGfAb
         AKKIMgVYBrGNlrCMe6RjJ5EUIPxctV4eA06ITYqa+ueCX/qwhnpCS5iVgeDmucvM1Fnu
         YX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756621; x=1793361421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=beziaboxHddHsV7QGLlhu7YZ0ZbytuRbl01hFg+RyZA=;
        b=vZW/H53iK5FqBRZ1abwAdVj0tTI/l3MeOEEPMmyXUDxu+jrpmm1qjiYnxEI8FKdSC9
         YkIf/U56jdQ1h4wZ5u+n9OCq7A8ZxQ4AOSbv4O4iT6GXXNcs8vR9U0BJMfvtWqZbi3pK
         90E0kb3BPyrgcWCXYGPNFwjeMN5nNTiAoZIEL/GV0VnWWCKCgQydqadqgCwRBsCtKbJ3
         vYthWzpurDZHdOGiVGZGYWlKxjVrpdEQUagCdF0QW58LUIIDJvpbDgtRqg4klRLutcn+
         BupHLYCE2CTUxm0j8mvcCpDcDSsWzH2Dl6bXR4Pat02X6IEyfzbHJ+ud3JCNJ6U6flTY
         YahQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/zRxawZdz6PLw8w3H1aElkxyfON+H4ErECsN/GcuW6w9VX8+R9IZXDL5p6+pU5x9qA+uebx8PNIfG@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5eab8eE7+4fZRQm6jr84jraWKRawyHXCOHvsI8X3x9EsiKbRI
	92/edqljHUUSpQpwZpOijCSsO+zx8KAnj6B8J68h4YrdlAPTGmhyMmZGbvDb3g==
X-Gm-Gg: AYBFou3jCI+geB2Ca/V0P/i4R92Ll40lhKwAPy7AAgsz/2x+kGAEDhqrI/qyjERydgC
	cSUylV0xlSwgRA44J3nWirsTQGobGysThysK6qJy3gEyBP1afIXiKgXkNqIMGtrGKZFWLXWrOcv
	qkdacmd5ckamk5Okws1KENF1EwqXs+NffF3bCKqmReNQ42s5S+kmiCZy/yy6u/klCU8ScOTUxbc
	EGG3aJPtrj1dP4xc5Bs9SH+EiUsqkDHzvPqStTautaWi7L+GBXZfHUFMdGRTs0Qrnl1m/oEaN82
	vFMGuSbhVzvMClrY/98enE1QCeYnojjnwu0xKu23lZEsX1St1bM9Br1s7kZmXsot5bdmPIKR68b
	QN7EIVNO+F10F23aytZwlpRDFzFFOD76U23hv9qRqqQ+nQbG+EE5VZU+XD23BpEp/HjxkG9Znvx
	kfp/zem412DXAezjipxMiSp/sIzYYJD/az2sujNeSYNZS5VDIphrpwFywbXQyHA9WAAjhgPVIlF
	Oe32sA0P22S0E0cdlOTdmRS3Gqcv36VkoY4xH1ptGIvf2IoYx8YSwC2ZVx7VjwMj5eBqXg94APx
	XGM7Lj19yG7t5QTBLRXQ0bFHrm3bfKWCTek2P3uFodwsWogP0xaGvC/+GaSt
X-Received: by 2002:a5d:5f4c:0:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e3859f31dmr3069710f8f.18.1792756621040;
        Fri, 23 Oct 2026 04:57:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e380310b3sm5076321f8f.22.2026.10.23.04.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:57:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] gpio: 74x164: add support for 74lv164 shift register variant
Date: Fri, 23 Oct 2026 13:56:49 +0200
Message-ID: <20261023115652.700765-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023115652.700765-1-ansuelsmth@gmail.com>
References: <20261023115652.700765-1-ansuelsmth@gmail.com>
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

Add compatible and spi define to support 74lv164 shift register variant.
These work the same way as the 59x chip family with the only difference of
not having a "storage" feature by directly changing the outputs as bits are
shifted in without having to toggle extra pins.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/gpio/gpio-74x164.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 5ca61cf5206a..46562c348c9c 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -181,6 +181,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 
 static const struct spi_device_id gen_74x164_spi_ids[] = {
 	{ .name = "74hc595" },
+	{ .name = "74lv164" },
 	{ .name = "74lvc594" },
 	{},
 };
@@ -188,6 +189,7 @@ MODULE_DEVICE_TABLE(spi, gen_74x164_spi_ids);
 
 static const struct of_device_id gen_74x164_dt_ids[] = {
 	{ .compatible = "fairchild,74hc595" },
+	{ .compatible = "nxp,74lv164" },
 	{ .compatible = "nxp,74lvc594" },
 	{},
 };
-- 
2.55.0

