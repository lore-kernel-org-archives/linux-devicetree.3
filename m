Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CCA348C5A
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079386; cv=pass; b=Kz7DrzHyN6Ffg4xy5Ih3fD+J8X2o1ATWOXHoCIX8t9ekgf3smJg9ltgr8q6FqjDkFd7lx2hWTt8PYyMTuKzzZcJfGi8GyYcDW3tH0wfRZ96AU+8xOLOVzfSpmUaNdv33PzoRwl8maWw1hEs0c/2wlnySYaHXafxoiscbUs0fsko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079386; c=relaxed/simple;
	bh=/rsvtot1H8oonankc8I/0lOyn+rcfdNAR9xvGxSRQNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c9gQGz4DeI3YAG8ht1tGSXT0RmU8LVHAhgE8wO1tkd9Tcb1jl911XJWdDuVozjBcyWjO9ySuXlb7qEKaGds2pXb58EmIeC/zHkVED4JaB0usLr5AZcYV92RtYicMIHxIN8bHQ4TSHOhBbxoxAfrj7h6ePFi6e3ecY/v7bbUJtK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HVFdvUIa; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HVFdvUIa"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68cec9f4c6cso9051676a12.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781079384; cv=none;
        d=google.com; s=arc-20240605;
        b=KKOKl85JRzCUlv1Q7LMJzcX16VMoYJt6tMpBgvQbjrIoZ5TlC5lErsUxSLkezgRl4m
         t14N21v7L6ePtmEi13soYBcXahjQgeseb9GlARN9MSgiR7e3BbDGuWeaRdNm36zVMBWL
         roZelFSHre4B8uIDxoCExtZ0yabHcFfUPvs119NSzWeKz5DBEgtglEfu91jXR/I9roU2
         Esa7PFd2Md18uz4gleVtF89Hpp4N42+PiZ0WQz3AZ7JTjz7wWHneJkg6h0B1g2C31mCW
         7EwOWykqq24GmV9XLWKbeZUAfs+xeVVcXIH0DpQ0txMoF7oIZKjqnWJKMxj7j7bnobZp
         Z90g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tHoPJkb7g+dCqec0zDKH8l5x9cBJqpDBFECmITAhpgs=;
        fh=Q8hU88P46/I8AknFGRhvtv2ccmK7NmsNhm72JcUNEjM=;
        b=bMY/CEhNRAN+8mSU7rpkXUDgCf2OLagqEmVgl1azkuZvg4fBly2uSLQkEZSRy8pS57
         UE9FJcSi07thIG9HtII/49BLE2q7hD0dYsrXlpOqqSi+WtLel/c+HTCaACqxiYjLmmVL
         PNuyqtW4H4GMVkOzXjjxZVaJBjdstlU6zJASBA1qHCIOyPNkzvpBNHnTDDNNtYSX1/S3
         DLG59qi3I4MgxhHCAXwNHxgG1rkAmActdInDCPq2He93OoQIWdqvcBJgMBsa/YttqPXg
         5eKFnb1xWef6yhbHttI8a/DkDv9sXOvAA2BEeuxJPtjiZfcr1GIDPs7qr5xH9ytJn06o
         JyJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781079384; x=1781684184; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tHoPJkb7g+dCqec0zDKH8l5x9cBJqpDBFECmITAhpgs=;
        b=HVFdvUIa6iq6mss3vnSp1pft3ZK4pOPJtG4J8UkvdD3/fJxiFB+D77sEu0kHm3V0WA
         LR9dgEhgDEKL9/dMk4F6RmqUUgIIMkpRo7wB7RoOKByhfVjZfkLU3B48T3qqd75amsQl
         avHZmtoHQEvqQKaO1ltitazhhiUpGufYzgKajiUVh37DLJKriGZOCBTkiaj9YP5km1Fu
         WKU5B5z7SCACZZzEFsyvpioAcZo2wRYuMffrrce/BdT77fSkaZQmKYOPkr/Reh7SlKvc
         q8F+5LTVe/JGCUKMjgKNyuDhdKAjL9DjBxBIP5cN9Ond7sfdPYF3UJK6r/Mwp9ffe5cB
         J4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079384; x=1781684184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHoPJkb7g+dCqec0zDKH8l5x9cBJqpDBFECmITAhpgs=;
        b=TRJfbbWIiW9NXOPhtDFsa3K+4KOarsQ07uz+5tY/7dOqW1yxEfQlo2MLfKGKLtdzqb
         YtZg5VCtEhf900ndZzkKHaS9qvwFdW2ZKHWUM8e3zL3qZFY6zSgVE0da9w/w01dVJe5c
         V+RhNtPlI5RXN1rKOHRZxDzuAj25IpbQu5yf/AyoVqrWqgJV2g+aPC9VxMqrHh8nMtKD
         fcrQwwlAUTeDioViVW8c62I1bolSK4IAe3IdHf6xmCetwSbIHkOB38Mm95l+e7n9HlW/
         3mrgOq7Z4Nh/L7eD9W5OtH3/gUpePiw46GelT4FkopnxldL9R5hN6yvv99w7NNEiPu59
         dP6w==
X-Forwarded-Encrypted: i=1; AFNElJ8SJvDio30QicjxzjpSY4QIy9KMTJKAriwBcJP1Aj2AFg6QBJvH1TTBBw40XXCuPJcvrJBoYPxwLISj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6MTQ/3kuy6ld6KqNJUciXfTKRr3Ufk1lfgus+WNoaG2eMUzZ+
	/PyEsqh6cCi8i8tOgHeyoE0zxfVzZkAal/llKKvSO6m0IiRr4BftRKvobQRap1X5OyJ56aQlFFN
	k0EeX5UKWcudjziata64z2w4znProBHajpbdCdB++cQ==
X-Gm-Gg: Acq92OGZvnKMzvOdWpyz9ccTBgqY/zh8tuUbUH1locPNolZCEQUp2pkKM7WX7uZ/wr4
	E3djZZHTIlsKG3DJ1BWx8v373jfCyOKRXPcC75I91IUVh9vA8H7K7l+pzqEvgJpWojeunJsUi6F
	CyjmhJbW3e4Ez0+i/YXAsNFb9QMIbonSk02vQ/FC3pSwf1ZIvTaYT5nuTqD3IRo6bpJO2aPlFz0
	T00dSAyImV4NJxyS8rwNzbM5Yk2uxbX3A++JlCneUNoCyqArGYlZ4HJOlOwXWCb7T96jVvSlx3a
	Rq0O/VjxHV6qhchK+xPydkOAf3ARhOaVy7I66H+XK7/eGtHYPL1+ZJW25EXezRY=
X-Received: by 2002:a05:6402:364a:b0:691:52e1:646 with SMTP id
 4fb4d7f45d1cf-69152e108b3mr6650804a12.18.1781079383954; Wed, 10 Jun 2026
 01:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260610050337epcas2p1f6d27933f30ac063454fd25acbde327f@epcas2p1.samsung.com>
 <20260610050326.2903402-1-sh86.bae@samsung.com> <20260610050326.2903402-3-sh86.bae@samsung.com>
In-Reply-To: <20260610050326.2903402-3-sh86.bae@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 10 Jun 2026 09:16:12 +0100
X-Gm-Features: AVVi8Cdmggek5VJwntYPdwBeIDAOFuLirE2SfZ_uo_NZy2DfGsDe0iwZglsDAY0
Message-ID: <CADrjBPqwJhhb5qRvrxyw0Y1mmf9AhaaJFJe9Tzuo+H1aBJ1zNw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: exynosautov920: Add hsi0 syscon node
 for PCIe PHY
To: Sanghoon Bae <sh86.bae@samsung.com>
Cc: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
	alim.akhtar@samsung.com, kishon@kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, sowon.na@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Jun 2026 at 06:03, Sanghoon Bae <sh86.bae@samsung.com> wrote:
>
> Add the syscon-hsi0 node to control PCIe PHY power, PLL settings,
> and device direction (RC/EP mode) on ExynosAutov920.
>
> Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> index 0bf7c4cb9846..cc3ed5c52ffe 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> @@ -1382,6 +1382,12 @@ cmu_hsi0: clock-controller@16000000 {
>                                       "noc";
>                 };
>
> +               syscon_hsi0: syscon@16030000 {
> +                       compatible = "samsung,exynosautov920-hsi0-sysreg",
> +                                    "syscon";
> +                       reg = <0x16030000 0x1000>;
> +               };
> +
>                 pinctrl_hsi0: pinctrl@16040000 {
>                         compatible = "samsung,exynosautov920-pinctrl";
>                         reg = <0x16040000 0x10000>;
> --
> 2.45.2
>
>
