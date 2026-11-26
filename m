Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684774;
	b=O0dod18B7YdiQq0jZ5Npb74GWw5eLgen8ejW6+VaOG5NC1wdPAbn8g50psnogC3VYmgp
	 BmZfmI/MhVVzOrhsAkY+4b+Pp/gjzTT5/L83XMQ4OSanjXMKaajflnZlK+bXD3i5ZH/e9
	 IGiuNfrC+rq2fpAZzDEQv450WmshUUonwfzpKq2RZYxvxzMmdDH+hcJ9DR+SYrW3nkn86
	 OdPNDrI6oBZTkJjFEwFa4a443rgXDbzY9GhJBcN/3VPwyKwsJm2m6E8AQ5hgY4wYAJRnp
	 QeOaMFysW7TszF5KuPozAGPGAeoQdMpCQ0nsjU9bmiovZoCmdSWb0uxeCTMPi1Vhuaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684774;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/oHHQALghtoPP+5pdGtNsnRmD/fjouORSpU51MjkBAw=;
	b=0v74KutKsZszggZaUZiRlzxBFdKTaaMVL8yRXO4++2/CSGxjkBwqR5ZBYayatFpOj2u1
	 rkndbYzzTRsOnz4dVQufp9BjFiR1lca4vXhwHo9PeGOCsScrH4+xuWFNuhfb/Fs2P8JPn
	 gd6VrrTtR8+ZGDnwTEPpU1bfHLk8ihLCbk1iIkhfmuNaf0O3nISOgjtaU7sTzqCs0uFqH
	 5bf9Er8o0hYNJB2hSFjbBMlJsnWM6inefUVArgr7ks80Jj9UAK0KHbdFArna6pOFgWOk4
	 VyFtjCDxXvKzkQSa2/+NjKSJWeB33I9fWwXaISXF8iM61+pfKGGub5pGB4bHO477WYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FiTvb9wj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8585606A333
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FiTvb9wj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7AA1F000E0;
	Thu, 26 Nov 2026 09:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795684774;
	bh=/oHHQALghtoPP+5pdGtNsnRmD/fjouORSpU51MjkBAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FiTvb9wjCWv9gct/mtgu84E50Rbhuqi/D/GVk7P+FQFC4GZ2KS1h0tNpsxVvPMnjc
	 q6LsAQM8K2X81ekq1uuTxiqO8Of6UKL1QaFxVXPt5FQrx3zeUwsjmBs18NOAwMUGOu
	 Cu9fKEWzn5eydgHqglkGfkUwTrti156Obh/3wJp72JlwbXj6xBvbHDjXS/EqPoTDgN
	 C0yaVVWdFtpi4f20goZMb5ucF7RohO4e+NmB/G2DsWOorhTMayffPdhwC1y9+Qm9Up
	 /hm4vMDQ12GQNYoMYAuXoUqLJkQFD2uZ09tnWU13ed2diNrG7/CJVbRDqEMzeAbDUk
	 TZ4UOcoXEWz/Q==
Message-ID: <sashiko-outbox-235114@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] gtrace: rvtrace: Add pre-ratified trace funnel
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leo Yu-Chi Liang" <leo.liang@sifive.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-send-preratified-trace-v1-7-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
 <20261126-send-preratified-trace-v1-7-1e686fd75be7@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 09:19:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] gtrace: rvtrace: missing tristate RVTRACE dependency on
  RVTRACE_FUNNEL
- [Medium] gtrace: rvtrace: premature hardware enable in
  rvtrace_funnel_probe()
--

commit d12b4752379ea0c92ba55f2e57ceaa616a25b3e8
Author: Eric Lin <eric.lin@sifive.com>

gtrace: rvtrace: Add pre-ratified trace funnel driver

This commit adds a gtrace driver for the pre-ratified RISC-V trace funnel
component.

> diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/=
Kconfig
> index b1f9ca8f73cb9..66fc2791d8f4e 100644
> --- a/drivers/hwtracing/gtrace/Kconfig
> +++ b/drivers/hwtracing/gtrace/Kconfig
> @@ -43,6 +43,19 @@ config RVTRACE_ENCODER
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called rvtrace-encoder.
> =20
> +config RVTRACE_FUNNEL
> +	tristate "RISC-V Trace Funnel driver"
> +	depends on RVTRACE_V0
> +	default y

[Severity: Medium]
Should RVTRACE_FUNNEL also depend on RVTRACE?

Because RVTRACE_V0 is a bool symbol while RVTRACE is a tristate symbol,
CONFIG_RVTRACE=3Dm sets CONFIG_RVTRACE_V0=3Dy and allows CONFIG_RVTRACE_FUN=
NEL=3Dy.
In that configuration, built-in rvtrace-funnel.o fails to link against
rvtrace_v0_sink_config() in rvtrace.ko (and gtrace core symbols when
CONFIG_GTRACE=3Dm).

> diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.c b/drivers/hwtracin=
g/gtrace/rvtrace-funnel.c
> new file mode 100644
> index 0000000000000..2e0843d233ab7
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/rvtrace-funnel.c
> @@ -0,0 +1,98 @@

[ ... ]

> +static int rvtrace_funnel_start(struct gtrace_path_node *node)
> +{
> +	struct gtrace_component *comp =3D node->comp;
> +	int ret;
> +
> +	/* Set pre-ratified comp's next sink */
> +	ret =3D rvtrace_v0_sink_config(node);
> +	if (ret) {
> +		dev_err(&comp->dev, "failed to set next sink.\n");
> +		return ret;
> +	}
> +
> +	ret =3D gtrace_enable_component(comp);
> +	if (ret)
> +		dev_err(&comp->dev, "failed to enable funnel.\n");
> +
> +	return ret;
> +}
> +
> +static int rvtrace_funnel_stop(struct gtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret =3D gtrace_disable_component(comp);
> +	if (ret) {
> +		dev_err(&comp->dev, "failed to disable funnel.\n");
> +		return ret;
> +	}
> +
> +	return rvtrace_comp_poll_empty(comp);
> +}
> +
> +static int rvtrace_funnel_probe(struct gtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret =3D gtrace_enable_component(comp);
> +	if (ret)
> +		return dev_err_probe(&comp->dev, ret, "failed to enable funnel.\n");
> +
> +	return 0;
> +}
> +
> +static void rvtrace_funnel_remove(struct gtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret =3D gtrace_disable_component(comp);
> +	if (ret)
> +		dev_err(&comp->dev, "failed to disable funnel.\n");
> +}

[Severity: Medium]
Why do rvtrace_funnel_probe() and rvtrace_funnel_remove() enable and disable
the funnel component?

rvtrace_platform_probe() already resets the component and brings it out of
reset before registering it, and rvtrace_funnel_start() and
rvtrace_funnel_stop() enable and disable it around each trace session.
Enabling the component in rvtrace_funnel_probe() leaves the funnel enabled
while idle after boot before any output sink is configured, causes
rvtrace_v0_sink_config() to modify the sink bits in
RVTRACE_COMPONENT_CTRL_OFFSET while the funnel is already enabled on the
first trace run, and leaves the funnel disabled after the first trace sessi=
on
stops.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-send-prera=
tified-trace-v1-0-1e686fd75be7@sifive.com?part=3D7
