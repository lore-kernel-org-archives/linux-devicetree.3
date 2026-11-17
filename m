Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940987;
	b=py93sgLqI7fuLGEO3mycSuFMg8fd6YJ1KxJIy1LFHqQEHPCC9vhu7wwzklXp3Xxrj/ci
	 HlIRr9BWZDHZL1yWYBQB9nYURXszEt1QevNJFfY88Xf0pAIUp81zx0P7LD17xEtIie32N
	 I7J/0YrajLhkGds5wowODCTAx4Hb9V9i/ZV9kSaQw/tg9x0I5FJg+2ycYWQZUSb5AKLLP
	 SZYeT23cb72iOroMcN1XFF92D4X/NcQoQrCTfhG/WI73FDEkKALHi05MvxQqASWa9mN8u
	 eb5zFSYQJu5+R12a5Iy27H+I9RTyBMGBfFIGh9900QkXy7dEegv6AfT31E5Eri5MWGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940987;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=zIGvUewNsRTdPr0jJVgj2QAD5kTHSSw3BLau696dnAk=;
	b=D/X6odWVx+gRcCZh7cdjlQmjuM1hs6tmBABxiZlJxdDgPkd+5YzZjfx71EXuUdr/NkPL
	 4k4w7oVb1EsixA9dZF8FnknflwDPpXuxHeQZnuUkAakt2YiYEauS1aThXWSSTIeM3Rsr2
	 G3BQdybAkQY242pxpkbJHQzFVjHN5HYuIzPNo7pP2sSaiXYvLUGLnJS/l2mtRBsP5WEXz
	 s4XIkGYjy07+9+NPrOaPHqRaFUdm/ZNssLQMHU5+ufvuuVZzOhlOK5Up2FdWO/U4O7Uuw
	 q5MsmH2iS4lXKBJ2IkJnadPBSBHHbfqdwBfEU5rbN+2fKVBX878DlAWWLFqOt6adeTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VF5p8wjL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC03606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VF5p8wjL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4F21F000C7
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940986;
	bh=zIGvUewNsRTdPr0jJVgj2QAD5kTHSSw3BLau696dnAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VF5p8wjL7PL/JS3vl0S7ntAp2WJXS4DVnjQ5iGeuX57IRLW55+VTHQY55gkOe5SAm
	 Vz0cKilSlQso0Lq+HiOli9QrY95s7qLVoWbcKxuENjYaEN7K23po4hzbt8YRttHuci
	 VqGmtFQoYKK3ttjNKS0I4+C48BR2tFozew4H1L5QEKwederraqvMsJCSpuWZDMRS2a
	 j0Iuxf2uo/5tdXINbqXNYBR7MhMWE6IeitmKG3I+iy0AC2slw0m3DLZGf42Lfvfdou
	 ILCuwm1g21kjhUKdEH1dpwxWNFgS20PvU6TgfCNQ6KGDqW7BYUwJ6Og11/dLRlfc5c
	 PSLXVMJdlpCfw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso61805e87.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:43:06 -0800 (PST)
X-Gm-Message-State: APuU4Z8wM2CIDtpLvQNJz9zZuk9yGSCV7cV9yvHC2GYXMYqqmleja2Wi
	5oD9r0JddEJcqs+rVVHfu7MyzRme6pWHfB20xOWoTEweyhCBM4wJlx7rUdfxgPw8VScncX8pzgl
	gJh35NgXijFpVmRzzZTOxDq12NMuhcKA=
X-Received: by 2002:a05:6512:2c09:b0:5c1:5bca:d210 with SMTP id
 2adb3069b0e04-5c1a9f2d252mr12434e87.55.1794940985373; Tue, 17 Nov 2026
 10:43:05 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-ux500-powerdomain-dts-v1-0-e0f4459c3ab1@kernel.org>
 <20261116-ux500-powerdomain-dts-v1-3-e0f4459c3ab1@kernel.org> <sashiko-outbox-216743@kernel.org>
In-Reply-To: <sashiko-outbox-216743@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 19:42:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLkzqVLBa5fe3VvEpgnD6=x+uR3vxX_6sNkz5sCm5UcN+g@mail.gmail.com>
X-Gm-Features: Aa3M54qKG1kvBA8YkzUjaHtAa5J5mSXGR9jjOgrpWVnYUeSb7Ffo_T-ts2cv138
Message-ID: <CAD++jLkzqVLBa5fe3VvEpgnD6=x+uR3vxX_6sNkz5sCm5UcN+g@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: ux500: Remove DB8500 EPOD regulators
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:31=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: Low]
> Does dropping v-ape-supply from msp0 through msp3 break dtbs_check agains=
t
> Documentation/devicetree/bindings/sound/stericsson,ux500-msp-i2s.yaml?
> That schema still lists v-ape-supply under required and sets
> unevaluatedProperties: false without documenting power-domains.

Patch for this has been sent in parallel.

Yours,
Linus Walleij
