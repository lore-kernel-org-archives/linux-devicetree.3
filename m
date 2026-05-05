Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEE73F7A94
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998219; cv=none; b=PMJF+jECdCm8qj3hlKuuedDu6Fhsuc4Z6Kc88oDB5UXd3aj3+rHdm8AZGLZm7bbI0OynF7LC09rxulVWH+mEIk5DN5Hzl5iiZdDnkzSFDwSognj8QqS+FSaaPmj77YjJgqGnbF88ap1HbBb17aEf8zPzUtGOsZ1KRwJAiYykQMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998219; c=relaxed/simple;
	bh=anPUf+K1f/VrCDMAp1BHNbEjgRlzyjFTp1BJcYqY0fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t0adpqiQUd/4LEclSuPVXFR5EO2IwI0HhzQIrhPpRtnsJBrhNgz4X4mxJ3xRxWEN5r560OebePZShRWnEBLuBaUtBa2ZNoL4upGqc/Qr/5a2rbCXQs8OrzJvQuv7DAOOAOuYic47Tk+jb7pG4GuPnLeBz/lgJt0rABIaGLmVD30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSFzBd8z; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSFzBd8z"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44a14580111so3478787f8f.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777998217; x=1778603017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApEyVbHibMfUXEFKd8vG2mJSusEJJaisfPMffm8l//c=;
        b=iSFzBd8z8TIrq+ZAVV6eIKOkh70SvjZVUCMIaRvrl2rPsA3bpZqBClINnN+mg5sbL5
         5TJWVnNmrPUfcU/HnuV02+vSqv5HU+TzjI6gTC0JUwG/Agoar4RdvvfN5phQxJPkXHVr
         54xAe+0ggbJfga3XJLeMKmWNXiR3p666FEj/hy5dD/HelljNqVLmu8U0Q2FbF5s8/BFv
         yRhs8sOrjqkbtqo3t/xiMDB/Vjdig2kzfIOUWssouFD33JsRzrrpoQ7ku3YZfd0GJr8P
         M9/p7MVcpj8HGSKiND/F6/doCPJ/jU77VUNZS2w2AHAUQfB5NmFH7DrlDITTMGzhFDGC
         7Jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998217; x=1778603017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ApEyVbHibMfUXEFKd8vG2mJSusEJJaisfPMffm8l//c=;
        b=ntwEuJdGyiJEvAr/kDOpKck5lEkhkbDPUvRVzFsH/pq25KVqRHPf8n/0iMuOGuCFAK
         rYF1T3KkUEpAhLGvSl/nbkUB7/sV8q72eWGDfo1zbE70eBJsHGvCMH8nQ1awKtne16/9
         UijJR1iHhRB2RLqNTN7n6jt5k8XsnurPANTAKfB6/QWToeCmoK7RMbd6BEpdTPgvpszo
         MiuXpJeRjBnKIfoeCXOfc8VH8D75upcKuD5Wb/rA+aiw24mPCPMjFO0cCBp7wPopVOoM
         TQFFWfTGxqo0iVvOVhY8xvp8GUdvvE6Wjs4Ld/a2dBN1eXJk0He0iLy3k0pH/TSq0u1u
         jPdA==
X-Gm-Message-State: AOJu0Yy+GmIM2O9YObtyG29vwlSuHO22Br3yS4sQW6V6ywKgQbWxImRa
	0apCHYkAWGKaygebP0BKxo/bwWI1AzxMFsb6tIdvQTER7pii5cpSjR2/
X-Gm-Gg: AeBDieu5vhDEqHRfQGu888iJpbqG14QX5x/2t7/9YHwdLfCywmDcR9Vur950hzNVeX/
	kc5RSCpICEtZVNNUycxkkE/al53ZZS92fa0WpEL47iUbtqVMaAE0gI/xL33k0lJIg7D4IHgPZ7/
	gpUapwbbatuWf79oEjSHoO6T3iC2zw3gP01i1AeeR0QIwAqwFeCFGF7KwdBYGNhsR0oVVZH3gkE
	2lu5iI9SATZvm2gRfL9k4w8BR8EcYACaEk13hIPdNjffwoXn/VRjoGv4MQlzrMp0khd6EGcju6+
	8HqZft2C4uW/C40A2iI0RBOAe9UGWHqgDgstv1v0coaC5i2ISdwRa4AQ8wxtRJo/bdHcwuxv+F3
	9BoVP6Mk4ESWl+ry4evic/J8Cp6OMJjY7v+wQ00Qu5a3w02RASb7lckXNUmGlpq23oRRhRNrggG
	wvi+GRE7SepfQ5Lf+2lX+x7rpINm0GPP+wp07UQ7MXSsBH7uq0pHrlqCcfSe4ZUg8CaCp6tenoC
	WTIjtU4+E2HSo4DuIb1DLSxSDsR
X-Received: by 2002:a5d:5d8a:0:b0:44a:2555:f8a9 with SMTP id ffacd0b85a97d-44bb3c94c11mr24734377f8f.10.1777998216446;
        Tue, 05 May 2026 09:23:36 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03e04sm5934939f8f.21.2026.05.05.09.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:23:35 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: Re: [PATCH v2] arm: dts: allwinner: t113s: enable watchdog for reboot
Date: Tue, 05 May 2026 18:23:33 +0200
Message-ID: <sv5CLRHyTX2Cm45r4DQahA@gmail.com>
In-Reply-To:
 <20260425-t113-mangopi-reboot-hang-v2-1-fd343207a4be@mmpsystems.pl>
References:
 <20260425-t113-mangopi-reboot-hang-v2-1-fd343207a4be@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 25. april 2026 ob 10:19:40 Srednjeevropski poletni =C4=8Das je =
Michal Piekos napisal(a):
> Reboot hangs on T113s boards because no restart handler is
> available.
>=20
> Enable the SoC watchdog whose driver registers a restart handler.
>=20
> Tested on MangoPi MQ-R T113s.
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> Changes in v2:
> - Moved watchdog enablement to SoC level dts following Jernej's
>   suggestion
> - Link to v1: https://lore.kernel.org/r/20260412-t113-mangopi-reboot-hang=
=2Dv1-1-5002cfa6e0cc@mmpsystems.pl
> ---
>  arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot=
/dts/allwinner/sun8i-t113s.dtsi
> index 424f4a2487e2..d3bbed84eedb 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
> @@ -34,6 +34,12 @@ cpu1: cpu@1 {
>  		};
>  	};
> =20
> +	soc {
> +		wdt {
> +			status =3D "okay";
> +		};
> +	};
> +
>  	gic: interrupt-controller@1c81000 {
>  		compatible =3D "arm,gic-400";
>  		reg =3D <0x03021000 0x1000>,
>

=46ollowing, at the end of the file should work:

&wdt {
	status =3D "okay";
};

Best regards,
Jernej


