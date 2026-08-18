Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A81E3A6F04
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787065170; cv=pass; b=DnS6XZnLmE08jJAorlGI0BfOFxIxZBqzBT6stY2MCcbT3avh16+Rv1tcx7lrKoWYrcV4MFqkfJYjddKyi0EScyWHXTu7upkFd8u6KUuDfOxDLhCd/aSsvS/VyYGKVX7htgwLV6LOdmXHiUrBR9jPZYCChMeLwrZjwsbwU0By6kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787065170; c=relaxed/simple;
	bh=auOWJSI+p4NXA2fRT5Cx8VbH8xiNgNPgiWdRlKFQleQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEBbzKbXapLVm4ct08WpuFYAJXHItJfUjk38ouc67COYpyuB4+iBfaf8ECQ/w0zMhPIOxq+KND9WJ+K/uZbi+/9HfJII7IS43VNREKB1lPL+T2VKls7yAuUsKLRhxrHZMIOsWuVsS6yrBcBAAK3FC8mPdCjA67umr30ScSmqgks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1Ami/y/; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1Ami/y/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4957eefd361so36716285e9.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 07:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787065167; cv=none;
        d=google.com; s=arc-20260327;
        b=lQbuk1snswDRwXtrLT1X2ZrBRQUlDKd1H9O1zqw9NST5NDx1yUwJBI3aKYaZSUKoF7
         oMpKqQhJgoJody/vum8oZlcojR1T6LoiFuFegV9eEfoZ6or4Lu+YmZ8IDMlh0mbGtr8D
         sYBtqXMMF3o2DBck/OLIf7ln3Rxu6CisPHucYcKYSVOCr6LRa/GMqhX42gRaggaIuT6O
         7irbyxX02FVBuH/urPs/b+aA2tpEy47tTAodp9b67D0sRuMM0X62mlUNcly3JJPbhj3g
         nHi6zbYcte5PeVPFeMqoxWAVWEzWvFafY5zC6J7l/XQQVBKJ4X50tvRkIYUsl4Y6U4JP
         7jXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=auOWJSI+p4NXA2fRT5Cx8VbH8xiNgNPgiWdRlKFQleQ=;
        fh=tvtTzYYgn8D6mcoJruPBoxTXphdf2whyPFY9eGeETFE=;
        b=gFLRroUkXQeHZGjiZ8bkcM9zfMii0eQjmbBNiJC2c8dlmY05BmWRztEtwGf7esBk8Q
         ZG+MovyssftCP4jMd1dpsGHH0IQuQhfJGwKBWpvIlzD8tljeP4N5CsUOSA4eq3s3Nh99
         +WXIplQAk6OEjYPG5lEuC1KLNTNR0dJTAt3FSAr7KZslfDayCOESRsXwHC22fhMzDpbl
         SlFDNbFNKeghcVm9IhB8mcFU2ASLj2Ki0xNuJ3VusZaB5ML1xBUFUkpOay1D/D+gVG0R
         1RkLym/iMMTwVBdO+0C2cRqSib+l2KnwuuMwaHaUD9iGSxObWo6ifm4yH3hlBkXZ6Tki
         0G6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787065167; x=1787669967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auOWJSI+p4NXA2fRT5Cx8VbH8xiNgNPgiWdRlKFQleQ=;
        b=G1Ami/y/Jx+/W4PBUx5WYf3TASiSE5Hlm3gMm4z4O0QCNys9ugGjp78wjeWhQ5+ZMS
         OZG+3jgKbkVnu0DqACWjqdjHmW+Dgh6dYk/kOz2/OIEYHfvAUs9YZdTNtEPdSAD5cGdK
         GEM5GS+RzhkQalcvRJB3J1DRetgCGM0uf7YMyN9bmLsNG1mPMhcsc2ebnA3I12CQnT3s
         zhxrRsQF4aQh1WMfXO6g+ImSTVGbBlvbCqCQ0TPBbdgEbt7wLiG+4vl5Ni7W3kOPjwNw
         BKfGct+BHOThdekT/EBCQlYZLdrxpYRCpG0WE9uxsG/91mV0QR6TQgauqZqILXrwZTOQ
         2sHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787065167; x=1787669967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auOWJSI+p4NXA2fRT5Cx8VbH8xiNgNPgiWdRlKFQleQ=;
        b=MJhhu6R0fAd8Awv3lMgQkj+x7uX5kOnF3sbslcmna/3iqJCrb1TYrpTt6ax7PMBaff
         MooHkWYtZcGJX3uMhhjiNAcDVfX3zThdqUoyxad68W+j40Y1CksdT0xUTEB1w+HQvZCW
         RtvpD1s6TlBU0nJoTtDPBsgPdmM117bA5eTbUMaCamxF4kSDorshj1L6L05MordgR1BZ
         e8DBqDxtKf4QTa5rnrdtR31Kp9FRmP9OjXeQ3g49ABOPWrGtkRA+wICAp5mO+9bwkHq3
         kHMuxbkZnDxMCHVkDwSDBUenwSFjHgDpgDyhyfgXLvWJ+JXBWXy/Gr3giLZw+a/6YTB1
         Bf3g==
X-Forwarded-Encrypted: i=1; AHgh+RpHMMBK4UMP0OcUc7Wp5e6cdxvVNcJ2LvHI8SSQAwBRPkCvh+Ep+Rg8LgjjcxCMMKDz2lTKt77xLoGa@vger.kernel.org
X-Gm-Message-State: AOJu0YwqdvlwpeKOrvF+3SIrt0mLJeSXtF6bqCF+rlccbWBAJ2Rj6Jw/
	sxFkCmsmunEAZRtQ9d6OPIephzRrOMlv1ea8oBt7ISX7OZhJt0zHcKKEHkIUe8Zgxtq+IC767RL
	Et6PPLgYB4oQvbawsppZvTZ7lIG41m7o=
X-Gm-Gg: AR+sD10wALmzVupdndeIWRzh+vZtEbkdIgP9sNzxCHALcxhkC0/LIHiAz/Sf99CDLSg
	nn/bQGBoaUNgouzlcpeqsIaY07jPskBumYMNYf1u/YvGbC+tLMRcd5EB8SQ887h3W3OmEjRf4pk
	2AbhdPs57BlM4fRBQRKBt5/t3tbSLcDz3FjwolNQiBwGbYdNmdWn92/Xp7R/m/EISdtOFvHltEJ
	zx3xYOFtbpFOe29zHvzRZac/hBn4yKYt02YppUELYNHCE/AJQfrvFYCESISdAQma+NqfLMv2/S4
	gt4mi4+nuwqVSM6KN2aIHPh+cX1AiBh1dAMWerVywykhccVsi5bNlmFSTzg+VNgFzCEoVQZmOAW
	CuGncNYUOtE/CHHh+0SMMqk2HMl8w03VhChoEDSADlOxAUmnqHrmvhc7//QX4qUo=
X-Received: by 2002:a05:600c:4ed2:b0:499:8743:77c8 with SMTP id
 5b1f17b1804b1-49987941ae1mr528130175e9.8.1787065166778; Tue, 18 Aug 2026
 07:59:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175138.12587-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260706175655.6A31D1F000E9@smtp.kernel.org> <aoQ5INLOtNELfXpH@ninjato>
In-Reply-To: <aoQ5INLOtNELfXpH@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Aug 2026 15:58:59 +0100
X-Gm-Features: AcwNN1UCOJCIwPDBwZ6xtGRL3Omm13v2RjrLOXY3KVHS5j4fJiEaqJmGRVxTIKw
Message-ID: <CA+V-a8s_p95DsJDSZeP2Uy6=Nv4KZkKj0unLaojqR+yDZGTLZw@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] rtc: rzn1: Use temporary variable for struct device
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-rtc@vger.kernel.org, robh@kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Tue, Aug 18, 2026 at 11:51=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Should rzn1_rtc_disable_hardware() use pm_runtime_put_sync() instead to
> > ensure the suspend completes before runtime PM is disabled?
>
> Sounds reasonable to me, what do you think?
>
I haven't seen any issues as such, but I will create a patch for it.
I've seen patches taken along similar lines.

Cheers,
Prabhakar
