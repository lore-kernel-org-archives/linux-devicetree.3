Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D87309EEB
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 17:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776532492; cv=pass; b=JOb1WO58PaKC41eBVdPKdbDgB90oX90U+eIf9HJYZsNDHBuG9+wSYP7a6rqaz97W+l7bAMq132dsKjY2DgYADGQfFGUbUqLPjzPnu1PkUlRrgS7ORCnSv6hhp5OQ8+/51oB8u2/K6WFGzd0sjetrXegTAy29bUei5JFbvANS8Mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776532492; c=relaxed/simple;
	bh=sV0zNh/sRR3qUcdeumqRVy/BQwK8Krmc5MR7xdnyuRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YwcPBf1n7DNaMMld/Q2a2qAOPk3FcQMPaHn4V6a3ffd9p9HJL8kNMehY/sNHObUpNintdnAiD3M5xbm0ib2THtJ448OFTb7BC9S0r4GlBIgdAvIiuXSFMThTwd+UAec4cuf5VbphM/WTn8fELKS/6BmJf5XCXwcyfIXOFT8R6mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0xUWQ5k; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0xUWQ5k"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a413f83226so2319235e87.1
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 10:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776532490; cv=none;
        d=google.com; s=arc-20240605;
        b=HDgfbEYfJ6rhEKMVNBLtfSnJedP7ZA5ga4HUgh4pQc2wxPB6toQ+O/SWKWbWrn63Yg
         pMgh1DWpNbcx8n5IQ99IQYUTBa/Az84mIlBlkGxxrnp0kCUfizRlen2xMz+yILSQNFtk
         IqC4leqDhDxrwvUMjb2I4tLre3u1WKjAtU+E65Oph4/1RtAp21EFYDtYIMKl3nAtln1r
         OmQeu7B+obmPugNRcLIbGRS/EZywm7GBCfKlI/LgvYPrjm68KVzQLK5CXZ9wpPEfqTJ9
         17dLOgvaMjJQ5HzgMCQynHKZDtVpdDNc+F4fhhIfpxkoz3l17hiflAHl5GHoBaT9n76Y
         rWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PuZMhlpckJoKVLIuFK48UQUUnmgpJ0RcJudBMWzHgRI=;
        fh=gROw2XJ5Dd983ld2I9N9N4P9Lt7vVEOeBM2w08x3ZZY=;
        b=MgaBSpyY2CDKBSoTSXoi6+Dii1gixeoKkOLEJfLB8/KmABrX04Y/bk6ZI7vkVocwYl
         1bVNDrrmWtMoEYFF0LXxN/CfIyupPXWzj7LJ/PzoaIsAqDl8pVyjkDNNhOcmWCo/at4y
         C1qaUaYYWXkWpxBrFNhQyN/Y/J4/Y0lw7RX2u5mF4gR1iKveUJ1Sa5x/imG8/d0zA/zH
         GFndT6dlmyQFZXW03LRf7DCvVwyY17V+Gfdn3TRubrz+HFRftOWeMsvJBPbJ9pjq9Xkz
         nW0ZaxuuOxg/Xi2pngV19+47PY07sJKL2uzbHaE07TZsbdDk750Z00p6iNENvdbDkVWP
         7Zhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776532490; x=1777137290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuZMhlpckJoKVLIuFK48UQUUnmgpJ0RcJudBMWzHgRI=;
        b=r0xUWQ5ksmDutA3A5mijju8ZzKFY0J/fOoBoY29KUX9Ryn7U5NVoApLocXt0I2jDtj
         A6OKeHlyMnymsGogyaQcepmUHLaK879YHav5bzeU0y82Ro+dn0OSw0xU/ktfLHhTo9pn
         HlvuVoAAJoOddQO5HcapAatgDpQRSXbYGVTLAMvFzayiAk5OVSydXCaWQZz0GSfGFLRS
         yTENgBgq61LoKgqFS6UKp4JIr9yjpZn/8X3BP8HYZbjYn07cubjlg5qRQzED99QQsITA
         jaIN5Z2JT8j6ubWQiDpxkSI5pufNvyTaJtW8wnk1RpZoa8p+Mv6l6fWcP4TzPD2hgSEX
         NwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776532490; x=1777137290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PuZMhlpckJoKVLIuFK48UQUUnmgpJ0RcJudBMWzHgRI=;
        b=KL+DzbCD2RZ8sK5XbXTCVnYqaoPqSrgvXrRWeu3KcLhfp3wMS+v9irIUDjCzPhc11Z
         NH9IS2hWFw7WqZnTRwT0qKQYnEo4xelClVg+fHPO+Nl/hfmjzGge3VJdaGum5tSUHKCV
         cNqqMWVm5+gM1J5apYJ46rXN1476xS+bdqsnsg/zpFTgeCAeikYhkO4VwQMBRJNZELts
         ZYgKsa2h5i9ZO3Ae3JOc+aigqgp6sXK6R1LBD/gPU11QZVUMtizQi/PIqBS7AzVdeZEo
         yFJ6r6xYtQh4kYrYhr+t1S4cBpbi+kpl4d6ype9L2NCKGk7wgIFS+gVGfzLtJjDOLI2F
         JfvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RJTAQgI45C9nLEBVD4lLiQWj3fRoNzw2KBkfhUZks5Qlv7hm380N8pesU5WiL/ZaJlgU9rtDqXDE8@vger.kernel.org
X-Gm-Message-State: AOJu0YypqibH4HD/MJtE8C2A89WdfAL6x+jcF2c6ysmcFqxavc5w2CHB
	7Y/8kEtHEwWyIev+u3gfABm/tWydd0FjU793zTE/FH4UL0Iuhu0I2xSqmdDdDG78MzQFckI1LJO
	XxcGLV2Ryax/ATaQE4E8/d7bMnp+bKzQ=
X-Gm-Gg: AeBDiesPXPNKg4eCNe/Mn8rHmA3Oow35iCo55xQ7xy6vN2b4AIkvsd/WpoAc0elKWcw
	BTn8S1nw1Shrxu99eigzfg9727r+/cwY614UKMk1Dv99JQDtFH607MZyZmsbx/rlgR2lamBGBF9
	wRDEvafrCCzhGVeKkx2lUvi52iK3vnIbVPKhsAPStmLIUGwDUViN/g8/z/PFxJbLsnRFlktOClf
	n35bZexDM+2sum0yLPsW5cHXBYW+aYUPkt6PhSBKkVe+MChUhYzuc+OH4XY0yu6EdWfJJT2vknQ
	+S9Hszh60NbOi6biyLFhCPojFEtiQgiAn6LCIE49TBj1zCt/yhR7IGPNiDsXPGC9QchFXNa8yhv
	gHVAq
X-Received: by 2002:a05:6512:3e20:b0:5a2:c962:59f1 with SMTP id
 2adb3069b0e04-5a4172a3042mr1890849e87.16.1776532489400; Sat, 18 Apr 2026
 10:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418170519.312360-1-piyushpatle228@gmail.com>
In-Reply-To: <20260418170519.312360-1-piyushpatle228@gmail.com>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sat, 18 Apr 2026 22:44:12 +0530
X-Gm-Features: AQROBzBBCbg4dCGQ8KU0ltOkiVUm7YvY31quP6XQxNirjtuyywhboqwz25V-rbI
Message-ID: <CAMB+xkYGHctzwy-nezULY38yvmnmh-ygWgOATmtCXj0nFbPRmA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] iio: adc: hx711: add HX710B support
To: jic23@kernel.org, ak@it-klinger.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2026 at 10:35=E2=80=AFPM Piyush Patle <piyushpatle228@gmail=
.com> wrote:
>
> Add support for the HX710B ADC, a variant of the HX711 with the same
> GPIO interface but a different channel and gain model.
>
> The first patch updates the devicetree binding to add the
> `avia,hx710b` compatible and document the variant-specific behavior.
> The second patch extends the driver with per-chip configuration, HX710B
> channel selection through trailing pulse counts, and fixed-scale
> handling for the variant.
>
> Tested on PocketBeagle2 with an HX710B breakout module. The device
> probed successfully and raw readings were stable.
>
> Piyush Patle (2):
>   dt-bindings: iio: adc: avia-hx711: add avia,hx710b compatible
>   iio: adc: hx711: add support for HX710B
>
>  .../bindings/iio/adc/avia-hx711.yaml          |  36 ++-
>  drivers/iio/adc/Kconfig                       |   9 +-
>  drivers/iio/adc/hx711.c                       | 222 ++++++++++++++----
>  3 files changed, 214 insertions(+), 53 deletions(-)
>
> --
> 2.43.0

The two patches in this series were sent without proper In-Reply-To
threading by mistake.

Patch 1/2:
[PATCH v1 1/2] dt-bindings: iio: adc: avia-hx711: add avia,hx710b compatibl=
e

Patch 2/2:
[PATCH v1 2/2] iio: adc: hx711: add support for HX710B

Apologies!
