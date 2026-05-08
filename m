Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C424A3E638D
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 20:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778272685; cv=pass; b=q3s5DDAERbmZBunNM0b9PUwIMhtwGdk6GMw/yw0bzMvWSD0wYjpRVRNTrMngi+6hm3TpYrfF62sCyMsXL4npUmMlCvUG4qA4uA/oi28LdPEFAAtpbL1TT8YA7ZsP8yd/j15hpuQy7zGf+y/QPCuvwEoLQ8sh4I1zUNALbnlu0QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778272685; c=relaxed/simple;
	bh=cUE6Ho7BCp/ai9M8zfJzJ+ri+o108+0vxPcFWhm8icw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atI6S8NdJe2DOeQDrwYf+rb1UlDWCNDivS+s0/55o8020DgnqfBMUbnfzMAdXoqWnzRP/XcVv7XWZ68/7e/RR8g68KULvO4MV0ZgXrQ7nxauzWH8cA4/DFPonf7GOuXmBqVTuSb4+JmFpFHxKBThO+gvEU/e8uKp1WHl4K6oqtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LYs/xvNw; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYs/xvNw"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so2201298a12.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 13:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778272682; cv=none;
        d=google.com; s=arc-20240605;
        b=euoIxWnYaChC2Mo60hwpiY7FAwNa0IwfRzqGCRrSMmU0agNky9QLgSZ26w+bfvuHbJ
         9HQNY1sy744rf8yaTdOxVOey+SeG/IjYUHdHFr9uUxUJtVDe0Kl+B9JdUIzfRf9QmtoB
         dEbI1hM6MKXNV/YPP+QAEdezQUP4CO9Pa5HN/Q1buGNNzesmUQIkciAWSlxcHX+YivZ6
         u7lKoKj08nUBSZ1ugfr3xOorz7EdlUJhU3vB1sgadZEPvNvFR9IdONXEy1p2Z4AA/Jrz
         9xgOIdEIgidILjksLxd88c/gdUW1eRzieY4ZwXXnlO9hpaEAY1YHHmNH1AV1MkzzQMDZ
         vZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+S9rnr4XEjh/mLeBglqKrf3lduPa4NhwodC8NfyLZa8=;
        fh=kB1HBN2w/NTk2KP++g5A14G1tIHNDTHSpc21a/IL830=;
        b=XUp0y5DzMBXavrELbSlWlSj3qsq3C9ghiQCdrxouo7NIWVedW5chiF5emER+BcRFyR
         IfwqHk84dXGc2MEj3BPTrasJuteTmTJWrW9JtQlVVwyIDu8NsAEOKMw8o0niMNoknlKh
         UedocNxyHiaNPSkvhICs1Mv7xP/Cpv6kdSpTie83RaaUpme3/ACom9cBwif+b3o1nc0w
         nDuLLYdEGl6WbAy8mngVWfiLhU7wW1Ted/BFfddIdveGFZP0KCb50KX2Auld/dMXQR0P
         fh+rdViCGxYTkVGiKjAjufTVFqOW7dWdm7LnG3Qo6B4X5GQQWb6/nK41sA0o7hoHeiUG
         pxFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778272682; x=1778877482; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+S9rnr4XEjh/mLeBglqKrf3lduPa4NhwodC8NfyLZa8=;
        b=LYs/xvNwuIe+GagZNHMzBiSRkER6czAlzWNts2o3fzD58I9FulA+qVrShrJKBTMp4I
         Spzrm1hY1w0JyoiQScrvKmHQVew6YHUIfX86X5/rNQ2uOykDRDB+BAu8gLbZCfSsep0d
         SstG5L/ZEvsd+AkfUV1H/H9FLNO/jcfWd/LrC+C8XBgPqDgFweiwcT8xvzqkv8RPd3lP
         hXy/DeGYfB8Ug/Z8tnIpw8qCVAeHuGfqvngK7iRxHfI9WXJaKQfLvJo1hm/iqcrLuqb5
         7wztpvFdxlxJo7l8+r8MiXchu2WDDjTeTgoAXXDw2DMLDe4r7gkHVwhP2CiaW3IEqYB8
         WlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778272682; x=1778877482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S9rnr4XEjh/mLeBglqKrf3lduPa4NhwodC8NfyLZa8=;
        b=jWoF8tv+cxaGuLvz1/EC+ixqh7YbFBPohuB3HGKdlAHkJknFFggAsB17Yfbi34+qf1
         ExDwyxOiEJHyGgqQE1OskYT2l7KeW78Jmc/lGWtHx9dOz/M7t8lWCX65iqJ5xvDA/MVK
         QPhgWuISIci8cuEbgF30l479/W6kBhiGGNFPAJ8tFeDDtyQOTJpnJuM/IsIfPRr3YyLz
         9xCIgu5i4ajAXWkRfAB5cTtqMcDwlyy1N1ezs8Pz9J1nBYZHarG5e+NsWjPUjX5M1Qc4
         5Ly7G2eJQWN8qRk0Tgt9GP6XijpmvWJusetgp73SIsbpYLE/egDSk/mXAbOdgbRCYQg+
         3o7g==
X-Forwarded-Encrypted: i=1; AFNElJ9Zf/NBq9QRPnJLYphwQji0UjNu44v/ivcDJGmZPy2xI9EEAGkrU5+cWEyHIWgvLcHSiM1SS2CWMof6@vger.kernel.org
X-Gm-Message-State: AOJu0Yysc6Zvk7ZcDV+6lxOZa8S2xwbTzhhoRjn0OwuvqluS+NMufe1H
	JC625NjnbID+odLQTDmJPGjclZ6yfIJwSu1ABpOCI86kzruCIeFgSKS2/na1T9LCU5L2RzlSw6c
	JW9/P+tZWblvW9+dSdVzczk6N1Wr3fFDh9kb/qb7qOg==
X-Gm-Gg: Acq92OGpuKUwhSNyFOUhuqGxO/UxJWx5q0iQc21TgzaJVSFEr5WmVQRKSEqKyY5IpQZ
	/9S0uBEBGvfUpdwDdgcXdiduzwoDD7KCqJ1yFeGdR05kxZ2sojNb4QHqowdbKrNsp783LJ30QmA
	3OG4Wnht6uwf97hAWrgTtLPmc1u1mI9O1qW5bVouUuVlUNkaO36oLSptmKWglf8w8pfVqQKwozV
	RPDZEInDO43lNSPDwBruo5uSLQ19993b18/lRTzc9bik+sPtm6Yw/h+Sk5fKAq0mqXIqEAkckeG
	0Zl4ocVEjv7UoEvCCV5IdD+uLsI4S37i3budu0ULTjFtq1jBcdhR
X-Received: by 2002:a17:906:5192:20b0:bc6:2fdb:b5d6 with SMTP id
 a640c23a62f3a-bc62fdbb6fbmr610270866b.10.1778272682030; Fri, 08 May 2026
 13:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org> <20260430-exynos850-cpuhotplug-v3-6-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-6-fd6251d02a17@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 21:37:49 +0100
X-Gm-Features: AVHnY4IOn6XfXMt1GfjKeoDZAEYNpjk2OjuDq_6-_V8r9mPRx0-T11Fc560W84U
Message-ID: <CADrjBPozLTq6mZhszWz33wMgj9ppE8GDYBC26gkGJOftzqq_Ng@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: exynos850: add PMU interrupt
 generation node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2026 at 02:57, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Add pmu_intr_gen node for Exynos850. This hw block is required
> for different power management routines like CPU hotplug and
> different sleep and idle states.
> Also reference this node from main PMU node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 3881f573ec08..04662b1c5458 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -214,6 +214,7 @@ gic: interrupt-controller@12a01000 {
>                 pmu_system_controller: system-controller@11860000 {
>                         compatible = "samsung,exynos850-pmu", "syscon";
>                         reg = <0x11860000 0x10000>;
> +                       google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
>
>                         poweroff: syscon-poweroff {
>                                 compatible = "syscon-poweroff";
> @@ -231,6 +232,11 @@ reboot: syscon-reboot {
>                         };
>                 };
>
> +               pmu_intr_gen: syscon@11870000 {
> +                       compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
> +                       reg = <0x11870000 0x10000>;
> +               };
> +
>                 watchdog_cl0: watchdog@10050000 {
>                         compatible = "samsung,exynos850-wdt";
>                         reg = <0x10050000 0x100>;
>
> --
> 2.51.0
>
