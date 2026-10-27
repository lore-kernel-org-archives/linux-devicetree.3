Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793126696;
	b=EAuqnaqXmyLv3m3XzHyql2+WZ03YsYqXqYs+PDj+nLm3HIqZ0OHbLDQgoiywUBQl/SAG
	 CO7/YpW9HCt4JYDjVIud6maLARa/7GHvTWBi0Seq9hIb7Iss69b5uEEQgGwYshsnsu1YJ
	 /nai8aYlZQ/y8yvp6etOS5LUxlMDinNaDqTd4o0QMdF6q4dENQBcR12Qvti+1yoFkPmmb
	 e+ZfUkPgDYe6koXlKBNkJnl3cNtwjDb7AResp/cwBh7TXuiHIIW9HF7ZFEefInSahWgR8
	 he7FzLTpqDtlGiBU3UmZcqz9tl938Zp+XGOWCYvfmdVssuk8ZxQoyX1LiwdTt+0zARw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
	b=3HZ1TxsyCUNmkT9Rn+Z/m497mv6LOrAB1j579PzwYbDZm+2bjV8x5wYySSdd4X3ZMjoA
	 hAM7LqpxAow51z7sVupUzXbWHMw2QUut0sNcY3tMb8+CfxxnpgU/VX/thMqppB5rN6F8Z
	 Hqj0liZKYrdkE0epmDYWArA2xvL2DGfS5fegyjL6VHBRYmhu1H5/2OkTSHPWceRqLDdeA
	 Hr9rrt52fqDer7IGqxZNBVBsiS8rLdCLvCdq4pGah5DFap3ZUC0Sa03k38k2R2nMo60ZL
	 pDWq471NT2UDpbCSkwzOu6rT3n+BS1zeQ8XdPf2cE7Oy/Y8pgJ/PwHT8tED3f+xP7/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZ9Tmw7X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681DC606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 681DC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZ9Tmw7X
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso333005eec.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793126695; cv=none;
        d=google.com; s=arc-20260327;
        b=d6tNstoNAAr8Q1f5yIRxAX1J/sGOkmMccUXcME31NG5B7haTguYqHF0HUPI2jDcAEu
         qkEjmD3NwUS5hoyZA7ZGoUw1mbrbWqw4Xt8GDofDlzWaI8URU9BExLI53ahw73h8XnTQ
         RZ0clORICls+Av4YqbISPrcLerLyn8IDawfXnvcsi8p8OQzCb1tgck6et7dRnAaj3htD
         mF/FMCxTOVKYWguOPSAaObCNz2oDOAZkiE7tAqn58ZrVrjzPKM+7bvC2eowdGrFm1Aq9
         zxknj3duabRrG7cTbXB0ay1wuxzxxNuQxBRNfMJ1z+KN0bIAqNmD/vsunGFsgbCdsUjQ
         EadA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
        fh=82UxVNmrQTErOa4oUMk5cBuXpuXzllZ3oPoiaI5gZEw=;
        b=aO3yny8Kg0IJD2hmNuJ5UYMvgxViRdi5O4aF2jyDT7kT6xI4DA6IkwtJCWcMDqTFMY
         9Hwcgk7W1p6OfIC9r75X9G2bBngBP1/IXbhZ8dWdnGzQyggiXLYqLtu2cOlGtjKmXTph
         qG+ZNTYI2k6FbC5N91/JAzc2Xio5aW3uBbuM2Gl+HLKN/BvT2iB5PBW3G3J5xh6kbcIV
         vMvDezn1ZO0T3GnhDsEDFkXg7puR+n++hcKqzrKD2ZDnKtv4i2pl02xdiIUvweY0TrPF
         OizYb9YED41XuIY1jTphinO/2R2bQuYVwEE8LM+NGyzG8GdyY7o/WQo4jOZVOgV14HAT
         Iu+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126695; x=1793731495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
        b=RZ9Tmw7X9onYeXIfmAJ7wd3QPCdcDBD4paScJ30dfXx3BWGyoV/6iQVFuzt/zccTjD
         /R35Yw+g8tOlNVl9zG9vBSMJgjxM/01FiXo4i4OMwmfBWTkYxrwCTYp23TJhNnIZrNUl
         5Td6Blf2bHUxOSbtHInNeN2TmSkk/7hRDPWcbGC29dn8i2aJUskeIehrHrFKYXyCVFqa
         ChvsxSNNwMjawkbG0F8uJ6EhS+Ro7P32dpB1Tr1pYwVglEU/MTXh2lSmWArCdzF1Ufqs
         8fXSzdJJ/apgn4X+SdnXZz/JC0H46gG4PTYJHNOcuPBLOwpeR4FONKL3Vf8zqXYbDJsv
         Ym1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126695; x=1793731495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
        b=F1e89k4R7sR3BZITb9jGIpPKo62hhtviBWpxJ805m84N/Ciye80exSigVJSpcblzvP
         vVYk3gs+nsf6WKMFjN9boXqax9hO1iOeQwjYK2cQxe9aEuoXir+RVpZ7TGsWwYRGRlS0
         JBZgWh96/pwsJ3u+VsXfiWZAcxRlHXcA8rbmkSih4DXjrLzaodDKMjIm6SDnhRpvLJZ2
         iP3oAvFUZLvWi8EBrGoSZp2N5OiILGxHJoxAsa084/nYR3K8pX/t5h2HDSa5lnXzG73+
         LLvQbFH5/qxEZOb+xr4HNDd3DND6cCI0NCP/VpcPh9Wl6ZrxhVHU+J5vsQVDfPxUdc0q
         fDVg==
X-Forwarded-Encrypted: i=1; AKwUvByxk5iRaKWS8khzjzi9gbAx5/YnOkDvnoaB44XO2J6WU4HfK4KYPEGJY1+YrqCN4FDkGxM4H/u+Zzqn@vger.kernel.org
X-Gm-Message-State: AFq9FYIrOdzWgoL6S6lRFNOunTahqOiBOL9gAKmpd62UgciAH53dwsXv
	dzv0OH+eY5OKTrnMruvJiDLIM6LBPApLW1sTjVOKyttZC7GG2PATVVM04AVvsL6w0j5K/wbbJma
	ECHqieOoKz94Vc5AZaK7XStKaRE0jehE=
X-Gm-Gg: AYBFou35W2AsNIEJ47DRjKiBxsKzUMz/X9YOl0mcSpGzcqqmvCuEu49MEB1y3DND0IS
	84dIpzIepBdRB0ywqGLyIV97NxePzpMd/I/2mqu7dWeuBwsj90ekQWjlT80DXkz6+CTbDCh0hkF
	GDJSmPCpIfdiRqu3Aa5yE6YpuLPPnUbcaj3iQVIFugW+ogrApwSDAwVTyYSfOGNIHoRedWfBFoz
	Gui8I42xnCWWNuxw8VPb5TLQKw4mpPVlSKRBl1sJD/SIx9iIk6lpEKxSPke92ZflIu4eBeorW5G
	uo6Bp49h4opc6j5zAMNvVnE6e2R+n5zvaO0vahyW+KL4nAzj5bmE+I/i8cjcAzVJ0yWxuf4uGfz
	E9uCo5FF/+DwfFf6fIOfWlowU3VBWZ5Ns3JOBYh/5WxG9MS9nQ4BnbOt/HcH6tJOGAF0DKngc9H
	kogHywnScwF4Nvzw4=
X-Received: by 2002:a05:7300:c88:b0:369:eec1:1d7e with SMTP id
 5a478bee46e88-36a2011245fmr748593eec.11.1793126695515; Tue, 27 Oct 2026
 11:44:55 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027120019.93611-1-clamor95@gmail.com> <20261027120019.93611-6-clamor95@gmail.com>
 <179312433904.199157.3178610408209114840.b4-review@b4>
In-Reply-To: <179312433904.199157.3178610408209114840.b4-review@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 20:44:44 +0200
X-Gm-Features: AclHuK9YRoKNp7VL85UdMjrZOorWmZTdr54Qmc8Jf3CO54OLWmTMK4fUeFsGC7k
Message-ID: <CAPVz0n3MXT7_h6_REqcyayC_qyi9xXLNUjJLPzeyACFipr=TMA@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] ASoC: dt-bindings: wlf,wm8994: Update
 #sound-dai-cells property
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, 
	Leon Romanovsky <leon@kernel.org>, Animesh Agarwal <animeshagarwal28@gmail.com>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:0=
5 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> > The Wolfson Microelectronics WM8994 codec provides three DAI cells.
>
> >    '#sound-dai-cells':
> > -    const: 0
> > +    const: 1
>
> We have existing Exynos users which are validated with 0, this will break
> validation for them.
>

Yes, sorry, it should be enum [0, 1] my bad, I will update in v2.

> --
> Mark Brown <broonie@kernel.org>
