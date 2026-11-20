Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188826;
	b=sMTlF8bOolmeGNce/P0reDNT/DigO1DP3UQYvd9fsXTLq8CulBrfedd7xwxL8U2USKCt
	 kc0HpaVIHLLgF8jObM9ZUhgZLRWV0yGYN5pR84rbCD4corZvmK3KMstGmDFQPp0AyoWt3
	 loynYliEkXrz0jFQaoj+ru83aUjT95le1JeIsuma8tcU56Q+vEXLdyulF2+UeAWT3i7mF
	 AxLkJgo81jv3/b8KDVksJ+BAkKFI+gQzwjivx04COzh7mYU+pmXFvmsP3zufpvSkk8+SJ
	 n3iXHKI/+JUfEwLqNQSyvA+8H7ISjwIJxl81Y7upA/GL2YQtUalqj7X89gAvwsAqikw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188826;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=434YueVY8gg24p2kd1Beb96u7O5ZLWZcLLMbyTb5lWc=;
	b=zPmQTNBDBD/14Y3KU6rkkGIymPAxAaEEA8NUiETyM3NjIBBQL0QQSSG39O0I3C0Sw3EP
	 ncDuNQ1zQmtrVMX8dsAj7TOGvNLc+ddWbNaup+ACszYp/lb7AvFhTis3KKVrIef2GePbp
	 Qo5+kdiUdn5mLDObHBaoRNL6GCEkAVTxUl4fnoeMgbynLnnwcnxJtspoB3tF7tvSf+F1n
	 UrjQ86YuXro8u5dzGQoMKRJsWhp5r4RHc689iOG3gpl/6Fs8K6V2G4+xx/Fp8myI3ERdg
	 GJF+9RLF9YkwhrbSV3nl6/wVsudeylKyzrNClHx8VYvYvCxkJDCtBTMj7dveTcDFUeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STZ1BP2S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0090606A330
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STZ1BP2S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D221F000D8
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188825;
	bh=434YueVY8gg24p2kd1Beb96u7O5ZLWZcLLMbyTb5lWc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=STZ1BP2SMyzosDnAvJxbX421t6QgmQZK0ovWVw9Ny4Yv0xDne9opCaQ7AjAtgnS2T
	 zhegklESSUMbcsR82D9jCuJD4L8++V48jORsohQdjQIaUZ5pFdA+LKRvj0HRFl+gxt
	 Cr5Ci2IKXtcc2ocQ2CPXMtMNqu5gdw1S+TI7Wrx/AFvinQMPqpjbPlo07Q/QXN+YpA
	 zHJE9ysHGtrERPpANbbhm4VIy8aYxFrORlJnBwUNcG5I+06OSIsS8s0b0ilbGfO326
	 NlarOWpdCwvI4ZBRgHhc8SmWLdoWZDmScGpdMLmtw/UudCvq3F9A/SnOaO4Su+35xl
	 LFUqBGJhz50mA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c1b8120565so577118e87.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:33:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGsWNfzCB9p3Y6siZVsaJ1WhW3lINjt74Ye3s35qj9U5P+jTaeAmd5HLA2pf/nU/MEfyywQtCaxPRQH@vger.kernel.org
X-Gm-Message-State: APuU4Z+bdg9Igfle3n+7t+d+AlPwHHGaPkrJpzwbp9dLzRB0X7skStcu
	rbTln63CEs41zjYUfVAS/VPucybaCwhilFAiqoBXzwavfXbJ7W/xScda2/t+MJiyJsT398xChQh
	/lERlZwwSxt7OhoRdoxfTYnDlVhMvHd4=
X-Received: by 2002:a05:6512:6313:b0:5bf:f1fe:6c0e with SMTP id
 2adb3069b0e04-5c1bc802cdemr1038969e87.30.1795188824071; Fri, 20 Nov 2026
 07:33:44 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com> <20261120-orangepi-zero-plus2-fixes-v1-3-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-3-ecd792189f27@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:33:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v64mACLej-LfpDXtO-7iftbWfYw8iviJSa0iLWXh-0S=tQ@mail.gmail.com>
X-Gm-Features: Aa3M54reDbvXEBB_vngwgS0l0u5v3buHZX551eY-WuBDjnylGFM1CXtInuYoQAc
Message-ID: <CAGb2v64mACLej-LfpDXtO-7iftbWfYw8iviJSa0iLWXh-0S=tQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Fix
 USB peripheral mode
To: ipfarher@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:40=E2=80=AFPM Ivan Pfarher via B4 Relay
<devnull+ipfarher.gmail.com@kernel.org> wrote:
>
> From: Ivan Pfarher <ipfarher@gmail.com>
>
> The micro USB port is set to dr_mode =3D "peripheral" because it cannot
> supply VBUS, but EHCI0/OHCI0, which share USB PHY 0 with the MUSB
> controller, are enabled too.
>
> When they register, usb_add_hcd() asks the shared PHY for host mode
> (since commit e671765e521c ("usb: core: Try generic PHY_MODE_USB_HOST
> if usb_phy_roothub_set_mode fails")), and phy-sun4i-usb switches PHY 0
> to host ("Changing dr_mode to 1"). MUSB then stays in a_wait_vrise, the
> UDC stays "not attached", and a gadget never shows up on the host.
>
> The port cannot work as a host on this board anyway, so drop EHCI0 and
> OHCI0.
>
> Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> change applied: g_cdc enumerates on the PC (CDC ECM + ACM), the UDC
> state is "configured" and MUSB is in b_peripheral. Build-tested only
> against current mainline.
>
> The H3 version of the board (sun8i-h3-orangepi-zero-plus2.dts) has the
> same setup from the same commit but is not changed here, as it could
> not be tested.

Just want to point out that the board is actually the same. H3 and H5 are
pin compatible so they just swap out the SoC. This board should have a
shared .dtsi file.

> This problem was investigated, and the patch drafted, in an interactive
> session with an AI coding assistant (Claude by Anthropic). The submitter
> reviewed the change and ran the tests described above.
>
> Fixes: 43aad09c7928 ("ARM: dts: orange-pi-zero-plus2: enable USB OTG port=
")
> Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 8 ----=
----
>  1 file changed, 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.=
dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> index 5697251b9..892723b46 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> @@ -66,10 +66,6 @@
>         status =3D "okay";
>  };
>
> -&ehci0 {
> -       status =3D "okay";
> -};
> -
>  &hdmi {
>         status =3D "okay";
>  };
> @@ -115,10 +111,6 @@
>         status =3D "okay";
>  };
>
> -&ohci0 {
> -       status =3D "okay";
> -};
> -
>  &uart0 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&uart0_pa_pins>;
>
> --
> 2.43.0
>
>
