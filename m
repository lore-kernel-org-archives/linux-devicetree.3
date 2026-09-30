Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1354F0538
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 14:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779076; cv=pass; b=F16LXFZF63YyUOq0lgUmnzoSEIb2sa04fu2vL1/EjaZLWRy+8Qq06KsaCm57igUAPVytew1Vok0NCU4Z18HWTGZNkyC42NAaHhacc7XefQbZP9HS2foRIDObZfbJc+7JFVkdVvH5X2dQcz2i1DibqupmEjcJMAeNM0B+MsaHdds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779076; c=relaxed/simple;
	bh=yCAyZIF61tRxPw74wJRZpA4stMyF4VxjFKJbseRE7ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twadwOVFYDkEEKO4wtdK4cVNDuLSBsLxX23nc36Zs7/oD/I5cpMg7DVtXn0Lz5vPS3CHSrbrvu6Pf4zEHVWYJQikiIl5eRxiDgbT+4U0jPS0yoU1R4vNRiUpayscowk4jXeLVP/zF1R+hnoUP9sWu8o0oObUi6pTRYMaIJ6vBmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mp9XhkyO; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mp9XhkyO"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-982838c4cccso1335035241.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790779064; cv=none;
        d=google.com; s=arc-20260327;
        b=H2K01r6VM2BYngHMEAYGZFATn/cuwkKRXCjViuHCF8x41exY2+5GXm4NmKi3tu4sOI
         MkMoD+P9kGUbkFSG94yvaTTWaCaFk94yyktL+KrGSXEXD80lHmu/duNk9os2QJHG6x5I
         8MEu4v2IKahVkCq91JmwBXebWZLGKlRJb5/K7t7Wstn1qhwLFv7MUXE9u9DsQTwm0+YK
         5KdWnfW9MrOyGQhiv3HuVD+1+frZ4hSwmdfGN3ZxNqMm6FGbyg50RhS3utKR+KkbAREq
         9Bs37gjnpG2z6lItgR5o/h7K9Vd4Uu55lYLxfVXRBbFq+yX9BDe1M7YDEtWODPCCzqj/
         Vrkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrGL1nV8lb3cnBxKMQABXnqttgXw91NKIu4eAmXKFA4=;
        fh=XMoRpepQ86F5VuYd+dOak3ScQQ5W8qOpgqtwqowms40=;
        b=VEKLXEyuaHz2/5Fs2NHWF8qdVM5ygbRzZdcB3d3eqk8mqKsNP0GdQnxjLwGpjfVDmF
         uQe6BjrSucwIyY2kjWnYOybB+sjfhulR7Q7yRVond2TvRCp4FgBvm7KNKAYPCa9nS7Jc
         F5/yTLq4nO3cy5PF075g+kmjp9aTAjnfIrV0ZSUhck7X4Bf6HUkyikLi0h0jcTFydGBM
         IwhU6LCxLbZZSYq6OCwjAmvuMewnCoA2HAblLydf7/L/eyR+ui/JzopI+jgxdgXpshZJ
         iIEMYKGZRH0UuzwmYiWm1ZDoh98sAAHH980ueixuXFlHFKqgMky0fm7wSNhx0+hb+jf9
         ZvwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790779064; x=1791383864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nrGL1nV8lb3cnBxKMQABXnqttgXw91NKIu4eAmXKFA4=;
        b=mp9XhkyO+RN+vkaqNmSpMxG614UzUlWDev41gf1YjQsydwbIP2fO4b3bgX+mSqdrcg
         gncepiS3nHnGzO1DJgX93xxYfwYofz7mPOxJgvFH3KNe0v9Va4sWuHNL3OVeCgiGzs9g
         8d711I3bZ0sX+jy4rSka1wsRmOcdlcQK4w7IOCW5lci6KV90ktwFbFEF/wY3g/sp1Jx3
         P2cCKxwJ0b2eiG6VnxXgyJpB2B7D/xrSpeGU19QqR7G7I59ai/zDpSGezWrwIb0Nc5xl
         tBAsbeHiLiTAFO5V3tOjj48XlqiWMkG0JIG65fEkZZ7kd0glDaUW3Tn88DDV3FFMT9+T
         2Zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779064; x=1791383864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrGL1nV8lb3cnBxKMQABXnqttgXw91NKIu4eAmXKFA4=;
        b=Fj/Cm8awigRG10fnGm9zDrYTlEyM4ut/OCrkDN0fmHbHyK5e+BX6UQHnnKY31XFd8v
         VX9/m/HIy94ldyHxwSSxrVUq8xKOCc9Hx1ZvW5ohw/A/fis4DiwfVlct9ZpkxOAKdjje
         Qfq8Y1wGbxRKBjLMqmZXoQGExajhCUFScZw7a9CUKAYqeAPbPszZOBqYUrSl8VbwN2iA
         1FD+z3+jXNhnvCAwIVMVEO0DYPg8+SWYErpUGQCUSj3tOYCgB381XxdN2vJszKmtCa3d
         80hUFRQOwKTsM6qYVD0KGJKFwkjyQg1d+wmobNBrQVhTXOdUUMEAGdi4+KXL3o9K8lo1
         UncQ==
X-Forwarded-Encrypted: i=1; AKwUvBxC15YdrQBLzRAu7BZjXVJR7udjo9nRdVCleWS5vBMZpj201lNe+1QU6YO7QmW22yIIjBOnIV3euW/U@vger.kernel.org
X-Gm-Message-State: AFq9FYIeZSjGSYr8U4/nuFHCCkf0XLHWbPzx1Mg0cjT9uAKLFbDPVui8
	yDCXgMvmzSrR4pnQJkZhDkeMA3hi+pYMUL8mcu2WHFebvf1f1/n5y3f/vuzG3XVvPYCDxJvpoN2
	QxFIsRRjllX5wzBFV7LHb+n4GR7Rkh1g=
X-Gm-Gg: AYBFou3+FNB2OMo2T8IKOz583yhiCSWR8h8LnQaf6QahuIYyvlVc96/XS3jI7peP5uD
	33QsHDGmne82YC+3M30plHvCkXRgME++C5aVRXwC10yJPpTorsOYz3KWAKCr/DesZTiYpu5FlCT
	+qpU3iXLB+YqPOZqcJS0F5t6ZwsvX76WqNpkFArK6EK6rKebJuK6nrkUmS5uO2dm1W0mLh/yNnC
	N4nRjVqxKLr7CiG9Whq0XGESLv6p159HKWweZlTa8HNowfUGynO8B/cHV7qeK1LAbHvXReGy6Aw
	zxLC1NLRu9kIk9A0Ri7P4X0i6LiVpqSMdQTbeAgXh8Gb5LBZsltjewbbltgv/e8MdaZ5KqYW7bA
	MPHkUf0FKYPH0zkkV3kqS
X-Received: by 2002:a67:f318:0:b0:7b7:39ec:51d5 with SMTP id
 ada2fe7eead31-7be72eacee4mr262776137.24.1790779063510; Wed, 30 Sep 2026
 07:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn> <20260930-bulky-miraculous-rattlesnake-b58357@quoll>
In-Reply-To: <20260930-bulky-miraculous-rattlesnake-b58357@quoll>
From: Han Gao <rabenda.cn@gmail.com>
Date: Wed, 30 Sep 2026 22:37:28 +0800
X-Gm-Features: AclHuK8xJHH-GchuoPDOK3EtJJuoEe-0ukOfyhbCCKAHr55R9addDARC_M8Pukk
Message-ID: <CAAT7Ki90CLoWwauNDShNFt4LS+3+nC-6tV1UqwAJP=KD0E56pQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: riscv: thead: add Milk-V Meles
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 7:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Sep 29, 2026 at 06:22:45PM +0800, Han Gao wrote:
> > Document the Milk-V Meles board compatible with the TH1520 fallback.
> >
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  Documentation/devicetree/bindings/riscv/thead.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Docum=
entation/devicetree/bindings/riscv/thead.yaml
> > index 301912dcd290e60f816d380152591106de9415b4..5361021b8dcc9897803a591=
5665c6bb83309fe53 100644
> > --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> > @@ -21,6 +21,10 @@ properties:
> >          items:
> >            - const: beagle,beaglev-ahead
> >            - const: thead,th1520
> > +      - description: Milk-V Meles single board computer
> > +        items:
> > +          - const: milkv,meles
>
> Why isn't this enum with the previous entry?

Merging will result in the loss of SBC manufacturer information.
Milk-V is an independent manufacturer.

Thanks,
Han

>
> Best regards,
> Krzysztof
>
