Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C32407582
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454419; cv=none; b=s9QjA+gvQrKEzcNRw1PJJ6NKd1oSHL0f/gTl01hCTt8o0kaqUUGNAboZ1CRvB/m7bVCGApCcFLnFrIaIjZJDGfEUoHSqxhWSakyi4Y0rZvKsfrKO4kA8aOaEfQ5P5nRie9kC11rqhh3e5mW62O4Y83IrzjoUPqWQ/U3dW87f/QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454419; c=relaxed/simple;
	bh=GPZxIJ12NCdT32FLt89aeHS/XUCWgFohujxo0l4BvtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n792xdNHr9ZKjA4fZEAp7zE6otuar6C5AmEccYDdSA2fRPtQI7G+OxfJIwIJsDRdKKt7iZ2ft0+97zLPs22LQpewbUV9qyusu93+Tf7rf23ymhbnW/LWWUSzCgMc72P4jfW0L5sWEaZI5hJ8+6eARS4ftyOTZYjvUg/BpDNZwU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E3V5dqCt; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E3V5dqCt"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c30d9adfa7so157567e0c.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785454417; x=1786059217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1swx6ZS7vRHB6s/IgYx4mgkiMyCPAEEjNZGLF7mxwyE=;
        b=E3V5dqCt/Ln7Nm69H6cIZugVC02Rkjjx7HfvXAOG58sWLk9G4QiOIxkWtcyTt4M+zL
         I8xlXGl7dKBpZM/NO42yNyCvjuynsguT5q/5MGYFBBgRI+GOg4eADgUiyT90xVrVW5kL
         uk42+Vy3YsLxezLpxPT2Qm1Nxl+S4N/yuGJww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454417; x=1786059217;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1swx6ZS7vRHB6s/IgYx4mgkiMyCPAEEjNZGLF7mxwyE=;
        b=p8/bnZrSs8iSCTk00EwQbLZvaSLbeh0WHQ5rsI3ITcZgmlyyUIoZ91a75kf6pFGoas
         wpzgMvxbHE/JkVAUtdLa6n5iCUigGZlJJurM1G/tjIKjTIPhEdLapDzx4n18r0xRDfAS
         GdPrgs+2bdn5QCtN+f4PqVqHe/L9brC2CVaSv96nr3ohztJQdZx+lGV5t+a+hyxCHo43
         9EYMZgXpTXbrqTUhuRdJ36agIkdaCHmTNCgeEu5rFh6zg0bfdbN7DNloyFije0X4vgth
         A497XrUOXz+BNMN9AkLcQLsOOpl2ufoKSSbcE+LOTib9T0xdUqFbgibhcLuSMHOmVDhO
         7j+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoTarNpFwXr6FfZ1Z7ZtII0y6u6ore9dpDRCpkAUFWCbSxCcriJSFULG7ii/AFSTv71IhNMEKb+2djE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaj4SJjzTRssb1p0pOLR1XzD3fuSojYrEW1o7b8WeClMjwHIc/
	iXkqun8MGBhQOTwKIwbufTKlKqEn27ydt5W8DpwBCClrwtAHBxhNdx2PHhPE09IVwnx/9km4ObP
	gXfc=
X-Gm-Gg: AR+sD12UHyJP4YDPLfLibZOGjOlg0jYiIEAK8Jm/UXkjJbVKeGeDcEiuD4azoNHVuMm
	DitMoaXMJWLVTabHRiciSarUrABcAE5aOmm3G/uHQmScI/P1/8c7iV7Leu5uihTg2Q+ID6td+sp
	2aFITD0ndIJS4HYw3Lx2YgAxzRFRvEaUukmjpm0SWSoKocmTABBlg5j1/1MpFfqN2WJ6xFQ6Tj2
	/5Npdjo7y0gqbc3HHoYROqRNokxngyQqHpaFT4vFDLfRwD72RutnmKxGukxH1eDCrCWyHG+8ABh
	y3EMQ8IvwCPi5U0Nw6M4QVbNTMlrN3Z9zeAk5sqfGCpvIryMizXCod1cIIoGSwtkJbKrmQjHTyl
	8EFMaCqv4VgTTL5rIu7eaKV0FWqqoi6ozDBCQ5QzmF1U2bo8de8XYCGDspyd7MTy1RjP86GK8SV
	zkSqBc24dWEjPUAAJPLJgy96b0iitpvi0Mlvvb7rLUt5xuWRWSb4w2AqEd3EnL1UvbrVyBjgNu8
	2gnJ89h2rypABrvG25xiMl0aWc=
X-Received: by 2002:a05:6122:e233:b0:5bb:aae2:1754 with SMTP id 71dfb90a1353d-5c366221d69mr1592291e0c.13.1785454416813;
        Thu, 30 Jul 2026 16:33:36 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3666d53a3sm2852322e0c.12.2026.07.30.16.33.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 16:33:35 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-96944741eaeso93182241.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:33:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roc58q/W6Url2dJf2MXEcqJddyeia2uGwYvr9UnpJafheG74dmcQZfT3hXe6fyuXfhFA1Cjca1HfsXc@vger.kernel.org
X-Received: by 2002:a05:6102:3592:b0:608:9a34:c8ea with SMTP id
 ada2fe7eead31-7574e6d1a1amr1650546137.10.1785454414391; Thu, 30 Jul 2026
 16:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-1-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-1-3abae9717feb@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 16:33:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X32DiN2X26AutA97cpmywW9C3-76p-crT8sSQ+XqZNZw@mail.gmail.com>
X-Gm-Features: AUfX_mwLrAK1Nx-rPTyOqhPQSXAd6QqwkRvKOTa5fFmS8RMZbaeNFVMG8HEBq6M
Message-ID: <CAD=FV=X32DiN2X26AutA97cpmywW9C3-76p-crT8sSQ+XqZNZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 22, 2026 at 2:56=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> -  # Bootloader requires empty ect node to be present
> +      # Google Tensor G5 AKA lga (laguna) SoC and boards
> +      - description:
> +          Google Pixel 10, 10 Pro, 10 Pro XL (Frankel, Blazer,
> +          Mustang).
> +        items:
> +          - enum:
> +              - google,lga-blazer
> +              - google,lga-frankel
> +              - google,lga-mustang
> +          - const: google,lga

I'm not sure I really want to make a big stink here since I'm
certainly interested in getting something landed. That being said, I
at least want to ask about the "google,lga" entry in the above
snippet. "google,lga" represents the SoC and I don't think that's
technically required in the top-level compatible string.

I had a previous email about this that essentially went nowhere [1],
but I'm hoping to continue the discussion (along with other similar
topics) and Plumbers. The essence of the question is: how much data do
we really want to jam into the top-level compatible string, and is the
top-level compatible string truly the best place to indicate which SoC
is present in the system? While many boards put the SoC here, I don't
think anything in the DT spec requires it, and I'm hoping that we can
stop doing it for new boards. When/if we need the SoC info in the
device tree, it seems like we could put it somewhere better...

[1] https://lore.kernel.org/r/CAD=3DFV=3DW+jE_L_LLgAhD8K_4+CtivSD9-9t7Xe63X=
uKrKjfyfeQ@mail.gmail.com/
