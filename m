Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC9C2EA47C
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 19:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710122; cv=none; b=pcHJ4cwFKtAm4o6ud3ohWNgUTeS8T4L8cbyR75Fsb6nr5W94PC+AXq2N1rTdjDNg9SLi088u25KlzBlkm2TYSfGQuTKkvJ8MhRTaIikjJnZvrE9vWPviaUxEtP3hYV9mX4y4DeuifAh9dCxqJqC1AngGmG8HTzpg/A+RMSanJeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710122; c=relaxed/simple;
	bh=GpEWBJuL/pS/j20ZxUcWSfSSNFaAt1ppfLoyiD655kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O1kcF545beEW8L5+ZyaH1kBy1FL23MiHKaby8iU6TGJnorAoYDaRULU50wbpRRfDywMp75ChkqKIRb+OBZFtabdYhoTqX4JmpnrTppCJL0Wf3mWItsO3ygB1suC/uQCuPT4AzSm+w/WHqvX6hH65Fml0q3Nlhz3Pk+7MatSSums=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObgHAime; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObgHAime"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E5F1F00ACF
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 19:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783710121;
	bh=GpEWBJuL/pS/j20ZxUcWSfSSNFaAt1ppfLoyiD655kg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ObgHAimecvvh6gPj1DY4ZUJrBRD46dp6Dg5Nr89XMGRzQUiTn0vW4n1JHtXktq6OW
	 OxGhhGc6F9Atarck6If/pxpqWowc1esa9DAvQkfEHHpF5DWTnZ8W9/E7+1bIfRo6Ax
	 ehcJFdWWxmGG3aiUXAfvGZZYCBtoWnvvHYXtGnpO+6orZg6iWiVHMML7nRxthEkXTb
	 eFvCJTLN9TCEApq1S+YBrG1qU7I3tCcfS/SPNvA8TJZuNOCThHeE60wvkHMvuKKqCK
	 P/s3u4Cmx/umFZdMfZsNNqla2RJuWfceeg2VTLwlJMXa+52umYI8Cu8q8dUz6moy8n
	 qfc/exqx3zztQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so1683373e87.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 12:02:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrNVpeWW3GLd3aNDSYOeefFHX1vbJ1ph4SD4JMmHWTvg+HoVCjI2E3VNW4yavadWGSi+XuoesrDcw9X@vger.kernel.org
X-Gm-Message-State: AOJu0YxZTmRGF+pHFoJPafUnfiYXFqbsGp2motlEDuNzmLkBkHoCikvy
	rmgKSLAIwVL7szgohWevY0+7ZtjPteRuAOhXs0ymhiELaQBRoi1WrW6Vw2WIKjIkCNg/l5GQ22v
	kwYcSk93uSplVRS8RnGc9eR6l+TQap3A=
X-Received: by 2002:a05:6512:230e:b0:5b0:20b0:9589 with SMTP id
 2adb3069b0e04-5b023692f74mr71481e87.38.1783710119849; Fri, 10 Jul 2026
 12:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706195818.3906949-1-sjg@chromium.org> <20260706195818.3906949-5-sjg@chromium.org>
In-Reply-To: <20260706195818.3906949-5-sjg@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:01:47 +0200
X-Gmail-Original-Message-ID: <CAD++jLmOT8iXRZR4RMutznQrG-WMWWGEw8OixV4KAbH669pyUw@mail.gmail.com>
X-Gm-Features: AUfX_mxOy0Dj7aqC1djpSRGlgSr5wpPV6RgV0fTGSsRv2oiz-izQ0OQDDTinfXM
Message-ID: <CAD++jLmOT8iXRZR4RMutznQrG-WMWWGEw8OixV4KAbH669pyUw@mail.gmail.com>
Subject: Re: [PATCH 04/12] pinctrl: rockchip: Add RV1106 pinctrl support
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>, 
	linux-arm-kernel@lists.infradead.org, Jeffy Chen <jeffy.chen@rock-chips.com>, 
	huang lin <hl@rock-chips.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 9:59=E2=80=AFPM Simon Glass <sjg@chromium.org> wrote=
:

> Add pinctrl support for the Rockchip RV1106, taken from the vendor
> kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
> 5.10.160 kernel tree). The IOC registers are spread across several
> blocks, addressed through per-bank offsets, with the GPIO0 block in the
> PMU. The drive strength uses the RK3568-style exponential encoding.
>
> The RV1103 is a package variant of the RV1106 with fewer pins and uses
> the same pin controller.
>
> [1] https://github.com/LuckfoxTECH/luckfox-pico
>
> Signed-off-by: Simon Glass <sjg@chromium.org>

This looks pretty good to me, and I don't know if the Rockchip maintainers
will say much more, what do you say about the Sashiko
review comment?

Yours,
Linus Walleij
