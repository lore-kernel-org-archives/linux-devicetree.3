Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7258A3AD506
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845271; cv=none; b=Jk156aKI7tB4kQE7BbX+kDomaCWXmuCXazZdIr08jym2LUTac7J+xWsJ++Gzs5YmiBLg689fLSHywq13lq/gp4njyHup0h+444tVhfmRLDIQ0IefZJbf9Y2BguQxeMHryZuV7OzuYLBzma0uQ/qGQTrOfrqBuQVR4vuPylqu6sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845271; c=relaxed/simple;
	bh=HgW9krDqxT2FKCqRiY4Ucv2waMe6ob+70M7DoaSCHZ4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=My7KJiaS3cr5dX51M2nH+PfuxgJxYZSAZLEZTEKgp7fu1JPOsyvMcde7VfsNnxgRmHiD58rSpEGeE9ysc2cWwP6uRzOZPhmNlLcw+i7ug8RcMdPaxiV1oygyJSmlx93aw7geCUetL2SyZkwv5FhIEti4ntIHHIAFF9ENlxmc4QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XBfDNasV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XBfDNasV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4980dc26022so21642775e9.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845266; x=1786450066; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HgW9krDqxT2FKCqRiY4Ucv2waMe6ob+70M7DoaSCHZ4=;
        b=XBfDNasVJDV5qQi9jQK1DlOsHVDUKb+NKaSIbE7Z7O+5FNa1d2M0RRJl64wIWj0p2m
         lcjYCr8Vl95uYGonIYqMQ7WTw0dhM7ZvmYfbjsI0RZYLrcKluk8On5YyXV2NHI0l9gnC
         QoMYS0vMzzorYgsD3msn46RzhyMPs4uWXh6ZqhwE3yerv5W5R4Y6Rvn+7stm95PSsKg7
         qTzYTeUcNMVVbnILodQxx3RpBp2zTLcraWmkTwkUlwCZUFJtkhT9BcCWPnS/AucBwGyh
         HtAl4oIq4tNPjZXhxvgNeLEJsJ1vYXmhqeKyRHh+H2LRyEzOHlMhPsrleIv+K1oQ+MMR
         9ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845266; x=1786450066;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgW9krDqxT2FKCqRiY4Ucv2waMe6ob+70M7DoaSCHZ4=;
        b=KGvpI2zUpCSmwK3b2Jv1wYcAzZ14oVnyr6jf9wai36mgSm0c9PJU9k6eJoOGSTjpHz
         D+qbVwW5UOat0E7XNaipd0nc+eRcdXNLvEjxPJemE3DcpgawTeqtTr3bnhsWxptccLEK
         PGVqW/ng9HQZDWVmd2TPX1SfH20fdbLd+PDPpUwIL8LH1WRusvXfO9cZ0JEn+tELLNC2
         kHlcewPHT890csrKUQgxu3720g6WG+oP/80LUzYsskPn7osZIqYGPa/ECq/j+W4BpiHM
         7liGGZHgm7P5E/RjThtyNMsCX7xtk/G+qfLgI2LoVjgwMsR1BY7fJs31r2g3skaPH8re
         gY5g==
X-Forwarded-Encrypted: i=1; AHgh+RoTtwriv6OcXPJh0SN3Rumbg0icgcg1mbqGZFFYP355t+WW/whPz+fSMp28CuQm04nSC099x1YefUxN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7iXmY74Aq0Gewu4/cXi8izHoY5d5bBnnc7LI5VTrYfRLv+BtM
	3AuFtL+VFdHBE/chzHzzdModLUmfIcQ6MjRdgZHdbmfwL9IRIvjxCMVDie6vhvqxT4A=
X-Gm-Gg: AR+sD122q//t1NJcD3+4KVvqRtl2MXFAUpH5orV/GD1jWYUHj7anUfSmPTDJ64p13a2
	Sg1ExtvkLEXSUUIpRM4a7pHzDqXoDnXACO7kGMqwxj7ttVZRnS4ISDH+1jAWuMQ4Q7xJjK4Llw0
	D6HqkMSCQYbmThcl+y6fvi40VNFliEhq+KALd8+7FhIC6fmAT7RCKpHls7tYNV97+skQxCDcy+N
	M/JtMzOlJOitDOB91igOKYI9EFhF4VbsvokEbtOMfKvRfZm0WfMZs1QzoQb4yXwGZTw4JjT1hQu
	dgJxvVTl79s5tOBDWl+f01tIQDQBn/FBc21WGHSpg+futPC0SgivieqySA9+KfHuqFcsGifOvWz
	LzSMnnO2NQhzDEr4Zoyg9ewa9MpfTtdhT/GaydskdNuxaBhZ4lea6wO3wWe8V5Kiu+Xy4uvWbGT
	713surxl3RtYpNzZ9HRVEonHWlA09mEH5lW27urpMVwA7Q94hQeYgEyFVIRRVJUuPo
X-Received: by 2002:a05:600d:8443:20b0:493:e974:41ac with SMTP id 5b1f17b1804b1-4980c6562c5mr262857645e9.16.1785845265916;
        Tue, 04 Aug 2026 05:07:45 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fef72esm98922805e9.15.2026.08.04.05.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:07:45 -0700 (PDT)
Message-ID: <00b083b57df5107300491fa2023311ca93603a60.camel@linaro.org>
Subject: Re: [PATCH v2 1/8] arm64: dts: exynos: Move 'status' to the end to
 match coding style
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
Date: Tue, 04 Aug 2026 13:07:55 +0100
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-1-f09a659ab80d@oss.qualcomm.com>
References: 
	<20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
	 <20260801-b4-dts-coding-style-strict-v2-1-f09a659ab80d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-08-01 at 17:06 +0200, Krzysztof Kozlowski wrote:
> 'status' property is special, thus DTS coding style expects it to be
> always the last property preceded with a blank line, as reported by
> dt-check-style:
>=20
> =C2=A0 [property-order] property 'iommus' out of canonical order (should =
sort before 'status')
> =C2=A0 [required-blank-lines] "status" must be preceded by a blank line
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/exynos2200-g0s.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/exynos/exynos2200.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 98 ++++++++++++++++++++++
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 10 +++
> =C2=A0.../boot/dts/exynos/exynos5433-tm2-common.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 47 +++++++++--
> =C2=A0arch/arm64/boot/dts/exynos/exynos5433.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 55 +++++++++++-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7-espresso.dts=C2=A0=C2=A0=C2=A0 |=
 10 ++-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 ++++++
> =C2=A0.../boot/dts/exynos/exynos7885-jackpotlte.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos7885.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 12 +++
> =C2=A0arch/arm64/boot/dts/exynos/exynos850-e850-96.dts=C2=A0=C2=A0 | 13 +=
+-
> =C2=A0arch/arm64/boot/dts/exynos/exynos850.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 31 +++++++
> =C2=A0arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |=C2=A0 1 +
> =C2=A0arch/arm64/boot/dts/exynos/exynos8895.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 47 +++++++++++
> =C2=A0arch/arm64/boot/dts/exynos/exynos990-c1s.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos990-r8s.dts=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0.../boot/dts/exynos/exynos990-x1s-common.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynos990.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts=C2=A0=C2=A0 |=C2=
=A0 9 +-
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov9.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 77 +++++++++++++++++
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/exynos/exynosautov920.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0 | 57 +++++++++++++
> =C2=A021 files changed, 485 insertions(+), 24 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
