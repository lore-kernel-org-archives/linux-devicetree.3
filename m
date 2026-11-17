Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910392;
	b=q8u4ZgiCUWQI6d2Zx1q/fMkrQGGtFIjpfu1PIjMg6pAmY4Ru8UMLkeQT5lxPTwd/6heO
	 rO/1A51t/+6hmMOH+uOoU1rh3m5eemJDMtvf3Hl4TepXar47F/gcVUOUYJdem05l/OiAE
	 Onc33BdI9Qr2iWbWtxoQT37J4KR2TflZd8ShuNKS8q019iV3nvwluD2oo2MpcVtgQanx2
	 /zTRrAm88xk3q13jcDj0hdp52+YlFdImAjN65BpYC573IGUnX43M/WjHG2+k8lLYLfmWG
	 y4oi/UrIFurGnLQYhqLRqXAwmjy4+YEtB2+EagyVOPzlVZ7Zf+m4nmt9VpgnnLzSBzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910392;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fVeT+3BNfNqDb7R7lCpMKjeQfLaYJROPn4AJADkSt68=;
	b=qoMfrZToLtXAOm9+2L4I3qSta2etxR4jEsmcverHn7hE5kVE5Ph9Y2W7nMxwWcabaQFY
	 atXUcx40mQ/xz25xJkNjK895TKZfe1hbxd61RAV3zP/O5P6MZW6MJRrBXjcCZVjp0JohN
	 /gzvbz9MLsIf+uJI5mUaTwrbluMEmhnwTYdMfb4mVwW1+iE6KYpOArpJnaOdaP6I5/YMJ
	 BVCIyTiH6yC7F82WbgCGS8KqkvtHH1tf4KecfZ9afvcom+CidRg3FsViVynXLN9iI8u4q
	 72NfbRF9le/hQbCJv92rTG1KcpNPVFUpW1nS5PMJMsBjb6LPqZMVF1ZEjoJHg3aO/jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5iPa7jJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66299606A32F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5iPa7jJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D261F000C6
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910392;
	bh=fVeT+3BNfNqDb7R7lCpMKjeQfLaYJROPn4AJADkSt68=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=K5iPa7jJO4O1Ny56x+UYre1hMiIN4q06fwDElC4QwXyvKcMUscD5OULvLgaFAYq5X
	 eqbfXwm9epbdfQWQL5xOtUA7I4k5FUWYIcEmGDRaiWqmQ+i5U2Ez6aumo8nPZyqKYu
	 HVYN9Ic0CeDt3ZkG0598tbhFqIk30JsWnM/TsdYAqkcjQFqKNWMFc5wud0g9moNxM3
	 iSRjzJDe/Cbi6UhGYLcmj3sSrX6R5ES4TKHAQCHpO97M1gAOJ1DHtqSpHjxl2xGG54
	 IiYumfgjQdRT4W/KEk/RrwK5aPP1hxKZSunX+WQzgtFmwZ2xvp8qR3dvzuNqevpraf
	 dPQpkPVX/2jPA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c14470729eso3725329e87.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 02:13:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGlW6s1pdqKgg9PALRHvIPVPlLV43T4YezuwXjKiCp+eXAIkQl2bQhjBDfLcgSLg9PwkB9twEZLV3cH@vger.kernel.org
X-Gm-Message-State: APuU4Z868lfYKFOXUjR4oTFNlJCnFywjF97OEztm7aEb5wEX5RHhht9O
	kkDFp5EVUmefweyHCe4TCM+rxdJn80Qx8K+mekojxgUiTzYz6jW8GW+9o7RD74xniau/guxlIng
	XR9ENzLEJxyU2F9WJ8R1YOScyY5jO0oc=
X-Received: by 2002:a05:6512:2399:b0:5bf:b8f7:656f with SMTP id
 2adb3069b0e04-5c170b1c2fcmr5286367e87.16.1794910390853; Tue, 17 Nov 2026
 02:13:10 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-a210-pinctrl-v1-0-6ddedfb0b76b@iscas.ac.cn>
In-Reply-To: <20261107-a210-pinctrl-v1-0-6ddedfb0b76b@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 11:12:58 +0100
X-Gmail-Original-Message-ID: <CAD++jLmk9qMP_fXkYEV5de9d-xu=GhHWkfAXws3kxwXORq1WxA@mail.gmail.com>
X-Gm-Features: Aa3M54rHFkXM7b8oZyPnRAYA_-IYWZ6f85f3wqy9H6Dh9cQVnlkurrnqDxyrOWM
Message-ID: <CAD++jLmk9qMP_fXkYEV5de9d-xu=GhHWkfAXws3kxwXORq1WxA@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: add Zhihe A210 pin controller support
To: gaohan@iscas.ac.cn
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:36=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:

> This adds the binding and driver for the Zhihe A210 pin controllers
> (AON, PERI1 and PERI2).

Patches applied, very nice series Han!

Yours,
Linus Walleij
