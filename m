Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795426313;
	b=ZNNhb5YeMhj957lDk1aBdOZxoUU9A5dljzgWHnOT6J5P8djPkYi9G0AnbQJi7okDg1Hj
	 5bIKERRtu/XliklZGfft8wtP/lONjqyPuChkkOi5Fsw150FICkuVnLXm3JMjo5drO0ePj
	 KSjeO7DjjRPZdkDxUfX/R2UwRu24i00w53jeOeRzJpB/semtyDsEfelbl/DS8p31IC/ek
	 3wXiSyCzTfWZOR+Ok91HDkFtX1rtXvbMYT2htyCvjDfUZ6cynHB9rxwCbg57K+QZb4wYF
	 nhSVKBrwBLywhyEboDN3joW+YjfRT1yh1cMkZ+SM5dNlAPQiEQRY+KsbVFYLtjHY9Kg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sA6A+HVLCaq1WHRrrdPMSMYH1omsgOJBkasA2HvpXv0=;
	b=iSg80upXhfVru3hnoc7BGKyveRX4EDPV/8BQ+/MrnwW+lCn2XLWBvHKJ7khoyVCTMEVS
	 SOT8YJYR2Abgm4xWhD6bt6nDmai1ZH+cIs24YmDgFV6j0flNXYDLhS9a8slMitMPQKPhZ
	 UQvQKKZPBUJ4YWc24DvyPQiFYH0ApC1SJwwVgxYCvK7AzbY3d2v7+iVPlBGR4jaEHssK6
	 j1Qi5uwVs3ONPQU+LHq3nNmZ0LgpA8YC16NXVXWaG6Qz7iG89tW0CIPuLGImBCqY0Kqmp
	 A1VRz2QkpTSIV1H/NnkgvW2wP5QG+z1VyTAhe3ndE26BarHFrIyhTq+K8qHaS1GuVdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7MPJj+N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5BC606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D5BC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7MPJj+N
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67c24619b19so2279904d50.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795426312; cv=none;
        d=google.com; s=arc-20260327;
        b=d1D36qq+kOLKQEWsmtemb/xpmibLFJaOeKaGNnM1PAorGasG0Cb0zjYv0CSUG8oycr
         aWuPD357vR8R4GVaF2UtxoKqcfG0lJoFwyQS9y48ClTe1lmLE+MGwRRYeT5Zox1nopEF
         z7MG3DEAucToC7YmMtkVQy/f72rEnn2Kmi20xjHT2qqkgC5pS0nCn+pJYfZkErmvLrQK
         mZRo0+uUk1GR5fqwXKR7OL+NgURcmuIWGdY/309zr5NtVrPLLaM9E/8x3dsKTBjOmYtG
         LI/+TGUkIS8ltF8Z53c0VPnszTDgOb8fhjD3hv+UoFCRGW55LZUpmah5iI2LNo4iCDuP
         PQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sA6A+HVLCaq1WHRrrdPMSMYH1omsgOJBkasA2HvpXv0=;
        fh=hrCKHW31akvNDKNcoJVpsWSQOTSqwgKzSLhMdr3QMNI=;
        b=U4quR9KrwkgMzJbeyohKi9mA4MEhxPG8c28MzwJZcBzwC5xC198/ZUnCXQZUPdzl22
         NWIclIu6yXRCciRi65bL1vXCHzcHUW5IHR2HhpjOE7X8vpaKy+nIxIZEeeTe8SqPeCV3
         PeHEfLjm1fk/Qq9ZJpcmsFlG7d52y9jvMKFkVdqG2uMRs+9LoltVh3Z+vyRqJziVLyHI
         7BquVgbF69TdbiX1nospZLl4jPe5HCbvvH0lkS3/hAqzmyF9hUw4tnVLkqcBjv6CLLXj
         EVguCQrQdnzHSMi5z3L/6A5QdNalBoB32PP+Gc2CkloFhvjPlUf6bTqNbecBJzW9bd1t
         s4/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795426312; x=1796031112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sA6A+HVLCaq1WHRrrdPMSMYH1omsgOJBkasA2HvpXv0=;
        b=f7MPJj+NtY97fe/TNdFmQRQ+ehXIA6C8YkM83rRQ3IeYxJX3qOe/lH5lYbc+J29V4i
         zoul3btWBn767LPYBnenMzcVsfsWOZGx7GadyaGVGYz+gn19PgnE8qCHX4x5sj2+WuJ+
         lS/fUzoauxfO6CfBMYC/vO7hfrm/Y+NYkeld2cOg6ZUPJgVaDXWNzW8RK2PHhCszZ961
         vTN3CpNTGRsZ/SgjRAtE2zUQFgAYmtzN3Luf4rPC2CwZX8xnK5CzZLITl3ZVfFhdh0EG
         HgZgLMeu0X8mcVPOmBxj9ku5mnVTa1s2S3xoO9RN0msF/QQENJggjg16YFFvsCcUPrCe
         8f2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426312; x=1796031112;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sA6A+HVLCaq1WHRrrdPMSMYH1omsgOJBkasA2HvpXv0=;
        b=ub7V+9T6uGCG1IL3ClcxMBa6KO/vGWlxC9LmUQPxdVIRzKiFHfnyCKnmrP0vjq6vFk
         w1RvPNTSa/KOsA9bmO08W2oXChIhEWh+TToX5lD+O/AMQhzEBKEmeeZ9k4hL3Oi6I4S7
         FGOFUzzOcissZq6mwzptjwGkPpZZVHCDtEl0DGLfhmllvbR340ytSM4l71UYWdRnGIBA
         1F3rlUci/v1nb5+O7bwNflIZOu3yUAcYg+HcUrPQnOoKuXpcOAQCl2aPTadiXUNJved7
         OpFr/19zA8LAxuR7b+jtYjYNmpxbWgpczbUZljnfULXlSsW9Iwkfxlr69r4PlKqIzXjE
         lInw==
X-Forwarded-Encrypted: i=1; AL+hErE6FJc2zgzijLmmJMO/piyjldxIlc+9U9D6ojVDgkC5O2fSwBt/m1J+ITUTey3k2fFlEwvUVYbQmGP9@vger.kernel.org
X-Gm-Message-State: APuU4Z+0eUz5UlvNTIlbhmqlQgk6lI9ywY/6Gg0z4+qbUrPdsZY1SXHW
	vR+CGCBNASDTymJb3zQcfdS7trnjhKHNE9bb+0EMJvuUUcLxJVUrfJ2zFISktnqfbhlFAfNsii1
	l0IQE45XS+Mv7yU6W4OjmIiN8mApfaHY=
X-Gm-Gg: AZFdTZeOpkj8OtuU1J4gZpR3OSH9fDeS53SzU1Krr/unsbhiUVA1z5qLuWyqDY7fjGy
	RRh2NbZTKjvhvgkoVch5Ss9/71FzRWlS+h0ww+4CRh0RX6MVuAdqQ7PMj8qYzMl29iNH3BFR0Ny
	Ijt0wfnS/wF69d94fyAGUFtVDl+cR0gPVMINaufZgtkeGvN1ArXO2I4Joityes372jVFmDLeLXz
	euNm6jEHPQHQFUiv5/+ogvONzqwvYofWDO3R2GZnnPipuWbm8LfMYKXtFP5mTfR684Ah6qVEaC7
	7Zy2RVoLFg9eEUL04d+HfZUriwYkTUTofp8qpjQvoL4Rj8dJnmrdxwmaPYEnwkcpO9HNZn+UeDX
	hcDzvdzqgk4fzxVsB07uwFgEvI+xiY7AbkYFg0Q==
X-Received: by 2002:a05:690e:438c:b0:67d:a6fc:6ba9 with SMTP id
 956f58d0204a3-67df4508943mr2085122d50.106.1795426312499; Mon, 23 Nov 2026
 01:31:52 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
 <20261121034053.39878-3-prasanth.padarthi10@gmail.com> <awQDxB-09pHSgfJ_@monoceros>
In-Reply-To: <awQDxB-09pHSgfJ_@monoceros>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 23 Nov 2026 15:01:41 +0530
X-Gm-Features: Aa3M54on3hjaWixdom-MZvFvoY_Ect6i0Ad8JpXIU33APeKTiBCUcj1JKRPJeMs
Message-ID: <CAMFFDGh=7CtLR5bOyzP0SuSXVaXY=5H2UajaFx6pcescqfYjYQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com, tan.siewert@9elements.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Uwe. I=E2=80=99ll drop the linux/mod_devicetable.h include in the n=
ext revision.

On Mon, Nov 23, 2026 at 2:45=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Sat, Nov 21, 2026 at 09:10:53AM +0530, Prasanth Kumar Padarthi wrote:
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/nvmem-provider.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/unaligned.h>
>
> <linux/platform_device.h> already provides of_device_id without all the
> dependencies that are implied by using <linux/mod_devicetable.h>. So
> please drop the latter.
>
> Best regards
> Uwe
