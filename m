Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D40296BD3
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723840; cv=none; b=HNz462hhbj/b/rZvhjNRlOk5ZrscNoNczwomi9kIG9JtHWuGwF9+z+2cMA9LQojhLzm5m0N10sYCK9NETaUJSVoz/xHnqnWukPB0vVev6UqYSxUJyJ0v/71x9O6s47csFyjSzAP3paCKfONZjz8zlZyExmnog8r0a5Px4AsFcMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723840; c=relaxed/simple;
	bh=q+VC3HNscJRAYLwmC+AlOcfIPsopsHwBlJvq37zCfKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KNtm1MHRPRaBPwk/0fuYYC0651HEO1XN8pIPSfabv3FpdFql9mPOxMYGuaTm3Jp7bn8oXcxx7wvGJNlpWUXP25QMQooiYgAzUjePuG+3+NngnRxObL0HSUg00heNOixMgVD64nMjQh8rMhLkGPbsyYydugh9SShTAt1tuGl0m/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaBsUaDw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaBsUaDw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso7119235e9.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 06:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791723836; x=1792328636; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUUhsclM68Xjsn8h8HY1t1Xbm15vgk+qa6obR6iKY2U=;
        b=UaBsUaDwWVkzo5WCVqG5RALoi+cdvQyO9AXs/2fpXcYy/dLYDlfPH052uw8mKfDCjz
         1QlFEj6ZajJLc0iDmzO5wmWYWjrYFgdQU8ONqZSNMLQtmLFUejwdIR6qh8MVT9EOGRVi
         canSeBuDhs4WvVRH0VzexfiQyM/cDLG2/orBK/GC9yUcjH1DZfy2JArwvE6bM5rT6Z5r
         IP03F3U1W/WWTcusbLjOhSyZQdcHJqhJ/baOsms7TwsY0chqLG48zOCQVOpvQn/AYZ5V
         oiyL6JuGmr0jw2Mfx8/Daj7SkUx1a6KhczRzekt63iVFgFLhWdUd97SbwgILJnz2ntUc
         2RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723836; x=1792328636;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XUUhsclM68Xjsn8h8HY1t1Xbm15vgk+qa6obR6iKY2U=;
        b=GY9YA/TGtJBWvD7ar3rz/F+FRCBylfWF8gKwNDqUEKcWhU26RYaJjutxUapYuhF+P8
         NYZFZ0JL/dCRjFvddEcrZboz+L/crZIWsr80jRZJg3piVe+00QTowiSHNEzt6YYQWCKG
         F+bI32tzhtWR9P6gW5ohYzVlOTeXdB34QRZ5s/iZE7pV5O470laY82TZrszYEOgBOqsx
         x+EII4c44FeMp0LkxK4/MYuXAoxcZ3vQCBttAbJPUGlVjPbgLt+Xswuy99HiyXRjS2RQ
         IUsAzuLTKm33TaQBuqB1szE9oA8VJOi6cY3boD5CzrdRaOZl54TOX+CkocyJ2EcHL2VE
         Nn5w==
X-Gm-Message-State: AFq9FYIlrvBmAyJziVQDzPKJ4kwiQaXi8+U+XrTM7jkRpEVAtoc+JaI0
	lLy9t0YPjpfFxtLPgxuh7c4yKMuBCzQCcglOwvVcckBUgdzewYZYxB5p
X-Gm-Gg: AYBFou1vT1Y3Eqm3oDjtDZrvbmYZjIJCp0PJUqYROnflbOnzS4LKfmqMBK0zNfBFbAr
	xvIRGVCOUb4qbyiuj8VTc0P6/qa0Sl4f4jvo2D9QpD30iPCleOL9JDgnZ1jjqwxYCYzP26IX/4y
	Ym8rOdkEXA0C+/iIPUEn5LadsC/j8qZ/xMbtAP63XprWdYbsiboIhc5eDYc1dy71L3HGfIP4p5a
	qLRmIc2eGnuDYwjpz7zRZlwEtg2bZHmADKuZH6VUfaGIEctc9gg1u2vtqtNH2SOFIMg8qKhfB23
	fcfe1uveJDYYk3XvcUe/TGUVYX1uNXXTXENIILijIeuMEFoFAU2g2cMpwz8j0PYVrnymNIz2ZL9
	0Ww6SFqt1vpgTlCTDwe+oV2J05Oc3lx63Zktn5qjqRSFbSQvX5x+fjJosLvtGIs74G13qnxX5uj
	s4fJb8oyEds1dnq1SPEJ8C4zZC2I0j3cenNs0kPY3DE6frUAsxP847ui+FlZnESDIgUOIlljdHE
	SyKXK49AE35opVb4+jPYFrDBHC3bQQLUro/H0b+3w2QSt3OXk+v/EiK
X-Received: by 2002:a05:600c:6215:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a18e4ca157mr109610335e9.22.1791723836253;
        Sun, 11 Oct 2026 06:03:56 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm243456455e9.7.2026.10.11.06.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:54 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Sun, 11 Oct 2026 15:03:43 +0200
Message-ID: <RqVLVgMZQZCOx29YUhhdJQ@gmail.com>
In-Reply-To: <20261010130024.177503-14-ghahramani.navid@gmail.com>
References:
 <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-14-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartayMeA89TTDyMHsX0IsJQmw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartayMeA89TTDyMHsX0IsJQmw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Sun, 11 Oct 2026 15:03:43 +0200
Message-ID: <RqVLVgMZQZCOx29YUhhdJQ@gmail.com>
In-Reply-To: <20261010130024.177503-14-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi,

I can't say much about the substance of this patch as I haven't dealt with=
=20
PCIe before. What follows are just some gut feeling comments:

Am Samstag, 10. Oktober 2026, 14:59:51 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Navid Ghahremani:
> +static int zx279128s_pcie_init_crm(struct zx279128s_pcie *pcie)
> +{
=2E..
> +       /* Ungate the clocks */
> +       ret =3D regmap_write_bits(crm2, CRM2_CLK, port->clk_on, port->clk=
_on);
> +       if (ret)
> +               return ret;
> +       fsleep(50);

If this is a clock control it would be better to write a clock driver that=
=20
manages the crm2 region and exposes a proper clock handle.

=46or the phy parts that are part of topcrm: drivers/phy has PCIe PHY drive=
rs.=20
Maybe one of them happens to match the hardware registers, although that is=
=20
unlikely given that the registers are inside topcrm. Either way adding #phy-
cells to topcrm and isolating the phy controls in a phy driver would be bet=
ter=20
than having these two syscon controls.

By and large the zx279128s_pcie_init_crm has a bad code smell: It looks lik=
e=20
an LLM translation of ZTE's code to me without understanding what the=20
registers actually do.

--nextPartayMeA89TTDyMHsX0IsJQmw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrLiS8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiSIgP/2QBvIWwIVHmKwhmCg1p
GNxlKYheuEN95hM+/16s9Z2ZB19AJOH7rqbpRDkBHcnbRm9R+LVJmnbgDpd/wdis
F9ISmIuQA3MqqlCnUcqDQtFnAELUsxTgyk84j6Bzf0j6un4ch5bkycPs9QJvWLpW
9zsbHJzNhf//uv5WrtHBvO+vPTcJeSWtHr9/MjAIAgPQQiFsVWZ45xOeEaR5mApj
DbwtuBM2gkPdgGZ94rSLawNd/MklkWQOWWOrQf0qb6jyOVmPA0IU54uKUeCaStVH
xMmJ1nu8EBEvzyV8v1WlG3HjonSPc/SQRLv3IBD8cBKFFvnROuiXGvk70aLVg84F
tgFyWcjvrTQ61+aCnd/Yf1bFLKtwnMIjv/eMpUtceiZWwn0XYGlgCKnsW7omre47
71gTg5e8HGHR3wAfBpNLXlxPTREBzQQ7bP+MNbHFdbuilqat9yIWLjEruwUWP5DP
+a+SoFZOWXF+6RtdgaKBaE9HxI8YLaaHjcPDKLVxT5HPKGwu17MO9zuoFAMEtH+6
zosoJ3ZYNXiZp2LIBpJ3UERoHzqERgqAp8tSXaHFyGABlVav+fItIz+YLCw5DVjz
8T4drjN/zl2lJCJj22+ywIo4CNhkRZOvJ/FMUgwPIcRUy2wajkOHWsRTatDa+RxT
nfxS2kfTtdCAjzhnXAtEZti/
=+Ytg
-----END PGP SIGNATURE-----

--nextPartayMeA89TTDyMHsX0IsJQmw--



