Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEB636680F;
	Mon, 23 Mar 2026 20:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296038; cv=none; b=D6fp0siQB1r/RS+rRni3iE8gI6jmNvKF+MNtEtFZ2KJCNJq4PRP0qtBEHbbBJKlZBYoHSkV6D+uQd1DmpRRIn0aeMBVNUxBTt9+e1Jkw4UfXXF6TeriqmDUlQcBpTCoR5r4W18q0BQoei0UefS73YZDNXfUjvxYCpUbOj54PA0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296038; c=relaxed/simple;
	bh=+x9AG17Hp/EBhtYzQohBkV903DY2Vh6iSe2BBxsw5YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nX142YxlCNcvUUeJyesZ5b6mhLZS7/WZg7xZpHl18RsIi29+BASJIv1kZEWRpA4pJCF+QkstxbiXIdXWkwR9rAgdOEDXo+qVgV5HO8xFbyPwoFSRVw7psDhhROvUPsbQG8BwXNiI3QfGTM8HTfZJpx4lMJh+u5tpWvERnqiPIh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5GWk/YU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5GWk/YU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475C0C4CEF7;
	Mon, 23 Mar 2026 20:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774296038;
	bh=+x9AG17Hp/EBhtYzQohBkV903DY2Vh6iSe2BBxsw5YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k5GWk/YUuKdPBeWP84YtTOoDx7rfII8l4iT1yBV9NgYZP2jInEiNUsNQH+ZIy+TLl
	 8PBfxs681Ew0ZlxDOfoxW1DhbnRm6LEvn7KTAF/ZBaTM+0SUsrC8fWv7LDPV1AK+yz
	 UXvCmwWOQGyTxzzDW/O96L/vHXzHVoW/M7plyQwV2aLeLfpIUm/VuiZ4XpmHYZr0a5
	 QJTua9wgXm1AMxQoQHK0DVqvR8syf19HA+LqXHBtHOF0+XxHMBWELgXIwkvM+Hs3LZ
	 g4qBWXPLGpBKp8CRJ4R3EXR2uD0vKsxUcz/I9T+LDQZTq32N/uGlteB39Otu/cebCU
	 D5Alz3WNmVYcA==
Date: Mon, 23 Mar 2026 15:00:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Yubing Zhang <yubing.zhang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Frank Wang <frank.wang@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 01/12] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Message-ID: <177429603690.1305360.6710008166136949728.robh@kernel.org>
References: <20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com>
 <20260313-rockchip-usbdp-cleanup-v3-1-3e8fe89a35b5@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-rockchip-usbdp-cleanup-v3-1-3e8fe89a35b5@collabora.com>


On Fri, 13 Mar 2026 18:57:10 +0100, Sebastian Reichel wrote:
> Currently the Rockchip USBDP PHY is missing a documented port scheme.
> Meanwhile upstream RK3588 DTS files are a bit messy and use different
> port schemes. The upstream USBDP PHY Linux kernel driver does not yet
> parse the ports at all and thus does not create any implicit ABI either.
> 
> But with the current mess it is not possible to properly support USB-C
> DP AltMode. Thus this introduces a proper port scheme following roughly
> the ports design of the Qualcomm QMP USB4-USB3-DP PHY controller binding
> with a slight difference that there is an additional port for the
> USB-C SBU port as the Rockchip USB-DP PHY also contains the SBU mux.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/phy/phy-rockchip-usbdp.yaml           | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

