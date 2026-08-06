Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ECF4248DC
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 21:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786051545; cv=none; b=ifD/B2AzCp27kSE55EPajlBUbnI20hkH9JEh6BzpzyMZkNAEnS5zyB+SMKca4CeHDP8Jrso8BpuKATsIHIoz0IscE8pi8dEeV+3ITXAi3ZAV/iIZwfY8HjVrm1ZqImEZnFHdaX0EpixP38hx12ZUPpA1EsodL7KwRMpr20i5KGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786051545; c=relaxed/simple;
	bh=iw6NzlpbIscSaSSY0m8/q/eiI4pkG7adwwd0ooQiK1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcHTHvLoGm7Xi5wnWpm6hdBg5OwTL58J9gtv4F2vx/eT6b6pPO0vMvkC2L0Oa9pjA/Ale+Avxw/FIA6mv18xiOl/1SHLik4OTnjE7UEgMBFc0IacQFo6yeRnIiWrpJUUgz4XcoHSqYoZbeahcpsoLYtkk3ehsBgcTsnfxbVxRjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUqLoDVD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUqLoDVD"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc61541f8cso16149435ad.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 14:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786051544; x=1786656344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U8JFZqlB50uswLR58OmnyCXaxlSBWX6UZAyFotochoo=;
        b=WUqLoDVDjqHHIBswJJjVP83CcD9bAA3O2RBaLH4+cKBS1ZU9DVZDIBY+7fYRalIB6G
         GHIJMNT6hQJ1xPZfFURtEDRTQN3MJjA2+32O6GNeRHimoT4uzn9tR3LAEE+cXJFcbSbC
         fmYllSn1A95FvNa09969ROpV4cbsb6TdzBdYvY1Ns8n+W8jwXs8gYVEcX3zf7ObWDzRT
         Uy8G/cIBiZxvTf50+1gI4dt/aKGYIcCaDEeawLgGgqJLCmkIs41qTW4nc4gjA2R2bckH
         nOAORRFcCbSR4Jnr/pXnKqwl6iKewc4MhaoXVM3uWlZK5bQmNsuFvvYiJqmduf8lsdOo
         kx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786051544; x=1786656344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8JFZqlB50uswLR58OmnyCXaxlSBWX6UZAyFotochoo=;
        b=R6KGnWwtk6+Rd6a4RLGBexObef3CW5DqwZo0jAM80YoOMeYCLWPF5KvQbrA+HlQHlA
         sd+NkV02AJ8Uqm39mHmlSNUl5FNZ0swdiVF/6zBWk0sFFbaLkNP1KR19cgBE84Ckk6dB
         uAYdMoGsGBEPmNlj1x9xBFUffURao2ht9jvtrIBs5DA+0Ioq/XwPHYUCvPPQqXqMFsi5
         im5N8kp8EUNPpyGB927ZQcQCTCbmvIEU71W7MA1EcISSVy1vA7///XTjCNyCJla/Zs6o
         63wF4aaZvDYk4E1B/lPWyY6ywq6pXjUOZ5uZRPI9dPcUrI/PN9MP85grLRlGPiV5vHVg
         HHfA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9bBIAI0/ZefgnshN/kz8i4ynrCRCGruv8Wv0BLzsJgSrSFySfK3GEEdubA3ec/Ekh3PmB6XyXcsUK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ndeaRQvQQytHu0qLK5hxempI9X8Faksr5kFezlzGayi4AQWL
	mfy/9/IisAxqeRZOOkQm1axxnBBBqUZWqBY6S8QXa3HqAkP56VwmjVPl
X-Gm-Gg: AR+sD10ke9nmV68O317ZI8Vy6VszNfDMtB6ZI18ta5MRG02Lhahzfg7sr2GrMGfhqvX
	TyTHS46vF/Ymm6mCD+sRD57wsteRxbtN6BZU78gzQ3KDVqYYHkXhfMbpB2lQrT4zdnisk5y8mZp
	MFcRcwWiv7GQe+xFpNLrroAvOxs2kXXhecRbHSknwDMbsx/Bw1S0HpVBjTdfr+7P63PeYRKfTcn
	f/T3Wl3ZLV/wcbtdygajnD9Q9tM9IqdGJ8vEMyGqPwEw3B9L8KJVIeqlBBpsd4RoYO/YWZ8f6IR
	Xej18339/0OgW1KGn/iT8rJRE/m7qqblFj5XJmBK0/RB73tZPCIq0fpOEi7kHFiOUF/fMS+aVZh
	QRMGJ69rYCzUg6/fj7ouistGWCInztF1PsJvkc8dLS/GZS/EGFNhw9wZqJMXjfaOJMrUUEujOL/
	7QmhtYLCVCp2nNY8jA7AueMMd6RROHkXSp8MWqLLWL0mZXAvO8CgEf5t/TKwHWarATxJBAmgzAd
	A==
X-Received: by 2002:a17:903:3846:b0:2cf:6e5d:23e9 with SMTP id d9443c01a7336-2d0f1c5f19dmr118531195ad.14.1786051543613;
        Thu, 06 Aug 2026 14:25:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4ea157sm179095ad.78.2026.08.06.14.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 14:25:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Aug 2026 14:25:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] watchdog: Add Nuvoton MA35D1 watchdog driver
 support
Message-ID: <60f4cc17-d545-45ab-8fe1-589dbbd153ef@roeck-us.net>
References: <20260804070351.1846165-1-zychennvt@gmail.com>
 <20260804070351.1846165-3-zychennvt@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804070351.1846165-3-zychennvt@gmail.com>

On Tue, Aug 04, 2026 at 03:03:50PM +0800, Zi-Yu Chen wrote:
> Add driver support for the Watchdog Timer (WDT) integrated in
> Nuvoton MA35D1 SoC. This driver provides standard watchdog functionality,
> including timeout configuration, ping, and system reset support via
> the watchdog framework.
> 
> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>

Applied.

Thanks,
Guenter
