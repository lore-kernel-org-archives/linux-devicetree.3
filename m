Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201085;
	b=kIF1b/bH5Vq9rrHqsRvTogMQPUdpFytAweasCnwHHRQGvX8ZQd8T9x2AWUUnMnXgGS+a
	 gkAa+5CXim422EIcPtCu+kFyzCe143Odl/vk6k/m+ALJQ7py46VOPqc9e3IJN9tPL3Rpw
	 gu3QQzckdvKAnek3BujVDRfHPnkpkuSGtgBjvJNZdpEvvruk9ytfR43pDmIDYiU1tXnBG
	 8vvbr6ZY2krW8lokq938rXgxHptgIav0olmtsxRlxFaApBf/RXH/JZI/KEODIwn38B3XQ
	 5PkbWeCmH78xfZQimeg8yEYqn937fKd3p2Ee0gTssVPS9DskUI439JKLA5LGe8FvJww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201085;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kLa/ktQb6nF/IzsmolVfdoxy/DHth7joboUFEBOLt+4=;
	b=dHCD4Wzg/e3p825GWHo3UbfAdPbpH6ydBVRBChvOkLSYXL5r9ZmkagNBSUrMZFgZ4ibk
	 5sk8DulOGtnZhCKnWiVq7/exUTr6KKKloMWc3BIo4lbhQusHLVp5s9I8AVqtkGUFsX12n
	 qb7yd3kfJ9QS94gCoixAIswmuTkr86/86XlmTCsC7XkDcgxiqA4gK+VsoFb6F9j+27J5t
	 //by5uQSDp+HMuiXcID3Y6hGBj/ZLIx2ilHlJsFDXQC0Bsc3jjIEGL6HFlXCoubGWPxQl
	 zG1x0+gLFAxMXz0QteI1WfiDassrsnpOFu7HZrv+YaRjn040ANOITTia6J5+gPZLC0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=klE1KVR4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5CB60A2608
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=klE1KVR4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0917A1F000E1;
	Fri, 20 Nov 2026 18:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795201084;
	bh=kLa/ktQb6nF/IzsmolVfdoxy/DHth7joboUFEBOLt+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=klE1KVR4l6PX7i/nb1eBMolzEKmELQURpJbBaGFF9PAuYBxi8go1DjZScUUv4BK6N
	 mRFQDA+3C8POPEt10LPqIP1pdiTSVF2cHJ/PDrPR9JD8sOoXL6Oq9qUTd00j4cDfpm
	 T7x/R3J3N1EoZR1W7KgrDrJgbVEFPrS4Uapm41fEZUFentV7SU6P3mlOtCGNrsq22z
	 J5JXr+7BpUSzuqH3oO0Qi90PNttMhpKaU0XpVMCETlFzGvEdyYx2yKJDGSdxR3wSdb
	 zGVY4xGp8IyB5dL38AqBOHEc33Qo0sgvMPDBUlOTGVXJbCgsIxPUrheP5Yfw9Q8QiI
	 VYgQE9JQbAQ9A==
Message-ID: <sashiko-outbox-225878@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/11] pmdomain: amlogic: meson-ee-pwrc: power up
 memories for boot-enabled domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261120-meson-drm-create-hdmitx-phy-v2-6-93d622d9bb07@aliel.fr>
References: <20261120-meson-drm-create-hdmitx-phy-v2-0-93d622d9bb07@aliel.fr>
 <20261120-meson-drm-create-hdmitx-phy-v2-6-93d622d9bb07@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 18:58:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] pmdomain: amlogic: duplicated memory power-up loop in
  meson_ee_pwrc_on()
--

commit a69a64ee3e13ba7f9072dbadb0f25ec3e146c336
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

pmdomain: amlogic: meson-ee-pwrc: power up memories for boot-enabled domains

This commit introduces a helper to clear the HHI memory power-down bits
for power domains that are found already enabled at probe time.

> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/=
amlogic/meson-ee-pwrc.c
> index 338f70d77bf03..404af46192562 100644
> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> @@ -428,6 +428,16 @@ static int meson_ee_pwrc_on(struct generic_pm_domain=
 *domain)
>  				       pwrc_domain->clks);
>  }
> =20
> +static void meson_ee_pwrc_mem_power_up(struct meson_ee_pwrc_domain *dom)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < dom->desc.mem_pd_count; i++)
> +		regmap_update_bits(dom->pwrc->regmap_hhi,
> +				   dom->desc.mem_pd[i].reg,
> +				   dom->desc.mem_pd[i].mask, 0);
> +}

[Severity: Low]
This isn't a bug, but meson_ee_pwrc_on() right above has the same loop:

drivers/pmdomain/amlogic/meson-ee-pwrc.c:meson_ee_pwrc_on() {
    ...
	for (i =3D 0 ; i < pwrc_domain->desc.mem_pd_count ; ++i)
		regmap_update_bits(pwrc_domain->pwrc->regmap_hhi,
				   pwrc_domain->desc.mem_pd[i].reg,
				   pwrc_domain->desc.mem_pd[i].mask, 0);
    ...
}

Could meson_ee_pwrc_mem_power_up() be defined above meson_ee_pwrc_on()
and reused there as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-meson-drm-=
create-hdmitx-phy-v2-0-93d622d9bb07@aliel.fr?part=3D6
