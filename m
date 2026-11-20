Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195808;
	b=BVpOM40ZLM9Rc0VxO62TdQojhrppYVnZDgESPeaTrvBqs3a7PYUzHkhH0ZT63BmYq+LF
	 7phIOAuPcRJh86KM3Twmh7L7D7j3ZQaBnMi/VNcxlhs0eSiFgNDxaIu7/+QjrTFi1c2Ea
	 VzumsRqK4nMpEaXbx1uLhNmZslWytfuo2/kEVlw/EVatjru9NPDrEXuH0uASxYm5X4p4J
	 R0wBKGZDssxBaR8Oy6opWRJnlqsnsQh/O/UENp/EUTST7xx0VTjfDvDcmX618qMNNH6LN
	 irK2IEbDhQGPJKncTyjRW4ZMG84xpqJFve9Z940hRA35B4Yt8n0Xl6wT2eVErZN9LDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195808;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7bQnDQQGsXh/GfQqynI9Dm1mxtj1RYtKX42i3WjK0mc=;
	b=XVqd9uzfXvYU8/UW11W6dv11ObXpwUuc/rCDO4U7p4J46mNDhaV2KUrOkhAxbqGIdisb
	 rTBmtQ4sG5eMMmwQCU2vIREtTXPuoVFl9Bic7IJiQdTwZ6NQjI1RTMCqjeWn33td5+QFA
	 SYpA9g53WTVa1O7Veb6n1pucBRFM5h61hj5G4k9SljbceTkMQumfqBWDzeukSFQc+6U76
	 2Lc80eV7aJyhw+3JzVIxPFCtpjGnegnARRXeAVdg2pRIN/fen0t8BOTmF089HAVyHrToX
	 D5opzi6fpl3x34EA0JoHGeYYjaCMicNldq59bJtaTQbcGqvXper7s/i+LL9wOobLdtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ak10GoM2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3EC60A262E
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ak10GoM2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022061F000D1;
	Fri, 20 Nov 2026 17:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195807;
	bh=7bQnDQQGsXh/GfQqynI9Dm1mxtj1RYtKX42i3WjK0mc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ak10GoM21f09UMAhn9xS4VH3KYKUnQpdq4ly5HC3APsfU2fVM1lWOD9p10cFSqZLW
	 AIFEA2iqY8/8f0EbuMkbTU/nfHjeT0lOkETNHBWnrSCju9p14KinKw4cDNpB569+4x
	 9D774GkyoqFCw4z4G0Dl545f+dXZKOhmkRZ9Ci0HdQA9ROgnoI0fa669aoWetma5kk
	 Onlm74kHyq4n1tZKgmatH2HpN2U9PcYBKLOqV5QQOgQxL3kRVlQa2lVm/bb0/KbYHp
	 JzjOsZfh+0qAtIpYwPkVxdAkdKC0SF3YRv29kNhd+UpEL66VeabmcUCxrXJTgOSast
	 fEE+g7KOjKMHA==
Message-ID: <sashiko-outbox-225665@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/11] mtd: spi-nand: Set the DQS spi-mem capability
 if available
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Mark Brown" <broonie@kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, praneeth@ti.com, u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20261120-winbond-nand-next-phy-tuning-v4-10-8c21e1f71f41@bootlin.com>
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
 <20261120-winbond-nand-next-phy-tuning-v4-10-8c21e1f71f41@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 17:30:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] mtd: spinand: spi_mem_set_dqs_pin_available() called after
  SSDR negotiation
--

commit ded1f01b00a338383ed4e62228f6b415856c9df3
Author: Miquel Raynal <miquel.raynal@bootlin.com>

mtd: spi-nand: Set the DQS spi-mem capability if available

This commit adds the SPINAND_HAS_DQS flag and calls
spi_mem_set_dqs_pin_available() in spinand_match_and_init() when a
matched SPI-NAND chip supports DQS.

> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index fee4a48b4c7f3..6e1b7976d2379 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1797,6 +1797,9 @@ int spinand_match_and_init(struct spinand_device *s=
pinand,
>  			}
>  		}
> =20
> +		if (spinand->flags & SPINAND_HAS_DQS)
> +			spi_mem_set_dqs_pin_available(spinand->spimem);
> +
>  		/* I/O variants selection with octo-spi DDR commands (optional) */
> =20
>  		ret =3D spinand_init_odtr_instruction_set(spinand);

[Severity: Medium]
Should spi_mem_set_dqs_pin_available() be called right after
spinand->flags is initialized, before SSDR operation variants are
selected?

Placing it here leaves spinand->spimem->dqs_pin false while
spinand_select_op_variant(spinand, SSDR, ...) and
spinand_support_vendor_ops(spinand, info, SSDR) run, which also evaluate
1S-command DTR read variants such as
SPINAND_PAGE_READ_FROM_CACHE_1S_1D_8D_OP.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-winbond-na=
nd-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com?part=3D10
