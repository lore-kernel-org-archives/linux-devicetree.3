Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630370;
	b=NnY0mkqPA0CVpEzrwFx95nZU46/raP1+/Vv36McBWtbtih5FRAp3t61gIt6ON3c8N5yj
	 vU7JBB5QYlPJajXr82/lz5oAnM8G1hp9ylFuJEL6VPxQnHkMOACAy03Ho3vJT1yavPz8+
	 YVKyXPV+A3D69AD8nVlaWxIQkE50RDtIlUisdY+/6AZxYCcY3Wuq2/cS85YXd+ivAwwH9
	 etO0LCHyXoQjMbS7I/okI90b1FQr/BY3mTHp0s5bgaHbeSU2DQmFHIWCVzwejm+JG7LDJ
	 9xG7a8hOrX4eeF/lJU8yrasxoHL0dfV/ryzzy1KONSEM6AghuLk7IAfFqydMysMwsbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630370;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4jTbRTZRitaWiCSV09T/AEZ1U865c63Eb8AZUxy/ufw=;
	b=BNahmiBXxoAYm2IuZKbhrYQ+VjvEZT6AUqbhno+SCtL6PDi7yKr+PQHdLF6U/nZtVhY9
	 uaQES3oHopSaJVyEgMQVkHS+KCn5f/DOeqp9rxxbFvHqDjx0MCku2G6Bps8NYXrab/Lnq
	 1xz6psDnaBbCjbTkkRVoGB+6AY45ynozm36Hhe6iB5dXOFk0wADjJz3+D3Tc7hdKBv1gD
	 LZGWDX/Fl4Qvy31YAtaFQBuCmEM2l2V4h8ZGZmfE8f4OKej6cnkttDJ7NY0Z6qISK9VYQ
	 EF3P2n9IvA0nR65vX+3jrPkIob2mVhqTV1r7MdVYIqkotGmXlrSmnL3PKh9UhbOFiTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1vZt4bz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5ED606A334
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E1vZt4bz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7E81F0093C
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630369;
	bh=4jTbRTZRitaWiCSV09T/AEZ1U865c63Eb8AZUxy/ufw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E1vZt4bz0JhSxEtEeTI7AoUtNANPm+CYHwBUNqhHgFr/iJU34ypA4gyvEobRGVVWG
	 9sNy2Kp4eRirU984KbHPbBQwRxAMBw0cF1sENozuKbbGNZb/O50pacgvRU6EFJnoFB
	 e0663LxDQsaZnwh8If5SheyJM/1JF5a1ioNQQWnt8O1SqtINZLxt7JmM8TIBcYnl70
	 fj0eds0EpB+nRqjdBY8K3MX2wK2PshqxZbTAerzI0E9u/sPsDPNFFX/ITT7JCW9mrz
	 FhC37POqO+y8cdgD/Fld0E0zttEIf8yVuZhvk+yS4l1Nym+PDNrT+ZV1zf/lgrACLN
	 IfMhEfOT1UEmA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be47aa555cso7675827e87.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:12:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFhY14JCDR0cmwmLsjatuZOrjsSBSc+d1gBFRLHT6CX71vxMFjL8rP1TO99RGCHvUORKtjrCqGmprkb@vger.kernel.org
X-Gm-Message-State: APuU4Z8O/tch2ko2zcIhUiJbKGEIwJEnlFMT12IUTUkQJyWHyFPuMK0q
	ZzXzbWyMw+s8Mw408Lnsq3+IwQ/5LOLZVLMUf+780EXV/19vIoWvDTDKPPRdLf7ryblknEfySvq
	YJ3XEq0oD69rzdAyi9hhLaxEEnlEG3uA=
X-Received: by 2002:a05:6512:b86:b0:5bf:ce24:2d20 with SMTP id
 2adb3069b0e04-5c1bc7bc30bmr5709392e87.22.1795630368568; Wed, 25 Nov 2026
 10:12:48 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106230746.21954-1-wahrenst@gmx.net> <20261106230746.21954-4-wahrenst@gmx.net>
In-Reply-To: <20261106230746.21954-4-wahrenst@gmx.net>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:12:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLn3Se-NzQDMatXN__8+xFQUjVr2DJbigjFfy=PE20266w@mail.gmail.com>
X-Gm-Features: Aa3M54rzEawPDtXAOeD0tX6yiM-y94vFsxRv9P0IIXZxjhuCad4qET9fZgXDR1Y
Message-ID: <CAD++jLn3Se-NzQDMatXN__8+xFQUjVr2DJbigjFfy=PE20266w@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: gpio: mxs: Allow gpio-line-names to be set
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Vinod Koul <vkoul@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vincent Mailhol <mailhol@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 12:08=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> wr=
ote:

> Describe common "gpio-line-names" property to allow DTs to
> specify names for GPIO lines.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
