Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887040;
	b=NG27HzOjFozCX3wPFNHSE3Pg5Zi5zt/soANHUi8OeTT41D75JKVjJAgZIVivrXIYH1F2
	 cJtqMnRQlwfdx52/PWJQSzHBfInGSs+XXI9oAmzb62UIqnifFJHsNPD+2x2K743MS9qIb
	 pgZa4XobUT0zKqtBBFqRjbLtnvSB8LZJ9kjKRPZG/ItSB19uURQXqsCX5XQ3biweyL2n9
	 GLgXDDngudr8M+7WOn2vRt3wEg6I6BRmL7L5hMXlDuM4CpUSd5nsfYA3Rj41WDcU0MsjV
	 t0pB0G3RX97+a0mIuk2/cYcR2E8DQCCaKhxjzrO5D4QyTwn1C7BjEobbOthOcLi15yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887040;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=RK4dc4YCRHwSCZtA+8Zl7EfQsJnisbbwkk0apZKAcaI=;
	b=uUpq/VJOvg9x6lS4lhx87ECKuvMlsDA6HE2FTkWuOQ2AixfMRMvW6hrw6+MAHFe/PFu6
	 pqPqqMrPYX7qrPz/8vqXvRtvU48sGJktfZM01npK2LCmeO1ZrIklb3ZN+yjp2ZgiCRpqy
	 nL1c9CgGaOBjWaazngcMIHDLlZ4Ts97DUHHu2d3t2WbFn5Sf8aS1jYsiDZ4oGrg6KK6Di
	 Bq1N4GiCeLBHEnh5t11Fm0XCPaJtLF5Bcy1ho8XCDia95ejzdT13YIxjK6S2tFy7qgTZf
	 F88jwXLHgcgNr14k/7cIHyWaKdCuid2SdufjR0G+5xw0DIbvxlDiONw6JhtvxAWQbqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhKo0fMN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB49606D80A
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhKo0fMN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10271F00A18
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887035;
	bh=RK4dc4YCRHwSCZtA+8Zl7EfQsJnisbbwkk0apZKAcaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PhKo0fMNwv4duD8zxsTN0F7XfkmyaXTYp4sYusEebI5g4SzSnfERJvUDAcvRcdaW8
	 jvoynCwAFWBo0uT4D2VtkRMUfxfmon0ucs2yzWIsanqF7wtFvdW6ZIHF+ng0dYXKAo
	 +7yQgiT6nxlsaBUoOsd27tCU55m7P8wqDzSORkXY+WLt8fY6QNiJvBHRc9PUEwBaqT
	 G++vCbHTXLFfaJVZFAOPRRylYQsarrgjz5naoPcYO1Wq+HOvIzEtfQm/p5JD4JQ1zk
	 73gCoIqJ61NMaBWXJqxuglmvj3VHCmAWqGb0qcQ0ohkHS2P80rvZB3RPwU4Gkw3N9z
	 riiMClJAZR/kA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso1469473e87.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:57:14 -0800 (PST)
X-Gm-Message-State: APuU4Z9qO8BliDW1gI+7WaG4nb5MIOD9Tvso2U2PiIF1G9TMrS2+8vdY
	J8XiIw616Vmt1QdUbObk7L0q4P+69s6tklS2N8p+w7mIXvTteiBU9g48CQOafW5zvxMqJ/dWZDA
	2bxyii+E5A5huMhJxiSLf6xSJe+DJX/8=
X-Received: by 2002:a05:6512:10c8:b0:5bc:bbd0:7a7f with SMTP id
 2adb3069b0e04-5bfd958c3e3mr6574322e87.67.1793887033749; Thu, 05 Nov 2026
 05:57:13 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
 <20261105-genexis-xg6846-smp-v7-3-rc1-v5-3-7477b2b4675d@kernel.org> <sashiko-outbox-199178@kernel.org>
In-Reply-To: <sashiko-outbox-199178@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 14:57:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLkuZRe4wVmuaTPd8BTbQtEWtgKMGbLF9uJ-_r5GGVA9MQ@mail.gmail.com>
X-Gm-Features: AclHuK90saU8RstxulF2bcrp10n_1pFAJWV1nl7Ujab6d-Py7Vs7CAFrDoYVlHc
Message-ID: <CAD++jLkuZRe4wVmuaTPd8BTbQtEWtgKMGbLF9uJ-_r5GGVA9MQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:55=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> - [High] ARM: dts: broadcom: xg6846b partial no-map removal breaks lowmem=
 setup

Hi parrot-Sashiko.

I have already stated why this is a non-issue.

Yours,
Linus Walleij
