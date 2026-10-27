Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072971;
	b=sbD7XEtNsHNu0/E9LtOOwesYfwch9IaEye4HC1P9i8/8seFYeGVKc9CZlJamnCCPK8F/
	 vwLyi+1jviqJ6xhnmywhbskNfU3+3fLKjwq8p3e9cq3kVxkSXpKbXKseGuhhveDy3cwMd
	 BF0jQFsAFthbeUT3rxahV82D/g8VAsBXAUrNrq3G0CCPNoGC1uF0TY8XVJ2OKXulQD8KD
	 Xm0pzIJG98LylxdzMJr1e76l5NwICNEA/CzHjLOYJskiWSthtyDgvwth2479EUq+DfCcr
	 +ZBFkw/W9Ux77gsFN8SSGrwZjzKcbBM+qCchBOXJZYcDPVZbUvV1h5hyP9+f7nokGFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bVKdd+rg0dOMU+J41LGwwuebdjS7SkBQhNfNvVlqcdA=;
	b=EJdHSqcFYUMvTPgR6iJDQAtqlVHgd/Y0/zF9oJ1kkUu7iSsAZewWgl5KkJwV6ojpxbll
	 y1Ed7ueNf9l7GPZ9YFHVS1XzmNZpxh82hnDVERv0FURHWCsFa9kBygimbT+wOSjJ+B+2N
	 RicamYCBsbThXYSf+D4o0mI+brGTt8KSVQzj8ePlPq5oS2flwUXBi6lpluqi78oyYKMZ6
	 8UiMH4f7ZjVfa2u8XrrSg4WPL4OV0QT+dim5WOCOZ31e/0lWceCvEQlCqVUE8X9zovVF8
	 3OGbpTC4SfpzMlYVJQVyEOc8O/KZt+1oLL/K1m+t2jmIdWZ7QUG7lQRvpK/F7simzeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oW8dlnMW;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6674606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6674606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oW8dlnMW
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-181516de561so374547c88.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 20:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072970; x=1793677770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVKdd+rg0dOMU+J41LGwwuebdjS7SkBQhNfNvVlqcdA=;
        b=oW8dlnMWBVL9nfftPc68vTnWcbQuATCdgR/vljP1DDi278fcmXoC0YqgqF0+bteOt8
         G8l120776hYEeaXZ8lOSekKRkELk87685tj5zEPeyKaXxjxdQfE1pDdtf8xx9G5UUDwV
         7AhzfRINwk/nq1yUeKMGUIkWWMYD9MS8R/xFo6nxu2a6L1KosvD6k/Cv/jFoqlUUCQMp
         P3v3FL7L1bJfCi5klSn+yJktsz+CRHzmNfFuuC+q67ZPujrfsJolAmEJHMeYTbg2nRHB
         OgySQnwvvkaZCBj26camPhSRDwG6mc8Q/p89yB0XLYhsU8aIjelqWpxbdjsz4NXZU02w
         y3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072970; x=1793677770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVKdd+rg0dOMU+J41LGwwuebdjS7SkBQhNfNvVlqcdA=;
        b=eVC7SKs+MkXbJ8i8FCmKl/JejIfjlzorM6taBqybB7qvfBQrDi0d9Eu60Gi+zs2l62
         TNQUTk12UxXBHzv3PROxcW5ATrjEu7KbqzXhTiftADLxUupzBpzmPgctKUW4w18O2op7
         mbLuw/b1khQlRO71v1jWobvTKThEm0C9rSatv5YnBK+pdr4pxbSKCp74QThsWHLmObMk
         h1KLz9Bm9hQm11BjLV2C13jLF9RJm3Kn3Ps560OHidLCj8x+E7yhpa0JKrZbJhDa/UYo
         WTwEEwg8iNhe72+XLOhJcEY6UVtqJ3qldrwGddXn+iCKSvappvdV/KlI9TsLVwrzyCcQ
         /mmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfDu1JAjtigyKcheLurKejTeoDYvmqnBRRa/UkpP86vWFWzSU9AtIAysn0yh5hGPApGt3cJvL/SAhd@vger.kernel.org
X-Gm-Message-State: AFq9FYIMsEJBcOlrmodyJbfv2ChJ/FFxhFPKsb3tB+yn3uShVKcebGhL
	7kR6ulCxs6vYDrw1zpmYY2cJ6qsomZkQ9WH14zFslOtg6ELzJzV8JO9F
X-Gm-Gg: AYBFou00HxdkvdQ2yzLI2T8AqA6tjj1tU9G95WWEi4aYv6IvOQxp/g5Ii8J5SUlpjWn
	beOf/1FRwjA+Q4nPu/+4AuR1OKKubnwcsgajKfAU/MSYk6QcCy+Lkjyx+kHwWl+9jsDLV1SDEjl
	teCBRjWsRkibic5GbzSRq9Z7AW3fXdfd0qDa+5hLonNyiDRBVPSakomd650f5dKuS1qiLTiFFTx
	0VF28D4LR96Sv5Dc/TFHwzbCfMEONscaJF5Ahr+vIgM3KItAK3Y2tVxh7w5aouMqoj/C+nj+I3a
	t0F1xG+Et6jaMNA9Y1M4Sw+mGlgKH6uDcdbE2BNPjxQ3NGOMX9UQVOCvN+QJ+JOdSrcpn2Bf26+
	Yp7B/vwc1kmRcHoade9yeyiaLgfcOSeVfy+1Ink6ZTaLNsVgXjAIRVREmmmEdhAr7FxxGdHMQT4
	a2mh2Nb9ee5TcatWZA2FqbmNlrdRECHaiJEzXtQ+xCee6GR2NH0ymG6B5XylCWtdDpb37FD/OJc
	+fCLyt2FtHZB2CPM5THjYBACt0NgYiRs3h7s6Jm6nRczymRBGE9yG3HR5nw9+1HyHCZp4o=
X-Received: by 2002:a05:7022:47:b0:14e:5e6b:e6e2 with SMTP id a92af1059eb24-1a3c904cc2fmr2284657c88.18.1793072970015;
        Mon, 26 Oct 2026 20:49:30 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm26430012c88.19.2026.10.26.20.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:49:29 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Tue, 27 Oct 2026 09:19:10 +0530
Message-ID: <20261027034911.99482-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
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

Document the ASRock Rack B650D4U BMC, which uses an ASPEED AST2600.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868e..3e6133e2b 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
           - enum:
               - ampere,mtjefferson-bmc
               - ampere,mtmitchell-bmc
+              - asrock,b650d4u-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
               - asus,ast2600-kommando-ipmi-card
-- 
2.47.3

