Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794393922;
	b=q0KFxvNK7+JWXq/xx6qt8xzXxNzMPe2V0VRFmY/qt6SpNk6UTctO1rKKEAFffVB0MP+t
	 IGUaUQtHfJcbWr5fwUHEFV3Jwr0MNraM5Zy6mvAbZrn0FNWO5w/D7tDENaR3OZukRlHo6
	 l/NF01mwNjwtU2tznvPv8tl4NrEmP8Q3+DPBVFszV/mXsqCV47OEwoR9HsAJea4kNn15N
	 B6PBz7sLAru/Mo9QVahLvjEkrTQG1UYDg1YvSfgH11D2KmFuFJPIXSiDvi0p7a4sb3YJz
	 s31R2x+AWzICxfteVBjgCkBjXXYDZMF4CujcnWIhDxi4nGQXnBgF6G91d49D+N2wxjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VcKJabFzTVbjKEa9TZqeK9yN9ffYcu/rnFFvEOpyqps=;
	b=dwbHQmCqCQbm2WiVbvC1yfZh9o2oMvFZGJCH/b9uzOKBRf3+Gt9PtfLnPUKUL5wC4dYL
	 +aWgg+zYyp7RvhP6rfyPfv8KTk/6OrUVLdYhR6awtd9ihHBN+sOYIL25U7jGSk744l/Wk
	 mii81oXzy+voE4cep4nG3GdS4ysKyZ+ZkN2bfMJAKkzurUxNkfFVQxFEPXnfeUPzEClM/
	 hLHlQoPQXfkUr9rQjvuWrxeyjEAOqK+wkjUcvL/98ax6UhtWNusbTAO+JD6PNtTr3yOmc
	 fWNLR135gk9YwRDOxdXIhUJNYlNnHr/2WI8ojug/rB98uiFBTJuQQNkt0KTJ0iLBV7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=VlvEedBE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7C1606A88C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB7C1606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=VlvEedBE
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50604721c8so185277266b.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 02:45:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794393920; cv=none;
        d=google.com; s=arc-20260327;
        b=CuaZRK23EGTPECxsviLeRZBqBPFP54jMiNsMzP6YsuQNfKj0WzDxDAmqN9CPLX8yyi
         LdCXlFSIyjhGeGyNrQIdSIRYs0+cmOEQ1GfrqejJ87+mdEa5MRaTHBJ8qzmjrsGUNNQu
         9gL4ldOvuOGX0gaF7/hKYIHU/xqjqqHn/WcDVweKOi7r7kD7vpZ5G27mGupHMktUuUHl
         spbVRZ74V1G29IVfqR8Mp5rxEsQaHIUUk4DyDDGfbKD/D2G8rl7Pqw7zxWkINpWBxRkI
         aHtpw9CM+W06BaVwqtvqbnxZPiGdeqjCHT8hY61q+JUyq1ogi4l57sllXBPucPMgtqVA
         E2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VcKJabFzTVbjKEa9TZqeK9yN9ffYcu/rnFFvEOpyqps=;
        fh=v3+t8BGiBNsLIFkjvFhpoXCHzSGLQYzhSgrA6IxNYeE=;
        b=rdG0cZmtKhtbGFxQKz+ISeP39DHqoQFcdQKrTCSMXEIqCdq0jUNvCdV1FGYMONZr7k
         VolIEOrCRIUEjrEeJz7p9BlJ6bJJNuwI/4NGic2BQ8MCbGw3y8BuLPmkm3wnvwwmc0XD
         7jbbOEgm27HmkPzmF6rLxZW0LZCT/rWBc97rYCF3PzxU7BBQtGyEEJuzUKfSQ5ZgfPPj
         UjbNnbRa1mwRoo7lgghma8BBbBPBUXu5XUxBvPCHOW0C0Pu0qHDvaxZ4HSmIknTH9ScL
         HP7UDQ14Cvp1GK5Qf3gZl+oI2LcRIk4J82aft9oID/vyvSPdR6le6w2vIEId6liil+J3
         79Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794393920; x=1794998720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VcKJabFzTVbjKEa9TZqeK9yN9ffYcu/rnFFvEOpyqps=;
        b=VlvEedBEndSP0TfzLQwadr9DYG4XV2qpa1/adLm5CgAQfpPpS1gWKgZg4ciQBhusPi
         Y4lETkhrOsqZOnRxRCyugHaATdsjUGIusqJXuMvJGIBe8CvWzfxPPRbsMnDjqGWCt2hX
         CCesXOaVjudJ8ToiFFNhbueCH1F1JS2R5RbQaxoNorpy5L8xmcp+dCuy1e3XNIeE/YJ0
         4e9CqD6yK5EFBjbSc8N5VpMD++naFoVFSuGDz8Yw1p3w0aDVEhepNyMC37nR4RiYBN+o
         bZhYsMQCab8Z6x/05PMnQLXRthWIee4kLWUv+9vVtMscGpweM4Vwj3O+8IVn/pd0zoWB
         vVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393920; x=1794998720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcKJabFzTVbjKEa9TZqeK9yN9ffYcu/rnFFvEOpyqps=;
        b=ORnUMnCm6vD3kMGdZDTMJaV3pd235BZi9W2Q8M0Aw3OMsdxM84oImtwae7P2WT+gYl
         T6QX3TlLJzySJplFm8ZqsMJtTAfPOQWGFV7JJ1IjGvK24oe+iBsaRZKrwxkdcPYb0fms
         Il9/0SxkkYa47JlsB9x06rkRsOR9fU9ysWi1WWzElDPJhvICR/VdXV6WMJ5rX3p6yzf1
         IVsZJ3oM5os0AnlMX25rSoQibdu4JVBsvp9Ajya4gTqIhxPukgHJR/fEsDEnB0Tuwxt8
         j8aojTZjxCcHx+02wbvmMwu6tECUZvB+MYabAHGW4mqSB6bnJSisbaRRPibM6uMBeGgT
         CfQQ==
X-Forwarded-Encrypted: i=1; AL+hErEttekZsroxWLGHKiGpeIdiTkfB3l5GXxwZjmNJeauM2TRopA1fF+MW/6SelA67IhafVNKjPLYFEvmK@vger.kernel.org
X-Gm-Message-State: APuU4Z/QLjL6RcUGar1/Pe8oTgvKhHkIG2eoe+4IaaOCk4eS6vPdlcKI
	cJu6AQSa6+xrvO9zX9fIA3sUbXd3HX/4lOOtCBuqCKAkkOnZUnMmszNhY0D8mBPfm7eVZijf0p2
	NVa4q8oR61TMrNdYMbFa2fZrTUlGTAGe/ojiIPyNMUA==
X-Gm-Gg: AYBFou0YenB8/TWR+yjARc69S1Vd61dFk3P5eNBWVhmce+OxoEf66soyJTLe7RyWwBK
	3f11DU22UR3OgfmEAuFFQ1TeV/tbPifdfkbTYnHyE04pPvnFb2RB0Zs8NBrB2aeRqw9bv6b9Zkm
	ajwqvtWPLQiWtG9K8eq9Waan3hSet5nlDEApruDVZhRfO654gAUe0SxL/CW0Dy82Zkk/2zGGLIT
	xnIrbSE41UcsYMsqhxNdHVWHSTnnhzVQNsjbEt3H3+Y88hImaC7la5SZopJMLq6GRxuOdOGaVlm
	PKMnXjjsPTcd3aKr74ZS32cpMhHNCYg7bGbZI+oH2Mj8oF84sRlq3aIacSvt4z0VUKUYplQI3GC
	K8RmyXVZMkkip6c27h/FSlhYlSP4U7SuSw1gkmvSDqZnnutSyn2S+Hzr9J8AbROW+XbDECg==
X-Received: by 2002:a17:907:7292:b0:c2e:2252:6ddb with SMTP id
 a640c23a62f3a-c5066a84511mr152183666b.10.1794393919375; Wed, 11 Nov 2026
 02:45:19 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net> <dd59d491-82b0-4047-ae98-f8070f6be112@rock-chips.com>
In-Reply-To: <dd59d491-82b0-4047-ae98-f8070f6be112@rock-chips.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Nov 2026 14:45:08 +0400
X-Gm-Features: AclHuK-JFFUWS_xdTW0P5OLa1DScA4kfALrbjXlHmDv-4WjET9Tuop7_ZcygSgc
Message-ID: <CAKTNdwHbxnknob9NdjqWUcGU2fURO5B7V4kTTK+fvEYjNDOLCA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576 EVB1
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chaoyi,

On Wed, Nov 11, 2026 at 1:31=E2=80=AFPM Chaoyi Chen <chaoyi.chen@rock-chips=
.com> wrote:
>
> Hi Alexey,
>
> On 11/7/2026 1:52 AM, Alexey Charkov wrote:
> > RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 CC
> > controller and a fixed-voltage VBUS supply.
> >
> > Describe it in the device tree, including the wiring for both the USB a=
nd
> > the DP side.
> >
> > This makes the data roles follow the Type-C port's negotiation, so the
> > port stops being host only. It also leaves the VBUS regulator to be
> > managed by TCPM instead of being hardwired via the tangentially related
> > phy-supply on a USB controller. DP lanes are also muxed dynamically by
> > the USBDP PHY based on the Type-C port's negotiation, so the hacky fixe=
d
> > lane muxing also goes away.
> >
>
> Have you tested this? As far as I know, dw-dp driver does not support
> Type-C HPD yet.

I did - it works fine for me under Linux with Sebastian's patches. My
primary motivation, however, was U-Boot, where the current phy-supply
hack breaks USB data role switching, due to VBUS being forced
always-on. With this patch it works, and now the DT actually describes
the hardware, as it is supposed to.

Best regards,
Alexey
