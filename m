Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516641;
	b=pqtLcl3FUze+1Lr8pdskDFZmUgariK0p+DfUmjzW1iogr7WEnGdzLVS2vP5kqurA9TzC
	 01ixdUiA5853oRqBWqaGHHZXtH8BWXjtceOe+dERBGRFee0PiBE/nuBd5uKt14hTTPat5
	 C1hT5Y5ZXToYN3TuDVWjw1/nEylBHiDQhhqZtespninaiAFUloB9AIneXS9a6cwvj6eSt
	 Ejr1Fam+RJ/aKqejeqyT7wPOTiebbxBVRPg4aWGD1ZNdaUDPPwMkBHJ+xtpOWAvDwAhBd
	 IpI+rH+MVsS2t8DcCtEEBgzzOza5G+Q0g2kjEg7q471uAqrwCnbKE9iwsw/6aHjX3ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516641;
	h=Received:Received:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=lZsoV5xV/qdIzsmQoRFkHO+0ZG2LBiefLdsROQtEphU=;
	b=J2L6jsLCKDVSKkfsv+TwuDMvzfLv/Yk6x89atDLro6Nsq/eUAvgOJbFSlcDwfMcY9Knz
	 vEjy82wDEjwZ9ArpdU2MzerWCpTAm3illLuwWbh63cbkK1S6rSgVyOij5PqXJW25TFgiL
	 zwhHp2I6Ihfe+dnWf6LgrYizFWg6BG6+pbmDPxOeMmZsMr54ZxPvaBBmPl0ar4NzlBF16
	 I2gQZMTCPYyNgV2blarjHFTHBDJrkIV0cYyyrC3A3aFTztwQ7+HZgoCGA5WpwoG0GB+/a
	 ORvEHukRWvuW5GP3BOngiKualdQ/SDC2QC1G3wm3K2OW2AYaqlI3wG1JlJU9XdfAhNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7419606A335
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6A71F000CF
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:17:20 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a75f960be4so22727141fa.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:17:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxsnprDs042r63GLdLHFNsFPbDicmbF6y5gPOV6bdo4XoHWFMiobzfkxV3TiEezJ6Wc//FupapNzfRe@vger.kernel.org
X-Gm-Message-State: AFq9FYKDazAQdrm1bup2iYsKMcLuldEG9zjX6+2E2vXKpUzAIrbpLcGx
	XFjT+w6rnwVdF/WgM4ktqVDQgC1Qerigfoy3Dto52mRbpYeSwILPGBglOoguINxjdw9ZDyleptc
	Svr+9TFbEvorTgo30sMu/6QOhGEXJVp8=
X-Received: by 2002:a05:651c:3614:b0:3ab:1639:9a79 with SMTP id
 38308e7fff4ca-3ab292b7375mr20330481fa.15.1792516609558; Tue, 20 Oct 2026
 10:16:49 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-iio-light-gp2ap002-v3-0-b7e0946c9e79@rudorff.com> <20261020-iio-light-gp2ap002-v3-3-b7e0946c9e79@rudorff.com>
In-Reply-To: <20261020-iio-light-gp2ap002-v3-3-b7e0946c9e79@rudorff.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Oct 2026 19:16:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLne9-+i5aWejLoqb4ZYf8Bk66iifcaT1MV4uY80+9ORww@mail.gmail.com>
X-Gm-Features: AclHuK8o7YJtu4fGAIWMm54FLQfyDMwv1SgdLwwrUNSyOsI4L3FOJbzTrlMgBeE
Message-ID: <CAD++jLne9-+i5aWejLoqb4ZYf8Bk66iifcaT1MV4uY80+9ORww@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-samsung-j5: Add
 proximity sensor
To: Christoph Rudorff <chris@rudorff.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:36=E2=80=AFPM Christoph Rudorff <chris@rudorff.co=
m> wrote:

> J5 got a gp2ap002 sensor, add it and it's supplies to the device tree
>
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
