Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695123C2B80
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103526; cv=none; b=tdBgBd6q9UePPjOXey6lX4wFMx+crv/fXuROYaz+QkV6wGtefpq9sE6QLiTMme5NZv1reU/bj351CXXkS6Er9muNK4MM/X9XOaL0U1PfBYuRHJy/N3+cVan5TtK0k4kxg3ddQOuoyFZ7ra/jGj4VRSu+i4t378mH09IskqWL4ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103526; c=relaxed/simple;
	bh=tL9ke4GV6oGp+YWHUNQKE8E8soXN35upf5Ca2OWsGO4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s4ia71aby8V3+gQzLEIwoCTMygMBM/Q9Wu34bhs4z7YWfhWpGlI1pLlzJ0Hpexgo1Sa1BCI9viFv8ZzRia2yQo3Z3/5E2l9YnIw5rZnFb+d5jj8sa3/7uZLPDq4BWYV/YyfOz8cRDCVXlpqcLDYtvcB30lX1Tfn2c0I7I9q4cRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+vkypAF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+vkypAF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F76A1F01558
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103525;
	bh=8hGVZh4PoHLjhUPeUZDk7YT9r2Csoy+q60RG1t1sPcs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Y+vkypAFF2VaKmeNBsJM168DosyIXULOV/1fpLuzsTul1sgGvXaBR4KZ6xOeIC+2j
	 Ci+eiuoe5uMuHswoUkQiT4cMDUrKyJHoTFFQmF37me/jk2bry6CyrZbFe4/+NfwFcX
	 SG7ighaYJUwUSjtA22Qc2YIC4pFU+ExRU41dvQRVxxFMEEaWzAjIETlABGoFhH67vD
	 hcmZwvOC5bee6CUqAe029xw9LtrSlXAKvUsDYQycVXhHx0+E6TaxSvcfjZ5xskzofp
	 L3QcfMeKA0I8rSRy0J4LVEzwZYEL7usUigDcxEmdjKlPkyB9vRYGbpTIPLxVrXraLs
	 6i7e19kgfMjHw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39d560a1dd4so1540751fa.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:18:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqkXTx4SXQZBa43HxFllb2LOUHCuK1kWsvlU8KI9CayFsjrxfwvY+xXFYsf9gAg7J2RccvDyZ+1+gTg@vger.kernel.org
X-Gm-Message-State: AOJu0YzR3X1seNEcPuy7YtPEExR7AvdG1By9MDEvFzlqoHW5Ox3E8tTQ
	XTMn1QUuS2+f0VfSOkolzqK2Eya6wrrjQ90SXSKavK/tYMM4+N91bQzgYAxmLyoDo2ibDCTD449
	Y8mLhrO+Dsstg6qDGLBlbTr8HOZvIiE/UTS02IGOa5Q==
X-Received: by 2002:a2e:a58f:0:b0:39c:7919:fcf1 with SMTP id
 38308e7fff4ca-39db6d81975mr4644921fa.33.1784103523816; Wed, 15 Jul 2026
 01:18:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 01:18:41 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 01:18:41 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260711210131.236025-3-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711210131.236025-1-marex@nabladev.com> <20260711210131.236025-3-marex@nabladev.com>
Date: Wed, 15 Jul 2026 01:18:41 -0700
X-Gmail-Original-Message-ID: <CAMRc=McWngnxX1TE7jj+4hr25PN6o4rZGW+Jm2CivXtzA53CwA@mail.gmail.com>
X-Gm-Features: AUfX_mwKBsfMiGTO8O5kdCZA1clS20B1ees3zGV3oL0u74_c0uWhHuUReKtAFA8
Message-ID: <CAMRc=McWngnxX1TE7jj+4hr25PN6o4rZGW+Jm2CivXtzA53CwA@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: gpio: pca95xx: Document Kinetic KTS1622
To: Marek Vasut <marex@nabladev.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 11 Jul 2026 22:59:31 +0200, Marek Vasut <marex@nabladev.com> said:
> The Kinetic Technologies KTS1622 is a 16-bit general-purpose I/O
> expander via the I2C bus for microcontrollers when additional I/Os
> are needed while keeping interconnections to the minimum. Datasheet
> comparison suggests that it is compatible with TCAL6416, add the
> compatible string and TCAL6416 as a fallback compatible.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> index 4f955f855e1ab..4631388a7d914 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> @@ -22,6 +22,9 @@ properties:
>        - items:
>            - const: diodes,pi4ioe5v6534q
>            - const: nxp,pcal6534
> +      - items:
> +          - const: kinetic,kts1622
> +          - const: ti,tcal6416
>        - items:
>            - enum:
>                - exar,xra1202
> --
> 2.53.0
>
>

Hi Konstantin!

I applied this patch with b4 and tried to generate the .thanks email. It failed
like so:

$ b4 ty -all
Auto-thankanating commits in gpio/for-next
Found 9 of your commits since 1.week
Calculating patch hashes, may take a moment...
  Located: [PATCH 00/10] arm64: dts: st: Add support for DH
electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and
DHSBC
---
Generating 1 thank-you letters
  Writing: ./marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks
Traceback (most recent call last):
  File "/usr/bin/b4", line 8, in <module>
    sys.exit(cmd())
             ~~~^^
  File "/usr/lib/python3/dist-packages/b4/command.py", line 417, in cmd
    cmdargs.func(cmdargs)
    ~~~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/command.py", line 113, in cmd_ty
    b4.ty.main(cmdargs)
    ~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/ty.py", line 681, in main
    auto_thankanator(cmdargs)
    ~~~~~~~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/ty.py", line 386, in auto_thankanator
    send_messages(applied, wantbranch, cmdargs)
    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/b4/ty.py", line 452, in send_messages
    with open(outfile, 'wb') as fh:
         ~~~~^^^^^^^^^^^^^^^
OSError: [Errno 36] File name too long:
'./marex_nabladev_com_patch_00_10_arm64_dts_st_add_support_for_dh_electronics_stm32mp23xx_stm32mp25xx_dhcos_som_and_breakout_board_and_dhsbc.thanks'

The name is under the 255 byte limit, is this a b4 bug/limitation?

Thanks,
Bart
