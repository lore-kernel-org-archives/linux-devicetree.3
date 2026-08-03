Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078F139F162
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785741763; cv=pass; b=QjbQ1NoqD1xiCv4xHiFczkbFnoMvVERkhoLoV9/V7DkS8TPoOv1DpCcHMT4Y4NEFFHI9ONt1ABOL+gD6uecIwU4tP0g+f++k6YdAbcorQ29vzgKEk0hvtw16zwO5NZy9i5XOCPJm6EO7o8Mqt0yysx7ZwRsrIsb5K6CX/RV+jVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785741763; c=relaxed/simple;
	bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Znrd47hFIP/e/aq8FdI9jj4m1Y6rnrAI+/mDACzNiQbAi8g7sdm7EPBjZXwn5tahu+u7fvvod8w+ulfCccqEakT2pFzWQwW/M4xogIMSvZu2w7QtphcddGmhvAzxRKC/2PSOFHQC174cD5y7W56bPir+XKmuSLowglehQ9ZbYtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtXkvoJL; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtXkvoJL"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-74ad03fa605so1747481137.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785741761; cv=none;
        d=google.com; s=arc-20260327;
        b=TCuUTicBi98ndxFj4+vHI8lKj4L0UZiJZXxjetlnKkE7+M9B48J+NC1TfTitaOgLGd
         nO0Rh1kM+2m+8Y07ELXYfAtpLl7jM/l421IP55vxbQmKD9SO8f/7W1+4Si3usVUyrKXz
         F++5MDn50GFVnC6wvwAs1nhj3SOOAeGVJb46VNM9X5OhX85Q9z6fL5e4rRTmKAoKGnMP
         9Uxnnlt9p+NhcYYjVzSWk1kXjQhOf28zF4QTkqxswAaQ5EKQDfpA21ZGNua6D59ygB5n
         NlRsOC52T1l0OTdLzh10Tki89I55U8IIviqVBYRrmMc5izIJ4Y/1VKNqDT/1fBgSe+jb
         KN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
        fh=BQ4iLW9E/CHalhItM2vZUCIIi2GbV6ghQJsl/FnWIEk=;
        b=OJN+WSqpEwVjFLdfjZ6Y83X6nW4A3CiyQYKCTLncbWqZRXzoktc611RlPIKpufjAIJ
         44ZC4G7fWjNZGeb0r+kCVnoiJJwiIKT5GUQfDLUTA9Lc3ztLSUvftX9IDRInRq1QMgb9
         k93v1gYh8PCCM8cNaMfCAOmEga/WYjW52oxoXGUvb5FtS3iD2Q/mWDZzadj+ET7glZFg
         lFmsgdFWQVmD3gkPgE5mI7BhgjtceX1LMxO3VfHA/krhcz4Cysu7KvgjivWATDgKNtQh
         gNprXXR6vIxitZABIwJoVb8rc07cAGY5IFnA2wx1W42zODsLhuaQve2h0ncR2tpqEtwB
         qrwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785741761; x=1786346561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
        b=RtXkvoJL0DeE5PV5je0JNzfJDfOA9W8nPRnPTBW5ZZKqkWRNB/qu/TN5lcPLpDtSB+
         +z3P/MB7YzoFfD/+97h5uCeroQ2rSfZs9LwnlKkcpUE4/JRmppCPXv51pWaJVwI3PEqG
         GujbFlNtSXSvX2ryz9x2PPAmnLinh6YFzD9FZ1bZ/4Do/Abmal4TCYrO4NZ+aN7W7Pg5
         ozJ460cJkeB+rYqc7lOlri6KfJmDNk1kR1AUpLSf9DRIRKXapqzAaprNm99Ns2txetmn
         eAxrzHAS0DBDJVGcpsnrkEAAneJ+oXtgXDf/OhDvQ5SnGRZtfDPdF3npz3diHOBl/x7R
         T43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785741761; x=1786346561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
        b=CQyt9geFYxh6CXc1V57gdpsNUjmdYv96SFSKyyxrsRxNZPOB1wW2Ct2FKPprlP+tti
         5/LKFbQluegvULFAUGipztn73DbUvtGpAZjW9jsGHGILegHo+sKIuFMim2I+zGfPOE1X
         +H28wxXgWXtTZIOnvxO7KE91SPFA7FgJMGW4Sk3e4zz+liE/8InI75ixAwQ3LxTMVpuA
         aeoaryaQb17Wmkfb5FR0lw3dNbVygXfS6XwVvJLA+2Q+fya52/WgSGButMNeW0F7SJ08
         1vZjjcRrPWaYcl/rxzNcSfgoP5s6QYs7JA9T5KAbHFzLuhQedq5wb9ddGzBfekXu/yFp
         zYSA==
X-Forwarded-Encrypted: i=1; AHgh+Rpb3bHE8uk7YciH1p7/ek1ojujX0q7wFrCtOP7+6fK41io03WJArTcobEOGqwaO/Rm2HBS0/VR6HsCD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm3jk+NR3QwNGvi1qXbRdDhGpWV6XHTClBIwJcwuE+fCtg/dUi
	mb0Kn7CMyRR19DGF0dTCQl+rdJTtBfa30H3bvyMW+ciL/6QUQhMsaNb/Pgh4bSuOAib/g6zONpd
	C5/muq7WA6/S5l7eRqfydWVmTSO7m7zg=
X-Gm-Gg: AR+sD120HY255uAsBcjh2UPwpthNVjMZFIXGpCBoqnPDNEUr3iBc6VXcMIqFzjxPz4v
	lv56P6VjVNf3KflwzFa7zHF2s4o/932DLOUO7U48WvnME4exWGtiMgRL3ET6lG9xSpSxQMXPi6g
	c1yrLsdFhkWNWQaY4RxWsREThQ9QzLc9IVB1U3K/QscRQEGzwoXJSk3xGhsriFjABPSI6CjaTUN
	wUQRBU/74EgsXu/KtmpCGGxBQyJheXsl22oR9yq3e2suxMS9RDGTPxwoIjVwtVK/gVUzGtpnbVh
	OrBMhJJ6MwdqMNyWAbH2lyN6f1r5Q3J0/1inskovJ35vZdEjIVoaH443M+DlXzlafX21iKKACbz
	WtBnoi5el2Mb4vV3I/7zZWEeG8soxZEe7StYpK0hV0h1TZTlMYbRssrgwrlefYlT8BsctATO5ZY
	hyyaEaHRK/XJ98eE7RRGlFnPfeysposO/PMDrc
X-Received: by 2002:a05:6102:441a:b0:738:1ef6:51b9 with SMTP id
 ada2fe7eead31-75b22260dffmr6459811137.5.1785741760783; Mon, 03 Aug 2026
 00:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-21-0a53cd9e21cc@gmail.com> <c3171c59-bc83-4be5-beb4-e93bfb4d05a2@kernel.org>
In-Reply-To: <c3171c59-bc83-4be5-beb4-e93bfb4d05a2@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 01:22:29 -0600
X-Gm-Features: AUfX_my5qRz2h8yblU9_NUKeJ1t5ekFC9VrjQ-ysDEg0WGg4G6m5XNTvE_CWbqw
Message-ID: <CADvTj4qg8Yjwr=6KVO_J+r+tEC=6TDrU3o_8YG7vuEdDA0ZpTQ@mail.gmail.com>
Subject: Re: [PATCH 21/21] arm64: defconfig: enable X-Powers ACx00 Ethernet support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 1:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 07:14, James Hilliard wrote:
> > Build the H616 PWM clock provider, AC200 MFD, both variant-specific
>
> Use full names. Is it Samsung H616 PWM clock controller?

It's the Allwinner H616 PWM.

>
> > EPHY control drivers and the shared link-PHY driver as modules. Enable =
the
> > netdev LED trigger as a module so DT-described PHY LEDs can use hardwar=
e
> > offload.
>
> Why? IOW, which upstream board needs all of these?

The Orange Pi Zero 2W for example would use this along with
any other boards using this copackaged x-powers ephy.

>
>
> Best regards,
> Krzysztof
