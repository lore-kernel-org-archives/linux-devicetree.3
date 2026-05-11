Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F25B40242C
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514026; cv=pass; b=UFg5Qsa17pu476Wiu+5+jICCmcF2AY5cOvD7sFGPsmB9G1IFPUpyjm0R5SlQlqBk1INBPDpd4zR/EkjuJefmrEy3lz/pmJwIOiQ9R9sCx+kk8OJmdwd2V3dRB8Xge+XouA08km7U2DCkNx0TNSmftqAcr2+SSKY7s2sV5XM9fRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514026; c=relaxed/simple;
	bh=f3BrIm74DQVGuO3zphgLn5vVBmkdeemGJ9kbeQQE9Ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OP3gqPGrIgWIS7Ru2vuKQUszz6NNuQCckixyYd5xhPA728lnfdLhiVmSIReT1IcVdQwspUoIpfpZIQTRgRhFHcbIbnrT0gziUL4rx8d+rMkjfgTDq7TDsfYXa7qjZXoZW9AYozsNMvmryLGfENmNjfEmIVjwruxf6Tprs9uUrwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRUG5q5t; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRUG5q5t"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so4555601e87.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514023; cv=none;
        d=google.com; s=arc-20240605;
        b=BlKQ8/wypyvK168AQ8qXV87rFY/fmzuPX50G8WUC7S92r0ptro7Q6/w95D+t4YskQq
         cG4tUe22ZPCdEKSc68yMNbYJENpTV7JGoE/jaqvPIqcHLwvp8ZIOWtvuO9PY9ptKaJx3
         xMd+E5OVufDYAfyXVuxJrTw++FgXAxAmngkPZJ25QIazUZMgIS4d5fhtEOuiV/IuJzpw
         jJOLc/XJEEtgmocnAb5it/RC1Ry4+eEngAzbXbRzBA7uE1l0hpxxf8QLWj52Dkg3iZZx
         6atD/15VpIP46PSvVhY+MeI7idEkZYB9r67CVMYFD50pS/70SX9zPAzBqLba2rK7Q1kn
         4Bjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PAa827a6Or7i38QsE/PyyngNqVpUBROEfK8gwXTbCIU=;
        fh=Ln59DWa5KMz3A3iCX9sakJxuQXgEw23CzYdroMyQ+28=;
        b=G9iPUZPozcdEOi5/H99Cg26v66OgehWww6h5hJoEqtY9kt1IkN69FOTC5oOD9IIVQ3
         QFbq6scqMSlicV0qtnV/whbQVHWOgRrPuxzxWupCzkiW0/dqv0NJ6vZIQm/hS9N5WW3h
         hHuOyyrR9W+K/b/i55XH8aDl5vcM8AbTwzQt0EzBvfJE6jVfJD5b5LsY78BLxFgv94wC
         YWt2yjKmT1l5TWl0FwOoqLQWaZlJu4MIKz4NwvQiXaxLg5aCsALKER2BswH24RJYqMvr
         zd0OWGglNrumLQbwIh+0QCoX6uhaqdfKiaVHJj94Zi113T07vj1egk+M3wfnCKHD5YQ0
         X+LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514023; x=1779118823; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PAa827a6Or7i38QsE/PyyngNqVpUBROEfK8gwXTbCIU=;
        b=mRUG5q5txhUbj0WsNzy93v2yOqJx77hwNhgOBoBkJREuYYkPAo4IUkMXAUk1Ns0xRN
         07FuTbItsN4JEI0CGRFDb0h0tbEJTQkBqvNy22vppC/Ypqf6Mg3fmYzcA/JfJxSry9Vx
         Kw4a8AvksVy0KXajEPgkMs70/+sGhO1GmggVneTOgv7CSDiidwSdUEDu5rDO4Xpm4qPq
         nnGkIuw8k3c5Ipy+3km8H2h5bYPNlfblEq+u2P6zeUY/W0eWvTdbiT+oB2iJ1aBPoxCP
         X1tW+E9ufVPSWPYocqESuPqurr9C0VCsHcrXEA8RPPkHRU9YlhxKnBMV9BnThuW2t+KZ
         /JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514023; x=1779118823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAa827a6Or7i38QsE/PyyngNqVpUBROEfK8gwXTbCIU=;
        b=rSRx9kT/aQYceAvMWCs8r0xkUTiZ7DaeyLVxRyPgPmP6H+8G4zPJzvmTnc1cNWVP65
         hAP4nKdiS0z/um+weybXUr1gn2HnN78N3eqJr7vUr8pBRfNZxQaa598ShZc5iZTluDGp
         fvA/SmaoiyXOO7tkX0X9zgMtL8SMmZzg0fpUFDWZcpS+507kLYG0vXY6e1HPAjQUby46
         RFgFYaJpQtcSBBCHFm6LXn3XxI+ymb0CRZFibh+xhaF5d6FgT41QTGp69cpPAi7iojGT
         negUOoXxb99Wm7qo+puXGNtiaqRNmCwNP1ib7qpugxdaFs4ut1du7KGsD+918HaM8rAx
         aQjA==
X-Forwarded-Encrypted: i=1; AFNElJ93Ac5ERNONynPUtt3N+6yCKFI3kDwMfKG/vLWA91sAKLSJ/uIm18ZqOkn2qK/pg1iNbE0KmiKFX02q@vger.kernel.org
X-Gm-Message-State: AOJu0YxvAO5xyksS6m+mZu8mvkfnQJ8qD/J4xhaGnwjWt78jDSUtq1ON
	wO3Bf7FbG4y7+AhhpV4M4567LGCQVpDHoFb4JxHEH3w3qeyohsDT7Jmc/6ipeWLrF8kL6wozBCl
	gjna5BCVuNyKAMRSCATfEEU7+zerCdvhh4YC1RDZYhA==
X-Gm-Gg: Acq92OHxnwUuqWfyE2cpb01P3AIL2t+eUt/Ewpn9x2mwdwxS33LDGIdQefNHAnTSd9r
	ZQVy+kqSRYKRke6AtBUMpuMrbdpZV/dqjYBVY3xlJhsz/1K/SZDxm2YPKI3YFTKUVEXady+ARsH
	6cLjS9OvSZwmH66NY0b2pbTxa1w19FjBxDzBwdVQ99BI7Fqwl9+rVmZgb5+v5WorRPJPatPSp8A
	WllElgiYS/pg8/LZphwWpleC9zsUAryBrz+ATBdP7gkMGEWJxDqGzCPuus4GSi7PgaGZedsKDeX
	/UKMslwk
X-Received: by 2002:a05:6512:128d:b0:5a8:6b81:6694 with SMTP id
 2adb3069b0e04-5a887ce5e99mr7616406e87.30.1778514023164; Mon, 11 May 2026
 08:40:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
In-Reply-To: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:39:43 +0200
X-Gm-Features: AVHnY4LuNFcZPtz7Q0DEjkMyUey5MSZn1HyvgA05S9j4k4K79dMxvsAAv2GCHYk
Message-ID: <CAPDyKFrKd9PouecmpLBy3NEas8dpzyVAk9qD6=pFvwbHNyg2NQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Configuring DMA threshold value for DW-MMC controllers
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 17:03, Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:
>
> In Samsung Exynos 7870 devices with Broadcom Wi-Fi, it has been observed
> that small sized DMA transfers are unreliable and are not written
> properly, which renders the cache incoherent.
>
> Experimental observations say that DMA transfer sizes of somewhere
> around 64 to 512 are intolerable. We must thus implement a mechanism to
> fall back to PIO transfer in this case. One such approach, which this
> series implements is allowing the DMA transfer threshold, which is
> already defined in the driver, to be configurable.
>
> Note that this patch is likely to be labelled as a workaround. These
> smaller transfers seem to be successful from downstream kernels,
> however efforts to figure out how so went in vain. It is also very
> possible that the downstream Broadcom Wi-Fi SDIO driver uses PIO
> transfers as well.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v3:
> - Move host->dma_threshold default to dw_mci_alloc_host() (Shawn Lin)
> - Move comment to document struct dw_mci::dma_threshold (Shawn Lin)
> - Link to v2: https://lore.kernel.org/r/20260414-dwmmc-dma-thr-v2-0-4058078f5361@disroot.org

The v3 series applied for next, thanks!

Kind regards
Uffe


>
> Changes in v2:
> - Remove dt-binding to set DMA threshold (Krzysztof Kozlowski)
> - Add comment to describe struct dw_mci::dma_threshold (Shawn Lin)
> - Set DMA threshold in Exynos 7870 DW-MMC driver (Krzysztof Kozlowski)
> - Link to v1: https://lore.kernel.org/r/20260412-dwmmc-dma-thr-v1-0-75a2f658eee3@disroot.org
>
> ---
> Kaustabh Chakraborty (2):
>       mmc: dw_mmc: implement option for configuring DMA threshold
>       mmc: dw_mmc: exynos: increase DMA threshold value for exynos7870
>
>  drivers/mmc/host/dw_mmc-exynos.c | 1 +
>  drivers/mmc/host/dw_mmc.c        | 4 ++--
>  drivers/mmc/host/dw_mmc.h        | 2 ++
>  3 files changed, 5 insertions(+), 2 deletions(-)
> ---
> base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
> change-id: 20260412-dwmmc-dma-thr-1090d8285ea7
>
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss@disroot.org>
>
