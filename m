Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224651;
	b=TeBrS8kkce1vELAkNtVpugLge8LUhmqtbI3Hn/bU1drE34g+MHEC7bBLIjXVgdVklUkI
	 TAwcy//8QdImVO7owO1t9FBlxSXQuyngWYzCXC6j7ajj5XwwDKoK4q9Cqofg00H7Y+Fjr
	 f22iIhOgWuPDDu3YOfdJm2F0BNtZCL6/r7ix90Czuj8isWvz8Iw2FzVUljXEM9lmYRoxS
	 LVeeydsLQojz7bZBAo1vm6N4GxqVaxVw3zpoICmNBMqYK0Zh0mHYcLx83x1l2VA8UqCre
	 uJgO0To7eTQrGOp2k2r/5/GqjSCna8vpBoiNIP4o6qfGWQP/IZR/rMwLVCSMONbanOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yvSpU1RmCwpqp69YfdVcFdLUU7Lktr8hu4x+f1G9b+A=;
	b=tWMDzimFYt9HRoPKKFzOkQqPGLQIFw125WFHsWyjJjX81OmPF2yl2kaoJn0Q6WhwfE+y
	 b8QI14zbaw1GyZebHxea+JjyXbNgrNaa0qL7qf2xo+4B3kZT/Aahuj0ciyGOiuEOpW/13
	 SMt+llg6BsfMXeEwvq6e6k1maPaguIi5uqCdmeL9XFA0lUJrisefH5mHhV/P0/3W3PzPG
	 iuY7cm5BoRWWupLOKUmE2E79QW8Bey1cbmbIpKBGMUI5/wIWP2cTTEP0t0TW1IeAeI6fY
	 9aQTuwe8GAhboY3N4ipqTEdp61t98T0+2aJD0JyzvdIJqpiwNoPZGpcesFMarCrAMSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Mujw4cxP;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD660A2603
	for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 21:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01BD660A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Mujw4cxP
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso199119366b.2
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224649; x=1793829449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yvSpU1RmCwpqp69YfdVcFdLUU7Lktr8hu4x+f1G9b+A=;
        b=Mujw4cxPoozF0KwLNW0soR2O22eNmC7RvcTbC+r+4LdN/v3+S36Lg8Q6C/dfmQpxpF
         W3bgonuh6IpXt99ATNpAeJ9am7IYPoIO+75B6SmQS8siaByV83BEKuOl5lwxQtyCWjRs
         XjfOvNHcYnU0zbo33nZkiXMbCVqTz/ryvorwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224649; x=1793829449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvSpU1RmCwpqp69YfdVcFdLUU7Lktr8hu4x+f1G9b+A=;
        b=TuVsCNdMoxEF6g+9agWzBhNdAf0qUTD5uJ6GFsBOprODADRfhG5kos2UoxkRGbDIqi
         wWMckzAuVXO28nDrMkKP3FygIdjf06G720p1V72TH5T9RjLjw3iDrWYqy6n0MT6sAVYt
         BUf1HATP+VnrUjNLko56mg21mKeltMp+7ahOqRm8Pi81pkwTHDKsLVNLNeW5ZkFSoZNi
         1TjmVb8TlJY7qHhcA+vh4QEOh+y9S4qgCPF7XuXqItlLBgXD3i7qmTZqJuvfXb/pqp1w
         0KTmgthAUkN5EmPk2biynB/Kh8N1xhBQFz+QRH9WLAOoEgTG5zEDkPvkoYpP/LeZTK/C
         W4CA==
X-Forwarded-Encrypted: i=1; AKwUvBx3+dRf8yyWzE+iUwnRsmhtvKxOdupQQhgD+aWpJtGKYa4+Pqdd6t49+i9Yymcn0Q6wA+fTNYV7BTZf@vger.kernel.org
X-Gm-Message-State: AFq9FYJrLO4tQAERUGgG9r2sJu+H1eEGlCvy+KvumB/vr1SVc2NB2KnZ
	9248tSyM7mdrldBLV5T8YCaFwUnmHPOHbfPAzO/HyTFo1q8AJnBA7BC1/cBr/xWzoFouOBpcP1h
	gDcZjhdhZ
X-Gm-Gg: AYBFou0NZ1UenwQxaDphSgoXaTyFC7Swh6yhutzxIsXilOT3HVEVW/OJ8+FoTmI8Xou
	xFlokXenLj7PGyveK8zVnUdp1eJaO96rdWYqsJBveILk91cBkLoOF4gv/vGuatmPfqP+UtRCldr
	CgoYkLhNQ+hk/962gfbq33x3JPwR0pcVtVC0YZqheziwIKGwTQz8/xkHyH7we594hzBx4N4+T/4
	kvoPfSLNcJ3AKRnfPA+OuwGK1qWiKEwv4BQFfZdtxkiSXXMtJMys+yL5xgz7+uGSVrMLK4G3NsK
	9i+j6nsJO1hkmGuIEGOcUmKvyGQJH1I14OLJIETSVWpQsx2kK0NEVfFo8fB/k8JnWtMvmbAy+lO
	kuotKH4gWCV3vSjXUri/J8nBFALcYv1ZrSUSl87tm5BbqHHqcaqP+xHvzHzHyAnRT0ozfs/SfYC
	hGd8bHG1FOT+Jkg21hoInEqvheGeI9mJPzH+ywFABaZEfGmRHs9QUiEEpzexcPFzcz4DSAmddd6
	WpxBpD7YPj9qiHXyIXNJt/QCwnKx+WckodvITqkfwQ6wTfVXXXRICdV0hGtQeHGr0izZMTmns5r
	5OUUHUWxKYf16hHiSClPCIK8Ijf7SIPYy/dq9L8d5awuXjFS4LWm/PM9rt1lrggLT28w
X-Received: by 2002:a17:907:e8e:b0:c43:eae5:ee80 with SMTP id a640c23a62f3a-c49bdedc77emr322098866b.17.1793224649450;
        Wed, 28 Oct 2026 14:57:29 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd524266sm674283866b.38.2026.10.28.14.57.25
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:57:25 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so13571355e9.1
        for <Devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:57:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByozJzx4Sp8jAa4Vcm6Lmy38rr6+TqnL8mmjiIIm3UZ0HpJptLGnb8sOY1AaZEvkJ5zgiSBxuxah59h@vger.kernel.org
X-Received: by 2002:a05:6000:1862:b0:48b:d9:cb52 with SMTP id
 ffacd0b85a97d-48e5d2f0870mr9207532f8f.27.1793224645061; Wed, 28 Oct 2026
 14:57:25 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org> <CAFLszTjB-wcxTEKVNo-z0PctkhqavGEh+eiRyiPsMZBPkQbHtw@mail.gmail.com>
In-Reply-To: <CAFLszTjB-wcxTEKVNo-z0PctkhqavGEh+eiRyiPsMZBPkQbHtw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:57:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WKNgv4s6sjwhmFGsdwWT0hoH7aeT10yFukfGgKJG7Otw@mail.gmail.com>
X-Gm-Features: AclHuK9JLI1NV3Vu1fFwtBgddt7vzex8tSoFo5s_xXqgH3jZvlT38aEpTZKBlME
Message-ID: <CAD=FV=WKNgv4s6sjwhmFGsdwWT0hoH7aeT10yFukfGgKJG7Otw@mail.gmail.com>
Subject: Re: [PATCH 0/4] fdtfactor: Introduce fdtfactor to auto-factor overlays
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Mon, Oct 26, 2026 at 8:31=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> On 2026-10-15T18:21:33, Douglas Anderson <dianders@chromium.org> wrote:
>
> > The fdtfactor tool can either work directly on a set of compiled device=
tree
> > files or it can work on FIT (flattened image tree) file. The idea is th=
at
> > you'd create the FIT file containing all of the duplicated devicetree
> > files and then fdtfactor would "optimize" them.
>
> This is an excellent idea. I have been thinking about something like
> this for some years but then when Chen-Yu Tsai wrote something which
> used the kernel build (Linux 17c31aded9a1 scripts/make_fit: Support
> decomposing DTBs) I forgot about it all. So thanks for taking it on!
>
> Ths script's post-processing of a finished FIT only works for a narrow
> set of images. Apart from signatures nodes (where I think it should
> error), it also rejects FITs with external data[1], which mkimage -E
> produces and binman[2] uses a lot. Of course, mkimage does support
> making the data internal, so it's easy enough to work around, but also
> likely easy enough to support in this tool once the initial version is
> in.

Sure, if you want to make additional improvements that'd be cool.
Keeping it out of here since this patch series is already giant
enough. ;-)


> As an aside, this would be a great feature to add to binman - trivial
> once your script is applied.
>
> > Add 3-board test cases covering default mode and `--strip-local-fixups`
> > to the `fdtoverlay` test suite.
>
> Please can you move the tests from all three patches out of
> fdtoverlay_tests() into a separate fdtfactor test set? Then they can
> be run on their own with run_tests.sh -t and skipped cleanly when
> Python or lz4 is not available.

Done.


> > 3. Better savings than just a simple partitioning, like between SoC and
> >    boards.
>
> It would be worth including numbers for a plain SoC/board split on
> trogdor compared with fdtfactor. The whole set compressed with a
> large-window compressor would also help (as David suggests). That
> would show how much of the 87.5% comes from the factoring itself.

I decided not to do this on trogdor. Trying to make the trogdor base
SoC compile as its own base dtb seems like it would be a lot of
trouble. Maybe I'm wrong and it wouldn't be too bad, but instead I did
something even better (at least, in my opinion).

Instead, I ran fdtfactor on the downstream Pixel 10 devicetree files.
Those _are_ already using a play SoC/board split. I'll include details
and numbers in the cover letter of v2.

As I responded to David, I'm not sure I can test the large window
compressor since device tree files are compressed separately.

-Doug
