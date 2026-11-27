Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794555;
	b=C3eqLgaIwZ97mzyqZ+btaly6jDwzMm+VwC3SCvnkgm1eopxibW5qpp1NFQgLVeoZ6thL
	 ecRObSjC8D3olhbBqudcmolXzN60IBPI4zUTAeRKr33ncXwKankqeSeVfa5eBPc2ECnsp
	 19AMacAPRBiRZx5aukn8hv2tvTHJta/U9kx9ykG/I/c3iVL8N7cEBeg98jeUa/komXSLO
	 y2Ggp41vNuUjA/gtNS3gPSNgtvwMN+5WPVSOXE+2QCVqfEfRxq6Pxe6TSsBuVZU8Ze2EI
	 AZQkJ7MtINmQPN+sqRTT1HGcsNe7smQt25ggG85LjPwu67hW8eonBtLOzI4h2kv2Ofg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794555;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=hTQ12c5Ppjf+2QWFB73ZGvBVoo29MYEDLXFSwz+VyGc=;
	b=OWNtjQQu+98ILA3VZ/MEy+uUG4iJnTpmVV5lCyd6eCdc8sWqXmsHjAvc8BSe2IWbpzoO
	 7QhblJD9lmrChc2+u5kIkjXqFA86YwHD9vACGcA55NduBiQlMfC1H9u19ofFGHbZwA0Rn
	 oKRgPJbsWxfm3bapMiknl8kDAMfuin81gP+BK6CA1ajK+cREo+ta66IBnfZqOPn4cLQfK
	 uMKtXQzb9lXZExKGkINHEa7fNsE9AM5+uVkkJnLHDvBi3yM1E7vES7Acn0f/Worjj0LNx
	 SMj50aOkuAGt9YQ48SpYP+9txDH3PFmcsrAzPcb/qnsveOftUQiqKzRFSxq7LeKOzOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T7CaaTj0;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE212606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE212606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T7CaaTj0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BB629C2AC4C;
	Fri, 27 Nov 2026 15:49:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9C7E6049C;
	Fri, 27 Nov 2026 15:49:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5C1A11E90CAB;
	Fri, 27 Nov 2026 16:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795794548; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hTQ12c5Ppjf+2QWFB73ZGvBVoo29MYEDLXFSwz+VyGc=;
	b=T7CaaTj0PC3ISk6zRNcygBGtdxfZTwziV3QgflktUZantBBr1A3j6dRTzSg9fQ2Gx1fPLj
	xm6l0IC6HCsiz+lDhf2vO7qE4IXkd6MVTM5LpGiSvI3lRit9Ko74JkKd2xVy2IhA31x9Sk
	MDiZn3Ft5ZiXWfkgUV/H+ajY91yiojfmuoBE1sZLrBKDWGfgEdneWam/Zg3TVRbhXR2Xwt
	Qg6R1NOfQFJ0Z1vceVpASK28RuzqrR/wEG3GCt0ka2WmM4YS1R8hHIQzb5cFyfh1CD+6Hv
	DleubNQHeBL71alQzvZV1Vo9rQ+SzCeJ5WUJgi+kV+APZpozB9fexU7UvAMynw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/7] ARM: dts: helios4: fixes and cleanups
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
Date: Fri, 27 Nov 2026 16:49:06 +0100
Message-ID: <874id21dhp.fsf@BLaptop.bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Rosen Penev <rosenp@gmail.com> writes:

> Fixes and cleanups for the Helios4 (Armada 388) device tree, checked
> against the board schematics.
>
> Patches 1-3 fix bugs from the original DTS: the board revision hogs
> have the wrong polarity, the PCA9655 expander uses an edge trigger that
> can lose interrupts, and the EHCI controller that gets enabled has no
> port on the carrier board.
>
> Patches 4-7 describe hardware more accurately: the fan tachometer
> inputs, the microSD slot's missing write-protect line, and LED color
> and function. Patch 6 fixes a dtc W=3D1 node name warning.
>
> An AI coding assistant (Claude Code, Claude Opus 5.5) was used to write
> these patches and draft the commit messages and this cover letter.
>
> Rosen Penev (7):
>   ARM: dts: helios4: fix board revision GPIO polarity
>   ARM: dts: helios4: use a level interrupt for the GPIO expander
>   ARM: dts: helios4: drop the unconnected EHCI controller
>   ARM: dts: helios4: describe the fan tachometer inputs
>   ARM: dts: helios4: use disable-wp for the microSD slot
>   ARM: dts: helios4: use hyphens in fan pinctrl node names
>   ARM: dts: helios4: describe LED color and function


Exepting patch 6 (ARM: dts: helios4: use hyphens in fan pinctrl node
names) all applied on mvebu/dt

Thanks,

Gregory

>
>  .../boot/dts/marvell/armada-388-helios4.dts   | 53 ++++++++++---------
>  1 file changed, 29 insertions(+), 24 deletions(-)
>
> --=20
> 2.56.1
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
