Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5F4215075
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784764780; cv=none; b=cQEU18MOfWYN/jYT18RmNqo7jvuM1G8t0d+GnrYyQjlqbuuiMqdgaeNn4XTAzeb3HW+RfnKgUxx9QuZcUvjoxE6tAcsR7iZ90c+oBDDCJf+e3fUJLqA63j2/kSeS+2pjFp9wsz8w99+D1M3EoSoNDYsnB+1aa6+kO0T4u1ekW0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784764780; c=relaxed/simple;
	bh=Ua6/dURUInF6dWuS1rcVFYKbDLZ+uOWgeVXibEiv54Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bcFbCc2g0weppfZhpXZzVCMezT6H1JNH1w7oMWFFxeIWD2JX25Jz97Oa8zT/sTgxaGp1GxfUC5jnRXncHjpIpH13CQLM25c3pEsWHSnqQn+Z8QvIIOZYaGl8IidwIgnXZ9iCwwThAoAsY9aOfHJTCiA1yHmplQ7KoDzPazIY5IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1ZEth2F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1ZEth2F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256431F000E9;
	Wed, 22 Jul 2026 23:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784764778;
	bh=SZVbVcCZxACQTpm7lilvWkRcJB37FMMYdbW9MZme8tM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z1ZEth2FV2fBKPRrU9+l7d4tUkttNdZZuGh3vKHw1eh4hudUbtoawIpwsR2Zpqvsa
	 3/F+7K8N8RwFYXs2A8/N41EpIQKUchhlVvyONXWyP+ORdsGsUFDOcBe3JTAIThHlV+
	 2znTWa15UJNxepx76HqxNTwUsPC5E8RX9aL129fm4kOIp53XgOVMhB+G2JdwcMWXIE
	 vlAX7jyn+9gIhFYK5xVmql2/TyzmV0eZmti1VzLJckJPq7U5unQQaMK2eVWlvToDmo
	 QmIBqLuTURCkUj8SFrvhlSGyjCMNOQVESjZqBWlX2suinHyesqFklzsdMZynLQgI+I
	 YOjg20qUUTiTw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/8] ASoC: SDCA: allow building without ACPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722234221.884765-3-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 23:59:37 +0000
Message-Id: <20260722235938.256431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unbounded recursion in `set_input_terminal_sources()` can lead to =
a kernel stack overflow if the firmware-provided SDCA topology graph contai=
ns a cycle.
- [Medium] The commit message and `SND_SOC_SDCA` Kconfig help text claim no=
n-ACPI SDCA topology is supplied via `sdca_class_hw_ops.get_function_data`,=
 but this API does not exist.
--

--- Patch [2]: [RFC PATCH 2/8] ASoC: SDCA: allow building without ACPI ---
commit b04522a00403ca00a5d4ee2768eab7c24cb31da7
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: SDCA: allow building without ACPI

This commit drops the ACPI dependency for the SDCA class driver to allow
building on non-ACPI platforms. It also guards ACPI-parsing implementations
with IS_ENABLED(CONFIG_ACPI), providing empty stubs when ACPI is disabled.

> The SDCA class driver is useful on non-ACPI platforms where the
> topology is supplied statically via sdca_class_hw_ops.get_function_data.

[Severity: Medium]
Does this API actually exist in the kernel tree? Searching for
sdca_class_hw_ops or get_function_data yields no definitions. Is there a
missing patch that introduces this mechanism for codec drivers to supply
topology data on non-ACPI platforms?

> diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
> index 4c0dcb9ff3b94..dc4cba1e3e0ed 100644
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
> +	  via sdca_class_hw_ops.get_function_data.

[Severity: Medium]
Similar to the commit message, this help text points developers to
sdca_class_hw_ops.get_function_data. Since this interface doesn't seem to be
defined anywhere, should this documentation be updated to reflect the actual
mechanism used by codec drivers?

While reviewing this code, I also noticed a potential regression in the
topology parsing logic:

sound/soc/sdca/sdca_asoc.c:set_input_terminal_sources() {
    ...
		ret =3D set_input_terminal_sources(dev, regmap, function, src,
						 channels, rate, width);
    ...
}

[Severity: High]
Can this recursive call cause a kernel stack overflow if the firmware-provi=
ded
SDCA topology graph contains a cycle?

The graph of SDCA entities is populated directly from external firmware dat=
a,
such as ACPI _DSD. The traversal appears to lack cycle detection (like a
visited bitmask) or a recursion depth limit.

If a malformed or malicious firmware blob provides a cyclic connection, such
as Entity A connecting to Entity B and back to Entity A, would this function
recurse infinitely and exhaust the stack during device probing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722234221.8847=
65-1-srinivas.kandagatla@oss.qualcomm.com?part=3D2
