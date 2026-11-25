Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615039;
	b=l+1HuFyvrbrCDGy/SA/7LEgzNoPJpC54VMfBzA31JQjd8fZqmowWK/nYi51ko73YEOLy
	 gnQEoNHq3QhUt4hTs1VeFYsLkSXOOdVZOAJmB0JrrU4l5eO92mYkz/wSTe5WR7q3BqlHJ
	 hDIj3JKGUcsRr/f+1dVRem1Ll1fMlIPAyoLQEqY7EK8Z0kFuI1Pj38v0KLMIv4/TuO04b
	 O/MpfTfLS1pbGxClS36ce1OltFdHmbu+FsoVfaUMq7kE2GuUiV56nXaKuKt/ygneS7keO
	 gqP/LCj8bCD2f8dpDhFkDDFr5RhoahnnSZEUy/aI752fbU6BqpZB8Xyhy5NEOIkOkdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615039;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0GJWek9ysI/dnWdEkThevMWsXP8r/NzutxoOXo5TZM0=;
	b=nSSUL8PPF2qUPrVtX8vuxZLOsDxdu4mSWgWeG60Kt9I2N9saMtYjno0M84p9nMgkrEtf
	 bkItJ0sPo/vsje15OH7oebR49mSeFadEr/EHbi8/CwDZDxzrMmnYfBh7DB6mzz5t4icdR
	 kG9s6K1TLR+tBgfLEzWW3YoB5b+6PYC2HSYGpVx9B/UETZ8mfQ2UVB3MaynwM0O70EtZh
	 WMpI/vbDA0bqGiFOwyoEnVO3VCMDogvsJpCe4Kz4JdaE31W8OhdQu4nuvkZm58+7MVoku
	 ch4pSSqV3GfbV9tRE7JZL5Krhyrvo2uSzKclgB17wJZhcPQob2mZF9LkRR5hKnetLsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2R18SQ0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF3C606A338
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2R18SQ0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9211F000CA;
	Wed, 25 Nov 2026 13:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615038;
	bh=0GJWek9ysI/dnWdEkThevMWsXP8r/NzutxoOXo5TZM0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H2R18SQ0t+J+JbsHcnVZOTmrk6o/Vz+K83k4IzgEbFfsjzteRS+O6A09hKUpR7ZPb
	 WgqzH3mbnjP2NIU7bA6hmrjIyU4q08Y8Hct8QcQwyZU1mAtNE1E8dGA+5hhW4uqNsL
	 lZ1C/mtQ0yybn5dEdLzJwr9s4vstaeEXeIWJekgahYY7qtVm5urJrTPLUnwwKCxGlA
	 EYfdaaPAyJ1oiha47re7Kv/XtDbE8YWuc5rm+13UpAf4iybAYol3vevyjZ4t1kcsUj
	 9uxmpFbYD4yWR50Q5L0t6swDuv3kBOdaTTPJEgQRfwHfBinKtFr4PajzbfnoTBg1+8
	 C4ti4lMBoZLpQ==
Message-ID: <sashiko-outbox-233511@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: hwlock: st,stm32-hwspinlock: add mailbox
 cells and interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gerard Marull-Paretas" <gerard@teslabs.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125135231.98914-1-gerard@teslabs.com>
References: <20261125135231.98914-1-gerard@teslabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:57:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: hwlock: interrupts placed before clocks in
  properties
--

commit 94e93b8064cef375edbe40c9efd2a2628ce5d7ac
Author: Gerard Marull-Paretas <gerard@teslabs.com>

dt-bindings: hwlock: st,stm32-hwspinlock: add mailbox cells and interrupt

This commit adds the #mbox-cells and interrupts properties to the
st,stm32-hwspinlock DT binding schema so hardware semaphores can be
described as inter-core doorbells.

> diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock=
.yaml b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
> index 829d1fdf4c674..3b8d872b7c21d 100644
> --- a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
> +++ b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
> @@ -9,16 +9,30 @@ title: STMicroelectronics STM32 Hardware Spinlock
>  maintainers:
>    - Fabien Dessenne <fabien.dessenne@foss.st.com>
> =20
> +description: |
> +  Hardware semaphores, which also ring doorbells between the cores of a
> +  multi-core part: releasing a semaphore raises the interrupt of each co=
re
> +  that enabled it, and the core taking the doorbell clears it in its
> +  interrupt status.
> +
>  properties:
>    "#hwlock-cells":
>      const: 1
> =20
> +  "#mbox-cells":
> +    const: 1
> +    description: The semaphore ringing the doorbell.
> +
>    compatible:
>      const: st,stm32-hwspinlock
> =20
>    reg:
>      maxItems: 1
> =20
> +  interrupts:
> +    maxItems: 1
> +    description: The interrupt of the semaphores for the CPU the descrip=
tion is for.
> +
>    clocks:
>      maxItems: 1

[Severity: Low]
Should interrupts be placed after clock-names to follow the canonical DT
binding property order (compatible, reg, clocks, clock-names, interrupts)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125135231.9891=
4-1-gerard@teslabs.com?part=3D1
