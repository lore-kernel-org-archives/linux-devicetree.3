Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F7037D125
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 09:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887675; cv=pass; b=k8gh1cCs+UsaPrGQSlkrViyTwePTKjfxkz2wspkyZcBl4XaFUm26G5j6Xx/DJ+SHHdrVbLgzik0mDG9KwQWJhTD5n91CSh3uUgnh9f/vMAgSAACbalL80+dEfpSv+2w1Iv79r4Iu211J1I070I2kENXwfePXj3MY3CJdvEhR9y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887675; c=relaxed/simple;
	bh=FC+ugtDkMHT+Cp9OamWwymYjYElZN3bAE2C744G4TbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvYxg2UIqZac6N7acs3CyWyH1OQezJNSz4kEHlsLs3yl+lMeGjxhrq/d//XIBf030gbd3Ie4mHITQdNzPHnLNgugZgOq+vhBywy2Q+Mk6UjpUHqQmPJJib14MQuj4hF2qZ3xJPwLSd01jYd3/z4gMU773Vz11ZgdmO5Mmln87rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UIYuEQ2z; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UIYuEQ2z"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so769625e87.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 02:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777887672; cv=none;
        d=google.com; s=arc-20240605;
        b=D1cQnFG0eMhB6M0wn4ZtQ7Quz+41DaynJHRLyz2BaqYmJfQChxeKFRjlYssq/2pzk2
         ZYnRzuhOZ98rybNMAJvMA1hO88TCsA/mmrWRy2Jvo/Z9r25w6yUf/DeGFiRb6u8oeAFV
         5akUybBdJpK6BODnpTurRK438hjXGWcqJ7CMg4o460ACE8+GwDzgqVBHFmX3hhQPqPum
         fCWSmFuinpbOez2qf4HFjvOI/0od/4EAUgUjU+NslSw1iLLM8m69q6J8nZLs18cgUh+Z
         sXAzJoD5HWAQPQDImleFENVXXgx0MsO3PNA3gZ3CDl6MmVvmcAEfwHj+GNGT1Tk3OCqe
         a+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPRPoG0bnXrUp5Oogbu+VyQo8WCBzCtv1bsnZQz2h4s=;
        fh=9vb0WJi2pTLEdJxx4p6G34MFTY8PL3MQOESWe+Sd1SI=;
        b=gO5k6CArDSLc+JNqAb/J9zLIFKeLIsoSBwx5QKowuEH/r0eoMwNyr6WEauszIRALV9
         JLDVCdRSv0vLhOUR3OguHK5jXG+oWBD44Gt3Tgz62Xm3HBb8/sI6COQbcPjC7Yu/ZyTi
         odgpPOBzzC8JVCx7FOP6kbwdhSqW8npB5SdNNDPwv1cZMK96PaIb9+Q4cp2GnbfY65UE
         Maj0kCizNSmtYjRqzl+nJbr0ekgskr6ExaaP2Dz96DTH3hu5qbbY+DJwK0DbAN/FOyFf
         AKi2uRk9JhYmwudRX8hvDFf7cVpALlq8wpBtO5PcT0eFctQy+PGtmSbCgamME7gpGEum
         KRfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777887672; x=1778492472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPRPoG0bnXrUp5Oogbu+VyQo8WCBzCtv1bsnZQz2h4s=;
        b=UIYuEQ2z9UYfww4hm1RGYMwwdlNeTOo6RpG4QkN95Ac2EQv+iC4Q6p79Aq8QkY7GOT
         +D0LFdDkH01jmJXjf1rSm/BEE1Hnl706wcdOskdMDK4XBhKroJN+0Jxb8tT0dVQlwj0T
         +jHlifIntf72vwMNE4LCRa90XBYxgl2aMP5vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777887672; x=1778492472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPRPoG0bnXrUp5Oogbu+VyQo8WCBzCtv1bsnZQz2h4s=;
        b=nL6Q9hM56hvM4lbOUbvx8vNzBqf3SsvFIwcOwuEfk2leMNBRkU3miBQv0e2cjm6l1z
         Av7oBi43szHnaLYLm5Icqw/nGgjdu/GckKbI6u/oLsjF8AkWPf+KPu8ax13nHUrIBrZZ
         zNo8xgJwu7fRYY4eUeF1RhVToV4yNrkClN90EgE0lBmNvBLh3Wd0ll+vQO4xt37qX3vq
         lFXYgAATRY2mQZ1Tr6pIleT0RlMww7FvYHWOAwtkyr1YcJihxb5LU2pv9O5zieOymkpa
         hz9gjW9NrV5PXS1KYbNHTjM2NhB82IpuUXcje0NRSGlFhy6Cf9BzAKLcF2z+nRH5pPAb
         KPPA==
X-Forwarded-Encrypted: i=1; AFNElJ9vqvxqLKIY5LSapwAYZEKJ68tbagqPZRmIW5dTbTqdOS/+ytHLk1eePeAlGZlMRGRwAqzmdnUt6Y8/@vger.kernel.org
X-Gm-Message-State: AOJu0YyQGifr4YMk6pln6HRDh0jpyPnqgyi2q33VIitPd/WZSDRP3069
	2Jm1fhCz7G6ZKyVUWD3LBR2nGGs14Ot9alc4AyX3PLtNpg+SulH5MpfPMJxLdiZuccirq+WeS1w
	CN6DE8FE4oJvgnY0L8JGOipYxpzKQzQf2Oy1z/WqUi2mY+v1D8uU5pQ==
X-Gm-Gg: AeBDiesvMPN41RGc3js+LL8XpJYqAn0koRAe1KXZovPMb6P619BOtkTCRkaptdUWWmL
	qw3SyrkQp8wxdLeAcGewX4sKYc9OjSj6+H9PIugPvlRKfu95oq9yfqOyoX+XAsiVXyJJxC8ZjCd
	tMYhrxd46glYqHOajyFasqC/FuP9zt1rTXBaSbkrqfvMFeJ8p4GEwl8+mVvk7cbN79FBqmzgWRx
	fEjCOPIY8dKxwUTJ0M6uamJ0/p4OZ086U88y0uQYmi+HaouPB9wRw6CFm7Hj32UHhVNO1Oe7Wja
	+oRXY3c9llTNtP/9rsfTz44URsO9Pben/DnBfrXPCUJe8Sq5
X-Received: by 2002:a05:6512:400f:b0:5a4:304:43c9 with SMTP id
 2adb3069b0e04-5a862fbd635mr2676512e87.14.1777887672100; Mon, 04 May 2026
 02:41:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504072846.2581096-1-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260504072846.2581096-1-zhengxingda@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 May 2026 17:41:01 +0800
X-Gm-Features: AVHnY4L9QFY2fxGccmoY4I5c6vHRXkexmo_pKFyAww1n-29lZtiDvf1w1FXMeYk
Message-ID: <CAGXv+5FvdufzjqBRQnnG3y8FVW9bHL47CVv_=e7GbVv2d3eEuA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: enable touchpad
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 3:28=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:
>
> Despite the Ciri device's touchpad is on the detachable keyboard, the
> I2C HID device seen by Linux is emulated by ChromeOS EC and always
> present regardless of the presence of physical touchpad.

AFAIK it is actually an I2C HID device on the detachable keyboard.
The I2C bus is "tunneled" across the EC-EC connection. And if you
detach the keyboard, the I2C device will stop responding.

We have some downstream trickery to deal with this:

    https://crrev.com/c/6040044
    https://crrev.com/c/6040045

It basically involves registering the I2C device when the keyboard is
attached, and removing it when it is detached. We haven't gotten around
to upstreaming it though. I talked to Krzysztof about this design last
year, and I believe it was at least acceptable from DT point of view.

So this patch is somewhat incorrect, in that the trackpad should be
disabled by default, and its status should be toggled at runtime based
on the detachable keyboard events.

Otherwise if you boot the system without the keyboard, the driver will
probably fail to read the HID descriptor.


ChenYu

> Enable the device in the device tree.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> index 8e423504ec052..8f801454bf84c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -460,6 +460,18 @@ &i2c4 {
>         pinctrl-0 =3D <&i2c4_pins>;
>         clock-frequency =3D <400000>;
>         status =3D "okay";
> +
> +       /* The touchpad HID device is emulated by EC so it's always prese=
nt */
> +       touchpad: touchpad@56 {
> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x56>;
> +               hid-descr-addr =3D <0x0001>;
> +               interrupt-parent =3D <&pio>;
> +               interrupts =3D <148 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&touchpad_int>;
> +               wakeup-source;
> +       };
>  };
>
>  &i2c5 {
> @@ -1131,6 +1143,14 @@ pins-bus {
>                 };
>         };
>
> +       touchpad_int: touchpad-int-pins {
> +               pins-ec-ap-touchpad-int-odl {
> +                       pinmux =3D <PINMUX_GPIO148__FUNC_B_GPIO148>;
> +                       input-enable;
> +                       bias-disable;
> +               };
> +       };
> +
>         uart0_pins: uart0-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO31__FUNC_O_UTXD0>,
> --
> 2.52.0
>
>
