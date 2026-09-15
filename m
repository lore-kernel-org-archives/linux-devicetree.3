Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE50E3F44CD
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483589; cv=pass; b=VCKt5N2W0z8OxMUT9gdG4oRUxMcJLU/KTrxVJ7lgcpVJP1oOdGqn0hEqZwCG1+Jr4xnn6nK27TqNQUtQKiw5twSeH6XHOG0hgEoHxz84d3Sz1MCpN6r72yi4S24M0CYO+IYJiogP616fSANNhP4NXN0cU6nIHlwp0FFWjHZXsds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483589; c=relaxed/simple;
	bh=IB17BlzL0mRaevlYv9G6gaKy0+hTRBKqpj9qTU+0O94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHwfiATQJYZojWCEatZ8vu5t6k0/eFVbAtEAesCqoZe8IkhHubAp8svXrtG+CK4G8rQ3r5fIuZOObtLLgiKqM/B2HXJ+XIYPWLwlLCsmlOpYJE1/VSc18AqY+q0z2veje89OLqlOiPPE59zKTYZqEM0Y8ECT95x4fyRPEQKjzdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oEvzidqw; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oEvzidqw"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98dfb8002so4519046a12.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483579; cv=none;
        d=google.com; s=arc-20260327;
        b=Z9Krj5le2r8wrUInYo38FTWWzCbTEsEtwd7/k7UK7AkPl/7/OBKqvIjlgKA64lLw6z
         wSuPtfzohPQgNEC6FX8ACzNf66FVLtrWWMWHdsbABFl6radgAmV2OgRYU3i2w/DOgqqc
         3mKmibCTpjumbCoA4Is5gT14k/5g9oHgscR7ZCc9Rs7JGqlpe+M61HYuC5feLOcK/qJm
         6quuNXjsIw6ahaR4NhBK22yWRiljCBnlPVL9xV3VxvTBqLwqIDbA2s1rNfn8XDzLjMH5
         /kaNykQ+xLGg839wXGC8vIKu/ABDEgTsfHMZfmsk9jzemxLkrO4QmZ6d8Gdy10AHBkkG
         qF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UKh8ftla6T0xr8WeFwrWgAx7L88zh6iqtsw9KBnhX0M=;
        fh=vZDkx2dINWmrIdCG6m2XvPIxPB+bl7bV8szzKa+1USQ=;
        b=nDOrJK47QMgH2cP7zpgOaZCbP3xryfRIxgPNAhlvMOfZNDSXZLy2dSdIjRlQ5LWfJ9
         KGpKBJ0Hozp6QObo4J4ALdjxdgLpyekw7k9IyLevnGsQ/qOl1dXm9EW9jIiRRBGsCf60
         +2CDAGzisRFsi6CqTKcoeZFcllANa8SoWkwID6I+JFOcTG3SDxt3u8eH53YzaDdGbSM7
         VULdN1tH1fW/SCRhQJfeFaru4SgmnqvRA+4VCBO90PMPHrrh//dSUBJsy2YT1aRCCOKv
         2skWoxv9DsZv2ouzJE23oLdQ8gKPi9zHJxudLsMR6OHSCEgYYj//tND9f3rs3FqxoE0f
         MlTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483579; x=1790088379; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKh8ftla6T0xr8WeFwrWgAx7L88zh6iqtsw9KBnhX0M=;
        b=oEvzidqwsukw0WQPlBFVQpFzZ4ZYUtjSuti/KYZqYPX05+1v5ll0g1/9wlmgypPFRv
         yyenRv+dw2/ifxXVPnNuL+LdcgepILojZAM6pKhOOzSVKtk/6NSQTsw3+FcwvnkidEt0
         3JyPw2RqWe6NwP1sko2+yab+CfiVpl8MYyftVAevzTTozpwVduyb0V/3zb5uHIgFgI8v
         As9g6/7ELb8cQ7MkIC47ydib8bJxU5i7SdGFLGKqi9hQDexpYFOYBwpE6w/gfQ5TBeuv
         ydZ2a9Xhr1wazG0pjuGpgAZ2/ZCjoNYXjKO//TQgSciRddnwZsnr82dmVM1SMjzEaBUd
         LiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483579; x=1790088379;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UKh8ftla6T0xr8WeFwrWgAx7L88zh6iqtsw9KBnhX0M=;
        b=T227fF31bR8xhoibqvvNBzSoBU/byO0D2oN/Sv0jArR/aWflAR7i+Y5esHWBAHVLn9
         YVOBA4eqfrXlNByrR4LdJk6dzbgNV+6MhzSSyI3G3HAD0ipkf6VohYSoRtb2a7shXeOH
         SAj/8IdMZcFKS2mozQq5PiA+dsRN/XxhR/RakiEDO6ZHW4kz120uXJRGZHImjL6BqM2H
         XxoAjgkGi2xoyQeYsBM+yqPcDLGtD1vU6RbqjBpPWhNrddGreG4irw8Ent2NT/9a8W5/
         8qfTZSvfH7PJZK1JBMqis6wTF+9cZ5l4NqVkkBdkG6iav6lcoqWYAaTtwbMiZMR4p0zb
         Mvjw==
X-Forwarded-Encrypted: i=1; AKwUvBxIhE8gHJFYnYwrQgcydPUIwvl5N97nlmuKAyyxdnHrOKy3GRuNOu0l8WSHgaPVly8Ks2oCaFG5JkQy@vger.kernel.org
X-Gm-Message-State: AFuF++kxK8OMWXmbF30liVIlfVJROupCBNuJbjSJ2asZDXnqeR5w7LA0
	gw3CgYKNPJPo1qUn3SUG8pJlIJlrRksFTeKPj59GTP5q+Wm4zSHra0RY+CN9NK3PJcWeB+fxRow
	alfRhzzS1XNY3s2TLSfdkShIRN2QDo2euD/R5xts5eA==
X-Gm-Gg: AYBFou2y/C1SD4sPq+52e+XlXoHREgRYejvG8FA80Uurjh2GhNkck12GUHNU1pSwKRU
	CdJfqTh/YzXR7za6K8h+2azitxLVfmrCOl5gRtlP56UchtLjMbW6ZLLsjb5/EP9z6vB+FG9HDOn
	1AnPYMScEWeYxmqxgoNjsVY7IHyRvtDeGcX632lLTOc9t3i9PqMHWYxk4kSHHTSO+AJ/DkSRqqj
	9/SI5suSQjY6Bn4KzirZp7hOmT5NEZDKiKAocLUy6gIpxPtPsgpCozy3Z/80/Mig3fqFUfh5OId
	25HS74er/ztz3CyBQY0NyguF6qCvIbO2gjhZJ9qUiZOeSixjMLWl+S2BWx9P4oVb82mKGGQBUpf
	jPuyeeyUlmQjyAA==
X-Received: by 2002:a05:6402:541a:b0:6a9:acbb:437a with SMTP id
 4fb4d7f45d1cf-6a9f6264d4amr4709617a12.19.1789483579261; Tue, 15 Sep 2026
 07:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:46:08 +0100
X-Gm-Features: AcwNN1Wim9K-brFBMXY9henHTcNARzZEbkYderuFVS29rKbsh07RWtUUnTNerSs
Message-ID: <CADrjBPpMdKVmPq2Dzbdt_kPHxX1m6nDczefHNRY6ZCPx3DyCTw@mail.gmail.com>
Subject: Re: [PATCH 00/10] arm64: dts: exynos: Few strict dt-style-check cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 11:19, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Not yet complete, more files will follow. I probably won't re-order all
> Exynos5433 soc nodes by unit address because it is way too disruptive.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (10):
>       arm64: dts: exynos: axis: Re-order nodes to match coding style
>       arm64: dts: exynos: axis: Re-order properties to match coding style
>       arm64: dts: exynos: gs101: Re-order properties to match coding style
>       arm64: dts: exynos: gs101: Re-order nodes to match coding style
>       [RFT] arm64: dts: exynos2200-g0s: Drop chosen address/size cells
>       arm64: dts: exynos2200-g0s: Re-order properties to match coding style
>       arm64: dts: exynos2200: Drop redundant blank lines
>       arm64: dts: exynos5433: Re-order nodes to match coding style
>       arm64: dts: exynos5433: Re-order properties to match coding style
>       arm64: dts: exynos7870: Re-order properties to match coding style
>
>  arch/arm64/boot/dts/exynos/axis/artpec8.dtsi       |  36 ++--
>  arch/arm64/boot/dts/exynos/axis/artpec9.dtsi       |  36 ++--
>  arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   8 +-
>  arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi |   2 -
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi         |   1 -
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  93 +++++----
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 232 ++++++++++-----------
>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  39 ++--
>  arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |  34 +--
>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  34 +--
>  arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |  35 ++--
>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  39 ++--
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 108 +++++-----
>  .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  40 ++--
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  96 ++++-----
>  15 files changed, 421 insertions(+), 412 deletions(-)
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
