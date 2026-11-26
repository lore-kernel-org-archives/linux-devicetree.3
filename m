Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700010;
	b=5V7L4v7keRiqqbBYo2DGj4fNv4VjSGRUH3AkuaPkTz+kbEwzMXVWFs7TRy8SxOi8JHxt
	 OYIoQw7RvqpPd26tdjyGZdZXL5L35kTsR1eH8AxM+SpOvV9HcymI2PV9pCdTclCpu5/XB
	 ZTB6ygRHMRa5TVf4+fqW+QW2bxlVAzuqqwr6rEjt09Y9UCrgl9Gzhl6aPzwtkUv0wAwiY
	 TriA1aBT//V5aYXH1kVaVpqAE4+FG+cuKDmeT4FgHClSseM/pH6FobgF7DoHcbLv+Pz25
	 uvdJ3MWSkt+8mFXK90omHDBUjAWjHJVjYgBTzsqDGrIDmYF31tZUTmvUVnjBUvoio6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700010;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HcwFZv9BM0w57FN62L5UyDAXYgvPAV25zeOmEc/ACiU=;
	b=D4A9MFT2d3PM+9t1yWxibPghivAK52J0tXTANu9Wyw2u1Y+yGeaWXXv5dZKEEnQXZDsj
	 Lpdcyi7Sn1qlLKa7PjDsetPy2UAAx5ZPsLFWAWpPPt4/UL01God+V3JZAqqdeML8ZsXpW
	 b/IJg/2dhnI4SUV/OmPYer4UHDuNwCYwdEq37xDqUMCVUkyRbMD6foyIVhIawllu/WKcG
	 6W8wjfYRD8J4pWFBoRm/SPwnQE2fRstF2P+zI/AAArKe3MBnEo9/lGN4Be6ewR8NwJ+hz
	 FZHvtl3QJCAHztj3QMuvCFiNB7wesxyvOvYZ28EmjbYKKWa/4hZU4Zt5Ji61hshEbpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A17606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A17606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99e1408dc59so3045111241.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700009; x=1796304809;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcwFZv9BM0w57FN62L5UyDAXYgvPAV25zeOmEc/ACiU=;
        b=LR8JCq43R+cAkLJq1zohArh6w8f9cXF+TFDbG51nYjUtsoB8Cv6yKQnhwLsYoBQFfX
         xF+ut7tSTx9eekyFEBb1wSvepWHS/XCxBL5cqo5ojWp6fQ0HOXqTntACB4/Kls2W116F
         lO1CSryZoYAVZbXrN8lgWbsLgZNYKE1SsqHZL25MkGjQV2UDZ1elATUlwaxepztsa/Cc
         adhPRrhM/Y7LOe5zy662tcwAMQKlMKuAea1W9UO58xU10uQPIriwf+HjNiQfu44M/f1q
         PHMoEdn1U5pwUcYDNlru4wQqkx4SJolyXsyvgrENqrzL+Y3NvIFxrsD0o7y69O28tSYH
         wL3g==
X-Forwarded-Encrypted: i=1; AL+hErHup0/W5GZcBVcaPdAcZIzA5Pk1AljbqPPmpdGSAcSNJ2ezg8DoLX7wGH4k01kqp3tPCe6liWzkPAQ7@vger.kernel.org
X-Gm-Message-State: APuU4Z8d8fE3Pu1z+6OgIdaGFdNI7LT9cBX1RPGhUjaveUOQdsjYOZuU
	Gl7vks5I6zaiYUNNsTFbyW/NRt808Brp3s7yvShlWI3i/6snandBtjF4Trwki/HV
X-Gm-Gg: AZFdTZd3RltQ9uFVjT2jsptUioqxV/DseKNzF14gUQEC1Iz93SzSwTsd6RlNt/MSGLi
	Rhsn5CmTLlEuG8dY39dnHg8rl7SmOhBXDEFsGUtqkTk/gMxPDhslpnOoAMbJZTjLKZzmcD+c0/N
	niK+nRkcAErIuiPFtDdMVWDPFAYjMMLKHJwyl6ESaRyqVqwmF5cvSnTSP7wk6IqN/g5raXp7D9P
	awtTlmBVihkIcDhVStnvhjxLTk4xmwrOMsBTzsmKq3LRzHsjoACdEG24jmNog0Y0V8XeBs1i4WY
	P+3clP27WrMQnYd3rHhV1s9z3SEBJZ92SbsMqNcOsP6kjeAw6N7mv5aYggLe/0B4UZoEQLy7EjK
	nR735Z1MRU0C9cFBqXabCi1UnpQSQLqtVQPKj4zqFdgOc533lkNR/j4c8nIZfwtXhX5RkJbxCVG
	kyfSzSoT6aWEvL+37UV+ZTSO91X59XSVO7XNpnHLccmMTBHPghEEPZBxdefehxe+fyJOf9EkXfG
	nrqAaEte9xNzv7llQA3gdrxo7ifdCpMdcB6DH/YA0yS71v5LE8Bc42Rzb3QRcnLji28P52nCdGM
	qUYBL/bvbruXmndx/1yg1m5+pAtWEeqTwoee5pe0GDpv2V+nfKUdBPLooWhEyq0Pl7Y=
X-Received: by 2002:a05:6102:a53:b0:7c1:ce61:19b3 with SMTP id ada2fe7eead31-7d73967e59dmr12309565137.33.1795700009140;
        Thu, 26 Nov 2026 05:33:29 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6dec7cb5sm22232886241.2.2026.11.26.05.33.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:33:28 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7d2c8141dc6so3720770137.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:33:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEMnaEM6/Km7hjOB2FtStwyghRhjuf4ZvTpqiNsBLJ8Lqom8CoKkFSBGIvVLgucfCEPI8N1Vo1qAOPJ@vger.kernel.org
X-Received: by 2002:a05:6102:3f94:b0:7cc:2674:b78c with SMTP id
 ada2fe7eead31-7d739391bf3mr11259967137.7.1795700008033; Thu, 26 Nov 2026
 05:33:28 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se> <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 14:33:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpZfsaJOcTEBCugyDgKDXNRje68n59OrGFx-0hJXG+4Q@mail.gmail.com>
X-Gm-Features: Aa3M54q5_iVD09yTxiCPbutEOoqFTTuL8Qbh52NAGvGv6cSg6_A-6RxSK9Zhqcw
Message-ID: <CAMuHMdWpZfsaJOcTEBCugyDgKDXNRje68n59OrGFx-0hJXG+4Q@mail.gmail.com>
Subject: Re: [PATCH net-next v8 3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Sergey Shtylyov <sergei.shtylyov@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, 10 Nov 2026 at 09:10, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The gPTP module is shared between the RAVB and RTSN Ethernet devices on
> the SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -606,6 +606,15 @@ mfis: system-controller@e6260000 {
>                         status =3D "disabled";
>                 };
>
> +               gptp: ptp@e6449000 {
> +                       compatible =3D "renesas,r8a779g0-gptp", "renesas,=
rcar-gen4-gptp";
> +                       reg =3D <0 0xe6449000 0 0x500>;

Can you please remind me again where I can find this base address in
the documentation?
The size looks too small to me, though, as there are registers at offsets
0x500 - 0x788.

> +                       clocks =3D <&cpg CPG_MOD 2723>;
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 2723>;
> +                       status =3D "disabled";
> +               };
> +
>                 tsn0: ethernet@e6460000 {
>                         compatible =3D "renesas,r8a779g0-ethertsn", "rene=
sas,rcar-gen4-ethertsn";
>                         reg =3D <0 0xe6460000 0 0x7000>,

The rest LGTM, the bindings don't descripe the two gPTP interrupts,
so they cannot be added to the DTS yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
