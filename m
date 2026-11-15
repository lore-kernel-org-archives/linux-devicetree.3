Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765486;
	b=zjDQB4Yn1UtRGVKGqkGhS5kf49j7INoE5GqvSfkcG2QZCdzV+AI4eKLvQ/6rhAflQC7C
	 Ml37PtxX2lEUwL/w8akn5CaDnwc/QMTTex9sbOfzg5fWQfdJe3vbXsG0pY5tVa+RhvLip
	 +UZz7hgCm7IyATysuItnv+m5lZcxi3GmIswEIu5W7sCbMErPqVkc1KTB8djmru6YnIAE8
	 bGEL2LIp6TdTDRIvYT/7ET6Lo/h9HRm0GDjp7wCEXbF8e4M6LbNiK7mjBa0otBPprzKsi
	 ZJtC2DSOBRv3Wo4LU9c6i7pjSODxaeLPapghhJKyFvOI5k15pPHGnL5UZqzVjwyGLJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
	b=w6i6+c4hKxWqWgbBbB8ujZXtXsCf3IENgJasX7Yn3ZtpvBYPTGp+hLgrfZSqqpoBtbRO
	 Yyl7t6fLKTzVFIcaQTABwPIcNDl6hWFdp5lQnlBYv55oWeadBd/QaFWZHpSI9vHOaADK1
	 QczfIEmHZQ8kBa8HWTNxEKlSM1l/GBYK4mNV9cSCboNN63wxsJRHunm5QzWtKY7JSH87E
	 DfZiKkgaNQWg4fpl9zKaf82nQSsXZKDDS6o3tsrXRhi7iIA4G4+pQgAEeWRGWpdU6Akb+
	 LeVwP/PslHrWw4+tf4Fyp/1D/HtrLdg1cLq09Dpo2zZkxTgzMTw9PKmcRfkREnTCLtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=UMJw813N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8B0606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C8B0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=UMJw813N
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67db5e13b0cso222898d50.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765485; cv=none;
        d=google.com; s=arc-20260327;
        b=atmV9fpVmmscn5szs9HpL8cF9YW7kxov7B+3p+mAo9evYDQ4vkjea6EwDw9TfitySx
         IFEpew94vUr7QZ3Y8rkdhNH27JOTuhH0vq0pkfdXpNedgb+4EFyTqdh5WOmKSC9ZpKqc
         +pdl/1flWPdl5/uRZ5LA1ZbA/qNP9jtTWFrPOEv2xIlpmAH2ItO2Ay1f1r7yCFLY3KfW
         Bii9t1KnZMe3t0XpjS4H8Tg6cQ6Xah8xo0MzdeAsxkiW+SnxGi8B7wxsBTrcO1Or4ia1
         OsXDBW7DC87GQvxF8qvOVADl3tAuvKgePfIxTszGC6NgH1e5QEGoR7k1TAwRFdzpPR8X
         z/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        fh=5wJ3lc8m4lNQ1bgCssG3yvA17nBJ6N4xmKz5HXGG/vc=;
        b=S8/7LhsP5mRootXBPFblCS57kM2YlJYjkHNqZSUdMkPvbThkJsO8tbiBWWFXwaDier
         5fsa3M7snYCPGphAr5Ch/ahFOa1ndeDqIRXlJ0tE1INYO7yQ9k5PjhCjAjEfrp8oK2V6
         SF5ScKGnSh/I9bwS5/uAhzkAz25UDi3pCZrX90x3cMPLTZDQa2Okbl/uC6rR+nQJkTpv
         oRxhciACkdMoQxJd6dq5NjT5E0OScdiFCx4P3HF1T/gxXmOFrupSuqALHiEvOICfVUvi
         nhZ3vzC6nz+7I0V4XRKGmK9Y2BV9qJtgtSYxZmoUQlxesZ+PCv8l5+Tfq4k6RFEZL/UB
         Jbsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765485; x=1795370285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        b=UMJw813NaHp2fp6GmFJEff+sL10VP1gPjYCiJH+OebAxKxF4/haNwCNOZVgE3x8Hsz
         YoID5uBXWYsSL+Xefhx5dU31eW0jDmxlRjsIkwD7vgjEshvRnN7X/hx3MHRrdkNNeOCW
         dj0EvTOlqMvpSvOzfmIoMeut65M6YYPOLfyfoVNW3mMTwXnNcbvGHwykkQ3zB84ZM36w
         1xiDvW64PrJLN7niDMEYHv12teBDEP3RWJgJ1FPrWLNqfTUhgTFwyTv/7D/yov+oim23
         Me/+GAb1wMtADSz5Y7FtMjMOp9pRHW2YJ/z336YKZoFynJXlX0eQikruMka/4QDeLURe
         S7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765485; x=1795370285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        b=JVwNQoWpb22n4V1oESTYKCDsKsA1o9vpSQpx/vPYwiT2eq8DBQIyo00QKTWon6aHAE
         FKZLlBSwn64yhlgP6zxUG7Y1d2pUmibF0qP0bcjBKFFNockDr4Y9g+8XYaNgS+IUlCin
         V2y+3vvbbZ3c3olqgYKS8xlVIuwtb9FWp21qYdq78CG0O6UU2NTqtY/VZxqrcqkLWOS7
         TpKouiUOr4neO1O+n9F7+GQYLl6CI6xiowuK80EbPvXkcDIqKK3e749vqeN5LaxYOqU6
         5zCcw3gqC98QDvePfdf+umGuvNapprZ0WfyYf6xEL507YZGH0MicO9xisa0Nos4DzYrG
         OGLg==
X-Forwarded-Encrypted: i=1; AL+hErGejP8zajp9Q6+RGCSE7f/dR5Am8YeSfPLByQsaSuw8QggMMdcY9RVIvtmqdtLpWp59iAlkZMv4qpPc@vger.kernel.org
X-Gm-Message-State: APuU4Z9pO7OvCl1nwyWsvPd9kT3MDz/lq+9lbsKz0mP+VNrSZ7oenytA
	SU4lwiMDV15gnIIHlTFDGo7Ma231o0KySF2CGdBxhZbtj3lZvij2BJp99oe56oMmfWEtPhcbNpR
	gYZOYTFi6+B7BTDsuiijJPJAyufYQM8M=
X-Gm-Gg: AYBFou0gbWuiLcxdPSw0b/TBIg09AaOnn49oDYJuUxlVWOyVR25m2C36u//BZerjQsl
	kvyuGLvbdaFrcLRXtGxnTGueVvoJmXE/cVvvwKLKVoqcCuraQdv+/W3vAC9kfVvs0yzqrgeAzx7
	HH3UG6Kdav+2GrGIrtIth1kzWHLb8U2GRftIJWJqBCY+Q0n/eE9dWi0LhGLdsEv3ym4QVxLwMEu
	lm116zr0gia33E7pF7xF1P6VZF1eAMdNJlCXDE0HogZWiXuEb3b3LQbJ0BiCasRtdxDQarpGFpo
	+WT7cEueHjYsYtHfBSSfJG/wW4PxD4lPL+zgY6m4bDiz02KJ6HVNvKi6nEB8U8sTh+TU0KHluej
	fHlu5l9j8Wiqr8IiBBxHlAsWGhSGuSFNBmPOXmtTejbfr0x+axWW/G36rab0ybNFO946c+w==
X-Received: by 2002:a05:690e:803:10b0:679:af57:d19e with SMTP id
 956f58d0204a3-67d89661b52mr2605986d50.45.1794765485479; Sun, 15 Nov 2026
 09:58:05 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-5-tanure@linux.com>
In-Reply-To: <20261113121852.334604-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:57:54 +0100
X-Gm-Features: AclHuK9m7YW9F8wMPiMsA7yThjtGjePZoU8lN6bMh8Ee4d6dZkum7e9qCRT0s2I
Message-ID: <CAFBinCA7XhksQaTHoGP3jCCeSCBdwAYgamW2AfPTdK0ncSCzCw@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The delay code reads phy-mode as the list of delays this glue has to
> add, falls back to a 2ns transmit delay when no property asks for one,
> and takes the vendor delay properties. ethernet-controller.yaml says
> the opposite: the PHY adds the 2ns delays, and the MAC properties only
> hold small fine tuning added on top. Every board in the tree depends on
> the old reading, so it stays as it is.
>
> No T7 board uses this glue yet, so the T7 gets a path of its own that
> follows the generic rules: the receive delay line is fine tuning in
> 200ps steps, and the transmit side, a quarter-period phase step, offers
> none, so the transmit property is refused.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
