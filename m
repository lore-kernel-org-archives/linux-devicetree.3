Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F753E63A4
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145780; cv=pass; b=XlY28KY+hogI4aoGfGkOpx/xMgAYH/fi5jE0IsqO584OpOO0/+xU0MAtympkiXX/bh+55cwl+23tXFrQuIu1aKOdspNJlZzCl0ReAWniBqcWnZHjDJt5CJgrcbUSOrEFBuayqEB6JUBjeWd43jPBAtkXLY1aIGftbO8SZxHgF90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145780; c=relaxed/simple;
	bh=GKFsuGoZcqShw3OE8shIa53+GGNk+cX4y4tCIcfTGe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwoE16NfaxyF9JDEA0BWDhzWt1e1TQ44Ap0g3unjWgP5X1PnzA1y/oVhJGotK2evGDKujE6U2Ss285JCfPbFQzact54AAkGZHgRyGf0glGSa6FYg5NMNxOx4ERULHTlNrXeXeRQMrP38ZbCJwtclU8f/w4aZIEEtYDNmWdzFvr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JLiTrrBg; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JLiTrrBg"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-80814edb536so30568677b3.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:49:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785145762; cv=none;
        d=google.com; s=arc-20260327;
        b=IMIeYR2uIkr2FAzgVkmBdB1Z80QJXhVVxZK3pOlbO16S0ZuuIMuEyOWAxCfl5yZugu
         CCVGVpur07kJwdMcZElirjdFXHIK302SxwlTnj0wrG9OZBhsDGzq6YDGRy08ZLR1XEnZ
         2ua2SnYwHJvSqcxcra8mqrqcIVQS1S562Kb0s/FWtHn59T2LcP33sMgSK47iKjmZpOEb
         eoseyGKehCQ65DQKWJWnQ8w1euB7OoFeCEYimXAlSEntMetlh25oR9sfNRc9fLgdvslZ
         HujtdwTCP6n0CZmP5A+1bWz9fnO7pPPTLuefwq0PFrJPsM2IIAvRyYd6ZvSg1Y7oi4C5
         95Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A9e/RTvQgyA1BXOguUTfpzmBu5ZmU5vPNlQN+p2nyUQ=;
        fh=YyyaiDfwP/e+NK4uFpC/cdBd8H4ZKwQC1/yYChkcsno=;
        b=hTfgiPMi2BAm0i8E7AeQNJWLgQXoxRv5+WK/zxeP8Godu9+GYjyjtHUCEjd8ukadJQ
         tpIfAhFzYaZjbGr3nWj7DYjsCOKsmyI6e57wDB71rgqTqXw+r/CZtfg2ylUqJHJrZsEG
         ZplSw4j8aY/Ab5jd3wJDQUB6qTQRo5KYoNKiIcxpeFrNkhvw3V5EHstf21+cuNaXm2x+
         Af954M6V4JCsmsjMffrK4BPnf+o4RxPV6emuMkRdrzlcL4c22MIwOQCxxlsi9d4Qr1Q4
         qfX8dd6eOgq0cTbZIT03UEQTn9/0S1y8D8Is5YZ8VVy3kM+LIrrD9wikd1voxXT4giXV
         0HHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785145762; x=1785750562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A9e/RTvQgyA1BXOguUTfpzmBu5ZmU5vPNlQN+p2nyUQ=;
        b=JLiTrrBgY0a5SOuZcoqbuTHq774K7T+Td1+WCDdCjcShSAi8IVh84vceTxWgafhaHi
         ub5gOj2kvVu2psLs0xiOanYS7vU+rH9Zei7i3yzKOIIWYhD5gR5btpqPIB/iS0pekEON
         Biskfu/32RFjOLYnztqaAZFl5gxQaI2Kw6Tpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145762; x=1785750562;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9e/RTvQgyA1BXOguUTfpzmBu5ZmU5vPNlQN+p2nyUQ=;
        b=IZ3huR0UPWAYB241D+/bWhYtfVJFO1dmnGfCbIKl2ilXLpBEPMgUt008he0POJ2qId
         UW7/ys6DZRpzy9K+VpRSwFqDjvitS3yBAvShguKmtskwp0olziCCqqT1ksIuVuKTEs0t
         gUYBOUblUSOQplYGfUqZZr0GiUiP1awh+ij3O3uGxyOER4INQHopeb6DKDpXBx/0DvLb
         bOTS2UBS2XWM1dVr6hZntL7EMUKCDJDtbTgpLThwqTb/gs8olv74p1v0SUFRocjbz02s
         XXtnydEYh1JT37u8rAkz5x1iyiG6eJ+bs5DIQC7yMWmFQkOJgPfURk7ufNLqdbYTm3CR
         GRTg==
X-Forwarded-Encrypted: i=1; AHgh+RpbgqkRxoFoFBGNL7CqBHUfkTgJ60JI/AU5dXCGzUR9EZoND7F5Z+tyd49K23brc9KDPb0iLV2aowFo@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ4ahpCz0m1N6fNYmzFvCL650PWo3B4mEVE4nc6OO8Dx8sDZ/Z
	7n1FyWDv7A1ZDG1lFZO3AKRVFyKqhcbXhvMbTj/VWS83y7aKXJEIaEWH618KzlnjlzAzNLu6J6x
	KgsuevFFRei8eF9f+nK7Ml2g68jfpFdI/II37VqA3G9x7lJTwQ3L2zKYh
X-Gm-Gg: AR+sD10m3xws7vcQ+sO6tCoBzUoLZRIRtv2rGSrLRd/Btbd5buDT2k42klqS+7Rq8up
	2NTaQ+srVErZZUG20SJxgid7bLdIyD7SI/aCdw+UOwqBIdgFSA9px+ecQq0q2fjFhDHPGopqkSj
	hTLML4mWfaefZFl9nvp+FEaXCwzlbHHUko495qmHq7OucXmTqVlzGeHq7a0hYzmWh9z12Z9eAE0
	XvsXwSHLXpcculzcUQps8AV8+lkMdLhfyW7smGLNAVxNEsq7hvUQ5jFxhRK7eIJQlwQ58DP4v8h
	bOH4Z8JapzlGtiA=
X-Received: by 2002:a05:690c:3744:b0:80c:85c6:8982 with SMTP id
 00721157ae682-81f69e5c41fmr26771557b3.65.1785145762611; Mon, 27 Jul 2026
 02:49:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
 <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com>
In-Reply-To: <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 Jul 2026 17:49:10 +0800
X-Gm-Features: AUfX_mymWG_ASKh7iZ4RJYyJ6_dUoLJGXydzUsgaPikOadmqrflcGR-sfKa6ifw
Message-ID: <CAGXv+5EM5P-cY2VW9MXc_iSjwq=QY1-OaV-s6W8wD8YTUvFN0g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: alias all enabled serial ports
To: Carlo Caione <ccaione@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 3:40=E2=80=AFPM Carlo Caione <ccaione@baylibre.com>=
 wrote:
>
> On most MediaTek boards only serial0 is aliased, so the remaining
> enabled uarts get first-free ttyS line numbers from the 8250 core in
> probe order. When the console uart defers on its clocks another uart can
> win line 0: console=3DttyS0 then ends up on the wrong port and the boot
> looks like a hang on the serial console, depending on probe order.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 1 +
>  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts              | 1 +
>  arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 2 ++
>  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts              | 2 ++

>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 1 +
>  arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts | 4 ++++

These are the only two MediaTek-based Chromebook designs that use
Bluetooth over UART and have a second UART enabled.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # kukui & asurada-hayato
