Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBCD3FFFBE
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596892; cv=none; b=KK2uNM0o/yK/L7QTi400+apOP6q3DveBf36JYdPLma0jNlAD1jdUL/bgM+jnPzlt6UHDMbMb7jc5s4j2j8rFmobrzQY5kj4AjkyP5jrsY6yxZmknXofx6zV6wUH9u/OL6aW6zXn/ZlhHwCFuoqFAuAM+MnS2mmQPViLHC99bGbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596892; c=relaxed/simple;
	bh=ss+DEy8ThGTFhbpfGmEmoNKqXYkOWgFVyjHo0zMRB+E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OHj4FOTye+84Psgy+zGq6udR40MqmxGy7AywIwTty+EpFptd7WRXyvcdRp3ruj/9r3cl3uJIg+7Hh8BiMUytc43h/tC57DuWiaO1s0cRJXa76h5CoX1MEQsyJrb4Zkcpi35O57mv1D0cyX2NzWLoiHskOEddXOLbdDgV3qvhxOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJ5BgUQl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJ5BgUQl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C840B1F000E9;
	Thu,  9 Jul 2026 11:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783596889;
	bh=cLcc3nFEudPRHhll9fp4Btw0WB//Yljdd58slfdL8ng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CJ5BgUQl2dthdAeehajr/sFcKnzmS2IYaMS9xcfR7YeD2q18bVOtZr+vKJONxKqMw
	 tJtyycgIgbu5oTy4bXEuA3pzup/3+/PUOdqZi9RO5WmsDGDpW07YyBsfxyhy6ml0GO
	 iyB7cpQe5gOHwAfvWYILyNh+FieetjgAjtWrvEtsIAIyX5aOzTfbRzaOZalurFu/bY
	 wGQzLH5MmArYsEQkgZYO4gTPuTsElkx6mrR8CXrJoU8hl6qE7oflQiJADfgMDUwRJA
	 SLdw+lQVniYeXO0NzO2wjM8gycmnrNOTilE/8IXQZRunabY8hwhVN4btpxUahqocGC
	 ufhCdzbUV8mqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] spi: atmel-quadspi: use init callback for gclk
 variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709112006.390742-4-robert.marko@sartura.hr>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
 <20260709112006.390742-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 11:34:48 +0000
Message-Id: <20260709113448.C840B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The `.init` callback invocation in `atmel_qspi_resume` is strict=
ly coupled to `has_gclk`, contradicting the commit message claim.

Pre-existing issues:
- [High] Runtime PM usage counter leak permanently prevents runtime suspend=
 for gclk variants.
- [High] System resume accesses memory-mapped hardware registers with the p=
eripheral clock disabled, causing a bus fault.
--

--- Patch [3]: [PATCH v2 3/5] spi: atmel-quadspi: use init callback for gcl=
k variants ---
commit ce20548a48abc8b47ba02b69140b1f7ba51f52af
Author: Robert Marko <robert.marko@sartura.hr>

spi: atmel-quadspi: use init callback for gclk variants
   =20
Assign the existing SAMA7G5 initialization routine to every generic
clock variant and dispatch initialization exclusively through the
capability callback.

> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index 62ea84d234d02..d1aec14e39789 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c

[ ... ]

> @@ -1576,11 +1573,8 @@ static int __maybe_unused atmel_qspi_resume(struct=
 device *dev)
>  		return ret;
>  	}
> =20
> -	if (aq->caps->init)
> -		return aq->caps->init(aq);
> -
>  	if (aq->caps->has_gclk)
> -		return atmel_qspi_sama7g5_init(aq);
> +		return aq->caps->init(aq);

[Severity: High]
This is a pre-existing issue, but does this early return cause a runtime PM
usage counter leak?

In atmel_qspi_suspend(), the usage counter is incremented but not balanced
for has_gclk variants:

    ret =3D pm_runtime_resume_and_get(dev);
    ...
    if (aq->caps->has_gclk) {
        ret =3D atmel_qspi_sama7g5_suspend(aq);
        clk_disable_unprepare(aq->pclk);
        return ret;
    }

By returning early here in atmel_qspi_resume(), the
pm_runtime_put_autosuspend(dev) call at the end of the function is complete=
ly
bypassed. Will this permanently inflate the usage counter on every system
suspend/resume cycle and prevent the device from entering runtime suspend?

[Severity: High]
This is also a pre-existing issue, but does this early return lead to acces=
sing
hardware registers with the peripheral clock disabled?

During atmel_qspi_suspend(), the peripheral clock is explicitly disabled for
has_gclk variants:

    clk_disable_unprepare(aq->pclk);
    return ret;

In atmel_qspi_resume(), clk_prepare() is called, but clk_enable() is never
invoked before the early return:

    ret =3D clk_prepare(aq->pclk);
    ...
    if (aq->caps->has_gclk)
        return aq->caps->init(aq);

Since pm_runtime_force_resume() is bypassed by this early return, the runti=
me
resume callback is not triggered to enable the clock. Will this cause a bus
fault when aq->caps->init() performs register writes (e.g., to QSPI_CR)?

[Severity: Medium]
The commit message states that this change "keeps hardware capabilities
separate from initialization selection".

However, by removing the generic check for aq->caps->init and gating it
strictly behind aq->caps->has_gclk, doesn't this couple the init callback
invocation to the has_gclk capability?

If a non-has_gclk variant defined an init callback, wouldn't it now be
ignored during system resume?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709112006.3907=
42-1-robert.marko@sartura.hr?part=3D3
