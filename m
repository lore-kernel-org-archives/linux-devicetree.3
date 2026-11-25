Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631328;
	b=AsfZtmnXRKyhULs09RMn6PDZHCrbEc9yzFnUdYhDy4saB0rt2OXwjPjfI2vTWZkxdoT1
	 weVMvagX5OJCNdjb1Pmc17stiEFfGGfA2UiOb9ejGveGCgjEMhyMDNep+m21s2F3onKR2
	 ytzedvQ4SwROy6zGVJ4fvdoirBRkLH1YzU4axE/VLFFY0cTftXG4qKfcaCixjae08vOWW
	 NZ//ctlSTrF0mZLvf5Bf+PdVhICOeeLp7+iptG97YXTxSYzBhDqa4BWqVO4sVROiLW4Gw
	 3TZ/NgP1ELQ4ZpPwBeI0kogRCdxIFV5KLeXZLJPdi/sxtlJXcokZ2AFqcQnSrTYcSJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631328;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s89ULcfJlcdzCl5MhVyPCLu49hljGSQBZ02EqlEm4lQ=;
	b=VEr2yH2/k/9k8576Had7zTQh7OLR8ZoANiJhlemGIZiwo/vI/0US71ln7GV2pM+KmW35
	 546qLrfd6z4vf/EhbSjS+JCxk+NP8jCmL5bT5TdUYnnZkXk9hQs4taQdQ5ZjQ5glNnJnm
	 WbgC5G1NyUZLgZEI5zZOdAST9ZPTgoh2l+KVO4XTIvjISX7AnnnPI+evl0AUl4XHIern2
	 JyXUVBNhc+yIaiz8Ks0n9NyhIfBv7EvzwJqyB9zc5StFWF0gvMrVQrxuFvtTfWAyoyXkq
	 gqIH9JEhQYDJPMGJkGcXuNtLle2o3V/2x090wyuoTrBzpGXWsk97DlS6yK1f8EGbFfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z09Id4Z8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225D5606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z09Id4Z8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F292D1F000CA
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795631328;
	bh=s89ULcfJlcdzCl5MhVyPCLu49hljGSQBZ02EqlEm4lQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z09Id4Z8vbGXWMkS1WR7gKdR39oEkIz1JoFK6v2fcJ3HDWZQEH5Wg2j4BlMbe5Tiw
	 Op07GQ7ZOBQPpPQ33dWnYZbQlClfUZwMO0/aaeAbFHLbf2VuNc/CGRuOxL1ldqWzpj
	 99zYPOLVb2nNRTZejieDWlitrmHVwPhj8LRvDufiId/Sh/nJe7+/4//2GKErIvO2YK
	 MEfTnlSx07Bzs1TEaYccXsWLnUbFHIHvis66TU2ZakXfOkROUwV11u3zZPDyeqv6U9
	 dqbIX3OHFGaCGCsAYinLTu5QObKclEib2rFg46AGmWpBgO5YmZfUL2Q7K9SxTy1YxL
	 TFYxMI+cYPOQw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c31cdbeec9so1639672e87.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:28:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFtduKpKNpVC4Sw6fN0u3VoofGQzTKIXLAa1cxHusviwsMoYhXJs7ndfiDyZFd5MXnoIPKeN6ubk6zU@vger.kernel.org
X-Gm-Message-State: APuU4Z9BUszFIzO9X7E/GcjOlbX8coEJD6sz58UKZdb/DEmiGyauIvpC
	QUkL5c4TIOkIjCvNOUtTZxj9NNARW8m3YHr1qv78by7rnXx6U9P8RPfnt4ByPl7KhbwKuqb7nG7
	xpvkAWHiBUeRu4UGhEb7RpaHmlhADZUs=
X-Received: by 2002:a05:6512:a85:b0:5b7:f75a:ea68 with SMTP id
 2adb3069b0e04-5c1bc7df486mr4990618e87.35.1795631326771; Wed, 25 Nov 2026
 10:28:46 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124094059.3882014-1-john@phrozen.org>
In-Reply-To: <20261124094059.3882014-1-john@phrozen.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:28:33 +0100
X-Gmail-Original-Message-ID: <CAD++jLm7b_Q8aN5E7zjEU8CPknKYy0ui_LE+jPYJji-YzAWxJw@mail.gmail.com>
X-Gm-Features: Aa3M54q4ONvPZcrPiz4EM8PUlUrVb5r4XA_5oO6TkamikfKXWeoyqqveph49Ceg
Message-ID: <CAD++jLm7b_Q8aN5E7zjEU8CPknKYy0ui_LE+jPYJji-YzAWxJw@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] pinctrl: airoha: add AN7589 support
To: John Crispin <john@phrozen.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Ahmed Naseef <naseefkm@gmail.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Christian Marangi <ansuelsmth@gmail.com>, 
	devicetree@vger.kernel.org, lei.dong@airoha.com, Linqi.zhang@airoha.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rajeev.kumar@airoha.com, 
	upstream@airoha.com, Weifeng.xu@airoha.com, zhengping.zhang@airoha.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 10:41=E2=80=AFAM John Crispin <john@phrozen.org> wr=
ote:

> Patch 5 adds the IOMUX to the syscon compatibles. Patch 6 adds the
> binding for the pin controller. Patch 7 adds the binding for the GPIO
> system controller it sits under, which also holds the PWM controller.
> Patch 8 moves the GPIO register offsets to the common header, so the
> AN7589 data can describe its own register table, with no functional
> change. Patch 9 adds the AN7589 pin data.
(...)
> - Split the bindings in three: the syscon compatible (patch 5), the
>   pin controller (patch 6) and the GPIO system controller (patch 7)
>   (Lee, Conor).

Once Lee merges patch 5 with the syscon bindings I can merge
the rest to the pinctrl tree.

Yours,
Linus Walleij
