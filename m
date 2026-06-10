Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949873451CC
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781130286; cv=pass; b=azyevFGzOBAvwYxjZYVs1+xzfJXusKfBMFWVoWTUqhTW+d3AQVLfZoaBgDK75XHAoLPilHdK8kpAWl3FJ/D8tSFoQ9IuikmOogcoclV1kJbwZDmgtx0MSVrnkah6RBsg2mAe0mGgAP9xa2ohIqapQAC8HZZm0an+Je6whvyfzuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781130286; c=relaxed/simple;
	bh=GFOUhfT9LXVoIexQueNFZG57jnrIS8Fo28w9PXTMHIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dY2s2XRuHAJ5v/mASBvuIXgVEsPg8Rmk9Py1H55lxkgx7PmQJqIXlbXWL9W5z9WjJlG7pCpx9jR7cPcxL6PK2a0P4VyuFPrA9vLwYa6bbtUAVYuQDrr9y6Po8lPkwmO43/GeW6WT3VGZl6+MvXbx+XkhvCmWGybIbvqT5PyxGFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebQpNY7j; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebQpNY7j"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66077c46c5cso6649355d50.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781130284; cv=none;
        d=google.com; s=arc-20240605;
        b=BH9cTYMQMggFAJECpnp5KWFrjq4g4Hmq2uTkV6995uo2bd5RaFI/XdVt1NoN27qa4R
         vAJaNJiIRTAhZOY7DxXIDVtmIUziZqDeRJzIyxkB1nW+pFSwiijaAqW6tBo5g0rMxFsP
         V+h5B5NodSGEr5wQRZIkFcwXdX0m5aQTrZg+PYDp7GRgoTX0bpqsItLGbPxs7KjSHxIl
         MDJTW57VsDe5DHjmbQ4marA5CCqfx3wIM3Ki6or3Mev4+cayCOpFJ8x7dG0fDTEAw8PK
         xApkuiHw0hnL9XD00rLOqDMmDyG6NJ9Cx9D6FK2jQjRJ7h6XhaYi4F78XEhf5/kQJXap
         NoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GFOUhfT9LXVoIexQueNFZG57jnrIS8Fo28w9PXTMHIY=;
        fh=AjNtGDQzgJ75dDyDjrGc1ZhJWgELnBILXT1k0QNzgqE=;
        b=E+CSp1rHsCJRdKusCJhtDtgjDW9DBtdhw+95HDRpXoEMc3fKlu45sP9/paH27wwxBT
         6RyeWWdqoyBo30VoVYSgnVzJBC6PU2JiJGgZM8I8tpJWgzoVgmuWNQ2x89P5o6p+N+Zk
         N+0bZPWP5KHSIl5ewStZC+2eTDUdifIZTlmJzqE3WbXiDwZvI9A3wfVVyjSaZSWjWXtF
         lSeUQxFeCN5+0CAKDXymKA4Klhk5zUKl7woqUbhP47SopRp2hwaFGNEALC+gvMeCVYA0
         dAM06KesnKnO9FOzK3UHHuouT/XGw8jBM1vSRMYksoXXhwWtDPXWQy5m+RG8nFbzxtu3
         XmNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781130284; x=1781735084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFOUhfT9LXVoIexQueNFZG57jnrIS8Fo28w9PXTMHIY=;
        b=ebQpNY7jzgduruCcPrOg8SdioIRDchbS5MOIeeJAQAgUQqLmudo/mcmyUGy5yZdZl9
         TlvNeCZ5x9391NzFa4fCCcQc0sdtH4lpqgpeb0XY0sCCcx+t4UiKtrjmpNYWq0zcGA45
         GILznmttyS5fhgpCzOQdHvanYRY7OQxWJ64hRIy9CVwWqIKd0/MkD7HxO2rjOQ2up7pm
         DTDdvBspKzkl/IL7vSs2dTqweowhzcLHdijSWCiKJZzt6+Ub/WKTxdipRxaVY0fo7Bm7
         xcZlRNxMCgXKIZcDbe3/GvIP/fp0L1h8tX11s99Id/5ThvL4sdYQT1QzVEx1TNELHT/5
         /DzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781130284; x=1781735084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GFOUhfT9LXVoIexQueNFZG57jnrIS8Fo28w9PXTMHIY=;
        b=GtCBPGTQl9jP2dN2ncRXYeHgGJHaspZ5ZRknULMqDQ+fv7Ryjk8hkILO9wpyXELcai
         P2ujO8rENPb+WmRokvYcev3j4zNa8zp7BClvGVYwGFFCDGrn1wbIvuvr1lFzr0CWyegG
         gYhcdKpv6ZbwAd91+YX+O1UTXbpoWUfgTIuwuRf+vZLl+HIr/MzFwLGzT58qQ7EhyO0c
         /KJP1CnE/UQW0ufasWj2K0cTIesnD85+uwHdq+bFd8LkkcryDlmv6lTPmrR+TrKwsoAu
         cN1f7OBaNwmA99WEpViijdkCBaQuW7obdLIEXSLkfbOixqjR8rflXfYYcwBDhNctOufG
         E5ww==
X-Forwarded-Encrypted: i=1; AFNElJ+yJzuriE53HWguXDirkTi03HAFz/COdj0FuJbQ6SuNdCdGK1BHiFWp4jNjHIn22fed5mY01JLPEUkZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyWDPQf6PTg5IEYBXcNdoKK7qU+O21BqxF3jtOtxn0gttxlGT4d
	9GbdQ2WyOrsCzrWCplvD5CtFsHVhI+BWJxWLXHewC2auNrCGXeo50jKs/QJG6vgNBA2xT+oS7Vk
	ZJorCyDdvjt09LQVONNv4/M+JEdBXwBc=
X-Gm-Gg: Acq92OFN+ArV9LN96JLEeh7+gtkkONlUNSHFfeXj+UrEi/vRuS28gP+0uRsIx7Ovp7U
	DWF9b5XdWaDLwolmaChWP4EQrr2tiGp/0B2/ThcpuJIRLwQdOFX7+JvBhG5adJPyVBHTDDzVaA2
	CY62++0TvBRE2Aw8gSDFVL39SZUXd4lvFUKslig+H4QNUERnOWm5GHZMgEL5ZcBX+5QsUhB8s+9
	aNR1YOSN9MiOTN6graNlt/cEk0HQCzY1da/Tb71fSdaNl2IQTPfrQSQj+Fg0dKhH5kDC6EOxJ7l
	/tXNajbbpC/BeFQ=
X-Received: by 2002:a05:690e:1908:b0:660:e9fe:48aa with SMTP id
 956f58d0204a3-66106e0dfb7mr24207826d50.15.1781130284449; Wed, 10 Jun 2026
 15:24:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609160326.45123-1-m32285159@gmail.com> <20260609160326.45123-3-m32285159@gmail.com>
 <20260610-pastoral-dark-ostrich-5ca3f6@quoll>
In-Reply-To: <20260610-pastoral-dark-ostrich-5ca3f6@quoll>
From: Maxwell Doose <m32285159@gmail.com>
Date: Wed, 10 Jun 2026 17:24:33 -0500
X-Gm-Features: AVVi8Ce9qyMQsXZ2KyCqcF6JmCNIPGuspde0vMgV_QNyC6PkUH0aSbo0weFE1ts
Message-ID: <CAKqfh0Hi8EkShh3s4dUqAJRDExQLR0NVOvd4An+bY5hat4-Lhw@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add myself as maintainer for PMS7003
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Tomasz Duszynski <tduszyns@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 4:09=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Jun 09, 2026 at 11:03:26AM -0500, Maxwell Doose wrote:
> > Tomasz's entry is no longer valid, as he is not active anymore. Add
>
> Why is not longer valid? I see activity in Feb...
>

Strange. According to git log --author=3D"Tomasz Duszynski" last commit
I have from him is 2023. We also did have an RFC open for a month on
linux-iio with Tomasz Cced with no response.
