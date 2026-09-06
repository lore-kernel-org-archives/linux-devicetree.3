Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72242BEC2B
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788720782; cv=none; b=Hbd0OfDbC5oV7HdsEmLMgchlBL5Qhe3rrSqNwR3ldyDQQ47/CXsRlpCMcnTpwOv8LlHMhRwvBrWE5O3+Q/hWN4OEn8wDVTyB39PKYr5xF4X61iIB18yR7zwnHc2uP4OI/iIL96lcx8n3vPEdOp/E0rAXANOs9e79dTS0VDD+vtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788720782; c=relaxed/simple;
	bh=3wEKlFBn+JWq0tIrhfNkO+Wu4CLabTQYFG+KmcIVp8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YpnLnLXXJnMfp8R8wpAtYYh7ZPjft30grmT2V0NT7KG7WeujWk09AADUiv3biZIW27wzAR9Vltx4kFqop1ol+oAZ70tExgoE2lDeSaa03Q5AYtrMtRP7ipd5BS/eiWx8bUPeMNTwSoOZGoH4D6KW9gnVcqQyKL/1+PFNiToWCYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIZo/K37; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIZo/K37"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B441F00A3D;
	Sun,  6 Sep 2026 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788720780;
	bh=7qd8tfv2A8b6cGVGIX+EWIKltF4P7UaBKPp+ZudJyww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HIZo/K37yavaAqGbg0+9cQy6KoRUziKmpTKowTEcY7b/d14axvuogBLbmmPd+VyrW
	 J7Pd77AgsUnTo0w0rWLuBU2DTEcNom52p+qrkxuPaXgYG9F4R9Ep7mf5QBjWt3/Kr1
	 lCcB5m2GJZGTHYjC2Hgt6JpPDhzjT8nBUUpepmBuv687BHmHsFYevYCPH0bl0rpis1
	 8+Wo5wMjdl6dyXi+D2DS7FjETNmyTNOgBbLDmLth2Z8MwQJ5tbiihnMLcl7FJAQuji
	 WbqRG7XAKJuEVVP+SjBopyWAHp+cr2rnG64Xc4s1R7nfOFZHIUHFR9/88B5mnK/xLv
	 3ovmKLIlS7DEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/22] usb: typec: Represent USB4 on the Type-C bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-2-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-2-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 18:52:59 +0000
Message-Id: <20260906185300.45B441F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] TOCTOU race introduced by double-read of `altmode->partner` in `ty=
pec_altmode_notify()`.

Pre-existing issues:
- [High] Missing NULL check on `partner` leads to a NULL pointer dereferenc=
e in `typec_altmode_enter()` and `typec_altmode_exit()`.
- [High] Lockless double-read of `adev->dev.driver` in `typec_altmode_updat=
e_active()` can race with driver unbinding, causing a NULL pointer derefere=
nce.
--

commit 78f546f39cb57c2d6df37d112b4c42115768555d
Author: Sven Peter <sven@kernel.org>

usb: typec: Represent USB4 on the Type-C bus

USB4 technically isn't alternate mode and entered using the EUDO and has
no SVID or Discover Modes Response. We can still represent it like an
altmode on the Type-C bus though by adding a mode kind. Exclude the USB4
modes from any SVID-specific operations and driver binding, but allow
consumers to observe their state through notifications.

> diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
> index e84b134a33813..8e6d7769fac3f 100644
> --- a/drivers/usb/typec/bus.c
> +++ b/drivers/usb/typec/bus.c
> @@ -93,6 +93,8 @@ int typec_altmode_notify(struct typec_altmode *adev,
> =20
>  	if (!adev)
>  		return 0;
> +	if (adev->mode_kind !=3D TYPEC_MODE_KIND_ALTMODE)
> +		return -EOPNOTSUPP;
> =20
>  	altmode =3D to_altmode(adev);
> =20

[Severity: High]
Does this code introduce a regression with a TOCTOU race from a double-read=
 of
altmode->partner?

Looking at typec_altmode_notify() in drivers/usb/typec/bus.c:

	if (!altmode->partner)
		return -ENODEV;

	is_port =3D is_typec_port(adev->dev.parent);
	partner =3D altmode->partner;

	ret =3D typec_altmode_set_switches(is_port ? altmode : partner, conf, data=
);

If typec_altmode_put_partner() sets altmode->partner to NULL concurrently
without holding a lock that serializes against typec_altmode_notify()
(for example, during a device unplug), could a race between these two lines
allow the second read of altmode->partner to be NULL? This could
unconditionally dereference partner->adev.ops later in the function.

[ ... ]
> @@ -125,12 +127,19 @@ EXPORT_SYMBOL_GPL(typec_altmode_notify);
>   */
>  int typec_altmode_enter(struct typec_altmode *adev, u32 *vdo)
>  {
> -	struct altmode *partner =3D to_altmode(adev)->partner;
> -	struct typec_altmode *pdev =3D &partner->adev;
> +	struct typec_altmode *pdev;
> +	struct altmode *partner;
>  	int ret;
> =20
> -	if (!adev || adev->active)
> +	if (!adev)
>  		return 0;
> +	if (adev->mode_kind !=3D TYPEC_MODE_KIND_ALTMODE)
> +		return -EOPNOTSUPP;
> +	if (adev->active)
> +		return 0;
> +
> +	partner =3D to_altmode(adev)->partner;
> +	pdev =3D &partner->adev;
> =20
>  	if (!pdev->ops || !pdev->ops->enter)
>  		return -EOPNOTSUPP;

[Severity: High]
This is a pre-existing issue, but can this lead to a NULL pointer dereferen=
ce
if partner is NULL?

If a partner altmode is registered but there is no matching port altmode
(for example, plugging a Thunderbolt device into a non-TBT Type-C port),
typec_altmode_set_partner() leaves altmode->partner as NULL.

If the Thunderbolt driver binds to this partner altmode and calls
typec_altmode_enter() from its workqueue, it would unconditionally compute
&partner->adev from a NULL partner pointer, and then dereference the invalid
pointer at pdev->ops.

[ ... ]
> @@ -156,13 +165,20 @@ EXPORT_SYMBOL_GPL(typec_altmode_enter);
>   */
>  int typec_altmode_exit(struct typec_altmode *adev)
>  {
> -	struct altmode *partner =3D to_altmode(adev)->partner;
> -	struct typec_altmode *pdev =3D &partner->adev;
> +	struct typec_altmode *pdev;
> +	struct altmode *partner;
>  	int ret;
> =20
> -	if (!adev || !adev->active)
> +	if (!adev)
> +		return 0;
> +	if (adev->mode_kind !=3D TYPEC_MODE_KIND_ALTMODE)
> +		return -EOPNOTSUPP;
> +	if (!adev->active)
>  		return 0;
> =20
> +	partner =3D to_altmode(adev)->partner;
> +	pdev =3D &partner->adev;
> +
>  	if (!pdev->ops || !pdev->ops->exit)
>  		return -EOPNOTSUPP;

[Severity: High]
This is a pre-existing issue, but similar to typec_altmode_enter(), can this
cause a crash during altmode exit?

If partner is NULL, pdev =3D &partner->adev creates an invalid pointer that=
 is
subsequently dereferenced at pdev->ops.

[ ... ]
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 5808a3ef0d6cd..869d6857c0dca 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -296,6 +297,8 @@ static void typec_altmode_put_partner(struct altmode =
*altmode)
>   *
>   * If a partner or cable plug executes Enter/Exit Mode command successfu=
lly, the
>   * drivers use this routine to report the updated state of the mode.
> + * For USB4 partner modes, drivers use this routine to report entry thro=
ugh
> + * Enter_USB and exit from USB4.
>   */
>  void typec_altmode_update_active(struct typec_altmode *adev, bool active)
>  {

[Severity: High]
This isn't a bug introduced by this patch, but does the lockless double-read
of adev->dev.driver in typec_altmode_update_active() leave a race condition?

Earlier in this function, the code evaluates adev->dev.driver:

	if (!is_typec_port(adev->dev.parent) && adev->dev.driver) {
		if (!active)
			module_put(adev->dev.driver->owner);
		else
			WARN_ON(!try_module_get(adev->dev.driver->owner));
	}

Because this block only holds alt->state_lock and concurrent driver unbindi=
ng
sets dev->driver =3D NULL under device_lock(), without READ_ONCE() or proper
locking, the compiler can issue two reads for adev->dev.driver.=20

If unbinding occurs between the check and accessing adev->dev.driver->owner,
can the second read evaluate to NULL and lead to a crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-apple-s=
oc-tbt-v2-0-1f80085f93fb@kernel.org?part=3D2
