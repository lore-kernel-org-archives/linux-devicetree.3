Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BB93C2D
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264466; cv=pass; b=uBcNrOuqVUWo6S0oDdcFcYPd/ysYW2Zjn2jssZ99/jnktK9c66918bZCSouYHwPNRjN4c1obLd3UU+0iadV+TD8ViMlntYUWpOxvwroR1Y0V2paTSRCivdwXVYYFgdYrAQ52FRzbERC1xJQNzpBfruGOzUa9Y6BPPuFdlumXOk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264466; c=relaxed/simple;
	bh=YsJoLrLCtXBI6DtmBAjdk5zdQPkh2dEYsn5jbiErAYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QQHglyUBNVR+r8bMQnLmkH+5GGfbAwuEsnivw7skchsuUYmamQAquFVCkG3dDCYilSJ1yA0D4x6rvDMQNUx2L0Lv009r1avX/ltuCVv3/d8AYtkj3edh/TemovU7hH8P8PH5S1WuHrtSnnnRTSYCHXQs2lFH2+siYWRIFiU2tyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bn82Ql8b; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bn82Ql8b"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a283c44478so2713635e87.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 04:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774264462; cv=none;
        d=google.com; s=arc-20240605;
        b=dAb3nhRnb5LEQphmX7vxd5pCt6x29PKFk6gmVmG9DQSg1OFgkts3CE8xQbsk5rKm0g
         cm8hM9h2ztTYY8y3rsXWYa0niCzmY0pja84wPVx47GKvQobA39fcuEihONUI7XGsZncI
         EtpYuiPZlGWAjVdzkHUojLqxwtZmaNW4CYCdC0Y/ZytNjxZXZcwgUYZH+ZmVfVny5kIj
         et22xUZbWT9MPRKR5KFcM3AeoU35CQK5n0LDYWSalgEb+RSsXN8REJ0zb2WWQha5PAsg
         PtEA89i7zp2LWlUuwKGopQsZc9pjwwLTLlHUgywQM4IgZK4X/c1UFI3CYdzo8m/Tdk37
         HSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+IJUWFVuRtnRrcxOAe+qH0nHesEXlr9bnFCdCu3nBCU=;
        fh=NYrNsgt5xFrMgaZ6Ex/y5+VU4OUYfrnxEUwjd7HKMlE=;
        b=fj6JA23iynQGqqAaKB7CGxmYURAjAKOb5tFul6vwLv17leqm1NZHbsxlM7waVG2+Cn
         id/+ThkrmRn/NyHL5mNmiqxR07AIhaa8VcAiNrRLtj9PGeUih6JzsmYiFsRoPUdb0SmD
         458NEBg3TwY1zIJYxeQKUJ3wCl6qfShDz5XVZCHB1NwQEg8mv52J0kCcqDIr8qMDAs2A
         ohhbJ8SN3utccRxaTS4JRwplLStn0ai62s7ff7f9McHMTBbDXbd/8s9frkaOiX+bsvvV
         rV/LwKUeFI5w6jfyVgWLtTFzKvLFzxPKyT3BEgvquGuRRmuNq6YfFhv4jVWd/bP/jfXJ
         fhSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774264462; x=1774869262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IJUWFVuRtnRrcxOAe+qH0nHesEXlr9bnFCdCu3nBCU=;
        b=Bn82Ql8bEbzB7ovYrS2cyKJ7rqnYq5cuNEGH8ulsVoNTcEZ3cTXKEoNT2IH9h6RTF0
         7jZGxZSi1sN30QazDNR5Y9JpYA01kKZhXFxN26S2LOJv4xR4z6oTxQVs4qFTqgizm71O
         UBoj7hDw2QnR2iKLbKF7xec1NC/Olc2cCY4m+dLf+7cPHr7KLwU3zGdRL06RydJmTYUW
         CVTXAMMna7cDto7DWo0QrTV6Qki/b0DvMVVlTmFbVBAspDh+b0CmzQMy1O8DDxRn8Iao
         GL54wek7J00SOpMExdOYoAz1/jm0/R2EpodH3WLal9z9sECTSFWbAC1+ppymJuyIdz99
         6yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774264462; x=1774869262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+IJUWFVuRtnRrcxOAe+qH0nHesEXlr9bnFCdCu3nBCU=;
        b=a7BlOQx+3qu68nmdbmFostsixnrPQd1J91Z8/sfz08OJZm9EtfPlnz0tPKbA8OI6iX
         uO7Pqveho1A96mP0jYi1hDv/7qWrjBCCRKu9tq6ZSTIfexlYRPQjgV3yzXtznEWZbhgI
         v4yK6Wfz2xBzD1EC9LRPeYmbaqvclRTPTPRvRDq8J72aRyBrnRci8LzeBdzr6eZzywJh
         GAvaeHHnThy/a94WweDGX8iB6Tb2a7/5v3yn9jnlNhK8HujefxOyPaIuiO6ZGT7xob/Y
         jayved9zRdrT0GGbZ49HTPR86JgBopKI/gIa+UAavfepjN230wQ021AYu3SGlQk7CgUZ
         vQCg==
X-Forwarded-Encrypted: i=1; AJvYcCWFkUSK3QhJb1qQy+oTuIVuLHURVMWf4hO1Wgdn4jqnmwut/tCZf5qbMsnv3bLjvONrvKfE4hUOKAx7@vger.kernel.org
X-Gm-Message-State: AOJu0YzuYghsQQ8w8htjGKXqbyVTDzIBx921I9i22/X0+0DqnKdMI7v5
	nHFJTNrffeSLe3M7FJws2MmpfkFtacOloFQbEerh+TIbTzYdYMx7k2YJj1VfS4NuM2uP71zo4N/
	qmujE/RfM5qlU3vR7hm+o+IGraczx6usnZKI4Qkaa2A==
X-Gm-Gg: ATEYQzzDg+IoyBwNh0TmHMraoihyZ2FcFmDMQYW9RPYmft6OxgAETPhmGg9AlieJBhG
	bfyBk5c6LKrWf+LcHKSp2I7ukJmWjmrwb3YwkRPaXaEc1qFBfDjOn2SDw2dXWRN4Db4auBna2GE
	2W535yc96afo5CcIvzGre9I2pmlwR/brpZKj+Z7X3xze2XzCYEgyNLbuyQFB2nL0V1dNj4C9Lj9
	ZlqP34APHhsmMgCiisgxx0qNtkyGiL8wC3RO41NakLi6MQmwBcBN0+Vh04dBn89KgVfbyQPKVTS
	v4HLk7u3
X-Received: by 2002:a05:6512:10cf:b0:5a1:2b2b:479d with SMTP id
 2adb3069b0e04-5a285b6125fmr4577456e87.31.1774264462090; Mon, 23 Mar 2026
 04:14:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org> <177409907930.268981.5882592990447577348.b4-ty@b4>
In-Reply-To: <177409907930.268981.5882592990447577348.b4-ty@b4>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Mar 2026 12:13:46 +0100
X-Gm-Features: AQROBzDb0FyhDsEJ4InmRtciuv9Wo1DbFap7YBMqRE1Hh3qfHVm60c1Z9Vi7vPA
Message-ID: <CAPDyKFoz-sm0pfvn5iSYFY0mrW38vaGRZsFvrVPqsv7BsYxeWQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v8 00/10] pmdomain: samsung: add support for
 Google GS101
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Juan Yescas <jyescas@google.com>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sat, 21 Mar 2026 at 14:18, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
>
> On Wed, 18 Mar 2026 15:27:45 +0000, Andr=C3=A9 Draszik wrote:
> > This series adds support for the power domains on Google GS101.
> >
> > There are a few differences compared to SoCs already supported by this
> > driver:
> > * register access does not work via plain ioremap() / readl() /
> >   writel().
> >   Instead, the regmap created by the PMU driver must be used (which
> >   uses Arm SMCC calls under the hood).
> > * DTZPC: a call needs to be made before and after power domain off/on,
> >   to inform the EL3 firmware of the request.
> > * power domains can and are fed by a regulator rail and therefore
> >   regulator control needed be implemented.
> >
> > [...]
>
> Applied, thanks!
>
> [01/10] dt-bindings: soc: google: add google,gs101-dtzpc
>         https://git.kernel.org/krzk/linux/c/10084aeadadfab72648f6ed1cc78f=
7cd87b861ba
> [03/10] dt-bindings: soc: samsung: exynos-pmu: move gs101-pmu into separa=
te binding
>         https://git.kernel.org/krzk/linux/c/3ec3c42b426fe5e2b48ff19c551de=
c50bc78788c
> [04/10] dt-bindings: soc: google: gs101-pmu: allow power domains as child=
ren
>         https://git.kernel.org/krzk/linux/c/c8229a5160eea145b796f54317d6e=
659cec9b080
>
> Best regards,

Usually I pick up the power-domain related changes for the DT bindings
and host them via an immutable branch called "dt". If needed, SOC
maintainers can pull it to apply/test the corresponding DTS changes.

That said, I am open to whatever you think is best here. Perhaps it's
easier if you can drop the DT patches and provide your acks instead or
if you can share them via an immutable branch for me to pull?

Kind regards
Uffe






> --
> Krzysztof Kozlowski <krzk@kernel.org>
>
