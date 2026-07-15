Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310B040EB9D
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121460; cv=none; b=W0rG/eYtgVQzoPrpfU9s8kQd7l6T3f7293OhLo0ffzjG/fIkH+svmz8akqWkVGgDQQlUFZLrpDuNhvysHkZt1xdiEB4jJkOwU8V4QLTtYo0cUoUZDjf4gXTmaVjsWw2udCEQLS/SJtrFWLgiWKg5fCGEKpDcLqMnDlPZAjShhk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121460; c=relaxed/simple;
	bh=hczmU3OL6PdzlrhJ6JYmVp+Ey7Z/u0pzhUV+KKUELJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDmaqzzdv0Gs/U+9oS9bTxAAmK0J+3edw0UFfYZGxK/Roo7QjNJZWGj9JJivpXVNg90I11qxh2fhl33b9xTa02cXtqeDk0stsAEkxbwww6kV8d0vvp7Bb5sGCnD+Ze8iw2BL/ssEdqy2PFzTuMKPOCIBolaA2Yke0JowCG+qgcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwRoDbTB; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwRoDbTB"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso8180572a12.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784121456; x=1784726256; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/DVvBORihuEn3FvjRkaTr51gxlhFGeurA6G2bDkKM8=;
        b=GwRoDbTB6UsVhukuaC+PhMkfOyGT9UbrL+EX7NOYNOHmiCUlLgi1coDKZHN+SJdm4o
         Feofq4hNEce6JJvO91hxL5nwV/PLhgmX6qFDRI2mb/aBC5GjwqJxxDGwiD33i2Sk+1+T
         RVVQWOT/j4nE1NVeyukiD7SMb8mGpGwym5Ve6z9iNoRm6g9FibJjlczVltfMKvWtVLZ4
         eg/J4oXJSZ4PbytoN2A/Ii2xIUP9RoB9RvYBkAwZkqW74U8J95lubyg5eDOg/MyNntB+
         l2PUdElFrR29fAs4s/ZPsGfxGt4iYoLYLfLNr+UJLLW3oMNOwpEt4BU7uh9KvoXaX12j
         ENRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121456; x=1784726256;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s/DVvBORihuEn3FvjRkaTr51gxlhFGeurA6G2bDkKM8=;
        b=HRdxK9rF/eaTdaNH3jOBhrgQHQTuOLdqivMX5TTonUEcIKhfO7upzHHH9nrxAVm0JV
         WtXxkv7dDSDvDdCJIJdx2OkgqjTSLUF27CnRKckiXcbJg9aqQ9ImrOA6R6yqNKAEcmF/
         O8tvy2xdaTWylFWKYpA69U871Pyy/7Jaa8C2Q7qNPNAeyk5TgVH+aDEFwMwoKf6EYC45
         x2eC80xWPz/y5srxZxmWcs09daD/6IZJK0gxneFpoeUTsaFpgJQ6+6ymW8Ehzio4ivaO
         X7Dj7O9fpzb2QIX2UumKpHTCfq2/KdPRSskBTClLEcNz4Wa94c2pINYlGgy0PoEX68ad
         Y1jQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSl2c4IEXKJx0GU/8mZnFxu0vRk2A5uAN+hRiuV8zIEjhJ79eZSNGwvEJ+IC4MLZpff4vq0mqByd3U@vger.kernel.org
X-Gm-Message-State: AOJu0YwppB83fkmHhp/Cp/Yw66jVPfBzf2bdoIU7LSx7+GREiaDW1eJD
	QrOCPglVIrbyh9c7zGnb+cbaF16dS+S1ROV5cCi9GDewGybMTuUup7mJ
X-Gm-Gg: AfdE7cl7QC6IJfdJYHuZtOfqqjluN+epieHcODuE/6B/zx0NAD6FNDTu4hXHUt3IzpM
	jeNZhTLX+A1U1gEUSy1GZb0v/ewWmAkslNBpI7Z4tp/WBPgGxIsmVFK1rH0TS+MODEFV41WgTzs
	4ppIGuewGWnxkTzhGAvX0voiS+Ky4Syexyh+xUzWe5XXvSrlVrvg/8rrILEj+OQxKk4zW45jAjS
	Gj0ksPb0wk97mRLZC7eMuKfJ/5niH1db8u/aUVCOL/4Rt6h622n/bxfb3cRtg4PJcipy7pr62bU
	y6V6GAJnjUJFCCjwYqRETlkU/QO3z+T7x62Swx5XH+cIwDkdKBGxJbUjtDxrionTy/BXZxWaCb2
	TMekO5CwEWSj7Wu93PzYyX+9zXke9KcX07nwVAuQb/eE1wq2HaSeFaNXMH1Twf2oPsRTbOI3/2l
	x1FHqqsdbZH/2FtO1svftW5fM0gjU=
X-Received: by 2002:a17:907:97cd:b0:c12:6bcc:a3d6 with SMTP id a640c23a62f3a-c167948992cmr182925466b.54.1784121456284;
        Wed, 15 Jul 2026 06:17:36 -0700 (PDT)
Received: from NSA-L02.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687317c58sm22652366b.36.2026.07.15.06.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:17:36 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:17:33 +0200
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Esben Haabendal <esben@geanix.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nikita Travkin <nikita@trvn.ru>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] iio: light: ltr501: Add ltr329 support
Message-ID: <4bn5dd27ie653f5324pluaoamua4bxdbmxm47rif4yumxxl5un@anbjqozl6ovj>
References: <20260715-liteon-ltr329-v2-0-d18af55edab5@geanix.com>
 <20260715145546.00005bc8@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715145546.00005bc8@gmail.com>

On Wed, Jul 15, 2026 at 02:55:46PM +0200, Joshua Crofts wrote:
> On Wed, 15 Jul 2026 14:27:22 +0200
> Esben Haabendal <esben@geanix.com> wrote:
> 
> > The LiteON LTR-329ALS-01 chip is similar to the LTR-303ALS-01, except for
> > interrupt support and related registers, which LTR-329ALS-01 does not have.
> > 
> > Signed-off-by: Esben Haabendal <esben@geanix.com>
> > ---
> > Changes in v2:
> > - Fixed error handling when irq is defined for a chip that does not support
> >   irq, powering the chip down again.
> > - Added simlar fix to error handling of devm_request_threaded_irq() error
> >   handling, powering the chip down again on failure.
> > - Added explicit #include <linux/array_size.h>.
> > - Link to v1: https://patch.msgid.link/20260715-liteon-ltr329-v1-0-31f027051594@geanix.com
> > 
> 
> Quick process thing, please wait at least 24 hours before sending
> a new version - let it sit on the mailing list so other reviewers
> can send feedback! Larger series should wait a couple of days.

Yeah, as a nice rule of thumb at least a couple of days.

- Nuno Sá
> 
> -- 
> Kind regards
> 
> CJD
