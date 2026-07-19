Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B443D397E88
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470693; cv=none; b=s4l3JhslmcyjrVhw287qPIiJYqdQ2IbPNewqe4sFvLlBqFXneBszAPfRgMRgheexOwIISp0AG4+Th0H49V+IunxondduMdCMWB5cnWJNforL3fgZkyrQFHtfxxRhz7HIXCoRuP9AX9BRMWFlY69TQQk1chjzqFdBQHKqtey5nO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470693; c=relaxed/simple;
	bh=Sne6+JLHMXVKWM/ThSFqD0Omt37JLRvUewfcCsxfB/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWEHKPFvZjWamefrUyiM8Ji38n+CXw5x2y6+CrJpCMzKGmoU0rmnxTm1o59UeUsdUdYC09htuSnGfrv4H00TRSBxXanApbfDbZ6hm30rs+zmWFywzIdW0yEzFIb8rEriNLckEvUcztLFfdJZ+oMkaObA20/vo17SeEARWKQmbTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXqU0B6R; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXqU0B6R"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacb8416a1so58169985ad.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470682; x=1785075482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wgKBxoWtlXID2rE5qxKbkU4bd4XSZ5xo5Wy1nLV1HIQ=;
        b=VXqU0B6R0i9mVar1FrCSlf2mi7znBmWTTOmh9xsKAPNt2TkxIJ925N1KS4l9wiMYXh
         pf2vXYF5pdTaW2UbWyMWt28Rv4XDrAwNwFeIpFPl2mENy4KDaS1UtEpExAnQZQCpAh0l
         kwMySRP0Z2hYrIU/8FfBPPQRIiYxVYcAEXg7MOi1YQXSEBBjGR1Q6E1PQoTBogdiB44I
         lGQaCEu/zgWCIVTNX5ft1eD1hdq6fthvU4PBTTcu+hk3eGzwPlk72KtwpRWV1CYHu7Ip
         GLFJ4564s/OunCfFHFkD65r6TwxXz/KkqL0nAYoJ5h9xdjsDSt/MCCSAz0GoV21gj515
         hkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470682; x=1785075482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgKBxoWtlXID2rE5qxKbkU4bd4XSZ5xo5Wy1nLV1HIQ=;
        b=nsdD0FeHVP9Oly/jeNuoePXbB6dRFvN6isxVogiM5xkCoCnaGjJ0bKV+JcVxMxruTX
         KdPLvhFQAsCQDobhR3RoV0VEGNKgGzU76egRbHUqdostjLyA8zm4j/bPs/+TwLrls7zv
         9tipyRfyicEkpbycIr9N16/ss9X9OAy1HSdbLnUr7FHVzssD96zEMxnkpobABtxnyZo/
         oKkXipgja4aO7jV7pc5vgUdrCG5WM6f9hF42XBshKoo1k5lqEsJi0QGIdI/GP6gR/qw5
         SliVLlxWAvJ6JK7q0kgVtzvVm4ztW++zxkbbeiFyAWuU/+WXx/arB4arKXVkJC0ZKgFf
         omXg==
X-Forwarded-Encrypted: i=1; AHgh+RrX2J6fikB3AtXZq5EOl1skrF6mbVo2lMuR9ONKMfE5Sj7ibR2srCA6ywZOIBgxl6Fs3hjv6e9OGR/R@vger.kernel.org
X-Gm-Message-State: AOJu0YzVVkwnAVguz020fRywwqA5Z5gDpKoaqlS2GiM7mM9RWx4j78Dd
	/5RQw62KUSLwBv+k4HrFb2nRQslZ1pBlRapYCAAz0IlkVw2kdnv60Ss0
X-Gm-Gg: AfdE7ckktPkBG+Uo48iiz/KsJUtmlA+6BCsBShZitf75mFB6Fa8Ehtr6yxhLdUmpZbH
	Y9sP408tB4iQ1oWRg9IlS/4Y6tn2bOHwZ3nRnqp1xtwEsZnyUfpD8wqQmfiZGNFVXAuumKxBfTz
	DvjoPWdRUh7yc1yIGtA1wn10hGrGLI7kOlgop4SjCwAsWz829HcTXRJ0lm0QjOkqGXO5soDOkpm
	TxssaKUY7g1ylW9QMXmV8mGRjieYzXV2H8nxlLaF5GlWwH0h19E9kisl69eu0X6czm8I7bkG0bD
	LeIMjob5nMbzUF0Ig4IUZPx8/uwMdXIplkJ/0KZJG3jA4vz/Tdte5FtjhdUDZ1aWZSoEoyCSxXB
	KbGYp/hDf5w7a//VT95bonVUMO8/BLJm7nsU4YAgzmRzsHLPPeCZmpjyf2lA2j0U4SKGJua6wer
	CZ9D7fyoehtTMsCeIRYudcmFhUFw==
X-Received: by 2002:a17:90b:17cf:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-38e4b4113d6mr10668031a91.11.1784470682519;
        Sun, 19 Jul 2026 07:18:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a100753sm6191529a91.13.2026.07.19.07.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:18:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:18:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] hwmon: (sht3x) Add devicetree support
Message-ID: <3fc320d4-2e32-40c5-8067-5e08ead40b76@roeck-us.net>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-4-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713074559.12196-4-zaixiang.xu.dev@gmail.com>

On Mon, Jul 13, 2026 at 03:45:58PM +0800, Zaixiang Xu wrote:
> Add an of_device_id table to support devicetree based instantiation
> of the supported sensors.
> 
> The devicetree binding models all higher accuracy parts with a
> fallback to the base part of their group, so only the two base
> compatibles need to be listed. The match data distinguishes the
> humidity and temperature parts (SHT3x) from the temperature-only
> parts (STS3x), which require different configuration.
> 
> Start enum sht3x_chips at 1: with sht3x equal to 0, the OF match
> data for the SHT devices would be NULL, causing i2c_get_match_data()
> to fall back to i2c_device_id name matching, which fails for
> devicetree names. The devices would then only work because the
> resulting chip id 0 happens to equal sht3x. Non-zero match data
> avoids relying on that coincidence.
> 
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

Applied.

Thanks,
Guenter
