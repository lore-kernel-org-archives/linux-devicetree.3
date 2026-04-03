Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA54E3A168A
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211466; cv=none; b=iJY7wWHbSO7YEgfXO/sG49yRqYOEaoVht0FtduC8aR5GyVeWKOo9cPLvnvXJ75ruePL3i4MiQJmUYz8iJNi4J8pi0WIcSKBKbAHfrQ5X/iB8q8Tk0CCuLriDz//9lglP0AIvEt0EslOpOLYHYO4BSOhOdTcS4jHdVTpxTt+Ne8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211466; c=relaxed/simple;
	bh=d/v4XeoiWFEOFAaH3W/eNFweATx6olzCtwWK+dE1fQE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jmpc18whcu8XWT1+4h29aUnlaO18eQUl9J2bpYrH8j6xqEddga1dU2zC5AhbbKQWplZYh9uaKs2XBvOgxG8nYMnC+Sne0hqdYaMU6py91yC4zFIgAZbMQoMOVwfWIKy7iBYD8I4P2cyqJycuF5E6+N74fe+TS2mXcMC2MY1mfUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aDInQkxx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aDInQkxx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d17bb1c1dso1608095f8f.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 03:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775211461; x=1775816261; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d/v4XeoiWFEOFAaH3W/eNFweATx6olzCtwWK+dE1fQE=;
        b=aDInQkxxkCYy0vyDhVJGYB38p/hCgGUxQ0BaaP3++gpOMAwLy0bAWC8wKjKuf6IRJJ
         1eNB5vJUUQlPdA3bZuvi4X4oS4TWlLw+UScaQ5qeTkq2vDUHiePR9wluVtqCSQ9vCWuA
         8uj2LtvbfPbe7k4ncMf5JkQOpEUy4Jc57qsnCNRzE+prgF6UlYnaDk/r4mflompe6C/l
         Xzafc3ZBfy31q1iWSJrdp03govsQUwrMvqlqpsRFCMJdshWqFZktFhe+YuOgG+JBXUgY
         GoMROXUYtYAWklQFA4X8jie6+Kw3Fo751h6eHZ+y0wCeqA+P9wNra0betG3CheRfl/Rh
         2Y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211461; x=1775816261;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/v4XeoiWFEOFAaH3W/eNFweATx6olzCtwWK+dE1fQE=;
        b=Npyj9gfidselNmWuLTm7HqSjTJYDrK7DhrJvypBz4kL5rS1msfo8N+uqsEifRbHdTM
         xnAt4OPnx+B5c0fPyOBgMzOuaNqU4jzwtLJmFcgeLyBe1ErxDEcRtH1V3QxkNW20KMUk
         IzwP6qxNQ/6+3FHecCP7/ZNVgXchGCfKeu0DPloAQNRnGdhxxa5ZSv1KrWNlDcYf+Hpa
         2Hn2ANNgXwP/1K52k9e9EPR32+QRpcwzLhpl198SPtU2ORlJZ0ltndeWvcIF00E09EgR
         fdEBNMoasnD/gydvAcJgWgAFCSZNuBRrn0FXtOJgwLmjpjaLnhVL1pj3CNGxl7nAaeqd
         xsnw==
X-Forwarded-Encrypted: i=1; AJvYcCVMAr2AMdy/xOxaaw0JPjyDYykcH6QIaSyeiSlIQdY6/CKhUXUUBuJFDoGt6NfQvrLZJv5t+1oxvaio@vger.kernel.org
X-Gm-Message-State: AOJu0YyiRiegR07Gi5JKwSsNavwt4IvoA+Er8tF0iFV/CV4+IbUyM8KX
	+eetKHlMtDkGDWn/YuaVsim/KPYgxV6ntUBw3Skuge6SRlRk1fDe9THEc+GcdhQN69w=
X-Gm-Gg: AeBDiet4J9aDNEVaqMtvoFqA7dkxxk3QPW9DrfvqqUT45sGr+/y0+ujYTMbsFnLK/SR
	g2BZluKyiHr9r3OZ0ZDWQwSbYqVk9ZNFeAfyXYqn0pH1GdmMnFuw8+fVfeY2LWbg2lrUBWCBw+5
	hW2WbprsF6vxxcvRdNYElrYfP7iyvxq5wCMlWbIyHPGd3fPWd5CgUMnF9UUoDatDfo/UBRVK5/w
	TGgKxSGgMSf4jO7fksY54TTjrrm5qTjO0UoPq6ff4BI/e7HEL1H4hicDcF5SYQXuPjHNFW6wTGD
	JZnJP03ZGCRtfDicx3I3ChbOTTbwV91bT73t2cD8XQcXVXEjoiPQhQkufXeJC0kpcDKBaECSNeX
	PNZylZGssBSvuEyVd57aIsCNyMJ5UMnSphZ3ItSYMT6SVb7LVE6KWedT6w2p0BXu8q+SeT6C6Rb
	ajm+uznENutKYfIeB9KwdqvK1OoGX2
X-Received: by 2002:a05:6000:4201:b0:43c:f976:b8ee with SMTP id ffacd0b85a97d-43d292dab19mr3932897f8f.26.1775211460610;
        Fri, 03 Apr 2026 03:17:40 -0700 (PDT)
Received: from draszik.lan ([212.129.76.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a71f7sm16791493f8f.1.2026.04.03.03.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:17:40 -0700 (PDT)
Message-ID: <01ffe5d3aca040edcedb084386ab6e195cb93013.camel@linaro.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 03 Apr 2026 11:17:47 +0100
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
	 <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Alexey,

On Wed, 2026-04-01 at 05:51 +0100, Alexey Klimov wrote:
> Some Exynos-based SoCs, for instance Exynos850, require access
> to the pmu interrupt generation register region which is exposed
> as a syscon. Update the exynos-pmu bindings documentation to
> reflect this.

You could mention that this is similar to the existing google,...
one due to same requirement, hence a new and more general property.

>=20
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
> =C2=A0.../devicetree/bindings/soc/samsung/exynos-pmu.yaml=C2=A0=C2=A0=C2=
=A0 | 18 ++++++++++++++++++
> =C2=A01 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yam=
l b/Documentation/devicetree/bindings/soc/samsung/exynos-
> pmu.yaml
> index 76ce7e98c10f..92acdfd5d44e 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -110,6 +110,11 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 description:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Node for reboot method
> =C2=A0
> +=C2=A0 samsung,pmu-intr-gen-syscon:
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> +=C2=A0=C2=A0=C2=A0 description:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Phandle to PMU interrupt generation inter=
face.
> +
> =C2=A0=C2=A0 google,pmu-intr-gen-syscon:

Please keep alphabetical order of vendors.

Cheers,
Andre'
