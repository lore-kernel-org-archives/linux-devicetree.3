Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829855;
	b=4xScEEG841pBiVlTJkZNldLCRvbrA4E7oYbSGTpBiQiiH9uWsZeEaVjHFiRYr+9A0FQi
	 38b3QjN5oNotaAi5j8irVcCtelfwq483zJX6YNO573sziWP6tDSF1OTBiz7vWPvhu+Z6D
	 co86MNkr8nlDTHNzp+7/SDKr3FK5paV98CNB0Wz7hg4wkAgdU2VsifA9mMTuer2ubBgCn
	 2TbEjTQD2oWC+xX0SdR0h/kmzeKlQmA+3yfyaDWiPNG4Lq+CA4YlM0TUf7GUm1044Y9Ds
	 rCBekfXngp/9vM3A3phVoXMxkW3R7GNQtQel1gmT/udN6FwcYN9AW+maia3lTIAIjfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
	b=H1oeaz6I8GUH6VMdCDvsHJeeGUx5kV0p7qqXvUZGl+2MwKEzvw5+oUIVsJw116hsysiG
	 S3jnSwZ2yGLk2WeI0bYCR9s966BALvLWDyH1fhR3Q1cyG2cA6qZCHNQzCMNpCy3DFCOrB
	 T8uLmwBvWRn2O4IS0i5b2emxpXn9VvjepV0xshNiHBgQCwkAQVhPBoeJFNWhEQtXvXs7q
	 SFGIc2N31rqu2uKRl2o91CB5GQfckHCAf/1de79I/SIKgGOfngKQ2T98i/nJ1MqgEUGVP
	 ua241yz+qN6Z0k3/H3IOrBsMl0lntoWrUiiNoyMWPJpQDQYlk5hIA1ABZedwh7aZeQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k059ccS5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4CE606A324
	for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 08:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D4CE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k059ccS5
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1175514a91.2
        for <Devicetree@vger.kernel.org>; Sat, 24 Oct 2026 01:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829854; cv=none;
        d=google.com; s=arc-20260327;
        b=Esgu8MT+mpujm/67NTlmyCMCHw4u4X6JzCbG3HDHTTPGfPT53oGWbMBsVr23wsE1EU
         F84ip4eJnUoEdSFFmkrM84E5MWoD6HudoiX1jruM79FAs60TKd03CjOQhEbH7UITCMXz
         5S/mDLNecKnd4Dzs2ecdp46kA4yYQSBcMwb0sV+duWpYvqy+R2Yq+gOlX73Ib5xd0aRW
         gS/tlEpgB0xThnh6tmyrGKLLZjXzJvtNB3KXcuYdMa6kvT52QjJX+492uf3Qpzjm3DgN
         JI+lKzw2XC32beZUuhuEk+yzNnTDKPQfkeg/alCIQt3QA9GPzDbRSsh5ityDspvIE+wM
         ppTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        fh=ee50yn8HF2RixmPe/xY+G5MgPSOdIgoaEGGLMfxnGng=;
        b=KsTA808RzzoJCm86Dy4ET9dB8On68f5aw82i9Cv8SiXfI55mr0pmncERSBfKVW24eP
         AJJRJG/BfDNDu83Mqn11a4OLNdWROKtdCh/zw5yyW/8DsIwG0baLHoWa2RliF8AadlpM
         cSziZkFJY29di3eFaXcxaEommtNjdOEpNrFCZ6sOaCBUSmV7rSAQz3bxP1PUVdgMmkTs
         OraORlqZW9MZM7v5TnN6TWE6j7Xcl43H1WJbfkamPA/X8Pj8Ew9DwYumXPhQ0ACRjTts
         Biioelwrz7bImpjd6/KotjXyDFtfz0lS5uCDs+huRNUYznv3abgmDkm75g85W1wSd0o/
         DJTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829854; x=1793434654; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        b=k059ccS55T1YaNzStugk5ne3uFifaL4k2aSKrT12fShPJOVrNwIpZsTVvJguE9dBVX
         ygElTWkmgtdIXDyK+7PyNXPPrJ9Md9fuHPq/S6rSCxD0nkfAZFvNflsz/tXuQHDdBLHD
         xL65BHj8HVU1+f0FgiCizf5ZuSn5MRY7FWfjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829854; x=1793434654;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        b=cONoC4CgjBuEs1WE5sj2FLx6VP0RdCDTJNihuIYFwWN/21P0Dn2W0QUjoPqXQyRaK5
         KEoVH8bpZAEV0OrsY12tGMsBg5e5q9/cqR8vJGKC5n5r5EIG+oFgU+gduZf64WRurFw6
         YXIRD9IeNgPRvAHlyQE7l8CBumGMcEOSQH6Ubt2mR+XOaEzi5G2ide+An09rKIe/9gP7
         nSfBTomkN4Nelq1z/cieylsIExB+KtuZbEGw3mCwvh29QwNDi8i3zbl/wwyO4q688wmI
         gZnko+o3eKRV3Q/zudn9LvpLOCHPlqHxdNTU2uVx5bv7dAd6UZCtR39b791/LMUB8Tsu
         PCjw==
X-Forwarded-Encrypted: i=1; AKwUvByN1CRGlWXv4X0tJw5wnyxlPqXRfD26aIoWetCqQJHSVdK43+55CrH3EC+SXhYTeBVX3AnRco6Bx188@vger.kernel.org
X-Gm-Message-State: AFq9FYIPV/dfsPPY+qnrax8BgUSJR7d06g0EhIYGrPCgEzPJkz+MY5Ld
	HApQQ93v0YNGxdKn+z5e5V5A2yUrFBFJRmv23lS/wxO/PApDjIHBXBCqz7WbkcQX8S0ye4bWFj8
	YT4oMQn/LYUbm8D0aA+5960/Wvf5PRdwK6Oem2S8V
X-Gm-Gg: AYBFou2aYIfIjKTplBk7IRDMRfG5a7XsAR6vKIN5BeTEUcuFtFdNmjA31TwrNe9bxss
	Gon2m3GHyq59ZyDCQIubmMHKXAgR92CaxEd+UDG3D6g2INCKjJqDNiy0MRxR3YEff8B5+5LD0Qs
	raW5awNkFN/NOTX8u1KuDQVLKQDx8dz/H8XvozXQUniNW1eBKethVpD6axLFhjfTov3jzwAJLfX
	lRG5ugFFUANPaci80HrceqGcR18A7ZITcpSyBPh+6/XWgVJCwS0ppuSNu6U1bHugBssKi3nl7cR
	b0mNegy/wvMuKHSsI/PwV/ch+vvNSws32Qk0hYaPJW6JqvekMZ7MwL6IK1CUXYEtV98EHySIg3F
	szvP4+nRy+95d62jqem3wYnAHleO2Ot/llW/y
X-Received: by 2002:a17:90b:1fc8:b0:3ad:c14:35ce with SMTP id
 98e67ed59e1d1-3adeb0f4b03mr1215366a91.64.1792829854594; Sat, 24 Oct 2026
 01:17:34 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:32 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:15:41 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:31 -0700
X-Gm-Features: AclHuK_RH6hRiswn7VkHcSfsxk2rWaTJ0grpI4PKmWKFGktw6V3bTGvWs-_Kz3M
Message-ID: <CAFLszTgz66uz4gU6deR_go028R6MhwYuB=Jb5RJ8hqtzb5j80Q@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its
 FIT image script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, cros-qcom-dts-watchers@chromium.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: dts: qcom: sc7180: Add sc7180-trogdor.its FIT image script
>
> Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
> image for SC7180 Trogdor family boards using `Image-framed.lz4` and
> LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
> to be built with:

This says what the file is but not why it is wanted. Please can you
move a short version of your notes below the --- into the commit
message (matching what the ChromeOS scripts produce, a model for
future Chromebooks, helping people who run upstream kernels on
trogdor)?

>
>   make FIT_ITS=qcom/sc7180-trogdor.its image.fit
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++++++++++
>  1 file changed, 728 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.its b/arch/arm64/boot/dts/qcom/sc7180-trogdor.its
> @@ -0,0 +1,728 @@
> +	configurations {
> +		conf-1 {
> +			description = "sc7180-trogdor-coachz-r1-lte";
> +			kernel = "kernel-1";
> +			fdt = "fdt-1";
> +		};

One thing I'd like to check. Patch 4 says the main reason for a
checked-in .its is to have a hand-written description per
configuration, but here each description is just the DTB filename, the
compatible is filled in automatically, and patch 5 adds fdtfactor to
cmd_fit too. So as far as I can tell, the only thing this file gives
over 'make FIT_COMPRESSION=lz4 image.fit' is limiting the FIT to the
trogdor DTBs. In exchange there are 47 entries which must be updated
by hand whenever a trogdor board is added to or removed from
qcom/Makefile, and nothing checks this. The list matches the Makefile
today, but the two are likely to drift apart. Would a way to filter
the dtbs-list passed to make_fit.py (e.g. by a pattern such as
sc7180-trogdor-*) get you the same result without the duplication?
What do you think?

Regards,
Simon
