Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBCB2C0F8C
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 19:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788721661; cv=none; b=Nw6wlauMY13Wp9vg5/rV6RQIL0CHUKSu6IY9r/tj5Etr1ixzzBV7Dq9QtXHF43UjCfI109V0RN9z7oiI9tU8R/1LAT/Oun8RdPTZRaQEeEUPLPUXgBohgPrZ736G9W0xiGJwH8SlxEb3++FaH5VsmfKZ1Hi44n72nlMrdchJ2I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788721661; c=relaxed/simple;
	bh=l1aLINKAuNjZG+2K5Tqx8PTruopXFj4PDM77RD/of8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sc2dAwzewrZ1D5WIKQBEBp1cjLRR/1QdTKKFM9+VHrz7XKvUSOoPM3PeTpJ1T7NTTFSpZjkOxw5Ry6AqBfpAi/etfvvsnQnVOFfp0d3Lm6ZQ001Iv5D5xbbd1wXpzjXbmIo6fkAns5Fdgb73DPNWctMjWQ78lSdfxXOnxENnmWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFq1jbKt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFq1jbKt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178BA1F00A3A;
	Sun,  6 Sep 2026 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788721660;
	bh=i5Yl7RvuXP4Za+HEv69AnGMt3D+aoQCdK+ekYjErPog=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PFq1jbKtKXxcTzZH18ptkh5aE2rwv/7qSVGo4g4Duh1TtVnSgfI+jbjzR+rsqYtkq
	 1o9w9oNPEHn8Na/T9ne9HTDK5Fe7+8LBgt56Telfl2/EqyWsqB4jkX2u1n4lbA/EId
	 4yWnDj1a+c+3w4ex72ZHOly+7892wJT1ZHvVnjsN+Oovnu35Z0lyuEwf3VfouQifQa
	 OixqNbLTyIRBogtqWTCwb/oaTuDghJ9haZuqd9iI3EDmGob5BpgBOHABbYjIE/tNb/
	 yeTnQT6ZTH9AaBj5LgeY08BAJLKXedsWiandrCpeSi3fA6HhH7x+2J4RpqIZWxLTW7
	 CxGL2eqPgh5cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/22] thunderbolt: Don't read the UID if we already
 know it
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-8-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-8-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 19:07:39 +0000
Message-Id: <20260906190740.178BA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch fails to skip the config space UID read on Apple Silicon=
 host routers due to an incorrect assumption about the execution order of `=
tb_switch_set_uuid()`.
--

commit 79dbfccf7bd2744a7a8dfb582a24daa82d8e7d2c
Author: Sven Peter <sven@kernel.org>
Subject: thunderbolt: Don't read the UID if we already know it

This commit attempts to skip reading the UID from the config space on Apple
Silicon host routers by checking if sw->uid is already populated. It also
claims to drop a duplicate read for other USB4 hosts.

> On Apple Silicon the host router's UID comes from the DROM provided by
> the device tree and is already known by the time tb_switch_set_uuid()
> runs. Skip reading it from the config space again in that case.
>=20
> For other USB4 hosts this only drops a duplicate read because
> tb_drom_host_read() has already filled in the UID from ROUTER_CS_7
> before tb_switch_set_uuid() runs. Device routers keep reading it
> unconditionally.

Is this execution order correct?

Looking at tb_switch_add(), tb_switch_add_dma_port() unconditionally calls
tb_switch_set_uuid() before tb_drom_read() executes:

drivers/thunderbolt/switch.c:tb_switch_add() {
	...
	ret =3D tb_switch_add_dma_port(sw);
	...
		/* read drom */
		ret =3D tb_drom_read(sw);
	...
}

During tb_switch_add_dma_port(), tb_switch_set_uuid() is called directly.

Because of this order, doesn't tb_switch_set_uuid() run before the UID
is populated from either the device tree or ROUTER_CS_7?

> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 404c0693df50e..3f54a5ae56b07 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -2692,9 +2692,11 @@ static int tb_switch_set_uuid(struct tb_switch *sw)
>  		return 0;
> =20
>  	if (tb_switch_is_usb4(sw)) {
> -		ret =3D usb4_switch_read_uid(sw, &sw->uid);
> -		if (ret)
> -			return ret;
> +		if (tb_route(sw) || !sw->uid) {
> +			ret =3D usb4_switch_read_uid(sw, &sw->uid);

[Severity: High]
Since sw->uid is still 0 during the initial call from tb_switch_add_dma_por=
t(),
doesn't this condition evaluate to true and force the usb4_switch_read_uid()
read anyway?

If reading ROUTER_CS_7 returns garbage on Apple Silicon hardware, will the
host router be assigned an incorrect UUID since sw->uuid is set during this
first call and won't be updated later?

> +			if (ret)
> +				return ret;
> +		}
>  		uid =3D true;
>  	} else {
>  		/*

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-apple-s=
oc-tbt-v2-0-1f80085f93fb@kernel.org?part=3D8
