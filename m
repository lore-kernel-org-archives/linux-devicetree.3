Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B073DC4AB
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786690816; cv=none; b=rT+S/dbTOYJw27GKkJyXGKWKxcBvkC0RGDWCkGiJ8Bmk/QyrFrx4mJrVbaRrVJCiZxQsxn6ghqRGZi1GUWsQWsgh9QeLDkKCPbcGXo0aJeeByyO4xV0tZ7AGKo2s0t660cSux4kqKp0MbbjrbTG66fM0uiRsO7XxrB8ibHhwM9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786690816; c=relaxed/simple;
	bh=QDHTWER7gaZGVxdnix6HF1IV6R/NU/zTyMo3McscTZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YywEb3matFrv7f5enAxN/G2tFFvf16KRDUnAPPEnptkDHw6DvnbD4LVJA9IfFBjIezCe6cko9u1iuOUz87fzUTjyLxbT5VblgPi+sniL+rl0UK67qOgjrVe/F3/kw4h4k9KTYw7I2SMf+JIQVB6+NbX+36vhIBbyPQhiBbQ73fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFpNzmn9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFpNzmn9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264E81F000E9
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786690809;
	bh=QDHTWER7gaZGVxdnix6HF1IV6R/NU/zTyMo3McscTZw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MFpNzmn9PY3nk07mgfQgps8YiGSp8vz7TLyKh5WxFd9sUXmWYMosTQyYpfp+6HsLB
	 L0rYre2gQ5JSq5+vBGfCnJ1JY795bIae/pd/y0oCZln2bwQM/RxxjhoSDyQ43L4t0P
	 1I9h2m61dqxoBJAm+HN1jwfKGpX3gPNx3UPbBnhYROc7CtC2fdO0jtoFKc01HoO1qq
	 0UKQsVFfSRAnoLBkjAWNcPpYWMstZR9Rbg9vweR5t01LJneoKnTHKbc23J3YflAAIk
	 sH963A3ORbYT+01BVGRgfkDXq1yiX+N9Z9N9ZSg9sIq5TsHaCQYS6a/Ge7d6fbl/D0
	 IC/Xhvhi6V/MQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b013084dc2so522272e87.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 00:00:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrfIPcW4751OEsZ5YI6TH4jjl8PsfvNrQJQ4VaN+k1wDjQ9yWf21u0YgBOwuRgm3RSTCFEG16vUw5rE@vger.kernel.org
X-Gm-Message-State: AOJu0YxCr1QXZLRUTG9Y+4p/mw+sDJPRf5DYOOSuC6zibiQlYpA6O8Xj
	VyNLkxE2Bcw862NLfidK8+R8aUnId3EbtBEoLRgb7IUCESGUCj66J5Cj9q1/qD/OPYrZ+2yejNc
	yhm4Ed080BuX+xwdxzTGETZMz/q32FaA=
X-Received: by 2002:ac2:4f0c:0:b0:5b0:eda:de1b with SMTP id
 2adb3069b0e04-5b45915d0f8mr422711e87.16.1786690807955; Fri, 14 Aug 2026
 00:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-cv75-v3-c-v3-0-9352b3fd6026@ambarella.com> <20260813-cv75-v3-c-v3-2-9352b3fd6026@ambarella.com>
In-Reply-To: <20260813-cv75-v3-c-v3-2-9352b3fd6026@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 08:59:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLngKLVtojVtmVkYkdLLZrUojper2H4UEA-jK9gcvCSbMQ@mail.gmail.com>
X-Gm-Features: AcwNN1X41Lg0pGS5rN1f6LITo8FZUmbNN0ilERFfy_O7IWKV3Rive9omrkTS7bk
Message-ID: <CAD++jLngKLVtojVtmVkYkdLLZrUojper2H4UEA-jK9gcvCSbMQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] serial: 8250_dw: add Ambarella CV75 quirks
To: longzhao@ambarella.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 12:35=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Add CV75 platform data with an ETOI IER mask and skip-set-rate so the
> DesignWare 8250 driver can drive the Ambarella UART for console use.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

I see this approach was successful! :)
Look into the Sashiko comment abour lockless write to UART_IER
but from my PoV this is fine:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
