Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7927937E2E4
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159111; cv=none; b=IX3gmXEm5h20evfy3F6MefM/Wb/FSLABXYxSOH1+ha38Vgn0Ossmu/GrwS9Ue5Yh45PPHZkqlxDBZY9QU9v9oiVSzAqCeCHaGRDZG+fUiXWejyv3HT//VUy/c7UqKcx3rFtFqeiWr3cc+M+KubUfJ+B2X4smMWRWgzbbKUE/lGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159111; c=relaxed/simple;
	bh=xMRZ/YioDGD5qZ+6uqVpdRktvjMuhXrPGr3NK/pQ9Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VeouXWDKhUZPRHmww9y2VZQDgfBldBRsmsDW/3SK+ZYugXmvxfSl+rWvKecV54D+8N+VOel/NJvLJtXJIG5MVYYY9Z+06rRHJYeyw1+Ff88gZdO+z65LtNK81KtFWljG6SGwQ0pGhdx30Q17Lsjz/S/ZnDmIXFJTZ4+E2Hw/NM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RhsHxpE9; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RhsHxpE9"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfbbe5220dso74512e0c.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787159109; x=1787763909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xMRZ/YioDGD5qZ+6uqVpdRktvjMuhXrPGr3NK/pQ9Z8=;
        b=RhsHxpE9x8C+EqGsZpQsZVGaELWyxK2xTHM7hiBZiOibgxXj1/gPe2WkkodK6cxay7
         dJHzcRN4u9z4++vD79r6IvQVZx9vvvs8y3UTtupdJEga6BxviTdM+lJBokjYsti3Wptp
         y8PkxlYhI6aWGIY8CNcocNYye3xXCpPXy0KC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159109; x=1787763909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xMRZ/YioDGD5qZ+6uqVpdRktvjMuhXrPGr3NK/pQ9Z8=;
        b=lwHyjqNUh9JUOeXNy9EQTVdxc1H8bv+DINy3/hmjqycYJ4A9aT0W5QrB9oXrWYrGrT
         5CE0w/ZTkCeQqNwQT7j9pJOemyhU/HEoQSBveDGEWGVnrzhHr8ZuKuCGzvfeYnKa5Rv0
         xjk4lYYGuLDvZ6QccIalYxhpBmuMaj83iruMc/ln/JC11cdOiD78ZT+WximOkXEPDwpQ
         IRWf99WtO47LRMv6ZI46Pt+CS8LidQ4WQy6Mws+E1Mkbsl4ExvDoj7Tf5QiMqucfidRt
         juqF2J2ecGy3Pa2URG/fmN8psi96tH/20I6BTkzNuQICU2jGYZfFVxD9genFKT5tG3UQ
         kL1w==
X-Forwarded-Encrypted: i=1; AHgh+RooZSdO0tmF4OkWH4BJMDyYwscphJhUjWlpk2NMYaYvifHfwkYKtzvmC/I0O1GTnCBDH3JucpglwvfH@vger.kernel.org
X-Gm-Message-State: AOJu0YxuRG2Zdzyqf0vXwWoVl4knsBzXaI2S/V4fUIUcMR3C5FRwL2R+
	/rql5a4TezQfJWKShHNUpNn7mBSPSutVNy544CO9A+gMa8nxa8z1MvDP4IhGYSogKDwqfOaxT/V
	faO4=
X-Gm-Gg: AR+sD12qmijkR+LFVoY47YLo9gZrx2+CTR3ri9mY262D+U/uI7pNtDLZjFv0NfOH50Q
	s0JDdt3niwhAfxdkCRkU6xaE731FOuHVcv60eEJE23ZUWmUyJrra2xbaMqsRxZkQWNEuVLXnWPg
	MfbQ23rCmA4Vs1zU87D6jKgS+yNhFRPloO3QUmkCxp1y8nuBaeKuZayVvg/FO9B/jdRTKlXjgKL
	d27NR+NKGt3juXVm61j9BT6z9pKk3gKKYlnJMcOtQmGAqB6hDGrIqXOWglwx8MVmX7Byfp13cmr
	RhVbSd/l+dM/guxdxnyuSBk51ywUxUQO2kwgjaV/tQXX3EktMyElxcyZ/zUWryQVaBQpFJ0Ubur
	ha1Mtvj90seTzErkPytk4jx2MU3P/DaWjYUGVjFX8zr39GHURaxVeqO4IlN/2lOuhF5f3kdweMV
	oPBaxTdrPX/vx7ZYNVdktQRtwdarjW64tfFEC2xMDgzOJGjJgZr5Yf5QT4j46JxDF4GcggakBXV
	nnjgzczi7u/eMZd5X6d9S+LMz8QCjxgQzwRbA==
X-Received: by 2002:a05:6122:4893:b0:575:f155:8cd4 with SMTP id 71dfb90a1353d-5c5eee17276mr227013e0c.0.1787159109432;
        Wed, 19 Aug 2026 10:05:09 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e27ec648sm2897774e0c.15.2026.08.19.10.05.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 10:05:02 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso85395241.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:05:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrlb8gm/K47EF0h3kS8KOqnH4YHsAJvPm3UK2KiEuFw6tmodVWsddbBDpje12gT0YO8IA6AFpYDIB/+@vger.kernel.org
X-Received: by 2002:a05:6102:4449:20b0:76b:2548:560a with SMTP id
 ada2fe7eead31-778f37d8a97mr140907137.16.1787159100271; Wed, 19 Aug 2026
 10:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com> <72ec1b1f-112d-4f65-897e-e99652c5a7bf@kernel.org>
In-Reply-To: <72ec1b1f-112d-4f65-897e-e99652c5a7bf@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 10:04:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=ViYUB6NXKVNxnPGwvkHzKnNQQSJfLRhVx7T-S8t0kqKg@mail.gmail.com>
X-Gm-Features: AcwNN1UtXmY_Pr6A3vg9yN6JPfaZdRsVgtlhCWAfgMFRKlEKan_CTSIL5IjyAS4
Message-ID: <CAD=FV=ViYUB6NXKVNxnPGwvkHzKnNQQSJfLRhVx7T-S8t0kqKg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 19, 2026 at 2:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/08/2026 00:13, Doug Anderson wrote:
> > I did some digging. As far as I can tell:
> >
> > * Nothing in the DeviceTree specification 0.4 [1] mentions that
> > aliases are deprecated.
> >
> > * Nothing in the dt-schema repository [2] causes validation to fail
> > when you use new aliases and there is no "allowlist" of old aliases
> > that are allowed for historical reasons.
> >
> > * There is a single reference in the kernel "Documentation/devicetree"
> > about not using aliases to assign an "instance ID" [3].
>
>
> No. The rule is saying: Do not add instance index properties OR custom
> OF aliases.
>
> Logical "OR" means here that for you this sentence is equal to:
> "Do not add custom OF aliases."

That feels like a stretch. While that interpretation is correct if you
read just that sentence in isolation, in the context of the patch as a
whole it feels clear that the point was that you didn't want aliases
specifically because they were used to assign instance IDs. The
patch's subject is "Document discouraged instance IDs", not "document
that aliases are bad" or even "document a bunch of bad things". The
sentence is also in a paragraph that's all about instance IDs.

While I understand you authored the patch, it still feels hard to read
"all aliases are bad" from it.


-Doug
