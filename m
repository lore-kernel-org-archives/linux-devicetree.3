Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC71B3B1019
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539186; cv=none; b=Mb6PoIKiIGE34zht1lBZuepqEgxwnzNwqRH7KEATUcbw52/z+fclE1L+KCal6ZkX9WDWxGEodLw6BAOlOtx1zcFSosclw+rb43GUAzP6BozPa7120mON5I0yQF+Objxg9KLGnn40uKHRu8vYvFe6plOUypwbvuUOKIKp1NSkaCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539186; c=relaxed/simple;
	bh=lmbFtVQGC89p9asOJlsHg0zQVd1y7DvM9DUr9dhMHW4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uyQkyVDJij6uc4UcR3vBLHu9dxwm8ltj4gFwGKYH52IveBPnQDVhHHZAzRxabxXt/4oji3gjWLw3UNRUzh+u6Ca3sdljqzYIQLsDUnFCcUwmgnrzYyRBj4qrXLEaSDO6Ki5uiIGqM+XE7IOtCWF+dELKwYOJWcex1oQ+6uaqD7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9USl+I5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9USl+I5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438721F000E9;
	Mon, 15 Jun 2026 15:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539185;
	bh=oowwAoaPGfuvLcQr6HMntUEiFJWGTXVyXNzp6sTAzo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b9USl+I5r4P2/8+ZzBObmkZM11ZefT+zgEykR0s66B5+DjTS9tvotgS5jcLxeEBoo
	 8inl0Avv8jpuDAbOa4yZyJ8L7L9WgFrN36ME6bK1NMXWtl9TtzeZGwYgzcFKxxg+vl
	 /DeCqQlMvIdMJZ/kHgVK40OuJMfKecJjCwNegMd2TF/0VCAGVUG7YjNpEx1M8HF42z
	 x9Idbr9hIWbH1ueGGW25amgxs5u3lUoSLGMZaPzp9IlpL7/UAadPIgMjW0AFHlsuNM
	 xnadW5Brio7dqkYHSnItgjYaykfZG8x1edrrJ7Lp1EijiwEWlX0VhvCMxNqI6sgcOL
	 jQ21hi/7nYzSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/12] rtc: rzn1: Add system suspend/resume support and
 wakeup capability
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615154805.1619693-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 15:59:44 +0000
Message-Id: <20260615155945.438721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Incorrect error rollback and returning errors from rzn1_rtc_resu=
me() breaks wakeup configuration.
- [Medium] A hardware limitation is logged as a critical error on every sus=
pend.

Pre-existing issues:
- [High] Asynchronous pm_runtime_put() is used before devres pm_runtime_dis=
able(), leaving hardware powered on.
--

commit 65fe5cbeb3fc2e52fb88cf7b501a98dd6399fa39
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

rtc: rzn1: Add system suspend/resume support and wakeup capability

Add system-wide power management support along with wakeup capability to
the rtc-rzn1 driver, bridging sub-minute gaps with a 1-second periodic
broadcast loop.

> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index 866ff595188d8..12a319e9112c1 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
[ ... ]
> @@ -500,6 +511,74 @@ static void rzn1_rtc_remove(struct platform_device *=
pdev)
>  	pm_runtime_put(&pdev->dev);
>  }

[Severity: High]
This is a pre-existing issue, but does using pm_runtime_put() here and in
the dis_runtime_pm error path of rzn1_rtc_probe() leave the hardware
powered on?

The driver initializes runtime PM using devm_pm_runtime_enable(), which
registers a devres action to call pm_runtime_disable() upon probe failure
or device removal. By calling the asynchronous pm_runtime_put(), the
suspend operation is queued but immediately cancelled by the subsequent
pm_runtime_disable() devres action.

Should pm_runtime_put_sync() be used instead when pm_runtime_disable()
follows immediately to ensure the device is properly suspended?

> +static int rzn1_rtc_suspend(struct device *dev)
> +{
> +	struct rzn1_rtc *rtc =3D dev_get_drvdata(dev);
> +	int ret;
[ ... ]
> +	if (rtc->alarm_enabled)
> +		dev_crit(dev, "second/minute-level wakeup accuracy cannot be guarantee=
d by HW\n");

[Severity: Medium]
Does this unconditionally log a critical message on every suspend if the
alarm is enabled?

Since this is a known architectural limitation rather than an acute failure,
this will spam the kernel log with critical severity messages during normal
system suspend operations.

Would it be better to downgrade this to dev_warn() or dev_info()?

> +	ret =3D enable_irq_wake(rtc->alarm_irq);
> +	if (ret)
> +		return ret;
> +	if (rtc->sec_irq >=3D 0) {
> +		ret =3D enable_irq_wake(rtc->sec_irq);
> +		if (ret) {
> +			disable_irq_wake(rtc->alarm_irq);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int rzn1_rtc_resume(struct device *dev)
> +{
> +	struct rzn1_rtc *rtc =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!device_may_wakeup(dev))
> +		return 0;
> +
> +	ret =3D disable_irq_wake(rtc->alarm_irq);
> +	if (ret)
> +		return ret;
> +	if (rtc->sec_irq >=3D 0) {
> +		ret =3D disable_irq_wake(rtc->sec_irq);
> +		if (ret) {
> +			enable_irq_wake(rtc->alarm_irq);
> +			return ret;
> +		}
> +	}

[Severity: Medium]
Is it correct to re-enable the alarm_irq wakeup source and return an error
here in rzn1_rtc_resume() if disable_irq_wake() fails?

Because the PM core ignores device resume failures and continues the
system resume sequence, returning an error here and re-enabling alarm_irq
leaves it permanently configured as a wakeup source while the system is
active. This unbalanced state could lead to spurious wakeups.

Should the rollback logic be reconsidered or removed for the resume path?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615154805.1619=
693-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D5
