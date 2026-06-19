Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AFA335BDB
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 07:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781854821; cv=none; b=khI4IzD4OsJLwWmcnacHh7r9Cx4OpTwfmub15BFwTEBAOka5gG9g08bTkjITfp0NV7E9/RgUuUEvcNrngp2Gk2S+XNutfiHLj40Coc3NEN5g1o0yqpv9mBRfDrSOmz+adfWhIzmUsPCYQeaiNM56TUaBFg4W0n//gUtaCsU86LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781854821; c=relaxed/simple;
	bh=c7x/XpbPG2XGf2qegF/oPNBop5Y2r8FRIEy56lES51s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k46VYIQjvBEu5rlG/Q4u2PW/Y6kGGSPVgYPzXmGC0vKBl0RYYX63FiuKRzoEM4mifwaYPxCdVzifti4SdvqTsE1GjWRhhnFAfpGjIDwT9fWVRM+Ts6VS2EGJ4lSyjaLVSuh6y1TbBDrBZhXkcVKx2Onj2FS/GyxMYm3IGZrBi94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DKbSzz21; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DKbSzz21"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso27580845e9.0
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 00:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781854818; x=1782459618; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4qbPpfXKjwWf+Dt6pjhae0Fsogba7Qsk/94yaXvhXg=;
        b=DKbSzz21mf+YRZYjAVYXGu7m8hF203gYsitXs5ovBe/koNOUCEsKABDglTSiWOxG95
         1XJZwM+h+nxNujVI017vPg8BLmPyLpL9iSK0bqQJX90NShcZ8SFV6zcjkxfVTH9pCNvC
         07qcr0f0q2uS+E8bx6CuUhyFCAowoWrJ0UxEjaP3Y6crJ6Qzfdbvt3vUWR50fUudzWmT
         Fc+KdSS4XYPTMcvrCV2sVb7nFAd0jUaDIS4i6ywx08Dz8k7OhvmpIPgPnSfQTyMPrynW
         GG55yERqkAex+vpRA2F+UP/VAmT9XZfZSS2Qfiy9pvrpoTQGUNuLaNz5EKVgQ4T2uiQj
         J5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854818; x=1782459618;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q4qbPpfXKjwWf+Dt6pjhae0Fsogba7Qsk/94yaXvhXg=;
        b=BQg1YWvdwgo9vmHz1QrKkn49Nop9oLyNJqZ90xe1nBIwL6OjObA//OxCsUJlpzKWLh
         uVr7IXj0sOMZNzq+yW0LPFjO9OZs6Fd0scqAsFKM81HVIVgnf/gwOS1J0/+smGWCQzsa
         LZBCLWTt1uE1gfnFR7MXdGfbT0EAeN7NOK+UeIHd2jKLReO98t87rOdjduFemU8+/CKV
         wxlduIyhYczAhtAullSyX4T76IFTqCC2BX8tgJP3A16TpBbPg7vD8UeQQUXlaMcn5jJO
         mJF6uuHBoSYD2876a05BrcZU9ckPbii9z17ycRJzGc5+z8HvQXIjGM1xCZNBOVVa22gc
         cqHg==
X-Forwarded-Encrypted: i=1; AFNElJ/OSEOqgWLd7SissJs0sNxhEljX/wf8CDY/dxGOXhxUo4GJ+1S7n4LcYNiRSnZzj1y7QMwxUM8oBEjc@vger.kernel.org
X-Gm-Message-State: AOJu0YxAy07XMSsHHgk1F+FRYS7aYGHpqxAt4S8seCrBgRviNgnZL2Hh
	GgwpL0rBuNBg0JzPoivkhKABFGe72Yljpo8F+OPoTI9RJeeAX5VP4JXW3yH8o6p2A5I=
X-Gm-Gg: AfdE7cnwesI8a/th8xLwwixn1J54nSXc8fatyRUqwhaqMzCXLxAHCffbHQ12enlszWR
	Tm4xy2aDulynYdDN+qrs3Jd9Q8T6o3PtQdGCoZWppiSryzQcf294MEESbUtG5Jd+bdi3RKFAo+d
	QJ7w8N494os0JxjCRQCEuquTOj+JAHrrh87U1f+kSfJA1zqUnseaFwFOAluAeJhiwtKkAaWamIt
	Jiw9LmdSYk3MlmAuDMI1Ym2o1oVjQr0FD+Rs/nxfXLXE8sXuTsVe2vCLuF1xyU3UagTLLnrxcpE
	KGbb4XRjKxlZb37loTloydjFOwEdKwSafRmHfRFNpPF+PsnQp5HFzVL3AwkoZp/AzL4pxggeJMa
	4IURRVAiIOrSbEGXf9M8vJIWhSYe5s8vXmWC14KiRHUUzvAyNGYKOFqpvWP5zARx9rx9hENYW6t
	FX5LsNiUDXcsg5KPMad0VQnQ==
X-Received: by 2002:a05:600d:4448:20b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-49240a09f71mr22313395e9.6.1781854817768;
        Fri, 19 Jun 2026 00:40:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:95ed:eac1:5731:4e21])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4650bc422c0sm5324812f8f.26.2026.06.19.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:40:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] clk: amlogic: Add A9 AO clock controller
In-Reply-To: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com> (Jian Hu via's
	message of "Thu, 18 Jun 2026 17:49:10 +0800")
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Jun 2026 09:40:15 +0200
Message-ID: <1jwlvvasgw.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 18 juin 2026 at 17:49, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> This series adds Amlogic A9 AO clock support, including dt-binding and AO clock driver.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

A part from the 2 minor problems found by sashiko, This looks good.

> ---
> Changes in v4:
> - Drop CLK_IS_CRITICAL for ao_xtal_in clock.
> - Drop CLK_HW_INIT* and revert to explicit clock declarations.
> - Link to v3: https://lore.kernel.org/r/20260610-a9_aoclk-v3-0-b7592d6c31e2@amlogic.com
>
> Changes in v3:
> - Move COMPILE_TEST after 'depends on ARM64' reported by sashiko-bot.
> - Rename i2c3 to i3c reported by sashiko-bot.
> - Reword the comment describing ao_xtal_in's flags.
> - Use struct clk_init_data to describe ao_xtal_in's hw.init.
> - Link to v2: https://lore.kernel.org/r/20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com
>
> Changes in v2:
> - Split the A9 clock driver and send the AO clock separately.
> - Rename aobus to soc.
> - Use CLK_HW_INIT_FW_NAME to describe clk_init_data.
> - Use CLK_HW_INIT_PARENTS_DATA to describe clk_init_data.
> - Use a9_ao prefix for MESON_COMP_SEL.
> - Correct duandiv name.
> - Fix pwm b reg.
> - Link to v1: https://lore.kernel.org/all/20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com/
>
> ---
> Jian Hu (2):
>       dt-bindings: clock: Add Amlogic A9 AO clock controller
>       clk: amlogic: Add A9 AO clock controller driver
>
>  .../bindings/clock/amlogic,a9-aoclkc.yaml          |  76 ++++
>  drivers/clk/meson/Kconfig                          |  13 +
>  drivers/clk/meson/Makefile                         |   1 +
>  drivers/clk/meson/a9-aoclk.c                       | 488 +++++++++++++++++++++
>  include/dt-bindings/clock/amlogic,a9-aoclkc.h      |  76 ++++
>  5 files changed, 654 insertions(+)
> ---
> base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
> change-id: 20260603-a9_aoclk-bbf531badc63
>
> Best regards,

-- 
Jerome
