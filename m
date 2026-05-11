Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57364402B87
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514049; cv=pass; b=cTgIhl+/to+mYpWogx1sRmbwFFGzKWGTbNWbfX/XqDbSVL7wEFoEnu7sHfUcYkmJb9rG6lqJeXfoWDZl/VRmjB46Wd1oURFvN9ml0KYEU8RotuTeVHXKXSMGCtb47lbVl9qnm6lAvomO7mEgTdPCLRjHXEY2FxG3VnlnEMPqYLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514049; c=relaxed/simple;
	bh=iCAqFcT9NX3fZjkDKNrQDg8D+ochKGSkZTc2/qvY8WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWUvHTKdkypNMDbX8Kj8VLsUIQ/h0/e5y+AlKsaQKpj1Ve0E1mgLXEGUEjWH+7qtwRdHMO8uOr88a8EZby3WweRKMuVsTSDVW4YH7HRlNzivrnmPTP3FCZ88E7ZJx94clYI9Xy/VXy8aT4VZuD5UxWcQczd7OxxBmxYNchoXL1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gtTNE/CY; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gtTNE/CY"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a746f9c092so7038826e87.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514045; cv=none;
        d=google.com; s=arc-20240605;
        b=j+xmh25gZdekGWnyZIoBBaWupasK5vMwZl50pwDPpoj70Nm6JJwEutF/Lv3sJ9vZa3
         sFKs/XOVayllt6VSPGulxaXPfyJoLOdPGTj/tDcP9CJJ5i8riyhzLhlwQKvqVh7HfyWo
         8NMvWo8l8wSimuan8/cax9UEXfGUXG4iGkP9GLg3iEw/xtRMfzYymbvug20ae4yhuWKB
         l/Wh6hVtXORcwxXAYgtemkfWJQxUO1BpU1UnarQvgVAgR3aiLWN+QEh++61nnEt1ZPyV
         HEwAKlYdB7CRvUtTLytNPni3HHX/xZMNP/D3lTp8TiDavsuQfXx6C2ttqGEFER+H6ulT
         tlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3JWMhWSTBa1St/FT9EYONC8eNpWkZ18pjlnscArsjYQ=;
        fh=XIroHigwyo/Y6tMCSKgBCZrQcLIlq0IBhpb9stAJjCU=;
        b=OQnTj+NxIAN8l6zXZAfKnjWEXNDaL/aRdLmdkp7Wp1KIH4I1ZX4FW8byAhGvziT4cf
         bZ61KpkQn1Y/JBtZPeAcoYlGFSMYidPsmw/vih8GX5gxx9Ey/Y3J1NngijO+DhQj7ia0
         qUP2vaFt7gc2lOqwxwRLaW2OcFIAi8d6IGA6sIhqSd7YMQzLCpNxbkrZ9+JmIRjf+t3t
         AzTOooXJbPf872zq130oBFjX5AtTJxHHRGL8VvkG9/6mMCoRUUUt6ZSX+mUTfNB2gjps
         ftpXe8RZm3sAkCjaL1Pz2YaWpxHuvNC7kmntI0OJnuC4/Ne1vKnT1Du2OhAbJZmuT4H3
         XDuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514045; x=1779118845; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3JWMhWSTBa1St/FT9EYONC8eNpWkZ18pjlnscArsjYQ=;
        b=gtTNE/CY9GbJFWB/1LsKXb/Wpr5w7kInVcfUuphMLuS/53gvK4+hTQH9ixl7vdg/oP
         XB7SyPGemFLi3xo+Wq6zzry6vR45B/MSaFpHmXEoFGtBV4HeXo1kw6iHHnjipPU3DLKQ
         kv0q+U+LPkk5B07pyUx5P/dx/Dsx5uVcY3I5RDv+L7c0F9LfgfqOwnFihNGoqykti7Vz
         nyV9gPEgrCMFooYKB2BwtV3l+P/OqIwulxh3FyZn29Ms3TBl1dU9VLB2SsANOK1Q9QBa
         NClclIG6DxPy6T7sV/U4foTjBgGU1fV+W0WG53HeWYXAQ1Uj3zx/l/CGeCjHmVlmYbvp
         OrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514045; x=1779118845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JWMhWSTBa1St/FT9EYONC8eNpWkZ18pjlnscArsjYQ=;
        b=dVPuktj0LPKQgke4xKA5hxrbcOF5PAKcdEYgc2fdCnMR4nKUT5sPW4t2elUHfG2nci
         2VE0ck/qnLSDXu6EwjghbIvWWlMwliBXzqTARbaqHBqAY4t86BV8NSJTI+EaRPl1ssHm
         Mt+MPrWQ7cg7heHfAC6uO0pGTOazObkYWgSatOHMstzQOYBes3kwB1XFhKnQ4w0741B0
         lYZla24ZAZEFWz9/NzzpWFTv9x/ElpeOtlBtGbCTm8ighXZ7OCKWA8nyXSRPaY4IcKn6
         3HpQQOoW4pol8RtDIB7C+4IrUTdIQs51XuluM48WD1jpvKUp3lkCnj+hA//LAr1s+c+t
         NVuw==
X-Forwarded-Encrypted: i=1; AFNElJ8/ZkbsAnEVOMqzZtkzgvZBKCW27id5k2RPlD7KwrPyw1/3s2Fiz982La51AddQcmhbGhIWnN7PMXM9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1+FXqgyyfkQwPPSivjP5osa5rEOS4k0rFGIHdBzrbej9dMRLo
	YeVXQiF0Xo1Tby3h7Uuk8L3Vm9zJpR+//beP1T72Vq2U5TMC2UXkCZJrzHPyiKtgikkGzqEShDc
	Nd2jlYVlO2BufgtQuxjfdsILZ+Y/YhyX7qtUPlFcAZA==
X-Gm-Gg: Acq92OEhdzSFU4DXDKwsNTEOaGefOK8T00ZLs6aEAqDkJyTC22uYVNQo2f8U+FJC+xc
	gwIG98Xh1/5g1GjSHvA3PV4Gt5JM7PFp5CZqh121ItgM4a2W6LAkdlWUABshy8xDRTNslxSM1Yg
	cxd3AmtSUry8Pbut5uPB+reMPpOZZ/BvcwxSlhAdZgcri7SWXwpZQN9x/c1MBlRjPKnWvBdkXUD
	KExxydnXhnli+8TedBxZC+OItOOo5FQ4TEcJpSeFy6nZLy485A9yW+SMw1p7UG1R5ghKi9ORmNp
	B/K0DZhK
X-Received: by 2002:a05:6512:1081:b0:5a7:4912:1a50 with SMTP id
 2adb3069b0e04-5a8e0f2ec60mr10052e87.20.1778514045188; Mon, 11 May 2026
 08:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-3-marek.vasut+renesas@mailbox.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:39:53 +0200
X-Gm-Features: AVHnY4LEtYRDfcFkDKKMsfq944FdAC52H0vJFxs1kLbNHgSvbuAlOvG-QOqCQEs
Message-ID: <CAPDyKFpO5RyaSGRZibAsygRcfs_En-TohTOrO6a7dUdVdzcuxA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] mmc: renesas_sdhi: add R-Car M3Le compatibility string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> Add support for the SD Card/MMC Interface in the Renesas R-Car M3Le
> (R8A779MD) SoC. R19UH0260EJ0100 Rev.1.00 , Dec 25, 2025 Notes 7.70.
> indicates that HS400 mode is not supported.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - New patch
> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index f6ebb7bc7ede1..b716a518f2650 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -285,6 +285,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
>         { .compatible = "renesas,sdhi-r8a77970", .data = &of_r8a77970_compatible, },
>         { .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
>         { .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
> +       { .compatible = "renesas,sdhi-r8a779md", .data = &of_rcar_gen3_nohs400_compatible, },
>         { .compatible = "renesas,sdhi-r9a09g011", .data = &of_rzg2l_compatible, },
>         { .compatible = "renesas,sdhi-r9a09g057", .data = &of_rzg2l_compatible, },
>         { .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
> --
> 2.53.0
>
