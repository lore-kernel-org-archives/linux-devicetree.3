Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB8D27707
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 00:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784765024; cv=none; b=CFIXGd7zkTHYCCBZEy6EuD1urHozJQvcDF9dd2hlk1p/EJ2gndp9t5CEgnA17kzCJ710mPNN/xn1jY/8uUDjXiRklT7WiBr00VwlZICrmPmfv6Nd7WZttVwbYAt4KKO17dtR5MliH3JeCEeewmNAED9oG93swdI7K7CS+GWGsWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784765024; c=relaxed/simple;
	bh=2EjcqIF6K1EJCfnpkkntYU4Y5ECnYYWx6l2WYtrqY4s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GbpDNBO6ZgjjzOHVNPnWOikMbtn5yqZEmCdpQKbtxzPjnTt5RjHKVC3XuhbpVwbgYb5uQZweG3zFp/mouazImNddK7gCyvOAoZdJ1zlGRU0gwqWnZDnUcSWDfFWlb013iH1sKKudFDsMDKE4Gzn3mamxhspsgtzeBSw1Zmf1iro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bKbWnhWw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bKbWnhWw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D955C1F00A3A;
	Thu, 23 Jul 2026 00:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784765023;
	bh=nDeHP2delP/GRv8Y12fj459lAwdwB8xldAgN2MNoQuc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bKbWnhWwGnD2S0TPr+xMNJ/WeEc6ceF1FgQczAvUUpfktYD7MWmL559deh3iM8maQ
	 h0VlLVoeBdBqvf2Mmur5CIN+vG5kKNqU9D1fIwJ9ocDvVpslx2Ftpp3TChGiD18Xln
	 ApNf1+eAJe7aeY/Khnn48TP1Z9mRP8bLeTecw5PIBW7eYBq6AU9nV1ceLq1ZrdDaMe
	 srREY4EeBFdMiY6mBApkWy2p6uhC2fyImtFH7AlPWyaeb2kNoosso7OSeBW52vC5E5
	 VFGyURuSrOHUYKIYOem7Q0ArAqGTm4DOmF9aF4YUbC5Rfp8h4KT2NQhuIwiRaq/+ey
	 qE0+U1MlfnxJA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260722234221.884765-9-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-9-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 00:03:42 +0000
Message-Id: <20260723000342.D955C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Hardware reset causes immediate SoundWire I/O failure due to lost =
enumeration.
- [High] Mismatch between declared SoundWire sink ports and WCD9378_SDCA_MA=
X_PORTS leaves DP8 unmapped.
- [High] Missing `.remove` callback leaves the asynchronous `boot_work` run=
ning or queued, leading to a Use-After-Free.
- [Medium] Device-specific configuration parsed from DT mutates a shared st=
atic global array.
- [Medium] The register staging and commit sequence in `wcd9378_sdca_pde_po=
st_pmu` lacks locking, allowing concurrent operations to interleave.
--

--- Patch [8]: [RFC PATCH 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378)=
 SDCA codec ---
commit e171d84f19c198b9a986581a4ba450c4b632c883
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

This commit adds support for the Qualcomm Tambora (WCD9378) headset codec
in SDCA mode over SoundWire. It integrates static SDCA topology and port
properties transcribed from the factory ACPI tables for ARM platforms.

> diff --git a/sound/soc/codecs/wcd9378-sdca.c b/sound/soc/codecs/wcd9378-s=
dca.c
> new file mode 100644
> --- /dev/null
> +++ b/sound/soc/codecs/wcd9378-sdca.c
> @@ -0,0 +1,1202 @@
[ ... ]
> +#define WCD9378_SDCA_MAX_PORTS	7
[ ... ]
> +static int wcd9378_sdca_sdw_read_prop(struct sdw_slave *slave)
> +{
[ ... ]
> +	/* Sink ports: DP6 (HPH audio), DP7 (HPH envelope), DP8 (optimisation R=
X). */
> +	prop->sink_ports =3D BIT(6) | BIT(7) | BIT(8);
[ ... ]
> +	if (device_property_read_u32_array(dev, "qcom,port-mapping",
> +					   &slave->m_port_map[1],
> +					   WCD9378_SDCA_MAX_PORTS))

[Severity: High]
Does this array read leave DP8 unmapped?=20

The driver declares support for sink port 8 above, but
WCD9378_SDCA_MAX_PORTS is 7. Will m_port_map[8] remain uninitialized
and cause the SoundWire master to map DP8 to the control port instead of
a valid data port?

> +		dev_dbg(dev, "qcom,port-mapping not found, using default\n");
> +
> +	return 0;
> +}
[ ... ]
> +static int wcd9378_sdca_hw_init(struct sdw_slave *slave)
> +{
[ ... ]
> +	if (reset) {
> +		gpiod_set_value(reset, 1);
> +		/* 20us assert per WCD9378 reset sequence */
> +		usleep_range(20, 30);
> +		gpiod_set_value(reset, 0);
> +		/* 20us settle after deassert */
> +		usleep_range(20, 30);
> +	}
> +
> +	ret =3D device_property_read_u32(dev, "qcom,micbias2-microvolt",
> +				       &micbias_uv);
[ ... ]
> +	ret =3D wcd9378_sdca_micbias_uv_to_sdca(micbias_uv);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "unsupported qcom,micbias2-microvolt %u\n",
> +				     micbias_uv);
> +	ctrl_it33_micbias_vals[0] =3D ret;

[Severity: Medium]
Does writing the device-specific mic bias voltage into
ctrl_it33_micbias_vals[0] mutate a shared static global array?

If multiple instances of this driver probe, could they race to overwrite
this array, causing the last probed device to dictate the mic bias
voltage for all instances?

> +
> +	/*
> +	 * Vendor SCP bank-1 shadow that clocks the TX PDM path.  SCP
> +	 * registers survive PDE cycles, so the one-time write here is
> +	 * enough for every subsequent mic capture.  The trailing
> +	 * SCP_COMMIT swaps the bank in =E2=80=94 safe to do at hw_init since no
> +	 * stream is running that could underflow.
> +	 */
> +	ret =3D sdw_write_no_pm(slave, WCD9378_SCP_HOST_CLK_DIV2_CTL_B1, 0x01);

[Severity: High]
Does this immediate write fail due to lost enumeration?=20

Hard-resetting the slave clears its MIPI registers, reverting it to the
unattached state. The master needs time to asynchronously detect the
unattached device and re-enumerate it.=20

Will sdw_write_no_pm() (using the old dev_num) fail with a NACK or timeout
because it does not wait for re-enumeration to complete?

> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "HOST_CLK_DIV2_CTL_B1: %d\n", ret);
[ ... ]
> +static int wcd9378_sdca_pde_post_pmu(struct sdw_slave *slave,
> +				       struct regmap *regmap,
> +				       unsigned int function_id,
> +				       unsigned int entity_id)
> +{
[ ... ]
> +	ret =3D regmap_write(core->dev_regmap, WCD9378_FU42_MUTE_CH1_ADDR,
> +			   WCD9378_FU42_MUTE_UNMUTE);
> +	if (ret)
> +		dev_err(&slave->dev, "FU42 MUTE_CH1: %d\n", ret);
> +
> +	ret =3D regmap_write(core->dev_regmap, WCD9378_FU42_MUTE_CH2_ADDR,
> +			   WCD9378_FU42_MUTE_UNMUTE);
[ ... ]
> +	ret =3D regmap_write(core->dev_regmap, WCD9378_FU42_CH_VOL_CH2_LSB_ADDR,
> +			   WCD9378_FU42_CH_VOL_UNITY_BYTE);
> +	if (ret)
> +		dev_err(&slave->dev, "FU42 CH2_LSB: %d\n", ret);
> +
> +	ret =3D sdw_write_no_pm(slave, SDW_SCP_COMMIT, 0x02);

[Severity: Medium]
Can concurrent operations interleave with this sequence?=20

wcd9378_sdca_pde_post_pmu() executes multiple regmap_write() calls followed
by an unprotected sdw_write_no_pm() call. Since regmap_write() releases the
regmap lock internally between calls, could an ALSA mixer control using the
same commit mechanism race with a DAPM event and commit partially staged
FU42 writes prematurely?

> +	if (ret)
> +		dev_err(&slave->dev, "FU42 SCP_COMMIT: %d\n", ret);
> +
> +	return 0;
> +}
[ ... ]
> +static struct sdw_driver wcd9378_sdca_sdw_driver =3D {
> +	.driver =3D {
> +		.name	=3D "wcd9378-sdca",
> +		.pm	=3D pm_ptr(&sdca_class_pm_ops),
> +	},
> +	.probe		=3D wcd9378_sdca_sdw_probe,
> +	.id_table	=3D wcd9378_sdca_sdw_id,
> +	.ops		=3D &wcd9378_sdca_sdw_ops,
> +};

[Severity: High]
Could this cause a use-after-free on driver unbind?=20

wcd9378_sdca_sdw_probe() delegates to sdca_class_probe(), which allocates
drv and queues drv->boot_work. Because there is no .remove callback in
wcd9378_sdca_sdw_driver to explicitly cancel this work, won't devres free
the drv object while class_boot_work remains pending or executing?

> +module_sdw_driver(wcd9378_sdca_sdw_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm SimpleJack (Tambora/WCD9378) SDCA codec");
> +MODULE_AUTHOR("Qualcomm Technologies, Inc.");
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_IMPORT_NS("SND_SOC_SDCA_CLASS");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722234221.8847=
65-1-srinivas.kandagatla@oss.qualcomm.com?part=3D8
