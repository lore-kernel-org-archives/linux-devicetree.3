Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CA13822A5
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 04:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287207; cv=none; b=f67UIttjAEFX26GCYoVxJbzd8kVLGJXOJy3aosenuVqUzKFiBcDtcOT/Xnamh56guN4Lad7md2G+lh8241Whr9mrftXUnNwH18yliDmL61Nwi98VbzUuKdG7l3Xc18iaRo1GkZJI5BLxj6jV9bNryHvLLbj1JVzRPS6W7cOomM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287207; c=relaxed/simple;
	bh=XBYj5wk5mHOhrmakKYDDRm9v0qThAv3JDCmmRtqO0jg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ITSgHnU2qjWBOzoID/nOGbS2MiUqyUmIOSZ0xMFbIRIO0VI23+SvodhUwegO4bMDsF4tkDVKjtS8XdZhUH31WaMSsh5DnuzZZpZa5sT+THmfM2tzkXLK/bqpJplN2eQ9oHhgL+s838czlBwqMsbRAQyuWqFxuifaD5EboIE0+Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=H3ntjQ0f; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="H3ntjQ0f"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1600d040e4so83766466b.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 21:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787287204; x=1787892004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBQNwdSsbnHo5zy7bAfKYZELDnvZrQKGP99PRhFhTTM=;
        b=H3ntjQ0f9GZVrGDd4pJ8WpgNJ16Pv0nEQHkgdfzr2m+umI9M9hGgSjRLbtJC0BSZH1
         tSYElLEwD00pO0yVRu8UkULN/v8zO4fbyP6hbxc9m+oC7EcABLxb3bUXDc2q0HImTZTO
         A8L6yCy5AmuySWwcZRchHYY2f/FeN1mzOHFeL+G0/hPkDoPMNCzKihKamA6KNHrcZ4K5
         7IL5QGzpykrpiPctf+8txtdx29jNoVkZOMVOp/XOzSssImFLUXKgWxo9mtQwy73ffubW
         8KEFQ62ApcB9XEj5bad6z0u/6Sz7wWxui5fQ9CB96VSdh3elbGBQZ5SjmJ70CphxvQDh
         QnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787287204; x=1787892004;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBQNwdSsbnHo5zy7bAfKYZELDnvZrQKGP99PRhFhTTM=;
        b=bROAT67c3IEn2ZeuQnm59BOW7mX7fROssZspLu20tThBVwtuFkaf6vV5IisH2L2JV5
         6MSrg96xlIQcOyRlSTWW/zFw8cK/3JEpKpvB+z+7iseYj/WbjM57AgH4/k0AD2RnCHpn
         +LjkLjmlFICXwGSWq53HjaSnspXX91c73ZZA7COWG/AXrgWjSToJxJoUFa0bqh2GiqI3
         x8xbYMhg7zBdtLdjkyaKDwgyJ21q6Btlde5Q+YXTN1bMiOvnGESSdgbJ0TYhDBk7fHua
         GVWV0UTOMd6T7WVGgoKeCS4KDF9VDuPz782mJYGpVtd0d5w8pmCcZDU9DDI9RiWFAdE6
         v7Qg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2XAo0BHXxqZV/KBNXr04tc9E7ix9LB474Cm/oD/B9p8B8inlrhqRkZqGW7sSLC5Ym1jqx8PXdfqv1@vger.kernel.org
X-Gm-Message-State: AOJu0YwHVvmwIHfdNkwRNsyi/jnMlVI1lx75gnbvjNGh7EZ+6rRQQlhV
	tbw4TtffIKnGYyUeN8HjwrU8RSu5YfVu6qsyCiScVOBn/NGhtbz75L3q+wfNjumz1zA=
X-Gm-Gg: AR+sD13GrOAhQ4kGcv15HGcJEWe5n21VI11frC3UaYkStZz9mZ9IpzxE5dsBiDozDe0
	pZAfEqk+e86HizQuO6kVVPO51wHTZ07tjwB909JbMuuJ/W6D5xfnJjCyPxP3mtVg4GejnurecQ7
	+5b94ylF8kx25ZP8hZB2FRQzVwMYbuVFo945Tn8hW8nJ5N8Q4c6yrIEbd8nyL60Awbl/xz3hIol
	GVgnO7Ou5eYsR7DOyo7rEL03nab7jr/3w5eS/0UCseVWxGiCkiWk+BhYObqbQT18gWQDHQqegmw
	n7r2wVDzaPYRwp7xHT9BPnPuQPMUeqV8i9WKG67BdH40nizZTSsdK3hucR+Q4f9R7qKcMBv7QrQ
	4SEDWuUPe23VLpHf1Wl5iquJdAbQFemkKk1nLXnvOl/1kg0uMepKbeqht8XSAqdbS9EP4eC6Iz5
	jOyt90CtI/HG6zJwi0AMTUw5W8+rlNOxM5S1G41ztTPloDk5Dqi6ODdczHBVgs0oa0iTNjEQIVN
	hLejO8SWljQXg==
X-Received: by 2002:a17:907:c30f:b0:c20:367d:f8b8 with SMTP id a640c23a62f3a-c244d4f05efmr903793166b.4.1787287204433;
        Thu, 20 Aug 2026 21:40:04 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b5d438sm268182266b.27.2026.08.20.21.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:40:04 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH v2 4/4] MAINTAINERS: add entry for the ES9039Q2M codec driver
Date: Fri, 21 Aug 2026 07:38:59 +0300
Message-Id: <20260821043859.171871-5-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821043859.171871-1-karl@asseily.com>
References: <20260821043859.171871-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add myself as maintainer of the ES9039Q2M codec driver and its binding.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    v2: follow the binding rename

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f8253..8a42a0e9720 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9625,6 +9625,13 @@ S:	Maintained
 F:	include/linux/errseq.h
 F:	lib/errseq.c
 
+ES9039Q2M AUDIO CODEC DRIVER
+M:	Karl Asseily <karl@asseily.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
+F:	sound/soc/codecs/es9039q2m.c
+
 ESD CAN NETWORK DRIVERS
 M:	Stefan Mätje <stefan.maetje@esd.eu>
 R:	socketcan@esd.eu
-- 
2.34.1

