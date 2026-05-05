Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69B71D9A5F;
	Tue,  5 May 2026 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995948; cv=none; b=cXeqzBaeaAsZ3MVaigqOZ85SMEyJRLxUNRcA/d92M+VdGEwuX82cQ5Piycgl8tDx5cVGO0nkzHFn+SKqgd4vv/meGLyR31vH7Lyp3qq1Mckns2E6/QSMQfXwqN6YrRXKsdvDgsmwLO3nOnnADK6HJ557NgPRJBewDgz4evQLQsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995948; c=relaxed/simple;
	bh=Io3H5cRDi6lIxGPJ6ywue4ZtccMZ+LyJ2jiiMPzzy0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdmN2Tx5F3RE+JhrpSOSqwBWxOzuhDKGjNu3XXgfgrHNE5w8+sSrkn1KbTiKJou4TmKzaQI6+v5OE4oKK0FGLstq3ccWNpCj4iJLxxYreQUVvKIHySKy+cM7lcDBlR4YxhEhptrAsNSP/87NAHyJUQOap+wWqnK9Oogx1BwjXjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvD5dUmL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvD5dUmL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B54C4AF63;
	Tue,  5 May 2026 15:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995947;
	bh=Io3H5cRDi6lIxGPJ6ywue4ZtccMZ+LyJ2jiiMPzzy0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvD5dUmLdck3YbVwQ+saUCNM/UrQqJ/ltP7Z7cxELkyqNDvsWDUOAuljny2uD5d+Y
	 RwYMABnD7GAQkSZnYqY9TWsqygRvidZrC5nH0QG+XPVHMqotCDRXtK8VdGZx6uW4BV
	 kzI3EX/afx0weGJDB19kH99nNKq+YU9TFausm37Z4bNcjxIPPkgzYUc6rUF6PEhxtz
	 /WkucTb8Fl3PJ6pICEuP7cYbnn5pmNdOGVoWTORronzq48XrPsnHCUqTmwycHfFQIe
	 cqRF4Da8Ph4dP+xVjEVNl2JfVrBq27Etjg5jzJBeFoRo+O1f4dMhex3jzRWbFC+and
	 kDI3Hcd22W1Fg==
Date: Tue, 5 May 2026 10:45:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	kernel@collabora.com, devicetree@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 01/16] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Message-ID: <177799594467.2982056.14981232958921836425.robh@kernel.org>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <20260428-rockchip-usbdp-cleanup-v4-1-7775671ece22@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-1-7775671ece22@collabora.com>


On Tue, 28 Apr 2026 18:13:40 +0200, Sebastian Reichel wrote:
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

