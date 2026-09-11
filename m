Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9DA43F8D9
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128536; cv=pass; b=p8XAKp9uhrfpQ4TvuQMtA79xK2jZrrhJ8VJQuqXp5yRZpO3lu1dorMRonvGoF6Rft3kOHzKikxz+IWwAwPmdrpoQC/3YQSbHpnoI4iO9u5IjnQlnbrdYfA9b7a92BFtFsHDK9M4bdsibpvNrQ5VLd2g1sNc+RzrcTEJNx7xQ+zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128536; c=relaxed/simple;
	bh=Wmo70Z4UFocZYeFKwLQnXi18nLpqHlJJiS4uZANg4Tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+Uz37iruSuIILgK8UM34lXz1/tW0wP/mOt7FCIKyoRF3bKJX1dyqup7PujPyLF52c8Q3w59aCy+ZNLZ6QAF+KiM8PS1MazE8ljbQ9FTDI9JowEaQnonddwXqlUpTKyD7mNJhZp8qBpRpTahjj56+hyRuFuaOHx4WRDUBYVnng8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nib5DIgK; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nib5DIgK"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so500898f8f.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789128532; cv=none;
        d=google.com; s=arc-20260327;
        b=YIVopWETWfzdmiF75QzfFN8Vz0bHTn8u7sMCgksa6cG6UaCmnthXIA6xwllw3KMsaw
         ArSAYaGMLd3kICJV7ehg/Reb4XxcOJbq0xBx8ZHlJG2YGwWPdSGKlPCK65VpCzJ95qLO
         rZlsJPJBesGbGLf6AjG79SmuB0fzWlkv5fIpEPhqRf2KPRo39ZwHJrNKuaXd0GltTA7k
         Ff8s/nhnGwWvcRj7MIpPySTmvRQ6KTLVIYT3mLTohw8UrnHmhEQFpJDmBM/cx2t+w9xT
         Fllof7EvE3Jb7YEMt+/nUFWg556cQq+m/Pm+HS+5ix9f3bgmCAu1nx6b+GJZkUMwYi9Z
         zwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BPsynQVkg6+ImOI5Ts+zsO7EhceaQ1Rk9XjAnwab6s0=;
        fh=vSgiMh8ofMlk/Fma1GomkDDHdCOS6A1Bwmnv9NdEo6E=;
        b=fB3fm7/FCnipunDlsOXLGD98YcIlKmvnyRRAH+8mUqvBL3wz/Sj/VCZaweWEvB6B4Z
         Wa3NuEf0bI0H+86FCNkLBbTdvmqBjd6V7naOjd7EKbuH5+u3Kil0YTkAtf33xcUJsEno
         o6fDw3sae914v7pHGcdsfQfx2Ik/4RHWPHTmoIUL6Wym/RxgMCFoHyA3+eeRs9c2uN/I
         idcstA2jXb6vwf+2+D3KZYfUuUnXkYMUTZhDS0D4+dlKvCWLEzccM5m7SnpJK7jogV7N
         MtGZglo5j/JKXeIpNx+zPnnZ/QYwM7zGtl5dUXXT0E/lGPDQxNoHaoS0LhujfKvUzN14
         iU/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128532; x=1789733332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BPsynQVkg6+ImOI5Ts+zsO7EhceaQ1Rk9XjAnwab6s0=;
        b=nib5DIgK/xinL14VkYrNajaEI/6NEt5Tj1uIsC22pegDGMGsbxNy5chXjsVaxwTbRr
         xqG05yY0OD77sY0Hvv4DfMVkYYoJ9M/pwYQq9AaeporqY/FHTXvBDQUUui5LYxWCfFNR
         AYNCFlUP5Nkq2bQ+UD7RQOg73YTyaGndFiWTiRj1FUzOFYqKiyJWW4V78NvfqK4kOQ7c
         O09C0R8kp79ZvipCujz4FE4CnF/g0xYF5cxgOryDR5nzKRB6Jw90I2PSvMTYai2L7KEp
         41jroZu8PDo246om+zZBaRT6Vi1LK543iQpYWXzVsmu787d/PbTQP9EyANN/Yw98QS6P
         6hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128532; x=1789733332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPsynQVkg6+ImOI5Ts+zsO7EhceaQ1Rk9XjAnwab6s0=;
        b=NIp6gGCicsT7G1IowC/oou1A7r0jY1xF6laxHunKSIBS/LyserA8FAF/BRCLlDICL+
         qNU6YiY5lvR/LC2f9ix8VMvw0PYARbTgUvgGnr/6ZRzszn6SWwzX4rrSqamq6aPtHNBo
         bh/55vQdFJHpl2qL/1mCd953k3C7hk88NWcDFqdrkbyeuR2Hrl8JDd6ci71vXYltes6F
         yuZjcKbr4QyF4n7DKapBQ32h9Plv5e+6TRGM7Uk5DiWeKR6/MKPgkeR+rqVxgVztXe9n
         WAnbkdMFwgCtqy806dZPnVXtugP/xrD/CXXKB55GdBF/MCHrS8nAjbizKaHQiIOrhE5p
         zm3A==
X-Forwarded-Encrypted: i=1; AKwUvBzzXZ8yI+XxEb/7p755sezRE6Ksh2S/92YEEpcIKseJB5udoC6DenVBHXD5+eibnp0TYEuve7M26hK+@vger.kernel.org
X-Gm-Message-State: AFuF++kmasoGZLmu4kTsRtqGHLGmeqsZRqcuOkIwxf5/XUe8tiUVo5D4
	SgX+6PCfC/Gn/BBszGexkMv0R1r4s/qahRwIfj/9vhCP/jihAj29NM8PgSrVziLDDc9/l5p8756
	8Gm9nCBlf24KnVPQOGr/wnV6eBK3T2rCztu7iLkKD3Q==
X-Gm-Gg: AYBFou1+wGmsAx6+57FAkM3cv7F4MmZVkXZP8XEwNxwpenzkBoDhKMciSPjMJ+neEVK
	AKy/e8aBNP3WjhXAkYGAcEZLTLRrTHuXQ9T1kIRv7Ia2k3Z+dNydotFBXfz7i5sY7lixJC1rLjS
	vRr2eF1nnfd2rDT2M8e28VrP4DWLjzL1YBf8TigJhSfnlna80+mk8sHwXs23RiPY0UWLdv/KqNO
	R5mDm86vTP/2sjRMI384zsnv3Z/X3/TaMZ/b6422uMqm7103kiXBxbrgpCGOV4LWd7dmrWvsztv
	61gMH+7pVoli1tVx9vd5d2KxC3h7jAxcwfQYXsxthnPQMoMz2ossiLdNa6cR1lAzpYsIf8+c9D4
	4wf4SoOURUIijk5lkRsB+L3LM1TnR8SL0I17yAsCXM6Hyfb3mqA33rTLDD7nlnjgVPgs3WauQrA
	==
X-Received: by 2002:a5d:64ea:0:b0:486:e91d:9f99 with SMTP id
 ffacd0b85a97d-486eb2e40c3mr8765403f8f.10.1789128532269; Fri, 11 Sep 2026
 05:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260911111731.3404308-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260911113216.3810F1F00893@smtp.kernel.org>
In-Reply-To: <20260911113216.3810F1F00893@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Sep 2026 13:08:25 +0100
X-Gm-Features: AcwNN1WzhLhKvgeum0uiJ1v9nMlDLxD4oK7UJnbzkS0PJFF9qRryrARMqpujyiM
Message-ID: <CA+V-a8tHoShO+NXrsYaOvW3C68khLY=+S8xpyKRjOvo757LO2A@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] arm64: dts: renesas: r9a09g077: Use CPG/MSSR
 syscon for WDTDCR access
To: sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Fri, Sep 11, 2026 at 12:32=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The transition to using a syscon regmap for WDTDCR access is bro=
ken, preventing the watchdog from probing and containing an out-of-bounds r=
egmap access flaw.
> --
>
> commit 0e87a2089f722e3ac7bcab46cff76d445536d9fd
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR a=
ccess
>
> This patch replaces the direct mapping of individual WDTDCR registers for
> watchdogs wdt0-wdt5 with a new "renesas,sysc" phandle property pointing
> to the CPG/MSSR block. The watchdog driver is expected to use a unified
> syscon regmap interface for these accesses.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a09g077.dtsi
> > index 40494159831d8..ad5189d55cef2 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > @@ -327,61 +327,61 @@ channel1 {
> >
> >               wdt0: watchdog@80082000 {
> >                       compatible =3D "renesas,r9a09g077-wdt";
> > -                     reg =3D <0 0x80082000 0 0x400>,
> > -                           <0 0x81295100 0 0x04>;
> > +                     reg =3D <0 0x80082000 0 0x400>;
> >                       clocks =3D <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
> >                       clock-names =3D "pclk";
> >                       power-domains =3D <&cpg>;
> > +                     renesas,sysc =3D <&cpg 0>;
>
> [Severity: High]
> Does this node successfully acquire a syscon regmap from the cpg node?
>
> The cpg node lacks the "syscon" compatible string in its definition:
>
>                 cpg: clock-controller@80280000 {
>                         compatible =3D "renesas,r9a09g077-cpg-mssr";
>                         reg =3D <0 0x80280000 0 0x10000>,
>                               <0 0x81280000 0 0x10000>;
>                         ...
>                 };
>
> Without the "syscon" compatible string, syscon_node_to_regmap() will retu=
rn
> -EPROBE_DEFER indefinitely, preventing the watchdog driver from probing.
>
> Furthermore, will the generic syscon regmap allow access to the WDTDCR
> registers in the second memory region?
>
> The generic syscon framework only maps the first reg resource region, whi=
ch
> the cpg node defines as 0x10000 bytes. The watchdog driver calculates a
> WDTDCR offset of 0x15100 via:
>
> drivers/watchdog/rzv2h_wdt.c:RZT2H_SYS_BLOCK1()
> #define RZT2H_SYS_BLOCK1(n)     (BIT(16) | (0x5100 + (n) * 4))
>
> This offset exceeds the max_register limit (0xFFFC) of the generic syscon
> regmap. When rzt2h_wdt_wdtdcr_count_stop() passes this offset to
> regmap_set_bits(), the regmap core will reject the write with -EINVAL.
>
The syscon is registered in the CPG driver and the issue reported is a
false positive.

Cheers,
Prabhakar
