Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DD0274670
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740489; cv=none; b=HuJxIEeiMbRya2Uh1TdclO5iegbxu9opX/TkoAVWlhhL6Z+cC+f2/wuYBwsF/WrjsulNZpIgLTRCR+6wWnNk+cgJCSRSk0aksHgdjzBjCgXA6ytORINeHy/sOncp3ml/C7HrIAtZrQi4+gq0YjK/nXwiLVgKd82/E7c9YZh9NqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740489; c=relaxed/simple;
	bh=37MXNHXIjw91veeh1KN/jdq5pBXh93qnLDxE71BPDrQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oZTKAGi19hEVnHapqwkwLgniOFSek/vVMW/6l9MgYRAmGAiG3du19OQcDvBoSX3WxQKnV09ZkMu00al+BEuSgwUWlrklx5yX/PUiGhEsday5TIIUcCSG+TDZoGs2fi3P99kt635l2muGQV527pjxvO9aGKfsoutebFBpdoQcMOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXj5xRnc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXj5xRnc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04521F000FF;
	Fri, 18 Sep 2026 14:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789740488;
	bh=igxCe+lqdnFbKkEk+NOUOYjLHXFvV2ymKAbdG3X7FpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YXj5xRncY0bOvfOiX05dsyGFrGren3MkfW970g80nwMxK1JqQT2jptqco8y/i1Y4U
	 vK7zENasanVLynk/BA5tIr6l+ApDJ0ffuPS6lAWCIEIfKGfwxcLYF/1uCurUgsHzRC
	 eWrAWRRYQO7ICsIKwjMeQAi53c2tccYXDdKoARH5rDUO6+j51VX1fpVrD4UPvXq8q5
	 nNdPn9HCMcHluuHGnnVa1hWNF1kKZWsj8mGl3BujunPhe+BCtvwWC2bE/2DKIaiQxV
	 5ngEB5lHE967ImJDxmLYH38NqEpCkdNZyoxbmYuDkdhn1ziuc8p1VjRC/ex0oPWpBB
	 f8nTkU8Uy0SAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/8] ASoC: SDCA: add class_ops with populate_function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918131914.681588-5-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 14:08:07 +0000
Message-Id: <20260918140807.C04521F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] soundwire: type confusion via dev_get_drvdata() in class_function_=
probe()
- [High] soundwire: infinite spin loop in regmap_read_poll_timeout() due to=
 0 delay
- [Medium] soundwire: DAPM widgets silently omitted due to missing Entity 0=
 padding
--

commit fda476b8426451c92a8bb60b96f3c646d1aed378
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: SDCA: add class_ops with populate_function

This commit introduces a populate_function callback in struct sdca_class_op=
s.
It allows codec drivers to supply SDCA topology data from static tables
instead of relying on sdca_parse_function(), supporting non-DisCo platforms.

> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
> index 0e6dead414959..79fdb672be1d7 100644
> --- a/sound/soc/sdca/sdca_class.c
> +++ b/sound/soc/sdca/sdca_class.c
[ ... ]
> @@ -144,6 +144,8 @@ static void class_boot_work(struct work_struct *work)
>   *       allocation and sets its own dev_set_drvdata() -- the framework
>   *       does not touch drvdata.  Typically embedded in the codec's own
>   *       priv struct so codec drivers can keep per-slave state.
> + * @ops: optional codec-provided class callbacks (may be NULL for
> + *       pure-generic SDCA parts that need no quirks)
>   *
>   * Codec-specific SoundWire drivers call this from their .probe after
>   * allocating a struct sdca_class_drv (usually embedded in their own
[ ... ]
> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_c=
lass_function.c
> index 411e3d717bb6b..d83be8474e7b8 100644
> --- a/sound/soc/sdca/sdca_class_function.c
> +++ b/sound/soc/sdca/sdca_class_function.c
> @@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_dev=
ice *auxdev,
>  	drv->core =3D core;
>  	drv->function =3D &sdev->function;
> =20
> -	ret =3D sdca_parse_function(dev, drv->function);
> +	if (core->ops && core->ops->populate_function) {

[Severity: High]
Does dereferencing core->ops here cause type confusion and a potential
kernel panic?

The framework documentation for sdca_class_probe() explicitly allows
codec drivers to own and set their own drvdata:

 * @drv: caller-allocated sdca_class_drv storage.  The caller (a codec
 *       driver, or the built-in class_sdw_driver in this file) owns the
 *       allocation and sets its own dev_set_drvdata()

However, class_function_probe() retrieves the parent SoundWire device's
drvdata and unconditionally treats it as a struct sdca_class_drv:

    struct sdca_class_drv *core =3D dev_get_drvdata(dev->parent);

If a codec driver embeds struct sdca_class_drv anywhere but the first
position of its private data, won't dereferencing core->ops read
arbitrary memory?

> +		ret =3D core->ops->populate_function(core->sdw, drv->function);

[Severity: High]
Can bypassing sdca_parse_function() here lead to an infinite spin loop
during hardware reset?

When populate_function() is used, it skips the default initialization
of reset_max_delay to 100ms that happens in sdca_parse_function(). If a
codec driver forgets to explicitly initialize this parameter, it defaults
to 0.

Later, sdca_reset_function() passes this 0 value to
regmap_read_poll_timeout():

    poll_us =3D umin(function->reset_max_delay >> 4, 1000);
    ret =3D regmap_read_poll_timeout(regmap, reg, val, !val, poll_us,
                                   function->reset_max_delay);

Because the internal timeout check requires a non-zero timeout to break,
won't this cause an unbounded spin loop if the hardware condition is not
met?

[Severity: Medium]
Does supplying a raw entity array via populate_function() cause DAPM
widgets and routes to be silently omitted?

The core framework topological helpers explicitly skip the last element
of the entity array:

    for (i =3D 0; i < function->num_entities - 1; i++) {

This was safe when sdca_parse_function() artificially padded the array
with a dummy Entity 0. However, if a codec driver provides a raw entity
array without appending the dummy Entity 0 at the very end, won't the
framework silently skip the final legitimate audio entity?

> +	} else if (drv->function->desc->node) {
> +		ret =3D sdca_parse_function(dev, drv->function);
> +	} else {
> +		dev_err(dev, "no firmware node and no populate_function hook\n");
> +		return -ENOENT;
> +	}
>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918131914.6815=
88-1-srinivas.kandagatla@oss.qualcomm.com?part=3D4
