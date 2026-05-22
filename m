Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C593B6348
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449314; cv=pass; b=NJHFhFlTvT8+2fIG6K1ZAKg7f7ng5HjMAaWpsWb1Y6NGTt7Y9wQ+/L9hR5wBPGnGZYLRLNX5ELeBugafBOMwlpp4FMxEWmqLjEwB9ws5lphxAuMJLRNWV27HVS3jwVjtyUYvV1vTrv44JBNG8Py2wcbJKO0GA3jVuleL6ytwcJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449314; c=relaxed/simple;
	bh=5j8vE3+rn+gH3FCAT2MjUQthiUdN953EbDZ0iABy9ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZizXc2+nBgZkxQ9KMSk46pjOS+w4yhaNuRA72b2iM6cJkWapy08u5azqRNRVqN/9CdqMuK8qdShU7lnNM20KGyKU71ceOGf6KeARibgfqItFjYJqkuLZI12/D/DCPi1rUL1hjJqKmQYjrtDxDDJPB1aQ+I2Do3AfPZqvTt45wTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ydw5hkY0; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ydw5hkY0"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso66896901fa.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 04:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779449311; cv=none;
        d=google.com; s=arc-20240605;
        b=AxGB1S8kCAgwuRf+FiIyc4Uu53TX09SFySd3weCP4NqGrpMXiaUcwUa327TN+OULZW
         k4tTkmjtkF6te4UwjkjZ/E1RrRpEE7Fu17gTM9mmbdzJ5jhcuMTL54fAebdCfXmuXILl
         YxkGgg5UGTgVdYVPOf5sHqSxZkMxXTfGjS+IJcRLHAeYIGHW65mNVqf6uhq4ZnUWpN/S
         HQBKnPuIp7WjRVe2BAqY6nHW9qD1RpFMIKCHzU2ok482Uesl3aAOmEze3YlXM7lI8LWO
         48lQw4fh7NNVWC8yIvVW3jE9GReMWy5Um+Af2MVBN+8dgKzZYZdHcT0/ddwTvB1AU58G
         I6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fa7dC+O8YGHKdhROB6LlQr8p2/+2vxZ+5YIvHDJ13XM=;
        fh=wS5Up9o0I1AfRWP5Wnscom55X+6Y88e8SFn2ZGMYc34=;
        b=lr0F9P8A/CPN16VKiQJKpnRj4wwo7fdf+bQUzKYN36zStEdAKMz3b9j2z7wGeTQ0zZ
         0Rsw6xNBqsJE5vMzRL+AGtjw/FU79O1GJ6r+N/GBT54SBt7CZrmyoK0ObJ1EbaGZJzVO
         hCQKgUFxSA0UZrwsI8YLaXmHCAZgGMvs2JU+i9Blr98ChrvbtZZZSKMOWpQRA1H5jsoR
         gBiGambm5pHSPT1GiEih9WIrI83kd85MjES0FMM1pF0+chmtuvB7iAOdmsiDUf0y2UDV
         eQ4GximPG9FOQCD1mfzPHhog1EIDwvUv6TpXCenUefHRI886t2J6kydIGYF3VxfuS58v
         VoaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779449311; x=1780054111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fa7dC+O8YGHKdhROB6LlQr8p2/+2vxZ+5YIvHDJ13XM=;
        b=Ydw5hkY0BDeQGSgwdGviD0qHKDhwfMOQCKhTy35C4Qgaab9qlKeygh9tv0MEY1QTdo
         MLmJj2JtRtDNeZDfeaQCjcMCZg023ddHDgPfOKWjNk2BLI+TF5NaZduFjGFClQB5uy3l
         8mVyC2SGxqZOSjvcT26ZuPx0fJHeU85Fbeu4k9UrWcmiCJFjJ3XUUvk/CEXD1WrgA3v4
         GZEcrwKue1JfWiAFMg+cdlp0NOeAVZoPeTQm7M8GIKRIl+UL0AJa3Yt6w9tSeeAX8ctQ
         XIHBlYqk4N0wKbiCp11UpdfilxC0T/Mtw7351AgkOQoi00pO/17cwPV6wo6Mpatk+fO7
         05Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449311; x=1780054111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fa7dC+O8YGHKdhROB6LlQr8p2/+2vxZ+5YIvHDJ13XM=;
        b=qWNoMtXIgAegvz8i+uNfczdHF1OkLI0KQJcuWvWTVSMv6pCoJYdiXE6015ijD0/RB5
         zyFldCv0Gt0XKlo8/VErdlD0BX9olsBMa2iT9udoeSto5pQlumcCSgqPdfR5ad4iwnI5
         JhGa8BsRN3DgEmuyIEoiiEpHDB2DelE7QeKzIPAw0Y4f+m3gvOtLlOMQ4/xM6YGndWuw
         0v1PjddOqbiQkRLPOHQG1khgYFK6E/UyNSksrI7GzM+lqP1v/2pf1EyKKo5nbidAWSwn
         ahs64oL+b9tduf8U2XXNwuROvEsgZ1YsdCGV0jagxB+j0aQ5NbleUqolFMmgWMunAXhF
         fIww==
X-Gm-Message-State: AOJu0YwjFRzSGyZWGjGee9zrZjJXjGcSh94sShCz3qu+i7a8fAeKj1WM
	FdgK2BD1DX9/yHPkiUIUoKGlYWjsKrsSTcr6J0BWcVz0l8eo1RCFyhD+V0zLCNc+6wjOyODGLTC
	WdZhEgin5yTOpJlpYXk9AyJCKfvvbELUxgw==
X-Gm-Gg: Acq92OGfkEjjAe+lYLGw0SwoTmy8OjYTZsW21SOS/9HmI7xcYjlcNZz6/FRZnTSabYh
	EXuozgwaZx+XXlr3btdaNLOmJruHVP/Ny1pmkjAvbmcfke1ioK0TDyqPYTyHaqQ4I51DGK/A5ft
	KVzLolgWgVSs0+kZSvlrrG/EmbtmMZWf5ndqsFx8WOTMyeF4uYAxZ8QSytK30AaN+OScGRdUPLw
	vJGBg/iMtzxqa6KOomlXCQ1hXJmGLND5EMOfrAZLX5mKde7fDdqwEtat4KIzmBmaezVtPcCPKlF
	1ig9xCHhoU/3bq7ejN2UHZ6kZD0UEOpjbr1jJGyWi4cLXp+wPPCvqxa3qZHc/Be1R8ITUNJW
X-Received: by 2002:a2e:a9ab:0:b0:389:fa42:b266 with SMTP id
 38308e7fff4ca-395d891aebamr11019001fa.11.1779449310900; Fri, 22 May 2026
 04:28:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <20260522101653.2565125-15-paulk@sys-base.io>
In-Reply-To: <20260522101653.2565125-15-paulk@sys-base.io>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 22 May 2026 08:28:18 -0300
X-Gm-Features: AVHnY4LV1-i2NLucbS2YgdzZXBX26-Ma3QP1bn3Gx38hCGfG5dS4UR0F3rTTEKQ
Message-ID: <CAOMZO5B+vaoXM1F+avtcdo=_tpJ4ZZfCcNCqaUo=KiQUw49caA@mail.gmail.com>
Subject: Re: [PATCH 14/14] arm64: dts: imx8mp: add VC8000E encoder node
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Marco Felsch <m.felsch@pengutronix.de>, Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thanks for working on this.

On Fri, May 22, 2026 at 7:49=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> From: Marco Felsch <m.felsch@pengutronix.de>
>
> Add support for the Versilicon VC8000E multi-codec stateless encoder.

Typo: Verisilicon

> The IP integrated on the i.MX8MP supports H.264 and H.265 encoding.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

You need to add your Signed-off-by tag as well.

> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index a3de6604e29f..4e63c2b16c1a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2290,6 +2290,17 @@ vpu_g2: video-codec@38310000 {
>                         power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK=
_PD_G2>;
>                 };
>
> +               vpu_vc8000e: video-codec@38320000 {
> +                       compatible =3D "nxp,imx8mp-vpu-vc8000e";

This compatible must be documented in a dt-bindings yaml file.
