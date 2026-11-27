Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793124;
	b=SoMJpaiXRVyg9SKYcvpHHdpnMEyYifq5pxowS8Nl0vasYdVDA+1mnLXMA5OOdSpkKSEx
	 nlb60/tkJo/9xirj/Fonqm2cTQ75NKP0dbQzkpMvRJguMN09IwcItTfSXl4AkL7z6+f3z
	 K2p1RW/dmuzRxgBTOewN4nWbPmXHOLHxK1I28PofALeUDn/yVtg8Xsk+zGj4EHzaEyMZg
	 MnDUMEZAk+6CfdMEIz3OwfzXGEA9NsldRawCs90uErXG0SJ201ywoJemvJW/YVrEiTeVS
	 PyFtPgJqokKNaZvwSIgTWpqMF5GRI2fYytvNkL3abGkUutfIE7/NGyvmuYLr8rEkL/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793124;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ESSDfIjILrrrOgKIHFr61CIF+AOlYCTGg3Q7YlxjKtE=;
	b=riEtzvttA7FNohHmumpKWORa2dOnwy8IL2f8aWiQhItV9Dng0zmFbwjx0Id/zJ2mB6XF
	 WbG5sjlzTJGwPU+jkTYrjDuL3a80BKZ7iQIh/OLw8QL9AdlOv0C32N0RnV9DinPTRGPIe
	 1tJq7ZqiE/24vNLi+jfdg0LOue0+7YkqMsQAIxkZ4QqyaCRZjRiKGuizegtqV/wQbwnLC
	 iGFLzredo8okToQJ+rriiQ45A6qO17YSv8ODsGPiHDPxB4o99mvautNM/ImEpXOUzvR75
	 q4Uv7VF+gs8mhhUW+3L9pAF4MepZkePKgr2Db6I8u/6Z96SN0Xp18GyLE2/ocifXtuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HgDoRzPi;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477C5606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 477C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HgDoRzPi
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B12461A1838;
	Fri, 27 Nov 2026 15:25:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 864276049C;
	Fri, 27 Nov 2026 15:25:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1738511E90BF8;
	Fri, 27 Nov 2026 16:25:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795793121; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ESSDfIjILrrrOgKIHFr61CIF+AOlYCTGg3Q7YlxjKtE=;
	b=HgDoRzPiVlpwHw7kzmcZNmRaaHAw1o4eLImi3oCCj1kEiCcandDP9AOHW1vUMo/x0Y9Gf+
	kHKBQcRVy9N2dB/LE8k0TTorzt+2qTBfbvWd3Xu1aECCFn3/S7jm3ZwunEpF1M/SsPkY8H
	kdCX0pbk/bhoL1uGlMcXWkHVT8W7jJkdM/0aQx1esn1/gYEXPVvefd7OHLeUDkKM4nfN86
	0JDN1A4QqAgjCwpfzsSK+rl1jY2wW+xBkeAL19NWPd1bDlchbrazY7wq7LXtuJRrfQowhA
	gpe1OqpMRHiKV00gJ80gqiqD8chfS5vc9QK9FO8Wf402rcjiJeZjR4gvPN34cA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Artem Novak <artem122novak@gmail.com>, andrew@lunn.ch, robh@kernel.org
Cc: sebastian.hesselbarth@gmail.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, klightspeed@killerwolves.net, jason@lakedaemon.net,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Artem
 Novak <artem122novak@gmail.com>
Subject: Re: [PATCH v3 0/2] ARM: kirkwood: Remove duplicate DS212 compatible
In-Reply-To: <20261110093120.179318-1-artem122novak@gmail.com>
References: <20261110093120.179318-1-artem122novak@gmail.com>
Date: Fri, 27 Nov 2026 16:25:18 +0100
Message-ID: <87ecc61eld.fsf@BLaptop.bootlin.com>
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

Artem Novak <artem122novak@gmail.com> writes:

> This series removes the duplicate "synology,ds212pv10" compatible
> entry from the Synology DS212 Device Tree and its corresponding
> Kirkwood Device Tree binding.
>
> The changes are split into separate patches for the DT binding
> and the Device Tree.
>
> Changes in v3:
> Added the appropriate Fixes tags.
> Split the DT binding and Device Tree changes into separate patches.
> Addressed the checkpatch warnings reported during review.
>
> Artem Novak (2):
>   dt-bindings: arm: marvell: Remove duplicate DS212 compatible
>   ARM: dts: kirkwood: Remove duplicate DS212 compatible


Both applied on mvebu/dt

Thanks,

Gregory

>
>  .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml       | 1 -
>  arch/arm/boot/dts/marvell/kirkwood-ds212.dts                    | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> --=20
> 2.56.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
