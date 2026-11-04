Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800175;
	b=HT8Za4L6+GJ0iX9vQgBd+yvOQSEeMhfL+3CREjEmlQVKme3CA/nAcV/K/ELveL/7cmCA
	 7xvUqv/hklhBH5UqepNzQN7Y4wGpofKE8ppNVE+VBQ1me0Pwx3JeHaILLIVV+/aZ1ZxHS
	 muKffslKjdFSnz98diZoODh/moUncVnLkk9MxRUUsXocpRhV/iu1PqSAXw0QXAOoly/Vz
	 L8/hLEQPy8kTolN/vmhIyZW+PZQaVVu4d/b4DbHeGFA22J1z0BuY6zqD/99PYjn4ZUdYk
	 xy9MsH9capQl+fDsgCRSnJVLnc0KIeUNWKLPo6+GsWpBqEV99hhQvoxuVCOsCDzt9ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800175;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xh/GEp2c7zYgIWG8y5Hydozqk2C8+o7JeISPlaQEupY=;
	b=YhW/ex9UPDt/G7Lit1fRk6Yyd4DbgiS9yjMgGA9Pd/erOS8jZ3R5/LxtJn61fue+inDa
	 l1Vzrs6ZT16pc7OlII25auZE8M7pZqG/G+ZJypNvXX+CJrLyitSGJKWFb2fX7j3LthgEF
	 KwzkHj5S54ZyCfc7Yg7oaVZtqj53g/jlBqEP1pNxfEd6vWiXaWTOPboIpe02iFIvxN1Ok
	 lVWDIRpJYUR/yBsF7MTHC8Kt3xv3+kmsrovkFC4Px7Jd4VxXf1hd4iYqbwzH/VY1Yo0xf
	 RI+xySVAVHj1SAHN1byydClZ07ego9tYSaQKNCW1FbuDOCluYc1wxZY/j9V09IbwHig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ax2k85fQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD38606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ax2k85fQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96B21F000C1
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793800174;
	bh=xh/GEp2c7zYgIWG8y5Hydozqk2C8+o7JeISPlaQEupY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ax2k85fQ/GPwwFEnF0c2ksgEYkv2siBK4xaOdobJMhC1SQoOgtEquppNpz9om+WPJ
	 2HighJ8Ah8IddaDfAvxhiJWT039TtBrMWFg/kKOa6Quzg7FmNht3VSVTFuuj9wuMYW
	 UPIe8W7UFsH8Vuh5Ma5Ve0PKuL6e/7Kk4TS0/aQWTq9Rq/ACHPTxsXycz0iGWOEChb
	 6fT076Gqv6EKNe77wUihUEJtSh7DdSVUVRWPpuSa2cu2elLVCc1dx7j+5NbdciBph6
	 DHgwasp8tavBk9cvLmW2zcdOYrKGVimvDUQIcSZKfLcY+3fm9LNK/12waef5sIFa8Z
	 9RexZ4fguU0BQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so866474e87.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 05:49:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwF6Eik2ypgPGvQZpE5vBGdxSZYbCaN2lNaklaWPc3lEFCgXcMIOEi0uY0z8NJ3aVT9r9IgRNnedRoq@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wv71c6obWy8plQjTdA/eZ0SFcaOwxc7pfh5sciuVPjTPo1nxg
	SDjxF/1VJ/HfiT5jV9ZVawZbAfPJfUIzfczvcPkIOTyh/VE3RqbUOmEJbUDpiEwGGhi/uM+ewNG
	sMUmD3S8WhaoLfPvLJ4JskCJJBSYr3ZQ=
X-Received: by 2002:a05:6512:3e0e:b0:5bf:9fc1:3938 with SMTP id
 2adb3069b0e04-5bfd957bcc7mr5494867e87.38.1793800173643; Wed, 04 Nov 2026
 05:49:33 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com> <20261027-cv75-gpio-v12-7-c22555400e18@ambarella.com>
In-Reply-To: <20261027-cv75-gpio-v12-7-c22555400e18@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:49:21 +0100
X-Gmail-Original-Message-ID: <CAD++jL=yuKLqcpABypsd1icKUYesX=uiaJvUW28xUZoF2k5yjQ@mail.gmail.com>
X-Gm-Features: AclHuK9neIpLEL2dp-ulhGPwQf0eKyJA8-7rsKU-aX6vjOndnPekJ1Twq9QUMqM
Message-ID: <CAD++jL=yuKLqcpABypsd1icKUYesX=uiaJvUW28xUZoF2k5yjQ@mail.gmail.com>
Subject: Re: [PATCH v12 07/11] gpio: pl061: keep the parent device in a local
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Michael Walle <mwalle@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:19=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> IRQ logging uses gc->parent. Keep that device in a local so the
> gpio-regmap switch can change where it comes from without rewriting
> every log line.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
