Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550111;
	b=HsoXyp0wfRiMlmN9dDeMz/uv59O/DkiJPNWDip2MKZEFs1W+Jp4jwzUUQISyNZRRBobK
	 1zL+Ov6H2ft81OVje1xZc//MPcsz7Y75LIk8Nxpzb5yo2S/1PxKqrntM8FbbuhaNbxGJ9
	 zN0e4XWL+LDzZB0gIWnJwlkQNsOcESD9vbTjdy37vf1hKYXKtIgx7qpynQwced9HbnXEA
	 Eax6kp5iPamT+/F5QNkGVjGqGbNfbqsFhSBXh/JkQnDzKp+RzGFhr5M/H+5sFccHXSu7S
	 3MIMiiRSkHRikHxkcQjMg3Z0uvFOooBuT2VMwGnh60AQsbPRHRPHwjU+fmlFdrZi4FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550111;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=grUnuBcgp8t+MSOi+H3ID6xVrMhx8VhnciDCacLxfxs=;
	b=o9nDmtsBAD6U4MC80D3Kr1y8YEloMjPfEHi244XR7XiPOwlhhU3bXz43rLFZPdJeDVKm
	 MFOwrpksUkxXnjKuHJ5J205qaYVq7d3PI/PSc3Y+4aGQy8tMXgyVhhzGBcN9mrPHb/uct
	 YqJCqN271nzi95ueZ0CFAf03vNfvtGwlhxAf31jpiJpKNbJV/hNruO/3TmJGPVdtgsWPk
	 cmAupNUyfnJsl3WV7Cs3bULumqdNHL900l6933XVbPVHWO0/+cMinI3li1BdZXJKH4JJ7
	 grCJlv9Iw1dQP/xAlkHKkgmSF2YtobNxCYNCPsuHIBZpXxvmrgmX3RyQuwB4MVvh2UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqzBwZIr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586F2606A321;
	Tue, 24 Nov 2026 19:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqzBwZIr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F54A1F000D0;
	Tue, 24 Nov 2026 19:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795550110;
	bh=grUnuBcgp8t+MSOi+H3ID6xVrMhx8VhnciDCacLxfxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NqzBwZIr1Pg6A41nBWqgIzK4e+hizMaKakN+ommcoqE8FSgoJSIdIy26TcQJkhjhD
	 CTbByepXplY6cFG0WrpRRsegDFzkug4NrSWMurNVoJojlOzKvhgUAIQ2TVmw4lNrIB
	 9WBvC6wpwtrnxzthS4Ju5xSO9ASxGNKlPrMQTMBl0z3aTaWMwXVf4yLT6NG/xqxJtc
	 gkt4jnzHDNJHKOvIdniIQvdxbcda3qnaSnItVe4gn4GAbb8Dq+piBD7thPqQXGI1O2
	 hInqTW8J0LYat7sAtWVe7dNkTOw3bS/vUEY951EC8/+A1wV510CCCRXKDjwb3VSlwE
	 qYpJbQ1HmNmhg==
Date: Tue, 24 Nov 2026 11:55:09 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Wei Fu <wefu@redhat.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v4 2/2] phy: add a driver for T-Head TH1520 USB PHY
Message-ID: <awXrnQVKZBXKsV2c@thelio>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
 <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103081444.1983071-3-zhengxingda@iscas.ac.cn>

On Tue, Nov 03, 2026 at 04:14:44PM +0800, Icenowy Zheng wrote:
> The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
> some PHY parameters exported as another system controller along with it.
> 
> A few PHY parameters have unusable defaults. Add a driver that programs
> them before releasing the PHY from reset in addition to
> clock/reset/regulator management.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Changes in v4:
> - Make exit callback always success to prevent PHY state machine desync
>   with clk/rst state as suggested by Sashiko.
> - Re-wrap some comments targetting full 80 columns.
> - Use dev_err_probe for PHY creation error handling, to prevent spamming
>   the kernel log with -EPROBE_DEFER.
> Changes in v3:
> - Use fsleep() to replace udelay(), and add proper inclusion of
>   linux/delay.h for this function. (fsleep() suggested by Drew and
>   inclusion suggested by Sashiko)
> - Adapt Drew's suggestion on the wording of the commit message's 2nd
>   paragraph.
> Changes in v2:
> - Removed unreferenced register names.
> - Changed the behavior to leaving bus clock on instead of binding it to
>   the regmap.
> - Removed early return for reset deassert failure in phy exit callback.
> - Tweaked the Kconfig item (removed default value and added "select
>   REGMAP_MMIO).
> 
>  drivers/phy/Kconfig                |   1 +
>  drivers/phy/Makefile               |   1 +
>  drivers/phy/thead/Kconfig          |  12 ++
>  drivers/phy/thead/Makefile         |   2 +
>  drivers/phy/thead/phy-th1520-usb.c | 179 +++++++++++++++++++++++++++++
>  5 files changed, 195 insertions(+)
>  create mode 100644 drivers/phy/thead/Kconfig
>  create mode 100644 drivers/phy/thead/Makefile
>  create mode 100644 drivers/phy/thead/phy-th1520-usb.c

Sorry for the delay in review. I think binding and driver dir should be
added under thead soc support in MAINTAINERS, right?

> +struct th1520_usb_phy {
> +	struct platform_device *pdev;

It seems that pdev is only assigned in th1520_usb_phy_probe() and never
read. I think it can be dropped.

With those addressed:

Reviewed-by: Drew Fustini <fustini@kernel.org>

BTW, I see that I never applied the MISC clock patches (1 to 3) from the
v1 series [1] like I said I would. Do you still want me to apply them?
If so, I will fix up the platform data check for usb_suspend_div_clk in
patch 2 when applying.

Thanks,
Drew

[1] https://lore.kernel.org/r/20260507081710.4090814-1-zhengxingda@iscas.ac.cn/
