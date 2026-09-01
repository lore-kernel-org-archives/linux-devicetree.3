Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E91C47253F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252613; cv=none; b=AQ2VIoKO7Y3aq8C6UXbytwt5js+IwS1hma/HGy3Vdt+30KWKkbMKAcUt2VJTdPU4ijsZz8zthJCvUzrUAxGHMeLoWfoCBUQhB8Sp0Eiv6HgzN43hoWTYZ/5HfBIn0oJAOO3ZJgY7nztPluXx4XoJn6fA0QUqmgMYxdzrgxWXq2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252613; c=relaxed/simple;
	bh=Mc4hIKqpO4NnPitXMyzK0hC8Fd38IEy8slpbDwtZuBA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dQbp/4u4OOjjcahICmvLZYViXQFGBQtAuOBPB73yoqf7DTlBmH+5D0K0RMrezDpVoGcntMqifjAHWp/IQSUzG+vwAGiI2x7UQMiuj1SvzjVSrk2Zac1Yf/dh4mnyirAfXRCnRk/RqjdLBQObTt+LH/qJnIk8jRUpEF2Vmw/SEzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyE3OZk4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyE3OZk4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B011F000E9;
	Tue,  1 Sep 2026 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788252612;
	bh=W7er0D/uRq9Te2WNfNX/g0pW+ljB4P6U6zQm1qwniUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hyE3OZk4l/31hME34CRLe+gRd7C/QhRGOXVsiv/EALsbj5HIp8hyelUfbMF0LVJeR
	 4Qc8ZXDZfsYx0fG8fCxtl+6JdVE9WJ1OJcZr4dux/BvvW7HBmlDvys+gySBm5EFHHT
	 Whiep5ej84U0hEl/J3aEEK0DPu4rRRFMoJUvnanpckxtcmTBPrOh9BYOd6jbFljVyZ
	 kW47maHgJUiLyLAKtg6OC3yfsI3xnZV1UB89FQ86u6qBtJn7tMpC7CtpkxQ3O5VUPs
	 JSmTNDcpesKoLVGfypzupkg7P8lxttSxBth5K9nvS76P2eZwAkAuZxDMd3Cu/SsZHN
	 tk00VmZTc9o9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH wireless-next v2 1/2] wifi: wfx: fix possible device
 hang during init
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260901083548.113131-2-jerome.pouiller@silabs.com>
References: <20260901083548.113131-1-jerome.pouiller@silabs.com>
 <20260901083548.113131-2-jerome.pouiller@silabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 08:50:11 +0000
Message-Id: <20260901085012.21B011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uncanceled delayed work triggers Use-After-Free.
--

commit 0e92ce2797177a88d76cee72478042230234d0a4
Author: J=C3=A9r=C3=B4me Pouiller <jerome.pouiller@silabs.com>

wifi: wfx: fix possible device hang during init

This commit fixes a device hang by limiting the use of the data polling
mechanism to out-of-band SDIO IRQs. For in-band IRQs and SPI, the IRQ is
now subscribed before the first hardware exchange, avoiding the polling
workaround entirely.

> diff --git a/drivers/net/wireless/silabs/wfx/main.c b/drivers/net/wireles=
s/silabs/wfx/main.c
> index dda36e41eed13..4e99fe7e5bb78 100644
> --- a/drivers/net/wireless/silabs/wfx/main.c
> +++ b/drivers/net/wireless/silabs/wfx/main.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but I noticed a potential use-after-free in t=
he
driver cleanup path. When the device enters a high temperature state,
wfx_suspend_hot_dev() schedules cooling_timeout_work on the system workqueue
with a 10-second delay.

If the driver is unloaded or the device is removed before this timer expire=
s,
the devres callback wfx_free_common() frees the wdev structure without
canceling the pending work:

drivers/net/wireless/silabs/wfx/main.c:wfx_free_common() {
    ...
    ieee80211_free_hw(wdev->hw);
    ...
}

Does the cleanup path need a call to cancel_delayed_work_sync() for
wdev->cooling_timeout_work to prevent the delayed work from dereferencing
the freed wdev pointer when it eventually executes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901083548.1131=
31-1-jerome.pouiller@silabs.com?part=3D1
