Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516533;
	b=PNLvdAO+PTsFB1zVQIte+1kn7tz4CCaHViyt143aYYE9GXrXf7vK5yHxQ5HqRz/cHnlf
	 GzwiZ6Evh1WsETmdINh8/kfEe6hS3Ivo2ibgibiL6tB3eQsJM7YT2JsvM1HZrvVPH1YCM
	 HHgaSDOQ6Haz4pLclZzAQASrNJiUBHayRotulha+KT/RGM6upFeweTMDJrU2Ouo1zv63g
	 PWHLZZTrEs2Mxn0983c2Fai4iUTjTfeYwE46rbhunOiLZpVP5MOS9O04qjKEsK8MFE0u0
	 VTY7KLcvJbxnqqoKyXW6Pfb7jn2R/9YInRR3qJ7vuoh6gxQ7qafPh2/DF0GDwMsQNSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516533;
	h=Received:Received:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+7AvEO87agVesSj9EpGksF6DuYMEbv0EchchTnG8b/k=;
	b=M64sZHE24StjWwCE6WMJ+OO2fXGQ94aYpA7JtGFDyjdEOsVTKCyl1Z2V5+yeuAfGXQjW
	 aQfU58kN1QGgsLQRWufwyIE4Iy0pGhAv8L8SNoncldPf4oOPZvc+FPPfseDu6RtbrW6RZ
	 tws2XC2O005FCG0H67MM9M7479eh0oL6tpabj23ys9dFIG9Xq5LIEcNS9b7GPMT0NDJxC
	 FESyvSTPq2PdTYA9ELjboe/HOkeveM1r351o6LhjTbV44fpUxfZ4OnPbvGGZ3adTX4GdA
	 nZvSdHQdF/Hd5QtP3k6sZpMf9oLZQLpRO2uNVRqgA40Ey4dcFzsk4gohjELngLhL9nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DC7606A323
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAA81F000D3
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:15:32 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso616199e87.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:15:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0mOjtqSsQtlSR+L+KXRGuyCmTflo83r2iDPWN/V3PS2DLgTaJB2RCMqH8RZnT6m/H6OPvFvaTXZps@vger.kernel.org
X-Gm-Message-State: AFq9FYJSiRnSXw+9AfJwtLROvcTi1EHsCMwr0W0XvNHiAsSOd6lFkEbK
	w+8/GGdHYn7mgiTyv7NFAr+2IeqqgFSL0soI+y4ySpgjlf5XbYqe8MlvKzCSJstWdLxIl+981+B
	gTjYyZi5Nvx0HbZ4gkAJVLgR/zgZLIkA=
X-Received: by 2002:a05:6512:33cc:b0:5bc:b0f3:8a4e with SMTP id
 2adb3069b0e04-5be50a62a31mr3833052e87.43.1792516501664; Tue, 20 Oct 2026
 10:15:01 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-iio-light-gp2ap002-v3-0-b7e0946c9e79@rudorff.com> <20261020-iio-light-gp2ap002-v3-1-b7e0946c9e79@rudorff.com>
In-Reply-To: <20261020-iio-light-gp2ap002-v3-1-b7e0946c9e79@rudorff.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Oct 2026 19:14:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLmA_CAJi31OJe19A1H316XfigAKy5XbGcpvj1CYzPYY2A@mail.gmail.com>
X-Gm-Features: AclHuK9Cj5HfENDrz3fDPSLBKmxyGLPpayybWidXDJBEn6zBCvvY9bndZC-YM6k
Message-ID: <CAD++jLmA_CAJi31OJe19A1H316XfigAKy5XbGcpvj1CYzPYY2A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: light: gp2ap002: add leda power supply
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

> According to datasheet page 8 "Recommended external circuit",
> it has tree pins that need power: vio, vdd and leda ("vled" !)
>
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>

Looking good!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
