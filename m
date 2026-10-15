Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAB551D50E
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070376; cv=none; b=u3ArEx3hs4OYxO+lfQOAo7qmyQ6QDCYxsCc0P85vRkGukz1OvQ97Y1eiRHhfuiZZeb1k46tp7OD0SxMrKt92GISM+rn34yoTq9++9bLvKIqeytVb505UUPnXrIFXjLVE5tR7ZE0+xklc+ao0c4zK9eT4Eua1rI6/AQMzTyOZMGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070376; c=relaxed/simple;
	bh=Gn4jCbRhHx2HKuT1i1gFW+r7jo6gBoOANGLVrISOqK8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=GSv8XN5gPPmkDAwF3m3xR0YW09BntC71XLhSnkJ73+5s+8F2F/sNkdf9UKAQF5DtFV1uTvKawyJ6so40ZRJ1q8KsXQ3KuofaQaOL1wjzxzlqJnAG4LJ4EIK3hB8Gt8VaG09SmaG2h0+eAr3zd86eTBxI/wKtACFpmybUELSXCUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TitcwsT+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TitcwsT+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66EF1F000C4;
	Thu, 15 Oct 2026 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792070374;
	bh=Skt9MLegsjAiT2Tqp1O7n+BpqPMSNorBty3sR8jJSWQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TitcwsT+kqY2bugFTRyxWmAssSmhSStPSSRfzbegy+Cl93l0QxjYrvQKoq2qq9UlA
	 W+kolWtjy2PHVEy4Yf3Wrv37gaf8ZHLz+/hLY8EgIhdJeKkYikg9hpTNSZkzDX6Nco
	 16AvyWVZuml6z7GDPkMxXDfC4wd52nHctXJTXVGp+/wEoxkM+KMbp1RPGggVl/MIM3
	 +iiy1Qmc0BmqKT3bQLXLdzRbbAbKbDlX6wXiY6G9zhE2pvzoFBVAm30HNb1tFqXGML
	 R7CR/yUIElaNXZ6dEDEWDFDGVd89bDgcmis3y7jy8iUa8EScMmnW1uyWs/pW6Y7Qo4
	 PxBmzF6XZR8Yw==
Message-ID: <sashiko-outbox-172921@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 11/13] net: dsa: rzn1-a5psw: Add fixed frame
 length workaround for management port
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261014131906.990077-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261014131906.990077-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 13:19:33 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: dsa: missing NULL check for of_device_get_match_data()
--

commit 8d40702613d22f005a1af76ac95b3654ab3e2d50
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

net: dsa: rzn1-a5psw: Add fixed frame length workaround for management port

The ETHSW IP used in SoCs such as RZ/T2H and RZ/N2H has a hardware issue
where the internal mgmt_tag_vld signal is asserted as a level instead of
a single-cycle pulse. This causes the frame length counter on the
management (CPU) port to over-increment, so valid frames are falsely
detected as oversized and dropped.

> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 0b0b4055e6155..30eca64fb2183 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -209,8 +209,13 @@ static int a5psw_port_enable(struct dsa_switch *ds, =
int port,
>  static int a5psw_port_change_mtu(struct dsa_switch *ds, int port, int ne=
w_mtu)
>  {
>  	struct a5psw *a5psw =3D ds->priv;
> +	const struct a5psw_of_data *of_data =3D a5psw->of_data;
> +
> +	if (dsa_is_cpu_port(ds, port) && of_data->management_port_fixed_frame_l=
en)
> +		return 0;

[Severity: Medium]
Since this code relies on a5psw->of_data, could there be a NULL pointer
dereference if the device is bound manually via sysfs without a matching
device tree node?

Looking at a5psw_probe() where a5psw->of_data is initialized:

	a5psw->of_data =3D of_device_get_match_data(dev);
	a5psw->bridged_ports =3D BIT(a5psw->of_data->cpu_port);

If a user with root privileges binds the driver via sysfs (using
driver_override and bind) without a matching device tree node,
of_device_get_match_data() returns NULL. Does this cause an immediate
crash when accessing cpu_port during probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014131906.9900=
77-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D11
