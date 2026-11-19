Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082575;
	b=XlNEwXC3n3VacJn/q0t4oMbH6nPov4QVz758wCeDLWFO0JEx3Sz3ZPevSPhQQrmA0B9G
	 CWkE6Jmm3aoMqZaJGDQdLfihOU+ZRaHgkran8VePZfM9NBMRl6r8xeBbB3oYEhzPBPIiN
	 MVc07XTkdJCW9Gs/72WX4Pdeqg5DkybYTfnv6e2YJ/1hzNJENCXQ7WNQZN7XL1fYHwQKb
	 TBzEIVfRuxI1+YHsGl06DD9QHgkL5tWfYryVPCU+HElmG89b+DWuwH68nZLJWxBPXO9pv
	 YAJZ4un89Yq18Vr+/cTK/mGo7jx+W/23Uwv3zUQgibcxqvW8sXX05f7FLLl9nAw1cmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082575;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=h56rJTgW+mBiqUYUBZbrtrSws90RS7CiPiwYe0b16cQ=;
	b=U1Ae6j/t9X123I1lE5m4Uh8mFmW+Br/a17agEPWPvD7Gegbzcv0HS9vv4sz/ohUyM5DX
	 c4CnZPEk6hTbWDRyvGOhjndPSQI+V69jp0aChFIREGgQhv0yPKAyqXerHsT7MhrflIWyl
	 ypoL7NnEcll4U96Hizvn3qsV55FaX7TjYb1cAS8aFNRaxdeqtUUREyXCEj/KQvokscBoB
	 p/JRWnEMkF47KjGYT9T2uW0l8S8ii1sdS93WzKUWobRCJecbj5ve0YYvv9Gk6dwSpKeBd
	 0emwuseOYu4dllXCxqzJ+6MX56XMbM87SVEHDegstcuax9T74q9OeMgO5w3bFEdxpXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rfv0oNap;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A092606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rfv0oNap
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524A01F000C4;
	Thu, 19 Nov 2026 10:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082575;
	bh=h56rJTgW+mBiqUYUBZbrtrSws90RS7CiPiwYe0b16cQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rfv0oNapJVXcVT27QL91cM3N7qeFI35wXUW0DB8oeCuvqbRtd43b9zfpzU8DzjX7Y
	 h6o5dYeyjUDf1A6dDT572Yiw6v+rfi1+BynMJvpnBx5AtWscR3w5D1d0BB4acC4fPf
	 870+1BSp6n/1f/8+X+fNaqxEKHU47MuXIVG6lDwj5VUPDpQ2tCqQCqjNajk1Q7w9e9
	 3KIwBUkXmyowQoNLWTZHudghxvHr29THzxOeMbY3EnWwyUvSA2XNWcP2qU411co+Ow
	 Dd6KECNM+1O9kxBBzqOqo6nHNIr9+8YOU6TRI5MwIOksTUCVKVga7EScNygWtWNH1F
	 /hbdA7vsnODTQ==
Message-ID: <sashiko-outbox-222903@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] media: i2c: dw9719: Update DW9800K driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Griffin Kroah-Hartman" <griffin.kroah@fairphone.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-2-df26c431595e@fairphone.com>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
 <20261119-b4-dw9800k_cleanup-v4-2-df26c431595e@fairphone.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:02:53 +0000
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
- [Medium] media: dw9719: missing model assignment for DW9800K_ID in
  dw9719_power_up()
--

commit 27fb69542cedffbeec27abdb7294190f101ca2f8
Author: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

media: i2c: dw9719: Update DW9800K driver

This commit updates the DW9800K actuator support to detect its hardware
device ID from the INFO register and configure SAC modes, VCM prescale,
and SAC timing according to the datasheet.

> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> index 5d5da0439dba0..efd81a9d7c133 100644
> --- a/drivers/media/i2c/dw9719.c
> +++ b/drivers/media/i2c/dw9719.c

[ ... ]

> @@ -165,6 +171,11 @@ static int dw9719_power_up(struct dw9719_device *dw9=
719, bool detect)
>  			dw9719->sac_mode =3D DW9761_DEFAULT_SAC;
>  			dw9719->vcm_freq =3D DW9761_DEFAULT_VCM_FREQ;
>  			break;
> +		case DW9800K_ID:
> +			dw9719->sac_mode =3D DW9800K_DEFAULT_SAC;
> +			dw9719->vcm_freq =3D DW9800K_DEFAULT_DIV;
> +			dw9719->sac_time =3D DW9800K_DEFAULT_SACT;
> +			break;

[Severity: Medium]
Should the DW9800K_ID case also set dw9719->model =3D DW9800K, like the
DW9719_ID and DW9761_ID cases above it?

If the device is instantiated via a generic or fallback ID where
dw9719->model is not already DW9800K, the switch (dw9719->model) below
will take the wrong branch and write the DW9800K defaults using another
model's register layout.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-b4-dw9800k=
_cleanup-v4-0-df26c431595e@fairphone.com?part=3D2
