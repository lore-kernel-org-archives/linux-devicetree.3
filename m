Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A72C46C4A6
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785264203; cv=none; b=Xa55vV+c8Wxpw6BY3ECRLkbwzlcSjBhehg/EbK073OQJfWRnm6ei3iP1Glqe7pVeGNTm2hpyVsN09cjlTTC6JVPGhze+Qx+fe3LRScKQUQleWzZRdTs0Jyczu0tWOFq9D6D4M2EBGwxVrMfonFvW5sqkh4UHSqretDPPztjtCPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785264203; c=relaxed/simple;
	bh=LUczxFT6rjwbq8RWsGtpMfktTR4RDvqqqNSMl7zghfg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hqH4P9eHX3Tmd6EQz5YCPYm8OQTfkCvB4lNU1E8ku5d7LkzfGZZddT8ruN9cLkW77KadZu4999yOh3nHbgc+IpCUq524pZjANVChW9VJW4Gzp79EwaTarRuM6JTjG9boEErk2VuJjcFTjoQ0lRMMUhPJC/IJoTAhMWmAHkBnP08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ff8Kf3XQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ff8Kf3XQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20DC1F000E9;
	Tue, 28 Jul 2026 18:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785264202;
	bh=oJZtISN0vw15yZmCx5G1JMucEyyyp4AVsi660OOpugU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ff8Kf3XQ/8JCoRMJJ7YlpQa0QcXqSdHufdhJl72DvO3YlRal4ypqOXF9SShr104H1
	 J/0LrX3yQTHUFmWgcnYLJ4L5fpAADLEvER6Tvu56Qk6xkdq3GATLf4FWtbIv+x92HM
	 DPja+inMa+12XDFvGK8DzXUuv3Uk8Rh3gJ6UKMTMWRbHkoAvu0nAH1V+6avDbr3SZl
	 KG0mpEBap6dRlX22ZsyQLxNhhVsihxmGRabndVrz9erWUMiuJ48s7oL9syBpgMEzxJ
	 BK6J3u6gUbFWNfrdQ1ApDybKFC5Q4bJPMCypoamgrrpbJkjB+xDdTpz4UexH7+Kp48
	 iaAy3+YrPuZzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/18] drm/bridge: synopsys: dw-dp: Reset AUX channel
 on transfer timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-5-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
 <20260728-synopsys-dw-dp-improvements-v7-5-b7640fa8cf48@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 18:43:21 +0000
Message-Id: <20260728184321.E20DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The soft reset mechanism intended to prevent delayed completions f=
rom leaking into subsequent transfers is incomplete due to a software race =
condition with the threaded IRQ handler. `dw_dp_irq()` is registered via `d=
evm_request_threaded_irq()` with no hard-IRQ handler, meaning it executes i=
n process context. If the hardware asserts the AUX reply interrupt just bef=
ore the transfer timeout expires, the IRQ thread may wake up and read the i=
nterrupt status (`value & AUX_REPLY_EVENT`), but get preempted before calli=
ng `complete(&dp->complete)`. The timeout handler will then reset the hardw=
are and return `-ETIMEDOUT`. When a subsequent transfer starts, it calls `r=
einit_completion(&dp->complete)`. If the delayed IRQ thread resumes and cal=
ls `complete()` at this point, it will erroneously satisfy the new transfer=
's wait, causing it to read aborted or reset hardware status. To fully clos=
e this race, the timeout path must synchronize with the threaded IRQ handle=
r (e.g., using `synchronize_irq()`) before returning.
--

--- Patch [5]: [PATCH v7 05/18] drm/bridge: synopsys: dw-dp: Reset AUX chan=
nel on transfer timeout ---
commit fd706e1cca6ddcdd0e07e034b13e849a9aa5e4b5
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Reset AUX channel on transfer timeout
   =20
This patch resets the AUX controller when a transfer times out to prevent a
delayed reply interrupt from leaking into a subsequent transfer.
Re-initializing the completion before each transfer does not protect against
a reply interrupt that fires after the initialization.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1493,6 +1493,11 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_au=
x *aux,
>  	status =3D wait_for_completion_timeout(&dp->complete, timeout);
>  	if (!status) {
>  		dev_err(dp->dev, "timeout waiting for AUX reply\n");
> +		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
> +				   AUX_RESET, FIELD_PREP(AUX_RESET, 1));
> +		usleep_range(10, 20);
> +		regmap_update_bits(dp->regmap, DW_DP_SOFT_RESET_CTRL,
> +				   AUX_RESET, FIELD_PREP(AUX_RESET, 0));
>  		return -ETIMEDOUT;

[Severity: High]
This is a pre-existing issue, but does this soft reset fully close the race
with the threaded IRQ handler?

If the hardware asserts the AUX reply interrupt exactly as the timeout
expires, the threaded IRQ handler dw_dp_irq() could wake up and read the
interrupt status:

dw_dp_irq() {
	...
	if (value & AUX_REPLY_EVENT) {
		regmap_write(dp->regmap, DW_DP_GENERAL_INTERRUPT, AUX_REPLY_EVENT);

If the thread is preempted right here, the timeout handling above executes,
the hardware is reset, and the function returns -ETIMEDOUT.

When a subsequent transfer begins and calls reinit_completion(&dp->complete=
),
could the delayed IRQ thread resume and execute the completion?

		complete(&dp->complete);
	}
}

This would erroneously satisfy the new transfer's wait and cause it to read
aborted hardware status. Would calling synchronize_irq() in this timeout pa=
th
prevent the completion from leaking?

>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-synopsys-d=
w-dp-improvements-v7-0-b7640fa8cf48@collabora.com?part=3D5
