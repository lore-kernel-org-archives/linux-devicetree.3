Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427570;
	b=umEgtujRXiAM5WpLWIo9hMKW2/JVgua0nuhETLPH3mVcQ6SikTHsdN77d/p/etsnf/bu
	 /4iUX/6Gg/xVWpXx2FVY5eZ9ZRV6ft4hzNKKqmfhuuCUjUzy1BTFVssh4/3R0sUGYUuZj
	 tJ7vyk9rbk9Mu2vB5f5W5QUQCw+ZYMAm/v8ZGhoXjt80N7i6amOQi4AGhXB6LrZtC0oIJ
	 Eq0egrVbtzhL2544M1pSJLNF8J+JfLu5x/U1/Fl+1L+Ne6kuxEoesgEaZcTBNaBaJr9wf
	 E2Kp022k4JeCAk130qXBnwDynSbarz8eTZxCjpCuR5AHi35aU4fFThVkLJG2iNnpUiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427570;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ItO+x4ChvjJLyZ+/whqfIj5D6veayT5gUAtDxT5QlA4=;
	b=ABeHEE5YrJqh1ACaWW5jQqGujd2qbNV6GtpOInFN7uZmNi9CQ9HmmTZyGo9uz3gjUeBJ
	 +Dd1Iw9/J19OjGhxT3P0uFjhggFO1qYtU9FqTBwxttssq9+0kdL+qQmc5Daz1PVV2KI53
	 aN6T4dr5vfltULsOUO2zz4bFQshz03SEzGdEJ5P4bCKaIh/6Y9128m7H8DXyLYKyGm/p+
	 4llQDlp3gf28aSWHHfcp1c6yBgeQeAHZqVZJb7cedMIkAxVm2j5SL31Pw53g7kT/rPUg9
	 dX67VnfFdK4nI7cvMhsuU+jzxHcBTKFWm1v9wCDYrkRsdB6LAWC0ishlC/j4SH7SlAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1pUXR9+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236C5606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h1pUXR9+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFE81F000C0;
	Mon, 23 Nov 2026 09:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427569;
	bh=ItO+x4ChvjJLyZ+/whqfIj5D6veayT5gUAtDxT5QlA4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h1pUXR9+9vCZ6jOD2DKAFd445rlUTnG+N8VOQrEgc3WNU89nGjDubIo7SROk1vqW7
	 yOHz3K59fczfyI06AW0QWatZ38dijLzihSKwqPbQramV3ANnmY23Zmj+hBXFVI1toj
	 5aUoDb8JIWvYpi6S/WAX6Sgsd/E/cwWdowrDk5GM/ihkX1GZEgTB5vHIXkybUOrCFv
	 oi+2tHrzLyPwFT3zu8Lz64bg9cMPWqixpGFU1MM/43YJAiqV69lCx5igTBt5kasbF8
	 U/oSjENhyvmfv8h6UhKspziHgkeAbE8qmN8oO7xQxrbYRZgpz0FAz7+tBc6J8Af5hl
	 DILJGMfS/07MQ==
Message-ID: <sashiko-outbox-229012@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] spi: dt-bindings: loongson,ls2k-spi: Document
 loongson,ls2k0300-spi compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <00177b3d15224a5f92b73789cbcbcde4d71922a9.1795425389.git.zhoubinbin@loongson.cn>
References: <cover.1795425389.git.zhoubinbin@loongson.cn>
 <00177b3d15224a5f92b73789cbcbcde4d71922a9.1795425389.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 09:52:48 +0000
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
- [Low] spi: dt-bindings: changelog omits addition of interrupts
  property
--

commit 69ba92a75f7fc4022285efadae2a4866e7663918
Author: Binbin Zhou <zhoubinbin@loongson.cn>

spi: dt-bindings: loongson,ls2k-spi: Document loongson,ls2k0300-spi compati=
ble

This commit adds the loongson,ls2k0300-spi compatible string and an
optional interrupts property to the Loongson LS2K SPI binding schema.

> diff --git a/Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml=
 b/Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml
> index de9d32feadf59..8a36dbece7885 100644
> --- a/Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/loongson,ls2k-spi.yaml
> @@ -19,6 +19,7 @@ properties:
>            - loongson,ls2k1000-spi
>        - items:
>            - enum:
> +              - loongson,ls2k0300-spi
>                - loongson,ls2k0500-spi
>            - const: loongson,ls2k1000-spi
> =20
> @@ -28,6 +29,9 @@ properties:
>    clocks:
>      maxItems: 1
> =20
> +  interrupts:
> +    maxItems: 1

[Severity: Low]
This isn't a bug, but the commit message only mentions adding the
loongson,ls2k0300-spi compatible string and omits the addition of the
interrupts property to the schema.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795425389.gi=
t.zhoubinbin@loongson.cn?part=3D1
