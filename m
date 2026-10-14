Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536AF47F3D9
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 22:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017713; cv=none; b=l8qBH94Ttl05PNM0YgOR4fiQpoFre2Ri618/ZxASj/57sVvKjAayUyn1I6JNvfddrGSRVT1FWjM0w3qduG9Vo2SoUduX8S8dW4Mw54/NLH6r5spmIKgCZQapai9ExSHZlniZi2y+hQK0+mhRUSYx+7KEawU6GJbfD8UnXNjg2aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017713; c=relaxed/simple;
	bh=3tnQhV3t6WaqIYSSxsrr689m4KdaCcLhv656ggjUxbk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=j+V4NsNzzFFUHv482jwkLvISuSmaR0iATHGlcZ8Ljler8twedFZSGnBooTCrif466CTiSetNM7qC06ewijayqV+ELM57ONG67mTXswvGFp0LN9W4vnU+51yZVr9+45WQtpYjqWUQWWFx3qMVgIND1LfO+b/k27Zmb0tBID+RkiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhQ6FmIp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhQ6FmIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1721F000C4;
	Wed, 14 Oct 2026 22:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792017710;
	bh=8rQPeS4GWfDb5rK9p3/Y+jOQZjitr1hnW78wVldaSCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZhQ6FmIpsXG6sNMWv9d5vCClCNoVQlexS+nRSna8OwYWj67JpUKOPCMySMl6CRj3x
	 zxFPocev+f1KKwA7tAJWNArubD7fiPQ3+K6wv4f5oQfqSIOKehOcqi6qFU5hTJohBO
	 37FQunVfiD98fFirpAHiy49kBAksn2eEGAAZJn0/JxPntVkZ5ZDMCGnBxkU9coXAw4
	 QQYiOPsEOdMQgh0KDONKThAADuyoT+MrQyyYqAplpCi8TPjvH72Gmqm3HwP3Q0ezhh
	 euKHicCs0LAbR4xQABaeO2d9O8Giwo3Yp7e0XdjnhfcIiLMMhg3OUO2E8aTDzludka
	 SlTfD02AXwGbg==
Message-ID: <sashiko-outbox-172000@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 12/12] dpll: sit9531x: model the inter-PLL
 sync net as a pair of pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013224131.27149-13-arouhi@sitime.com>
References: <20261013224131.27149-1-arouhi@sitime.com>
 <20261013224131.27149-13-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 22:41:49 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dpll: sit9531x: stale INTSYNC state cache on resume error due to=
 missing read-through
--

commit e06eb4f817583cad992628e6390b7200bbd62de7
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

    dpll: sit9531x: model the inter-PLL sync net as a pair of pins
   =20
This commit models the internal inter-PLL synchronization network in the
sit9531x device as a pair of pins (output on source, input on destination).
It adds logic to detect, configure, and restore the INTSYNC state across
various operations and suspend/resume cycles.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index a744de2c75858..a7b0b2d35cb7c 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
> @@ -4882,8 +5266,34 @@ static int sit9531x_suspend(struct device *dev)
>  static int sit9531x_resume(struct device *dev)
>  {
>  	struct sit9531x_dev *sitdev =3D dev_get_drvdata(dev);
> +	int rc;
> +	u8 i;
> =20
>  	sit9531x_page_cache_drop(sitdev);
> +
> +	/*
> +	 * A part that lost power across suspend comes back with its
> +	 * profile's INTSYNC routing and output mutes, not with what the
> +	 * caches say, and the poll watches neither.  Read them back here;
> +	 * a cache that cannot be read is left for the getter's read-through.
> +	 * Nothing races this: the poll is parked and the IRQ disabled.
> +	 */
> +	mutex_lock(&sitdev->multiop_lock);
> +	rc =3D sit9531x_intsync_src_detect(sitdev);
> +	if (rc)
> +		dev_warn(sitdev->dev,
> +			 "INTSYNC source not re-detected on resume: %d\n", rc);

[Severity: Medium]
If sit9531x_intsync_src_detect() fails to read from the device, the code
logs a warning but leaves sitdev->intsync_src holding its pre-suspend value.
Unlike the output mutes right below which set a state_stale flag, is there
anything triggering a subsequent read if this initial resume read fails?

> +	for (i =3D 0; i < sitdev->info->num_outputs; i++) {
> +		rc =3D sit9531x_output_state_refresh(sitdev, i);
> +		if (rc) {
> +			dev_warn(sitdev->dev,
> +				 "Output %u mute state not read on resume: %d\n",
> +				 i, rc);
> +			sitdev->out[i].state_stale =3D true;
> +		}
> +	}
> +	mutex_unlock(&sitdev->multiop_lock);
> +
>  	if (sitdev->irq > 0)
>  		enable_irq(sitdev->irq);

[ ... ]

> diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
> index dc8d84133b72b..5f530c4a8271d 100644
> --- a/drivers/dpll/sit9531x/dpll.c
> +++ b/drivers/dpll/sit9531x/dpll.c

[ ... ]

> @@ -869,8 +940,325 @@ sit9531x_dpll_output_pin_direction_get(const struct=
 dpll_pin *pin,
> +static int
> +sit9531x_dpll_intsync_src_state_on_dpll_get(const struct dpll_pin *pin,
> +					    void *pin_priv,
> +					    const struct dpll_device *dpll,
> +					    void *dpll_priv,
> +					    enum dpll_pin_state *state,
> +					    struct netlink_ext_ack *extack)
> +{
> +	struct sit9531x_dpll *sitdpll =3D dpll_priv;
> +	struct sit9531x_dev *sitdev =3D sitdpll->dev;
> +
> +	mutex_lock(&sitdev->multiop_lock);
> +	if (sit9531x_dpll_intsync_src_connected(sitdev, sitdpll))
> +		*state =3D DPLL_PIN_STATE_CONNECTED;
> +	else
> +		*state =3D DPLL_PIN_STATE_DISCONNECTED;
> +	mutex_unlock(&sitdev->multiop_lock);

[Severity: Medium]
The comment in sit9531x_resume() states that "a cache that cannot be read
is left for the getter's read-through." However, this getter directly
returns the cached intsync_src value without attempting to read from the
hardware if the cache is stale.

Because the resume path does not invalidate the cache on failure, could this
result in reporting an incorrect, out-of-sync INTSYNC state to user space
and erroneously accepting or rejecting configuration requests?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013224131.2714=
9-1-arouhi@sitime.com?part=3D12
