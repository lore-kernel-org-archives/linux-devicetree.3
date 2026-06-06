Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5EC346ACC
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 13:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780753964; cv=pass; b=aJhRD+CBZPXuo/zIZJEYsjP3MVhj6DlofHYgO5ROwo+QTZk3ke0/QbXj/cRi6yMD6b6HZmloPmpI9ouwDpUyPlUVzA7tOWWjfUH5DAnvO76qJqcT1RAOqqb3A7exAxoi/2fu87YLorVeFi5+6cwgILxZAD2L8deGKik4PStYCYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780753964; c=relaxed/simple;
	bh=8CZOIp0iGytiz6Ffz4l5O1e5skqqCt9s6Yl5NU1Ixvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uX21MTohYpPD6YizGyrwqg89rpP8Y4uwHRqe9lKb8bl2gp1HdWXuZxwlrOCOdz8p4SAEA0ukkUd7SFfQiKRnz4qp9jz3CcO0p7qD6z8JSTPPdFz0Wzuq036U2EQmY/N+pskn1OlS7stHKwsAeXlb3WHUb9WwL4FCsXQv6DnBS5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ni4UwVJB; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ni4UwVJB"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6cfb0a137c9so1830922137.1
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 06:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780753962; cv=none;
        d=google.com; s=arc-20240605;
        b=CiwnVHwD7KzioNtB+zHDYhbVfP7/l0J5OfuzCkSfD5DFgPNdmtLe4Tj0zN9AI5fKRJ
         Ws8t9Z5+PDK0d45wY9uVhSz9UvlpYKPLC9AKOKiOWgaVhkNf4308aWCpVgC2TTkJ65mA
         G8iAvnJ4g3djg2lQySpyhekjxNUw95Mw0lHIDCDmI2HUNKPiI8hLdW7K4/XPb/lZSREh
         lLh0rsVv4y58R5duI0ZIvJcz5jFGEyYSM3WkrBVzN6n3B1asJHr7eiAFuDOrl5L0Xrz2
         BUBcWGCMAcX59L32HQB1wBMq8YRLz2XZgy6KRPCRrHBXonbH1weYrUOikhjWFjxYvj0R
         MH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8CZOIp0iGytiz6Ffz4l5O1e5skqqCt9s6Yl5NU1Ixvw=;
        fh=LmXUEn0+WqPqHbQ9zRX3pGNFnPLGkWe1ZA816qX1lgY=;
        b=jZNuG1Uyx3Ho9ZnnA66QnMBIaugOHJv3za2SKczFE4I0rF2lLS8ztPahB1KCRlqS9c
         ia2BqcSSeFsaE6MvLK3l67verSgOg4cwPxsp7JGS0FBYx1oBdHF9YQF08mW5/tepju7C
         +d0nesGMAwenD1+KX307Y4STNEAP7bWgR8OhFMxvzdBXttkn3Lo4MzzKbAAinMxZk1uI
         eZ4dI2qiCjQEkS8yS41+23c7qp6GqRwYqV5bGyy8ArYUtNlNI35Rx3UAig2qb6KmstrU
         aOWTf4XePcvLUkFpDWZq+banfcqWF171J1ywrYdWeykw6066Jz9RBfsKWAvhzmMpRS6s
         zWlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780753962; x=1781358762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CZOIp0iGytiz6Ffz4l5O1e5skqqCt9s6Yl5NU1Ixvw=;
        b=Ni4UwVJBbP1YVfw4ZNAnFqSKQkpJRbqGBydf05LCk8wi1PzbqZat80vU48JQI0GX1H
         zYnfzRaWL2+j8gS+O++K4vmFYoFU1LEh+zXbFzHHWVqkknkGd4U6OfS6h2uxd019GQK0
         LR6OqB+WdHFmCHlGUPz5LT1rPObN9AyTfuxOPxocRQ3jmB4qpfMWrEfofa9nYLITf//+
         jzl9peJtdwhykkWYoZCId3WoUtsKhZv2B0NFVZH5Qcb6UWxb4l31VEUQRwEZbAMtgs7S
         tTAqZ5ralzR0yChIIbHkN5iOhT5gwdn5KZnS6I8SVawgGunS3EfqXYk5Mae5I/PO4JXI
         zKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780753962; x=1781358762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8CZOIp0iGytiz6Ffz4l5O1e5skqqCt9s6Yl5NU1Ixvw=;
        b=IyINn2nr0pQu2bqNxMfsedfjz55Dp2Kv+OTw8TT+6pp4phNcBIS633gjTdoKN1zkXm
         VQcPMtQ8E5u3wst7yUiVaHCChidJWUPAEIN68sFCdLoJ5BuI/aSJtQ97kw0m+w7cJqai
         LiMU5Agq6/oSMcSraGEGAfejMe0mAtH1uQ0s0vDPn8FzGE/8BIfIjLJKBNPPYlTAuhsq
         QSg8AgYsJucS9+SHCkuD979ScAYlKzUgZwxHtH0MiwBmlUD10+DEn5o9Pn6QR+v5z2fh
         cX+xXOOBE8VvjgsEP99f0EeVArs6WxNROF6JsHykJgickxhdxUrqL4IvsBXPFCi2Cxaf
         uXTg==
X-Forwarded-Encrypted: i=1; AFNElJ+AMcrqx/HtNJcZ1Ilp2z3AI3hujniDH4vbEgugbyVHdsLo40HRDiyhjAXOelcEvGgFOZ59kM2WMoaq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8p7uVB8TyUt4GdLuwiUVpQY4c1RLVcM3JUdgmYdTAE9CkP/UY
	feuXg03EhF3W/AveY/N8v1lbc0LjcwSP/cy8ZWSBD/smHqhsNebGasdv8EyKDwndkfb6N3WoJD3
	Dcdw9GlvA+EU2K645R/XCvlBusdwKyO/Zd0VSlFU=
X-Gm-Gg: Acq92OGawjy0hEf7xFDYJm+xkJNedn6xhsdlm3LVGhCP1k173uXL6K3+NM+va6xXOyZ
	TMQJiXJIMzAKQHu8JRuVUo9RxsPklJ9wRj0w3NTNDX2LrGPtLuVFIU8Hsdl52HZBsMvoJsB7xcS
	vyiYTLF9UTncyRtqBsSwkifSv/jnwFSz6Pir0FPCwGTLcP71mMCiMDB8AkSMIcSQy338gO8qIj8
	ADk82BLFxQnIFp31PX0SdaQ/enq3FyHzNnUyZXVXaSfUKBqM5YwOeVcjQpTsdHZiJuA3zdYaeel
	4WzQYRIXf5RhaqqnozKdZYD3WVT66H0d55evOEr8xiA0P3CuqA==
X-Received: by 2002:a05:6102:c91:b0:6cc:16d2:3100 with SMTP id
 ada2fe7eead31-6fef1098102mr4590673137.13.1780753962030; Sat, 06 Jun 2026
 06:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4> <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
 <178073773007.397244.9871455646149843167.b4-reply@b4> <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
 <178073918523.417326.15121723011916371966.b4-reply@b4> <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
In-Reply-To: <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 6 Jun 2026 21:51:26 +0800
X-Gm-Features: AVVi8Cdt4JdBlUpf2MpnLITXCI-yOov0kLlRKmMeUF7C4TVsX9iBtGHi-7qPpE4
Message-ID: <CAH2e8h7y9PivdMh-h78VSqMf8i2vSR2fvVaO0P1eYBT8qgEdUA@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 9:21=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:
>
> =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:46 +0800=EF=BC=8CPengyu Luo=E5=
=86=99=E9=81=93=EF=BC=9A
> > On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
> > > =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:22 +0800=EF=BC=8CPengyu Luo=
=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > > On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
> > > >
> > > > The magnetic keyboard (USB HID) can't be connected somehow,
> > > > others
> > > > are
> > > > fine, such as the spi touchscreen (not upstream yet), which
> > > > utilizes
> > > > DMA definitely. My config is here https://pastebin.com/SdjuyJYk
> > >
> > > Is this a defconfig?
> > >
> >
> > Yes.
> >
> > > BTW it seems that CONFIG_ASYNC_TX_DMA needs to be selected too for
> > > exhibiting the problem (because there should be "public" GPI DMA
> > > consumers to trigger the stuck/reset).
> > >
> >
> > Is this still necessary? I checked the fedora discussion and your GPI
> > DMA fix. And GPI DMA is only for the QUP-supported peripherals as the
> > binding mentioned, devicetree/bindings/dma/qcom,gpi.yaml
>
> The devicetree without this fix seems to be still incorrect, because
> with the device tree fix even if the GPI DMA driver misbehaves the
> system won't be stuck (although it will iterate all GPI channels and
> then fail to function at all).
>

Back to the start. You said some GPI interfaces aren't available to
HLOS, your mask is 0xb(0b1011), so I use 0x4(0b100) did a quick test,
and spi6 consumed it, no stuck or reset. Could you give me a
unavailable channel?

Best wishes,
Pengyu
