Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793870362;
	b=q8McCuDABfT6rgHslpoSS1ThPhmoHm+u3IzsX+xihTLYeWtUCcHy8cCoSUFGJr+6ak3H
	 W6kq4Svmm+8obcODFetRmFyF0Jisf2gpQqP62nm/YowF0ZV05FlXaxBSPuHQyBULr9Jas
	 arTZyTKsRdXp+/I1siRDvUcRz4a5UHHHLHVBHslzhxfMsSE+Oj0qlv5qL3Ek37EHDKSTf
	 3USdf/xhtFtAE4t1H9kDjqAUfKKHwThld0E+/ORMnqE+BJUkUkrdKu8Zf0c7m4wulNEis
	 3I1ZIHIPFD3HF1v+vRYbbQ9jMPOqGKcNZtF4jUmrrcA+aGClPyXXZfwqybYdULv11aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ndGzkCwTbGT2osVm60AE7H39WPe2NYufaCoY6UTi6Fo=;
	b=ZhdklZrAizzGu5TqQDYvu19WjaHyV6MdchEoYk71+EqvgRKthMRkrBQR4ZcOfzVoYDGE
	 avuXt2eCCqctRb3xKPMbEBfc/qK4KNVH5PeFp6Kg2kOfLyhWVCR027cBji54fcyxY2PfY
	 N5WUoeB9PTT7CKTlCYxf8N0NWC9htslQI3BVO9BydQTOtzJcF8IwD9dmpAs1DeiOA+uzS
	 U98YYsZGa9cXbv0wX4nctEse/HBPxBJD6Wv0rkY2ocbPVQcaIiGLpOGz1iLrIsEHWG1eQ
	 jdGli+9f4jiDwtZA5drG2UnVSxFD8aR+TlUHLINkEkOCVQkcsgXHx34hWiuO2jt54kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRDb94of;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB48606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB48606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRDb94of
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-48eee44b908so953336fac.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:19:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793870361; cv=none;
        d=google.com; s=arc-20260327;
        b=ew7jv/GPZZedXJLAsL5YwFaBaMWfSdIiDTXnQWwlDdBOq/VgifVzDqb0P/crX+bilN
         kYRRWbxfM3Su7byKVj+eG5s4G6+SJmYqKGlA48reuvffNK0weP/MYIKPy075ematf3l6
         EOOBIqEDLzcyNAOU0D2ExrQ5sVApRrgJc242j/gMYjc89biSGhI3cIc07dj/JBb2VTee
         cUFy0//Pfo7GULoU2Dh7vJGZucVd3BvohGGw2lGpb7v9Sp4RsODU7aI/mn/c6cw1MSe7
         66z4oeNgGxoY+z8r6GCduwDtjbJiQ53NwZr8rzHEqJRm1AqDO7Y520FzqsB99v8uOJIl
         4v1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ndGzkCwTbGT2osVm60AE7H39WPe2NYufaCoY6UTi6Fo=;
        fh=KI5ASrB4yWF9UzGY/OrdoYYtCeeG9XmO/FCtY1c9gq0=;
        b=CBtIfOIHFnWOiArwYTLDGLk1IYDSjb+CJv+RXRClU9ar3Ow7GytQ2X/b5S4PRLGYgD
         8AmZnFVN40ENxknnWGIb+PO25qg3WaObMNgBMd8mDRr0Z03zsI3xmVenqavLRIYPdatF
         b1UcTZhvBhFFY6/k4yKoE3i02XAJHLEXj6DLIZvgbH6G+IKcm8IRmGZ8RWYfqGaC5Y5X
         8OC/RvofXQA4PJox84GISndC8HXP761sRoh2GFMKeq7oloAvLbnHzUjNT8eIDki5kUh8
         m7HGRcLQqsKY79qXPNq8Bd16zbzJIp7S9nSJxttpuLpUelTEFmNVd5sxE832BV5B0Ytt
         FDyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793870361; x=1794475161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ndGzkCwTbGT2osVm60AE7H39WPe2NYufaCoY6UTi6Fo=;
        b=lRDb94ofVYHR+1WQwqiDrJVy5WTe2mWB/507MvM+fsdIOGBt3sRL5H/oft6UVGYBTi
         DVmRcCepPEyAt4m40GJEhUuZEx32YrCy2Sdf3yqbSAzLyrlCN4NVfO+4IhIdmUXBPxJi
         thvR8yCrwaPWAKopJovEadOcE/QJdQzTrJgcTEMEn0fmtmtTlfwTn8F+xcGHhD6/5sG1
         AL+mrQy9EFmutVMdyy+JJ5ldiFvjiCihI0TkLrAHTM4QSFvsdnZe/I6+bQqTm9HoGUEq
         vcGOlc6oQhacHGqfJPeiEYwQbI2r9B932gx28a2WeS+F3cT2W8OCtbPZXzVw0l7q9KH6
         2S8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870361; x=1794475161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndGzkCwTbGT2osVm60AE7H39WPe2NYufaCoY6UTi6Fo=;
        b=X/sAxHMJ09xjBWK4l9gMGg+jK/q83XSKSDDuRHZgq+g6blElj02Pq8eJIGeNktJUzi
         /kvW+iZ1djErgUdcvNjjSm5H8eQBIzQh7FvFXrL/wC2Hb56Z2yCEOvUOeZUbwE6XsHJ4
         MqxaS1YJlwmPdA1DkPeouTBB+ZaYVo6Wo2r8K7SVIkUIVJGqc4FcyHspMoi+3m/l3fjk
         jQouQhvgEAUUuWEzu0qs7VnlgOVCZ5EQ9QijqrdmieFu3A84nBEcM/ZeGE0EYVHOSH4+
         aPzA/cw4lw6QS+2Tc1R6tpF7pxF+YM5XtwWj6njfz4TgczPkl9FdT95tsMUC/gyz92dg
         b//w==
X-Gm-Message-State: APuU4Z9fLXycuXhp3lcBQgLFZ2l7D17W7PsN36hbeD4yDbIwJ5kVlp16
	3yMFKGdT7QFCzaTdFeDnO6paQuDr+X3tbsyeoezSsJV3iAFxLQIongHlDsb0GRm/d4Fvey0GjXw
	TEWDycfR/CaX1Dja/dMoNEb/lT2tCDps=
X-Gm-Gg: AYBFou01IJIU8/W3Pw07TnQr9+Eff7VCyZOZ3ZQIVl7PQLFHyJsBH3mBEFBLFXZjCPt
	oTuoGCevSOy2dIsIKtUiQvLEGURAi0DlMchHk3sP2xzGHTloVJlBwJok/G2/EeOIuES4UotlFrE
	zybL+XTRRPU3XK3e6OYnBAwidRjc3HfHzXfxQnkKiqhs/7axuLU9BtgN5AURfHsdvv4+vf37NMW
	0HbQ/X1rfIXy3SIsgSZpujJX8QxJ6RVrqWT8+TOmWzo5NQLtdaqapoWo6kMEbR8Y5g/akeKnXbZ
	hI5s9M/NdKCaWOmxKggf3+ayGLfwsJxfX7xM9M70ioiFCewWIxzH72Jl85gWcYKqW53WW4Oq2VD
	JCiOkxUjXtWFVcErFkfwKETfDAuzsqfUKt6nOeg==
X-Received: by 2002:a05:6808:4f61:b0:55c:836:597e with SMTP id
 5614622812f47-5640dd5ca51mr14606352b6e.31.1793870361392; Thu, 05 Nov 2026
 01:19:21 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930111813.52396-1-chou.cosmo@gmail.com>
In-Reply-To: <20260930111813.52396-1-chou.cosmo@gmail.com>
From: Cosmo Chou <chou.cosmo@gmail.com>
Date: Thu, 5 Nov 2026 17:18:45 +0800
X-Gm-Features: AclHuK81XJ96pBCTYU7-hDy4yf8gIUQ_g9ciWuO0heyn1wGR422e790m2Wvg4ZU
Message-ID: <CAOeEDyuRboYqBUOtLke=X0F66_A8NCHanc2iXt91duLRFGSU9A@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ARM: dts: aspeed: bletchley: Cleanups and second
 source devices
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	cosmo.chou@quantatw.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Gentle ping on this v3 series.

Thanks,
Cosmo

On Wed, Sep 30, 2026 at 7:19=E2=80=AFPM Cosmo Chou <chou.cosmo@gmail.com> w=
rote:
>
> This series resolves dt-check-style warnings, sorts I2C nodes,
> and adds second-source RTC/LED support for the Bletchley.
>
> Changes in v3:
> - memory@80000000: keep "device_type" first, per dts-coding-style.rst.
> - Link to v2: https://lore.kernel.org/all/20260729114312.3947300-1-chou.c=
osmo@gmail.com/
>
> Changes in v2:
> - Added patches to sort I2C nodes and fix DTS coding style issues.
> - Carried over the second-source RTC and LED patches from v1.
> - Link to v1: https://lore.kernel.org/all/20260714120816.1504058-1-chou.c=
osmo@gmail.com/
>
> Cosmo Chou (4):
>   ARM: dts: aspeed: bletchley: Sort i2c device nodes by address
>   ARM: dts: aspeed: bletchley: Fix style warnings
>   ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
>   ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
>
>  .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 1315 +++++++++++------
>  1 file changed, 902 insertions(+), 413 deletions(-)
>
> --
> 2.43.0
>
