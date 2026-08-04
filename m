Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1B93C8C48
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845693; cv=none; b=jQd14ehs3coG1y7GTgAEepjkoDT60WI76/pF/HA59cAZg2KiYIEiryrxD3RiHTrM99ZY8Fe6nbQk9D75dhSnZkKW6QF9zKZSwmGSmOnMsZu9WGI7EUhma4rzb42xEPj+y1qwNble7ehyyvjzYEg4u4PUQ4qSUOpkZ2eqf/iFbuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845693; c=relaxed/simple;
	bh=wh9PSGzU/M4S09lIfZ3z8Ixb0mf2rZg7R0cuTMmpra8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d+tM5WUXYADE7FC3Ip8igzfl3vv+X0PIy55USfzRh5KJljZXjvQkqJJlIVuPuGLZwuef49I/c7D3sOvdJ8Lg3EFfc0n0f178dUdLUOhl0ILD5cVQtOIuYu3MeV0AzV/NIwISaWABbhUqMRns05OOStK7m1yIUHjmTBYkCyJZiMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IwMdCUer; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwMdCUer"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so1650751f8f.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845689; x=1786450489; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wh9PSGzU/M4S09lIfZ3z8Ixb0mf2rZg7R0cuTMmpra8=;
        b=IwMdCUerX/Wfig47tUSmhlnlC4C5jZTYZ2Mxfrcgzx2nU4rzeSYJoJ4Fi8vfKIXH9s
         ocKcBZJvkWoRm3yYT/07/RoSNsx7bQKZAjFP1FS7yIb0biDCgMswE9WG/pP1rsIgbaNV
         IMhJnzCHE/hBOQyZx9wPIw1k9FSv6IvG2wuq+h4TL+rG/Ajw3ybeEW7uAw8iEKPeLQDv
         ZwvQNiO7B5EKMyHhA/tcPJM5u2YJ2anvXMvXeCctVfUntCuw3eny0wX7JJ1NJQUidM1R
         L4YpuqgCSd3DPBi0tgoaekBC6YrWMjFjPg6ciJpEuexKJPS7gTG1xJIBgdGyv1EpFZNO
         YBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845689; x=1786450489;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wh9PSGzU/M4S09lIfZ3z8Ixb0mf2rZg7R0cuTMmpra8=;
        b=KGviru9HuQQrXv4SSuRA6G8GedGYyNvfyqfHRD4XIMCTrJU3zRHbq1+Win1d8tg0ml
         QrnA+bOtHm1Njqq9FsnQFXpQD0TUxnOdZmc3vUaqkS/G6FdGQUwPSwodVB9Y13LYES2F
         +6C3DFiujuQ9xjyB7Hjh1oPm7HZJSrB6e+0Btt/f4AVdcT3Bz9mtCDFi7jb/htF/RB13
         7jC2aSz4sjogoHHrRDUizqyM8GbKZ77+PMo6BLWjgfrFM0+fTnEiH8rYQnfkHY/5NoC9
         h1B6NNGKjrv8VXSKOWuK5GNF19KsA9XCirxL4OW5QpeQRdrA3Hh71Sovf0sYmpanpfTA
         zjpg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5y0gt/LT3vu7Ls3N2GjVBOLdNXp6OJb7USs3RMiCNkYIsKbIdW4JCMxaVIyc5rn9Li4/6dVoOcBfR@vger.kernel.org
X-Gm-Message-State: AOJu0YysH8jJxsLixc8awTeb7uoDhKzCwSGFGXvuZEfWz2EtZSeqX1mi
	WTCMCa3fyOqRgYDBkdwNL2YmkQIZc8SMFxygnG8dnZiIzt1tnlWsLGV5KtkL1rtkZxg=
X-Gm-Gg: AR+sD11XH2v+3hcnm+iItZ1PbnR7h6QHJzqzPZJyvLM+L8Fz/FrCItUpihI3dstuNUN
	wRP5MWTZih8iz1NJIQfkr63n8dCMOO2jF6dFjZIoF7q83/FuPohnBV1tXu04QA0LH6+u1spBXBN
	rRuvDgW+ENwBqEZxE1Z425kzQdT08FoLi1gZWvflB8VVSE1NqGPi3ta7h737VPDpC4zvqNPspyG
	2p6OflQEXI3P2Q6udUDKujjXZVSg3zgMdgC96nHOaQNnKf8K2XPZtvBsldTDjW2Zf6MWX3oF/Yb
	lxzzOcWVRNDHSxPR9qn7Boq3jEpg2M+Ks2XFzYmglxXTYCzKJIClHGIJYxR/bwg7lrphZclDUV0
	LCFKgIOiptu2enl6t8pM/JymZheW2xM4Gw2G6WkS6Dto/XfVptVs8A/N52EKJuMlvjjag9oUwzj
	uCDafH3kj1rWclpXAuUrLRrTcs9a8K/kkOiQQ94c9FGwWS7bq6461H5coYffon42pC
X-Received: by 2002:a05:6000:491d:b0:47f:93fc:2d27 with SMTP id ffacd0b85a97d-47fd72f08f6mr36907224f8f.30.1785845689066;
        Tue, 04 Aug 2026 05:14:49 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91bfsm45894550f8f.15.2026.08.04.05.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:14:48 -0700 (PDT)
Message-ID: <6ac14ee5f61625e4254fac74d7e8894b3136e007.camel@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: Correct white-space style
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Alim Akhtar	
 <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter
 Griffin	 <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 04 Aug 2026 13:14:58 +0100
In-Reply-To: <20260801210353.383880-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210353.383880-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-08-01 at 23:03 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).=C2=A0 No functional changes.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi=C2=A0=C2=A0 | 2 =
+-
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi | 8 ++++----
> =C2=A02 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
