Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B46370ACD
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925300; cv=none; b=CDwdy5oH9ADqZT4NCdAFX1XriXEGWzcrRAtAGPmGae+7Y8RqZZmJLc4WVHSucpPOlMeQpeE/+gfLbb2BRr6hHBBjXbR64BtOmNbu8CPMYBhrxrz1++9vJC/50I2msVL0M/gX4qy5OnvbyfLpxMhWlKTRgwpw0kWEWKbqhPkkSQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925300; c=relaxed/simple;
	bh=uWdRfO0zWpCZ8PkZwhGYqIytHWCVD1izHNYuSvs4Y24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXLPukRMh5IMvagQRgqCBpf+Rg/hDG/sIMAy+J4GVIqwDgSFCI3LK5Af87yTTXQ+6TZs2T7sF0+TjKAEKmlECtLiLPK234z3O5KqMWLYhkaAv3dscXTDWr29o3JcGDuEF3Rz9QsOnOmA+h2izU6qz5o68r/qenC6V1EFp7ZBX+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjaXvxxR; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjaXvxxR"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so44676156d6.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925298; x=1781530098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ib003UxJC6YmbGgQtGcZFebArkcoz8imvCj7f2/9g8w=;
        b=BjaXvxxRTWno/HN8KESZw1sAfaPo/G9P7YZepbqixjE4/OCaLulom0SCmH3N/7pyYt
         SoxiHaWsTpvPXdVQATdviT8acmK29pJTtf9O4qK50wgvdIIhTF6yt5LvILOVLJbM4+f0
         h7BZMBzhF2EMlrO7SOMC6gdMJAdn62ZeeciyC8Uk8PrP7skPCboTa1mO7qp95La1NbK1
         BXbePqmdFrpHC6zhqneqvDPotmjiWrW1CvJXwkO30QbcGwrXVnEjSSDJxqEXBFewI67f
         LL1pao35e4GvMD5k98xC0xpizapirvlk1jkuiantPZvVOVYMxAzoIts0XIDPVJdzo2ug
         2yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925298; x=1781530098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ib003UxJC6YmbGgQtGcZFebArkcoz8imvCj7f2/9g8w=;
        b=a8MtYB+yX9Xzw0YS4FEhy/jz1dSmwsS5u1liqJBKmzefuStVxD5xI1uoLaSqVVOULw
         GFU1lDI1jLoothebgsV9cho3kQYeWMwWTXK0MKc9n+ks7xI6EsTnI8WeIlOnyE+hhwv6
         Lo5GKUvL3wvLPWenDMmudkbKIYraAaIJm24Yb4el1R6xI77PzGABMHcyTUaEBjJfQaQj
         7HNlGWv9IljBAhg/s86jEwPyJdOwmnDRL5A7E/vnl1gyxRbo3bAQ5tKYTE6AHFC9+Vnj
         5J0+ClCUkWLIq71wS55Tjd69hmAfPgf6bDuc7VZZkqd98z6T2g9X2c/MtUxcTSkOla8d
         vV2g==
X-Forwarded-Encrypted: i=1; AFNElJ8Shmqoy53KP148BwGzfCmRkPEM4cnkJDCMN1/FkElUh1COXqPomH30MRp/8cLxJMYCXmpogN2Ez+Ns@vger.kernel.org
X-Gm-Message-State: AOJu0Yy98hQ2of6agAS6BAThcQLMwXfOQXT8gLsMUnZklL29B30SSGAL
	f2TnjT+qUIkb3IUTQjtEvzoXgbPOlH+cEXo0jWraJNWqMxwh6u1/Jz74
X-Gm-Gg: Acq92OEDQNuHnku5KPxi7UAD6Cdder1tNzujC0xQW4o32CCwIk+G/mjPO5l/e/CTY+n
	4RHfIvkhy+r7AHITZ1LGNekL3+9GQdRP4s9coxAWor4C+DFqU/GGdaUG2uopEcSIlu2w2/cuTvf
	kLeLSWYHSrxCGZuPoI/6m39vL3SmyC466zsM/oDknRrAGoM1b8zfr/GEYjV4sIj9GvvSRiOQW1F
	vdVHKM3C4MzAKHx5zmsRVJJdH5y173pqfeDbC1XT9TdIeRJAdcdCM75qzLydOV26UWHsBsEo1Fj
	tDoqXkaSO9DZpPxbPeoZ5oU3AT7xR2egcK+6/fVA2KNtVPgYiakHgmrlPriukjK1jF85JK3XXR/
	1BpTwjYEud6QXO6YXtTRew+2q5sSmLX0A/jLZxroqACoxGDA3edFMSn2F96gKQC70Y3cQHa7ZRY
	c4bN8qUjHg0Xjcwp3AjvOkDJld8I5psquEq9BUVT9ojoZVk0PGtRPOJZpBZ3SZYA9RNXM=
X-Received: by 2002:a05:6214:451f:b0:8cc:f175:3ac4 with SMTP id 6a1803df08f44-8cee626eec5mr239264806d6.43.1780925298393;
        Mon, 08 Jun 2026 06:28:18 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd277bbcsm163934526d6.49.2026.06.08.06.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:28:18 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:28:10 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, daniel.lezcano@linaro.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com, dlan@kernel.org, chao.wei@sophgo.com,
	anup@brainfault.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev, hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: Re: [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Message-ID: <aibDam5mwkaIJhHw@sleek>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <ahteTfYC5QMlpjF2@inochi.infowork>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahteTfYC5QMlpjF2@inochi.infowork>

Hi Inochi,

Thanks for the feedback. The next patch will have a large change with the
pinctrl, I believe I will have to drop the tags for that. For my reference
would the tags be applied to the commits or the top level patch?

I have the pinctrl configs staged in my tree but I am having some issues.

1. spi3 conflicts with sdhci1 (wifi) when enabled since they share pins,
   I am not sure how the original DT had it working. Im assuming they had it
   enabled and the user controlled it through the pinmux program? We originally
   tried to enable only what the vendor had in their DT. Taking another look
   at the vendor DT spi3 is the only SPI enabled, so we probably should not
   choose a different spi node. Should we just disable spi3?
2. I am having trouble getting the card to enumerate with just the DT. I was
   able to get it enumerated with some kernel changes and I am trying
   to translate those changes into the DT.
3. I added at least one pinctrl config for each device. For the devices that
   have multiple selections, should I add all the configs?

Have a great day,
- Joshua Milas
