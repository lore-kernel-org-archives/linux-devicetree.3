Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8DC43B49C;
	Tue, 11 Aug 2026 11:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786447744; cv=none; b=KLLt95KukVSNzlaIsw8IOVHwcNw+ObZk2p/tiAoxeKJqGU19f9psybY7e8dBha7WIiTW6u12pD8yaFub5tFhywCIdbImzmfvXjbqk3fp4nE0PtJEbt3oy5KP/I9mJSpQy8GDM7hARxTlICHBXIQTTt86upZVePVYosguHPYFkEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786447744; c=relaxed/simple;
	bh=EWJ/ZPvYic+90tEKmMiVj9PRqVQxfWtvUHWmgIqisH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MITkKlXPF8Xn/p3QSsxw7dRqy4Vu90FdxsMw8ek5E0xvmeFTrAhEvICWHMzS+dpJxec+pGVVtgIAj3eRjh7Q7tnKhc+PXdwVb030EjPVGTJv+p2FJXiYBVpZfgdzeT00cROwpM0DlKsut1beYZ5eDW3vQCvk1jltZdbse2yIv2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCsUSuF9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCsUSuF9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B371F00A3D;
	Tue, 11 Aug 2026 11:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786447741;
	bh=+ReldJ+REYWGNupKfeUWl5cKXnWwXpHp3Exfh7zUEhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eCsUSuF9fG9DHiEW/J4WSRSaKMwo4oFhVcQdalX10eEgRCEdMVbjWTFxIUbYRbqky
	 CviPL+udHDfqP9PRRXQMZdUYFH5Xagzmb+nXkhefIhoZoIm9hfu1MZVLWU55hX5drW
	 Nbz6VbLWNZitWykJBv+BPL0pMMb8YJ+I1MPYpDUIwbWKByvjALng10Xajjmb75N5qQ
	 DHDe/Msm6OirBE97dMCDwEowzkVKHBN3Tq2i7zJp3rD2C72bWiActWKa0wVg17K18+
	 MDmjVa+f9WpHa0xc0BfXbGqiF5dKp/M+pOoVmf6Lbt0MAO0o0tLXNuAvM54jmOUVYy
	 S4y2FA1puVZUA==
Date: Tue, 11 Aug 2026 16:58:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/5] phy: core: Define TBT phy_mode
Message-ID: <ansHeYjQASWGiAfT@vaman>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
 <20260730-topic-usb4phy-v3-2-ccf0f7ea98b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-topic-usb4phy-v3-2-ccf0f7ea98b5@oss.qualcomm.com>

On 30-07-26, 16:19, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There exist OS-accessible USB4 and Thunderbolt PHYs that need specific
> configuration. Define a new phy_mode for them.
> 
> Currently, USB4 and TBT3 are defined as submodes, because they're quite
> distinct, most visibly in the electrical/analog aspects (slightly
> different frequencies, timings, etc.). This results in a need to make
> the PHY aware of the actual mode needed (at least in the Qualcomm
> implementation, but I believe that'll be a general need).
> 
> Newer versions of TBT are basically supersets of USB4 with higher
> host-side requirements, so these are not defined. This can always be
> changed as necessary.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  include/linux/phy/phy-tbt.h | 14 ++++++++++++++

can the file be phy-thunderbolt.h please.

>  include/linux/phy/phy.h     |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/include/linux/phy/phy-tbt.h b/include/linux/phy/phy-tbt.h
> new file mode 100644
> index 000000000000..5f48059814e1
> --- /dev/null
> +++ b/include/linux/phy/phy-tbt.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __PHY_TBT_H_
> +#define __PHY_TBT_H_
> +
> +enum tbt_phy_submode {
> +	PHY_SUBMODE_TBT3,
> +	PHY_SUBMODE_USB4,
> +};

tbt here is just fine

> +
> +#endif
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index ea47975e288a..26a91c070f8c 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -20,6 +20,7 @@
>  #include <linux/phy/phy-hdmi.h>
>  #include <linux/phy/phy-lvds.h>
>  #include <linux/phy/phy-mipi-dphy.h>
> +#include <linux/phy/phy-tbt.h>
>  
>  struct phy;
>  
> @@ -45,6 +46,7 @@ enum phy_mode {
>  	PHY_MODE_LVDS,
>  	PHY_MODE_DP,
>  	PHY_MODE_HDMI,
> +	PHY_MODE_TBT,
>  };
>  
>  enum phy_media {
> 
> -- 
> 2.55.0

-- 
~Vinod
