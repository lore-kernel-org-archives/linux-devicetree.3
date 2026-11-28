Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795873639;
	b=AQb1VXJ/yiIs6MiAAavcau1Ae5LVw4Kp4EI/DscBQ4dA4pyx+pIOzsUqiwUjWQyfx/Y7
	 hJY5I1Fq07sG+C2gOOtsFsZzBXliqRqUWruPRVMuyFevvkmPVL14U0ZJEVHXeYPHoha6z
	 D8XhsCtMHiL47OdFyWMWHYJXyCqh9VuDeA+IX75N04Ths658i4Cl2dz9qXplak541Gh84
	 UOLlrpNnoxPYwYl1EebboX/ST55TEJsayHfbzhOVNcX7hhWJJ/Ds45lTDQA6OMQkz1o4O
	 XC1MdTwLhdyVb7KF7iosXgo+eSmLtN987e/VyY5G/w6ci3k9iaugJ9J5uTCz4hW4vpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
	b=qdOVuZcgTgFVN/0jCXH+Lr63+pAdA5Et1XPqcVEOeqjzXVTT/S15mqKjDbDPMkTHgEW5
	 6Z3TwYD1OclpKDF4wIR1PLBvf4CLoGYBYCcfvJdbTmfhzEj6/8OgQpoIKJVglCvLsacJe
	 YSpKHlG4vNjXu587PhkaUMi/9qYKTVgTqzHUn3l2Pq+SJCe1zHsx7fa/wCTsAaORHm/wZ
	 V+mQAV/qMtMWw0dcLgEnQSsM8NAyozqsqekX6E9ic5Gq26L/rN9ipM4Q3YAIEkKQVnszQ
	 qKwPIzjn+mdM2i/byFSNowqN6DMTvSE9PrfLjO+2LTYAKjWKj7u02dCBxLtahfTRIMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=D0uipOTx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30F8606A31C
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 13:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D30F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=D0uipOTx
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67db1f6f50eso9213999d50.0
        for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 05:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795873637; cv=none;
        d=google.com; s=arc-20260327;
        b=SPr0e9J4nDu4nfxjQC0hjH2ljeX3zUmee2c5F0DpJN6MlboGpbHlI813NLc3HcF/7z
         pDTcRI5jY0McwSUxIeLzoCGPLzx9TdSAeQ1wrVVMIxf2JzjOx5OpG8Csb8YzFg8LLIrn
         SfM5JVx1CzaqqCjDffThbXwJ+1ujf+S+g+mmw5mR5622mwBxupnLb+q/ZnDOP6R52afR
         f7cKXvAqUL1T5+Gv3GrSn09XA8rfeOCJDVGxCKaD7jHm+wwBRDlPRXFAg+fY7rouKt3x
         +0ZfBb3SnLnouP6SduRMm7jDAXLNeG/F1N0g505VyX7AcJIcq/aImgRT6NSnzp0Bz9NQ
         ZL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
        fh=mhcrmkh14GlM/BjdeqDrjTO47F9ZLEOhOzMZUVqwrs4=;
        b=PEeLNjAgtf3QwJF6+5FD4v0q+bt6mtjQIXQfCWP9W1NaektsHk3cW7R1sgTlk09ZXH
         qxa5LxfgDrWEFkqaZOe6WeWW/hyuPTrE1Cv+ErLDWLXCYirSbEYUfKcQH3zXuWJQZL7k
         +XrTlp9xQhEOeAS72HFt8TJM0AYQL0E8Pm5HRNChrDY+YCY+c6aKtooebf9ibdCk52DL
         Dhi6DZlWCoHDozt9RslaJTM6sK0rYlTg2UvlWe3S3kNvYlfpXpJLlOhHGrbaJBUf8Gfv
         QzFiGOA0TAPPXELbh4tuNYiQtk+WbDm3L2hFmktAoOUy1+NrSkhhvbvursUX/MrR1J9k
         /oBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1795873637; x=1796478437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
        b=D0uipOTxbuZl5ilAGrum+9ZqBr4KKzd2qMCgu3VrnG+UshuBVBiKLPg8wU6BXkP9m1
         crPt1VtBMJHu3jkenaj9R8AyvtzusZGQj5jgW4+VDDRNsXdsKS0ljx+idJ9pBaZHhUht
         3gnuBgzbi+rd2EXSmmEH8f6MQ1z0FwbsLwEhQ/aUu1DSB40U+/bR4vOFLRpHY8e7j5Hd
         laesr+sU9v7zsRhhXwCa9kIgVofi33BFxqwDSUIAQTWjgngrWzrOeDukbsQrcTFKAJsW
         XOSwwZygR4sajBwd6WH9FH5/TiwOeW4iH3eQZ9getvF7C7OiiM4YBqE8C7IJViz2XcYs
         T1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795873637; x=1796478437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
        b=nmVBbuLy9vVJYNYxBSTkqGnndPg+f59QLutg747J0vsmZEklOsgjNQQj2f0zbYYX8R
         3p4XrINFM4oTNyxzt1Tc4wEanHxfT4jolEyQQK36xuSGnvSOvnG7WA156TFUCC3/amN+
         MXLYLhr30fMZrNYRdBMXVMjaD1dDT4+UvryC97Eys3lApfkq0/f4dyBKuPZRr5Lp5PCx
         d14gK/b4pJNaZcyUeufl6r1qaMtu8RLpU9n92gsJs/fT+542PwW0Z/NEoVGZC9yHJvQh
         ZXGdyWQhhnCzBeQ/nfM7uhS4vIkw80LOWNaevZ1wn4SyVu4Iy6n0dmIXefVZLfUtYdZp
         242w==
X-Forwarded-Encrypted: i=1; AL+hErFcrRCT0RRdKH2KG06fozj/s0KSM7E+80mLPhCIpBaWC6CVvgB0jiEXJf/Qb4tX8sYkaX2w8pHqOwHk@vger.kernel.org
X-Gm-Message-State: APuU4Z9XxzgDGWx3oQ4RNDNptKImQs/fJHnHMnxsw2ZvM6qmMt6brQuk
	s+dZyCOFJgBxiP555m/Z+yqJ5GbYLHOKpPUWuaJG51CU/Ku/VzcEfzKcupIrTOLDMUIIHbUaOR4
	ualwA4CxiLuOxuzs5IXusQgmyItIhAmbTZNXvhIkOCQ==
X-Gm-Gg: AZFdTZfrbH2T2T1EJ2ljweTx7TYoK46y7invcpLaN8FUZ5GHMNONDaeN6DMMGHpSB59
	80xG4APJXa2wFPRll5tfHCbeIbVG2UqqM9MvlLE6s9t3RxUgbsJN+Bk2MlJKZIoOahJ7nN8/jN+
	x9VU0evPbtxY0+WLub3g+6b3HqwTN2KgXr41EMHrROltRoF+/weOcyKo+AzNVRW9ifLXQxOGMgl
	f4gdYp8/VZTF9WBGy5pnpYi4+SKI2947VTynseVgOcNqoXcp80VI1dI1KVomDQJG5grAcvmtOq2
	VfIB+TnHcRA4vL9D/XaQGQg5ZIOJLlXGAPyxu2TvcWkWhRs8rBFYRun5o1LGx0WaF3SrPJU3ahB
	JJk5JJhQ1Cu5Hg6cNO7IDYewCs5xqiGe83QbRni/D9LBVhlyLYUAb3ctjDpAg6JrhWlNd93SxQ/
	TLw1Q1MIvl5ZTvxKAQGQZbMpbgjA==
X-Received: by 2002:a05:690e:440d:b0:67b:9953:2d97 with SMTP id
 956f58d0204a3-67df4479b3cmr7173129d50.79.1795873636887; Sat, 28 Nov 2026
 05:47:16 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-6-cf4fd4050e14@pigmoral.tech> <yf2dawzefycxhhs7zkua3v3hoirals3wtr6rheh4li33eq7r4i@yb7cem4r6x3z>
 <DN6QXCF5LYQM.1F5IA58ETMXVM@pigmoral.tech>
In-Reply-To: <DN6QXCF5LYQM.1F5IA58ETMXVM@pigmoral.tech>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sat, 28 Nov 2026 07:47:03 -0600
X-Gm-Features: Aa3M54r7COSuoCAZh2e-0U3S35YxbgE_qpFJlIopzh7FxBeYqA4RHXPR262VGcc
Message-ID: <CAEev2e-XsKPkEuvvdQeOuz9YymoZ_MZ8zGod+AuUUxxQPzLWPg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT
 node with ACLINT nodes
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Junhui,

On Sat, Nov 28, 2026 at 3:45=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Hi Anirudh,
>
> On Fri Nov 27, 2026 at 1:27 PM CST, Anirudh Srinivasan wrote:
> > Hi Junhui,
> >
> > On Fri, Sep 18, 2026 at 12:29:38AM +0800, Junhui Liu wrote:
> >> The K3 implements separate ACLINT MSWI, MTIMER and SSWI devices. The
> >> existing CLINT node at 0xe081c000 incorrectly describes the SSWI
> >> register space in the non-secure window as a legacy CLINT.
> >>
> >> The ACLINT register space is mapped at two base addresses: a secure
> >> window at 0xf1810000 and a non-secure window at 0xe0810000. The
> >> secure window exposes all three components, while the non-secure
> >> window only exposes SSWI; the MSWI and MTIMER offsets are reserved
> >> there. Moreover, depending on the eFuse configuration, the non-secure
> >> window may be entirely inaccessible, whereas the secure window is
> >> always available.
> >>
> >> Replace the CLINT node with the three ACLINT devices, all using
> >> secure-window addresses: MSWI and MTIMER for machine-level firmware
> >> such as OpenSBI, and SSWI for supervisor software interrupts.
> >>
> >> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3=
 SoC")
> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> ---
> >>  arch/riscv/boot/dts/spacemit/k3.dtsi | 43 +++++++++++++++++++++++++--=
---------
> >>  1 file changed, 30 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dt=
s/spacemit/k3.dtsi
> >> index c3f2dce0969c..74831974435e 100644
> >> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> >> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> >> @@ -1261,19 +1261,6 @@ saplic: interrupt-controller@e0804000 {
> >>                      riscv,num-sources =3D <512>;
> >>              };
> >>
> >> -            clint: timer@e081c000 {
> >> -                    compatible =3D "spacemit,k3-clint", "sifive,clint=
0";
> >> -                    reg =3D <0x0 0xe081c000 0x0 0x4000>;
> >> -                    interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_in=
tc 7>,
> >> -                                          <&cpu1_intc 3>, <&cpu1_intc=
 7>,
> >> -                                          <&cpu2_intc 3>, <&cpu2_intc=
 7>,
> >> -                                          <&cpu3_intc 3>, <&cpu3_intc=
 7>,
> >> -                                          <&cpu4_intc 3>, <&cpu4_intc=
 7>,
> >> -                                          <&cpu5_intc 3>, <&cpu5_intc=
 7>,
> >> -                                          <&cpu6_intc 3>, <&cpu6_intc=
 7>,
> >> -                                          <&cpu7_intc 3>, <&cpu7_intc=
 7>;
> >> -            };
> >> -
> >>              /* sec_i2c3: 0xf0614000, not available from Linux */
> >>
> >>              mimsic: interrupt-controller@f1000000 {
> >> @@ -1305,5 +1292,35 @@ maplic: interrupt-controller@f1800000 {
> >>                      riscv,num-sources =3D <512>;
> >>                      status =3D "reserved";
> >>              };
> >> +
> >> +            aclint_mswi: interrupt-controller@f1810000 {
> >> +                    compatible =3D "spacemit,k3-aclint-mswi";
> >> +                    reg =3D <0x0 0xf1810000 0x0 0x4000>;
> >> +                    interrupts-extended =3D <&cpu0_intc 3>, <&cpu1_in=
tc 3>,
> >> +                                          <&cpu2_intc 3>, <&cpu3_intc=
 3>,
> >> +                                          <&cpu4_intc 3>, <&cpu5_intc=
 3>,
> >> +                                          <&cpu6_intc 3>, <&cpu7_intc=
 3>;
> >> +            };
> >> +
> >> +            aclint_mtimer: timer@f1814000 {
> >> +                    compatible =3D "spacemit,k3-aclint-mtimer";
> >
> > I think you'll need to also include the "riscv,aclint-mtimer" compatibl=
e
> > here so that this DT can be used with upstream OpenSBI. OpenSBI doesn't
> > include the spacemit specific compatible. OpenSBI boot prints this
> > currently.
> >
> > Platform Timer Device       : --- @ 0Hz
> >
>
> Currently, "riscv,aclint-mtimer" is not part of an upstream Linux
> binding, so I don't think we should add it to the K3 DTS yet.
>
> Your colleagues at Tenstorrent proposed adding this compatible in v3
> of the Atlantis series [1], but it was dropped from v4. The v4
> changelog says that the binding will be submitted separately [2].
>
> If the binding is accepted, we can then add the generic compatible
> to the K3 DTS. Otherwise, OpenSBI will need to add support for the
> K3-specific compatible.
>
> [1] https://lore.kernel.org/linux-riscv/20261109051050.105623-5-joel@jms.=
id.au/
> [2] https://lore.kernel.org/linux-riscv/20261127061432.17306-1-joel@jms.i=
d.au/

Sorry, didn't realize that this was the reason. Lets get it added once
the fixed binding is in.

>
> Best regards,
> Junhui Liu
>
> >> +                    reg =3D <0x0 0xf1814000 0x0 0x8000>;
> >> +                    reg-names =3D "mtimecmp";
> >> +                    interrupts-extended =3D <&cpu0_intc 7>, <&cpu1_in=
tc 7>,
> >> +                                          <&cpu2_intc 7>, <&cpu3_intc=
 7>,
> >> +                                          <&cpu4_intc 7>, <&cpu5_intc=
 7>,
> >> +                                          <&cpu6_intc 7>, <&cpu7_intc=
 7>;
> >> +            };
> >
> >
> > Regards
> > Anirudh Srinivasan
>
