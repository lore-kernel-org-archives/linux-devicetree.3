Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2535E4D90DE
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353287; cv=none; b=M5jdla3bea6YIFDJdFAePxMW6mI69hLRnbIms3pRa4dVvE91K96J8xasdVifLyTYxezfkqNqgSt+kSD94hBrVmPrjJM3l3sUNDwTRtHGmSszFi0LIVoEKOyJlpwWtJBR3Vwvnz5+HBPFt8WbnzybvkYRfQDfsRTPkp07EQ/rMzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353287; c=relaxed/simple;
	bh=WKBYT1W2dFaQRf8qLuevEVGyG1udbjw5nceyhd6EOVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qrgcvjryIuvLD3FdjR/tMytbSRhEMZiqgC5T0H0UiTpht4LCCM/tam05vzPWPDzld6hxUtHTw+BracwAaoD1oqF5+OcWHRs5KDCgO9XQK0lCQJxdfl0GTjanvHMgLnXoOyjVxcMHxGmmIdm68P4j2yRXN62z8OSE4uJvLWnmJ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwFD3F0W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwFD3F0W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B2D1F000FF;
	Fri, 25 Sep 2026 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790353285;
	bh=9bBzpAEq6/Izw+Vn9r7gp2+3ew71ztlmOdkj8jszmkU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nwFD3F0W20rAJllBHBZ1Uvgd4m0zNtiT/BMl7ha8eohPKOvWeKur0k0pJ6ZM9o9Zb
	 abQc9yxyfbwtfWRoYiKaF9jeH2oOiZZmWLgX/iVUcRXz5Ocu7t425fr07JwZo2dDEY
	 IBEi0uokzUQKLXmoTNKoKKKvJ1aWv+enZ0l6IxtcEk8nL8UtUi2pNx8s0CImoAZuKC
	 V/gkEuv3Hk5B5hS8JW0IscA7HPI/gpK9ahMRfj+fr68at0tPK5Vsrrtl34bDcWj2H7
	 3olJdQYagQD9rxPFzVDhRN5RNLAYPWcckDUJ5azvS6GWNkXlkor7ToaNIS176OPNyN
	 CJIBA6UHnf4ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/7] ASoC: SDCA: expose class SoundWire probe/remove
 as library
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260925161049.758913-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925161049.758913-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 16:21:25 +0000
Message-Id: <20260925162125.83B2D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] sdca: API contract violation causes type confusion risk in class=
_function_probe()
--

commit d168d671e23f5aecfdc67da7d941b185751c5190
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: SDCA: expose class SoundWire probe/remove as library

This commit splits the internal class_sdw_probe and class_sdw_remove
functions into exported library helpers. Codec-specific SoundWire drivers
can now embed the class state in their own private structure and manage
dev_set_drvdata() themselves to keep per-slave state.

> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
> index a092ebaa620aa..0e6dead414959 100644
> --- a/sound/soc/sdca/sdca_class.c
> +++ b/sound/soc/sdca/sdca_class.c
> @@ -136,18 +136,31 @@ static void class_boot_work(struct work_struct *wor=
k)
>  	pm_runtime_put_sync(drv->dev);
>  }
> =20
> -static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_devic=
e_id *id)
> +/**
> + * sdca_class_probe - SDCA class SoundWire slave probe helper
> + * @sdw: SoundWire slave
> + * @drv: caller-allocated sdca_class_drv storage.  The caller (a codec
> + *       driver, or the built-in class_sdw_driver in this file) owns the
> + *       allocation and sets its own dev_set_drvdata() -- the framework
> + *       does not touch drvdata.  Typically embedded in the codec's own
> + *       priv struct so codec drivers can keep per-slave state.
> + *
> + * Codec-specific SoundWire drivers call this from their .probe after
> + * allocating a struct sdca_class_drv (usually embedded in their own
> + * priv) and setting drvdata to their priv.  The framework fills in the
> + * sdca_class_drv fields, sets up the class regmap, and queues the
> + * deferred boot work.
> + */
> +int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)

[Severity: Medium]
Does this documentation accurately reflect how struct sdca_class_drv is
fetched by the framework?

If a codec driver embeds struct sdca_class_drv at a non-zero offset within
its private struct and sets drvdata to the private struct, won't this cause
type confusion in class_function_probe()?

sound/soc/sdca/sdca_class_function.c:class_function_probe() {
    ...
    struct sdca_class_drv *core =3D dev_get_drvdata(dev->parent);
    ...
}

Here, class_function_probe() fetches the parent's drvdata (the SoundWire
device) and blindly casts it to struct sdca_class_drv *.  If the codec
driver's private struct has sdca_class_drv at a non-zero offset, this will
lead to a corrupted pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925161049.7589=
13-1-srinivas.kandagatla@oss.qualcomm.com?part=3D3
