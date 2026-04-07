Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB1A29405
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 01:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775525234; cv=none; b=XkIBmgRaESxpNn028QenKHBw3Ju36fnIxaktB9cJD54d+eyVFwRbwU25nRXFSeDhyWROlRVY1v6FueIQsZ1OE9qTO8WrFYUddZPFoJv0bS63FV4H6ODGJUeCG7lG7/BPpMhqDBh1BWdW2sX3hR2HFolHwLIHLMAuRpCb7vf4n4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775525234; c=relaxed/simple;
	bh=hPmIp2bcqNdrqhvAmEzpKkoM2R7Pk7B5+JDy1IBQA5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FV4xTyyNbSKlL99Rv8IxF9GRKz6/J38N/EeQDRlE0jFGl9o9fHpyXrFAjnTiriggi0nGkaamV7pV6BbAAiIqrr919eL/Nwh3GZElc+yMg0owRAfhuarb6MGxDIChZG1G6FF2uMYSIg2yJSgnLdJz7+CFtzTP4xG4gwrylHvrp+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObNzRO+f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObNzRO+f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9666BC2BCB6
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 01:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775525233;
	bh=hPmIp2bcqNdrqhvAmEzpKkoM2R7Pk7B5+JDy1IBQA5c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ObNzRO+f6zCqt6a5abYGHTeCHbSK7Qxx3LSdNdQ73Vt3wVJYQKXMtDjdbjcGsTt5T
	 I4LKrdQt/NE6UIDPR09YSWgtbcGYivO6PkQH44Vr+aR7Iy+gO5VFAd/nK2dUuJFXp8
	 XfTav5gag9ufLSzSQD+6mWyqbSRlyWEjCop09d0bBfaxlXw5oEcYgsCVpeUvE7lSHo
	 wdffX+7VOi2GFRCSgAmnRaf6U9ntm0lkRC+WRhZfCbI1WxFKID6K7ldnckZr7lhSEJ
	 /fXNmsqmqXRk7cva1Tp0fGuJofZJCqdlFyjMeTlj92bXjznGTk1u+Bl6w49fTNlbpM
	 Xt9KJvX2wDMmw==
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso4718711f8f.2
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 18:27:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbvu2yEMOQybv5GtDOWVPMK6LPf7ovlczol0mkm81L03XjvGT7W2//pBWiLiUUDisOMvyaPx4moYt1@vger.kernel.org
X-Gm-Message-State: AOJu0YwkA7HQQiiKA3+I7q0uW6c0+iEToJCjigz9Mm36Ky2EiGa80KDx
	LCDFxfEaeDSaNqSv21NPaR/EjFuYYGWlZoZvFDWlNh8tGRvhXBF+Dv1Ca7T36pxsJRJXFejnqXp
	Uc9waO9dse9C6q0HbClp+SYf6+jhExd4=
X-Received: by 2002:a05:6000:2485:b0:43d:1374:e91f with SMTP id
 ffacd0b85a97d-43d29268a98mr22109098f8f.3.1775525231876; Mon, 06 Apr 2026
 18:27:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406232655.144043-1-inochiama@gmail.com> <20260406232655.144043-3-inochiama@gmail.com>
In-Reply-To: <20260406232655.144043-3-inochiama@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 7 Apr 2026 09:26:59 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRdhx=tN+4T7q3urx8fphW86ZbxTXy_UFkgOK0=M9ZE1g@mail.gmail.com>
X-Gm-Features: AQROBzAB0gPwn_elKv0Q2mvNd_miP4MmbPyaYsXlU_NbTCpX0UlEYi471bkyTKQ
Message-ID: <CAJF2gTRdhx=tN+4T7q3urx8fphW86ZbxTXy_UFkgOK0=M9ZE1g@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: sg2042: use hex for CPU unit address
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
	Nutty Liu <liujingqi@lanxincomputing.com>, Guodong Xu <guodong@riscstar.com>, 
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 7:27=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com> =
wrote:
>
> Previous the CPU unit address cpu of sg2042 use decimal, it is
> not following the general convention for unit addresses of the
> OF. Convent the unit address to hex to resolve this problem.
>
> The introduces a small ABI break for the CPU id, but it should
> affect nothing since there is no direct full-path reference to
> these CPU nodes.
>
> Fixes: ae5bac370ed4 ("riscv: dts: sophgo: Add initial device tree of Soph=
go SRD3-10")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Link: https://lore.kernel.org/devicetree-spec/00ddad5a-02f5-474e-af9c-11c=
e7716ddfc@iscas.ac.cn/

I don't think this tag is necessary. For others:

Reviewed-by: Guo Ren <guoren@kernel.org>

> ---
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 236 ++++++++++----------
>  1 file changed, 118 insertions(+), 118 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boo=
t/dts/sophgo/sg2042-cpus.dtsi
> index 509488eee432..fd8906b313d2 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> @@ -263,7 +263,7 @@ cpu0: cpu@0 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <0>;
> +                       reg =3D <0x0>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -291,7 +291,7 @@ cpu1: cpu@1 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <1>;
> +                       reg =3D <0x1>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -319,7 +319,7 @@ cpu2: cpu@2 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <2>;
> +                       reg =3D <0x2>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -347,7 +347,7 @@ cpu3: cpu@3 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <3>;
> +                       reg =3D <0x3>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -375,7 +375,7 @@ cpu4: cpu@4 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <4>;
> +                       reg =3D <0x4>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -403,7 +403,7 @@ cpu5: cpu@5 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <5>;
> +                       reg =3D <0x5>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -431,7 +431,7 @@ cpu6: cpu@6 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <6>;
> +                       reg =3D <0x6>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -459,7 +459,7 @@ cpu7: cpu@7 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <7>;
> +                       reg =3D <0x7>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -487,7 +487,7 @@ cpu8: cpu@8 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <8>;
> +                       reg =3D <0x8>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -515,7 +515,7 @@ cpu9: cpu@9 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <9>;
> +                       reg =3D <0x9>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -533,7 +533,7 @@ cpu9_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu10: cpu@10 {
> +               cpu10: cpu@a {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -543,7 +543,7 @@ cpu10: cpu@10 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <10>;
> +                       reg =3D <0xa>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -561,7 +561,7 @@ cpu10_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu11: cpu@11 {
> +               cpu11: cpu@b {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -571,7 +571,7 @@ cpu11: cpu@11 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <11>;
> +                       reg =3D <0xb>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -589,7 +589,7 @@ cpu11_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu12: cpu@12 {
> +               cpu12: cpu@c {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -599,7 +599,7 @@ cpu12: cpu@12 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <12>;
> +                       reg =3D <0xc>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -617,7 +617,7 @@ cpu12_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu13: cpu@13 {
> +               cpu13: cpu@d {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -627,7 +627,7 @@ cpu13: cpu@13 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <13>;
> +                       reg =3D <0xd>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -645,7 +645,7 @@ cpu13_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu14: cpu@14 {
> +               cpu14: cpu@e {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -655,7 +655,7 @@ cpu14: cpu@14 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <14>;
> +                       reg =3D <0xe>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -673,7 +673,7 @@ cpu14_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu15: cpu@15 {
> +               cpu15: cpu@f {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -683,7 +683,7 @@ cpu15: cpu@15 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <15>;
> +                       reg =3D <0xf>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -701,7 +701,7 @@ cpu15_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu16: cpu@16 {
> +               cpu16: cpu@10 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -711,7 +711,7 @@ cpu16: cpu@16 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <16>;
> +                       reg =3D <0x10>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -729,7 +729,7 @@ cpu16_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu17: cpu@17 {
> +               cpu17: cpu@11 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -739,7 +739,7 @@ cpu17: cpu@17 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <17>;
> +                       reg =3D <0x11>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -757,7 +757,7 @@ cpu17_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu18: cpu@18 {
> +               cpu18: cpu@12 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -767,7 +767,7 @@ cpu18: cpu@18 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <18>;
> +                       reg =3D <0x12>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -785,7 +785,7 @@ cpu18_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu19: cpu@19 {
> +               cpu19: cpu@13 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -795,7 +795,7 @@ cpu19: cpu@19 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <19>;
> +                       reg =3D <0x13>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -813,7 +813,7 @@ cpu19_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu20: cpu@20 {
> +               cpu20: cpu@14 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -823,7 +823,7 @@ cpu20: cpu@20 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <20>;
> +                       reg =3D <0x14>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -841,7 +841,7 @@ cpu20_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu21: cpu@21 {
> +               cpu21: cpu@15 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -851,7 +851,7 @@ cpu21: cpu@21 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <21>;
> +                       reg =3D <0x15>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -869,7 +869,7 @@ cpu21_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu22: cpu@22 {
> +               cpu22: cpu@16 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -879,7 +879,7 @@ cpu22: cpu@22 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <22>;
> +                       reg =3D <0x16>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -897,7 +897,7 @@ cpu22_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu23: cpu@23 {
> +               cpu23: cpu@17 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -907,7 +907,7 @@ cpu23: cpu@23 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <23>;
> +                       reg =3D <0x17>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -925,7 +925,7 @@ cpu23_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu24: cpu@24 {
> +               cpu24: cpu@18 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -935,7 +935,7 @@ cpu24: cpu@24 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <24>;
> +                       reg =3D <0x18>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -953,7 +953,7 @@ cpu24_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu25: cpu@25 {
> +               cpu25: cpu@19 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -963,7 +963,7 @@ cpu25: cpu@25 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <25>;
> +                       reg =3D <0x19>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -981,7 +981,7 @@ cpu25_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu26: cpu@26 {
> +               cpu26: cpu@1a {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -991,7 +991,7 @@ cpu26: cpu@26 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <26>;
> +                       reg =3D <0x1a>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1009,7 +1009,7 @@ cpu26_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu27: cpu@27 {
> +               cpu27: cpu@1b {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1019,7 +1019,7 @@ cpu27: cpu@27 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <27>;
> +                       reg =3D <0x1b>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1037,7 +1037,7 @@ cpu27_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu28: cpu@28 {
> +               cpu28: cpu@1c {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1047,7 +1047,7 @@ cpu28: cpu@28 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <28>;
> +                       reg =3D <0x1c>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1065,7 +1065,7 @@ cpu28_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu29: cpu@29 {
> +               cpu29: cpu@1d {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1075,7 +1075,7 @@ cpu29: cpu@29 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <29>;
> +                       reg =3D <0x1d>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1093,7 +1093,7 @@ cpu29_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu30: cpu@30 {
> +               cpu30: cpu@1e {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1103,7 +1103,7 @@ cpu30: cpu@30 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <30>;
> +                       reg =3D <0x1e>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1121,7 +1121,7 @@ cpu30_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu31: cpu@31 {
> +               cpu31: cpu@1f {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1131,7 +1131,7 @@ cpu31: cpu@31 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <31>;
> +                       reg =3D <0x1f>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1149,7 +1149,7 @@ cpu31_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu32: cpu@32 {
> +               cpu32: cpu@20 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1159,7 +1159,7 @@ cpu32: cpu@32 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <32>;
> +                       reg =3D <0x20>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1177,7 +1177,7 @@ cpu32_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu33: cpu@33 {
> +               cpu33: cpu@21 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1187,7 +1187,7 @@ cpu33: cpu@33 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <33>;
> +                       reg =3D <0x21>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1205,7 +1205,7 @@ cpu33_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu34: cpu@34 {
> +               cpu34: cpu@22 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1215,7 +1215,7 @@ cpu34: cpu@34 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <34>;
> +                       reg =3D <0x22>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1233,7 +1233,7 @@ cpu34_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu35: cpu@35 {
> +               cpu35: cpu@23 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1243,7 +1243,7 @@ cpu35: cpu@35 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <35>;
> +                       reg =3D <0x23>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1261,7 +1261,7 @@ cpu35_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu36: cpu@36 {
> +               cpu36: cpu@24 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1271,7 +1271,7 @@ cpu36: cpu@36 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <36>;
> +                       reg =3D <0x24>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1289,7 +1289,7 @@ cpu36_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu37: cpu@37 {
> +               cpu37: cpu@25 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1299,7 +1299,7 @@ cpu37: cpu@37 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <37>;
> +                       reg =3D <0x25>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1317,7 +1317,7 @@ cpu37_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu38: cpu@38 {
> +               cpu38: cpu@26 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1327,7 +1327,7 @@ cpu38: cpu@38 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <38>;
> +                       reg =3D <0x26>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1345,7 +1345,7 @@ cpu38_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu39: cpu@39 {
> +               cpu39: cpu@27 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1355,7 +1355,7 @@ cpu39: cpu@39 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <39>;
> +                       reg =3D <0x27>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1373,7 +1373,7 @@ cpu39_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu40: cpu@40 {
> +               cpu40: cpu@28 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1383,7 +1383,7 @@ cpu40: cpu@40 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <40>;
> +                       reg =3D <0x28>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1401,7 +1401,7 @@ cpu40_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu41: cpu@41 {
> +               cpu41: cpu@29 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1411,7 +1411,7 @@ cpu41: cpu@41 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <41>;
> +                       reg =3D <0x29>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1429,7 +1429,7 @@ cpu41_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu42: cpu@42 {
> +               cpu42: cpu@2a {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1439,7 +1439,7 @@ cpu42: cpu@42 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <42>;
> +                       reg =3D <0x2a>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1457,7 +1457,7 @@ cpu42_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu43: cpu@43 {
> +               cpu43: cpu@2b {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1467,7 +1467,7 @@ cpu43: cpu@43 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <43>;
> +                       reg =3D <0x2b>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1485,7 +1485,7 @@ cpu43_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu44: cpu@44 {
> +               cpu44: cpu@2c {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1495,7 +1495,7 @@ cpu44: cpu@44 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <44>;
> +                       reg =3D <0x2c>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1513,7 +1513,7 @@ cpu44_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu45: cpu@45 {
> +               cpu45: cpu@2d {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1523,7 +1523,7 @@ cpu45: cpu@45 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <45>;
> +                       reg =3D <0x2d>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1541,7 +1541,7 @@ cpu45_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu46: cpu@46 {
> +               cpu46: cpu@2e {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1551,7 +1551,7 @@ cpu46: cpu@46 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <46>;
> +                       reg =3D <0x2e>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1569,7 +1569,7 @@ cpu46_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu47: cpu@47 {
> +               cpu47: cpu@2f {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1579,7 +1579,7 @@ cpu47: cpu@47 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <47>;
> +                       reg =3D <0x2f>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1597,7 +1597,7 @@ cpu47_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu48: cpu@48 {
> +               cpu48: cpu@30 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1607,7 +1607,7 @@ cpu48: cpu@48 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <48>;
> +                       reg =3D <0x30>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1625,7 +1625,7 @@ cpu48_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu49: cpu@49 {
> +               cpu49: cpu@31 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1635,7 +1635,7 @@ cpu49: cpu@49 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <49>;
> +                       reg =3D <0x31>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1653,7 +1653,7 @@ cpu49_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu50: cpu@50 {
> +               cpu50: cpu@32 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1663,7 +1663,7 @@ cpu50: cpu@50 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <50>;
> +                       reg =3D <0x32>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1681,7 +1681,7 @@ cpu50_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu51: cpu@51 {
> +               cpu51: cpu@33 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1691,7 +1691,7 @@ cpu51: cpu@51 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <51>;
> +                       reg =3D <0x33>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1709,7 +1709,7 @@ cpu51_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu52: cpu@52 {
> +               cpu52: cpu@34 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1719,7 +1719,7 @@ cpu52: cpu@52 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <52>;
> +                       reg =3D <0x34>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1737,7 +1737,7 @@ cpu52_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu53: cpu@53 {
> +               cpu53: cpu@35 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1747,7 +1747,7 @@ cpu53: cpu@53 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <53>;
> +                       reg =3D <0x35>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1765,7 +1765,7 @@ cpu53_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu54: cpu@54 {
> +               cpu54: cpu@36 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1775,7 +1775,7 @@ cpu54: cpu@54 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <54>;
> +                       reg =3D <0x36>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1793,7 +1793,7 @@ cpu54_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu55: cpu@55 {
> +               cpu55: cpu@37 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1803,7 +1803,7 @@ cpu55: cpu@55 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <55>;
> +                       reg =3D <0x37>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1821,7 +1821,7 @@ cpu55_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu56: cpu@56 {
> +               cpu56: cpu@38 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1831,7 +1831,7 @@ cpu56: cpu@56 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <56>;
> +                       reg =3D <0x38>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1849,7 +1849,7 @@ cpu56_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu57: cpu@57 {
> +               cpu57: cpu@39 {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1859,7 +1859,7 @@ cpu57: cpu@57 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <57>;
> +                       reg =3D <0x39>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1877,7 +1877,7 @@ cpu57_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu58: cpu@58 {
> +               cpu58: cpu@3a {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1887,7 +1887,7 @@ cpu58: cpu@58 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <58>;
> +                       reg =3D <0x3a>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1905,7 +1905,7 @@ cpu58_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu59: cpu@59 {
> +               cpu59: cpu@3b {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1915,7 +1915,7 @@ cpu59: cpu@59 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <59>;
> +                       reg =3D <0x3b>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1933,7 +1933,7 @@ cpu59_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu60: cpu@60 {
> +               cpu60: cpu@3c {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1943,7 +1943,7 @@ cpu60: cpu@60 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <60>;
> +                       reg =3D <0x3c>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1961,7 +1961,7 @@ cpu60_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu61: cpu@61 {
> +               cpu61: cpu@3d {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1971,7 +1971,7 @@ cpu61: cpu@61 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <61>;
> +                       reg =3D <0x3d>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1989,7 +1989,7 @@ cpu61_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu62: cpu@62 {
> +               cpu62: cpu@3e {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -1999,7 +1999,7 @@ cpu62: cpu@62 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <62>;
> +                       reg =3D <0x3e>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -2017,7 +2017,7 @@ cpu62_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu63: cpu@63 {
> +               cpu63: cpu@3f {
>                         compatible =3D "thead,c920", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> @@ -2027,7 +2027,7 @@ cpu63: cpu@63 {
>                                                "zifencei", "zihpm", "zfh"=
,
>                                                "xtheadvector";
>                         thead,vlenb =3D <16>;
> -                       reg =3D <63>;
> +                       reg =3D <0x3f>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> --
> 2.53.0
>


--=20
Best Regards
 Guo Ren
