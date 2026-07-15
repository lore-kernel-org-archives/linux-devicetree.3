Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6A12E11DC
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122958; cv=none; b=Xfog/QLy7mrQ9Ldc4Z0JjL/WFxsu+SmdNemdM2RMzXGSSrwf7P10ssl+ZsT38BCHccvKnU4PaKMS8ASKeAlVVVvd3EY6z8Zsf/rx51cSxtWkFfHPW89UYkewb+93t0WqjPb5X+05VubjewvEgPr6PkKl5B4YLRt49e1q61f12r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122958; c=relaxed/simple;
	bh=SeouY8+arIKaHfxpsLC3GYzhgWKMWeeHywPu9YGbico=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAKKRnlwyKgPNjChUcySSc8mttn1htF/XhQWe5plUmVxowmgICfz/NGmrzyeUuSJADIeYZlajz8dl8MMc4THIaswRqeZkANg9nlwTl/Jid4eT2sR902RbAUzGfK2ndPb2Y5b5egiiFm7Ke7FRuidfj0axlAxVfa7iFopjKb31dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAM59F4P; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAM59F4P"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-471eeac43bfso5379929f8f.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784122955; x=1784727755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Usi+/63I15nYDCwm04HDVuOdljD77g6vUA956fvWrHc=;
        b=FAM59F4PQzRHPeuRzCRIH7/EbHrNXOrN+2UtkC6XrkU1JDAxgeIiRWia9HhG0Taz4a
         GzlH3KUTuEsdjIGlM924hHjDDNhOcZQY2yYxGLut/Cv5nGFDseSM87j/uHYDRvTrtkAo
         mUh0G7RZm/X5HQA2cWXBq2dcP3NQfAYDIa2NhRGl59m5TuySHpneZ/OE/TqD70ag1iy6
         i7QB/fm5Lh231AtdCsu6YAKM4xNZ5mnFmV3tpo6MU6A8U0Yrj71V76iDZyXer6yhVBWa
         kO4qPfFEZx4N/PJmP3Iyz0JznfLrg/pF/oct7a8wP2N0Z4GRzOBc9DxVHWoRW8Xl4Y9Y
         Z1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122955; x=1784727755;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Usi+/63I15nYDCwm04HDVuOdljD77g6vUA956fvWrHc=;
        b=O+3ZJEw8qR/336sqnQAj1DuyWxgMyWdSOAKSlWsQdQQa2Kfvf+CRm2/Av6PSflopbS
         e385QMZuHtxP5pAuDMGARDDteUY3k/+KJkWrrcCXwXb7lI+RGA03a7NWWFii7P0cTfr+
         1I6mX7co7pZADAUMQqB+LNz/lZzA7AYi/M5vove3SvKoep1s7r+YejOTCzUVyQZ6IjR3
         N5IQK05EfNimSEj0NKVAr4A/ohwaKJ+VRqn0jFSeBo3OEVXC0wYBUC6c2CQOiccaEjNC
         5CXBXmqMK5L8wHl80WLdDg5dNO7qDKtUiC088DgslXDzZdepRU1xJg6umOCLG0moBAIj
         B65A==
X-Forwarded-Encrypted: i=1; AHgh+RrP9LukhSzQb4g7KK/EsFcECFy1rOgic0XuKsS7+mfENdw5LnzKFlVayjZXnlZjVv+CkLdS3B7F/vfc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn9mSzWibf0FVTnLJET1r6MganirVgLei3RbMu44+6UPrlfFAV
	NtfpwrnfQHXwS8o9WRHNPTQGAbQ+FQJ8d93M+cR8vG/713yFsKSkwOto
X-Gm-Gg: AfdE7cmxi33GYt2REzHzimUveTDJkoz4xLJsT54oK364amgy9tf/EpT6a7ifOt6hkwf
	0zeWvInDarHLVHxJTIJLMDyIYs6xKf7SqEDknzgrev/1Cr4VAZmAuIlzJRy+d4VKufaJseGhcdH
	dFyGYFOxrum4XOyQO0ovIBuzQdZIh5mbn/EPLzHAhunISH5Glfs0pmqh6WS9EO+ZPELPQgJmIi1
	sI0BZ9AG+Is/OjKe2AEDJVwyVbXnCY4IU3iTi+WiEZJCGqEXgeEbUFzpB9i9Pxam7jt8jTcW5dz
	lI0pa8C1pDyiFXUUf4n8CxsHiu6b09HN+/JfJcJYpT6qHI+qkIN1seZ4vc7FEVu1sQ3tsWMTvLp
	2iSiTl+9g8vhza/9vB1TpO6vKRfZWf9lboPKZTjlROj1f6mp2ZxIiPvUOM/mugXAvbOeJgOr7ga
	ed3lz8ZkcJ
X-Received: by 2002:a5d:588d:0:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f4fcd5726mr3441593f8f.14.1784122954301;
        Wed, 15 Jul 2026 06:42:34 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:e682:163f:4878:db7e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm14509548f8f.21.2026.07.15.06.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:42:33 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:42:32 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: tungsten-smarc: Remove unnecessary
 cells
Message-ID: <aleOSIBFeJ1bcx9Y@owl5>
References: <20260709092021.34023-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709092021.34023-1-angelogioacchino.delregno@collabora.com>

Hi,

On Thu, Jul 09, 2026 at 11:20:21AM +0200, AngeloGioacchino Del Regno wrote:
> Remove unnecessary address and size cells from both the disp_dsi0
> and the xhci2's ethernet usb device subnode to fix a dtbs_check
> warning for avoid_unnecessary_addr_size.
> 
> Fixes: 9fda4a8a479f ("arm64: dts: mediatek: add device tree for Tungsten 510 board")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Gary Bisson <bisson.gary@gmail.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> index 9f5a0ec563e8..8256279c5629 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
> @@ -265,8 +265,6 @@ &disp_pwm0 {
>  };
>  
>  &disp_dsi0 {
> -	#address-cells = <1>;
> -	#size-cells = <0>;
>  	status = "okay";
>  
>  	ports {
> @@ -1049,8 +1047,6 @@ &xhci2 {
>  	ethernet@1 {
>  		compatible = "usb424,7850";
>  		reg = <1>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
>  
>  		mdio {
>  			#address-cells = <1>;
> -- 
> 2.54.0

Out of curiosity, how did you get those warnings? I ran my check dtbs
command on v7.2-rc3 and couldn't see anything related:
$ make CHECK_DTBS=y mediatek/mt8370-tungsten-smarc.dtb
  DTC [C] arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb
/home/data/upstream/linux/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
/home/data/upstream/linux/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
/home/data/upstream/linux/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
/home/data/upstream/linux/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#

Thanks,
Gary
