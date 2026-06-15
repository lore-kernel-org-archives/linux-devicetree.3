Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281492E6116
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546174; cv=none; b=uhqdLLmEA3Y0szwvVpq2MWrvxP+d0Eb2PmSHs6fi6lG9F2bUAjl3kWtwuCr2ZroGWtt3vYqP3QIGbKyUgU+adbCmGfyxdpu9UX+wSbF1Olss1TjoJ4MlKg45tMpSk5tUiPA32GkZvMtcuOxJLt8WTA5nbgcBRuOgwqkQdZJfNTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546174; c=relaxed/simple;
	bh=HmWgTdZ8naeZN2MYjtI/XcncCuSL0LGS2I1+pnPfy0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ys9FnMKxuegtXz4rRrcuiKFs9txMC41fHIkzo6XULpZ2jd5mgJ83e4cQ8/Oe6zhWmz/vEcz6T/IOmtKpsi/sQU0GK5/Q3qLlF+B1AHkA+kPjVUtLOcsvqMXpD5GgiU6+AS2swctZ/Y2sBsyj+sm8FqnEb6vvKuSPJAEZEhrtbWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hy+HtH6a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hy+HtH6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756E61F000E9;
	Mon, 15 Jun 2026 17:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781546172;
	bh=z3dnEISra/lgNgRAxkIOWVCWEJOpbn8IZPWbdXZ5Vp0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hy+HtH6acEyDsNGMsLTm8DNn+ZYyj3Rtn3wkoqhJ3RQEAzyWUPRwc3DLN8ad0vyca
	 Qahs3fRT9kbhXc1G6BVux6RQl8jVQ7K0F3VVszjMSTVJwfoLjfpmHQoz9KEl2tbp23
	 6Yo0UtSFETs/Gz/myjX/QtzaKy/me/lZbvwIXdCAfLV0MLaNkBoooJbkNubpPA48wE
	 x7sOX5KygIkNEVypoKGhHo3ykmEthmI7Ct951IHmqhWZ7PIn7FqFHXIoPq3cSwlPZZ
	 AM64t7eUHSojwRXXHhoAv+YuxmpLB1px8y7qQDsAz3huYRpDF6gU0CP3569pwNP9A6
	 tb4mw+YT4CVwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/12] rtc: rzn1: Use temporary variable for struct
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260615154805.1619693-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:56:12 +0000
Message-Id: <20260615175612.756E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Asynchronous pm_runtime_put() is used instead of pm_runtime_put_sy=
nc() before runtime PM is disabled, potentially leaving the device powered =
on.
- [High] If the optional 'xtal' clock is missing, readl_poll_timeout() loop=
s forever with a 0 timeout, risking a boot hang.
- [High] The driver's `remove` callback prematurely disables hardware inter=
rupts and drops the runtime PM reference while the RTC device is still full=
y registered.
--

commit b7f73c7d0932a6e78b12419c5912ad3243637b8f
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
rtc: rzn1: Use temporary variable for struct device

This patch simplifies the rzn1_rtc_probe function by using a local temporary
variable for the struct device pointer. This avoids repeated dereferences of
pdev->dev throughout the function.

> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index bc6af59744e48..25cad9213147d 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
[ ... ]
> @@ -415,15 +416,15 @@ static int rzn1_rtc_probe(struct platform_device *p=
dev)
[ ... ]
>  	/* Only switch to scmp if we have an xtal clock with a valid rate and !=
=3D 32768 */
> -	xtal =3D devm_clk_get_optional(&pdev->dev, "xtal");
> +	xtal =3D devm_clk_get_optional(dev, "xtal");

[Severity: High]
This is a pre-existing issue, but if the optional xtal clock is not present,
devm_clk_get_optional() sets xtal to NULL. In this scenario, rtc->sync_time
remains uninitialized and defaults to 0.

Further down in rzn1_rtc_probe(), readl_poll_timeout() is called:

	ret =3D readl_poll_timeout(rtc->base + RZN1_RTC_CTL0, val,
				 !(val & RZN1_RTC_CTL0_CEST), rtc->sync_time,
				 rtc->sync_time * 2);

With rtc->sync_time at 0, the timeout evaluation becomes 0. Does this cause
readl_poll_timeout() to loop indefinitely and hang the boot if the hardware
fails to clear the RZN1_RTC_CTL0_CEST bit?

>  	if (IS_ERR(xtal)) {
>  		ret =3D PTR_ERR(xtal);
>  		goto dis_runtime_pm;
[ ... ]
> @@ -486,18 +487,18 @@ static int rzn1_rtc_probe(struct platform_device *p=
dev)
[ ... ]
>  	device_init_wakeup(dev, true);
> =20
>  	ret =3D devm_rtc_register_device(rtc->rtcdev);

[Severity: High]
This isn't a bug introduced by this patch, but does registering the RTC
device using devm_rtc_register_device() create a race condition during
teardown?

In rzn1_rtc_remove(), the driver manually disables interrupts and calls
pm_runtime_put() before devres has unregistered the RTC device:

	writel(0, rtc->base + RZN1_RTC_CTL1);
	pm_runtime_put(&pdev->dev);

Could userspace still interact with the RTC during this window via ioctls
or sysfs, potentially causing synchronous bus faults since the hardware is
already suspended? Should teardown be bound using
devm_add_action_or_reset() to guarantee correct reverse execution order?

>  	if (ret)
> @@ -506,7 +507,7 @@ static int rzn1_rtc_probe(struct platform_device *pde=
v)
>  	return 0;
> =20
>  dis_runtime_pm:
> -	pm_runtime_put(&pdev->dev);
> +	pm_runtime_put(dev);

[Severity: High]
This is a pre-existing issue, but does using pm_runtime_put() here (and in
rzn1_rtc_remove) leave the device powered on indefinitely?

Since devm_pm_runtime_enable(dev) schedules pm_runtime_disable() to
execute during devres cleanup, calling pm_runtime_put() only queues an
asynchronous idle check. The immediate return triggers devres cleanup,
which executes a barrier that explicitly cancels pending async operations.

Should this use pm_runtime_put_sync() instead to ensure the device is
synchronously suspended before teardown?

>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615154805.1619=
693-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D9
