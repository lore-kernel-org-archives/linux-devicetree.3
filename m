Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083C43537F7
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720050; cv=none; b=nbToA63wXv2f8MKBWxf1MlPRDMfucTM4y8F8LrXR1i+MgUARqKCAa/TPAQz2Sle+UuOQwsF8fMaL3dQ93A5U5IzEcAB7MsisurbY0kWh4HUL2f3ff5Gd/8PckWDCPwa5CDL4j6THd+vyRXc2/ieDESYu4p7GPAZP6AnsI2zE26o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720050; c=relaxed/simple;
	bh=YeoWLTkt6g+7QQ/XCxHLmavHJDwmMxaxbM6DKy497OA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dB1LtGac2WwrTfQDPJG9JyaYc0aHWE8zLbHutLlPtR8pBew6WcaD4D/RUCUDNzNQEhcDaHJ0E2rlONHxNvoPOhVQ1kAb1Q0Vxb7jn1zo9zXERIz9HC0oYndqo9gHFJUv6OPFzi9UKMe1omiTlJccUBdTkyKLkxGCJzwpZ3TFmrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dlBWdqDB; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dlBWdqDB"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f55efe7so66548566b.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 01:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789720047; x=1790324847; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YeoWLTkt6g+7QQ/XCxHLmavHJDwmMxaxbM6DKy497OA=;
        b=dlBWdqDB98VlAbFVyNLGHbECcRvQsOsIZQ3OuO2lBnzd3LAakvCtFxbX5dmkM7Dx6F
         lSl1v8Bc/++kOkn3YYItf0PhlICnUE/+69zvJ33u+w1kg4yKaWPPZ1XoHLQry17/Zeeh
         yYjQecRrwHo++gw3JEL7ZOQ+nzeHDuwKvkQDJ2ZgpMumZB45LHUUEJO1/6eGsMmTde3z
         7JLMhnZIB0uvs245H8pcU0Q2108PfY8HPN4tVi7RDQbep4b+0/ZSzRg7txalCC0YtUZN
         RjPiV2LENxGAJCS4G83ttbF1KyEGUDaOkKTJQgYBI2fq/oi9KLt62DAjiGppBOPCIGqV
         oonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720047; x=1790324847;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeoWLTkt6g+7QQ/XCxHLmavHJDwmMxaxbM6DKy497OA=;
        b=PB3WeRlU3WNLKD+HQu8Hc1UUOR0Rhv9qTw6GBp1IH4e61m8n2G8541xhZMlZM/eblK
         KjRGfKa/LA9vjPQRF4i36hGo8GRZX9OL8f2T0QeshUNhBM5pLD+Rvm1CSnNNjFBMaXEN
         +D7AV98GqvWpRBwEgHAb04MgituKxjtPmMsvs958cIIptoq3Hon75SkTnDwUX8xCO6lJ
         ojmm+SbWbIAf9up4PL93Vxtc/YkkBd0ZbZfdGHRV+zNeHW1XSMgTg+EGF6U65TmT9rM4
         9dJz+bYGcNg+MwPjg9gzQbDifwctk8D2OG00wPh8O1L+ebIY3vdaqSD93z2JEiNrzgwa
         xsJA==
X-Forwarded-Encrypted: i=1; AKwUvBwFoDzupmcZph42KukiA8fjLTMJnlBXhKFKgAWD4oblvZ+6yycEjhO1P9do4wpjbEl/fShsXlKNI3an@vger.kernel.org
X-Gm-Message-State: AFuF++k/X4haLwyNbJlFAn5A8vyU+Xn5mWE+jve4M/t3UPBYhMEbI+ib
	lj+CfmPmxOjlS39c/VUj8mcR9P/puU6SlZWTWwCn4uxr1zqPiBOBDaPK65zxDxqStyw=
X-Gm-Gg: AYBFou0gd8RgtB+CHJ5rVgSHQf7SwVDv1BXNFwn4zNCE4vlWxEDaR9PS5GapMU3XZG+
	bQCrxTsT3+0qVssyZb+z5EmfAZeWb9y4A9dYtu0JRpEwZVeJxkqBH3UZPYGYvJW9Nx/kUlP+ns0
	Yg5ieyCQWpRXY/UanRwrYUhRgXH70zIDorqCQTveXuXwolbr4l/SM+C7cBESHROM/lYdTsgzPJH
	ofuq6lLwqc0R/wb4i923YHIaCzYVY1JIVJDcjsoRZAHQloSd4dMofxFzWA/DY7SEFUbJLGms1Tc
	lz2f0bMTCHrB2Hzw4tKbQackeSMUy4fzyBL0kwosiSHMO0fCzR5a0fbJLLfNNlTRbnG1dsFS5gG
	1+pM/TGEBhf2K0e5xH5F7j1qN8z0zq9AgN+b5W6iDMwZgMhQE3Kw6NqhEix5M25WX301W9lmtdZ
	my9w7GPFZcV8g2bsmwFXnBep9OgkV8xHf7T7Mx+abPLY+7Q2tVW8LLGE9o7VdoamXqm4gNpWAam
	54=
X-Received: by 2002:a17:907:d01:b0:c26:1691:b364 with SMTP id a640c23a62f3a-c2a157c2f4cmr178472466b.29.1789720047299;
        Fri, 18 Sep 2026 01:27:27 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb87e5dsm32871766b.36.2026.09.18.01.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:27:26 -0700 (PDT)
Message-ID: <6c762160b22cc801d26de2f2186717e41f7e640a.camel@linaro.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: exynos: Few strict dt-style-check
 cleanups
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Jesper
 Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>,
 Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 18 Sep 2026 09:28:49 +0100
In-Reply-To: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
References: 
	<20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-16 at 19:06 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Do not reorder CPUs because cpu@4 must be the first one/boot.
> - Remove applied patches.
> - Link to v1: https://patch.msgid.link/20260911-b4-dts-samsung-cleanup-st=
rict-continued-v1-0-9aa55051c42b@oss.qualcomm.com
>=20
> Not yet complete, more files will follow. I probably won't re-order all
> Exynos5433 soc nodes by unit address because it is way too disruptive.
>=20
> Best regards,
> Krzysztof
>=20
> ---
> Krzysztof Kozlowski (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: exynos5433: Re-order nodes to =
match coding style
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm64: dts: exynos5433: Re-order propertie=
s to match coding style
>=20
> =C2=A0.../boot/dts/exynos/exynos5433-tm2-common.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 93 +++++++++---------
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 108 ++++++++++-----------
> =C2=A02 files changed, 102 insertions(+), 99 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
