Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339581;
	b=JtmMwJbJrju6MZZVqhlsKZVJT+xcR6D3GHfQlJHbBsmZL/GKHtKSq4Vdlm7kbRWxFf6t
	 p2Weo0aHaXT/p1cdvRriRIh6KSD+Jr4M7zGRNXvhIgyxmRdrMOAMmP1WjFxF6wCl+0aHk
	 FV9HlITmuboaHrUKc7jaHxazLt5GwmP3W/zAOSIhRCu1ERUvIJSuxJha4wSe+upkQd03M
	 6xRNuMaQjls3lT1ywALdN0i/IsSB6QweDfeeCuaGmKea9QnSYvHTzvaYm2JyoEDiF2tCG
	 IO57ZDnQrc5zXUr8r2/FK/CAZ/srtb+I9Wyrjz2/b3PZxiybEBvboJqOWobQ/wG1MTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339581;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/wvawJ8wNc6NBpYFbJy9IZ7NlJE5h0W6cYFfyspH7rY=;
	b=rznCbqITkIS2vEUmTV8y6e2/lumtfPEKLqHRg7Jq0n2sk2uJ/NZVR/Vwq/UJQgyiAC8u
	 FY7YxRL/L4jXg3bV8x6W+UB+y6PB9sujz8YIjkpbnIUB1FgLBNRTuMvvxgy1THkFpFqrH
	 K+MX54V8odVmJL/m8bbJssNiNvUJwiSPzMo7otjSTkryjiD34SrhVjSbwvQ/5jRvYd2bt
	 RRWFRjQh3zL/SsJ/Hypsq9ZmUyWx5Jei8EcxCUiAGWYOC51BuhXs0Rs+gKxdHFWduJ1Fl
	 dYEjXrSmXT0BmXIAxDAWRsY2bkWVYVPxYXZsKgWwYCFCBEqmPVgqkGQQA4Q0WOhGzoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dsSq5Hsc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4964F606A330
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dsSq5Hsc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD62C1F000CF
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795339580;
	bh=/wvawJ8wNc6NBpYFbJy9IZ7NlJE5h0W6cYFfyspH7rY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dsSq5HsczsDN+LrGIBNKTo3zf+TdG1bCtE87bfiqxU10NCujZkx2332l3VEy70zuQ
	 BvZ3Pu/Q+cAYxkQfKKdbuZZjrfJEAo+4FqESpZA8bPNWNwlhyrnADDH9IK3Gxnb6fV
	 BR7FKaflsbUEimx+u73iWo87wUXMuVMf7ELMGYxLck50n6//Z4dhmdaa818qVwnv6A
	 xCD6GCy9eh4RRufq2ThtzJeWNpmXcZH5pjXr+KhgNNCLgNuJXDdq5wEs/Dr0YkLiQ5
	 R924KjnCaO/qBL3wfYnhUqMzT2wm20YLsEUuA4zlPw4yd0WUtr/IRsYG6/7QzbBla0
	 WT0SmOSma27ug==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so1403293e87.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:26:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHmEIRQI1eWikBhyCiJmUJJ84BEqELDsw+ATiHTClosUuShD0dwkZ3jSvWjQpJTx0Tb+R7RvtMdatuS@vger.kernel.org
X-Gm-Message-State: APuU4Z+FXBuDoJyRvg2Vx6OXV1HCu9nXXGq1thToflYw4kdwcBj0Wmig
	aDWZDb8F3uSvyBy4cdCWAWIIMngliiI1RxT4MCSZmcnr9nTlHDi6rYmldZs3U0BDe24OrARdsI5
	m5PA8jWwHNL/SG8yvAd3gcRf91EjOu64=
X-Received: by 2002:a05:6512:3ca9:b0:5c1:4f88:9af6 with SMTP id
 2adb3069b0e04-5c1bc8198fcmr2613273e87.54.1795339579651; Sun, 22 Nov 2026
 01:26:19 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-ux500-timer-twd-binding-v1-1-58099a54a440@kernel.org>
In-Reply-To: <20261116-ux500-timer-twd-binding-v1-1-58099a54a440@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 10:26:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLma2AZstGAAmCHRFouwC7fNQB5d3=LTjx42fSQBKsHDOQ@mail.gmail.com>
X-Gm-Features: Aa3M54oH6pauVybRm7ssp9GjVhjox8gdVjmBgukmIsJeJcWrZK2JGKkIS_nXdRQ
Message-ID: <CAD++jLma2AZstGAAmCHRFouwC7fNQB5d3=LTjx42fSQBKsHDOQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: arm,twd-timer: Allow power domains
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, Nov 16, 2026 at 10:48=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:

> Allow TWD timer nodes to reference their power domain.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Allow ARM TWD timer nodes to reference their power domain.

Is this something you could take through the bindings tree?

I don't think the timer people would mind. (Or else they can
say so...)

Yours,
Linus Walleij
