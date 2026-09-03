Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC3E33F5B0
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425433; cv=none; b=p1K/zEawHdIuyep0d7khLnhafnkNSJ52ML1BMz34J9269zZU089iOU5O5alrw2bSTQe7HGHzQQfFJR0dD2bBP34o9dQ/yocVkx4hU/tA2cXnSywtEM6uW/FaT6VKtsc8peZ4Re0oxk77qG7uXbkl3BCnVDRgG9MydiIDnX7Dpgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425433; c=relaxed/simple;
	bh=b/J2tIGkuu9cYQXNDh0K6oZrkOSsiyfDgQIMW7Oe+HI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVO/ZGixeMith6PFDSFAYI2RjM6lpThOT3gHCwpgZNC03q0ittFzLQdSLNJZBAlTb4ApciixkR8fXOvY6ovSc++axdwk2LWUxRHzqIhdonfKjwsGynkS4MQKlGmoeyuTYdCzXj2Meuz+BhdBBXvsDrhBF04vb9rMus9aGclgWrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sx+U6Wx0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sx+U6Wx0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F42331F000E9
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425432;
	bh=b/J2tIGkuu9cYQXNDh0K6oZrkOSsiyfDgQIMW7Oe+HI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Sx+U6Wx0wVuHSQooXqa8CjknDXTH6Q07Dy1aWGvATNWTcAw08eXKpNxPEPT/pV2XE
	 nSdARuGSJIjsPkxWMLtElhSijUd89rpkGycB4HvsMy6PbLXKXIW+QZtQe5aSmOhnps
	 ftERVYdn/xtr7fdXSS9hlRn7mWIJ8+iUoR8/fPRYjza/yW3UD99EiQZMdgofrzK2xd
	 fqkHxkvtloaoSI+2GEA+1VPFBCe5a+GEvkAbyZF4HRUf4RU3LGip0UnxcsCHG/m9bA
	 Iiyr2JVP1BnNAHiP3ZzqCbufd6BmhC8d2Grm2rbyPHFe6c6Kjan0b2EL890TJw4ltv
	 tL4PmEUdNEq+Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b45f2e5f58so1914712e87.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 01:50:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5hUcZ3WzDs3OBrGRh/U7EQie3qxK+qVi7X+bHOVrWXObItTw1FijPB8KLMVfZ0BERH64M0kKcDHgA@vger.kernel.org
X-Gm-Message-State: AFuF++kozLt0ZSYihTrlQqOUQEwzJcyW0Lzi7qRJoHpcdCt8IU7LHNgr
	4xKI9NPTJJc9X5wxKoXkcxPxfuiOZtNp673FbTTDk3GIsybP+1mtA+WuUcN1ie80Vfz40LTyFhA
	PPeG0Fxnegn6SO440RP68CRd54NO04LlEIqNWV8XoqA==
X-Received: by 2002:ac2:5696:0:b0:5b0:eda:de25 with SMTP id
 2adb3069b0e04-5b609197069mr3452281e87.6.1788425430612; Thu, 03 Sep 2026
 01:50:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 01:50:29 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 01:50:29 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260903-pci-tc9563-aux-v2-2-34c625b542c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com> <20260903-pci-tc9563-aux-v2-2-34c625b542c1@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 01:50:29 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf6-7Y7nDvBA-zpw10_EeQ9mr+TkLfr_msBU7EU58LQ=A@mail.gmail.com>
X-Gm-Features: AcwNN1W8ZLKq45YYD-0C3nOhQX4esCxMfLaqxcHvxZDmgjB6oKaZzyXDqsJyCzA
Message-ID: <CAMRc=Mf6-7Y7nDvBA-zpw10_EeQ9mr+TkLfr_msBU7EU58LQ=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] gpio: tc9563: add support for the embedded GPIO controller
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sep 2026 09:52:58 +0200, Lorenzo Bianconi
<lorenzo.bianconi@oss.qualcomm.com> said:
> From: Alex Elder <elder@riscstar.com>
>
> Add a driver for the GPIO controller embedded in the Toshiba TC9563
> PCIe switch (and the Qualcomm QPS615). The device implements 35
> GPIOs using two register banks: three registers control the first 32
> GPIOs (20 and 21 are reserved) and three more control GPIOs 32-36.
> GPIOs 22-24, 27-28, 31, and 34 are input-only.
>
> The driver is registered as an auxiliary device driver; the TC9563
> power controller creates the auxiliary device and provides a regmap
> that gives access to the GPIO registers, so the gpio-regmap helpers
> are used to implement the GPIO chip.
>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---

Looks good to me. What is the merge strategy? If you want Bjorn to take it
through the PCI tree:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
