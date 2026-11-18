Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980913;
	b=cVqoAClQKZHPE6bxx5dNLZRlZTNhFkMJe+skdLrOit9Z41rTC88KhYy7gW8gVmF7yznJ
	 CIratqQRzXuZ3RQAk/VlFjer6lJ7Lx4QX/XTfy34IdlxIaokSygSnoBh4/4SA3VNcBweX
	 vp3E5uk4JoSasa3XYaPGRfT2RYZ7fSTqEEpyoXvjTsuPS9NGap7hUW5eny2vqELqxbZOe
	 hclmsnTF+gNpG836+zvUeq4SCAoafBgzprGYYlThgagZvvTQU0YkJJX7Invv7ptW/dpEJ
	 FYHno2aNoJgJ/66hDJJ1SRfKlcoJdu/gylGastaO6F+rS2uznJ5+LlSt3cTEvh/rT0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980913;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=3Ql1Gr7XMzmIYBbEO+a9ghZlVqPmLxdm3zP1UNICVgI=;
	b=wEcZvfNVis0tlbGvGYoGk2UYgKk4jhDhYkT0CakhRileOx9mYMfhr6lCsIY+BpiyOjpx
	 6ZE6nqeEuq5iXPpwmKAnFKOHspZsdOcjHk1zbA7Wgjm3s0bt9gz4yPDobWTOysr4BF+/5
	 0DiCfxKXiBO8mMK0X1MvWS3UbMcwJHpJP5kbxTWThr54hMhIhCnF1v4Vksyw+sIUojgmN
	 k+GPxohsogIxxuwlcJvBJaq78jj6dGhI/GeFgGnU54xWcx+/+FlvgfpMiUzDPYex2KF2w
	 1qyiPxn4gtJ7C0WaB5upptADkgVrpTbcksBJwGHwBzb29r8+nlf+OFGMDr45xJeWzgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ZCJ16S+p;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043CA606A32C;
	Wed, 18 Nov 2026 05:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 043CA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ZCJ16S+p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794980868;
	bh=3Ql1Gr7XMzmIYBbEO+a9ghZlVqPmLxdm3zP1UNICVgI=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=ZCJ16S+pRKus4/MhUuggytURC9+Oy87x/0tUm7jmxCA82pieK2ZUEenMnIbBmbkq3
	 hyLWRAOi8cGUhpwOeSbGMKgbpaoi5AW02jrBpk3v+uKxMxzrsqvFBksbcZUICRtMvJ
	 vzd8D48c30npOfzXbSuxs0bU5U7umt6oQN5L0XBQ=
X-QQ-mid: esmtpgz11t1794980867td74787de
X-QQ-Originating-IP: WqBZLnoXOwmHGTghcgp5ZEgWINbdmL0mzbXNLz00OgM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 13:47:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13421804356627132485
EX-QQ-RecipientCnt: 16
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=cf9fb9b6f5c1d24682a98b33195572b11c62bd4410fa3cbe45ce94883370;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Nov 2026 05:47:43 +0000
Message-Id: <DMY3M0ZQ168B.2V9AQM1FXCHY6@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 2/5] clocksource/drivers/spacemit: Add K1 timer
 support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Philipp Zabel" <p.zabel@pengutronix.de>
In-Reply-To: <8b5be415e255b5387099d9f8a9b8f5f05d4cb038.camel@pengutronix.de>
References: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com> <20261117-spacemit-soc-timer-v2-2-9264d0ea7755@linux.spacemit.com> <8b5be415e255b5387099d9f8a9b8f5f05d4cb038.camel@pengutronix.de>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OYpbVsTx4C81k6RhXicVSquGdMhCcixoLt6YOvj7Cv+KZrK6oOMg23T4
	UFsSreF82J1hoqhkEoW0UxjPrkjPQQ/DRJQ7/DAQ80y3OgoCHGowW/lorBG+DgrvPEODNdh
	Q4H/j5h8DIeZikQ4+liZCnghL52Wi50wcTrPjLaYiAV+WcPBFUuEDvPDFwBm/pq7e2C5ZCt
	HfLKZBwpMH313XipgtfSvv2S+eSZjx8sRVKEj7r1wyVll/RkrCkFVppKPGgU3aADWhact1I
	6VcZO+Wmh/oTEVVxM8jyMMS+1DH4Ty3aJKIO4n4vpcjKcPGwVGBMLGtg+YNt3CJD9vMHbvY
	H0ymnnIuJyKc19K90yQQpp8T1tdJlFsBPIRvh+cexKjZaxbvKaJov3p1tZTHmrxmoMBPPk1
	bExk77hPpuCQBEcCGxOF6d/07T6wlxEDv7ThSAokiqAtWfBls0R71t8ee+V2tijdDPbjbcX
	bsRb2nVltPxELnRYgTzZJOsSxgmqaMDCzRDb9CcGWoftDNVrr46kji1v90KBi0hDYSgIykW
	Z7Ft2dHfZakh5faZAG421rVsIZjCw+aWXzXkoqHizwFbJd18VZz8YIA3AnB0H5DnEqm8yS6
	JntgQC3uik49AiEK8qQ2T243zFJrUaSEM/LxQG7CcwRy+Kc/+9Zyk4n2kzuxFKMJ4CJzdaG
	sxzZyhPAjG/m3npuPYAzatEtnFINcFYiVAyW1ivxM5AGXBbugtOyRdzQaIfxYBlegREwkrP
	0JhU/sGyStCEG7RhO+Z40NSaxr4qo9OgwxC/CcLmPgHjq3NzvSwnH2ZNhGHnSE4m+5KzlCs
	dsUE8HuRRBw/RaoY/PE5h24izDIukknP2aZjr1pWQCI0/F4qjjddoHls3kfW8VBnAVodIJx
	d2Vlu1ezFHqGx+HF187b1kAGprPeXBGUh/WnuXMieYCEDhSjXgD9PC3Ij9vvq3Z+Q8s7yZi
	9fikNyG5tJN9U3ATmLaOh95Ln3r85Qq+NgNJLR3vQJMhnKeDpkZ8/Nn+qhaw8r+9hijTqWa
	YicTLCNBsZwfIBFZyeQ0nqBz1ckMamBYtF5vi69UFymRlt3YZ+VRl7R738NMNuZU98h558X
	A==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

--cf9fb9b6f5c1d24682a98b33195572b11c62bd4410fa3cbe45ce94883370
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, 17 Nov 2026 10:52:27 +0100, Philipp Zabel wrote:
> > +	depends on OF && COMMON_CLK && RESET_CONTROLLER && HAS_IOMEM
>
> Drop the unnecessary RESET_CONTROLLER dependency, the reset controller
> API has stubs for consumers.
Will drop it in v3, thanks.

--=20
Troy Mitchell

--cf9fb9b6f5c1d24682a98b33195572b11c62bd4410fa3cbe45ce94883370
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCav07/yEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+lUQEAthB6oPUi2jXt
IqbHKSVLLDvTw/RU7hb22TAJ38TsUmcBAMLwBrw6KEtlygOnqJaK3gXV/J5oro6Q
qQd0Uc3YEowE
=qCKP
-----END PGP SIGNATURE-----

--cf9fb9b6f5c1d24682a98b33195572b11c62bd4410fa3cbe45ce94883370--
