Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536592;
	b=oZbRZUK5FDxAtT38itK4GqRgNPuInIo6rynmL2c1SqqbDqKuCzpnR2eJmEKAjt+NpF+0
	 rUq43ht1areuSXEsdebm/K35Lqg75encbXnSlBt5N7zDw00MAAZSK14NyAnHIL+oxCz0R
	 JnrnBpTyzMJfCq3da6Dxi2rg8XDDvChXQpfEtR+I5YFjJkre1oryAuXj0VTTLVqXUCM9P
	 HlUeN1vUiWk6WK6Ll0oDqWWfzbDER4mdyc6ZhWL42dAfMhlAhvYfXUaEKRCkEcPvEsigH
	 2NmnOK79FWiq+QHSVk6JLgyetNbA9jd5LV5aptTA9IgyRcu6b2PhAfW2zSpQVxc5/Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536592;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t8ZjfPRSG9HJtipz5fNNGb10T+NLQlGfxzG9Gitm4As=;
	b=O46CDrMJ1RGvJQgtOskoQT46fxMTlKjkCJpEpMzbAjV4UzX41AmX7Sz7+2V87eqj2cek
	 iWIPwL5IyVfYuNUb7URuDf/NYADMgwD5Xr9Pg1TqcQAV6jGW27wo+Rk0cBrMGtFkz8Cas
	 sKwhvfq13xZK8zBOEeHrp0B5/M15MSpymkC59yaPOwSRlnJ+lhv5PUXJ1NNr80oKrNDme
	 fNaT/elNzJ8Pr5Q6gxxSkGGumUKlZ+8BpmJ6rYSs4H/64EFmHNllWV+DlYqPov+goKe+h
	 BaE9ucHW6fFRBVvb1jmg6s9QILwA9dIuqfmmmatJHLLixLwN3bVeQglrm5Up8ULyvuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jgFoEId8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756CD606A331
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jgFoEId8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28671F000C4;
	Tue, 24 Nov 2026 16:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795536592;
	bh=t8ZjfPRSG9HJtipz5fNNGb10T+NLQlGfxzG9Gitm4As=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jgFoEId83C3WMYleqZh7uKZH+Np5kScOZrqBM7QWYD2ZDkVraC6PQ2ARfRgLjW6VN
	 G32gVqO7ucd9pmgBq1c4Vur9rVLU8YtQrwP23YTutRA/B8mhJIJ8/NHiaZKGcUEWRh
	 WQ/+pcyx2Q+Xl7J0IHe11O98YBOCu//wBK8uap5zGQ31tjFApELwPGkWLoovLqhHxr
	 bf3Jw1GNHyL3GByYsw0bhGODWC8hIj7HPeh+hH8gpN58IzMqTlSr9skgkD0O3JoLYz
	 Bdwic382V0gPhqedjBYLmR34UQNUVmdu8uImOHKdKcRRfVVolAFqMD/XXM9UI5A4vA
	 ZJVM5q1QRaklQ==
Message-ID: <sashiko-outbox-231533@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 14/18] soc: starfive: Add jh7110-hdmi-subsystem
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-jh7110-clean-send-v8-14-de92635dd857@samsung.com>
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
 <CGME20261124155425eucas1p2035620902a47a26cb56909c0afda250f@eucas1p2.samsung.com>
 <20261124-jh7110-clean-send-v8-14-de92635dd857@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 16:09:51 +0000
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
- [Medium] soc: starfive: wrong regmap stride and val_bits in
  jh7110-hdmi-subsystem
--

commit 53f4e237d4154b9fe38d95df3857cd80819078dc
Author: Michal Wilczynski <m.wilczynski@samsung.com>

soc: starfive: Add jh7110-hdmi-subsystem driver

This commit adds the parent platform driver for the StarFive JH7110 HDMI
subsystem, initializing a shared MMIO regmap and populating its HDMI
controller and PHY child devices.

> diff --git a/drivers/soc/starfive/jh7110-hdmi-subsystem.c b/drivers/soc/s=
tarfive/jh7110-hdmi-subsystem.c
> new file mode 100644
> index 0000000000000..b01dc66450f51
> --- /dev/null
> +++ b/drivers/soc/starfive/jh7110-hdmi-subsystem.c
> @@ -0,0 +1,72 @@
[ ... ]
> +static const struct regmap_config starfive_hdmi_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 8,
> +	.max_register =3D 0x3fff,
> +};

[Severity: Medium]
Should starfive_hdmi_regmap_config set .val_bits =3D 32, .reg_stride =3D 4,
and .max_register =3D 0x3ffc?

Both child drivers that consume this shared regmap address registers at
4-byte offsets (offset * 4 in drivers/gpu/drm/bridge/inno-hdmi.c and
reg * 4 in drivers/phy/starfive/phy-jh7110-inno-hdmi.c), and the
controller's own fallback regmap config uses 32-bit accesses with a
4-byte stride:

drivers/gpu/drm/bridge/inno-hdmi.c:
static const struct regmap_config inno_hdmi_regmap_config =3D {
	.reg_bits =3D 32,
	.val_bits =3D 32,
	.reg_stride =3D 4,
};

With .val_bits =3D 8 and the default 1-byte stride, regmap_mmio uses byte
accessors (readb/writeb) instead of 32-bit accessors (readl/writel), does
not check 4-byte alignment, and regmap debugfs dumps step through 0x0000..
0x3fff by 1 byte, issuing unaligned byte reads to the upper three bytes
of every 32-bit register slot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-jh7110-cle=
an-send-v8-0-de92635dd857@samsung.com?part=3D14
