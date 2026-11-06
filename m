Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934405;
	b=aNDGuAQW5jF7w+ayFHtnWRaCnQXE3/8yuejBmbn86Q9rwrNOcmTCjmnqMULFEKIX/QBR
	 L4IW+Llh8v4iw5zlgCLu6SoxJbTkmEasQd5l076tfBClRTZa3MhePgyuB6h4/7lwcSeNl
	 3gbP/CTGlK/B/sgmHgtRWVPaGBqXvJe56iEhYCkPhFqAjH7XJrNnF0Dn6IG37d/rzEq9Y
	 IJXZn+ifBhRK6hlWwm6XBuTwN1+RsWIbp1LsgQluGFlu9/HtttSpFA2LmyTwe9BIZTGrc
	 zo/E173avwVZIUgmziNw9uJHVRHZohmvUeBbXjbsBBMWeb4fsL4PYPlPMGqevz9QMuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934405;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=InNgl3TtcjJHMVvDRtFJfM97UJ6hHy2nObXAWQhTsAw=;
	b=VOvw+VQb9DB/jppR4HuM4tSdVTpORmoFZtqvb59yEH4WBJ2De13aBpCAXZ/nfzBFsEw6
	 WsNZaHzzaVIOtw3rwJvJ4Y/kG2VbOlgqeALHfADguKBzFtsxGbh+jHZMxalotMJgxrR/b
	 zvf5jj+lOc8G8CDIa9jF0RUlpkNKHijXD/ADlxh8zsKgjtZqCMWz8iqf9pVgobTG2atkB
	 2ZiAB9dSCfumxQyDSyhjorHFQNVxDixKjSEXg4WWFQtlRXeM3vsA8g8Z26xFGT8e+LtaQ
	 dILTOJMtTx9ILH9xAmrxHmhPwxv7Y9kMQo7/pZDiGOFbHv3rUEeYDxpN7+bQgpxblcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73B2606A32E
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E73B2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be416e603cso142877e87.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 19:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934403; x=1794539203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InNgl3TtcjJHMVvDRtFJfM97UJ6hHy2nObXAWQhTsAw=;
        b=KVwnGnIA1MehKXrWgm5OaGB27vMlWKNyONL1GoBnDKhCuq4kg0wnfIMtvQ9tVW9uby
         yDqgTfj5tctq1QA6B/BW1858h4/X0gM9to4dM5k2Crpd4WJpeXb7DlVkEf41YJOuhMXX
         rN4C6IbvKRePOQ1m5Q+Ui78i0YRkEv6o5R1eFQ7Hu97foHk8eF4kYS2JP+Uhz2D2+Ijo
         z675ktlhiq6IQK5dRYSn1eOeZ8hwK2B6EbEqZZgqEzFoNII4Y+JcB7TijxBy5UTX0yhV
         BVyYHoRXMLRndhQhvjevToH+hz6RcNz+aY5TD7KF+7UKwrCZRTlpeO+dCJoSydQCskTE
         BzbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPRC+qY4Vk85X5ivmM7JQ4zMEjDVpcAvXfNLgnZIsfSUKF4tGM6pYrvgRtivVqJLUyHlXHLE2Qga0Y@vger.kernel.org
X-Gm-Message-State: APuU4Z+MeNe5Vns8UejxFmIvCkA5vBYncgX4iv8cLk4PEnj4ERAIgSM2
	KiWq/tjOqKXsa7PPQT4fIdgvSmi62lQfPmWVkcHj5TrOiDPxZtxXjzfKFmd/m7CDo6vHyA==
X-Gm-Gg: AYBFou0CZqGTt2PMvB6Q3QG+2IFu82Dwih68pGb30JiDnVkCJaRgwqOdz/suJllLHFg
	CeTpsouHpXw8t0aSJaoBd+ZtJ7OXqnUgNwfeAnG41R/+HYxFM9x7z2CBplArxYPuW3gCWKedCGd
	YQfDd5+9eTm+2Y1sif0FVaAY+ZQ1meA4rWU/30csTiEHeZ8/2Ai1zASTPOCAAcmr6n63LIA+/sQ
	YgugHR0cFpOhJG1rte27mGUSWyJnA+CIEj6NzKAQZzElPwAhplaE12lvm5Ozz/kaYNeHd65Imsa
	J0YwDla5Xzn8I563ewqWF6XvMY50VTeeqYeAyrizBux1pd6cnp8oqY4Bb9RPqVapX046BosSqTo
	6OIgLBtQzJD7mQ06l2+mFsYqCrtdW6y5snNjrrAw+4pxqaLpX61I47nv2e14Gax8xq0HjVAq8Ep
	P5hovUyKk4sQjAgiX9l03XgriQj/Qm8wPRkKdFxjT/H1umQ7VnHFJemLYoIn62GJr0w+qidYyRy
	5nKGvS74POtGzoNLJOa5Q8KQtCIK0hINbulyj2WYU/Zpl8et8ExQZf7uU79D7qczVElMziFhZQh
	GNWcX1jx3YOK8vkwuPArwT/97kupuKvSoNKoO6p79JSfaeE/MrCsnQpfOweutdGLhr0=
X-Received: by 2002:a05:6512:2313:b0:5bf:b144:fcbb with SMTP id 2adb3069b0e04-5c003a87d27mr296328e87.28.1793934403046;
        Thu, 05 Nov 2026 19:06:43 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c0030a04a6sm138680e87.77.2026.11.05.19.06.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 19:06:42 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be416e603cso142863e87.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 19:06:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwjPk42wsmgeYKAIIXihYF2wZfLQwnZhSyEs0+T1BKuMuoBhY5L6OgI5/eypeEyKDO06CPx1mOUFXRe@vger.kernel.org
X-Received: by 2002:ac2:5692:0:b0:5bf:cabe:23dd with SMTP id
 2adb3069b0e04-5c003a87d1amr290258e87.27.1793934401749; Thu, 05 Nov 2026
 19:06:41 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
 <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org> <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
In-Reply-To: <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
From: Andrew Gigena <mail@andrewgigena.dev>
Date: Fri, 6 Nov 2026 00:06:14 -0300
X-Gmail-Original-Message-ID: <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
X-Gm-Features: AclHuK-k_LlKDqZXI1tBCGgD-G1XeUrAUABAuETiZnNnNKc4iM6mV-xfAtboOL8
Message-ID: <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150 CAMSS
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, mail@andrewgigena.dev, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vladimir, Bryan,

Thank you both for the review and for taking the time to explain the
direction.

Vladimir: I understand your point about the stand-alone CSI2 PHY model,
and I agree that is where CAMSS should go. I hope this series does not
give the impression of entrenching the legacy description; that is not
my intention. My concern is that I don't think I can do the PHY-API
conversion properly within this series: as far as I can see,
qcom-mipi-csi2 currently only carries the x1e80100/glymur
configuration and no upstream DTS uses the PHY-API path yet to take as
a reference point.
Converting SM8150 would also affect the other CAMSS SoCs that
still use the legacy description, so it looks like a separate and
larger piece of work.

If I'm missing something, or if there is an existing branch or series I
should base that work on, I would be grateful for a pointer. I would
also be glad to help with the conversion as a follow-up if that is the
preferred path.

Bryan: as the CAMSS maintainer, could you let me know what you would
like me to do for this series? I am happy to keep the legacy CSIPHY
description for now and follow up with the PHY-API conversion, or to
fold it into this series if you think that is the right thing. I will
follow your guidance.

This is my first submission, so I appreciate the patience.

In the meantime, I will send v2 with the review fixes so the series
does not stall.

Thanks,
Andrew

El jue, 5 nov 2026 a la(s) 6:47=E2=80=AFa.m., Bryan O'Donoghue
(bryan.odonoghue@linaro.org) escribi=C3=B3:
>
> On 04/11/2026 23:16, Vladimir Zapolskiy wrote:
> >> +maintainers:
> >> +  - Andrew Gigena <mail@andrewgigena.dev>
> >> +
> >> +description: |
> >> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms=
.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: qcom,sm8150-camss
> >> +
> >> +  clocks:
> >> +    minItems: 42
> >> +    maxItems: 42
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: camnoc_axi
> >> +      - const: camnoc_axi_src
> >> +      - const: cpas_ahb
> >> +      - const: cphy_rx_src
> >> +      - const: csiphy0
> >> +      - const: csiphy0_timer
> >> +      - const: csiphy0_timer_src
> >> +      - const: csiphy1
> >> +      - const: csiphy1_timer
> >> +      - const: csiphy1_timer_src
> >> +      - const: csiphy2
> >> +      - const: csiphy2_timer
> >> +      - const: csiphy2_timer_src
> >> +      - const: csiphy3
> >> +      - const: csiphy3_timer
> >> +      - const: csiphy3_timer_src
> >
> > Please switch to the new model of describing and exploiting
> > the stand-alone CSI2 PHY devices.
> >
> > Any CAMSS drivers based on the legacy description of CSIPHYs
> > should not be accepted into the upstream.
>
> I mean we are just adding a new define for a SoC here - not a new init
> sequence.
>
> We could move all of sc8280xp, sm8150 and sm8250 to a new driver
> topology but, I don't think that's a reasonable ask for a small change
> like this from a new contributor.
>
> Certainly would welcome the transition given above as a defined and neat
> series but, I don't think there's a need for that to include this SoC in
> 100% existing infrastructure.
>
> ---
> bod
>
