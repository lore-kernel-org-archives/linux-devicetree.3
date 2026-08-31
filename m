Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0FA3624CF
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204223; cv=none; b=nytpSxVr/nzwh8d2NzYzcSC0VQyk0io3o4IUwh70KSEyxfmJKR6KWJ+gByywyAmWDAqoBPkPyXrkDgS3DXDEE61A7qgZ5WO1y32DOR6rJTZj5YrxxET6nis9Gpo+NBZkFdJAJ1VeGX7K6RiPz9rKzmDsGDX4WMDvv1wHLeVc8eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204223; c=relaxed/simple;
	bh=33CoSOkIY4U4KIjyo3jbu3uG68/7EUp9CMfq4PYG4pQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PakdyOFZTbuplwKBV++gPgMPjILwgswRcxXyn14yVxwV9/Ir0LP9ShbHEc1/6Jn36ylgBFhPqcuJOurDX/dj0vHXxUrVDvzMA0XsDez6vIfTXzsHwcMd5UJ3hXCMcjEwH/7DVn8ongbzPTkTxstt2ihBC3RxF4Cma78e8WEm2ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jy5O5eQt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jy5O5eQt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2360E1F000E9;
	Mon, 31 Aug 2026 19:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788204222;
	bh=US7tDUJHDJZT4wtqyUKRzhu5v/U2AJRJTX60kH3FK1o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jy5O5eQtD7+SJD/tQr/zuQSbThcwcJRQJrS8Jo1TOE0TGIiKpx7hlATDw8U2Wc0UB
	 1KX6MRwQM+WRj91b9fxZ/ilp8ZrCubrDhPvAGIQXeonBtoH6oJ08wnuQDn8iNZ0Kd2
	 wWvRBOhQNIdF2QdrpCyBDin0fFr6OR4+V7BCG6vizLE340cUYXVzdYMqhgeOQP3kl3
	 BTPa5PH1vf9js3E2AOMsNZgw5m7fmIOMUNCg5eI9ZZ5DYLgfNX9PufW0/UWZhKWbEw
	 QSg9D//iBwNEQX6lg/Xf+ybHOL+rjQUmHKYvj27gcVAsuqoZJs/x1SXjFX5a3poSaH
	 dOdNNggd3wwvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH wireless-next 1/2] wifi: wfx: fix possible device hang
 during init
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260831164056.47683-2-jerome.pouiller@silabs.com>
References: <20260831164056.47683-1-jerome.pouiller@silabs.com>
 <20260831164056.47683-2-jerome.pouiller@silabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 19:23:41 +0000
Message-Id: <20260831192342.2360E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missed firmware startup interrupt on SPI platforms due to late IRQ=
 subscription.
--

commit b2aaae6022fa921df221babdf79ea3e5f12e766f
Author: J=C3=A9r=C3=B4me Pouiller <jerome.pouiller@silabs.com>

wifi: wfx: fix possible device hang during init

This patch modifies the device initialization sequence to limit data
polling to out-of-band IRQ setups. It attempts to prevent a hardware lockup
that occurs if an IRQ fires while the host is reading the control register.

> diff --git a/drivers/net/wireless/silabs/wfx/main.c b/drivers/net/wireles=
s/silabs/wfx/main.c
> index dda36e41eed13..da30e8f481ada 100644
> --- a/drivers/net/wireless/silabs/wfx/main.c
> +++ b/drivers/net/wireless/silabs/wfx/main.c

[ ... ]

> @@ -374,12 +373,19 @@ int wfx_probe(struct wfx_dev *wdev)
>  	if (err)
>  		goto bh_unregister;
> =20
> -	wfx_bh_poll_irq(wdev);
> +	if (wdev->poll_irq) {
> +		wfx_bh_poll_irq(wdev);
> +	} else {
> +		err =3D wdev->hwbus_ops->irq_subscribe(wdev->hwbus_priv);
> +		if (err)
> +			goto bh_unregister;
> +	}
> +
>  	err =3D wait_for_completion_timeout(&wdev->firmware_ready, 1 * HZ);

[Severity: High]
The commit message states that the IRQ is subscribed before the first
exchange with the device. However, looking at wfx_probe(), the code just
above this snippet calls wfx_init_device(), which conducts the first
exchanges and unmasks device-side interrupts.

Since irq_subscribe() is only called after wfx_init_device() finishes, is
there a race window here?

If the device asserts the firmware-ready interrupt during this gap before
the host OS registers the IRQ handler, could the edge be permanently lost
(e.g., on SPI platforms using edge-triggered interrupts)? This seems like it
could cause the subsequent wait_for_completion_timeout() to timeout and=20
hang the initialization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831164056.4768=
3-1-jerome.pouiller@silabs.com?part=3D1
