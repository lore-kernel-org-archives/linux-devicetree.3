Received: from mail-pj2-f26.google.com (mail-pj2-f26.google.com [74.125.227.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7273C819B
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 21:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198348; cv=none; b=m491ws9xt2QYNFpRb4HJG2hum+KH2MPpxZ20LSDYl5PvD27+e7I6OU0DaMxxK6FZBuOkKHd4FsIXOSPMCAz8O7B3FcjsN6C2d0bLlhxyW/PFRAg8IVnNzcUZG0wQI+D457e8EeQJJkOORp1W3poTDARG1EZRp7N0dBTZTbVgjSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198348; c=relaxed/simple;
	bh=ZcbP3QeuLjyfA/MWPpI4xMkSD/R2NEkFhR/DwOlavZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heBKn2JY1chUumlhFOf3PvDJYK5cpbzy2DXygWnXkr2pcUr1Fibd0aTYSOTsW2EFksBur2VgS6xNoZqEflEI3u97RTHeEF4c8n/ILzDGWi+ig6soojqZ9C1TKHn7hvjAvJiQZiwglMHG2lqCqwY/vKyq6UK1jJGqw7WUaY3oZlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAqepXK+; arc=none smtp.client-ip=74.125.227.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAqepXK+"
Received: by mail-pj2-f26.google.com with SMTP id d9443c01a7336-2d8fb334e72so6718885ad.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790198342; x=1790803142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mvwR1H5066c3VfNVVSSHz0oGUtnFFfkwQhyCaKNQI9w=;
        b=EAqepXK+ivUp1djsVH7gQb2y16ForKGGc2L1H1ROfrfTF3lw/SE94TuQ6gluhqEEmU
         jWJS7auLvn+Qjx2i6r14+sKc0dq/LDjKJoBspxwlEbczdmfv0UvHdYdfsdTunFI7EZ8s
         UJtnSI2eG3XEtqNfxOj9qJVaKjW6c6xp2ODbK8J+qAGdJbyoPUCQHieqFNcn/E7er28l
         Zy7RF6juD5wa6BdG3/ypDxoZVXmpaJdPaILCuWpNWOe1g9czALUSEDEyWtGiQg+uRI84
         3umQKoogRxkrab/tkNbasH4CA5BlFcKpCuZbNMsjmw+LUYTYFlQMJPk8xEnSQW152qL3
         IGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198342; x=1790803142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvwR1H5066c3VfNVVSSHz0oGUtnFFfkwQhyCaKNQI9w=;
        b=H84dXSFkeQKYGG1NlvoecgVHZoX34k64L9J+RCX2aNisMWj8BlDdibPZNMryoQp/5i
         M7r0DSOUqegT05e49A0SZzQWBbjkCo33zfvBEDxRyjR5ZR09y4NmpDwpnP9p1P5fZi5U
         Vi4otLXgllVecPbuBCh8dLdsYb7L70qet06fL3qfOwyy5nfwG+xlFYHYHJvnw3Dmxp6S
         gmvuSyBkcLSv144ALVipSakxxx/Z+1PoOhTfWTaTnPYkBKzXdYPij/X5kETQDAl1Febo
         lF/O3CpiOXoyl5huIXDKGNqNMsDLVqIBw0YqSTUu8t7olKil+c0qLzR3KKpl8iSldZ7d
         NXuw==
X-Forwarded-Encrypted: i=1; AKwUvBytfEL30YaLpsvtjTO/4bqNpszJHQNdXLUBslYAgYl5dIbBa+VC6illtK6yLr2vK21H7D/303F0Fq0Z@vger.kernel.org
X-Gm-Message-State: AFuF++nPFGJKfnihT0mGbVSR/LU8WJqZ2h7SGTxB4pLfxWkDN6CbuH9x
	7prgYRDylHBFLx4inbg9wBgA/LAumvTr2MLH9yA5uml9/qSE9w5CHcEUhfwaPuzQ
X-Gm-Gg: AYBFou2uhIAgCjnz9t2pC/O88zcRpFda+QT+U5WeftyeK+BOw3FVWWzjiDwK3Hkmq+A
	UNDo37jGcJKIGiGC0nlh6YzH96PjFAEciyDkk756ebMH9Srn59+ptXq9vLejuBO4Ht5iyC0nNDD
	FCRJJRbfPcMPzYTE1Afci8En3juC6IFdDIgPfBXWI3g2YYgwjGcRLqlQGiD8Hp4PIlZgN533uTh
	s6TNyTfPjXfqz5IFJcQypYwG7kxpuljlolGVw6GO2PYpEHIxq1kC1B9+Gcd2qLljvQ37+yKwdVr
	SpsW88EgtH3ed+J+bVZSPe7vH2bBl5BHILFl5xbmzXW9wsod9iBcBm21R78R8n8c+ek3UWe8IYX
	cQDtVuH5526SHrijOByvY8ZvyLzUs3BlGoca7v7TGh40ZT08djFKgAqVJBG2naXDIzcoIMU+fwl
	oIK6AHcJSc8SgotuDn42SdxEEZwtWqPDEQjAZqPLSmE7e2W6EJn15fzpyXGZ/XKGN58Eq6GV3h8
	EXKvgT78Zro
X-Received: by 2002:a17:903:1b6c:b0:2dd:c100:7cc7 with SMTP id d9443c01a7336-2df7dd74741mr2847775ad.67.1790198341935;
        Wed, 23 Sep 2026 14:19:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5ee5efsm16486245ad.63.2026.09.23.14.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:19:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 23 Sep 2026 14:19:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 4/8] watchdog: rzv2h: Propagate WDTDCR access errors
Message-ID: <999bd947-4f7f-4615-9ef3-c33b85182027@roeck-us.net>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923104054.3324830-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Wed, Sep 23, 2026 at 11:40:50AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The WDTDCR helpers access the register directly using readl()/writel() and
> therefore cannot report failures to their callers. WDTDCR is located in a
> shared syscon region and will be accessed through regmap in a subsequent
> change, where register accesses can fail.

For real or just theoretically ? If for real, warranting the quite
substantial and invasive error handling code in this patch, this
really needs to be explained further.

Thanks,
Guenter
