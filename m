Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DE53D8106
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779870540; cv=none; b=gSpfaRZPaAOp1SWoDzcPaUEmrBnIWmHsFUe1oiVRCDPEy9U9kvp+lT5+inPCNPjdI6vReFwDeAKjO4kufhXrkMWg7C6YO7GOsPyX6H92NGNiTOoysWzuwm9+B+eGwVlq805LU4yBc6nRUUwBj+VNitfGjK10mJVNRCbodDeNcH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779870540; c=relaxed/simple;
	bh=dnKKV4k9imrwOYYrkrG7utWup+ZEdJNlE4/zhl36kBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKIFUrMTrOXdwTRqxlIJUpXej2tV20uLpAbM3C+Pdut6cwNPrmklSoszjg/NJcMauKw3t+PtB4wwvbrvbsPfcxRZQxNszZ4+/B1dhg/O8NmvHY2IFyc/znC56zg/iBaAZ+xtQvvRf32/A5jQZ+Xgym1PuVVd8naykHDNjo73lYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hq698nOU; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hq698nOU"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44a14580111so8453961f8f.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 01:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779870536; x=1780475336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXP90BLkmwM022fcUvwY7xPlmUwoYsB+/2erQUJ8WqM=;
        b=Hq698nOUn4wUZTU18JpCC2UeibTPT3RxLM11uHaERs5WIG4PXnTt7IFoKvxGKOfO2s
         rUIBjxBYd8QjS18JjHhqBAZ9cohwcCNPxgF7tare23DAQX1t8OoVZ21lyFkNBUgbanK1
         DDHx+Zs5vNTHU+KwTKWgjUXittWyo//W64HFduvlrUMr1OZeFNadh7Wpnz95NLYxKJMy
         zXGdMkzOhsbzRUZA+W5fmYl5izkAFj7ywlGylCy6e8DqLf2vTcy3crbNN3zlwdsY3pb4
         1GyadCEIQbENK7HaZjyrj+XxRtLprmxbcePVkAkQE03rml9oT+HvVcKtHXPrZE9SARBX
         wr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779870536; x=1780475336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXP90BLkmwM022fcUvwY7xPlmUwoYsB+/2erQUJ8WqM=;
        b=MmOqo7Kc41xg2xc8+oXbpiBPscbTN6ZgOE2uLRm1GE54Sm3BtjQg/ls2rYFpa24gQ/
         U6ZzgiyZZ1/3PmKK+svU8ngAB8xI+Po+6y9fN+GoOAswdy0lFWcghh0b+BeVwJ4fCYV4
         MDFY+Ulua7sUIM+9Gy77m15XkKsPqP2k7jM6ecPOM1hVme51jYm3DqcgHR1UjXl8Oe6v
         jSDufQ7k/3vCfxukwPVVuEeBTH7GALYmAdHsPWcRo6/I6MZC2XoYpgX+5fxGixepyLYd
         Gdfsfx6bFP+ZnUkThS5VixAqWS1JU67hHpq7N5x7U9cLn2j2faFn1Mx12Q9Ea3yCw0Gs
         xvNg==
X-Forwarded-Encrypted: i=1; AFNElJ8jehYgCbLU9HPYWYfsDNFv4s09uiiTbilonVXxaRetmlCyyMNxjBG8KYW2IFDLWNZ65qQ531tf31Je@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1X7ksqttiHmhk5Ow9C2LSioHdLHCnNDnesGlOB4N6C3me7Bsq
	tm95mNAOaKagEtsURr6Bu2n6Qtp4oQ9Ba5LTESt7v3QvmrT+qWOl9036
X-Gm-Gg: Acq92OG+7hLYeIJr2P0zvbX2IhflYCwA4zIEADtQRIBmYmRr4zuDedeXEtIUIwrLcda
	OhZS17UPl6+1rqs5Q9xRqSNYmUwDOu3hH1DAV01vIrlkCw8kGUSC/RbiTvZZ2r2a8NUeww6VOtx
	T4R5EtPtvlhN7XzDyhJUPLrpctcm2t6zN9pCDzccZSDotF3EAFrrCBMSHBPCz/u3YYJJG/SV8WZ
	kWbjOH9I5MQjyshLBtz1GHeJdEd/bPUjMEwtFdu0fVuzzNzpJg92oW8Jm+DY5oWCzPcoZL1rJoa
	54ST8SXjzUEv72GJoBDcLeJEX2scNm/uUrfh+ocQ+hcK/0PHWua+ZY5MqNl/sK4R+Gc4pM6COTY
	LbyVZXoLFkFTwnfWj98n53eFc9For2SrjLT+7wBLE7ySsqJgpeZGe+3opIOZQMh3Mllh8VEcwtz
	q7b8MJL1Tgq3Buo8QVTPKbPpmxiT3cNWydKQJMQ3ZWdXc1WZnf8cHURWcGYj37qxq4lpKMgay5n
	DT5clRLgBRqqA==
X-Received: by 2002:a05:6000:4b07:b0:43c:cf25:f29a with SMTP id ffacd0b85a97d-45eb3689049mr34779824f8f.8.1779870536122;
        Wed, 27 May 2026 01:28:56 -0700 (PDT)
Received: from orome (p200300e41f1bda00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:da00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5c27e7sm4474850f8f.35.2026.05.27.01.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:28:54 -0700 (PDT)
Date: Wed, 27 May 2026 10:28:51 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>, 
	Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v5 2/4] PCI: Use standard wait times for PCIe link
 monitoring
Message-ID: <ahanoZgDwq3v6x8M@orome>
References: <20260526-tegra264-pcie-v5-0-84a813b979d7@nvidia.com>
 <20260526-tegra264-pcie-v5-2-84a813b979d7@nvidia.com>
 <ahV_r6NJWnmJptT2@wunner.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y57fabq4zbjqmwuy"
Content-Disposition: inline
In-Reply-To: <ahV_r6NJWnmJptT2@wunner.de>


--y57fabq4zbjqmwuy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/4] PCI: Use standard wait times for PCIe link
 monitoring
MIME-Version: 1.0

On Tue, May 26, 2026 at 01:10:39PM +0200, Lukas Wunner wrote:
> On Tue, May 26, 2026 at 10:53:11AM +0200, Thierry Reding wrote:
> > Instead of defining the wait values for each driver, use common values
> > defined in the core pci.h header file. Note that most drivers don't use
> > the millisecond waits, but rather usleep_range(), so add these commonly
> > used values to the header so that all drivers can use them.
>=20
> Hm, why not just replace usleep_range() with msleep() and use the existing
> macro instead of defining new ones?

I'm trying to somewhat unify the implementations across drivers without
changing behaviour. I don't have a way of testing any of these drivers,
so keeping the existing implementation and just switching out the symbol
seemed like a good compromise.

> > +++ b/drivers/pci/pci.h
> > @@ -63,6 +63,8 @@ struct pcie_tlp_log;
> >  /* Parameters for the waiting for link up routine */
> >  #define PCIE_LINK_WAIT_MAX_RETRIES	10
> >  #define PCIE_LINK_WAIT_SLEEP_MS		90
> > +#define PCIE_LINK_WAIT_US_MIN		90000
> > +#define PCIE_LINK_WAIT_US_MAX		100000
>=20
> If you absolutely positively want to add a new macro, consider
> 90 * USEC_PER_MSEC instead of 90000.

That seems rather useless to me. We have a _US infix in those symbolic
names, so it's obvious what the unit is, so nobody should be confused as
to the purpose of these. I suppose if you want to make sure it
correlates to the SLEEP_MS variant we could maybe do:

  #define PCIE_LINK_WAIT_US_MIN (PCIE_LINK_WAIT_SLEEP_MS * USEC_PER_MSEC)

Then again, I count 2 drivers (in linux-next) that use the existing
PCIE_LINK_WAIT_SLEEP_MS, one of which multiplies by MILLI to get at the
US version (so it could easily be converted to the US_MIN version). Only
pcie-designware.c uses msleep() with PCIE_LINK_WAIT_SLEEP_MS, so it is
clearly the outlier.

Maybe I should just go all the way and drop the SLEEP_MS symbol and
replace usage by the US versions?

> Moreover, consider using fsleep() instead of adding an additional MAX
> macro.

This would then be changing behaviour again for all the drivers.

Thierry

--y57fabq4zbjqmwuy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoWq0EACgkQ3SOs138+
s6HatRAAg8da90RqnHjyUFhXOqP7Cjo9/fYMdwG9qKAW71wcGfZM2pK1xmC/LV0g
MIyhmSbMyevnALrOnbkobpjgl5QbrSNXE2CqxEKR49UlV0o2lATFB+EJlmtPiSN3
7Q464BWjHaibyl6UU5/FV9VDV0pJK5JQfH/x6I+G27E+XQqzMerQeYuq/Gl3ZLQf
1VZqhztZQ7U/GQBX2g+8FO06udWT0JDk5eNXwrqjg11zIG1C5rXkam1kmgXKYB4w
YDg5TN7DAqnWeSyE0j6DYVXNImRv3X+MvVW5fH09eJ5yE5m8KXdr26kDKTQ+n931
TTuyEB+mDL+FjI8JRMSU7nHPs3T16m4CtADOSx5UItd3EnHi/gIJMkmsbdo7P5yq
LNYGdCameYwMq2r7NO65c9R6H7ARCA81z8frzhj8cT9LyNmwwpLwPnc77oBArl/o
DsdZknA8CG5mHmZOvtcQkTfrdKTJQVolANFj8ARi1pg5p30uGNORSnDrsHSyCygR
8oZSWZr5pKs+aYMYk5c2HgNUQ2IHgEaFkTjdBVpOCTzTXX665DNQH+vANxV91jmx
oM5yyVFbEhPq2SdXpSuXAhDqjqLFWckgdB2NFdQ+A0qvjkUzyHqNsYBirxrtU4Cn
DGjDBzWzYCnn4KcL8eLVcYxybJBsBD+JwfOUv/k3QCFRDwtoqt8=
=BbZl
-----END PGP SIGNATURE-----

--y57fabq4zbjqmwuy--
