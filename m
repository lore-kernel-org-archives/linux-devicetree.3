Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BC33F8EB3
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785150594; cv=none; b=P6+LdxXpFvFbSVwsTn2G5o89gYVV5whWAbPGVVK28e+OXfkPrJnm6O6i9n0X9Oyz9em+o/nLBX8fbs71O+afaz1Tm/to7hkbVjpXY2NJuTgFbDUsIiOU7kc0BacOP8+taZBHe5K8eXVOuVylp1DN37zEiP/V55z8gcLd+GbrWs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785150594; c=relaxed/simple;
	bh=oBr4OXPE9jnKq3p9VVCVdfxPt9HRQdoPfee5RHcoIn8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iDfjT9wkj9RQI0HGwzLwGBeggqS31bOl4FTDQ+FcXXFcoTB4qMS7u+zm8e8kIib+rWUGb26UqRbJcTbDngwI3vARMk/tIWe9fRZJELqY/nbj0FdndJkimy0uVj88XqtOksJ5R4O+9l9Ka1KvYAUZyt5qaN+GrXBFtcNkRLUZj98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PWF67Zv0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PWF67Zv0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso17486925e9.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785150591; x=1785755391; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oBr4OXPE9jnKq3p9VVCVdfxPt9HRQdoPfee5RHcoIn8=;
        b=PWF67Zv0OHQJoi24J4wZ7PCKVdQKlXNuKS3bw9gXsOLVy6CY2cToIVYFY3+8B7y+fX
         GHaF5jhERNK+2FGGEBC/zL6OpAXQHD7+h61Z5onXgCCNhnJauhjHX77ZPIXJAmpaVsNG
         GRzUV2QmyksYRiVlXSb7bJefFl18STcYhrV1AUwdrP2g99uiHbTYReaWo4z66Qb4Btgk
         48UwXQci4pkebMkqOMZUbxgdDAIuiMwCkF7QYXPHpQJkih8VM58sH+fPRuAQNzcGhIDk
         sNBhu4/ZVGbBb3IRuAJmTA8ZEqxWqT+YLysyou1m2aq0jXGoCXoTRLBMpg2d/7QiWfhw
         RgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150591; x=1785755391;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBr4OXPE9jnKq3p9VVCVdfxPt9HRQdoPfee5RHcoIn8=;
        b=IaVyNEuqJkpcSkN2zOfK40CzdsUJIt7Ee/VtR52gdDICMm1OHZD/oz8q73aUcrHlIJ
         +W2KYbuVlB7qbvQaFGEnl5DDp9+/ns7z2wqu7smjK9RCcyd8/1a4sQPzkDI+gPUjf/I+
         L2dsVvzxZY4AS1XOIQt4fAG3j4tukqyRJNZ2Oew6sAt5owJSsmWaYuTB9PvjIQfnK6yP
         A6C7kCZsnjkswqMaDiIOG3UdtnYjHxljTHF8neZinjQihMUE+uEb20zv1X+2GO6Gxl9+
         2doDqv+O/gcpnCS+EyyguFdkq3hIWs95VJaG3Zyx1E2Eu02LqLmhHDW3AMoiTxrTEHqE
         e8ow==
X-Forwarded-Encrypted: i=1; AHgh+Rpswvc+P7lAy575pDmBl30GgpauT09CGjOnq8SWKSClj7011xwQsloBbyiBRqeuPzUtSQ3fi1xAH5np@vger.kernel.org
X-Gm-Message-State: AOJu0YzvRGcrfzUZbKF5MI1HvwDeC5dwFXo62ulbedFn+qp3sTqNypgF
	cPMj/A5yY1uhY3JOMt4+y+Sl4W7i5KgKFzzjyfoTmpH6qvX0Zgekl/7nLinCXzsgIWY=
X-Gm-Gg: AR+sD10vBfOS5nKFj9VCxBbHXLfk6pBH/reMEzUtuLWpKkl+QlkeP+VMaMEV4gOwhHK
	l5DSkvvyrlxDjbMcS32YZX8KUHZhIv7f4LU9a/qtZXp4mhxZ4+sRhqZS5WUqWuEz0HC5MJVNVbi
	cENQwE1kucpbkyTipXURs9+m7UI5/+3T+DrE5UC5wTW9mWxBn5+mp2jTKCTCec+N8aKa0RsArY4
	yOL4aAh/MLkhgDYKBPzl7zv0KT6WaJAQDXMsdnEfwHSRQvKz004jwOEpzObo7NyGC/dP+4hC+/K
	WcMcykOdT0dN8788m0ELhrYunq7Mqj52wUY2L1yzeo1HeTJqpQuyc0yEeGW24ELZxfeHoByoeLS
	yjipoYqrLaURskaFjD54FVrvisXaV6oG9nkvihTTfVoMjJr3oHh1l2qMZ8LpkTrkqwYdQUeLdpY
	EWu699Xg==
X-Received: by 2002:a05:600c:a4a:b0:495:69bd:17f7 with SMTP id 5b1f17b1804b1-496b571c52fmr99418175e9.32.1785150591301;
        Mon, 27 Jul 2026 04:09:51 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4d8d6efsm243575875e9.0.2026.07.27.04.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:09:50 -0700 (PDT)
Message-ID: <0bb8cc072598421ab67c463322da429152d4f652.camel@linaro.org>
Subject: Re: [PATCH 6/8] arm64: dts: google: Align continued properties and
 add missing blank lines
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Ivaylo
 Ivanov	 <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski	 <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jul 2026 12:10:09 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-6-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-6-e9e3e9879d05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2026-07-26 at 19:43 +0200, Krzysztof Kozlowski wrote:
> Trivial white-space only changes to adjust to DTS coding style and fix
> dt-check-style strict warnings like:
>=20
> =C2=A0 [required-blank-lines] child node must be preceded by a blank line
> =C2=A0 [continuation-alignment] continuation should align to column 39 (u=
nder < or ")
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 ++++++++---
> =C2=A01 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>,
