Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C96B2E8E09;
	Tue, 21 Apr 2026 07:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776755364; cv=none; b=MwdOr/xNuLOtDhQjS9cyQXCpW7vtN0FfACKPRDau6q74P7fHNyGYF+wR40xns/DBGW5+1YmX4Z/9mGOc9Rz0k1aQfHgbBEA6SiT7cvVtAp7NSoeORdRLcO6PcVrkVyu/5bnrLbCRH9Xytvm2XyAa83k4abCqL/xCNaY8k0uO484=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776755364; c=relaxed/simple;
	bh=WPoqfm9NoZN5vEKQb0rOqoe7dINrxuCn5z0liFHeZiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0CF8GYM9eMS461Lz4j/YAPsmj6LsUF/i/IKJTi4Mb15DrXkvMFFoShb2ZPAlDPLO2Al2YiabyIKDhTx1YNAT/0YHBC4Ozis4aQK3Hm/uV/HoXYZFAzJat+zD+LS1iUGKfbpHwpuTPs/SDg3Fa59o6Gi93K5yGUAxhHE8nwoChc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hiBe5E5F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hiBe5E5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74523C2BCB0;
	Tue, 21 Apr 2026 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776755364;
	bh=WPoqfm9NoZN5vEKQb0rOqoe7dINrxuCn5z0liFHeZiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hiBe5E5F+8iLTRXK1YilMqAkr3hg6wdGJZBUeZduozOOoYJ+F+DuPZIhVnRKHEvc/
	 qq1/vyVvoQJ7DLmFkUmXYeQbWrDZ+wEb+Y7AuUdcq6IVv4NCuJz4IzvYOUlCbh/1rn
	 76LSLDyGnSTeiVnjbpfWNuV5MYhVWLWlgWlXQwlY/caXQiiO0HVT0+tYHmY3p2bEOy
	 nbSIYVRI6QYigMc34GZIswlX2ECfCeh5U943ZEU89QTjgrqgKd4noHq+gYRJhaJAfl
	 f9eQWBfBujl+b4dhpFnenfKdPFRHij8qruqSZDcyx5+WfsvJN+8KgfAcfXft02Y4gy
	 tsfYJ1LqBwqEQ==
Date: Tue, 21 Apr 2026 09:09:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanley Chang <stanley_chang@realtek.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/6] phy: realtek: usb2: support for RTL9607C USB2 PHY
Message-ID: <20260421-courageous-rigorous-angelfish-97a51f@quoll>
References: <20260420191941.81834-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420191941.81834-1-adilov@disroot.org>

On Tue, Apr 21, 2026 at 12:19:35AM +0500, Rustam Adilov wrote:
> This patch series for Realtek USB2 PHY driver adds support for RTL9607C
> USB2 PHY.
> 
> RTL9607C is a big endian MIPS CPU which is quite far from RTD series SoCs
> supported by realtek usb2 phy driver, but the phy initilization is found
> to be very indentical in most areas.
> 
> Most of the code was based on the Realtek's usb driver from the GPL tarball
> in [1] and adjusted to fit into the realtek usb2 phy driver code format.
> 
> The patch series was split into smaller patches that add/change something
> in the driver that are not exactly related to RTL9607C and that also
> helps for easier review. That also means, patch 5 depends on all the prior
> patches that come before it.
> 
> USB2 PHY on RTL9607C is primarly used for its internal OHCI/EHCI controllers.
> 
> [1] - https://github.com/jameywine/GPL-for-GP3000/blob/main/linux-5.10.x/arch/mips/rtl9607c/usb.c
> 
> ---
> Changelog in v5:
> Mostly addressing LLM review
> - Patch 1
>  - changed int to u32 type for new_reg_req and vstatus_busy data fields.
>  - changed comments in rtk_phy_read/write from PHY_NEW_REG_REQ to phy_reg->new_reg_req.
> - Patch 2
>  - explained readl/writel native endianess issue in more detail.
>  - explained why vstatus register doesn't need byte swapping.
> - Patch 4
>  - moved reset_control_deassert to rtk_phy_init function to keep it outside of for loop.
>  - changed msleep(5) to usleep_range(5000, 6000).
>  - explained why reset_control_assert is not needed.
> - Patch 5
>  - explained readl/writel native endianess issue here as well.
>  - explained why FORCE_DISCONNECT_REG doesn't need byte swapping.
> - Link to v4: https://lore.kernel.org/linux-phy/20260406181228.25892-1-adilov@disroot.org/
> 
> Changelog in v4:
> - Patch 2
>  - moved the le variations of read/write functions to Patch 5 where it is actually used because
>    otherwise, it results in unused errors when only Patch 2 is applied.
>  - updated the commit message to to point the reason for le32 wrappers around readl/writel.
> - Patch 3
>  - added "Reviewed by Krzysztof Kozlowski"

Where?

Best regards,
Krzysztof

