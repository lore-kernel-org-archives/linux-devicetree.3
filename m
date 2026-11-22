Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334911;
	b=CWiZWKfl2DzP6pMpexfC5+2JmMounfs61xZnOzHfa4SKfFkxY+5gnXMroPF73g6bH7q5
	 Hy6tOt2m7ywib5KryufdTQS5GlpHG5iJC7oz/W1cq71Z4HIIeQ4wTsOrpsF5otd/YoJfz
	 ZHBxiX9H0wafAwfrKb9zW8P/rbpq4tJ4jEXRbQciNf9CglkB86QKwU2m/ID6RE82J4gcZ
	 joGps8N3ZMkl7OCfYaHqPZicIyFWp9rTGCOCSCrp7XLK/HcZs7FGPoRAIvZBYddv+32bD
	 n3IXfz8x4f2Lt1Jrtq+cn01EXrIwDFgAtVEfQRhMOtXaqWUbBo71b3kkrudG2u0xmtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
	b=RlbFXBLayf5S6oKGCrW0887igfgCZnl362PK1RgR5qtLHYp4ReVwt/2p2Y9nBObELQXx
	 /gO0wz40J2/ZFWBO5N91nD6jOpoI7QnoqezCrAjPQfizh67ihz4WRORUcb19xDtyQpu1G
	 Z3yWazBotivdsixhwNw9vxghI6rBVgv17eoE6k0s/XuiM/AwglCXX5b+FjAY9YMdcA+r9
	 mI9txwOMqSYW39dtVAR4E3SBofSOmUuVjUPzPFDi4XVKbYWvHzdLPzO2M1U4mgGV23bvd
	 cklzXfYHZGfr4UMZhsQoppbaGivyZKpNzDUnltRGlFMbKwPLN/FQUmxI8bGo5SyL9QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVmh4DO4;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FEB606A333
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3FEB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVmh4DO4
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so2731903a12.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334909; x=1795939709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
        b=gVmh4DO4zcFuVLCN6MTSTy/+0n5I9/HC2HAeGTKnEtGYEV9olxe43ouWELR70HVY1b
         8PFW1cmxOlQMuRah8QCAb0ftbRACIZBjBZ5M6oruHBdlh/DZC+bFpbzhWDvWsMhbQagV
         E9LSXw/f9CO7h7hDRz+pM40o/fOjXspY9EZybXzPPu4XAyrenSwqf32WIDqv4vPTwZZh
         cKB/GoZfl2gcopN1WR9m3OOUdumLMRP0Z3UqAWqCKD/RIo+wGMTuAy4GAXjA4WqQ6YUm
         XLyoXgtMEwPjvFbYXLLL5OwGyaSJfjBC7AYLiCz7aVrg5kQ6SWjxkNBddXwlNxk6kaCi
         6BAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334909; x=1795939709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+JNwiCu6bm0rcLmuJWSYeAtStEl9n5lsa7a5i38a1Q=;
        b=sDaGqnCudoqP4JaR0TEbosQBpJoR2bR26XEapjxWLuT3r5zoYX8UWze7q8sQpgV+UN
         zSNFez3KmP7lO9oj3d1n0jq+212yuO3wiypuWo/saJF0UY4svexZjkMjeFW5+LnNnwXP
         M1iSc1b88jkQkF90e9baXf8AJEhTcpDBnN/ZDcDtT4zVG6ayOohrVqc8dmbg2HSGRg2U
         q/zeg3YItYpXv+c3fbqfjcjDSe0fmptbzFon01IbxEi5ekFqukbI/ElncqbD/6kHsqwa
         QD6F3wHsOt5o29D+wuXO/Hh8zMjDCXO8+4TZrinG3XjCDLsKHhSFS3NxZnPgumNsmkST
         9kTg==
X-Forwarded-Encrypted: i=1; AL+hErFt0T3GaFCIOuVZenes2MtobWaBSXT5wNkdBar/NSyJ3jrt1LC8r6Ttcc9i2XOmMY64JiUkawentnuF@vger.kernel.org
X-Gm-Message-State: APuU4Z8gIpjliyYvAYFoIVz2HVyhC7H2ozlp0qEAcvXxGddcSOpMw9KS
	jg+n0AAK8RBdCJ+Qql+kLn3poA0hLiRaJ3ZIryK1N0wnt/37sHdaFwIl
X-Gm-Gg: AZFdTZd6FErBAsi6j4mYCevnCS3LCLSgoikvramdTRqr6FGeq8O55nWmUdRhl5u7cq9
	lxx+SsD81MX/Hf8JtaPzvz6DU9gd0Zj7DDV0q8qdHcunYzENGjiQVE7m80TNkzIasAHQuEs6m4j
	28eguj5tD5+H1EaiTvjmy78ydRYyf0n70SmrHKEN3Ijk137EfDDDc3TFDHuL/96K/V4FYGiMpao
	0R/jnV/7Q/7Td6by8EPzgijQhc9Tozjnmf+vPHGMXfz06T4s/a/SM65Webe77df9tDu7m13vtOq
	BOwQP/07wxYez8MDbUiYou+eQP83LcK46MB8feUEn88gaVkDW/Q/CpZzBSdVMN3s1F753e3sVNL
	vnrCvRLGDVHbRcmbeGhncJESu/jUaQRaw/sfplR70uOwY3ACjes/HilezxqdlfDXD4khfu2qHB7
	Yi8KwML3NM6Ktw1GZdMyxLCTy2+C44qrbvFM6eK8pG4bFnVdkCUjN5fv9n132ZgyqmUbT+NZ+Uf
	xEXU3is3NGuBTXedzVyrJlwhzLe9CXZb+AzGy/TvDbEhhZDbig0QGBgclK21YvtDCfuHAL1MTgU
	F0kLPdXDFEwUuZLeET1dfYVzAwqZad2vn/jUTFjdrQ5XJW8fmPqe4JZiv8ys1AOj/Ev6Tqqwb9m
	ezsqWLOhR/g==
X-Received: by 2002:a05:6402:2709:b0:6ba:1de2:7d0 with SMTP id 4fb4d7f45d1cf-6ba37d63cc4mr5009231a12.11.1795334909034;
        Sun, 22 Nov 2026 00:08:29 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm3596014a12.27.2026.11.22.00.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:08:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
Date: Sun, 22 Nov 2026 10:07:52 +0200
Message-ID: <20261122080753.36349-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122080753.36349-1-clamor95@gmail.com>
References: <20261122080753.36349-1-clamor95@gmail.com>
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

The LTR-659PS-01 is a proximity sensor similar to the LTR-559ALS-01, but
without ambient light sensing support.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
index 20abd7da080d6..85ac3b540c206 100644
--- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
+++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
@@ -17,6 +17,7 @@ properties:
       - liteon,ltr329
       - liteon,ltr501
       - liteon,ltr559
+      - liteon,ltr659
 
   reg:
     maxItems: 1
-- 
2.53.0

