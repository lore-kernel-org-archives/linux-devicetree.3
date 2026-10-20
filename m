Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516595;
	b=NRcD0nQaQHehabWvqKX8s/ffU/ip8TLPVvdGwtWi0SU0P7FrbTItGAQkxX2pnAByT2AM
	 oo0RufYi+kv2stjNiFdflPSJNGPH7sW0mY6m7rrQGp7QKlRJKWmk2sKa9leqc/Uz1SHO8
	 HrryJo+WTqoKpQmGPC/+a6wMxRliRQLwaENdhu2ZF5hHDtwH4Mqaqk0f/Bt7gNSSepk7J
	 7wrbXMSPnilBAaGuzZfKbyfLl1WO3LoDA0Z/Dvo7/Mo7Vx1N9U3yBhRaKp6M18ZDVlRie
	 4th1xajcNjBMdmRTo/SC7Fuqq2KH5typ193v2+cR4JAqLCRnBZ3ce55DIJIbYsBb98A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516595;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8JgZTskEhAe6xxV6x68aEhfu2INYkml8PjbzJi5N0lU=;
	b=GTPEOcd9j19cQYHLZSFJwVc5WKL3hIovSa3mvJ5yy1PU/mygrP+rCDrZqc+tiAMOaglq
	 jBS+oFWUG/c7HA4jv0LBqGNdca6G3oh9Ej/ByOgxiF2PMthMXrEG+21QjT4lXX7Ip07UO
	 31JZIuap6Od/H94vanOFkcLgT26gQ1HZkZH63xeCinh3vf/2DmxBCRQkeKwu0BF8iHeWZ
	 021XcIRLT6dBqfhRw6WIK4Mv5l29yJqWUgnfo9LSXGjc69dNM9386c++nuENaUzNyt5sb
	 86tNjWOq2YBsSOQ42rwR4HBygzlJ5fvYuh3wEN/qiEh+6zQK3Ps/fmlhEQ9jtD7UNWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MWnBzRNO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B1960A2624
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MWnBzRNO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9841F000C9
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792516595;
	bh=8JgZTskEhAe6xxV6x68aEhfu2INYkml8PjbzJi5N0lU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MWnBzRNOhd5WycSd6gBrxSCtlaZFLKRDgBCr7vMxpx3lzT1BrBoyqrZYUwlVi2236
	 eIc7yl372ifKMH6siwehYNMdDJZ1OEFnkzb7D7ivX5x7wTTB/BqJn9+vmlOV8NlqZd
	 gCmuzOMFQrcBmY3JJEIMZ4oPaHwY5SCvOeXkKrIgEuZATrChzCzyHzZpQC9MviDmdF
	 JQvx7cJShUVS8LqvAfNrOt1+SsrW6jzCuCSII8f00NwKkrFDuCXfUbVPSXE42uxrBP
	 jLMoI2hFTlfyiWXQeICHMEwONNQXKOubq8GZ/io7Vb9PCjJQSdnogkCw/T9w7nGxVy
	 Qu1ci0NW+azmg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so3438521e87.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:16:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzmkUAhM7PO4yeaafZLOp1s5kXgWZOJgFU4A/TVI+eEXMKOX1nW8OoItRKY/ht8BTTCuqAAkRKuC1NY@vger.kernel.org
X-Gm-Message-State: AFq9FYLbtoSp0+4xAatC9hHD6lr0GVJfT/K/r7houuQOAuayaPYrU2aA
	ijavbgs3jQn6TkLYr11GWxiuhsQ7orAPAR+O8mnN/KruAf2C/M8vq0finNDPlMDdg1wWzCYbcbb
	ghLnB20FoNEuqms1UdlLuycZxy3EvsKo=
X-Received: by 2002:a05:6512:114c:b0:5be:4d37:3bc0 with SMTP id
 2adb3069b0e04-5be50a9dbd8mr4119073e87.62.1792516566187; Tue, 20 Oct 2026
 10:16:06 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-iio-light-gp2ap002-v3-0-b7e0946c9e79@rudorff.com> <20261020-iio-light-gp2ap002-v3-2-b7e0946c9e79@rudorff.com>
In-Reply-To: <20261020-iio-light-gp2ap002-v3-2-b7e0946c9e79@rudorff.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Oct 2026 19:15:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLmCo8tnG5vp4Qv=6rDG3nob25LHELretdu7t3_SLxQASQ@mail.gmail.com>
X-Gm-Features: AclHuK9jGkoAjznqQZwxFsnHN6Zr-n0TfSZfEnfEZkRBZOBxywfmSrVOcQu4ooA
Message-ID: <CAD++jLmCo8tnG5vp4Qv=6rDG3nob25LHELretdu7t3_SLxQASQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] iio: light: gp2ap002: add led power supply
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

> tested on samsung-j5
>
> v2: Use regulator bulk api.
> v3: pretty up, rename vled to leda
>
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>

I think that commit message needs a bit of elaboration ;)

With that fixed:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
