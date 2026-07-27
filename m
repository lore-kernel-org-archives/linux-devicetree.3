Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAC3F822A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151133; cv=none; b=byqgxGTFaK2e+GJBNaLpsJqhFfnv3lwEbGx13KuefMjBqBciAk5W9JvIciVwa0M8unBP7gQxQLh9UE2PnTO7eryWtun5PNAtTiV397qo1sSkFCmZwFpLg364f4MwCc4g+kxh2ykueWeKjhfsy7E318cW1Ls05gCVVXHcRsQJe2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151133; c=relaxed/simple;
	bh=saI9rGv/S+Bdjv2TjtWTjnBCwib5vXrRGmSG6mtkl/c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WitRh5xhpUjyP+KECFqWE+jjVv9d+V1W5a4mJum0I/QrbHo9KeW2/3E1xAup4V5oM8tuek73d8IGoM9I2oGLyIvFNEZrq7jjjzRtTUI7D0uofHTRc4sig/qxxq1iQULyt3pLccH3q3xsdTFleQfBgpRHEnTudYbgppNGvdY6yCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w2FWVBGU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w2FWVBGU"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47362928f65so2441895f8f.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785151130; x=1785755930; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=saI9rGv/S+Bdjv2TjtWTjnBCwib5vXrRGmSG6mtkl/c=;
        b=w2FWVBGUQR6hPjmVtPZxPXdqYKpBCsQg55SdXqwgMElPdKU6zSINmpgCLhuekTyEJp
         2YI5OYHFIPBK31CEBsMv6uwAqRCFQY5VxuxMgXv6ugUYn6t9GRwWHyQK8G9duZCG3TG6
         UrI3SWzYu9XWU/NxH47G9bhJLF+250PAF4f6+aICAMqETNeoUWUk6M+CNuo6tCDp3pa/
         Q/ZjHNBh7Lh4oxcSpeooP37u8CfKQxv1i+BcIW9IMXcZwfTOs7QRwX7ou+gl9FIF3JaZ
         LXyUm4x5OhjaaPIn0t4mN7DyBRkDUKeB7fyv8olJk4ajl8ml69jcH1RM59oKVxE4z0/5
         PIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151130; x=1785755930;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saI9rGv/S+Bdjv2TjtWTjnBCwib5vXrRGmSG6mtkl/c=;
        b=Gmp6JkFotD33UTkFtbMjv9DdKW0ySow9iilVS42MUW/gy0NOODe4qyQzWnvYGnQJsA
         oV4D3typ5cWx7zQY2VsGM6I/kiyhjaQ6qrzW3o3JkKLyOifbWGdmNS8TV6tJb2of1sMl
         TkcltH56FetLvJV83x6eOj9Bw0HHgyc7FrlOqYzOs5yXJPvk83HpCyD/ykM7BwtkamvD
         3yndNlnuVLaoAItzdf9DLSpKI+2nvcialbDlqWovpLWFiRB8lloqhirMTaBcDEPFvaqh
         SuFV+9j/Mvk28TdzLJUvsEL+PEg5yt7wf8No6+r2gZxWQgNwsYrFDtUW5QlvZOH8ZNhY
         YbRA==
X-Forwarded-Encrypted: i=1; AHgh+Rrj/Fydj1ohUY2fKkyyRdHPp37yHUk3Ib3VNOGmiMzq28pUZ95bq0D9w3/24evme1gVNWxEyDXfuNnz@vger.kernel.org
X-Gm-Message-State: AOJu0YzKQn3KXpPHWr7mdB1d91Pey3WajKiDh5DxLFzte84YwCUMoL/7
	WALqBtTUK9oefxPF0SKGNrB00z8mB0zPqOMCbBOerA8cFSTm8/wJl9VJaFm2q0kcgdo=
X-Gm-Gg: AR+sD10iV8Pq4SdmAHCTKbsqFUr/G0N1ntc7xg9lU9zf+cN5OIQG2S5ERtSBv1R/37c
	poZJyE9l55Qb3lsE3Ve3TLr7ZMxdb4lyV+wsox/Mft6aa2p16IEq4sG/pX9EK6DRBort3EgPb41
	dFCJgDTsGbZSFkAW/uVSkKw8Y2XdMvnLDj4qt90jHvMI7e4Fkh0qD44Y7tLkRJRE0P6dS/VS0SN
	hha4GnePwADhM/YyZ4II9fNkHMLdjb7lNJexgfAgit5sLiKUQCew0YFOH/z34R+KCnqwNbwO7hZ
	nYy9zau5enadzeLt0cy4xWY+HJGslU7wB8/Mw3svx9l3o6Qu/vY2NGyq9hDLgW2Gw3Wd+qSy/o8
	P+PrxFIKJQ3KKP2vMJrrI/j/OFnTVepnvH2WCRYrVh8AxXEni+75pYk2kpTcu/qRJ82R8WDRs+T
	vdPxD51g==
X-Received: by 2002:a05:6000:2506:b0:47f:8ff9:c9bc with SMTP id ffacd0b85a97d-47f9fc8f23cmr11076927f8f.14.1785151130010;
        Mon, 27 Jul 2026 04:18:50 -0700 (PDT)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb57cfsm49134412f8f.11.2026.07.27.04.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:18:49 -0700 (PDT)
Message-ID: <485cc8cbd03a3a61f7281ac81ba10b866a73f376.camel@linaro.org>
Subject: Re: [PATCH 8/8] arm64: dts: fsd: Align continued properties and add
 missing blank lines
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
Date: Mon, 27 Jul 2026 12:19:08 +0100
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-8-e9e3e9879d05@oss.qualcomm.com>
References: 
	<20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
	 <20260726-b4-dts-coding-style-strict-v1-8-e9e3e9879d05@oss.qualcomm.com>
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
> =C2=A0arch/arm64/boot/dts/tesla/fsd-evb.dts |=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/tesla/fsd.dtsi=C2=A0=C2=A0=C2=A0 | 97 +++++++++=
++++++++++----------------
> =C2=A02 files changed, 55 insertions(+), 44 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
