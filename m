Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976E5367F48;
	Fri, 24 Jul 2026 09:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886349; cv=none; b=i96frDfS/bDraKLnZPesdxI6eWXLbRzfMO+sf5L838oBhJfEenebvn4lFl28Khu6zJdpJd0Ab77PfoQ7XUDaj1JqQgwASGZzG8QRLLMkYo9vhwJJr9FzcGbqZGSEh0daO6pzFIgGMc26l63toS9CljrMzDGTZ1wFL4ksIyqItnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886349; c=relaxed/simple;
	bh=maZ3U0+UJ3NAMf77Cv9vNrjExKAESa9XxOLNkDWkuQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEqSz3NvhrPYrqq+Yt9I0nDKhF/52VLiVLCqNX3RS1z2C4lPoNOpohKC4kK/1rNYpoA/QILPRmzWrYo2Lp9YqeMKu1f/fGabN7aHVOQWHSFIsuevOvOs6z7WG5iaiu3EcPPnAoodXpP6w8btmkhd/winiPoNAQVNFyw9KxjA2Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmuDKJ7e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmuDKJ7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA911F000E9;
	Fri, 24 Jul 2026 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784886348;
	bh=7c7vhpEup6VOBqUns/9puAzJgpwqbpDNftz2EG8wb4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gmuDKJ7enNtUDQnzQgyDysKdjMH+51EhGpEr9b3ytIpOX17Xw30CpgWE49QGdlz32
	 7L8Cqx4J6yGMDRZhmuVVjSm9mcURmnuw4RW4gttNiN8j/024TB9J/JKCSpL4jo2SY4
	 GWakn7GXkvigsMzpkMysBY9JIgAjd+JQDV+a/brI6fgLo9OKBW8k1o/kBdwkzBRd4u
	 8fOrVrXB9/CXAgqMccyk9PtI9DgnRC+oyxy4pAyagej6yJDuf04avvqL71bdfJEvx2
	 +aib/ZDACXT5O6RPsmQgQH21DB3C9VzkmWDtysFxmWPWhqSJNbaYiQVgd/KbyVC3lZ
	 Tohy/JYo6ej0Q==
Date: Fri, 24 Jul 2026 11:45:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 support per-direction phys
Message-ID: <20260724-incredible-colorful-trogon-9df033@quoll>
References: <20260721-dcphy-rx-v1-v1-0-4fc83c0ccac9@gmail.com>
 <20260721-dcphy-rx-v1-v1-1-4fc83c0ccac9@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-dcphy-rx-v1-v1-1-4fc83c0ccac9@gmail.com>

On Tue, Jul 21, 2026 at 06:35:19PM +0800, Jason Yang wrote:
>    clocks:
>      maxItems: 2
> @@ -82,6 +92,6 @@ examples:
>                   <&cru SRST_S_MIPI_DCPHY0>;
>          reset-names = "m_phy", "apb", "grf", "s_phy";
>          rockchip,grf = <&mipidcphy0_grf>;
> -        #phy-cells = <1>;
> +        #phy-cells = <2>;
>        };
>      };
> diff --git a/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h b/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h
> new file mode 100644
> index 000000000000..60f6630f58b3
> --- /dev/null
> +++ b/include/dt-bindings/phy/phy-rockchip-samsung-dcphy.h

Filename must follow compatible or binding filename, so this is
rockchip,rk3588-mipi-dcphy.h for example.

Best regards,
Krzysztof

