Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0E85326A3
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915322; cv=none; b=LGKfLTnZNkjvOkvyyxzq+27Qbm2jTYLqZgdGLBrco4PEmoq7CMstfYvzU4WdD4fmarPOXclyywbm4/TYxsIVf90w7nHW1DCGvR9DqYLWG8b8gzaFpD3bwHu2xViWiPDkBTvjg8LH9YZbf+zKHVOfo8rSFgOS9W3HHuH9f4z1lws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915322; c=relaxed/simple;
	bh=CnRIhCxuJyCLnm9hX4r/X3IOCBkUe0ROK8y4od7Mm/s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gscMDqr1ygmsYXnUhbk19ykuGcXkmmMfFLkixDxYFZtake9xD2aCFuFTrk4KA8581Fdq71uB/u7H77GtmJDHg2h+wRbnhg2/oKiT7duTXfVHU+WaNjSyNgrsUs3SuDFALn8lrzn4rjntw3bCpGkJ+83+JQgCxCwCHtjDSuBYNXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRHvQVoZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRHvQVoZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0781F000FF;
	Tue, 13 Oct 2026 18:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791915317;
	bh=rEwRYnhRg4VJ7O6wch3VrGpgeEdjT1YgoX54g3ic1XI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SRHvQVoZ/OZ9vHMMFTBL7R6e05TXB4M0tRDcPj5tG6/054ChazyzewKYqAX6L5pRq
	 idrF48olxUJR79gOGVUSP+WCL0OrRSur/j0G6xf8VBR2qrft8kO5o/1vQY4EdoKgwx
	 fc13XdxMdRHtaIr/mC+hj5jkpU/shEZ/5CTBoHUDkpdn0/4VW53lk5jfj4VNo2JR9O
	 mNlTuyTdBAs8bMfophXDTCq1WGPPx+E+yKRU/eegQEB9S0BnZoF/FwZ4gI53O+r8pP
	 D3S80KwByBeKczIXwofQcORKyvAYlm/B4LdQQ9nbVL1/2Z0kXsAv5f0dt5dRDfvv9f
	 NSJBnqdWyjcnw==
Message-ID: <sashiko-outbox-170304@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Support auxiliary devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013180253.477605-3-clamor95@gmail.com>
References: <20261013180253.477605-1-clamor95@gmail.com>
 <20261013180253.477605-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:15:17 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: tegra: UAF due to devm allocation in static snd_soc_card
- [Medium] mm: device_node leak for auxiliary devices in tegra_asoc_machine
--

commit 4f6320da37c0588cbe6424de9441b305591341f2
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ASoC: tegra: Support auxiliary devices

Add support for auxiliary devices, such as amplifiers, sound-muxes or dsp,
to be added to the sound card.

> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra=
_asoc_machine.c
> index 50b23bbb637bd..e4af049fd7e89 100644
> --- a/sound/soc/tegra/tegra_asoc_machine.c
> +++ b/sound/soc/tegra/tegra_asoc_machine.c
> @@ -550,6 +550,10 @@ int tegra_asoc_machine_probe(struct platform_device =
*pdev)
>  	if (asoc->add_common_snd_ops)
>  		card->dai_link->ops =3D &tegra_machine_snd_ops;
> =20
> +	err =3D snd_soc_of_parse_aux_devs(card, "nvidia,aux-devs");
> +	if (err)
> +		return err;
> +

[Severity: High]
Could this lead to a use-after-free during deferred probe?

In tegra_asoc_machine_probe(), card points to a statically allocated
snd_soc_card structure obtained from of_device_get_match_data(dev). When
snd_soc_of_parse_aux_devs() is called, it allocates card->aux_dev using
devm_kcalloc() and updates card->num_aux_devs:

sound/soc/soc-core.c:snd_soc_of_parse_aux_devs() {
    ...
    aux =3D devm_kcalloc(card->dev, num, sizeof(*aux), GFP_KERNEL);
    ...
    card->aux_dev =3D aux;
    card->num_aux_devs =3D num;
    ...
}

If probe subsequently fails (for example, if clk_get returns -EPROBE_DEFER
later in tegra_asoc_machine_probe()), the devm subsystem will free
card->aux_dev, but card->num_aux_devs will retain its positive value
because the snd_soc_card is statically allocated.

If the device is probed again but the nvidia,aux-devs property is now
missing (e.g., due to a device tree overlay change or probing a different
sound card), snd_soc_of_parse_aux_devs() will return 0 without clearing
the dangling pointer:

sound/soc/soc-core.c:snd_soc_of_parse_aux_devs() {
    ...
    num =3D of_count_phandle_with_args(node, propname, NULL);
    if (num =3D=3D -ENOENT) {
        return 0;
    }
    ...
}

This means snd_soc_register_card() could iterate over the freed
card->aux_dev array in soc_bind_aux_dev(), resulting in a use-after-free.

[Severity: Medium]
Will this leak device_node references on driver removal or probe failure?

snd_soc_of_parse_aux_devs() acquires device_node references via
of_parse_phandle(), and stores them in card->aux_dev[i].dlc.of_node:

sound/soc/soc-core.c:snd_soc_of_parse_aux_devs() {
    ...
    for_each_card_pre_auxs(card, i, aux) {
        aux->dlc.of_node =3D of_parse_phandle(node, propname, i);
        if (!aux->dlc.of_node)
            return -EINVAL;
    }
    ...
}

The tegra_asoc_machine driver does not appear to provide a .remove callback
or error rollback path to drop these references using of_node_put(), and the
ASoC core does not clean them up on card unregistration. This could lead to
a memory leak when the driver is unbound or if probe fails later.

Additionally, if snd_soc_of_parse_aux_devs() fails partway through the loop
(returning -EINVAL), it appears to leak any node references it had already
successfully acquired in earlier iterations.

>  	if (!card->owner)
>  		card->owner =3D THIS_MODULE;
>  	if (!card->driver_name)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013180253.4776=
05-1-clamor95@gmail.com?part=3D2
