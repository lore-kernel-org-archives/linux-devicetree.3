Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D2F3C3BE6
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868139; cv=none; b=YgtUp9SZDkU8HiI+PzYVMkA6Cv1rEY1DhQVmkkTi9HATLQkpUmKjhjtafHuYyZrcEI7dJNVzIEuOWdEHEts1jA+KmfcBWK60SCUaQ4cNCW0P1pLgRitD8uidSPvUUqZ3xYMYElN5L12fDysQpYaQoRHrOq8ZciBxpFpZNXTEWxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868139; c=relaxed/simple;
	bh=IxVCxS3KsrL7X9+TLUafohMnmgl8E7kaA4sFH55EiJk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pR7UdXyCjhSD26l1hpqZPTVkgRQZutZgciE5DrW0v1Sn1cri/5hTZ+Ogg0q8tUpWGIQsZ8b3nDCk4Yz3YamYXSdE9eM2hk0YLIoUs46V0s/N3aIMMPhmQZNAjeqlfzYd2DimIDZH33oS7oV7fH3ii8xWSMvsFqsrOWZ9H629mMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lX4PfEcQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lX4PfEcQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso42823035e9.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774868135; x=1775472935; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IxVCxS3KsrL7X9+TLUafohMnmgl8E7kaA4sFH55EiJk=;
        b=lX4PfEcQ+SUBKWkBRDMsTlfA0M0wFgK9o7iMLad0kQhaXlWLKmgwBsYQM3+Dx5uflq
         YQpGZySYF1mi7WA2CcDp/3ZRmCgjPFIBS6/7rVKadePQszyr53vRjQ0s3wv9gMrv6jMl
         //vMbEZk+WlGwgaXQxxICdaJgIXjIzQLL1n57WxXy+oHfqZemnlcRqSG2xLWf0BOyzbB
         vPVKD48oI0Zq/9pkQiV/ewez48+7R4YidV28uQNTfHfmMWAbfWeHefChfCRUSftgSBR8
         D+g94L9JCCxshU96wSqeguMLA4ipw/rBgS1pZROCNSycbgN+sJZZAiEFv5YKD7UGHOa4
         GvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868135; x=1775472935;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxVCxS3KsrL7X9+TLUafohMnmgl8E7kaA4sFH55EiJk=;
        b=Q59BHEpOpOcMIlNcQGbhPwXhlP4+cYz2x8UZm8N9QbWqaeV6Jl/vx2gSe8fHsyOAGw
         3743TVQybppIOG4Hlz6zTGsJBHr/6URufjcIE/0y6sLZuQk7gxZc2OzRIMDSElz1F0pV
         YwmTqQevuC0EbsftFubHwNuzWjDu5uLefOOTN7wOwTLQJV9SkTZyy9DxdYaSSZ9NSEjW
         oD15QIddbRN3z2IarQsWZ7++jkIpTQAPF9O5kDiLpgBOlAB1i/T4WSRwfzIaC7j44p/H
         1FeGxuUgWMXt0yJXsuHHEMWHxicCH8/TaXQMolRSIgPvujHamoplnFwL6Pcpms1IxRBM
         UG0g==
X-Forwarded-Encrypted: i=1; AJvYcCXBmhuQuSdXjKqh/MPMViNLDSvGR+7gmxJlBuZAgCyBQtmejdjAIbLk6Fc134TfKtKWj8T/Ap8mpU7N@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/vnV0BUNBdX4Cfl3p7z+fWuisc1hT0xHSoHEZ7p727Vg/NcmV
	VwWsBquRftgp1D4C7fjdKiMOUoFD6lDDlgEvyQRgQ1e9eUYW1AEU9xfe1z9IC35FwxM=
X-Gm-Gg: ATEYQzysTOQlthn3OrbpOrvgt9VJg2s4DK6gnaueQBYy87bAQROSV7IwrZzk3uxlulR
	ONsEjP+DCwJdYMEhphSIE8VvGPi6OAMno9Z6N85QXwNKjuGF/7YIdp87WOOD7oi0tK7CNEFVMLB
	eyDEjtajbXGyM+P4HGZtp7Bm8uFpOd6T7hVAg7zVlwpETckviVvTZSC/S5wZN3eyw2Y4F2XJ9YK
	eWK7PboaJ25tP05mT0CVRmJx02fEGGBb1ZyQc7rjnUY/MgB9RcfYI4PuSsGqXqqxFEn5wlpa7CJ
	seTx/VAfZoBliti1I2l4TBZcQp3xgCML9ORHwmbvg9b0kIPPb38SzH9h98FFmjHSkLRspvcbj9d
	6D4ZiNgS+gS6w7A2MU/Gn5fGuP98GjJcRi7XOx5/qH1EJFWcNtj6SDM2ZiWEh+0IlpgKXmEsv7w
	AtXbHmChfO/CIDJ5dmu6roq6EpyOxR
X-Received: by 2002:a05:600c:4e08:b0:487:1fb4:7b3 with SMTP id 5b1f17b1804b1-48727ef0cc2mr216860995e9.23.1774868135275;
        Mon, 30 Mar 2026 03:55:35 -0700 (PDT)
Received: from draszik.lan ([212.129.78.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48730629033sm164969365e9.6.2026.03.30.03.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:55:34 -0700 (PDT)
Message-ID: <9f9d400b84512be41d47099d916338be5662061e.camel@linaro.org>
Subject: Re: [PATCH v8 07/10] pmdomain: samsung: add support for
 google,gs101-pd
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus	 <tudor.ambarus@linaro.org>, Juan
 Yescas <jyescas@google.com>, Will McVicker	 <willmcvicker@google.com>,
 kernel-team@android.com, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-pm@vger.kernel.org, Marek Szyprowski
 <m.szyprowski@samsung.com>
Date: Mon, 30 Mar 2026 11:55:30 +0100
In-Reply-To: <177409897341.266364.10743294916208405425.b4-review@b4>
References: <20260318-gs101-pd-v8-0-241523460b10@linaro.org>
	 <20260318-gs101-pd-v8-7-241523460b10@linaro.org>
	 <177409897341.266364.10743294916208405425.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-03-21 at 14:16 +0100, Krzysztof Kozlowski wrote:
> On Wed, 18 Mar 2026 15:27:52 +0000, Andr=C3=A9 Draszik <andre.draszik@lin=
aro.org> wrote:
> > On Google gs101, direct mmio register access to the PMU registers
> > doesn't work and access must happen via a regmap created by the PMU
> > driver instead.
> >=20
> > Add a flag to the device match data to denote this case, and obtain
> > the regmap using the parent node in DT if true, while keeping to use
> > the traditional direct mmio regmap otherwise.
> >=20
> > Additionally, the status is just one bit on gs101.
> >=20
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> There are few reviews from Sashiko which seem legitimate. Please check
> them. If they are false positives, just reply that you carefully went
> through them.

Thanks for pointing out Sashiko, seems like a useful tool! I'll go
through it.

A.
