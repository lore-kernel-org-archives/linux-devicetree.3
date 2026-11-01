Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542533;
	b=Hx/ueyYIdBOq0+LCMQDZvfvKgt6mXgmu5rZjk5afA4phWRp51JXjvmMX34kWQEUVQu8D
	 CDT4yld+kNtl/dNb4M8PLfA59e5+t02YIvLV9rXI8N4RfSJuATRl6pNOVBnLHa50ZZQA6
	 3ajOXajTHCY4/Ay0DhSF2xzpFkKmQNE6WExpB7n1Osk6S26nFL8wbDQyA8irIwDRCwpgM
	 fRIpqMBwB1Z8qdLsV+L+GV0gjvgH2hgpsWnT/2XcUeoD2joHNKSa0z/+r2uOvgmX71yY/
	 s8bXRQLkx/c9BmUXRRVYJbPGPHtgDnI75js9APKhr8Ql+GL4FA+Bx7QgxUgu92VDx7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xu7FC3Q8JkhKAZXkmoQyecqo7Y03cSTT/z26JLOH2q8=;
	b=w3nfMUfn90uPif6cQbQIfa9pc/KnymXDItrygrwKRfLYlxQqrbm7vuXMp1Qyw1/zzV9t
	 5HcVrdh+8kRxjEAWID9a/CEBQysFY1c9rN/wA6pbF1bUp/qkvPAvRyI2eRj1FDe/PJRl0
	 O99AMuMuFCun6TPrnvkZwDHte4ar7utzgtXoT3kavMuyANymaxoijjzzm9lYxDexZlOIM
	 pmbaqLtRUZbSgR45peOSZqHmNz+zQtkpm026hMDpiodfoNZOOGupDMRPQMEOgAlSS4fj4
	 rSA7tGnddXf432Oqt4bMJjqrPJY9nj0WG5qyQHBuMOOZxZG82ryBjEaaahLW5lLi/zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hE+tk5Le;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EF4606A32E
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 14:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38EF4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hE+tk5Le
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2791014a12.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 06:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793542532; x=1794147332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xu7FC3Q8JkhKAZXkmoQyecqo7Y03cSTT/z26JLOH2q8=;
        b=hE+tk5Leam7kz4ZKTkBOYn/U8XAqhR+uwoX8FgHVXR95UB8LGxUI+qygLbNQGE7eLg
         3jqblPI8Kokn5TT6IY7vj17bYWcpr6M9OespfMNJxJ1Ly+S4nB6YTF5FYF3qIcM+jbHx
         B7APhQF0iWQxtChIhY3TEKNlxf70K2GGFVVyaZCfDksj5CDLm5QPloaBzzPKRnJg/YHc
         YNsgz5koB4952RoF5P1CEBiQOMZqKGDbM3S9p+AvFZv96GIXF6rfrI/FAOVvoUOUuNtx
         8PFj1Ci/n+flAtpWnGqIdvDa21jJuj7+ev+lc2dTIoYNS6dqNXYwJpXaHoXIIadtxLcI
         Ae0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793542532; x=1794147332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xu7FC3Q8JkhKAZXkmoQyecqo7Y03cSTT/z26JLOH2q8=;
        b=tVOq3x1RfgIqT/4H7NHLquT8Ef56aCWkKRWSQdAwOQBTocMcLdZzRtvEUCCUaFN0Ok
         nBPPQ1Iyn6T5HZ0nZwhs6x1tgeObCbBYp/G4SUK+K0z6ldCR4PPZefzvqODGGEOzrK33
         YSZelwpAnWrtMkaLegwmGE5EW3aU0YWjenH4KoL+U1EmtppYJeErQRaBtH7dSJmToVBc
         5Y4MZrBA/F6x11uEyfTHItNWtc5mOWj15aQtm2Yl4WRwbNKLOptyz3tBoMjJ91CZrGXL
         AqlvUfjwnGiOM8PzD6zu+LsLZlxcGKthY0/RcXUVzxfrW8XVQijO/m9QRJBeEwUTnRRY
         paeA==
X-Forwarded-Encrypted: i=1; AKwUvBznFzyt0v5HYqtlX+p6MjsI9nEaq4TK16SqDoK69MajEi/fYyw+smg8j5kBSztuhIQQ6Whz7jvUSf7d@vger.kernel.org
X-Gm-Message-State: AFq9FYJw5nkOrFQ8jeRb7Md1etHqx7MBSwS2mye3o66ml7GyX5idItgW
	lfwW3HkVUwChchW84yrBbRW/pZBK/NDMQWAxJJDFoe5ZKA/NeaRZFsUg
X-Gm-Gg: AYBFou1k+EMHFDByRQl/mgtKYkzhvH9elVRvqttzsT7+aVrG4i3dTNtwZI4IRg+ywmW
	xMyF6UsVhx3K4zfx1nMnJgjSCZ2uayKSnHUu5P1mnSNBCyi9zAR8IQl0n6x7m0JoRnYTMLoSJP0
	jTumEoG7GJVUHL03BMM3LIhptxDM9CeRkJmWEmJIXqfNoEBIXUufiu6YoeL7EPkdnWM8DHE3+Rm
	oJKGYvsowM1weUg992rdiHmOL30J3TV77UJoayeYh8kj3Oi0XR2FxC2lOvIh7FgTmZFGNC/mtP4
	ODDbQhNcvcQUgWkJQgu5opo2+m5aKPd4+XRFX4VIa/gnD9oRJ5wxXcBiwH4Rc5wkHL81F05WEF9
	LqlI6USDQt/N+e+18dTsLmt58Fs8duV5VsBb0UUwrt8hTeniM7GrzRUCoSrb0dTNPvju3kQRaVy
	TN2YI4SM7nyvoJg602md9UZwLrnY0KbdQD8oDUj8jk5F9MVObMXM4wIbh53d3t9G+HxsbNwgctL
	U6OufzdkVdUmfKlJOoo4BUaprFqcRVAWpbO9OCyDbKOQPtnS5/W3YpTvdQoyyu0ho8J8ijIJHLo
	coIXMcHxrr3rQ0RPILkHtwmf5SD2Q0UWPyACQOkdjR6g0icvLA==
X-Received: by 2002:a17:906:ef07:b0:c49:cdc8:10cf with SMTP id a640c23a62f3a-c4ca7aa04a1mr633438066b.40.1793542531418;
        Sun, 01 Nov 2026 06:15:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18ec5sm281769266b.12.2026.11.01.06.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:15:29 -0800 (PST)
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
Subject: [PATCH v1 1/2] dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
Date: Sun,  1 Nov 2026 16:15:06 +0200
Message-ID: <20261101141507.119186-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101141507.119186-1-clamor95@gmail.com>
References: <20261101141507.119186-1-clamor95@gmail.com>
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

