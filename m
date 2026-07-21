Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70AA435518
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620267; cv=none; b=e9MpD8kUCS+YZ5BLupOKu5yhgByxFwBNPli2+DAqkK1qdP6df+xd6Lmfzma8M0Fjbm7iN7BDeH7HQTn2iEdeuWuBgXPCGAcYL6/ej87szSmk9+hZ53OEIu9ANsIutUAN3JIFZFMDBY4DYTmEv27XvAVHF6zVfpoKXUqtWwCEpAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620267; c=relaxed/simple;
	bh=95lC5/eykRQHZtBvVwBHm3LF3Oc69uTJeDBcA4Dnf8E=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhpbLbmiAPOQvuke30odLElpQJSq2CSt3NLe3qf3M74ndhReOQSIKaX5lHgRMg9HUMRe3pEbmgA3TTV4J1szDGWZp+4ToxQFFhR/yMJeIUHU1wnBSFuAkJiy0B9ND2TJLQgDQ+0IXJEIfCONVamIgwXiSHu2Ua4Qj8IvkX4gxsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMmafIza; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMmafIza"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE60D1F000E9
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620265;
	bh=nLerNePi8dEL7JupaSnMnUET/7GMzvYFUp9IujfWwOs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cMmafIzaw8IAfb0OIryZqk0+Q5sB7ghxkIW7wZUke1lFWHOXzgK/An6jdVSDHlNHR
	 4VmMiOqBsv1RF+Du7eq3C4vNS7rW8Ae3IXxvw0qS2T3e4l58XDvW/kHFsqrqIy/URd
	 j9hYvMWWY5+bM2EisGBHVsUiN+YTFFFJ6wZf0fKK1mpkaWkcfuLMzeO399V7t3IsXJ
	 1HN4JLkZG7fnCgIgpJqQnMbsbpn8u3O726zu5PyEDhefRMVAMUNdf7poJejqpn4Abu
	 lp6Jbjz8kd5Zvr0yxtGPg3TpmoAYE5X3DHFq02OOihqgV6xl8DJ58vQe4/IChyJHGo
	 8clPZmMpF9D6A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c7ef2b1e2so96627721fa.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 00:51:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrqjj9gDgwzI7YJcR4mdvxZvdR/tYaqsJDOjRL9t1x82gkclSpglHX/kMf42mjYAs6gB8GPdTqEWh76@vger.kernel.org
X-Gm-Message-State: AOJu0YwxMUe9113c4JEq9IKdapvW3MDyGxHC7qUUl7OtcWdjpI5kb4uj
	ex5gnoYSVLmj2J82Czs6dgRDsBHIRTI7SMxNuuUmGpAqWU/4VjtIt14vk1mp0RvK28Pu7rzLM36
	ZwqrCLLg5wbPWREd+ZdnZQRLQtSuna+ZHhALCme6+7w==
X-Received: by 2002:a2e:a99e:0:b0:39c:7ef1:a642 with SMTP id
 38308e7fff4ca-39eb27eeec8mr28773691fa.1.1784620264416; Tue, 21 Jul 2026
 00:51:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 00:51:02 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 00:51:02 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260721044005.2882803-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com> <20260721044005.2882803-3-shengchao.guo@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 00:51:02 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me7QPQG1NuDwCVSxwqYXo1PNwKRjnz_SsaKnGJKZ8eG8Q@mail.gmail.com>
X-Gm-Features: AUfX_mx6z1zoh6v8HoYViTG5bj4IgrjzpMe3icxZaqo-oC5IqcFudIubdJzR8CE
Message-ID: <CAMRc=Me7QPQG1NuDwCVSxwqYXo1PNwKRjnz_SsaKnGJKZ8eG8Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] arm64: dts: qcom: Add device tree for Nord GearVM variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jul 2026 06:40:01 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>
> Add SoC-level device tree include for Nord GearVM variant, where a VM
> controls platform resources (clocks, regulators, powerdomains, etc.)
> as SCMI server. It currently covers:
>
>  - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
>    for SMC-based firmware communication channels
>  - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with I2C/SPI/UART
>    controllers using SCMI power and performance domains via scmi11
>  - UFS host controller with SCMI power domain via scmi3
>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

LGTM

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
