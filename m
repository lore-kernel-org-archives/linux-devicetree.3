Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC0382F03
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061203; cv=none; b=AWe7wOxCwUhj1NuzfU/Ma+S9cakc7wbwT5z7NoW4b2He9HPkp8yUuzUHpjsOAWX0evnY8xw9MfPz1G4OLsmXA2ILHaQfFnRii4jlCZSdnRENeP0ij6476Yo7nUUA4H6VZ9zuTP/PC86IeoCgKWaW9nK65jmza0lkOuiyNJnPslk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061203; c=relaxed/simple;
	bh=Zts4UVtKP7QBOXlwwmECpBPUlqIlpC7mMxj1aw/+G6U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YDWcvjNN4FhUklsurAI96zK94jpEtiayHiJPMgD16NNkfl03aOwoU0ow1O8OLzOdyoefbVkq0tqHfxoJcKhgUDQu9zlBhF9X6Xoix02sVBW3Dwz0KfLipeYYC0mit/AwiLTnrX97q0zL9LwTYm5epLzIsGIsANokqZ9Un/HqHG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEnRieQa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEnRieQa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D271F00A3E;
	Fri,  3 Jul 2026 06:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783061199;
	bh=gqYNVd2aUt01dk6KibAexvXp7AR7dq58CQmQ0dAkunM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XEnRieQaI+4vXD5hg7XYaRwFx9CwAkqdPVUrpWz98CpEFpk2ySpXFEhIXWeOVOGcX
	 tODaFEZw8rQnMaKSEmJOIWT//RYYzk4JrQ0z3/ZjGAVMHzNw0Yf3x7lsVdSQ5CAyLJ
	 R827g4oeK5sB3sp9OgAVdWeWQKiudNLXkPRLFtZUticCFfVKlMa+KXrPC33q9ByDxz
	 /UssMMJhKA14xwUvDuzaxYY3DdH9Tk5cWx/O5Zu8eztSLcoWGOqm185JgLvtsfiXlX
	 5kpFTw/4M1Xy4mYc6f7trIyUBi0Zimlns3KtZKgnORBxjFI7Wi9fm5fSdITB5kvQaf
	 9VqEo316fFxLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 5/9] net: dsa: lan9645x: add bridge support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260702-dsa_lan9645x_switch_driver_base-v8-5-90228d8bba58@microchip.com>
References: <20260702-dsa_lan9645x_switch_driver_base-v8-0-90228d8bba58@microchip.com>
 <20260702-dsa_lan9645x_switch_driver_base-v8-5-90228d8bba58@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 06:46:38 +0000
Message-Id: <20260703064638.E8D271F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing ds->ageing_time_min allows invalid ageing times to be si=
lently rounded up to 2 seconds.
--

commit c7bfc6b4bfe0c0efc661fd970da4660dc2b62c73
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: lan9645x: add bridge support

This commit adds support for hardware offloading of the bridge on a single
device. It configures basic bridge operations, flooding, and ageing time.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_main.c
> index f95ce9e48a5c2..4dd449d9014bd 100644
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
[ ... ]
> @@ -268,15 +271,35 @@ static int lan9645x_setup(struct dsa_switch *ds)
[ ... ]
>  	ds->mtu_enforcement_ingress =3D true;
>  	ds->assisted_learning_on_cpu_port =3D true;
>  	ds->fdb_isolation =3D true;
> =20
> +	/* ANA_AUTOAGE_AGE_PERIOD is a seconds-based field and entries are
> +	 * aged after 2 * AGE_PERIOD, giving (2 * FIELD_MAX) seconds of
> +	 * maximum aging.
> +	 */
> +	ds->ageing_time_max =3D 2U * MSEC_PER_SEC *
> +			      FIELD_MAX(ANA_AUTOAGE_AGE_PERIOD);
> +

[Severity: Medium]
Should ds->ageing_time_min be configured here as well?

Without a minimum, the DSA core's -ERANGE check is bypassed when
userspace configures a bridge ageing time less than 2 seconds, which
allows unsupported small values to reach the driver.

>  	dev_info(lan9645x->dev,
>  		 "SKU features: max_ports=3D%d\n",
>  		 lan9645x->num_phys_ports - lan9645x->num_port_dis);
> =20
>  	return 0;
[ ... ]
> @@ -285,6 +308,282 @@ static void lan9645x_port_phylink_get_caps(struct d=
sa_switch *ds, int port,
[ ... ]
> +static int lan9645x_set_ageing_time(struct dsa_switch *ds, unsigned int =
msecs)
> +{
> +	u32 age_secs =3D max(1, msecs / MSEC_PER_SEC / 2);

[Severity: Medium]
Could this silently round up unsupported small ageing times?

If msecs is non-zero but less than 2000, max(1, msecs / 2000) evaluates
to 1 hardware unit (2 seconds). Because the driver doesn't return an
error for unsupported values, the hardware is configured with an
ageing time larger than requested by the user, which violates the
switchdev API contract.

> +	struct lan9645x *lan9645x =3D ds->priv;
> +
> +	/* Entry must suffer two aging scans before it is removed, so it is
> +	 * aged after 2*AGE_PERIOD, and the unit is in seconds.
> +	 * An age period of 0 disables automatic aging.
> +	 */
> +	lan_rmw(ANA_AUTOAGE_AGE_PERIOD_SET(msecs ? age_secs : 0),
> +		ANA_AUTOAGE_AGE_PERIOD,
> +		lan9645x, ANA_AUTOAGE);
> +	return 0;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-dsa_lan964=
5x_switch_driver_base-v8-0-90228d8bba58@microchip.com?part=3D5
