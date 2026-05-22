Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CAD228CB0
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779421779; cv=pass; b=ELDEla5OevfcTlFH7p+/JIFyUHx1jkOvnc8Vkqa4xkPpBjzxv/bGxlxz1P8E5xvykxY9QJnPzLS6prn58KktE2gtRHFDJZQ9GO8Ev/f4zqKulEV92FstrLh8rsMFJXXBGroMeTMAKmH5LG2+/bMg8B1aecdToRhINjjRU4DLUvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779421779; c=relaxed/simple;
	bh=yMUnN/Dw/0q1+vIuvOPi7ykjNAVJVeCDLiFfoWV0CTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ejsFnI8mheyRWIweI4G900KjkpPv80xM4wN/JsjlUBPoCuEVB2nYXZzoFFgUQHVhZ28DYC1j/9w3AbLiSCWhDNJ7bqE/Qf017aAFyIH35+QNaE1M037R8DpFVxcHV1++bgj5t1CZ1gdTs/qEQJq0TKCSt3C7iaR0sEgTGMPyCYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNfuu/yM; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNfuu/yM"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1357c851a48so8489166c88.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 20:49:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779421777; cv=none;
        d=google.com; s=arc-20240605;
        b=IacqdODof6D4YU9T/wKJyvkSmXbFQMAgcmhdy5nX1CVOcbpwTT0QAlY2XeD0PuFJ9V
         ws3Psvx4dF2w6qt0rpigrZhL/+uz8aaV7xta4Nb4K+PIW8y8Ful/Itd2hvlhh1InyfS5
         lavp+D/avBPW9j4VxswzYdGraFGRVJ3lNsH2tKy46pUKG+CTnFbLGgGH/i/AJshaZu6L
         e4P9pmmnXZ1zrKUhRpLpWUNou1fulLyxyisZxmgu31ipSslixiAp8wK5SE/prnrV35LJ
         WWHGiE+S3TfpL7nziRf5D9hi7xDYcBncCmJ8ce6YNR+TFOFLqjIFPMGT7AHH9g+hVSAu
         Q83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+qT5BbvAf0970jGpHLlqJ9wvkmx5X5Z5+OFS5PTjFcE=;
        fh=0D1LIpnmGKGRCGBPjvEmIgoMYtimIXXhya3iAe1m+94=;
        b=g39ffvNI0hCyormgDReMaG/hsDA/2DqwYKnqt+Pn7umbMk8zZb6SBnKVIBWf4OBP0E
         rgZseDSLoI2yEMqs3UePNLQmSUSUI7jraL5G0KIJbRNZI8KMG+SbNJgPtK186ZquCaVA
         GE8oC8hUPlQUH2lzJyL50QgCQk/OnR2LXuyTocxcQZhiJgl7f90KYyx2sWLsAhocS/2d
         BhXovbvYtsJGZ/ki7FbXvTk2E+1lMMthl7CoXfWaprjyUZOvqwErZzNXGpwHsaPfDdm2
         eYiy4ROaTg9DAlSJH7wkszdPjIXzAV7fXtrGZ53/VY+4YcTbq/yIYqeo9DXmQDkOUXoi
         B7yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779421777; x=1780026577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qT5BbvAf0970jGpHLlqJ9wvkmx5X5Z5+OFS5PTjFcE=;
        b=nNfuu/yM+6Xoo1LEZhp2Rgz0wHaS4KmOZaK45G8QEsF8cfCrC36FYtkMPoVrneP/0U
         MJgz/w6S2Z3IPbnvEb2zjeUgAIM8R/aOGx4VneWPXCI/CYTv9lowKe0Jdw3UWWdmbQoA
         RWawXzdGm827fbEEe+9RzfclSGLkwLVCG6aotqVPvI2cnyKHEOKIZbcPlOM4ISd1FjoG
         mmGXZ7fL1ZwRWaNGIJraaHwWO+aTMXGxuWdgRi0gc+XQoXgWIH4QwfeFDfvpiHS7ZNNu
         cycnt1JkRRDmMqncPSApMOAFoeLv5MB/YofsmhxJzdGHttjKLUmuAJlIF05ozTWRAzY3
         MaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779421777; x=1780026577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+qT5BbvAf0970jGpHLlqJ9wvkmx5X5Z5+OFS5PTjFcE=;
        b=oQF7ts93w7gIVYDeYP/l1fH87w3SFQvDhH4AN2SU3OW/pEJz4eBG1USWLUadbja+eq
         m+KfNcHTXIrvhvEYuWcVsjlVGaHWjCUMJO0M3kSmQrnWkRd+I5Orxh+9w9rYmAXWV4bg
         PH5H77C0SLvS48BZ3wHnqM2l9s4MIwQF9bAwFyRucYETr0huQDyMZvmys0BXaVnLdfJC
         2/0O/9t11jxUN0Afkmnb8AIHYhPd5Tbe6Rzpws4g0ojgQQSHdHkqSW9+98eStABO7Yht
         WK6CHzF8j4bM11LMXy/VH7HYBGDpBbrWuFrm/D6alMFBLoTn/FVyeEXwIxIRxOatsY+8
         MOsw==
X-Forwarded-Encrypted: i=1; AFNElJ/L7bZ7dFsUOnMZ8wU9PYfry0H7utvKzJh2rBkxe96KFGTVca7BvItAgOG2/fOx6fyAXIdTfQxo9T2I@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7LCSLgEJVWtzYg/UYknT1kfem6n7xOwUAU8fEdqsm+jgLq2QC
	6+ldjx+TTRRyJKoXQEvoj41ioTG+NCaEm19lk+PSOi7bc+PAgyz/HV//MHS/XuV6RL2VQBKjXhs
	TCd/uWEFLJ0R+1z5u7dsPKZDi8VJLM8Y=
X-Gm-Gg: Acq92OG2IbcA67QWZ3M/NT0jZhUwLqMzBv9TU06879PDF9SWTf5qW2x7ZvXtCRaS39E
	E8OKSvkCbSDQh4SVEHAXf1op1ty0O3V6bEcAyFcG34yxiMlvhfNh9YnHDqdZ5N2aWVYUuh947P4
	72Rg0gtaIs7SY2jFKpRmPIF4nm4MC5pE4lAM2HkeTKZLovQwzgl6AE2Q/ilHoUQkSjSEj6gij0N
	bFlwhsXfVI2FFWwmCiKcQfarrpoqOt/kmrMvR0c0qsTfFZY7rNygP+E6y+pSydOU4rPknXS6Qdv
	AhuiXizZLKc5BaSUa3yiwyackJFqZsL6SolNlrYJ
X-Received: by 2002:a05:7022:4a4:b0:135:2640:70cc with SMTP id
 a92af1059eb24-1365f6fe0d9mr845587c88.5.1779421777083; Thu, 21 May 2026
 20:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
In-Reply-To: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Thu, 21 May 2026 22:49:24 -0500
X-Gm-Features: AVHnY4Ka54_MLKGXewXkQbTwbb4nAvWDr8M9psv1cc8wtCfvwYFbBij8bhm-Seo
Message-ID: <CAJ13v3RtV+_P_ShfrM5vH+neT0cB6t5yAbqGiiw7S7Y8qpVY=Q@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Enable networking for Asus Kommando
 IPMI Card
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Mar 31, 2026 at 9:18=E2=80=AFAM Anirudh Srinivasan
<anirudhsriniv@gmail.com> wrote:
>
> Adds the DT nodes needed for ethernet support for Asus Kommando, with
> phy mode set to rgmii-id.
>
> When this DT was originally added, the phy mode was set to rgmii (which
> was incorrect). It was suggested to remove networking support from the
> DT till the Aspeed networking driver was patched so that the correct phy
> mode could be used.
>
> The discussion in [1] mentions that u-boot was inserting clk delays that
> weren't needed, which resulted in needing to set the phy mode in linux
> to rgmii incorrectly. The solution suggested there was to patch u-boot to
> no longer insert these clk delays and use rgmii-id as the phy mode for
> any future DTs added to linux.
>
> This DT was tested (on the OpenBMC u-boot fork [2]) with a u-boot DT
> modified to insert clk delays of 0 (instead of patching u-boot itself).
> [3] adds a u-boot DT for this device (without networking) and describes
> how to patch it to add networking support. If this patched DT is used,
> then networking works with rgmii-id phy mode in both u-boot and linux.
>
> [1] https://lore.kernel.org/linux-aspeed/ef88bb50-9f2c-458d-a7e5-dc5ecb9c=
777a@lunn.ch/
> [2] https://github.com/openbmc/u-boot/tree/v2019.04-aspeed-openbmc
> [3] https://lore.kernel.org/openbmc/20260328-asus-kommando-v2-1-2a656f8cd=
314@gmail.com/
>
> Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
> ---
> This patch is based off aspeed/arm/dt from bmc tree
> ---
> Changes in v2:
> - Commit message now mentions that the u-boot tested against is the
>   openbmc u-boot fork
> - Link to v1: https://lore.kernel.org/r/20260328-asus-kommando-networking=
-v1-1-66d308b88536@gmail.com
> ---
>  .../dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts  | 18 ++++++++++++=
++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.=
dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> index ab7ad320067c1ddc0fea9ac386fd488c8ef28184..e0f7d92efa18ccbad2c336236=
c3b9d01b7de1bba 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
> @@ -107,6 +107,24 @@ &gpio1 {
>         /*18E0 32*/ "","","","","","","","";
>  };
>
> +&mac2 {
> +       status =3D "okay";
> +
> +       phy-mode =3D "rgmii-id";
> +       phy-handle =3D <&ethphy2>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_rgmii3_default>;
> +};
> +
> +&mdio2 {
> +       status =3D "okay";
> +
> +       ethphy2: ethernet-phy@0 {
> +               compatible =3D "ethernet-phy-ieee802.3-c22";
> +               reg =3D <0>;
> +       };
> +};
> +
>  &vhub {
>         status =3D "okay";
>  };
>
> ---
> base-commit: 76b4ec8efdc3887cdbf730da2e55881fc1a18770
> change-id: 20260328-asus-kommando-networking-5c0612aa6b8c
>
> Best regards,
> --
> Anirudh Srinivasan <anirudhsriniv@gmail.com>
>

While we're figuring out what to do with u-boot, what are your
thoughts on getting this patch in so that the kernel DTS changes
needed for networking land in this cycle?

The current commit message might become somewhat outdated if the
u-boot patch changes though, so not sure if that's okay.


--
Regards
Anirudh Srinivasan
