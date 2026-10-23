Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778373;
	b=am91L8dxoBCxSP9Cr7+G6IdI5HymmMJSqRCzWDNU6Lbt9dmbZi+3m8zVVAuiADNiNa/t
	 EYuwuFKTCu2bJkjnFGq6b33u6o4GVBr+nn9BQKuAKM9PD16iAn2I4609Urh/4/8IsvNLp
	 P6qlTQOcuXMi6u8+B6pUmGfzwLg3o4a+vh+JgrRZsblVMf8eYrfB6IPnYTuWhJqgJWZaC
	 PpBRvJx/+whhvnpVbJms28gF1ug82WlQSj7kMLVKgZ+cIn5H+20PieFXH2UUD6p8+eHX+
	 0q/bAoI/zTa4QpCdEIsqsWwGL2W7bVwD//Z89JBHWEIOv5eTAVN/xVy07AYAfKX6/XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3LNah5Hnc+oQiOU9iUKOLyS8ViKTo8ncRQPeNAx1Os4=;
	b=RITuiuzhuXzkC8nJBrZtoj7cvSX3lzm2UF8DjqUHm+b7IAAJ9hmO2bbJEm5mzi/FFPLA
	 cgYqlLqLqanjNJVX35D5vWtMdt1SU+tAUCzMOk7rgz0ziP6/jBRs8lpZQPDzFOt0RyAB+
	 I6TYUrqxxHihEmk+LplmzM0Ynb9YMrnayDWJFEjAAXo2YC8SSwObmCRQK3euwi4TVMMI3
	 R7cBJ/Klwu7sChHJdylwXBJAxRy88o3xqo6AQUOO7sJD5D2fSYP4Cr6dmzMnHqehlPX2L
	 ll93j4pyLiSCv1aCLXJoA0Q7YE7jaRQHW4eeJPVnJHxboERj+f5ujk4FcgpcfHlLoog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OEbZgL1k;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7615960A2623
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 17:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7615960A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OEbZgL1k
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e20edd106so987623f8f.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778371; x=1793383171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LNah5Hnc+oQiOU9iUKOLyS8ViKTo8ncRQPeNAx1Os4=;
        b=OEbZgL1kulvSCIS4M18Jozd+OJn2wgmMdz558trPyD8wLQqmEhq4RCR9o0T1MX89nD
         HMYKXZ5hetATa12c11uKpQGbcYiyf4uupXTyEARTd9JRXS20WpY55CrrHDU+BnDZTPM9
         fGn2jZVVmV8nzcdTby2mitvPxU4QT8Ff5wK581l0nw4EiwrnEmuO766l3cItnCnEjybp
         h6akcUcHoLxgmhx+aWpaj8X36ireJPrN5YS9Eb1DdlrIAEecZMRPiauctTzqnVbTvMXy
         KBk/0sNqn3rJBxGMztCDm/kxKzMJSGinAxjMUAG4S87Dmbbuo6kZhrc/ukc/l6YH9VQF
         mWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778371; x=1793383171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LNah5Hnc+oQiOU9iUKOLyS8ViKTo8ncRQPeNAx1Os4=;
        b=i/aS+8ZPv5wF2g4B+7ZgVC65O/e8oTexBvLzNHqNYmzmwmV62abVTq4hZEluWCAHQu
         +GJa2suM0qH2RZoepxq+NH3vT4+wunyXmmCCacJEohnScO72ArxPFw89jCiKCXSkl5jN
         5JHoWkWG54JdAoPR7ARMUzYAzRSwROQveuxQ8ZGPccn/CapAhw2BoEk9JYfHxuITmmuK
         +HzmRMnMtr91Uq8tXVKG2nrdB2tHiV9eevaxIJoApR14UqkKE9OHf0XpCytqHNiDlKfH
         6xgcu+mb1OmZD61aGTPpFG9DcC4/jheljUeFq9Zv4ZqZjATynYnhfpRpXzSO+HLxQJ8P
         GoUA==
X-Forwarded-Encrypted: i=1; AKwUvBwc84T6jpQggT7nou+KvkeQqr0iGBsLP2ptYwRkVUf2r/lyrlA1k2Jmijsntq2XQVh7PPQLoDs5luWZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJH2Ln1ruBHcF5XzOywV+9klF8V3v3HfuetUK/4oBkCvKD3fLIz
	q1CFwd6ybeCPQpKkBnkqzdtEDiu7LhWlz8QmmK/Fp03OLbbuh02pM1Fs
X-Gm-Gg: AYBFou0nLxTfaMppAQPNNYq+2QKHx69nWyE7ma00z/iZnYzGQgw/s0DHkkFB6EsYO9B
	wnfVBDvANyhovsUDyHS06BXdB2Ddu8orHhFVElrA8bN7gUl0IlcijBmYC0R/X04PIunTV4Bcs0v
	t+TnsMkWmTbae/d/u4l5nFBEEHa3W0GOcq1hfXK707Qso0qvkyEMGVglb/m4rJB5fNfws5gwBfD
	A3Uk5znggCXDzsly80wIu6mOAK/Q4w6jXNsKlkVvgfIzVuucdzZtJ5mpL28xHeJXdnWBgQhkUfl
	n0zXEX7Vd/D/8o8RFYYQT4rmhu/vNAhBr4bPwMhAydWCjmMPUTlPxnql0tHgYVykNHK1feOWY5l
	C1eh8vScFOccEbQdC/biqDYSN0J0YrAwFk+gjX41AKXx6J/ldCMelyHJZu41HIC+Z2GJ0I8gA/G
	G3mZ/bXCBFtAivDFmpSZQnP9FTNuNXlyYt+9BoO710DX442RXPOu0eoC1pM+lg86Q6KcPAUAEqq
	4lIH7IhT9KPZhpaaYElGMqYKcNEdQx5MrfMqvcx+g/HfYSCDE45XURTRkSQfU3cVjHfyM5gccA4
	GeDonn9wVP50UGpQL7pb/qXlrPJQHOsvBqB+KSRfWZGx2MIGDY5X0KMVXrUpTRybUteB8pbwK1A
	O/ymGWrm2ixLuVpz13nL1mYvdfkIBB+ASm7xJ99++tnNbqQ==
X-Received: by 2002:a05:6000:41c8:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-48e3859451amr5267524f8f.23.1792778370853;
        Fri, 23 Oct 2026 10:59:30 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 6/8] iio: adc: rzt2h: Prepare for SoCs with different ADC info
Date: Fri, 23 Oct 2026 18:59:17 +0100
Message-ID: <20261023175919.160103-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for RZ/V2H(P) support, where the ADC supports 8-bit and
12-bit conversion modes with channel configurations that differ from
RZ/T2H.

Allow each SoC to provide its own IIO info structure and use the
chip-specific configuration when registering the IIO device.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- No change
---
 drivers/iio/adc/rzt2h_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 94dad479abff..dbe82939acc2 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -68,6 +68,7 @@ struct rzt2h_adc;
 struct rzt2h_adc_chip_info {
 	const struct iio_chan_spec *chan_template;
 	int (*sst_to_freq)(struct rzt2h_adc *adc, u8 sst);
+	const struct iio_info *info;
 	unsigned int num_channels;
 	u8 features;
 };
@@ -763,7 +764,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 		return ret;
 
 	indio_dev->name = "rzt2h-adc";
-	indio_dev->info = &rzt2h_adc_iio_info;
+	indio_dev->info = chip_info->info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = adc->channels;
 	indio_dev->num_channels = adc->num_channels;
@@ -778,6 +779,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 static const struct rzt2h_adc_chip_info rzt2h_adc_info = {
 	.chan_template = &rzt2h_adc_chan_template,
 	.sst_to_freq = rzt2h_adc_sst_to_freq,
+	.info = &rzt2h_adc_iio_info,
 	.num_channels = 16,
 	.features = RZT2H_ADC_FEATURE_CALIBRATION | RZT2H_ADC_FEATURE_SAMPLE_STATE,
 };
-- 
2.55.0

