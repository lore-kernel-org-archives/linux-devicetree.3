Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408254C900A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 15:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042235; cv=pass; b=oYyBNy9U6n6vze5yMVtMJWOlGktWW614N/KRasg3HMbjZ86StstL7WMlbvnOVgZxUNb4PDYpY8EwwnPALuT4vJpZn/V2NHEkxtnegxFd8Ub0ChtSRGfM580qTwHfmKh9Imp5c/InfyBxbSRc66dZfUcQIxPlw6lvj3fpYsX1h98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042235; c=relaxed/simple;
	bh=QCZioSxZUKRoFUoafPKC6kOcWAwiCPQKbHmk8VnfLNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohB8bvWtiEqUtJ4hQZINdlJr9wuvJTAVnkDndemAYMsWbnHIE2N77YbxTm2ToeIdrAy/RYMCnG/rRzJdZ5bj4qghps4E9/Wq5fj651bmeUphKakdtQcg41z/MCHlGM2ycHP0DFZvNyktDGnqtFa/WerFDRL6InjEhLOo2xNqswE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPeR6BDE; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPeR6BDE"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69ccd6483acso1855026a12.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784042232; cv=none;
        d=google.com; s=arc-20260327;
        b=GfMsaQpwHoLbOnVZzKwMBDAdy4pc5scep2z39WzJnGcJK3mNEY8thSDfH2FUgk0wdc
         QQlRY3lc3eKfeCV46BEs65+NQr7PHi7qhKcqIiURCFuOu2x2mcoUT84pPWg8TQt72b3R
         fxPLdPQxI0tBV2P4rF+XS+B1TnQ9aRA7Nmn1Ms4xhbp0EZUIT6kMOeluyzIxjt41Nbba
         +VyijVpBS2xwxio24n6ypT2+aCsDU0wpHXXyxsWsX/bRNx0tTcr0/2eWOq24crZfqdpa
         S0ZIa4DyXfXm/MqYG0VL+xAFtzFNN5Op4W5JLQb21/axnbMDQN8sXk8+0rlQDKifKQlH
         ZxdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QCZioSxZUKRoFUoafPKC6kOcWAwiCPQKbHmk8VnfLNk=;
        fh=oGnv47YTFwhGGbSHsfn3KfCJwmk9Inhu5u7OaENlJRs=;
        b=sJFNKjqHFv6R3suOrz/x9fIsMW3sc1LjdR43xu7BJPTL3fr4MJ/6Z9cEsRzLB9mxb3
         xYGjSLAuTEkPg/HKIqlAp/MGuPmeMj9daJSXv1XBEfLXsFU/iOnkhMSuKOuOIZkWGtAn
         5tQRZWB6Qn4ee27YeOWjMHlF/GEHk03rQC2k2hCgyvctN2vnyZXLOGrUsmal3e56GGV1
         5p4/6qB39L0oXmvcluN1gPrzc3zwIQ4zoyoW7YKhM8Qn2hVdDvgjeDqiHVsA28Iz+2BQ
         QkQ8Mhz51gMNtIqzBa5T8DZfK+5LP1kV5U9KAgAysuUyAqjKxSgZyVkaJjffJlKN/BqM
         QhPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784042232; x=1784647032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QCZioSxZUKRoFUoafPKC6kOcWAwiCPQKbHmk8VnfLNk=;
        b=LPeR6BDESJqRiIsD1IM/rYLbAmyX/h2rvaIh3fYDndOfzssxokg4QwGypqxhbsaWz7
         +sOAq9S0YnaEm+BSUlZIYM1izGKstRKsFnHBk58WtBd1zD0XnKOzGCHJU6I2pbp38sg0
         7X8cRe4PsJDEEjJPW/c7y7I0D/h3wOjXBAXnc6UaD8Q3AK77x9paSeO+4mPyXwssVoKl
         WJalWh/KYJ8XtDuKnLncvD7ASLxWnYlxxIPtnA7k7Yu0ppiKTwQumfwXvldXQ3XVK0RJ
         vIIIBefHdrFTBsClmZsS90etF8c8r/Iu70LZNkmjbKf7rALbqlURe+bAZg23gtgSEPlC
         RjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042232; x=1784647032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCZioSxZUKRoFUoafPKC6kOcWAwiCPQKbHmk8VnfLNk=;
        b=sOr92Aj5HOiUUgHxugxD7OwbQYWE15PrPuHkQHVYsCv3RTPQqASsfiUS8PnnTub3R/
         B1abFg+gzmOpniDfbFxd+trZnsmaSiUNmYKqXpSmM7TIye8wsFsb3xabtrP8CxuV4Ip5
         HKGyhSndHNKyL+0d+2L6Ry6FR38Q4dh9OYKYwb48f/vXULftR7x+o9/rh7UzFfeN5MnU
         TPAUOMhzn+5SHFD8Tr3KR2cp9YJDW+DQ29FO2d1oan5M02J8zwft+jrp96iIVT0PbWXn
         RxBTTbcTVkTOo8qkQwSuMkVM62UYdO0i8fwqqTyPmZAMKlyN1eEQ/o7NNUq0dyghjYMU
         5L0w==
X-Forwarded-Encrypted: i=1; AHgh+RpUXOOT0klQ22dcGYxM4FsJCwGng8IRtMCnXCuW5Pzro+8aC5WlpcXlD7jyRjnv/yUjznzhvgkB5JQv@vger.kernel.org
X-Gm-Message-State: AOJu0YzPrwrkwYhZ8NBuNvuoYjWBm2dfIzbFo9Es7UKWqJ1sMjuNchEr
	ImsnYHNdtuHSWtGtwyaNLaSUmeDCkxjfCs+qP8Ajcg2JDCV91FRAbSEeCytqb2Jm/xEdSAxKBZi
	RSD/04ObTX4lx3iHf7mh/HQJCULQi8/VhrLhC
X-Gm-Gg: AfdE7cnKPM7OX2AGli3/r3corRX9PcFWrxqFKkRsr5iMkftUSB5CRT53xm+39Q++KCq
	qI2wir/HESdMMP//0Rh+Nrzmgpax2h1c7SXzA8ztFmXQu/ti6UMk4peVzggCaEE2s2vurg+Huxk
	/0A2ZxgBEkAUc9CHEGon5wvD7KygqPofhrrAhJGxr/b92nkthh/OsLP0UPj4770MyiCQdZlTOk8
	sxJiVKAnBYsWl2LavAWUb++yiuV+XIAVtYbp4JBLo0Qiumg7CmcapInJoVgKbGE4JkEBMkU9A==
X-Received: by 2002:a17:907:da16:b0:c16:534:6a30 with SMTP id
 a640c23a62f3a-c1667bb3a0dmr153796766b.58.1784042232390; Tue, 14 Jul 2026
 08:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713131223.279555-1-a.shimko.dev@gmail.com>
 <20260713131223.279555-2-a.shimko.dev@gmail.com> <20260714131728.6C94F1F000E9@smtp.kernel.org>
In-Reply-To: <20260714131728.6C94F1F000E9@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 14 Jul 2026 18:17:00 +0300
X-Gm-Features: AUfX_mxoe0WVqnkvs3GVvNEK0y0uCrWT_C7Lanjv8yWfj1dW_K7a-g6ZJXk_Svs
Message-ID: <CAOPX7470Xdk=O6xxQRUyiYg25yQfXDpD+MEeAWwVyLVF8zQJKA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: add DAPU Telecom
 DAP8211R(I) PHY binding
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 4:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> [Severity: Medium]
> Since this property is a vendor-specific extension, should it include a
> vendor prefix like dapu,tx-inverted-clk? Introducing custom properties
> without a prefix risks colliding with future standard properties.
It will be fixed.

> [Severity: Medium]
> Will this compatible string cause the example to bypass validation for th=
is
> schema? The schema requires the compatible string to be exactly
> "ethernet-phy-id0008.011b". If the example is not evaluated against this
> file's schema, it can hide other validation failures.
It will be fixed.

> [Severity: Medium]
> Will this value trigger a validation error when the compatible string
> mismatch is fixed? The tx-internal-delay-ps property enforces an enum wit=
h
> strict 150 ps steps, and 1150 is not in the list of allowed values.
I wanted to show that you can specify values other than just multiples
of 150 ps. But I think that would be unnecessary.
It will be fixed.
--
Best regards,
Artem
