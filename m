Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4FA390C84
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562756; cv=pass; b=s0i4EAO8A1AyWmsdN2arJMt25zEOu1Tp6On6q2wShQxXtT41IMs5YLS4DAhyUOVdpcUwHdK9JQmPvjTq5hgvJW4wlfS6D9TicwFoz5AvCWpyTLgvENvmua7ujldIrILsIPVB5edsXtBucuJKpC0ckbswI9Cb207z+Rw2pwsT0Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562756; c=relaxed/simple;
	bh=v5IYRNTcyEgPVXJbctVI1+FKOl9ffUjo1dQQ7pPXCXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4/loTxg7EyR1R2mqGMuq12pZDZFDJDMCgYY2H0POCSXJmzubr/UMUkz+koBsPQdu6KcooXQ4qZ99n3EP3dSgM6W/K8QeAIshf53YR5AUnHMYFBxKtpN5Dyw/uAJfcb7vEK9yJBQuC/zXGio5Mt++QE0Z6id8Y9A/7Y/TyTpJ3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ItO3F8U1; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ItO3F8U1"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66d0743503aso1063741d50.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787562752; cv=none;
        d=google.com; s=arc-20260327;
        b=FkpfWsN3xGPdXEDYJ2gszV0f1B+uhHLP4y4t15I1XEGCzpfsSeCPz9FjKRnvF2Kzs2
         l4YVpObwOlsebe9p5pZi4rKzsVhgA5AEy58rB4wAhkDrejWwQV53CAzcVJspJy5ioTbR
         uO7BQZfFytbRIGdnSSbV+8EHIgU1POYwZ2+UIv3i+HdpnfCf3VH87aIZiExR+AWzHngS
         hIHIq43HuaLKI23kFxx7c4YjqXbx2GOhbZ3BAaaf5N3TTqt7XjzF/NTROEGoeNdXT+GY
         dwSkHyKOLewuRDWkRD4i0oCd/mzf4mVynXdJ0X+F3fSiTU2Xa8d5b+qqyax0weyNNowp
         586Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G1OdxYhnb+EQjTpBwwTQh9KiNQcD1RyORVvHNNNy/xE=;
        fh=ssC7yEonysNtgj67rMTmObBs2iHyedPuyTEAiGtrGWs=;
        b=mqisdYpCHU6paR7Hx7Uchr7sG6nUuAzG2I0Lku105ikUMMZnToAd9e3Il8y0rQrEM3
         X48+GpCTZrTkLN2RsoNAd6ozYJJ3Uk7nWGZ4l21BE5B2v6c5xQ8TQMwrhstsar7Bf9jK
         qNQ9PntKQxAprw8x1vAuQ+J654jfaRTKvNP6yWRgktTkkVhcL34gC5mhwJqbPmuO7zKS
         Xi1TGmyMNa3lTYPnpnqIxInc8T6U0qQdhwrO3IsC4h9e9xVXEFW2X7MYhg5JjlMf9s2y
         1qm8kO2wNN3MhAQU2NydbuHkywgnSi5mEA9i0ynOxsk1YcR8uMGIgnsAb2lUtyG8Su8Q
         Msww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787562752; x=1788167552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1OdxYhnb+EQjTpBwwTQh9KiNQcD1RyORVvHNNNy/xE=;
        b=ItO3F8U1cSvjOT2okUFCDq8FFFr/B7APQCx0OIv575BA6y+864Schc4pjiLFSzBlIP
         oNpk5CXIGkDLfWON16XsKEWyMi5F8xOZS0ndg6m0RZ2/1GHhm7dADxOXv22o2zYVewOk
         nI4B0PMhfMV7MFvrK/eg+IlL+pJHY9lZIzvLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562752; x=1788167552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1OdxYhnb+EQjTpBwwTQh9KiNQcD1RyORVvHNNNy/xE=;
        b=eHQsjp04Gtfs8LEYDpU+Ykh7FUbzWBQyPWuuMnyLzVp+Rf5mazt+UfCBWecCLvBDXF
         wYHcY86jhGg+Lk/yydF/i0NfLZbhiMFt7wrv08joSVoKGUQkrr6p88Yg5ddmssq56tWm
         B5lM/oJngG5MIyWQaqOUghFZhc+IKTBH9icRC+2EBFXMGH4J7mWQK86/Twf751rkeazM
         1hNAKia/TLkXAbbvkEvENpNnCGMNyOiai08bY28DXRxaBY36cGoRZEsWG2wZLUmTW+wW
         Ttjz5F45sM5lHGgyqeQDyM6BAYVHCncF72lEFUGUSVU1CaNL5coXobJXRwA1byRKEzBf
         /KFQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBngoM9ecMbi6Uib5a8mmf/on1tZXZvF824ncEuOc2ARkZejfDmhJN0yrwL8PLb/oSFXUNd3U1c+4I@vger.kernel.org
X-Gm-Message-State: AFuF++l8dirwF+mnpCCo6ugyq7vMKdlzd21m8MkLyYHEoNn14YuXqksW
	9rCt9fyBA/z7JvMFLpUJ7ydzIS71F0M642pnlcdVDpkxwpdFC/LOJ3aAwzsa2M9ggXn7Oh0r6N0
	SQw8mHYKNq2cOuZrjBIB64+is6DZ3yIDQRhRYI/IR
X-Gm-Gg: AR+sD13//KT0s+9aWf22s4FGs6RyM1I/BthVjD9/k60A9J65uHidQPGsTzbL91BMpZ5
	Lx9RMz5+Y0axRup3/0Xm3GdtMyJqC6hPlbJo2X3pXXuXecwyJbpu5J9K29W1D1FXuUGXhjjMyhV
	OmJkk+cMj+p/2kfOzw07eJ8PnytfSSw+uyn09K/Ez/affvPn579UJB83r4pyhTjMwcME6FF/Uvb
	K28KEbb5HophDQQPUDaoGR+p8+V0VcdErX4tp/tRNze52R9xQDCvXc6NxzblHhH6trvXVnUZzmE
	fRpo+DZzGhKpZPtPf08Zgob7j3m0OlyK3Lwdz5WsfNO1Ny5ORpd0GSXeELLxb/n/wEp8TlHpmvE
	=
X-Received: by 2002:a53:cc8d:0:b0:667:a285:7624 with SMTP id
 956f58d0204a3-66ce4b02a7cmr6592191d50.35.1787562752511; Mon, 24 Aug 2026
 02:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824090409.203230-1-justin.yeh@mediatek.com>
In-Reply-To: <20260824090409.203230-1-justin.yeh@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Aug 2026 17:12:21 +0800
X-Gm-Features: AcwNN1UaUKwCCupiOXtWdw-rOGn8WYmR4nT24X-TqWmsTUf3H_iO0AMalDMrH3U
Message-ID: <CAGXv+5ERR61sdVK6VYugeCnOaEHt8XBUZZAfj_GXvAJg0hiWTQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Enlarge SCP core0
 memory region
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fei Shao <fshao@chromium.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 5:04=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com=
> wrote:
>
> The SCP firmware in linux-firmware for this platform
> (mediatek/mt8188/scp_c0.img) supports MDP, which the mdp3-rdma node
> drives through scp_c0. On top of the segments it loads, the firmware
> allocates a 1 MiB DMA region at 0x50800000 at run time. That lies
> outside the 8 MiB reserved for SCP core0, so Linux is free to allocate
> over memory the firmware uses.
>
> Enlarge the region to 9 MiB. apu_mem starts at 0x55000000, so no other
> reserved region has to move.
>
> Fixes: e36be19823f0 ("arm64: dts: mediatek: mt8188-geralt: Enable first S=
CP core")
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> index f382f90c48f5..35f60b5bba6f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -166,7 +166,7 @@ reserved_memory: reserved-memory {
>
>                 scp_mem_reserved: memory@50000000 {
>                         compatible =3D "shared-dma-pool";
> -                       reg =3D <0 0x50000000 0 0x800000>;
> +                       reg =3D <0 0x50000000 0 0x900000>;
>                         no-map;
>                 };
>
> --
> 2.45.2
>
