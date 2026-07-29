Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FC4632
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 00:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284406; cv=none; b=uzWMnSq1TVv6pMWz5G7BVUoRYYGRUWD8SsjOHhwJeaAuqAejnuFu5fvLdUZJ9bDLUu6lUlX5zaz1MzpKfcA4CdHQmaLUOyRHLTxQFNvCPWg/HYaPaqAUIUma8yrtCPU1AGWBlsSTtnn0FyayN8JyfZXt/2yX6ABCR/qYKPQelrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284406; c=relaxed/simple;
	bh=0g+6rkOwTA06/qej7FCz9nJ9SU68tKSnNk2TqxrT5nc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EGFgYaS3Ax6FEE/9NqwGCh1Li5bp+exsos2VWzOP9R6hCXLVgRWa9KwuqzFktzKimwkS35v6azskwXtNQ0ZrKPBjylage6OckXDzy3jKXYCIoJQMD2iD04LtgnWGAgizXFLOtWDd/Zum2bgDw3waohpIEThyUWDM6lbcotMOp7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U53wo6Tq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U53wo6Tq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0F41F000E9;
	Wed, 29 Jul 2026 00:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785284404;
	bh=EVyktAJxo7CvqE4O9PPUGZ7YSUS43fcilHP49c7VnVM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U53wo6Tq0KYssbsk0xQq4hNgpPsUfonkb+jF0DcJHQ4rKaTI3uPcXFnSC9rrydP5F
	 rrUDFScySElU2uhCJl4qi+cmjCXtQqliyGeY0TBinfAzfo/YgiZi2Pu3UWcKpIgGRN
	 SpRs5euStfXEtr9VXzBECyyuG0Icu9CeIRvO/hrCUhnfWLSY66PvXkusQOPvP0em74
	 KGGBUg7V6N+x9j9w9sDTxB6wgbV9zys6WkQRh8aut72UsuGtoH3ETyNHKQZSoiGwhE
	 A8uwea0psDWd1UMRlPPmb+rQSp7zZp/LG4H7lMzkZRX74GMfYuZQFI22usIjKHoJKg
	 CZuos7NT/QdeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: codecs: wcd9378: add TX/capture codec
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260729000649.263426-3-jorijnvdgraaf@catcrafts.net>
References: <20260729000649.263426-1-jorijnvdgraaf@catcrafts.net>
 <20260729000649.263426-3-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 00:20:03 +0000
Message-Id: <20260729002004.5E0F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unvalidated port mapping values read from the device tree are used=
 as array indices, leading to a heap out-of-bounds write.
- [Medium] Asynchronous pm_runtime_put() is used on the TX device immediate=
ly before component unbinding disables Runtime PM, which cancels the suspen=
d operation.
- [Medium] Missing locking in ALSA kcontrol `put` callbacks leads to race c=
onditions and corrupted port mapping state.
--

--- Patch [2]: [PATCH v2 2/2] ASoC: codecs: wcd9378: add TX/capture codec d=
river ---
commit 784c99ce243cc1e864d64e77ed6ff79c5552c8aa
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

ASoC: codecs: wcd9378: add TX/capture codec driver

This commit introduces the SoundWire driver for the Qualcomm WCD9378 audio=
=20
codec, supporting TX/capture paths. It handles the mobile presentation over=
=20
RX and TX slaves, incorporating SDCA function blocks.

> diff --git a/sound/soc/codecs/wcd9378-sdw.c b/sound/soc/codecs/wcd9378-sd=
w.c
> index 0000000000000..d46bea6d716e2
> --- /dev/null
> +++ b/sound/soc/codecs/wcd9378-sdw.c
[ ... ]
> @@ -345,6 +345,77 @@ static int wcd9378_sdw_probe(struct sdw_slave *pdev,
> +	if (wcd->is_tx)
> +		num_ports =3D WCD9378_MAX_TX_SWR_PORTS;
> +	else
> +		num_ports =3D WCD9378_MAX_SWR_PORTS;
> +
> +	/* Port map index starts at 0, however the data ports start at index 1 =
*/
> +	ret =3D of_property_read_u32_array(dev->of_node, "qcom,port-mapping",
> +					 &pdev->m_port_map[1], num_ports);

[Severity: High]
Does this code need to validate the values read into pdev->m_port_map from=
=20
the device tree?=20

If a device tree provides a port mapping value that exceeds SDW_MAX_PORTS,=
=20
it appears this unvalidated value is later used in wcd9378_connect_port()=20
as an array index, which could result in an out-of-bounds heap write.

> +	if (ret < 0)
> +		dev_info(dev, "Error getting static port mapping for %s (%d)\n",
> +			 wcd->is_tx ? "TX" : "RX", ret);
[ ... ]
> diff --git a/sound/soc/codecs/wcd9378.c b/sound/soc/codecs/wcd9378.c
> index 0000000000000..fadf65f3283dc
> --- /dev/null
> +++ b/sound/soc/codecs/wcd9378.c
[ ... ]
> +static int wcd9378_connect_port(struct wcd9378_sdw_priv *wcd, u8 port_id=
x,
> +				u8 ch_id, bool enable)
> +{
> +	struct sdw_port_config *port_config =3D &wcd->port_config[port_idx - 1];
> +	const struct wcd_sdw_ch_info *ch_info =3D &wcd->ch_info[ch_id];
> +	u8 port_num =3D ch_info->port_num;
> +	u8 ch_mask =3D ch_info->ch_mask;
> +	u8 mstr_port_num, mstr_ch_mask;
> +	struct sdw_slave *sdev =3D wcd->sdev;
> +
> +	port_config->num =3D port_num;
> +
> +	mstr_port_num =3D sdev->m_port_map[port_num];
> +	mstr_ch_mask =3D ch_info->master_ch_mask;
> +
> +	if (enable) {
> +		port_config->ch_mask |=3D ch_mask;
> +		wcd->master_channel_map[mstr_port_num] |=3D mstr_ch_mask;

[Severity: Medium]
Are these read-modify-write operations safe from race conditions when=20
accessed concurrently?=20

The wcd9378_set_swr_port() function handles ALSA kcontrol put requests=20
and invokes wcd9378_connect_port() without acquiring any driver-specific=20
locks. Since the ALSA core allows concurrent kcontrol put callbacks, if=20
multiple threads toggle switches mapped to the same master port, could this=
=20
lead to lost updates and a corrupted port mapping state?

> +	} else {
> +		port_config->ch_mask &=3D ~ch_mask;
> +		wcd->master_channel_map[mstr_port_num] &=3D ~mstr_ch_mask;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int wcd9378_set_swr_port(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mixer =3D (struct soc_mixer_control *)kcontro=
l->private_value;
> +	struct snd_soc_component *comp =3D snd_kcontrol_chip(kcontrol);
> +	struct wcd9378_priv *wcd9378 =3D snd_soc_component_get_drvdata(comp);
> +	struct wcd9378_sdw_priv *wcd;
> +	int dai_id =3D mixer->shift;
> +	int ch_idx =3D mixer->reg;
> +	int portidx;
> +	bool enable;
> +
> +	wcd =3D wcd9378->sdw_priv[dai_id];
> +	portidx =3D wcd->ch_info[ch_idx].port_num;
> +
> +	enable =3D ucontrol->value.integer.value[0];
> +
> +	if (enable =3D=3D wcd->port_enable[portidx]) {
> +		wcd9378_connect_port(wcd, portidx, ch_idx, enable);
> +		return 0;
> +	}
> +
> +	wcd->port_enable[portidx] =3D enable;
> +	wcd9378_connect_port(wcd, portidx, ch_idx, enable);
> +
> +	return 1;
> +}
[ ... ]
> +static int wcd9378_bind(struct device *dev)
> +{
[ ... ]
> +	ret =3D snd_soc_register_component(dev, &soc_codec_dev_wcd9378,
> +					 wcd9378_dais, ARRAY_SIZE(wcd9378_dais));
> +	if (ret) {
> +		dev_err(dev, "Codec registration failed\n");
> +		pm_runtime_put(wcd9378->txdev);
> +		goto err_remove_link3;
> +	}
> +
> +	return ret;
> +
> +err_remove_link3:
> +	device_link_remove(dev, wcd9378->rxdev);
> +err_remove_link2:
> +	device_link_remove(dev, wcd9378->txdev);
> +err_remove_link1:
> +	device_link_remove(wcd9378->rxdev, wcd9378->txdev);
> +err_put_txdev:
> +	put_device(wcd9378->txdev);
> +err_put_rxdev:
> +	put_device(wcd9378->rxdev);
> +err_component_unbind:
> +	component_unbind_all(dev, wcd9378);

[Severity: Medium]
Will this asynchronous pm_runtime_put() complete before the device is=20
disabled?=20

In both the error path here in wcd9378_bind() and in wcd9378_unbind(), an=20
asynchronous pm_runtime_put() is called just prior to component_unbind_all(=
).=20

When the component is unbound, pm_runtime_disable() is invoked, which=20
cancels pending asynchronous suspend work via __pm_runtime_barrier(). This=
=20
could cancel the requested suspend and leave the hardware incorrectly power=
ed=20
up. Would pm_runtime_put_sync() be more appropriate here to guarantee the=20
suspend completes before removal?

> +	return ret;
> +}
> +
> +static void wcd9378_unbind(struct device *dev)
> +{
> +	struct wcd9378_priv *wcd9378 =3D dev_get_drvdata(dev);
> +
> +	snd_soc_unregister_component(dev);
> +	pm_runtime_put(wcd9378->txdev);
> +	device_link_remove(dev, wcd9378->txdev);
> +	device_link_remove(dev, wcd9378->rxdev);
> +	device_link_remove(wcd9378->rxdev, wcd9378->txdev);
> +	component_unbind_all(dev, wcd9378);
> +	put_device(wcd9378->txdev);
> +	put_device(wcd9378->rxdev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729000649.2634=
26-1-jorijnvdgraaf@catcrafts.net?part=3D2
