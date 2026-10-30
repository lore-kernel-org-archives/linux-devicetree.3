Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793365160;
	b=i6ngXccYCNQi4lY+z0MrCz3QXOT9N5KJfac+NEgqcg8rasw/QifJLYX/MT/buDi4gRdx
	 mA5JfAjnZVCWoUO7xc4Nqbyqn1hZNsIdfW6fjfRdR6dBXi5vHkSQoHGZBuja4JVZiODoT
	 1wZ5Mtr6BnCBadxF2QToor3L7g3g3d0AQe5GBOpsiZ6MxAf0imobBHTlETcJknC6J1HUB
	 Zci6bG7bMv24SxoQtaSCEStQUdmD7txt2PY4R1JpcVVUHUMnxS8blxtCB53iJH579G0lW
	 BunGce4g8FEPDRWC50ixF7tr88fGsHsHY0jzygRFXnKc7ygI2ZGxS+bOB7+A6+nxocQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3YyLSa3BTi1tUsUm+bl9FSELrR+28ROQxS5lQk/+if0=;
	b=gA9lnTdVGeETJqeCsY2iJ518HwYLP/Ep+Bd52+mvSXiGVBDPdut+qvBwYx3HL/MFgBRJ
	 Wlb/JItcJIErA+gKIuRl48W18VXMNDRIw/xuRmbnaWAi3jfISbTcXfKtyh9ufAUUi1MIX
	 aTbU8ZyE4OWxR9A+B6Opk6CJmloiKTNqXlaaj0u28ZYVEAgNn+A6cOIYNSyxy/RbT9d+D
	 qA4Upf72Eq570lLFYsMxEZZAyChhus1NLKGwns5vMxXefLCXpsyVv1hZVOkSLzrynpWZB
	 gBd1GGkNsgQWGq/kAeQ3JHM4R38a9+9vMMOJpLitG8mfAGMfAiszrisoSN99AmNKezA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W/eopmN0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5679606A322
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5679606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W/eopmN0
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-98301b325c4so115599241.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793365159; cv=none;
        d=google.com; s=arc-20260327;
        b=IY13fby3zTeaGPxhlvxRryxhpuF2E07gNT4GuYHkNuzFvk5zqlADpUJIMge2cT+07o
         uJgqQvDLZ1HgwwjIOqkLxAWw7joelA4KdC/q0YzGKGibIKWk9+szXEkfyIfFbuO3/0zG
         GGNbZLnSd01i2g5PmNpTif+zSdh0NPEeyAb+plHhvz1XE6C914ET4eUghGh2b4B7tYI+
         fYhI/FG905xoloXEjZvPAAv0bEJ/2niRn1uxSVe7jwPYuB9THa3qpZpnIcC8jgwdnmSE
         jjJLnKIWNvyMfzgqC05Niu2zpKkutnSPw6K3xN+zIf8jhiOg1Vx/d4yg8bxj0/XQUSmT
         K+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3YyLSa3BTi1tUsUm+bl9FSELrR+28ROQxS5lQk/+if0=;
        fh=7G40OK96NdW1LufV+yKOMQEgMZkiCiu5y4meWn14N0Q=;
        b=SFpF3LNbQzgo1GgmpGS0IZJuce2y1HpVBuCTWSC5xMwBBYXbHRtOZicmL4vMe6M73M
         Y8q9ruklAmtoSM41uYP5HNhE6aPNa3SF+EWq3O0TD8SB6Ipnd8MOzSH9lM1bDoivnsXq
         VihXFt4vLEMPoBrNGm1rJmTnsD7X7u8ZWb6PhTpXXY79KlzaaAo8UvNQYNWuYGIM31ml
         tiBIiMrvuw2SixoOTcJHVUMDEzxpJBoPN9x/w+r24MQt6/qXcdQQmnHAGu8RoKxB+Ahh
         rRaFL7FLjZ9OSHpdwd3WFTgrNrTNpcLjDlpUtweWxzvTNr2Qwa3dTnDSiBXDk0xmLits
         0NOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793365159; x=1793969959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3YyLSa3BTi1tUsUm+bl9FSELrR+28ROQxS5lQk/+if0=;
        b=W/eopmN0/8eu/a5EWlMaByItXK4CEaOetZkMU4Hx87N+4Rtw4Dtklh+qG1Ex1Tq4+c
         XSbZeBReBjacNSLX7eGaaBMis0jSZC0P7jw1wNjHlVDU0gsfJ+eboUFRd6/Iwz5RGCu7
         tdxAeX+Ayvbl7288FOanSmEJmMiIo8zMcfi1SFg76XzrSqz3ULj4odIeIj/AJjzTUpFH
         g1iNs6l5/GDc1q/H6Lp5vdCAFwYB8aRVCEOAYpQeenIB/d7cHmNlOXbGaSyzvIFe+b+T
         K+lEv6cQrJbBMM+4f1ibAKpi34b4CddEsE0W+N8lQwyAnVKv7HofLrpY/AtAmdIKXd1i
         LzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365159; x=1793969959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YyLSa3BTi1tUsUm+bl9FSELrR+28ROQxS5lQk/+if0=;
        b=zCpi3ZK4tw51UBlj7/+pWU0WE+4p8+29k0uv4KiMdi/5FoYt5eLuNGcOEy1i3qTog2
         AM5Sqa/hn2NeKRKv2uwhP2XM9U5Pgrrge8Q+C7htLTOOQT8JN2SgTDS9bghfZbZxMG+8
         aMcxr1bNgCy9argLnVuMWEo0ZHPl7Xh9ra7VrgyhPxHojG7wesvpw5lqDCL5HutQwD+o
         M/EUvtKfeqLziQvdSt+4VJ/2JO3svIug5olQwk6NtVAmQD5cSLv6EZVqVzUjIifTJqaH
         97d68DPZ7EyU+Pd8Bd5riO3WP8u3BYAgrOMIN55ZQL+kJ+T9Eiy4Io/Qp26X2fyzjewU
         Vt0g==
X-Forwarded-Encrypted: i=1; AKwUvBwDXWVDpdTDMmQm2BNgZV+g5lW1VlGnYtU3CXgM5Bl8WBu/xy/ai8yF3lMkh1vbOZo0nULWo5GsEKzl@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3GQAWolaEqXLJ8HHLmNfSwsTM7DuWhLPXhJZSQ5WWvcaqqkbk
	h+aMOnZdLZScN6Ki2B7apxFMehmGyQcUz8CGokfZPnGKW3S8/8qZG+wn6xqOyyS07++CsfINaz3
	kjEjIjLnpU2AAv8tB+0tmNa8NmgT8pq8=
X-Gm-Gg: AYBFou2hpr5qpfrY7U921GoKJzeEkwsaP+50evMIcTsxqJplzw3Fq9jkiwYqQr8E/6r
	VLIz6aI4DcHCe7AOTc4e5xmN8twKJPQUEYvJO27DUZnWXmJkWRS2fwf55xFOmOzpniw1WSUYUnA
	KlHGNyjW4vdd7tVFDWVAT4TNKuBBvktWxCCVJN219QbAfPlUzKAal8YBiYYgsx/a4Gr5dIC9MAc
	ukCP6uncLMKIZEILHMdi+9SYwlTVBHkK/VKTtoZHx/Fca5TvyHm5HZpOHQJY8KFpsW45o5/JJsc
	25gvgC3Iz0eqVO1OC9nkRJtH/qMoNjDYsZB/bh1c8pAPKx0R0f+by0e0tSdXwIx/7YJCa6VPnPU
	nW2TvbJA7zcZxxV9BIwDA3gvUlb4QY1t2C/Kvkk7wOSNGOf42UPq6Yd00vOaOkE6YHPPlWyE=
X-Received: by 2002:a05:6102:950:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d072bb3726mr982684137.13.1793365158793; Fri, 30 Oct 2026
 05:59:18 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
 <20261029-anacapa-devlop-phase-devicetree-v10-5-26ee3cf9d9d0@gmail.com>
 <c78efbed-e91b-484c-b2a8-4e44383bbc30@kernel.org> <CAPBH0A96nFFqv4a0--OD=67w=uNkiX5qWb1aQFF9=kGVsUijRQ@mail.gmail.com>
 <79b1da71-7a17-4d75-aa79-ac1a18303b2d@kernel.org>
In-Reply-To: <79b1da71-7a17-4d75-aa79-ac1a18303b2d@kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Fri, 30 Oct 2026 20:59:06 +0800
X-Gm-Features: AclHuK936QikowfoO5i5BgELLDpuDAgVgr57QkGt26vDuZG48EvAF5wkFnKQPU0
Message-ID: <CAPBH0A8YCzNBKETf=mm08EggTDiimd0vDXK9V+vfvGNzENfcdA@mail.gmail.com>
Subject: Re: [PATCH v10 05/16] ARM: dts: aspeed: anacapa: Add eeprom device
 node for NFC adaptor board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com, 
	Carl Lee <carl.lee@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8830=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:52=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 30/10/2026 09:41, Colin Huang wrote:
> > Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=
=8829=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:43=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >>
> >> On 29/10/2026 14:38, Colin Huang wrote:
> >>> From: Carl Lee <carl.lee@amd.com>
> >>>
> >>> Add eeprom device node for NFC adaptor board FRU.
> >>>
> >>> Signed-off-by: Carl Lee <carl.lee@amd.com>
> >>
> >> DCO mismatch / missing SoB. Please read submitting patches document fo=
r
> >> further explanation.
> >>
> >
> > https://github.com/torvalds/linux/blob/master/Documentation/process/sub=
mitting-patches.rst#sign-your-work---the-developers-certificate-of-origin
> >
> > Thanks. Krzysztof
> > This means I need to add my Signed-off-by to each patch, right ?
> >
>
> I am sorry, which part of submitting patches, which tells you what is
> necessary before you submit patch, is unclear? Please go through all the
> steps of submitting patches and analyze if it applies or not.
>
Hi Krzysztof,

Sorry for the noise, and thanks for the pointer.

I re-read submitting-patches.rst. You are right: several patches in
this series were authored by other colleagues and I am the submitter,
so my Signed-off-by must be appended last in the chain of custody.
I missed that in v10.

For v11 I have:
- Added my Signed-off-by to all patches authored by others
  (Carl Lee, Rex Fu, Peter Shen, Andy Chung).
- Fixed typos in two commit messages.
- Re-checked the series with checkpatch.pl --strict.

I'll double-check the series for anything else I may have missed
before sending v11.

Best regards,
Colin Huang
