Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FEE48A8C8
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742230; cv=none; b=OU68ULbAdw4POeZZa605ikUk6sswpium0GyCZjPQzqyH/qdaOMM5cQTNKmaBBsFH32hcfHXyhpTg8g+LP7BXprm9XNbUOJyAKOC7zUEaSK5/PXpHdoUgYjgOCOxvpyqRzXyTL5o62naqWWC0++o1CwAXxwR1HKy/cPaovgSJDQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742230; c=relaxed/simple;
	bh=AYxGuLyH5oil31/ErXDRVDqxEVrsiJbM2tyUQcRzh3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fT0b8uFn4wf88OeJfd7oZndJbChVsMPF23ujQQrCCCY/QlElDHTGu6110uNAxFE/D3SYfY87su8TRb8cRxk/VkJLBfaiPr77bsOrxcyFWSf9p6XFaSV5GKjr/XxK1eAMCWO1KLOXusbDg2ZpjJ8D/00mbIieKzDK2+2i8d8tV0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQh2vjaO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQh2vjaO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882B01F000FF;
	Fri, 18 Sep 2026 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789742228;
	bh=Ujlk5a6Y+DPiGVrZcjgwjzEQfG3MvtF6lmPlp14QbyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hQh2vjaOuL3XMvhISE4ZaQQUuXZ2s2ya5/mKA4etRYoh5xvhztul2eadJ8QdvnuiS
	 CS5gaELRe41oy+8i7CJ0rOgcJ0HxiEo0Urhh0BxY9p/Cd5UVk16tCteeVwP8eriJPS
	 YBZnP2buf5p5FhfNsSf0xa+4wgGEAseTUOjZiAXdffu2k8M+KEfr8Yh6se+/q8mCYC
	 b/+H6xwz8gyBAX3bv780kozLSjZvG/uQR7iT9mebNzrAbyGLdbHGfyBdhybAGZ/1z0
	 cQ3P9Pc7SeruxdzQb5TyaPlBZTc04QrLT1Lq3W41J01rSOKbwABAM5uD/u5WnnCYOy
	 T08bcp4ujjPNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/8] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918131914.681588-9-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-9-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 14:37:08 +0000
Message-Id: <20260918143708.882B01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ASoC: wcd9378: Missing DT-derived micbias patching
- [Medium] ASoC: wcd9378: Meaningful code and commit message mismatch regar=
ding DT property
- [Medium] ASoC: wcd9378: Unprotected modification of static global topolog=
y array
--

commit b641a8d55f5574997647d703d7136b63d9de6c0b
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

Add support for the Qualcomm Tambora (WCD9378) headset codec in SDCA
mode over SoundWire. On ARM/DT platforms without ACPI/DisCo firmware
the SDCA topology and SoundWire port properties are supplied as static
data through the codec driver.

>     Binds SoundWire slave id 0x0217:0x0110 when qcom,compute-mode is set
>     on the DT node.

[Severity: Medium]
The commit message mentions that the driver binds when qcom,compute-mode is
set on the DT node, but the code actually checks for qcom,sdca-compliant. Is
this a typo in the commit message or should the driver be checking for a
different property?

> diff --git a/sound/soc/codecs/wcd9378-sdca.c b/sound/soc/codecs/wcd9378-s=
dca.c
> index 0000000000000..f1f94c13cba52
> --- /dev/null
> +++ b/sound/soc/codecs/wcd9378-sdca.c
[ ... ]
> +static int wcd9378_sdca_populate_function(struct sdw_slave *slave,
> +					  struct sdca_function_data *function)
> +{
> +	/* @function->desc is already set by the framework; fill payload only. =
*/
> +	if (function->desc->type !=3D wcd9378_sdca_desc.type)
> +		return -EINVAL;
> +
> +	function->num_entities    =3D wcd9378_sdca_data.num_entities;
> +	function->entities        =3D wcd9378_sdca_data.entities;
> +	function->num_clusters    =3D wcd9378_sdca_data.num_clusters;
> +	function->clusters        =3D wcd9378_sdca_data.clusters;
> +	function->num_init_table  =3D wcd9378_sdca_data.num_init_table;
> +	function->init_table      =3D wcd9378_sdca_data.init_table;
> +	function->reset_max_delay =3D wcd9378_sdca_data.reset_max_delay;
> +

[Severity: High]
The commit message mentions that this function patches the IT 33 MIC_BIAS
default with the DT-derived per-slave value (qcom,micbias2-microvolt). Does=
 this
function miss the logic to parse the DT property and patch the micbias volt=
age?

Currently, the micbias voltage remains hardcoded at 2.75V via
range_it33_micbias_data[]. Hardware requiring a different voltage might rec=
eive
2.75V instead.

> +	/* Elevate is_volatile / has_reset to match the DisCo/ACPI path. */
> +	sdca_apply_default_control_classifiers(function);

[Severity: Medium]
Does wcd9378_sdca_populate_function() improperly mutate the statically
declared global array wcd9378_sdca_entities[]?

The driver maps the global wcd9378_sdca_data.entities to function->entities
and then passes it to sdca_apply_default_control_classifiers(), which modif=
ies
the is_volatile and has_reset booleans in-place. If multiple instances probe
concurrently, could this cause a data race or violate device isolation?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918131914.6815=
88-1-srinivas.kandagatla@oss.qualcomm.com?part=3D8
