Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775871;
	b=OcNbgDbsdVaCcDduB2J+jHEgKfrP0dt9AyWZzZKsIOQftvnK5vJGDp5s4A8Gyll86UoR
	 qWhncI7sEE7P8bFH1J5agtQoe6dmzY+HOS1M2s9DF3jo+Fn5PR2168KRV5EMqvAr0X+Oo
	 Rm2hdCNcJWfrQHod6M0n5Vv3MxDqtPHBJmXYw/+C4L+9VEmxEhN/CMB+180kEJ8bexZT9
	 s+EXf/yYO7mga4rUEUvoNv4+9rAmGphZOW/OmM6M7rzrwcXEEiCogDdU+MKYAqj6wXurT
	 1KLIyE/f5S3+pPktb1TCssKoA7iOSzDGH6kQlMjwwWt9dxz/PMR34B25J1yAnwzUN0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
	b=x1kf03AHoFMXHbWKFul5sl8BIYDHS4d4w66hQ4gbYTZvva1eeSM4K/1lOZ4ySnbgmnNt
	 dSAIq/Tf6iFv01t1169fANznq3Dnmqay3hdV6YYPj03lgqom4qN95flsnlKRYCZmxlpzm
	 uXSIe/e1bAoI/s9M+Y24YbR6dzUXZrxByTlz9Qa+Iao1qYqEGVZWByetlBuiwEArzhdb7
	 9uXDDeNutYlm1JFAwqn335g59nE1emGOgOq9lbLXYfvL+1f/5UxFVD4qo0DJuU/a+I4Ya
	 LhxGFmMY1loi5ArxbOjkoL+Jiov1+mtpCqrCh2CzLmgi0js1lT9t9wY8hO3r2o9FPUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="Ln/5wYF2";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA0606A32C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFDA0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Ln/5wYF2
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5649116f8f.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795775869; x=1796380669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=Ln/5wYF2CDkn6CiIxcamObTnXQEn8E/T7z7PXF8E8mdvNkf9vXlQpnp/CPUEqrRtGi
         4vrguc8TAG6e28G/6wvCEEegPXuwyfBxhn9ZhtYQgtP/Aw5bQhYqmO1vlEZgYR/whQaE
         PVg0rQzGph9S7FHthq/NCBN657o08+om93rFjBgEJaOXKhKLoOBMY/d1tSJAtTc7nUzp
         xxf46eilrTn7Yjw3M3X5/gXAAhAC75YvCGI3iAM73P/JPRD0cQRgsYp4fXAJCFQsJfhG
         ZS9e6v9jgvt391jv4zJXQjNz8lEcEJOu9RXQ7wNXWjV7HNNe+UD9ib45HryPCS9tIDFC
         +zIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775869; x=1796380669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=2c1zk9S1TrzcZW468mrkV5bU1HnyhI4I/znBCFX061J4HVfKh/UcJCkCiz2G+oep7a
         JZ8+AEBMZQ+pub7FWIVBDV8px8pyQZlJK4W5emEL9chjpYQIft6kkeIlJB115h15BI7C
         w2SEJRu+PX+pKmu4lrV5mLIw8e2NdsCFivfRx882078Bq/gGkymq+gZKNZ4YTC8HAwjx
         4f5jQcWdZO9aq40UFhY150KtNVk91n7rjATwoAQ3Ffcf3S+Ny065sznqyOaPSEpKxM3X
         zGOKLEovWSG7/ayn+VhuXn5rODdvQSiB6ZapooTs5e3GMNkEuQuZY/FfNR19TT9pJwq/
         0wBA==
X-Gm-Message-State: APuU4Z9+n9+CbGDW1ItTqDJCNz7BW0hspxM8cbb22Lh9NGQ5sAfTGXyP
	IldYHYIFX3O64KijvErdiB7QyxvxeLNBpNCBKVQ0BJBMH2qc/WnmqFvtfk1Nesj2WB8=
X-Gm-Gg: AZFdTZfZ4VSJyR5uldJmUpoEg6DqatiNj2r7x/vRze4ni6pytuxe4JoSFAaOqG18fln
	2iVNC6ifiOH5SNnU92RDZ+mdJT0owUxU5K6C1ryggDIXn622jrupCqm9f1BNT5Hq9nG3mx+Pt38
	St3vezqD/+A2qGxVxusvQ2OeZvqcY2UsdNltJ2Bac/hjsLugPuCnLpthqWGnWJFwJ0q6Ujr8ltr
	20EAD8Cjuk5roQsm7o+87ks8X22MgNpW39yirICXj3S1ew4IGiZBAg/zqOEo5X3y6xUjmZnSdUz
	7XVfNL1SPQFq0f1muBMSWllClIQxmQD6O0ySgltH3fXK0lFWRcR8g2dGuudlwI3raQPcsXPw1Z8
	5bKJU5rsZeLL89kDNeIMGl4IXY5dbqLdztYjpnWcrxrrEpJm4rp0KMGY2a1aXq5XKj/S8mCiHfc
	0vu+jHlfHnnoCdvU9fSMpemwLNoe7mXRgp8K9M8HtmunXPmTSI4vXchriJ721xFir3r00jQAwra
	0YCDKmDjhBbxKdg4t4XQR/GsK0GosglWjk9Q9IPndjV/AZgM/H8kobhNTvy076pHSaCURdRdib/
	B0T0dZWsbnUjSmKCNiVzygI7DJfeugEPU+6SedXyjZDGEnZr
X-Received: by 2002:a05:6000:2409:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-4aba56f5488mr45494272f8f.0.1795775869247;
        Fri, 27 Nov 2026 02:37:49 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm46609111f8f.52.2026.11.27.02.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:37:48 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 27 Nov 2026 11:37:35 +0100
Subject: [PATCH v9 1/5] mfd: axp20x: Constify axp313 and axp717 cells
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-axp318-regulator-v9-1-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6WS2gG4eQGvXIRMEkRovIFW0AaWwhRZ2tj+ICuFq6Q8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcsVXV028an1ofFvHFk/HpnXt3P/fsXev2zlxZ7dUOs
 YDPi3be6ChlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEpDsYGbpu7Tj6oM/doVbn
 wJWN++XbV5faN6q1Tf69ot74o8uVjl2MDEsLpQ6s/sLV+Ul2e+2vLXk1B77N2KWs9aElb5o7a+2
 ++xwA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

mfd_cells array should generally be const and there does not seem to be
anything against it for the axp313 and axp717.

Constify the mfd_cells array for the axp313 and axp717 to be consistent
with the other supported chips

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 50df66de24e0..4d770e718716 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1055,13 +1055,13 @@ static const struct mfd_cell axp152_cells[] = {
 	},
 };
 
-static struct mfd_cell axp313a_cells[] = {
+static const struct mfd_cell axp313a_cells[] = {
 	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
-static struct mfd_cell axp717_cells[] = {
+static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
 	MFD_CELL_OF("axp717-adc",

-- 
2.53.0

