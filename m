Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793387157;
	b=d2jV7xWek+yL4PPpZk5pxQTpU3ssuzwhBkp6eqmtDZG/Cd/LgYvBKgkdl/N//XQY/qKa
	 YHhmTIF+OuwRtNq9U+x7ch3+hfbrCYosChuYb+uGWPlxaMJtG9kjosPCEAmmpoisFDCZt
	 ozJ9vRQWc0LFh3EAFvds1it78ewr2QMUylO8015CTkq8OhazgK1CLSXeGwgfUTr9CDORq
	 whLI4mlL/5glKjAgCvedJteDKmbdWggbp9/MqEo9FDWX95QpXsOjw7biHUMYlKGX32IvD
	 JnGMQN4NUXbxokVRak3y7aJ4ol4klvaXUIgvR3rytpAgXJdwrXQ6Z1K5jnPK6LiVm8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=J9hrI45jlpVu4PlMmMuPTFeOsIL9X7w+vA3kaWRvlIk=;
	b=o0oOdtYQAEdlw5CHWnKH+kg9mvOKC29l9GePZ/LH3ly1hXlgMKGcyh8XjobrKtlkpWGm
	 MUgJuZ4+lQP++4rfB9jxlh9I6HGUhXFtli60GgncYgfu4HkxeO5ENNfxnKa2ehvdEJWIV
	 gDFwHRIO99O7FRBNHYvXJUYpB8WmWxSaqJb4hI+DPNxDrjHJfIjfEUo86WXCzo6DQZ+D7
	 pOOEXoQ1xW72QsWbzovOJKnby/qtcODn0SO929n8ZHzoNHgEniS9CT8N1XfXx5s5pfM6y
	 SKEP+lsSm6kqel2MnPTh+IP4Q944Crurmtoxw/OCux236veV/wAKFHhe4iH/yGR2f7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=LLofvvb7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6099606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 19:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6099606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=LLofvvb7
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-369f33df08eso2237866eec.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793387156; cv=none;
        d=google.com; s=arc-20260327;
        b=rMq4nSaKt0/JlmirEiqVcrHhPNOCCLhFkOwMZ+rkeiPey1TLzODi/8B4ObaNj959nN
         CSqgRpPjJKxVWXiMPWwUDCdcWEkwtyogvbC6bkz3A0u4CQdjbY7mvNy/NSQORa1x8xcx
         1kQBqQgf2PhulsBi6Z3KT/wC5dK9EWf5zCOLh3fJDtNw3wr/CDMukL58ZFNavKeLbMh3
         0TYos+Zt3y9FmlZbSsxOQDya5Ua5c5ONdJQ/m87z4A4J06TC09PxZJWT9kl/q5NxxX8N
         ElkU1L+x1xASKYBa2hlYDmZJyZ3WskD6/WYNHJHmNrq4veivReXLQCH+2wM7qK7BRqu8
         xldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J9hrI45jlpVu4PlMmMuPTFeOsIL9X7w+vA3kaWRvlIk=;
        fh=EwFmQVO0FURJbbM68DR4A2TIkBCHkPui/vzBRIk+qto=;
        b=s6JCD4CcxKLe5e1jqynnP1DeD6FdAHVXcxc8ucgud/FBVQEEv9UI1EaYAH+oFlDqic
         2tZBjXj5+5wmBUO0vKsqK7ANeoZFXfoGH9AZfO3hruP+STeqL33+FmfDApZgIKZ8tMZt
         04YDi/eOuHdzspfKASp2aSazbO31bGRW6w+83UHada0Ov3uJjBUgO5y9z6bdlh9v72iE
         07T8bqbC63KTrbKIKt65DqBmVsS7d3VuIKjSnmuOXVVKIPpJU5NF+p8tCAXHKvqpx+7l
         o8bxz2K7SvmGSsL4QhpXrvcHeI9vHxoqLIFGJCArRSxbh4OzlC4Ind/Hgge8vcm3M9fW
         BGcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793387156; x=1793991956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9hrI45jlpVu4PlMmMuPTFeOsIL9X7w+vA3kaWRvlIk=;
        b=LLofvvb7RajJaXSnFtcrWvkkzieiyeC7FpzUPkjNpN3+NGdZ0cJSo9RtjkFZsnF6ru
         UANyOEc/Qglo8QMluP1PHrBrCPNKujunsuG5NIxmQ2C8DbvAyDwC9jI+i/KYrAHzEZBB
         RXJhoPo4tI3n81k+JN7Mwfoh0c5IQSUjZ6Rys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793387156; x=1793991956;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9hrI45jlpVu4PlMmMuPTFeOsIL9X7w+vA3kaWRvlIk=;
        b=B4KBH2SVG6CPqCJh2b6ExaOZgLbuNniOr6THTSnDrYZqdMYPeyBmJ2OGsQKwTBLH+2
         kSAjsoE94dLFWiLNYG/XxACk0/YUfXalLNrpe1MpatAlr7767hV5rR5C4h78dDA7i1lw
         qlmtawTe173cfHPyyrPVxcK9X+h4lRHs2riTLSFK/5J/LBd6mivcMLDibu+alYLX+UCV
         3Flevmgx+8rE1yDqlIePBq09pFwB2vty5akyFOIIeEM/NG8fWwP/Un1bsB7iompmy0Oi
         PmkQdf1GQHZgoe5B3bOtG6M6ulCFNLhfAAlJcV786jB3QioN33K2+pz3tMHgULqxrGKv
         Fkww==
X-Gm-Message-State: AFq9FYI5YksSqAhNynN5AehaaDarhJkLR8gBAO9fmb6hSlqu4xs7ETtk
	jMMRwO8zNTd+LXXR2McKr/XKriESvJWC60lhJfc+kzy+WWPS3qCiEb6N6EEhDHSKySz1dE6qx8m
	Dr70Wp314+R59vmxzh90OATiweWUDYcLvnnqCIgFSow==
X-Gm-Gg: AYBFou3bHHmerTxvnhuheT6rseQprVPLFgCXqplbtRiSWsnzgDBW2yi41Yv4mXB+TVl
	1nYEC2/QB9pZ34vtuzhcoK8sCowfqe+jVo1yuIS9WKQL0j4M8on/4KNBV5De4bktWGyPVZAiRfB
	UP8o4e3/p8PVQnFKqzORE0p1YQScq/EEexBVe1JwDLtm4fdwBfM5wUlIEG1sufUbYQJNIa/3RmP
	dhAK8fQY7LZVrNT5izp86zi2QNVLeCXglgujLAbLmmV3Hm1+ic2L13gEKnDOEayGPhxsmKfcxjr
	JrAWUACRQm4GM5DX8UfrhJtLBmtCy7zzaCmTjRZulsMLWA1yWpEbofWzDtj8crb0ZN/jJJ78zO6
	ViGrDdShVVo7AvN75HH+6Aszmtp2eT4GIrxBKdITavtQJc8CS59R+PF73/BuZe32SRzw=
X-Received: by 2002:a05:693c:4154:20b0:35e:f4ac:5f8e with SMTP id
 5a478bee46e88-36a420574admr4840973eec.0.1793387155597; Fri, 30 Oct 2026
 12:05:55 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
 <20261020113717.189082-4-patrick.barsanti@amarulasolutions.com> <10806856.0AQdONaE2F@phil>
In-Reply-To: <10806856.0AQdONaE2F@phil>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 30 Oct 2026 20:05:43 +0100
X-Gm-Features: AclHuK-vdnEzcEGsGvQRBO8g78jL4SBlJMAH8_NBpy5nWJ1J3N8PxOJgd16wrPs
Message-ID: <CAOf5uw=iMTOgoJZHXWRc=XBfTZ4jVc9LDToRSi6RvgknyAjDUw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add Axelera Embedded 111c
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Patrick Barsanti <patrick.barsanti@amarulasolutions.com>, 
	linux-amarula@amarulasolutions.com, dario.binacchi@amarulasolutions.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko

On Fri, Oct 30, 2026 at 7:54=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> Am Dienstag, 20. Oktober 2026, 13:37:17 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Patrick Barsanti:
> > Add minimal device tree for the Axelera Embedded 111c
> > (rk3588-embedded-111c).
> >
> > It offers efficient AI compute for multi-stream computer vision and
> > GenAI applications in a compact design. It features a quad-core
> > Axelera AI Metis AIPU and an RK3588 SoC processor.
> >
> > This basic version of the dts supports:
> > - Console
> > - eMMC
> > - HDMI
> > - 4x USB-A
> > - 2x Gigabit Ethernet
> > - RTC
> > - Enumeration of on-board Axelera Metis AIPU
> >
> > Link: https://axelera.ai/axelera-products/embedded/111c
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
>
> that Signed-off chain is not correct.
>
> As it stands, the first signed-off would indicate Michael as the author.
>

It's a bit complicated; let's say the core was done by us in a
workshop and even I'm
the original author of the first version of this board's support in downstr=
eam.
I think that co-development is more appropriate for me and Dario.
Anyway not being here is not a big deal for me, because I don't spend
time on the series at the end

> If all 3 of you worked on this, this needs Co-developed-by tags, though
> 3 people for one devicetree?
>

:). You are right here

>
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts
> > new file mode 100644
> > index 000000000000..a964b46e5c12
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts
>
> please name this rk3588-axelera-embedded-111c.dts
>
> The name is otherwise way too generic.
>
>
> > +                     vdd_log_s0: dcdc-reg3 {
> > +                             regulator-always-on;
> > +                             regulator-boot-on;
> > +                             regulator-min-microvolt =3D <675000>;
> > +                             regulator-max-microvolt =3D <800000>;
> > +                             regulator-name =3D "vdd_log_s0";
> > +                             regulator-ramp-delay =3D <12500>;
> > +
> > +                             regulator-state-mem {
> > +                                     regulator-off-in-suspend;
> > +                                     regulator-suspend-microvolt =3D <=
750000>;
>
> regulator-suspend-microvolt is deprecated, so should not be used in
> new devicetrees. Same for all other occurences.
>
>
> rest looks ok :-)
>

Michael

>
> Thanks
> Heiko
>
>


--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
