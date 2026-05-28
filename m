Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E077F343895
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 05:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945534; cv=pass; b=jxljtWz8pbpC/s2lfEB3WnazuQ6j4Krfnt1TjWnlID7nyOyFxxqyGNhfLTJedqWqPAJND1ZMxuHEH2AqmWwPjClXAl/DDlH5CDP/UElGe3urbuEldWqIh7P77SfJLXkYn39DtP+vbZs2soFEAxMgZDZvEwV+PzMCigMRlIbVzV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945534; c=relaxed/simple;
	bh=K5J/i9QQFjNtTNEst0+r2fQ7v/Sikc7WovZzz3fcli8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTf0LdYeP30owUJMNRhGYiOawLu5qyCJrgGGdxmiF3Fso6yfaVe6p1eXED5WQdUSHPgUwzbhUFMMKChvwgdU0M4qHZVuEtVh7HMg417kz34yfjqtELaR2OCkDG2v4FhTqbQoc+sWPPN9EmSX9T9LiNj5yvAWd2ai7fSXMTwPAxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=oH4VpJSb; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="oH4VpJSb"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7bdec52f48dso115900527b3.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 22:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779945531; cv=none;
        d=google.com; s=arc-20240605;
        b=OxU24pe+XEbuhuICKzAcTQX5u86ngBRjSZOSo9eSlzgmaCDQVdzpT9cWSHKWyq/4E2
         hnYVQ8EKc+24IT/1zGUr6BM8VTD4Ozp5OUdRQwIOifQ3hFMQNjw/GnL4bFwoDTXGA8BN
         XLB9BLfzSBP0STMAuJQxf72fJGNplOQ+r+vlQJlF8S3mxZhhGzNyUzXEK8es7/S9YspI
         9jPiAsSPVmrlGWQl6wY6cCe935vCOuFjhqtKEh8lOJZ5CFGxhQWdPqSj6MLY4K47zdkW
         Ka32BIGYpclYUyyPNct3DW7WG9HYQBoQXTtit0/yEAmzTDLwfW04o3keFN0uM8gE3L//
         qCPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WTNofcIOZbXjLpaLD+DL3cOLpKPj2wtfgJ0EVk0XvKg=;
        fh=Xmp9HApiOhTvbjVSf1wP4vr7eCo6iCDG7V4ghupuKnk=;
        b=kEaURE0/qCoQjyV5WJlyU7onZymk+eFIq3gGMERFwpe6qCm7OIjbZX4/K7kB4LfBjB
         Omo8RYWx+WSGF6qsEo0qGE5LlKfR3fD39jwGv0cmaXVx4p986ml2XrCOynMYif3wTVOF
         orE1wFNX5Iuve2WpUlWXqZg4uqX9MqlPFZDO6jWxqrYLg6LxX0V2PO80CqdK1x3/PLgI
         BwK5HzdZa1dI//XtOSodlJzeu6wsQUowjULn25L+UGsVx6Et0EoHXU4QpyEUvoQT6ekn
         Q94cXr9HOC7CxlejGIcGT11KXx5Kyp/RwpV+bysAOu+UWvWptcp9gGDRCujkUw4jAShV
         XhGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1779945531; x=1780550331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTNofcIOZbXjLpaLD+DL3cOLpKPj2wtfgJ0EVk0XvKg=;
        b=oH4VpJSbPKV8/SDAYvxsAx/Aha1W/8u3qLB3EoKP+Sht1Z2lCS9SJWaQurC0raa6yL
         8z/kK/VEdPYUorpu/aIMN42kLGGNtLjtWntHtyUMbgdZXXgiFaHtvD5csyzoZ28CHKuA
         A5Qms9VM0eAVkXygxCtiGsygmssK+0jbBG3f9J6W2Di8FduV4kU+wUB4DjoNx2jU2VDr
         ioLqXpG0jp+Ni2eir8g1YGzAV5M7eqtF3faOnz4bIq5byZWsMmakzFIkZiJQbdlAwZeK
         4d/nvidQyvtoZZOuNl861blniiNkjUn6j2V+xGAy++V3fzxiHkipFLBkWFx0zUyteQdJ
         Nkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779945531; x=1780550331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WTNofcIOZbXjLpaLD+DL3cOLpKPj2wtfgJ0EVk0XvKg=;
        b=W2Lo8ce2jKYnLBgm3A6gUN2tCTtgEuc6qR2xPOmL2gdLH6Un2TCzCBSfa2MS6kv6l8
         9XitDeodzXXKKjBmPCXOe/DI5rpllArqwn9L6hYCLL7f3WWUuIIEQTmNdLH/hv4dfOeh
         mFxhoLn9TVw5/oxGoUgnwuVZItddeK1+zUfYoKYdC99bwQ5g5NODrG1RQiilG1rA4yNI
         bGe5uDAwztFg30XpQrE1z2fPkaaH/hGMsMnN4dAtXUbjVRppnkjQxIbZFuNba34bqJ4O
         ymR+JCY4HUTC0BqHSFt9lrH5qgculWJ+I/tr2MzepziXg/2PbMtu7tbllC/S7IBKtGcU
         DrEA==
X-Gm-Message-State: AOJu0YwWj88DTd65XsrlCAVUUhOO0Td9EJTQIfWHtLpec7GuNBEmmc4v
	owXdvDbyVFuQ7lGlI4UO7ffPyGyyn3HP5BJoEVYVvyk31a8/W1HWOSR6jP18TJ810rZ5nC5tB99
	MfBofgp6AVvqTqNoYfQtqbZKnmhL6DOShj5JdNuwmeg==
X-Gm-Gg: Acq92OGZ3aKg2uJe2BOIBc/K5Ns3R0ogkHLQE/QMte+Equ9Slzy23FECJ32AVzof9m8
	DFCOC2uHr9Gcezsl4GmcjZoHGE+DEm5ygDse8qbq5t27lJ1fvZWjTnm/3FLs3UaulwrxhlwboeL
	m8W0SZo7mXfLGk+Zc/hGKVuwmnBILqQcUuhT9k56YS5F1FHZmHCXDpZNu4eP7ARgiKJ1OBazydQ
	ckTCrp4dDEEalsxQ7O74Wg/mFCN5Z48eb/4sAtsob+3j414frSBWHNnhvnQ5FF8DYQUeF+H8X/n
	G2ySIMUFVhOrdeftY1988lwcP4bPyww7b2xTNgbwBUrMQ6ssvbt3ffa8MCJO51f5no4GUFXsuAc
	Fwg==
X-Received: by 2002:a05:690e:1181:b0:654:6450:19f7 with SMTP id
 956f58d0204a3-6604471b0bdmr104584d50.0.1779945530981; Wed, 27 May 2026
 22:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
In-Reply-To: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 28 May 2026 13:18:39 +0800
X-Gm-Features: AVHnY4KOywjUf4xyXWLMCKeI0N-wdBoPItg6KtOmuhSwAAW2j9qgS8Kea3oyUX8
Message-ID: <CAH1PCMa_RJ0NVNyxkqsXPfrF4tz_69ZbWeqkh8xRCu7bLDkr-A@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100 cores
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Guodong Xu <docularxu@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 3:23=E2=80=AFPM Guodong Xu <guodong@riscstar.com> w=
rote:
>
> Add the Ziccrse ISA extension to all eight X100 cores. Ziccrse
> provides a forward progress guarantee on LR/SC sequences in main
> memory regions with cacheability and coherence PMAs.
>
> The SpacemiT X100 core supports it per the SpacemiT K3 hardware
> specification.

For the record, I have tested this change on SpacemiT K3 Pico-ITX.

The stress test is run by enabling CONFIG_LOCK_TORTURE_TEST=3Dy then
boots the kernel with:

  locktorture.torture_type=3Dspin_lock locktorture.nwriters_stress=3D16

driving all 8 harts. It survived sustained torture [ran for ~10 minutes]
with 0 Fail.

... ...
[  735.588947] torture_spin_lock_write_delay: delay =3D 25 jiffies.
[  738.015096] torture_spin_lock_write_delay: delay =3D 25 jiffies.
[  739.204713] torture_spin_lock_write_delay: delay =3D 25 jiffies.
[  741.195211] Writes:  Total: 714319420  Max/Min: 45946599/43679876   Fail=
: 0

Thanks,
Guodong / docularxu
docularxu@outlook.com

>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
