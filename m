Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393DF2C3244;
	Thu,  9 Apr 2026 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741759; cv=none; b=iBb5EME3yMlKGw/chsQHqdk8YKQq0apuH3AL6WfD4nr5IwoPx9b4zkh8EaDF1OtPPT86AqNf3miord0ckuaCap6+3+oQeaiqR4B2NFKCcZsdfDE6DDHGe3xljFv1JZ32UuABUwtSEhHfXk5ehG4VlXB5FtVxAcxP5rgWRg72LjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741759; c=relaxed/simple;
	bh=qco2yXxLh7vMFadEblrYTLWMRjxvMTuPFxbxg0ohzZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyEC3bAZ6Z2aWcD0J/calVCjjpnqZkWNugkmofvuUtGnurJcV/x59JZCe7zyxYFOEAGJymKAVT0jBj3umd4GOu3u6YhOpvWyKX9nO4nzZPzI035xdd/7isKQbZJpBR+JOeClA6XuMaWkZVhAIMQ8/EfcEqcFwfGAzIToAVZc/Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wApY2-0000000022P-3G0v;
	Thu, 09 Apr 2026 13:35:54 +0000
Date: Thu, 9 Apr 2026 14:35:46 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Andrew LaMarche <andrewjlamarche@gmail.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: mediatek: mt7988a-bpi-r4pro: update
 gpio-leds
Message-ID: <aderMs16WpR9yPMe@makrotopia.org>
References: <20260409131754.121737-1-linux@fw-web.de>
 <20260409131754.121737-3-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260409131754.121737-3-linux@fw-web.de>

On Thu, Apr 09, 2026 at 03:17:50PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> On the official case the red LED is named ERR, the blue LED is named ACT.​​​​​​​​​​​​​​​​
> Reflect these labels in function and set them default off.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi      | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> index 759f608d1081..7f770a76775a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
> @@ -61,14 +61,16 @@ gpio-leds {
>  
>  		led_red: sys-led-red {
>  			color = <LED_COLOR_ID_RED>;
> +			function = LED_FUNCTION_FAULT;
>  			gpios = <&pca9555 15 GPIO_ACTIVE_HIGH>;
> -			default-state = "on";
> +			default-state = "off";

Just drop 'default-state' entirely from both nodes.

>  		};
>  
>  		led_blue: sys-led-blue {
>  			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_ACTIVITY;
>  			gpios = <&pca9555 14 GPIO_ACTIVE_HIGH>;
> -			default-state = "on";
> +			default-state = "off";
>  		};
>  	};
>  
> -- 
> 2.43.0
> 
