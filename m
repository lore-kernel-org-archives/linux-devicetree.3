Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793817297;
	b=OPUQWvpwQziJwTDrM5RjecOK7/jTfSklDhaQVUhO7awoCz8hnNnYhBYesSM08Mdh3LKr
	 S+bqddVGHFqagYs2veyymSbQpwcI50d4P8MtOR2k2xrssQoVY/snSHlwJVzOUD5vRTdAD
	 9UW/iAD/Qob1vhxCccsy2AM/Wz4OHyUNi77NUj2x4WjJqhfgHNJmb9c881TGmcnOjeQuM
	 dIFN/0qm40JU72EcU/Es+79w/GL+j+UCTYUvYdk88HcRAX2FW3d+iFKIBqWHzRi6SZTZP
	 hIlOZTuOhR0qmehvr+fyDDJy5w5IuGjLKy4eQP/VfAinalXQGK+ZQ4lPSBBzHPOJPuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
	b=hRSSLPwgBD5/auhPgUuPVprtCKWG2MLyP/3xuDJghtzlixGfZpVjAEWYx8NE/0xYUlfD
	 8+ccn29bPvIu19CKiLv92sfO+V0eRiitNuf+6Is6ykFhEwq4YEw4h0sUtxh3UTDboy0+I
	 k/UpMNJYOtbIfwe+ZwLKOyYX8qEqcFXwRwmAq/13JxYpV+AH389ODC0VGkLsCLNplIfQv
	 nNLIDfE0b/ePXKhuHPbKi8FNu9/zX5sFPoBurGgJqK9v/WjzZFxGqIbhreL4al7+8FHkA
	 z+ypwcaoXcPgk2gVT8Nh/WpzKrK/aQ8mEHKc1nAVc0mL3cQOFhk53s0FtCN/XLVXTBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Egi7ts2M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D85A606D801
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D85A606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Egi7ts2M
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-676804a3a22so1131621d50.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:34:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793817291; cv=none;
        d=google.com; s=arc-20260327;
        b=CCSwonjH7CkyUFTygrU9y/L6SR6DlrqF4mn9g8Zq+Qg3BsvXGdqeIzNj+/jfJ3ToXn
         U3G1vvrYrhg7vydSzr5cZrilO/NkBnBVympotnOM41DaNHAzxyrCmwwqqIwuzYhPfvqr
         nEXGIt3VHIdcmetelj9z0f0cqpaftEJ4YV63bhHO+R4DHNOl+fekpymAYrTNBiV+R/89
         ClzSYczxoS5KycJqq8Urd+9lWZJj6O0PkfXKaYCzd7GQcrstItawse8foqz9Z52/TZbi
         s72OvYKyGPAxiG7HhD28JU+xHHEhUU4rxdtA2AECdwmF3+jxa9lxZOA4uTX5Chjk+5KG
         aTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
        fh=lpNQERpbMJqOHheM1OhS1S190TiOPXnVxw4O/a4ej4U=;
        b=NmBN/+fhl1ZhQ6LmHb0biRPZmS8uvgpqGhRQondxlHrE591v/zwJqZUCmeF7wVHs6S
         /Sh2Cb6m46NCjFSP6BSNHy5aSxeZqRMhbaoxTvBcLQRwZBRzoobjkx6u67zvxDgy/Zw1
         NYLKVxc0BSqxjCyePa5DPNUGG0ys+P7RAhGee4VNASc8RPxyJsyEV2tBoqFQN0KZbUlu
         /ZcxsaY1IgKt74KNfdujcDbYtGSzYfGeScTDMWxSaMvmjw7Lcme4anVw/CS8ry1bSFZY
         hGJ/VWh4nxFDGW2qg1x+mEC2X3EXs0LjO4CB+A3EzggjCU/8agl5SDXsUj3HC+sSzFx4
         9FXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817291; x=1794422091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
        b=Egi7ts2Mm5gYef6G6YrcIhLyeLQ0FcMfihrNrb07UIdKTJ8eHPfv9t3z7oclQi5Eor
         JSnv85OEUb3UDDxa8Ts2HhVws1vB3MJuLKjr1TuIMVedDN+7RisPqncEd84019kEFPZL
         LEXXaJcJ9ILG3MgYK/UByVdk5TSnGZwYM/q5wbGvxIwYEF2YoWiJsDH8gwxP4pUghzk2
         3GIf/00Byib45vvrPdb/UeN6BSrlIZAlrevATqcPqZ/Yfmj0X3xuY7Z/vVyrDw1Yy/Fm
         q/kVp3HQGJObFR/Oykctms0Nh/ks3mKkikb8V6orSm02Aj18FB0N//ExLe2PcpH83AbQ
         CzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817291; x=1794422091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inKoJkd5OXoLymkRd5+ohV9ATRnfy1E/adzijjekINI=;
        b=zPGr4DY/l8JK4ayZRbC6MTkkrkBQqyitNXHZyJr1fsxIScXx5u3ycfPFczsUyvgLHA
         sznW+GbHR8P1+MR3NYa5HAvbXBIKgFWsDOA0x5L0ohD11+erVrjfXjdcAZCfL0XMJbyj
         dH0bVzPTXvupe0qECJtSQ7cO3rqPLUkoVXk65IILMgEAvJE83xoNitn40/CQG36HDglm
         mv/OPgfQLDo0704W9xOFYOMM3vdQ4Mt1u9L8FVyhl7t+h8NTdTyVf+K16QDskg/NJ2F8
         uYlToTiGs1i3ebg50dZ3NFmqfh4VKv1KdtxKMmzgEgwanpgdwfknMoPNs+CGbs3/VQ4Q
         h+Eg==
X-Forwarded-Encrypted: i=1; AKwUvByEKfr81PhcoRYt5nJyd3M4L4MvIq/0qGRnJwdiviUIJ0MMoLf+9ncvpkCyrA83CpbjDeU4V2iB+IPK@vger.kernel.org
X-Gm-Message-State: APuU4Z/h20sJsw1iKVijfVAP+DSAUvc1LEysZP0kSxKREaqZOPk8CslF
	1PInhOF8DFgfxM6ZZ+e+H3llGS1jQ86sAs1j8j1Q2cv3+5yqhnpoDttmJsNc+hBkKHMfFY1g+M9
	bl/IZUt+CwRSseS92s1qy5ANNj1ZT5EA=
X-Gm-Gg: AYBFou08gCl8/d48+A/RcpCs0nlTN+wuIuPj0AukZPb03MN6BbmYyAWHDWaaLCsCvbG
	1eM3gDHVgqNRuwg7g1kjh3FrBWGlgDMKAE3IsLNOsDrNxjYSwX4HFipN2KjcDKlhRiac1E2vKEh
	hT0GhH9UDta+mhYvkBTtXYSP4snAAVlSajV15OsgFkJiG7QPmS4PXapy4+r1+sSFRCEz83wKbtc
	CoyCijcReUQdBBlVdN7AZEe0ao2LrvI6wpNzmPhsMD+zRXFmJCdU/NYnpwczGxz9Fl/0yGf2Ssz
	eKMq19s7u8Ah7mZQMi5gRQYG8shwYDUXpvLvMCq1SWCKJOkrE5Qo8Q4MJhUMlp4eQqnw6S9XUrg
	RRQne3T+5iNNMhndRw3JbFisB9fZIgmcKcvNyXA==
X-Received: by 2002:a05:690e:1183:b0:677:d419:8a27 with SMTP id
 956f58d0204a3-67ba501b9c2mr13354407d50.51.1793817291284; Wed, 04 Nov 2026
 10:34:51 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-spacemit-soc-timer-v1-0-36722421db6e@linux.spacemit.com> <20261103-spacemit-soc-timer-v1-3-36722421db6e@linux.spacemit.com>
In-Reply-To: <20261103-spacemit-soc-timer-v1-3-36722421db6e@linux.spacemit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 4 Nov 2026 19:34:00 +0100
X-Gm-Features: AclHuK_BL_NkBC94LItzmxoqmdRwZHsCG21WJll4bbRrLdBM3Wvnf0wDs-TvvBg
Message-ID: <CABdCQ=M_FwJOEG9Lhzahk=qA-qmqMH1QeGg7dfFPWdwT=4J63Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: dts: spacemit: Add the K1 APB timer
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 3 nov 2026 a las 9:56, Troy Mitchell
(<troy.mitchell@linux.spacemit.com>) escribi=C3=B3:
> [...]
> +               timer0: timer@d4014000 {
> +                       compatible =3D "spacemit,k1-timer";
> +                       reg =3D <0x0 0xd4014000 0x0 0x100>;
> +                       interrupts =3D <23>;


K1 timer specifies interrupt as <23>, but K3 uses <26
IRQ_TYPE_LEVEL_HIGH>. The IRQ type should be consistent.
