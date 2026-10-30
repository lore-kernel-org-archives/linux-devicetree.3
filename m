Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384965;
	b=4V2LfqC8Jo2GzNthrKRXw6a3wqBtz1yDJbGr2vqhfRJvi11Ro9B6dGNZ7rHMUuFWvOka
	 9JYvFx/zjAX0O+luAfGVMLo6UlzDsrMa64ob3E6tTG9Xp8fNjBjx0uJ2gbqbcyJcAMIPx
	 rpO67Qu7wB1Kfl/T5Y1zBSGN6xfWpqx2hRGWwsKt6RKH88oR0FqYaByIlO9ieBhqNVIvw
	 g/1URWbld+F6C27C0l6nIZA8OQY9nDE6VPUlXPCNS1W0l7Zz6/yf8GRBKuCy7GqNDsL4B
	 uiauexHPvK+CYYs4MHEUF2E+Es1iFXOdSNVhjNN+GOcpUYWiF4TS0GVdR/GmTZsIXIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384965;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uz4LvSzcuRJZi3XMUYqqNT+YpLDfO9WhSvjXXbISjQ4=;
	b=dcULb/7ffEjJuseOSPmbx+etk4Ij0JAQzlD/6HMG6s0+x3avgHgQvAAtxKSk5YszpQnB
	 /3n3LlctK9Lo/4pDw4ZGNwX/iIRySIR7QP5EJLQ77OtwFaheI6oYbKlQfaQkewcCGJ2sR
	 U5m2L+Vor1vk5vQMUiqyUDAHus7UYplAT4mQyExDNvCgZktyyl2oXmGOaZm8o8sJNWN64
	 pdOSkO6Enj4DG6SakC2ysqPcC+cxhRwJfdHRZU4WES9EURobwRzNdHpQRuVhxuylkH9Vh
	 clo2WWOwofEAfyZCQhjmRYizY67IZHyg31Ij/ZJ6jkBs2bKOFJRZf6MYzX/9hG4Bqtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=By7pOfnN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A10606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 18:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=By7pOfnN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA301F000C1;
	Fri, 30 Oct 2026 18:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793384964;
	bh=uz4LvSzcuRJZi3XMUYqqNT+YpLDfO9WhSvjXXbISjQ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=By7pOfnNMrrkozydY9CdmNAISt6YmEsER6ipZdbLf8EeQSyrQAC9G+doojFDNNeo6
	 gkW0cLaqZR9vOBwe8rXp3iPJjQWc9WjeEebcUSxH46lh5JO6EtRQJ1uGlcVSoICZLO
	 MYkwsVjNWHMktFDwxLDhHBQ4KvjA4hIklBZW1KLbHBtvXy1s7jPTpyXxkd2mlqUzw0
	 O2m3LGF2E9BuR69FcwVr2CtLD/wj7WcQGgUx3GmzWMiGU9Bm88fJ0xHh58qvb4crQ/
	 DcXPmHVMDpSUVhBFLWOxMQGcU5DR1qJ5m6GhSXtIh+dHCxXWevraah61Ea0jUY8wtz
	 T5HPNqFXTSM7g==
Message-ID: <sashiko-outbox-191408@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 6/6] mmc: core: Add support for resetting an eMMC at
 system resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kamal Dasu" <kamal.dasu@broadcom.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261030181034.3811225-7-kamal.dasu@broadcom.com>
References: <20261030181034.3811225-1-kamal.dasu@broadcom.com>
 <20261030181034.3811225-7-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 18:29:23 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mmc: core: unchecked _mmc_hw_reset() error and premature active =
state in mmc_resume()
--

commit f67582c90bab341460117ecbfa06f572b7755129
Author: Ulf Hansson <ulf.hansson@oss.qualcomm.com>

mmc: core: Add support for resetting an eMMC at system resume

This commit adds support for the reset-card-at-resume DT property by setting
MMC_CAP2_RESET_AT_RESUME and MMC_PM_KEEP_POWER, and calling _mmc_hw_reset()
during mmc_resume().

> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index c183afbed30c8..793767c5159f2 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -2320,6 +2320,14 @@ static int mmc_resume(struct mmc_host *host)
>  	}
> =20
>  	pm_runtime_enable(&host->card->dev);
> +
> +	if (mmc_card_keep_power(host) &&
> +	    host->caps2 & MMC_CAP2_RESET_AT_RESUME) {
> +		mmc_claim_host(host);
> +		_mmc_hw_reset(host);
> +		mmc_release_host(host);
> +	}

[Severity: Medium]
Should mmc_resume() check the return value of _mmc_hw_reset(host) and avoid
marking the card active before the reset succeeds?

Right now, when mmc_card_keep_power(host) is true, mmc_resume() uncondition=
ally
marks the card runtime-active and clears the suspended state first:

drivers/mmc/core/mmc.c:mmc_resume() {
	if (mmc_card_keep_power(host)) {
		pm_runtime_set_active(&host->card->dev);
		mmc_card_clr_suspended(host->card);
	}
	pm_runtime_enable(&host->card->dev);
	...
}

After that, _mmc_hw_reset(host) resets or power-cycles the card, resets the
host IOS state to initial values via mmc_set_initial_state(host), and calls
mmc_init_card(host, card->ocr, card).

If mmc_init_card() fails (for example due to a command timeout, voltage or
timing switch failure, or tuning error), mmc_resume() discards the error and
returns 0 to mmc_bus_resume(). That suppresses the resume failure warning in
mmc_bus_resume() and leaves the card marked runtime-active and unsuspended
while the hardware remains in an uninitialized reset state, preventing a
subsequent runtime resume via _mmc_resume() from re-initializing the card.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030181034.3811=
225-1-kamal.dasu@broadcom.com?part=3D6
