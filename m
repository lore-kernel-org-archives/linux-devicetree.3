Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41402773F7
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328277; cv=none; b=qL8tqg+uZmZ/I6sKuZN5/bxpvXZ4w3dM34sXF/f01lIa3VvEnNYgESB4vWnuP0/X8A7dPqNQMKRWLnb5mvYOYY/1mB8q2OqV0GuwVoKO/PK1Avk76Re7xyOOrDJhu//r+3gqKai+7P4oeuTSGRUpViDbwTxtQtm/Gm/6LzTkAAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328277; c=relaxed/simple;
	bh=zgxNMFruhF9c2NlkNWP/XB6NC2UZlGGz6HNW0gyqKpI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YDEdI1MfhbD7glSDsF9sLRlLPY8o1ZzMKBIX4d+7MrZCodCis9Dp4A3ng+nDJ4mHAdJu8qF0D6B2y3A3eo6XJN30/g0xI5l8TiyRpcQXqW5c6nmxvSza7eRNwQDH09Bpnay22h00EhGOkmqGCDs8gpmZrAaZvWmrqRZfDnEurro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SyGvd+XJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SyGvd+XJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463351F00899;
	Mon,  1 Jun 2026 15:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780328276;
	bh=z1nmKlyGUn1as5S0Ij4ZCrwvR7ctU1VHvpPjSSHlv/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SyGvd+XJTVGuLbWdTZS9iEcsJddqP4DUEZn32cwsZTz7o3hpxqGNV1WLclw2PUTz1
	 4Bw3GS8Pywzzdp6zO8vO5rhUgEtonYEmNicJbJBrl7L/I+LfcZ/GceKTUiLqLd0+cs
	 htiw5Zfk2hphzITGhfrh+Hpd2KHrQfDr0720ChAz27w1cMjt4Fp+2GOyojSGlcUk5o
	 5czFCvqafJ45MouPXnkFx3UHHW7CJHcKnYuQuLHLPPBCOnoa0ZBwDsoupZBw78gUan
	 E3mWz9tO4zSDC575Phf7N++HWycG/4QhzNQCsgqEO4hIWv5ht95Y/kde3cCEv3sqHj
	 f4pIaUdKf41WA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/11] video: backlight: lm3533_bl: Implement
 backlight_scale property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601151831.76350-11-clamor95@gmail.com>
References: <20260601151831.76350-11-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 15:37:55 +0000
Message-Id: <20260601153756.463351F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unprotected concurrent modification of hardware register and `bd=
->props.scale` causes state desynchronization.
--

commit 8adaee77dd01ba44b6fdadefc561f4ab4fed6761
Author: Svyatoslav Ryhel <clamor95@gmail.com>

video: backlight: lm3533_bl: Implement backlight_scale property

This commit implements the backlight_scale property to describe the linear
and non-linear modes supported by the device.

> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backligh=
t/lm3533_bl.c
> index f0d88b7bc229d..945625c54fc43 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
> @@ -161,6 +161,7 @@ static ssize_t store_linear(struct device *dev,
>  					const char *buf, size_t len)
>  {
>  	struct lm3533_bl *bl =3D dev_get_drvdata(dev);
> +	struct backlight_device *bd =3D bl->bd;
>  	int id =3D lm3533_bl_get_ctrlbank_id(bl);
>  	unsigned long linear;
>  	int ret;
> @@ -174,6 +175,9 @@ static ssize_t store_linear(struct device *dev,
>  	if (ret)
>  		return ret;
> =20
> +	bd->props.scale =3D linear ? BACKLIGHT_SCALE_LINEAR :
> +				   BACKLIGHT_SCALE_NON_LINEAR;

[Severity: Medium]
Is it possible for the hardware state and the software state in
bd->props.scale to become desynchronized here?

Because sysfs writes can execute concurrently, could an interleaved
execution of store_linear() by two different threads result in a race
condition where the states diverge?

For example:
Thread 1 writes linear=3D1
Thread 1 updates hardware via regmap_update_bits()

Thread 2 writes linear=3D0
Thread 2 updates hardware via regmap_update_bits()
Thread 2 updates bd->props.scale =3D BACKLIGHT_SCALE_NON_LINEAR

Thread 1 updates bd->props.scale =3D BACKLIGHT_SCALE_LINEAR

Would wrapping this update sequence in a lock ensure the hardware and
software states remain consistent?

> +
>  	return len;
>  }
> =20

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601151831.7635=
0-1-clamor95@gmail.com?part=3D10
