Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C157246783
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445947; cv=none; b=Oq+DsQtvZUcFvsocrulERzi3lmdeK9RXBbINJEZSbhfZ6gZZoYQnWABbqg8fYCYKKe6WP53Cjuj1fncBqgaRZtkR1HS3qhy4UIT0z26artTGwQdwKh7rzkoSVfvGLvagoQovd+EJ/yE/3sPRMViygh/UP7joKQlqUiC9y8JEmlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445947; c=relaxed/simple;
	bh=D94xm1ZPq71rloJ5O/ZkWsXW8+dnSRk5jN9ZBex4bRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUJwN39XpRbCVfVlBYPHUJzdtWtvwSrp4T8M2KvdKoqKF/BZ4Fik1UQZLEl8EqGdNBO8vbsVd3oNihj4einqz+4p6K6PcG10/2Pha/9Ythgp6qoDj2WEpEmKrKesFgUfrrfRDSrA7laiTo7O5XZkEKt57m68zuTwJ4yT1CiuZ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hI+Po3py; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hI+Po3py"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44a5174670eso4203725f8f.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779445944; x=1780050744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zPSvL8/xGB/fffNh3By+5mlW+vShs6KMGbW1Sla0/4k=;
        b=hI+Po3py2VQ7ojEzbn4Qtl0H9JUIYV9spYs+LByD7BtQey3VLkLgFs1ILVEksAXhmx
         P0SMy+oW7445a26qLiG9QdKaVdt4MS4c0hSTpnUKZGaX0wpUR1oE3OIxmp3OiK6xE4fz
         jQ9h+S3xFrhkmKoUbRRhMQ5nn08QvX7qeqBQvbrrjV5NxOYrBdfYSS1slfvDWVioMA2u
         HfZh8sUlntwBxuFzw2KUByNUrpb00qrN52E3Pzn6WNQejNRpERXLDhhmSoV5i/ah/LF2
         tNWDSc5ajWyPnYTXjrFdKCji2l/ctXGe/vB24wf6BWNGCIYQClilUbP/Snadmx2Vdrwv
         VrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779445944; x=1780050744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPSvL8/xGB/fffNh3By+5mlW+vShs6KMGbW1Sla0/4k=;
        b=CLbAtP4Bk9O72wYTc+NJrEN/qCs3aYV1cJ4ZNiQBdLAbZTtX7GFAL3frVk+WDTwgbt
         YibPKNLa8AlMiGBDj1rJNNjYOj3Kru6TffvCWveQB6MJhjQG99zSnWj3u8/p5A7GqvSC
         10abIyuXLhwdM/2Bta3ZP8i3mLvm8DedMIV8NuzG0FCu6AC+iTli+ovbQAmm4E8dUVC5
         AT9/Pq8qV5/ZSNiAxF7lZ5JCR9tNXa7eRGeXc/I+l9jb/FfeQUd0erRIcUaajKcuQ+a0
         5keatKUNbvIX1/w2cv4HqJR+sBqTDMUd+dVDk/gRMLJyo3L3gdDhNOKO5PF4YYffTaQf
         Ojig==
X-Forwarded-Encrypted: i=1; AFNElJ/1Md2XXuTSwjKLlvzDOd3Xj+JlzdyhIRWsEyY8cJJl9qRIAhVRAvJ2wQXCJNFum1m+DU2thrTMcNK7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6JMDoRACmCk/5HFZUBvxrbkIQ0lIVQL+2qgL4H3zKwttCTqxK
	bSoFSkXjectDcZ7V0mj/Ng0L+IE+3HQrJxiCgM3D1JXsOLvy+ZaJr4IS
X-Gm-Gg: Acq92OEWsTrLdRxw2nttZt6VVI6JH4nVBMp+zk01VNUeymbQOl0zh1avFA3Kk/2/kFA
	ubAaB5QWQhIBOv4LOq1/bevFEPhdd2EAa6Ge4B9QR9izAvH+Sic5ur5+lkZqDhZNBmMnOjBwao9
	4jkLEIJUs3ueqSrPG/EUBhQsfbjgwUUQfrxGtdge8La5mm9ASnbbpWXEmymiiutlMoKsSOGyoaf
	IwVh9qCIrjTIlzS4Sfk5FKnUpzUdgZ4zp/oiFztJgEEXzWoSyWyHPKdkAU7SBe+ezpOm0IVNNea
	Z8acKIOMidtZZRZKPwtucXdt2vOZjmsCfxplqGQN8STPuyh+LuAJHtIImtrnsT0jr0i97UZpq+3
	Pji3uNw+AJ+I6wxcxnZN6j+IJoA8V47KpRvrETul620C7whSTqTiTL9OSNGCkvWyQv106im1ift
	B4F2XkQSlWbMnwz5eGL8TrCftTH+lrMvp+Oy9msPw6pjexG/Wxa5Lp0d2qPHpZQqf+BmZJ6eLk2
	ltzBqC92h9Vmg==
X-Received: by 2002:a05:6000:1a87:b0:43f:e2b7:7160 with SMTP id ffacd0b85a97d-45eb3673319mr4587250f8f.4.1779445944458;
        Fri, 22 May 2026 03:32:24 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f548sm3620523f8f.2.2026.05.22.03.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:32:22 -0700 (PDT)
Date: Fri, 22 May 2026 12:32:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 06/10] dmaengine: tegra: Support address width > 39
 bits
Message-ID: <ahAtps7D2ZgjlP6f@orome>
References: <20260331102303.33181-1-akhilrajeev@nvidia.com>
 <20260331102303.33181-7-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cevphyjvhbnvt5ow"
Content-Disposition: inline
In-Reply-To: <20260331102303.33181-7-akhilrajeev@nvidia.com>


--cevphyjvhbnvt5ow
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 06/10] dmaengine: tegra: Support address width > 39
 bits
MIME-Version: 1.0

On Tue, Mar 31, 2026 at 03:52:59PM +0530, Akhil R wrote:
> Tegra264 supports address width of 41 bits. Unlike older SoCs which use
> a common high_addr register for upper address bits, Tegra264 has separate
> src_high and dst_high registers to accommodate this wider address space.
>=20
> Add an addr_bits property to the device data structure to specify the
> number of address bits supported on each device and use that to program
> the appropriate registers.
>=20
> Update the sg_req struct to remove the high_addr field and use
> dma_addr_t for src and dst to store the complete addresses. Extract
> the high address bits only when programming the registers.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/dma/tegra186-gpc-dma.c | 83 +++++++++++++++++++++-------------
>  1 file changed, 52 insertions(+), 31 deletions(-)

Sorry for not noticing this earlier.

My understanding is that previously this IP (along with most others) did
support 40 bit addressing. That's a much more natural boundary, too. The
reason why 39 is often mentioned in this context is that bit 39 was
treated specially and interpreted by the memory controller as a way to
swizzle memory between the Tegra and discrete GPU formats.

I assume GPC DMA was in the same category. I'd be very surprised if
there really was a limit on exactly 39 bits. Looking at the register
documentation, I see that the high address register is 8 bits, which
together with the 32 bits from the regular ADR register gives 40 bits.

Given the above this patch looks wrong. Technically the previous
iterations did support the full 40 bits, and that should be reflected in
the DMA mask. The platform-specific 39-bit restriction due to the
swizzle bit is something that we've always represented via the
dma-ranges property, but it doesn't reflect the capabilities of the
hardware.

It's a bit odd that GPC DMA on Tegra264 supports 41 bits. I think the
regular address map is only 40 bits, but I guess if the registers define
it this way, might as well support it.

Thierry

--cevphyjvhbnvt5ow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoQMLIACgkQ3SOs138+
s6GMKA//Zsd4id+3QfoWyRWwhV+6CfBiwzkSsWLutUEplaLCZX9m7tkf1dqz++/4
Uan45SUGxGwuTtklIb9KqGn6mmj8m610UV+2rxoabpFAYm3g6V2oT2L+0yVegL7h
upbIvuRAbfDNX4IpVB3bfD5adzYI3+rvq0XZWzY+Zcqbo4gbwImrUUVUIBBKClre
xG0f61R6LYLnw0NLeZ5PJDhoGhM7hnNCn1/lYzVyRi8r5psw+29BpkfAqgMUOuYZ
E0WSJtR8NYEXbQ3yDUTNigAKeCC2vlSX9aGvDWwU1Qms1Tz0EB9Oy77ZuJREWJfI
rbty4B/9jXCHnFdQ7NW/48o2gNqPoVJ8bqrCyqM+G1Ynzp3LZFpyIRczccSUcsXG
WWWBuFLhe/k87hSwIZR7ECj73zOl9805T/0WOQ5oadix4YZpivB5PQu5W6saFg/Y
IRU/ei+YOt8SGwWSdXVvetFmRLqoiXflFE9nmrDPtHoA3ZSstvVgPqDGqGqTGjVG
CelizaKOYRsSGW64dJEZxLDjaJxeyhThIj7/ReuATh9khCkTaD9RbOc6ktNUMggQ
JGDMztbSxfgDwPqJ2M8L87qly5FBGN1REL7C7h8+5UtU9XP0H+XXv6mM0cxnJLU1
WsPURBePMEITyNOPQz3w2WlnSob7Erlr7waccIcUtliOGBZt8F4=
=r0y0
-----END PGP SIGNATURE-----

--cevphyjvhbnvt5ow--
