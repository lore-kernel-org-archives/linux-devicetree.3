Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781181;
	b=db5tAXsvlng3gIVpTcCzZM9WDQ69yx9P/zEv8MGbvA5sgP4LHEOxDcsoiLJ8yN/XAwel
	 dPV4S02ziqq08GYVnd0BAayjbZlm3q0jHBgy6RPMYka1jxLT7fsMUzcejz4Le22cvPy27
	 opiSmOIm9O/HF4/CNlN81OxvMI6RrcbNQbmSFAp4iR8HVWc58t0jPE8KljPnLO+P35EFA
	 QfvfdzVf1ajNF5kPV8U47d7BgnpkE0mKKKNWxJxnqRNybcz3v6TF1xOl8VOfipKCgncfC
	 MPrjEYN+YdN01rqvqG9I6OoHz4eAi6eGyJoN/IZTp/7JeX9pqHlfg7RGP9yrLYTjNng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781181;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v+la3jMKr6nPIrYEiR5T+L2vDOYUs+pDzg8N/ii9g/I=;
	b=ywvnfX8sO4W4fqt7KqgAs2xadldgvo619B74VJHYuysTUy2EbMHORnyPLbiIbZ7RVjLm
	 59kcjBzuTcUZGPCNuQH8nilW0juxlwqfaL6SxMPaH0FGrexpg2ZqdEzyM979g1VIydP4I
	 cf0UuuDAiwNHVs4nHRCuvbHHbjmrbrdrri/gFcNRbL3S6Zqni8qESKmwzZUXKeFRTMnRG
	 WZeH/HY1tWs9Prhr48qy3Xftu7lqV1EV/0g1rttUzD6Y0vejTTj9k1wxIItkumT4gQzVI
	 pQyxY8/tJHBWjmlwInuIFKuevNSm+cOSD2oGLPOLj7oLXhYfPNVpMNEDY23kkY7Skpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3F3606A32C
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F3F3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso2442145ad.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781181; x=1794385981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+la3jMKr6nPIrYEiR5T+L2vDOYUs+pDzg8N/ii9g/I=;
        b=HDzQc2YS8i44El1JiJoS7bDGZ4dUmUe7m6I0kAANOYLScwNLMSmRRzlGFyWNUw1nV4
         1UKENgYL6dfDanligAPnR37hjngcZReKOLNNRjfSjSILxlHiG9HLxH9NQGZR5dJ+uuXW
         gjBAS5SYXu7L7vBsJ/FdmDvaEvAnFUs0UFom4wgE5jbRpLrvHjuMCnXV8Jklv2g0sE99
         rLqbv+yUidzPFFFvBjcl/bVKBCdmm940AczpDrTaLWH4qs/+/6/zDJlfswtKb8X3HnNl
         0ArGgjCgZGsGo8h4MAKOv0kR9Wl6SkQ+7hDzM6Avy5uKGaaVBLcxleOKgmf3kFNAI99F
         4ixw==
X-Forwarded-Encrypted: i=1; AKwUvBypsl/PZzhnY8u8ayxGEMjtb4or4lc342xDrUCEdB1J9DsueTh4ht2nmWaMJ5Ll1RXeitQqnCP+dj65@vger.kernel.org
X-Gm-Message-State: APuU4Z9RKTQ7v3KGlKuXwc/020SstGPdrBjBqtHv1q5nBqvXliMSRhgi
	9QZgP4cp9vtos9+Fux/1BhidRb+Nb77glE7qnBlDCKvyil+rPsXa6NOirnQqnEJn
X-Gm-Gg: AYBFou1VQyNs3xSXHNpleedZ4qQWUWLkI54Ho9OPcL8Gt4Btqf78CbI+MiTX7yVLryg
	PL6A3gt9F09lCk3G5BoHQro7KYoupdevMPC9uFZ/ndaHpaBxEHbm81J1R+xDTE/Y2AeVEb+AWG7
	zg1YoAQrtt7C/T0lnW4a3DH/M28f5zxlzUd+xbEG2yjsUmAWv8dnnwqZIpt9YK3+h6HjK5zk6OJ
	mwKvSjnURo2KHR186bfNrbKSVRsQnymwQG5aUsElIG3M4t6nOxIjgEAyj7lVA5z7QStfSFXyXVE
	Xlcpr18xjW6gv/2T/QF0zBwuWLinQhe9Lb+XMlK/A71TFZrvaEwKQ5AhQajHJGjikzaHioJFfqm
	VkRIjIvnzH3ooyVrTX4N+b2XVOa9EyEwEH4cmca4TCKz3CuZlz9ldcL1uIpR1SzLW+YMV3uE/Js
	NopfyiZhmg8D8tZ/TCNLLCS2O+vA1EGDLWra9j1gBTZV+8PqVPdWbVGsYZA6cn+CO/c0btzGL/Y
	Xc36XRP6PSO71P5P9oUsDsLVxSKI0UC3UiXuy1E9E32tXoKKEm/AOCo/sSSJ2kA9MdQxNoKSoOB
	4OF0sh38AK/YPatU8jfx7+hYVuRVtzbIqQpj7araelWGEyeZc9l5SsTDtCPZ5EzS4DCSVG1TGkX
	os574kcAljb9XG/litf0YkKzlp9XO6eSLSrPhI0TUn3I=
X-Received: by 2002:a17:902:d584:b0:2e9:87a1:98b5 with SMTP id d9443c01a7336-2ed0250e056mr19343205ad.14.1793781180700;
        Wed, 04 Nov 2026 00:33:00 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0922b85esm4627035ad.75.2026.11.04.00.32.59
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:32:59 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-369f33df08eso730623eec.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:32:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxE2RdNONSWoFp1ghQLQKvhfsvuKoXtsojFuqg4HSO7ib/MWyAa6mM/52RmA7gWXNV/LlKTu2K61ce7@vger.kernel.org
X-Received: by 2002:a05:7301:f09:b0:35c:ba31:6fef with SMTP id
 5a478bee46e88-36a424438d2mr23103058eec.36.1793781178690; Wed, 04 Nov 2026
 00:32:58 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-1-45e463c48728@telaak.dev> <fc273wsjhyvtoqjnuiipramnvjvti4n26yxgvr23neuawnz2zp@krm4cfn6pfkb>
In-Reply-To: <fc273wsjhyvtoqjnuiipramnvjvti4n26yxgvr23neuawnz2zp@krm4cfn6pfkb>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:32:47 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4-voYM1Uw8+0pYArJoHknyyg5CMB-mbG=qn89agxxYug@mail.gmail.com>
X-Gm-Features: AclHuK9LKKTlOPvX59pIytGyTkFgOT4Kv7Bs2y1OMNJDw7pUXgmS8KoRNSgAgSU
Message-ID: <CAPY4CJ4-voYM1Uw8+0pYArJoHknyyg5CMB-mbG=qn89agxxYug@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO controller
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> If you're a co-developer, please add your Co-developed-by: prefixed with
> a list that looks more like:
> [...]
> The above is completely unreadable.

Thanks, v2 will use Co-developed-by with the changes listed that way.

On Wed, Nov 4, 2026 at 3:12=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Wed, Nov 04, 2026 at 02:21:37AM -0500, Joseph Telaak via B4 Relay wrot=
e:
> > From: Chuanhong Guo <gch981213@gmail.com>
> >
> > Document the GPIO controller found on the Siflower SF19A2890 and other
> > Siflower MIPS and RISC-V SoCs.
> >
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> > [jt: from Chuanhong's siflower-7.1 branch; Joseph Telaak as the binding=
's
> >  maintainer, GPL-2.0-only for the deprecated GPL-2.0 SPDX identifier,
> >  example indented by four spaces, commit message, subject]
> > Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> > ---
>
> If you're a co-developer, please add your Co-developed-by: prefixed with
> a list that looks more like:
>
> [Joseph Telaak:
>   - did foo
>   - did bar]
>
> The above is completely unreadable.
>
> Thanks,
> Bartosz
>
