Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180675;
	b=RPdU0sFLFOptXQapHJbzQ6l8P3A5Cef8I1lyub1petQLZE7FHLDHxZpL/NCIvZGbQW+Y
	 0lobqhIr9zMzq+L/jVl6yNLFQhmcmDShzCizqHdQWSaecd7hxTm4MRkILc40Wq019b5w+
	 xzwf08TYJFq387RUSQaCPBMzXJ4+DCoKp09GtVsbGX91Iu5ufnNrDbw3qS7oDKFRbFzg8
	 IWPrshoPQSY4hjbPXCqgLHtGJjGdeCSRbHOYtWHXdAThndOgDC2HGd7EBBRogU2u8spde
	 RQr69+h6Ud2PxPdx2p2/9hq2lsRXX+RrALOXMf7ZjsR1yQmEAqdWPNg/EqjwjFSSFHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180675;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=LrdgbXUa6z0Y+LQlvYe3uBNAKemA2wKtujkxyMRCSf4=;
	b=V/0t/VY7iws7j/PPgsSGO1AFJe1RFX/iGEDM0czrA11R4Ww9Qyq2hSJN/HdZ0o69kYmq
	 oObfgMXNt9JOFRyUMjzFrNbP/1Id9lTkdx1iihN8kFxOefG+mu93Rv9ktPy+7+pGnrm77
	 3U6c4GQrMd5o4kaOPA2itAZGcrBYoZCtvptzFIz3cMMB0t43y/CHy+klGTASdmcbg08MH
	 H7rixjozwaL08bYxYCrU5TSasoO7ERcri+CV4CjL7rtQ5KaRmKwXptYInhZUALN30Toxi
	 6rx6j6tm8urhER74MzZe4OZ/gbDqW9aGw/jnQZGln3yUOvANe6xWV6TpzCRK+8ojt2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9Zptmwz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238CA606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9Zptmwz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C221F031E0
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180674;
	bh=LrdgbXUa6z0Y+LQlvYe3uBNAKemA2wKtujkxyMRCSf4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=g9ZptmwzRLs6hFP0ri5PGG/VdS21dkgEUq8MSMOGFMv+llZiFjwZy03nLL6K3RGAE
	 gFWRcjZRVQrIH+G9u41eBqWdRVDsLz+tHZ8K9AfxrletJ8ME5ty0y8BWzJXxAzSmN6
	 C4JY9zJGxt6RKUbQdVqcazolhOePgXfyANE3znaARC6qT8qZY79qpHmGkgDcoLqkaZ
	 CTuEXRS1euNXuQXCCI6N80PByHWzSWR/r/LzzuZIYNb8PXb9G9CU28p0lT/ZFj7ro8
	 eURUyetIdDg4KR+dOp9FLDVxWtZdwCubP6YXIIxy8yUqrS9NIjfpYGjgABhwoKxWLN
	 VHpQp6IoCIbjQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab3dd9670bso5430961fa.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 02:44:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDwPH7wdj2Io+GO7Xt1MPlsyLgQPuxi3ZOjvHCwvElkdG/Hdc44jY+0FEx7pTbji/STtpAKbo+ItIB@vger.kernel.org
X-Gm-Message-State: AFq9FYIz69rLoyh81aJ0Dnw/dr+L3k68ffVO/gnw1lQr94NgCPXDxmzC
	YZkoK3Nm/KtCPIED9l37FOGeDojthIlRvx+ggY3VK2qn5PAw49BR554L42Qs3d6dKYyhM2WokyH
	/fbw0pGtyaBf7mzRpDQ1zPGmRsmqncWClS8gk26TPig==
X-Received: by 2002:a2e:a986:0:b0:3a9:7711:1cd7 with SMTP id
 38308e7fff4ca-3ac9cfae41fmr4295071fa.23.1793180673415; Wed, 28 Oct 2026
 02:44:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:44:31 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:44:31 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 02:44:31 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeK=BV6WEQNVC5wXo8giAgnrjtdROswXF8Py3BMDLZa2A@mail.gmail.com>
X-Gm-Features: AclHuK-TgPLK5QfzM7dwlPZli1UwVXLAoH6m3aWG7qnH8A2NWOyXFwaC5rx4nH0
Message-ID: <CAMRc=MeK=BV6WEQNVC5wXo8giAgnrjtdROswXF8Py3BMDLZa2A@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] clk: qcom: Add PDM GP_MN fractional clock
 divider driver and DT support
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	netdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 12:29:26 +0100, Taniya Das
<taniya.das@oss.qualcomm.com> said:
> The Peripheral Web PDM block on several Qualcomm SoCs contains a GP_MN
> fractional divider that generates a clock output from the PDM XO4 clock.
> The output can be routed to a dedicated GPIO pin for use as an external
> reference clock.
>
> This series adds the binding, a runtime PM-aware GP_MN divider driver,
> and the GCC, pinctrl, and DT support needed on QCS615, QCS8300, SA8775P,
> and SC7280. GP_MN controller nodes are disabled by default so boards must
> explicitly opt in before the output pin is muxed.
>
> Changes in v2:
> - Add SoC-specific compatible strings with a qcom,sc7280-gp-mnd
>   fallback, map the 0x1000-byte register region, and document the PDM
>   source rates. [#Konrad Dybcio]
> - Use runtime PM and pm_clk for AHB register-access clock management,
>   rely on the pinctrl core's default-state selection, and generate the
>   output-clock name. [#Dmitry Baryshkov]
> - Enforce valid GP_MN duty-cycle constraints and report high-phase duty
>   cycles through the common clock framework.
> - Add and register configurable PDM XO4 divider clocks and their public
>   IDs for all supported SoCs, allowing the source rate to be configured.
> - Split the pinctrl changes by SoC, retain Reviewed-by tags, and combine
>   each SoC's pin state and controller node into one DTS patch.
>   [#Konrad Dybcio]
> - Correct the SC7280 output to gpio60 and disable every GP_MN controller
>   node by default. Add QCS615 support as well. [#Luca Weiss]
> - Link[v1]: https://lore.kernel.org/lkml/20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com/
>
> The series is organized as follows:
>
>   1. DT binding for the PDM GP_MN divider
>   2. GCC PDM XO4 divider clock IDs
>   3. PDM GP_MN divider driver
>   4. GCC PDM XO4 divider clocks
>   5-8. GP_MN pin mux support for QCS8300, SA8775P, SC7280, and QCS615
>   9-12. GP_MN DT support for QCS8300, SA8775P, SC7280, and QCS615
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

What is the merging strategy?

Bart
