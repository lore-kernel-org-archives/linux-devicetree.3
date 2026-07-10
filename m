Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67512882D6
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 18:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783709609; cv=none; b=d0Kwz2uNIq38veNu/DHOlxN6E3Lnny9JhduqTODNXNwoxmf+h3Xj0ovMaCOEPDEdw8rALlnUsOSeG+gW/CtlX09sO6j0opXCihXjGdfwzth8gDtbnQ+YdmYV4gxW5UysLAsw0bsx6f+1crOJaRHymXEXWVMGN0QYatVoL0kDMl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783709609; c=relaxed/simple;
	bh=mS485fOgIvhcuepZ3Oku5/wDYi5YVAtYod06IGUO/W8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlVS6Rfbqo1bibt2eM1ANZCjQ4XFdQc5AY4X4vB+jJlyhD2wlKZeN46eeMI4zvS2FLfzsV6h57dicI8G4oplQBskE9Z2x4T0wJRc503K2rKcsI1TlYwGVvDSCOaLNh8oL+XR2v7qhfSPMN6WvpLDb2geSOrdmaqcyFEttHFuP4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nC1gZkZG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nC1gZkZG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB621F00ADB
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783709608;
	bh=mS485fOgIvhcuepZ3Oku5/wDYi5YVAtYod06IGUO/W8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nC1gZkZGUu1c+ijRrCKUlcDODg0wDdbTfE/l8HAx67EYodxhv5NUpCETx43W1TTkU
	 6bDmYUu3pjoHfW8d2SifUOq7ef+JQ2k7es4ev27hYVTTZKTUID62MenQ2qHU9p6Q/I
	 zshxisfohZVOFnwJOtkapzZXGeHFRn0EW8McOD4z/5N0bWb83eNFd5SGxk7fyh7Rmu
	 MSWB4cyXgFLPcAbRCO4i/8frv/c0YYd5dRipH5fhIQDqUj0UqnPhcSi5hhsj+qBk2Q
	 R2kNF9ITFd5pqJ6qFZwzWBY8QqJQNQpRjmrA68EfbzPlDGKbgw78ngCZ7RxgkGmbx3
	 qwqeIi/pPifQg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b01146b205so905261e87.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 11:53:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrYBOAPklOi0VeMuTaJ2r5oWi0geUKM6fnIY6E+9DtVbS0CZCJhvii2xXaZjBTBeWOkEqjTlbgUfcTH@vger.kernel.org
X-Gm-Message-State: AOJu0YxVj13li0+mteL1LEm4o54YB+mx1g2AOhz1HfAvCkU7xt2HINg1
	VFtwbw+bqgq/QyJsrcC3QFiySHKfYvAlJFe1oUV0rSIIaeo11JpztxtZwvUusp4k9HYV05Z+Nq4
	UAxegtKmIGngj+VsgWcWGuKVKd9cEBO0=
X-Received: by 2002:a05:6512:6699:20b0:5ae:b629:4517 with SMTP id
 2adb3069b0e04-5b0236de948mr44182e87.63.1783709607271; Fri, 10 Jul 2026
 11:53:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com> <20260706101823.341230-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101823.341230-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 20:53:15 +0200
X-Gmail-Original-Message-ID: <CAD++jLkQPHfq=_D_TPMbmmA4JFwbhhtTC+3Dj+uD2P6LFNtfUg@mail.gmail.com>
X-Gm-Features: AUfX_myNLzbgrTSqqqiX6xG1do6m36L6LA1SqCR-RLu3gRQM6LPnA90pLzI98Wc
Message-ID: <CAD++jLkQPHfq=_D_TPMbmmA4JFwbhhtTC+3Dj+uD2P6LFNtfUg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: st: ste: Correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 12:18=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

This patch 2/2 applied to my ux500 tree, thanks!

Yours,
Linus Walleij
