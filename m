Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FC01E0DD8
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 01:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775525186; cv=none; b=gNMM86kNnZCWiGKkLPAdmYZCf3K1qy+d5hWN//aER/OUpRR/j28/ksUZh6RBjgini9lHJiYHl+KhlzygRJwUSz6zVZgj1qXsPJMOIIF8M2+/I+LVH7o1lrfHwhWJHt4kdeplBMdZZagzML0bV6sQxputFonz4MXghJFTcsjzpR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775525186; c=relaxed/simple;
	bh=KjPc9Oc8ZhTCWkjlwkDAoitqVA96ZIS7mtMbO3ner0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4GTCTJVYoMg+7RAWmYnmuDEROvCxaSmNHYzeJNGRDZQScSsccXO6IHdivT/pPK244bnCT2AudzLgfX2IbLe6dAUKneikpzt0kvQcj0eGvb54OSLbLrh1/jiiFzgPC+y+i/lfxv0LIcZHPgkDw5E3Xutlputx1DVp+To1GwakQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwIyGJ4l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwIyGJ4l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7C5C2BCB4
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 01:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775525185;
	bh=KjPc9Oc8ZhTCWkjlwkDAoitqVA96ZIS7mtMbO3ner0k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FwIyGJ4l5b59JSD6O9h/Sf6kgRwFKqLjkYx9xTkVmUBXQfZnQQrGZceHk1R0v+i8/
	 Npvgl+jqgxPb7TsvpAVx3+jkO5tg0tRqVrkgMrXr7oEJ96rR+asEd+IoM22s7ax8gU
	 HSG6cQNVPniU/pmAzG3Hd/Dl1u10i3KLqQlaeGIpIaPVxAI9gBdy7ZpKYDq14r6bsr
	 1lh7B9kb0PBPRVafBy3yOOCXSuUlh5ZjY0dhOAiCs/x6IPOURopJGi/CucWxBJV9Yl
	 gtEXjs7I5rOVUv03ZZkdfr96zI8nVkWCFG7qPsG2WF6EwYBEAnvgiMyctUX7Drn/mS
	 iqo53hQ24YhSg==
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43ccda008cdso2701071f8f.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 18:26:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtAN8hJZB1rX2RuN6mIzSuAzsb3t2cSdmbJlXhRK55olwsjFagVODi+hQ/hkp0nIaYY58OTdHd+lEC@vger.kernel.org
X-Gm-Message-State: AOJu0YzBUL/nyBT+u7sw2HDjGaWQdeOyvVHpBdYUPSheqPpNsfKThhHS
	Z49e9s16I6BK0O+CiSb7utWyuO6LDqWd4w9gJkreK+3YlZdkmWPDBPeVVLr5rXzYPWaeaWfbRXw
	Ssq1GlERVSO8O7UUo9eYx8h/baHjYOT0=
X-Received: by 2002:a05:6000:25c1:b0:43c:ffd8:e25a with SMTP id
 ffacd0b85a97d-43d2115ae92mr28641928f8f.5.1775525184158; Mon, 06 Apr 2026
 18:26:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406232655.144043-1-inochiama@gmail.com> <20260406232655.144043-2-inochiama@gmail.com>
In-Reply-To: <20260406232655.144043-2-inochiama@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 7 Apr 2026 09:26:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTPt7UvFDRcA2EHfib1Yd0V8jjwAtqV8D2RCCGTn=RQ_g@mail.gmail.com>
X-Gm-Features: AQROBzDGKArepWOzzUaBjGfkc7grlDJXGE_vz845USQKoga_85UcWGJZmqceOCo
Message-ID: <CAJF2gTTPt7UvFDRcA2EHfib1Yd0V8jjwAtqV8D2RCCGTn=RQ_g@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: sg2044: use hex for CPU unit address
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
> Previous the CPU unit address cpu of sg2044 use decimal, it is
> not following the general convention for unit addresses of the
> OF. Convent the unit address to hex to resolve this problem.
>
> The introduces a small ABI break for the CPU id, but it should
> affect nothing since there is no direct full-path reference to
> these CPU nodes.
>
> Fixes: 967a94a92aaa ("riscv: dts: add initial Sophgo SG2042 SoC device tr=
ee")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Link: https://lore.kernel.org/devicetree-spec/00ddad5a-02f5-474e-af9c-11c=
e7716ddfc@iscas.ac.cn/

Remove the Link tag, and add:

Reviewed-by: Guo Ren <guoren@kernel.org>

> ---
>  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 236 ++++++++++----------
>  1 file changed, 118 insertions(+), 118 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boo=
t/dts/sophgo/sg2044-cpus.dtsi
> index 3135409c2149..f66a382c95bd 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> @@ -14,7 +14,7 @@ cpus {
>
>                 cpu0: cpu@0 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <0>;
> +                       reg =3D <0x0>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -50,7 +50,7 @@ cpu0_intc: interrupt-controller {
>
>                 cpu1: cpu@1 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <1>;
> +                       reg =3D <0x1>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -86,7 +86,7 @@ cpu1_intc: interrupt-controller {
>
>                 cpu2: cpu@2 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <2>;
> +                       reg =3D <0x2>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -122,7 +122,7 @@ cpu2_intc: interrupt-controller {
>
>                 cpu3: cpu@3 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <3>;
> +                       reg =3D <0x3>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -158,7 +158,7 @@ cpu3_intc: interrupt-controller {
>
>                 cpu4: cpu@4 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <4>;
> +                       reg =3D <0x4>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -194,7 +194,7 @@ cpu4_intc: interrupt-controller {
>
>                 cpu5: cpu@5 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <5>;
> +                       reg =3D <0x5>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -230,7 +230,7 @@ cpu5_intc: interrupt-controller {
>
>                 cpu6: cpu@6 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <6>;
> +                       reg =3D <0x6>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -266,7 +266,7 @@ cpu6_intc: interrupt-controller {
>
>                 cpu7: cpu@7 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <7>;
> +                       reg =3D <0x7>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -302,7 +302,7 @@ cpu7_intc: interrupt-controller {
>
>                 cpu8: cpu@8 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <8>;
> +                       reg =3D <0x8>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -338,7 +338,7 @@ cpu8_intc: interrupt-controller {
>
>                 cpu9: cpu@9 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <9>;
> +                       reg =3D <0x9>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -372,9 +372,9 @@ cpu9_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu10: cpu@10 {
> +               cpu10: cpu@a {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <10>;
> +                       reg =3D <0xa>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -408,9 +408,9 @@ cpu10_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu11: cpu@11 {
> +               cpu11: cpu@b {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <11>;
> +                       reg =3D <0xb>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -444,9 +444,9 @@ cpu11_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu12: cpu@12 {
> +               cpu12: cpu@c {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <12>;
> +                       reg =3D <0xc>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -480,9 +480,9 @@ cpu12_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu13: cpu@13 {
> +               cpu13: cpu@d {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <13>;
> +                       reg =3D <0xd>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -516,9 +516,9 @@ cpu13_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu14: cpu@14 {
> +               cpu14: cpu@e {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <14>;
> +                       reg =3D <0xe>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -552,9 +552,9 @@ cpu14_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu15: cpu@15 {
> +               cpu15: cpu@f {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <15>;
> +                       reg =3D <0xf>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -588,9 +588,9 @@ cpu15_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu16: cpu@16 {
> +               cpu16: cpu@10 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <16>;
> +                       reg =3D <0x10>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -624,9 +624,9 @@ cpu16_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu17: cpu@17 {
> +               cpu17: cpu@11 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <17>;
> +                       reg =3D <0x11>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -660,9 +660,9 @@ cpu17_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu18: cpu@18 {
> +               cpu18: cpu@12 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <18>;
> +                       reg =3D <0x12>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -696,9 +696,9 @@ cpu18_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu19: cpu@19 {
> +               cpu19: cpu@13 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <19>;
> +                       reg =3D <0x13>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -732,9 +732,9 @@ cpu19_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu20: cpu@20 {
> +               cpu20: cpu@14 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <20>;
> +                       reg =3D <0x14>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -768,9 +768,9 @@ cpu20_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu21: cpu@21 {
> +               cpu21: cpu@15 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <21>;
> +                       reg =3D <0x15>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -804,9 +804,9 @@ cpu21_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu22: cpu@22 {
> +               cpu22: cpu@16 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <22>;
> +                       reg =3D <0x16>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -840,9 +840,9 @@ cpu22_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu23: cpu@23 {
> +               cpu23: cpu@17 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <23>;
> +                       reg =3D <0x17>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -876,9 +876,9 @@ cpu23_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu24: cpu@24 {
> +               cpu24: cpu@18 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <24>;
> +                       reg =3D <0x18>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -912,9 +912,9 @@ cpu24_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu25: cpu@25 {
> +               cpu25: cpu@19 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <25>;
> +                       reg =3D <0x19>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -948,9 +948,9 @@ cpu25_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu26: cpu@26 {
> +               cpu26: cpu@1a {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <26>;
> +                       reg =3D <0x1a>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -984,9 +984,9 @@ cpu26_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu27: cpu@27 {
> +               cpu27: cpu@1b {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <27>;
> +                       reg =3D <0x1b>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1020,9 +1020,9 @@ cpu27_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu28: cpu@28 {
> +               cpu28: cpu@1c {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <28>;
> +                       reg =3D <0x1c>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1056,9 +1056,9 @@ cpu28_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu29: cpu@29 {
> +               cpu29: cpu@1d {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <29>;
> +                       reg =3D <0x1d>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1092,9 +1092,9 @@ cpu29_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu30: cpu@30 {
> +               cpu30: cpu@1e {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <30>;
> +                       reg =3D <0x1e>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1128,9 +1128,9 @@ cpu30_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu31: cpu@31 {
> +               cpu31: cpu@1f {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <31>;
> +                       reg =3D <0x1f>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1164,9 +1164,9 @@ cpu31_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu32: cpu@32 {
> +               cpu32: cpu@20 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <32>;
> +                       reg =3D <0x20>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1200,9 +1200,9 @@ cpu32_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu33: cpu@33 {
> +               cpu33: cpu@21 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <33>;
> +                       reg =3D <0x21>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1236,9 +1236,9 @@ cpu33_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu34: cpu@34 {
> +               cpu34: cpu@22 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <34>;
> +                       reg =3D <0x22>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1272,9 +1272,9 @@ cpu34_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu35: cpu@35 {
> +               cpu35: cpu@23 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <35>;
> +                       reg =3D <0x23>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1308,9 +1308,9 @@ cpu35_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu36: cpu@36 {
> +               cpu36: cpu@24 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <36>;
> +                       reg =3D <0x24>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1344,9 +1344,9 @@ cpu36_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu37: cpu@37 {
> +               cpu37: cpu@25 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <37>;
> +                       reg =3D <0x25>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1380,9 +1380,9 @@ cpu37_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu38: cpu@38 {
> +               cpu38: cpu@26 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <38>;
> +                       reg =3D <0x26>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1416,9 +1416,9 @@ cpu38_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu39: cpu@39 {
> +               cpu39: cpu@27 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <39>;
> +                       reg =3D <0x27>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1452,9 +1452,9 @@ cpu39_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu40: cpu@40 {
> +               cpu40: cpu@28 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <40>;
> +                       reg =3D <0x28>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1488,9 +1488,9 @@ cpu40_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu41: cpu@41 {
> +               cpu41: cpu@29 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <41>;
> +                       reg =3D <0x29>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1524,9 +1524,9 @@ cpu41_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu42: cpu@42 {
> +               cpu42: cpu@2a {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <42>;
> +                       reg =3D <0x2a>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1560,9 +1560,9 @@ cpu42_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu43: cpu@43 {
> +               cpu43: cpu@2b {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <43>;
> +                       reg =3D <0x2b>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1596,9 +1596,9 @@ cpu43_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu44: cpu@44 {
> +               cpu44: cpu@2c {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <44>;
> +                       reg =3D <0x2c>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1632,9 +1632,9 @@ cpu44_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu45: cpu@45 {
> +               cpu45: cpu@2d {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <45>;
> +                       reg =3D <0x2d>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1668,9 +1668,9 @@ cpu45_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu46: cpu@46 {
> +               cpu46: cpu@2e {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <46>;
> +                       reg =3D <0x2e>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1704,9 +1704,9 @@ cpu46_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu47: cpu@47 {
> +               cpu47: cpu@2f {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <47>;
> +                       reg =3D <0x2f>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1740,9 +1740,9 @@ cpu47_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu48: cpu@48 {
> +               cpu48: cpu@30 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <48>;
> +                       reg =3D <0x30>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1776,9 +1776,9 @@ cpu48_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu49: cpu@49 {
> +               cpu49: cpu@31 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <49>;
> +                       reg =3D <0x31>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1812,9 +1812,9 @@ cpu49_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu50: cpu@50 {
> +               cpu50: cpu@32 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <50>;
> +                       reg =3D <0x32>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1848,9 +1848,9 @@ cpu50_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu51: cpu@51 {
> +               cpu51: cpu@33 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <51>;
> +                       reg =3D <0x33>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1884,9 +1884,9 @@ cpu51_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu52: cpu@52 {
> +               cpu52: cpu@34 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <52>;
> +                       reg =3D <0x34>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1920,9 +1920,9 @@ cpu52_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu53: cpu@53 {
> +               cpu53: cpu@35 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <53>;
> +                       reg =3D <0x35>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1956,9 +1956,9 @@ cpu53_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu54: cpu@54 {
> +               cpu54: cpu@36 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <54>;
> +                       reg =3D <0x36>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -1992,9 +1992,9 @@ cpu54_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu55: cpu@55 {
> +               cpu55: cpu@37 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <55>;
> +                       reg =3D <0x37>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -2028,9 +2028,9 @@ cpu55_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu56: cpu@56 {
> +               cpu56: cpu@38 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <56>;
> +                       reg =3D <0x38>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -2064,9 +2064,9 @@ cpu56_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu57: cpu@57 {
> +               cpu57: cpu@39 {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <57>;
> +                       reg =3D <0x39>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -2100,9 +2100,9 @@ cpu57_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu58: cpu@58 {
> +               cpu58: cpu@3a {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <58>;
> +                       reg =3D <0x3a>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -2136,9 +2136,9 @@ cpu58_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu59: cpu@59 {
> +               cpu59: cpu@3b {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <59>;
> +                       reg =3D <0x3b>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -2172,9 +2172,9 @@ cpu59_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu60: cpu@60 {
> +               cpu60: cpu@3c {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <60>;
> +                       reg =3D <0x3c>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -2208,9 +2208,9 @@ cpu60_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu61: cpu@61 {
> +               cpu61: cpu@3d {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <61>;
> +                       reg =3D <0x3d>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -2244,9 +2244,9 @@ cpu61_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu62: cpu@62 {
> +               cpu62: cpu@3e {
>                         compatible =3D "thead,c920", "riscv";
> -                       reg =3D <62>;
> +                       reg =3D <0x3e>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
>                         i-cache-sets =3D <512>;
> @@ -2280,9 +2280,9 @@ cpu62_intc: interrupt-controller {
>                         };
>                 };
>
> -               cpu63: cpu@63 {
> +               cpu63: cpu@3f {
>                         compatible =3D "thead,c920", "riscv";
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
