Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E044F85C5
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738945; cv=none; b=WM++jp+s62oWC0wauI/zzrWwVaRVrKm9xA662fu3CRIYBRF95wExjghvDqF7nEUbWlAtaBFM5uWmpSIMETepqxO9jhSMBwK+jBSZOdZwInasgP1QHh96omLhzAWfEnvyDAc7z//aZgPt9TEytEyic7guNA/rUNaWbpTTE912xYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738945; c=relaxed/simple;
	bh=ih+Qcxpwv5oYveYDb138iYPk/Yl3xtIYuUjhSq8jM08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yt3nKbWQ4/COlXIOGvSkUd4lnd/uU0/6NVEDwuslT2uwASr34ZT3A8yhkd1oNjIcNbfJE/2On0/JU3JOxsklVByJiwP4JLQ0hJUWJiYGL07EmI3kwJLGLD3PcfxvoAsh7wbroX8zFXHbuEbU8SgMo9O2iyg7wZw9dpWwZOzU+Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkPTVrKB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkPTVrKB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23A61F000FF;
	Fri, 18 Sep 2026 13:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789738940;
	bh=7y36plyxs+tfsBdVyvN3Ye4jmPDivlhIqqaP1RpGZK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AkPTVrKBCtYhOcpxA12ixWahjD7os02/eaZY59fKay29NYTwvyJWHIOAMnKff8wrx
	 /YrE5m/UrvHkqvjI+61UFlzrZM3lGcECCXxSqABdt5ROFCSoOcUFCrv12MVJ/DHRpW
	 8BaKM1hTN7y1KPsSagFCMbYb8tHOKgr67gQj6Mo90CI6Pi6LozgRsXCUY0CFJMEX2D
	 rd63ggHf1HCIiIDhzN6cIGy7CMJ7GnRJhrh+lmggZs4vzAZduD7bG4cb7u1GHUmc7r
	 EO2JY9Rn6gC2OQilG25PXddHcRHkDyaQvOsBsQGlg81kH6mepXiX9kZ7d+PdrmAwHA
	 R0bsiOUfHM0Fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/8] ASoC: SDCA: allow building without ACPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918131914.681588-2-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 13:42:19 +0000
Message-Id: <20260918134219.F23A61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: SDCA: ACPI parser is unconditionally built on non-ACPI pla=
tforms
--

commit b342382e9b5b09b26bd417be9cd5ee4c2d90de61
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: SDCA: allow building without ACPI

This commit drops the ACPI dependency from SND_SOC_SDCA to allow the SDCA
class driver to be built on non-ACPI platforms. It wraps ACPI-parsing
implementations in sdca_device.c and sdca_functions.c with
IS_ENABLED(CONFIG_ACPI) and provides empty stubs when ACPI is off.

> diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
> index 4c0dcb9ff3b94..72c02943c49ed 100644
> --- a/sound/soc/sdca/Kconfig
> +++ b/sound/soc/sdca/Kconfig
> @@ -3,11 +3,13 @@ menu "SoundWire (SDCA)"
> =20
>  config SND_SOC_SDCA
>  	tristate "SDCA core support"
> -	depends on ACPI
>  	select AUXILIARY_BUS
>  	help
>  	  This option enables support for the MIPI SoundWire Device
> -	  Class for Audio (SDCA).
> +	  Class for Audio (SDCA).  The ACPI/DisCo topology parser is
> +	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
> +	  (e.g. ARM/DT) codec drivers supply the SDCA function data
> +	  via sdca_class_hw_ops.populate_function.

[Severity: Medium]
Is this Kconfig help text accurate for SND_SOC_SDCA?

The text claims the ACPI/DisCo topology parser is only built when CONFIG_AC=
PI
is enabled. However, the CONFIG_ACPI guard in sdca_functions.c is closed
early. When building the kernel with CONFIG_SND_SOC_SDCA=3Dy and CONFIG_ACP=
I=3Dn,
the rest of the file's DisCo parsing logic is unconditionally compiled.

Note that the related probe failure where sdca_parse_function() was
unconditionally called on non-ACPI platforms is resolved in Patch 4 of this
series, but the dead code and Kconfig discrepancy remains unfixed here.

[ ... ]

> diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functi=
ons.c
> index f39008ac0e7d3..1eb6418e132dc 100644
> --- a/sound/soc/sdca/sdca_functions.c
> +++ b/sound/soc/sdca/sdca_functions.c
> @@ -25,6 +25,7 @@
>   */
>  #define SDCA_PROPERTY_LENGTH 64
> =20
> +#if IS_ENABLED(CONFIG_ACPI)
>  static int patch_sdca_function_type(u32 interface_revision, u32 *functio=
n_type)
>  {
>  	/*
> @@ -201,6 +202,7 @@ void sdca_lookup_functions(struct sdw_slave *slave)
>  	acpi_dev_for_each_child(adev, find_sdca_function, &slave->sdca_data);
>  }
>  EXPORT_SYMBOL_NS(sdca_lookup_functions, "SND_SOC_SDCA");
> +#endif

[Severity: Medium]
Does this #endif prematurely close the CONFIG_ACPI guard?

By closing the guard here after sdca_lookup_functions(), the remaining
topology parser logic in this file, including the entry point
sdca_parse_function() and its helpers, remains unconditionally compiled
on non-ACPI builds.

> =20
>  struct raw_init_write {
>  	__le32 addr;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918131914.6815=
88-1-srinivas.kandagatla@oss.qualcomm.com?part=3D1
