Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C0237B409
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607444; cv=none; b=FnYnBRmcyePPtYzTC8z0UmztTDhw1TaE3atLQ9X92pbFJzzn9YIcCxMukHTMFJefmIprj3AaV6xdJsdOazWphFgVID4xfZiUn21LK0xEz4cHz+CPxlYVuAw3B5KYNQo2DAYK72NsNuPSsfOrcsyf3IIKr5vsIcAq28goXIMIHio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607444; c=relaxed/simple;
	bh=Uk1paIY8euqKKlETQZ8oULEMJ7HstW0bVetbSs+wtjk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNTIKRx7uLiLOBkl/FjBdEgPvoMwAtXom80DFOeIZP/XS2ua0t+nXxz0yFmOF0LPaO1Ech0pDKsu/T+//7q44gDJxCXiRXqIyplL/EydCd48qvZ3w30X2LXzJFLquKIyPZ2I+EdUYrcalYjgW52Nkfu4RImvweaadpHjZUTrLB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aAPe2NzS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aAPe2NzS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6A71F00ADF
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783607441;
	bh=Uk1paIY8euqKKlETQZ8oULEMJ7HstW0bVetbSs+wtjk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=aAPe2NzSVzCsVoEJl4Pfk0xsoJxuTh53QIGB2Tp+vKzneayhK8Y7MvWGPaHfn1/oC
	 8mIMfKrP6NAUPir4jjJ06QZUt8So3y3Gxvgg6bh6DaYfyLBwqE1YMv8RbeLeB5VOwe
	 u9nulSn5IXh/H2zmQaj+MCGkzibu6H2XGUh0PZRXpRkRHtSWeEHakCr5uF/KoMCtmv
	 W0ClOD6e5e0Px+qJ5XWCni7WcxSkor0DrLz1W5uy85QOg82vEAAIwY4mWsIwRUwX6M
	 bgK3VVIkGN6lyNlRNNW5E+kKK+kPa8ikmb7EOAuPTQaAj0+vhwVVYv9ahYJA3J4+pe
	 cc2KqmuiTdZcw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso1015936e87.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqpZ/StmYvSFCBY/6ZnY8kMA9tYJ2T1XI8JDqHFoXkK8NoHaJKltY988SvYaKTdKn8X9lrrUistKoVS@vger.kernel.org
X-Gm-Message-State: AOJu0YxelrTy5AI+NsYI8fAE/AotlcJwNeXxh01BP82M8kWl48wBCIT8
	I1NboNOdH0/cM0Q1De7L9HmSPg3x8KDL7nmPkVZ/dCDNQeuWAEXMZCvAt9FP0L61/PNoxHXY6QV
	tQAr7rjo2Mtucaw83z22e+xaYsq4326rGXOn8AuIBDQ==
X-Received: by 2002:a05:6512:1415:b0:5ae:b88c:3ff2 with SMTP id
 2adb3069b0e04-5b0114afdadmr1759669e87.51.1783607439457; Thu, 09 Jul 2026
 07:30:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 07:30:36 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 07:30:36 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260709095726.704448-7-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709095726.704448-1-wenst@chromium.org> <20260709095726.704448-7-wenst@chromium.org>
Date: Thu, 9 Jul 2026 07:30:36 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfx1qoHWs08xOqNzmp3+RroPXQF1ps0Q_bu+17DWz0eWw@mail.gmail.com>
X-Gm-Features: AVVi8CcTCqwQAcyQVn3vmM3d_PiKCDTxzoT6aStAZSp__o8inJgUu4b7eftjDFw
Message-ID: <CAMRc=Mfx1qoHWs08xOqNzmp3+RroPXQF1ps0Q_bu+17DWz0eWw@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] usb: core: Move struct usb_port and related APIs
 to port.h
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jul 2026 11:57:11 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> |struct usb_port| and its matching container_of() macro should live in
> its own port.h, matching the split we have for .c files.
>
> Move them as described. Also move usb_port_is_power_on(), since in the
> next change its |struct usb_hub *| parameter will be changed to
> |struct usb_port *|, and becomes a non-static function that only
> references |struct usb_port|.
>
> port.h is only included from hub.h, as a subsequent patch will directly
> use fields from |struct usb_port| in a static inline helper in hub.h.
> The USB internal headers don't have header guards to help with this.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
