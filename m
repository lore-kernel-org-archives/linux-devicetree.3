Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371917;
	b=LrxferVbEMxCRPksA2xd4Axa346Ef051rd/BBDvCnZVdrS0naw/J6oSsrKmHUg5ihACf
	 PUGiqXJ4IfyZ/wBJ6LEkhTcmPZuWHr+kBJc5JXM3y9uarenoAa+GoORRYw6hwznKoLJwr
	 /SFxwPo0BO3xuceoh3+/1+JElDohMCW6zxSDxcnzxaGw5JQyt/Q+apAKyWWhofVlxta7/
	 WkGn9hVxkuCMp2b5EeOUG3L8RofrrSNIUmh9UlNKvcKos1UlWaMHzcRyYG93Eltbcgng8
	 6R2JEo6QTMMYdxbqU8stIdDGt/2dve1p7Ku9h3nQ1iDjHyr5vbJpNynb/3/KmoUc5rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371917;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1lgSvXfM1NpguQppsGiqChdK8jo6yWYjCTv/SuCYsSU=;
	b=5mWTNY/tbZLH128cj33TGTSwJXNgtccQjexMmPvdjj0sHUOp7zxaHRhotTcI+dyEA2W+
	 za3JJFYu5qM4uPugHDNrXZOHrGUfJx//87IA+8MytIPFl73JC5vAYWVkEr8YYloZBjaJY
	 kwsTyhzIgpi94DARaluEi8t/cyE/0uFyREQZ9OAsag/vmJ55f2a0jdhkEvD+K1RzBcVUI
	 xPzAutX89WfPFnVmQzXuYXEeTwEW3yrhwaqEPr8FPIX1mRTbtjHLdWmXR48D6RDutjYYC
	 2iAIgrYGKvWj9fIx5n+AmDg/4lCLoXTzRGUBIt493C+q9b5H1mAMWhsW1powsmbS2mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQqwl5KL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFF1606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQqwl5KL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B78A1F000D1
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795371916;
	bh=1lgSvXfM1NpguQppsGiqChdK8jo6yWYjCTv/SuCYsSU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EQqwl5KLh9FgRgQqiZx1o9UPuVtiNY8FZnvmw/+tZVSFTK37mS04CnXsS9fAmXWuB
	 7It1be4gsmVswbDkShAfAJV8e2zCcfiiQPP2Tk+bLn0rXeUcv2TJEZcRTHGAGA2nQy
	 ZUnIpzPIzZEIVvwP4gFFE5gntn/gXfy3Vhl9nLOYL/FLzt2QwKmsmugVwVDIp1M5sO
	 Hm5KxLw2E+e6baRWkfcJ3+DQKDZLC3+/RXLXMX5aTRW3jQ9cZrQGQCXSSDLeXHopyw
	 ZIHq8mxHQCPmlk2C2T5Szd4UZUZbGO6jRRAssA2O/ZErO+IgeU3mIQiwDQWl1g5N0Z
	 r9VU2Qe/AHHRA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1a3374400so1979219e87.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:25:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFD6DFOzOwwDXs1iuAUNEvDO0cRmRDFROyGFN+4Fbg0lzDxTQAW+XF5+QZCyaMq8XX/Y/9v0jQU+gR/@vger.kernel.org
X-Gm-Message-State: APuU4Z8wEfSOw7UHP8a6cXLfGraveEJJVHMOne/R+Tz3tONp5o82PfCr
	B0OAUBoAWW4miHgWGGoCcHn0kz1y9imbbD1vtwvLEh4X4LX3QN2+af5XWj7u0Z/wNiegzD0j/1O
	MLuLGCIcnlBRtFwJfnY9D+FUZibbKER8=
X-Received: by 2002:a05:6512:32d5:b0:5bf:ce24:242d with SMTP id
 2adb3069b0e04-5c1bc806edcmr2509874e87.35.1795371915162; Sun, 22 Nov 2026
 10:25:15 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com> <20261119-cs75xx-gpio-v5-1-8d14f2bb614b@gmail.com>
In-Reply-To: <20261119-cs75xx-gpio-v5-1-8d14f2bb614b@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 19:25:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLkLX_d9cFLOvnXs84_9j5JvwU-ab8mpKt98x2CjTBnb=w@mail.gmail.com>
X-Gm-Features: Aa3M54oX6RtYUEXPEftHEAaE8uR74PWqSa96JlgekCMpzJ1oVnJWKeD0gq7KO7I
Message-ID: <CAD++jLkLX_d9cFLOvnXs84_9j5JvwU-ab8mpKt98x2CjTBnb=w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO controller
To: filipp.dunsky@gmail.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:03=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
> pin is shared between a GPIO line and a peripheral function; the pin
> mux lives in the global control block and is not described here.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
