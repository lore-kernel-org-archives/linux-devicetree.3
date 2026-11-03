Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719980;
	b=vl7SIKuhaNkTTYFoL9oi++ffw6ozi2MSYAdWeXbg+BmiTWPyLT+PB+l1Udv/2pCamB52
	 ZHfIogl+5jPbo6oaMQNR5y/7aKyIFgmZjkAoDekouldHZz4iDuI9wSBm3RpKtOrL3HjDo
	 nTTpjLQ56Cu2p7/xUCEmMd4ksl5UZa8LWNLT7MpcPg0CmZV5t9CpjZg4BAKS90WRSoe2P
	 0cUHENAxL6ZonxKxp5ATQhP3nkXeZ6g4+KZWCfyaEFSjV/RJw3j/qg3WEIskFVgGp8vC1
	 jGuHv5afOuJ+5PTeS4COQK2sF+k0yiF99NQKyrseQhHghkNMov1BpkdE9gE3sojJjsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719980;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mdSDaylEDCP6bzikHn/xkO4FCQje+FbG1kF5jyDEpv4=;
	b=w9l6sTi93trklD61sNpFwYYeI87BN6W3/XeGPlssBmioGKCoOn8mOIN0xGSybnQtp70t
	 8MPJOir1hwWmkLA/T155fWFAVK8vEuWd9iPwmQmHdHV1kHvo8Hj9MCqN8sxhzRhk2F+uT
	 Xj8LRh+EGoj6CLlmqIWw2Enrq/65L1xuyG5JIeEujkmmPgx34uwHb3T5op/nuGjdJn/qZ
	 LvTwmK4b7Ts3hNg3stroP0aJdlDG1es3Pr6rohzUiTNWSvasa5womWAC714fq/dsefzGF
	 rqLPgpdQCojXyQctdSFOWG/9be2275qH9EGYn8+lV5DeYo3fES92HMhxGeHf39idsvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dr4LZMbS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC6606EE89
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dr4LZMbS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867031F00A15
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719979;
	bh=mdSDaylEDCP6bzikHn/xkO4FCQje+FbG1kF5jyDEpv4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=dr4LZMbSEBAFmcA/cUbDDc1IenIMbDNdgmj4oDHTMRsIsJpkiJiF/5BwAu2R3Rl/K
	 u5LyhW1Wo9kblTPSl4Tbrr+U6RidpLtEsSSiPI5QoPZaT/L6xZA1FE8kiiAj/wAui0
	 UCY6rkOADElUv5wzSGJXn3Hr5qlECvbbhUlpXvhO8ICmiDlfqs5HigdVU3xHGoi1U5
	 jSCFd2xqJNEH4C5dDqi/OCsYUv4AaAH55yHBjNQhNWFxgqtsv1MwTBNcniSxUdHQQv
	 4DEOK9ZD7r9hLtI+THxSexWJGIXSvRC8On55nHwJMszAWkqzEWedB2+6a6ojBATVXY
	 H38miYnvtQq/Q==
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4f55a53898cso2277139b6e.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:32:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzgjOI9+nBkYcUJn2Fqe0S6P30OUIH+uHxEc3hIEojtnobVBjApnVDgDOr4cE2+sdlY0c/hFEarqjlN@vger.kernel.org
X-Gm-Message-State: APuU4Z+sDfLGo58DElBtxHkeRGrqXji3Fr4hP2fOQJTdhSOiiIf1DrQ7
	TCDf9d95EFLCPzJz/pomnTji4GTlKj9tJukkOQK7LsPG0nR9UxbE4pakc6vXsV2lGh7Q4EKAZyI
	fTbB4JKl7T557ALchfrQ+Yo7QEoRk+fE=
X-Received: by 2002:a05:6808:c413:b0:4f3:e98f:fa0b with SMTP id
 5614622812f47-5640d9718e6mr9621332b6e.5.1793719978745; Tue, 03 Nov 2026
 07:32:58 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
 <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
 <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com> <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com>
In-Reply-To: <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 3 Nov 2026 23:32:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
X-Gm-Features: AclHuK9qbh-5u1j8zW4quirRvqcSTHBVHOecOsdol74xKAQ-eozqfaINKue7um4
Message-ID: <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: Rajan Yadav <rajanyadav0307@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:47=E2=80=AFPM Rajan Yadav <rajanyadav0307@gmail.c=
om> wrote:
>
> On Tue, Nov 3, 2026 at 7:07 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> > Does the downstream BSP have this? It would be nice if we could port
> > it over. Then you can properly use the power allocator and/or the
> > schedutil governor.
>
> Yes. The BSP (sun50iw10p1.dtsi) has dynamic-power-coefficient =3D <190>
> on cpu0, and sustainable-power =3D <1200> on the CPU thermal zone.
>
> The energy model uses the OPP voltages, and Andre points out that the
> current OPPs are A100-only and don't fit the A133. So I'd like to fix
> the OPPs first, and then add the coefficient as a follow-up, tested with
> the power allocator on the K5C. Is that okay with you?

That works.
