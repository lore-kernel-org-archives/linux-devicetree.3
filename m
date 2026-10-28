Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793177819;
	b=dowsbvuspj1/JTpF4H5JW18XQKnboJlIL+zYmF19N6nMiT1q9PiuRKJw9unjtEnhE7zz
	 ERqotPDRAaBk4CL0n8kffEIEVmMFrqqQ3wPVSZ5zoOBKhXvOU1Z3OPEd8L5PfnaR1k5oe
	 ElJOXG62DuvSJ+FA6Y4JdwYkU3KI5dMQmTHt6+nuXRpPRH+o1hup2W0ZYgBGjP/GR0jD/
	 LIwz9KtZXzdC5XiKrrBLDhaMvhqzJKWgBBZMjEU9o4W30ZU4TxSvXWA2zOcDD1sucJkpp
	 5PDBfG1efnm/NZ5NDwsIvq0slk3o9k+0+Z9RQj+rJpD/BaBIJkMu/8KyGvpjSAg+ovQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177819;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fgalwktVNpsEZDXGOqK911Twumi/NQcKln8PLWf3Upc=;
	b=UkGg51Uvx8++Mp6Diend/VTFqYCM6srJDU+fsSiohXVEO8Dn8eHfqbhObFSQtfAC/pTN
	 ofmRVDEDRuDXjX/Nl99tqCQA/9uTKOosqqr/cNQiE+yG247g0ZLU4o1YHWPeN4Dvjbmp+
	 xzwfY4XoZt2/NzKn95bMo+vuy3RXhVOlmKSJ31d3XAfDK+34rVGPfPLrcG5wRe+IsFNjw
	 r8963QaycRdLB19l/Bd7c7XHlxhwdSq2MaKlr06DcAsNfSrYmUPXFGD0veptDdePceYBj
	 94ymNHCx0HIOJVMrYSwvaDM3xNWMcS9QW2zTmkqwgsHsvNzPMF42zwyK0qH1pMNhGzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQibXMXB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058D5606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQibXMXB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61701F031E0
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793177818;
	bh=fgalwktVNpsEZDXGOqK911Twumi/NQcKln8PLWf3Upc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DQibXMXBLOAEyZVKE/CFJHbMV5XqkbaoxFzHIv4VTo5A3IU0tQx7cwSKZ8rip/JWW
	 I86vH+gOtl+DfXvkTGE6I3pts1sRPcn3XAbfdbnvlVWCZX+yqCAO6PDB3SvLfAGfj7
	 BW4pzRvSN6QAm/Dv8rZ5PDBs5rrsWN/DgdJbc7iIMiEhbAiBiW/UerEVdQc8/f59Jd
	 y0SlKqTzFhENavQ7ifRlwkmjMmh0xLSI4jnTCgNOFaax2EOp+bVTFxfWsg3zaEbxJH
	 My1MzqDqBb+NlLiCKyoU0VhqcithADxt4MXYpK25hE2axgQUOKoReEdLYaEaLCDDq3
	 hardoIB9bgoQQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3aca0bf7fd0so1326521fa.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 01:56:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByWVhn9nUYZ5XyI1T4pj5YptIAshnhozzoA1hZyQYWbKzJB/FjeGoYbQydY55meLyVUHUuNa175/sHC@vger.kernel.org
X-Gm-Message-State: AFq9FYIGsbvXLI/agCzRCWAYEueaYj92QWlu+/VokmYvlltHy4//NOhs
	ygRX/E/BypB9EeucBynJjUdDiZh9ZCT/a9LJ/dNXh39Z/j58iIQ8EjhLcxR42DuBe1G2+0T16yO
	bcfeDtPh4KVSlD2ea1rNYSP4xv/zsrGzqZ5bT/Sz3gw==
X-Received: by 2002:a05:651c:150d:b0:3a6:58f7:da9a with SMTP id
 38308e7fff4ca-3ac9cfcc25emr3279141fa.27.1793177817298; Wed, 28 Oct 2026
 01:56:57 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
In-Reply-To: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 28 Oct 2026 09:56:44 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc0rznLufJz-KVY_d1nDU_wpMM8E0bho7KJCfG6Xn01SA@mail.gmail.com>
X-Gm-Features: AclHuK9mMPE05cIDjki8s1mLCHmR3I47pX_uEOr7Y0FdJXyzRik8jx1n3BBNXe0
Message-ID: <CAMRc=Mc0rznLufJz-KVY_d1nDU_wpMM8E0bho7KJCfG6Xn01SA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/18] riscv: add initial Zhihe A210 support using
 SCMI clocks and resets
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:37=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
>
> This adds initial support for the Zhihe A210 SoC and the Melon Pi V1
> and V2 boards. It replaces the earlier series [1]. The way clocks and
> resets are handled changed completely, so I am posting it as a new RFC
> rather than as v2.
>

No, please keep the numbering. You can add the RFC tag and still post
it as v2 retaining the changelog. It makes things easier to track.

Thanks,
Bartosz
