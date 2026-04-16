Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80C737C0FE
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327555; cv=pass; b=P2Hfs1QCdxtaWkU2wvmfJAs3ykcqv54O9zr0ALyD8vlB0QbWIoqGOhE+nD84fQPal10wGV2us3Z3xDJoTbk77bx6pLOCMOlfqbMUC71uANGOlD0xO/KN2A+IUBR2HF6Pbz3BSJLR46wr29JAqPjX3dzqRCDVyL7iwDPF4Xmm8S8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327555; c=relaxed/simple;
	bh=gyfD8pfwhSxVR5c5TiqO6lAdCFrxa/LwfKRn/PLAYnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVPKcZ81+3V6KDMh9oJOBZ2hffV+cX+7o9S8XLb/uzHumD8jnxiZEXwxkut4CsgzDViVao3Gjb8vNUm/hdL1hG5UzHFHZfWkWILrPyrphqNu+VbLNyOn/m/K+ZPN2vht65/s7I5lGYBFHiRP/HS1VYiMfd+7qI89FldcB1iS6mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sylJ5RNJ; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sylJ5RNJ"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-650775f427eso8026194d50.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 01:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776327552; cv=none;
        d=google.com; s=arc-20240605;
        b=jsOalBX7iUQ82an+rJeN4XU5IFHEtGboNmkATmuThTfFZtiM5ax+CyGC8xwiVF26Sc
         QJn29noQl4kLkMF1hSjkZH1tLTFhkWVwQkryh7dK88rB/ksQOscBnSiWK9u7sqPcKiDR
         N4JZpLQVjzUYPh/RaeHg+QBkuvTu1uzsv+7qxT5df9fTgKHW/v9KZRFB0Rt+3yG0ntZt
         LXqDe9yaGh9e9RHVShcoeW1p+qHMxF/GpHan/fMyBjeSDRdv6xJWfU4OZ24Fg44BBL3G
         mgN6+K5Fu+6Bk/L1ARGrV2V5rqhmJnLs7lETBDU7bcwfNsUj5WbGrIvAH6eaPXzuDEHS
         QK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UYfM78rx5R3ZVmMPKEfuM0RYI+r7ma+Zgwh+UTlTNLE=;
        fh=XaNd5jtMN3YiGD0LGOnuF3C7hoGZpXR4UQWPwa1wNFI=;
        b=WmS8kxPiKMAh5oFCQvORzQVrT9zsE61yPC9Re6TllCbhHsPKUs02uPt8gL/cXCLBpz
         YCLtmyf5vF+HbVngQfGfMcOMB0lQhd15PZVnzxbNc1tV/NCRv/RBRoPhXh/o3DaIQzGd
         NVtqosE2roIsfUEfcCaYRwqgTwwrvcJodlDXsObbw1uj/xM3XL3rkwvbdciIeJoUoQWI
         jINcELh1sIyR4F8z7IYpWwORhJYPQsAiH4JREnRBUPB/GUDwJMMCFLLPzMZA+kmHJXo5
         PwsAtC2dCgs9J3/JhlgirTWPDXAJR0CXyJRAJoBQ1oWzMBkSS3/DaKOgH8ZmyEmo/JCy
         lmpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776327552; x=1776932352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYfM78rx5R3ZVmMPKEfuM0RYI+r7ma+Zgwh+UTlTNLE=;
        b=sylJ5RNJ+0hXdCnnGdXR5eE2v/EkbzJ+oigAXEMD1d0JhM51NM0L6K7wu1tcH+Z16h
         fddFr8COfi6g6L9XHp+VYZU2YM1JYRkWOM9/ZKjAq51WvqJyvI8C0OBbhgbusvysg16H
         1c7HjqPW/UBIkdmtbXS2m/h+jQe2fN4oxYt+QGpx2DwVaIwUHOFs7CNgDzGBrcThXCNG
         ppbcN7ahpVYYu9SGmOcGyfwueSPJen5kHS86KuGFkSMrEhweMCB11zKNRvcHJNgNzL1M
         ZUVNP+BQEmxlUmkFiThX5wdCPE6cX9B+OQV3CN/QMurXfMXZdadBaPLnDjE2QZpuHFK8
         kmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327552; x=1776932352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UYfM78rx5R3ZVmMPKEfuM0RYI+r7ma+Zgwh+UTlTNLE=;
        b=mAPNNsN/uIhkuONa3tPfb/hCdcm9IMqDABulhQmza13qtmGDnChrMoJUiNS0QhHXTI
         qFANTTnN/i5/+n96HjeUFAp98+1kf5Va5PFKllpphVaCejKSuOKvZ14hJps1rq3OUmeu
         jR9BhfaR43BOYwAefAIQqE9NtNncsN4quLm7cQotd+n4tbCEdRzMvRdXR8YfNSnpdMRD
         BsPqT0y74vZrhNfeVjZR1yKPs5ng6TZjM+4OS1X7oe+Mx6i2UJihUOrcpx0koR/bCF8U
         lqOmmRCxpEb5VoEzV7gAsrNJ24CEUPmrqi1j1Z0B2CCpOudRIWcKAZCJ0fxemiKLGHtJ
         obJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yTaJK0IMLxRR8XrbO+8n+KSFinF+OlAY/B0dfBkBfS3OgKImgi/aQXltyd1sH9UOglLJGSRGGeuKA@vger.kernel.org
X-Gm-Message-State: AOJu0YzjS4SmWwwUJjOn07RRTXqsx3hBVakGACY5smm113+k7zFDLhfx
	wIjn68YEpq/VAf5y1ihj/eL5IWTrW5prXSjGFsscylq7ExbdMB9ipuXl2Bi+iIbxYce8NBeI0+e
	gpjStEdQ37yy5uC0C8xQgQilJaQJ6DQ1GWq3U
X-Gm-Gg: AeBDieslsoBto5/eWJpmuXYEvGBKXB7D6SEInxVvnzjZouzNdnANSRK3IhzFhgSnysF
	Pn/aeqnDge1zFTljqmoXixOgmbBhClx7dttTQWY5mH2fqkep0leA+nFc5GfAt70YpJ7+YF6oruA
	8Fk/DhiFARIuDNgpTt7oVCKi8ifUjL7eYtXAz7t5xGf0v4wfZy5c4YgxG28fWBzPZ7DWRuTi0uI
	nY1Yd9OsVBAVNKZxF5Xv9dGZwTbFFUdGtTy9gslqvmLQroHLkUhAJTF4Gwwfx5W/+PbZ/2mU21K
	QbM1B+QFRKLB32SA+AM=
X-Received: by 2002:a05:690e:bc3:b0:651:becf:4523 with SMTP id
 956f58d0204a3-651becf5113mr15959082d50.62.1776327551592; Thu, 16 Apr 2026
 01:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <f58ec12c-3957-4d44-b823-6a1ae1a1dd94@kernel.org> <CABdCQ=NhTkGJUh_fKnZoQMzdpyO-UbV5zrSfiNVUC7bkSBifTA@mail.gmail.com>
 <DHSQ6VG82QYX.1EVAYV9JTBCL7@linux.dev>
In-Reply-To: <DHSQ6VG82QYX.1EVAYV9JTBCL7@linux.dev>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 16 Apr 2026 10:18:59 +0200
X-Gm-Features: AQROBzCXo6p3fgZAxRfHTUW7b152HxWrs_jxAbTxvFG6AIyn1RGKEh6tq-Z2nFo
Message-ID: <CABdCQ=Oata1oXds6pV-RipwZjcztM0xk_J=Rk8Of2w2RqegbHA@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 14 abr 2026 a las 10:16, Troy Mitchell
(<troy.mitchell@linux.dev>) escribi=C3=B3:
>
> On Tue Apr 14, 2026 at 3:12 PM CST, Iker Pedrosa wrote:
> > El lun, 13 abr 2026 a las 10:07, Krzysztof Kozlowski
> > (<krzk@kernel.org>) escribi=C3=B3:
> >>
> >> On 13/04/2026 10:02, Iker Pedrosa wrote:
> >> > This series enables complete SD card support for the Spacemit K1-bas=
ed
> >> > OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> >> > high-performance SD card operation.
> >> >
> >> > Background
> >> >
> >> > The Spacemit K1 SoC includes an SDHCI controller capable of supporti=
ng
> >> > SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> >> > currently lacks basic SD controller configuration, SDHCI driver
> >> > enhancements for voltage switching and tuning, and power management
> >> > infrastructure.
> >> >
> >> > Implementation
> >> >
> >> > The series enables SD card support through coordinated layers:
> >> >
> >> > - Hardware infrastructure (patches 1-2): Device tree bindings for vo=
ltage
> >> > switching hardware and essential clock infrastructure.
> >> > - SDHCI driver enhancements (patches 3-7): Regulator framework
> >> > integration, pinctrl state switching for voltage domains, AIB regist=
er
> >> > programming, and comprehensive SDR tuning support for reliable UHS
> >> > operation.
> >> > - SoC and board integration (patches 8-10): Complete K1 SoC controll=
er
> >> > definitions, PMIC power infrastructure, and OrangePi RV2 board enabl=
ement
> >> > with full UHS support.
> >> >
> >> > This transforms the OrangePi RV2 from having no SD card support to f=
ull
> >> > UHS-I capability, enabling high-performance storage up to 208MHz.
> >> >
> >> > Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> >> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> >> > ---
> >> > Changes in v8:
> >> > - Resending the series as v8. The v7 submission failed due to an SMT=
P
> >> >   error during transit, which resulted in a broken thread on the mai=
ling
> >> >   list.
> >>
> >> Hm? Everything is here:
> >> https://lore.kernel.org/all/20260413-orangepi-sd-card-uhs-v7-1-16650f4=
9c022@gmail.com/
> >>
> >> You can send individual patches to fix up threading, use --in-reply-to=
.
> >
> > My apologies for the noise and the rapid resend.
> >
> > The reason for v8 was that the v7 cover letter (0/9) failed to reach
> > the mailing list due to an SMTP error on my end. This left the v7
> > thread "headless" in the archives without the changelog or the full
> > context of the series. I was attempting to fix the threading
> > immediately so that reviewers would have a complete set of patches to
> > look at, but I realize now that resending the entire series on the
> > same day was premature.
> So that's why Krzysztof said you should send individual patch with --in-r=
eply-to.

I see, thanks for the clarification. Just to clarify for my future
workflow: is it acceptable for a series to be 'headless' (starting
with Patch 1) if the cover letter is lost, or is the cover letter
(Patch 0) strictly required as the thread root?

In such cases, would it be better to just send the missing cover
letter as a reply to Patch 1 afterward to complete the thread without
resending the whole series?

>
>                                       - Troy
>
