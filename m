Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EFB4FC347
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745170; cv=none; b=Tvq6KhEcFvWok7CyEV9XucFT2wvYuBBSHPlQrOs4fQH9xf0rILAi6bRJnxsd0dUFogyxV8otJbPYaRHZ9grtKr+ri1HlUmL7lCkdPP01EYTw8F4EfldiTpxlFuvI3PkP8LqgXZTYPXuQhbMsgiMO26KfjFuBvyTGfgxuPjKXtHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745170; c=relaxed/simple;
	bh=S4BbbDlFMvSPl2ab6YtXb/KsV0JNn8z1b6pr9Asc0Ds=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JhnxYPWmQskkLSYLCmSTQH44nkz+QFuXE3v4XchGiHPuvHWtRxvwu4qOEiXqN5gTO7aad4j0VKOMw5EvrjJYCvxog0v/ilS+gia12HnAQUBgyW10nT2efplF1msOiwynrBoWwby9QBJiZc5XlCUdprMZ95bTpCnEqj2bJDOGzgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srIiNcV1; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srIiNcV1"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa053900f5so1525047a12.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789745166; x=1790349966; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S4BbbDlFMvSPl2ab6YtXb/KsV0JNn8z1b6pr9Asc0Ds=;
        b=srIiNcV1+31jY3wY5Zs5IYPLeYz9lw0Ixf6yqZAcU9auUHyoYPk44X+k+GgwoMw1eg
         KFHwAdkBYIbhjwTAnejc/qh0YmrOgBXIzJc9/0h2jo9OCStsX49YsYPfzstwawsr0l0L
         jJ/th+JYr6zLIWgymC+2fkJdbMtsVqkNHLgD6GalEYkZcWeZAFI8v7bGm10fycOTUwhX
         L7lSqs2QI7oJprUuQfgM5Z+aGdcsGlB9fWCrvQ/Qsco/dZi4tZCwQlxvYYCJ3tZ+2lsc
         WpTWMF/7u55nBfg8RP1jWklCf8G9J2rmM3BtfVMPpbpiyCPLQIbXzqb65WD/q6PSSUa1
         B1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745166; x=1790349966;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4BbbDlFMvSPl2ab6YtXb/KsV0JNn8z1b6pr9Asc0Ds=;
        b=fUscUgmo27kfTHTcS1sqfcpe09eTptTCG9h3LAL1SUHavm82bjL+vfMaG29zsOIgBr
         I+e/rRLSOM/9HjdD0Q5Q86swJr7wDeJNJctZ+ONvJnr5c6qENV7BzuH1M2f0ymFS0jIl
         OcXlplp0bHBwp8+lJXYRbDXhmu1uezSoj/g8lzEpUlZktzsnlOsh1LLnQqKx4J326fmQ
         4VVrKXihHLrT2mO8dTFlvzjIBkCqOWFlQ5D/5Oq8Uct/WvVBa9Otgb2dGZsVNqSx/dsX
         LSnbwpl3FCS2eFl9pQWKpH4B7EGCC7FKlrqMe/z9IH/roGlGFiMQygRvWy/USJJ7uabW
         5sog==
X-Forwarded-Encrypted: i=1; AKwUvBytNXhr8eiEPrco7J5mrpSzsG9b4SY/e3jSXU5xMPtFxQ0XU8/FEQUiGZ0dcMO6bGf6XLEKgvhJyns5@vger.kernel.org
X-Gm-Message-State: AFuF++k0mTEHfmrS4/8ZH1hPk/L2eSrQOVldDnrXMz2DKvKZu9CRRPnu
	bg6kInNUm5wF2nmD9nNLLyr2fyPAdintrCPOfeHy2x0tHMZWNX0xVbyD
X-Gm-Gg: AYBFou3XwQ1SlPDqBNQKZgUEQqBl4vTtDalfcr113ka2Li86qtTtYN2FedeMAvrqbGP
	w0/bziaIjNOmI0K8p/A0b66de3RRrNcxpQQb4uFWBVZMuBO7YoRGPmkHfsbTi8opCCioUtNAnYc
	/sS2MgOdK8NhgjzXHQulcVUsQAHimGglR63dKhyRW/KACJ6vmZkKNnFFyFVeVfNvkSeEmvweFUH
	E165VvE6EYwe7Sof0Cj/Kxbgs5uyEQuTPM/JdhTe6AlkvF+oCUP3l0W0j4uJNJTbPpB9Mg7WfwX
	rz7agv6efuYWA0qAAjhperoGZ6XsBkwJz+zEYakiFRIBmb5OBUiNhtQYpe8DSIeSE/TFh7+76w3
	YZD5wkjoSC7LB/oN2oZw4P0M1A364J51/jplqgTdQy+U+zBRE0qV/h2IoyqYpPq5nd1uT3ReGHA
	Xm4HQk3xbihdAESB2rtS3PF/RY7b7ldt01K0NLCbOklf6ZSwBroqs2Clr3Q3zhY6qMe1tbleO77
	hLQpfUDR/j6ynqMOYN53n7ltUAn5qWOwMWBbAYYYYJDqnXOUDne++RZf/+qi/d9VErgj8r86rhI
	T48/3Q==
X-Received: by 2002:a05:6402:a0d7:b0:69c:6547:518b with SMTP id 4fb4d7f45d1cf-6aa577f4a28mr1746463a12.12.1789745165596;
        Fri, 18 Sep 2026 08:26:05 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67c6d71fsm35507a12.2.2026.09.18.08.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:26:05 -0700 (PDT)
Message-ID: <9fc012985151b1b79b5d6e3f16738397ac9f837f.camel@gmail.com>
Subject: Re: [PATCH v2 0/6] iio: adc: ade9000: add ADE9430 support
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron	 <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan	 <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Marcelo Schmitt
 <marcelo.schmitt@analog.com>, Joshua Crofts <joshua.crofts1@gmail.com>,
 Radu Sabau	 <radu.sabau@analog.com>, Salih Erim <salih.erim@amd.com>,
 Jishnu Prakash	 <jishnu.prakash@oss.qualcomm.com>, Jakub Szczudlo
 <jakubszczudlo40@gmail.com>, 	linux-iio@vger.kernel.org, linux@analog.com,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Date: Fri, 18 Sep 2026 16:27:30 +0100
In-Reply-To: <20260918073537.1572-1-antoniu.miclaus@analog.com>
References: <20260918073537.1572-1-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-18 at 10:35 +0300, Antoniu Miclaus wrote:
> The ADE9430 is a polyphase energy metering device from the same family as
> the ADE9000. It is register-compatible with the ADE9000 but omits the
> on-chip dip/swell detection and has no on-chip digital integrator; it
> relies on an external analog integrator for Rogowski coil current sensors=
.
>=20
> This series adds ADE9430 support to the existing ade9000 driver, reusing
> the dip/swell-less channel table introduced for the ADE9078 and adding a
> matching chip_info for the ADE9430 full-scale codes. A precursor patch
> gates the DICOEFF register write behind a has_digital_integrator chip_inf=
o
> flag so it is skipped on parts without an on-chip digital integrator.
>=20
> Patches 1 and 2 are standalone fixes carried with this series. Patch 1
> corrects the ADE9000 full-scale RMS/PCF codes to the same family-A values
> the ADE9430 uses. Patch 2 fixes the DIPC event never being handled or
> cleared, found by the sashiko review of v1. Both carry Fixes: tags and ca=
n
> be applied independently of the rest of the series.
>=20
> Changes in v2:
> - new patch: fix the DIPC event never being handled or cleared, found by
> =C2=A0 the sashiko review of v1 (patch 2).
> - new precursor patch: gate the DICOEFF write behind a has_digital_integr=
ator
> =C2=A0 chip_info flag, split out of the ADE9430 support patch.
> - reuse ade9078_channels for the ADE9430 instead of adding a duplicate
> =C2=A0 channel table.
> - reword the documentation intro to "The supported parts are..." so it do=
es
> =C2=A0 not need updating for each new part.
>=20
> v1:
> https://lore.kernel.org/linux-iio/20260907101623.8730-1-antoniu.miclaus@a=
nalog.com/
>=20
> Antoniu Miclaus (6):
> =C2=A0 iio: adc: ade9000: fix ADE9000 full-scale RMS and PCF codes
> =C2=A0 iio: adc: ade9000: fix DIPC event never being handled or cleared
> =C2=A0 dt-bindings: iio: adc: adi,ade9000: add adi,ade9430 compatible
> =C2=A0 iio: adc: ade9000: gate the DICOEFF write behind a chip_info flag
> =C2=A0 iio: adc: ade9000: add support for ADE9430
> =C2=A0 docs: iio: ade9000: document ADE9430 support
>=20
> =C2=A0.../bindings/iio/adc/adi,ade9000.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 22 ++++++-----
> =C2=A0Documentation/iio/ade9000.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 36 +++++++++=
--------
> =C2=A0drivers/iio/adc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/iio/adc/ade9000.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 39 ++++++++++++++++---
> =C2=A04 files changed, 67 insertions(+), 31 deletions(-)
>=20
>=20
> base-commit: edb91bc566576f6664a3efbad6bd4205aa1d5259

LGTM

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
