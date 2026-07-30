Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A8344D6B4
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435723; cv=none; b=McgHXPmDX5MbMMD5TPEq6ZYRaJlLyhQhZYWgmPkN3rTPer9Wshr3gKHRmPr059XrvgB8mMk0yH8WwhLbRo7wrWtCsed71s40Su9/p8qPQUEPlbuBdDvpxnDxdHwUmvTXFLHv3fj5LdDhNgtkfKfzrrtmgRUJfTb7peQ+bRnF+14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435723; c=relaxed/simple;
	bh=Yc0sc0o7JPzvyAi+J6+ChaPUm9pyZIGtvxvWtqmE4FM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u+FwmFAI4x7KErJIGTxip8fcXcSaDU1MjFeqzRkcl/y4vQUiVhFGpJNO1tDMG9iNrhurIb8niXqP3/hHO7/Nen//M7D+CCAAj/T5rHN1WGkIryhJpN9A2MzKcLEpNzj03sVUQSh+TJVxXYIqidJ+z6vfl22cVGQf1bFnvB/iU40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biViUlFn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="biViUlFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6921F000E9;
	Thu, 30 Jul 2026 18:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785435719;
	bh=kz9T8e3LMm/BkrLsqNXSJhs1LQI15H913PxUsdDRzpU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=biViUlFnsxDG1fpsTHhmh0lOerZc0xD3T4E1o0vGQgJylPuOxbtYCI5FFQ/dseSOS
	 0DqmZDMX6UYUUjeO9SZ7oEPJCWxObRgbad+PYr8ba2/2V+cX9VcZYUD79kM6gPouer
	 cY43WjrDVRfgfOTqWV9yQSofrKwUUztk/M2PTAu6ranEeUyUs7rqORRxq51diJuItx
	 3WN4kVdJH/CdL3e756Q6G/oYNb+F5D3C6xXv1UTalQnpu7AWTwPg0tp2XvwopGFviG
	 9mXBOFXhUDsqYacTf6J0xjaibLMgV8OuzZLl2WIVYOUXslr5IVuEh+ZwTEP9pa4xPO
	 vfwoCIq3CR7eA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/15] ASoC: qdsp6: q6afe: add internal mi2s support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260730174353.108023-8-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
 <20260730174353.108023-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 18:21:58 +0000
Message-Id: <20260730182158.DA6921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] q6afe_dai_prepare() unconditionally fails for LPI_MI2S DAIs due to=
 missing switch cases.
- [High] of_q6afe_parse_dai_data() skips parsing 'qcom,sd-lines' for LPI_MI=
2S DAIs.
- [High] Missing DAPM widgets and routes for LPI_MI2S DAIs in q6afe-dai.c.
--

--- Patch [7]: [PATCH v6 07/15] ASoC: qdsp6: q6afe: add internal mi2s suppo=
rt ---
commit 29b5c067f4b9a1db3d8b82e2cd046a58a12a3c4e
Author: Richard Acayan <mailingradian@gmail.com>

ASoC: qdsp6: q6afe: add internal mi2s support

This commit adds port mappings for internal MI2S ports found on the
Snapdragon 660. It updates the port_maps array and q6afe_port_get_from_id()
to support LPI_MI2S RX and TX ports.

> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 40237267fda05..1d68a80e8e0c0 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
[ ... ]
> @@ -931,6 +945,34 @@ static struct afe_port_map port_maps[AFE_PORT_MAX] =
=3D {
>  	[RX_CODEC_DMA_RX_7] =3D { AFE_PORT_ID_RX_CODEC_DMA_RX_7,
>  				RX_CODEC_DMA_RX_7, 1, 1},
>  	[USB_RX] =3D { AFE_PORT_ID_USB_RX, USB_RX, 1, 1},
> +	[LPI_MI2S_RX_0] =3D { AFE_PORT_ID_INT0_MI2S_RX,
> +				LPI_MI2S_RX_0, 1, 1},

[Severity: High]
Does this code also require updates to sound/soc/qcom/qdsp6/q6afe-dai.c to
function correctly?

Looking at q6afe_dai_prepare(), LPI_MI2S ports are missing from the switch
statement:

sound/soc/qcom/qdsp6/q6afe-dai.c:q6afe_dai_prepare() {
    switch (dai->id) {
    ...
    case SENARY_MI2S_RX ... SENARY_MI2S_TX:
    case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
    case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
        rc =3D q6afe_i2s_port_prepare(dai_data->port[dai->id],
                                   &dai_data->port_config[dai->id].i2s_cfg);
        ...
        break;
    ...
    default:
        return -EINVAL;
    }
}

Will this cause ALSA stream preparation to fail unconditionally with -EINVAL
for these new DAIs?

> +	[LPI_MI2S_TX_0] =3D { AFE_PORT_ID_INT0_MI2S_TX,
> +				LPI_MI2S_TX_0, 0, 1},

[Severity: High]
Additionally, it appears of_q6afe_parse_dai_data() skips parsing the
"qcom,sd-lines" devicetree property for LPI_MI2S DAIs because they are omit=
ted
from its switch statement:

sound/soc/qcom/qdsp6/q6afe-dai.c:of_q6afe_parse_dai_data() {
    switch (id) {
    /* MI2S specific properties */
    case SENARY_MI2S_RX ... SENARY_MI2S_TX:
    case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
    case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
        priv =3D &data->priv[id];
        ret =3D of_property_read_variable_u32_array(node,
                                        "qcom,sd-lines",
                                        lines, 0,
                                        Q6AFE_MAX_MI2S_LINES);
    ...
}

Could this cause sd_line_mask to remain 0 and lead to q6afe_i2s_port_prepar=
e()
returning -EINVAL when trying to use these lines?

> +	[LPI_MI2S_RX_1] =3D { AFE_PORT_ID_INT1_MI2S_RX,
> +				LPI_MI2S_RX_1, 1, 1},

[Severity: High]
Finally, q6afe_dai_widgets[] in sound/soc/qcom/qdsp6/q6afe-dai.c lacks
SND_SOC_DAPM_AIF_IN and SND_SOC_DAPM_AIF_OUT entries for LPI_MI2S_RX_0 thro=
ugh
LPI_MI2S_TX_6.

Without these DAPM widgets, can the new DAIs be properly connected to audio
frontends or powered via DAPM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730174353.1080=
23-1-mailingradian@gmail.com?part=3D7
