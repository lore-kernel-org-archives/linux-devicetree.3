Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504BE4302F5
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617852; cv=none; b=BRgMoJArBseqNlBN+pwW29/8h6s/3l8gxfqHnf5RqH2FmIgKXvKGlIgzxc6plBvxUuDYA6/EGdmdREr8Gh5zUIMRBnc4oRUWg0til+szMz1nNBksnHn/F7SgK8VahHwkyyIIMH699gChE/jBK0qc9sLYcW8G0PkSJoPI3cQoMFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617852; c=relaxed/simple;
	bh=RzL7iBN9rVaFfVRgxdMYmEYj2/SjNilUxS1ygkczUx0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JoaYSCm1TqLcsc0J0F3MN+I7X2ZCRApIGoeH8RDU5A0XSwtP2tIThz2cjZZeo8sa+QjkXRVK4vIG1heL5GpFCOMlmcuidTsQVvhW4Y5i7rNM3QsFxvR/qjhgF314FNO1aQFaQ86HyzPXnp9xnnVBhuzPtxyMZDTs1hWzbU7sbsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZeRtvPao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZeRtvPao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90D51F00A3F;
	Tue, 21 Jul 2026 07:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784617851;
	bh=rWp6Diwpki/YKaSHpfNGVEPYrfTL3ZvISS/iONmoB6Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZeRtvPaotQxiADF4D59Me2SS8doURC+l4FT3hrw5xrj4UdlRdqYa62bekqbCEiVNZ
	 zic0HsX6QW9THRPWw8R37fcGOUTzag2DUAvSapU5QLTaIByf38h2qLZEOf7R3cfZr8
	 wUFfpITWkATi68Ox9XDbJQ04JsC9Ej1E+oh1+JXrkrT0S9Js0nAd8ZG5OAGPjxwJ/m
	 YHgEMw2DLybjpjjCFSsYDjwB5+FTqx4G1psbM5IfPZk/jwSJBGriSDB2yC0JiF7qCM
	 w/8f81bCJ4UGrOW5pLw1HK/7WxF8LmYJz6iCmnlciu/185WJwIRQTrYC8vdfTsmntH
	 GwfBVfMMdltGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721065413.2306137-4-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-4-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 07:10:49 +0000
Message-Id: <20260721071050.A90D51F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Failing to set the device name during pwrseq registration causes a=
 NULL pointer dereference and uninitialized mutex destruction during cleanu=
p.
--

--- Patch [3]: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()=
 ---
commit b1f1d35d0af2f22f0f4ab1e71697d11c020da9d0
Author: Chen-Yu Tsai <wenst@chromium.org>

power: sequencing: Add pwrseq_power_is_on()

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_power_is_on()
so that they don't have to reimplement it locally.

> diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/c=
ore.c
> index 02f42da915985..72b96d36920e5 100644
> --- a/drivers/power/sequencing/core.c
> +++ b/drivers/power/sequencing/core.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this file
I noticed a potential issue in the error path of pwrseq_device_register().

If dev_set_name() fails, we jump to err_put_pwrseq which drops the
reference and triggers pwrseq_release():

drivers/power/sequencing/core.c:pwrseq_device_register() {
	...
	ret =3D dev_set_name(&pwrseq->dev, "pwrseq.%d", pwrseq->id);
	if (ret)
		goto err_put_pwrseq;

	pwrseq->owner =3D config->owner ?: THIS_MODULE;
	pwrseq->match =3D config->match;

	init_rwsem(&pwrseq->rw_lock);
	mutex_init(&pwrseq->state_lock);
	INIT_LIST_HEAD(&pwrseq->targets);
	...
}

At this point, pwrseq->targets and pwrseq->state_lock have not been
initialized yet and remain zeroed from allocation.

In the cleanup path:

drivers/power/sequencing/core.c:pwrseq_release() {
	...
	list_for_each_entry_safe(target, pos, &pwrseq->targets, list) {
		list_del(&target->list);
		pwrseq_target_free(target);
	}

	mutex_destroy(&pwrseq->state_lock);
	...
}

Can iterating over the uninitialized pwrseq->targets list cause a NULL
pointer dereference crash here?

Because INIT_LIST_HEAD hasn't been called, the list pointers are still NULL,
which would cause list_for_each_entry_safe() to dereference NULL when it tr=
ies
to access the next element.

Also, it looks like this would attempt to destroy an uninitialized mutex.

Could the initialization of the list and mutex be moved before the
dev_set_name() call to prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721065413.2306=
137-1-wenst@chromium.org?part=3D3
