Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150771991CB
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783503970; cv=pass; b=LVQ+TsGbnShf3JTpQKinwHY+QmmGGldnu2DNYlD1w9DfvlX99c33ukiF4x6h43LrK0ejY9ma8lJ9L1oViG5rl6jUwPi/yNb8nE7836zHcIfY5Jq6LyAFha5ZlYjCQzdEdjB57lOVqoKXBySHQ7m4t5wRadjipi2xBzUc1WFEj4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783503970; c=relaxed/simple;
	bh=UtR//zQiUlV4dZx/AK4ynLekM3lwGq+j2YQbvXNl5g4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CK6mkXNyZE0V2HFRO9l/PWKDrFq/6NFiDToX87LbMps6ow7PMUhaS9i2jm9NvFZ9fheIdB5T8Nj9OSOcGfjVb+u3UnSInW/xC1Hy+Voc02cX9V7jJHiYNRR91HTubm7udqx6coqvqAUADg+noZ9OqFFJEkYp+vmn00lpDTAGqCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PeGwZB54; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PeGwZB54"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e9f1f24cbcso299107a34.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 02:46:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783503966; cv=none;
        d=google.com; s=arc-20260327;
        b=RqzuMSPEwN4EaAeViOay6VgUbSbjDv7U0j/57DJEpA18z3Yv94lMJKflG9BYZSPrNa
         aq+mhC8jQIsZwcTplkQfIsBUn1swHAubR4mTkmlbDegl0FphbJFCkP+p1T9nLs9suTy9
         pLSpf3vxker5yCQV13/ZWX0L90i/se41JNXNjICOx6fIjjq/Zqx3fk9jbANHRXwSrsZ3
         DXncGzsq3XnODQkM1J+Z0nZ2rjsjZ6BMsMGbkTWRFnhogi1jAZk3mXEWEH68/V3RVsA0
         RuERQM1yb/t3mnPxvMiCqZgcgdBHce4ugPvSWIZz7iXjwrVBxAUEPgH4QimRie0NPhbP
         ds4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UtR//zQiUlV4dZx/AK4ynLekM3lwGq+j2YQbvXNl5g4=;
        fh=EbDsYPSOu+Df//tfBThZwFlJUPB69MkIduznhjw5C0c=;
        b=eRlZ+7j8cjOAgjMk0mv5G2rSNhO9W7Ky2Ebru7qtFTWJmVu0bQ4s2kj5xI6f4ALomE
         8Uq5fjjJ5mVKoBFY7oSXjZaylKpTXxU4G0P/1PwsG05Uk2HRb/6EBiXon8nLf52rCY0r
         zWCG5IHLFN1RoCB3R2mEiln2kKpbHzqXYeIiVkthVKGGgEyJqPOcDJrpu5j521Ab3cSA
         aY1b3EjpK6KStviWGr8tkd6jJyhccwvN6HK73iTH93mL4CnFe929cLYK5Z7D+duiqGSB
         +KtP8cILs8KyQSwkn2VMMgRYgb73VnJQYPkc5BotuM1Dmk2aF7Y3jA2xltJQjp+wz7hs
         1TZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783503966; x=1784108766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UtR//zQiUlV4dZx/AK4ynLekM3lwGq+j2YQbvXNl5g4=;
        b=PeGwZB54DBzxT4n9MegL9nkSVfgO8e0ipn0Uevuz3hc9j+Dh2+QarCFHG9SSm/jOxW
         40g0hY3zj9SooALiBKCcuI2PvoeaxtRiqXi77N+jO83A19+o7ZcRPpJJwYH4iRuUqfne
         kL6KK1Bv/A6BawfRD5m1ml65sRChvbaqviY8uefM4Da0WPdQlxujTO3l5sUHapfDwfoC
         b6s5WqRDfLPu4LPY2FFkjfbMsUkgD18/XbvIUhAat81o3nxEKbCR1bHcUa4hJxV80eFB
         4B5HVB0vX71oQyvYRjMP+uYPzWD850Py7BuHXHzA7IxswhsNivo54UEEN+bICrA5y1hu
         tg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783503966; x=1784108766;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtR//zQiUlV4dZx/AK4ynLekM3lwGq+j2YQbvXNl5g4=;
        b=LdOlJDBRV5p6Sh8svtM6gyEDItolebg2Fa6RtoyXy99gn4V5NzvCjHqQLApQ8CJyGm
         IYwHrIRJXML8zSin2Z80UpAoZSMwHoD5fWsaeOm0i7NwI+QbbAHtwNPxhic2HrxKh+TW
         EFi5Boe18HDUkQTskAnL/JzOclVQfZaz/+GE2dcuAp16EN2A/2ytK0NotqqUjb2uLBif
         FzipAVd7xLRegPo1SupXbwc14EcAozLpVhBoP2Pi6EKrsyUuBNT14cYN7Fk9a50msZ0y
         LfnDkzCD4i5QGiSVKiKm8eV/DrNR4CxQZJy3usHZPZNOQRLVIkK7qMzJ1ixb0vI3WPYS
         4Prg==
X-Forwarded-Encrypted: i=1; AFNElJ/dHULy6MBTPryU04cgtI1QFy5umIcX6dc9fUf4IoSSYhm9kZ1sO+SBoMtLdWijTlBNUvH3RrnFlGO3@vger.kernel.org
X-Gm-Message-State: AOJu0YzbrmB/bfFjci8CnpUiQuk+/OPw1cLKmm8C4HtBF49s4FhokV6x
	rMMxdanGhAPWBl5uByoW9zqBMqOAJUlV0xz1bknNsOnTJySQdyQ01PtWLx3gYXWeqW7EsmK3JRC
	8eYFwdYyeI4OzOjKMwzPTUE2JdFni5zcTVf4imf/ougvbaCWzQXyOm1q70w==
X-Gm-Gg: AfdE7cnFRV6sotxnjSPouuEV5+FJA137WoS1azkbjWWAr5PUIpd7ZXXT6U39mJgZiJQ
	2g98UBSbHDl07/f+KqB9JfE2/6Hqz/mmZFt0xG2zgoKqwlXVnlYpTsg2RB8q4qVCGJIJ/X76UAy
	3pZcBitXHeybr+W/sLxigdx9AOsqMpfMtV7F/xUtqbK0cCiy1kuqxPm3BXosp4LxSrbCtxsHk3P
	cvK2c8a6B5hmr4kUVeMcdeQOeESoUlaJ9f2Kum+YNI/1Sml4JE7JtHMmkEuPgLqX7Val3pl
X-Received: by 2002:a05:6830:6585:b0:7d7:fd71:f2d4 with SMTP id
 46e09a7af769-7ebced3469dmr1159039a34.3.1783503966285; Wed, 08 Jul 2026
 02:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706114731.57353-1-ccaione@baylibre.com> <20260706115959.2119B1F000E9@smtp.kernel.org>
In-Reply-To: <20260706115959.2119B1F000E9@smtp.kernel.org>
From: Carlo Caione <ccaione@baylibre.com>
Date: Wed, 8 Jul 2026 11:45:54 +0200
X-Gm-Features: AVVi8Cfh_EaTJXwa64517rQoRlvBJxx-iFga0XbQN4X6x5I9LAbdYeR2RVfh9j0
Message-ID: <CADh8LsfpTXB1jHtRaOTySyVvcjOL08MRfMP8OCZzZiZ=o29y6A@mail.gmail.com>
Subject: Re: [PATCH v2] of/address: Fix NULL bus dereference in of_pci_range_parser_one()
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	saravanak@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 1:59=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Missing upper bound validation for `#size-cells` (`ns`) allows `=
np` to overflow to a negative value, bypassing range bounds checks and caus=
ing an infinite out-of-bounds read loop.

Since this is a pre-existing issue I'm not going to fix it in this
patch. It will be considered for a follow up but for now this is
out-of-scope.

--
Carlo Caione
