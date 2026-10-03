Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B72A43C07E
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044616; cv=none; b=aB2JJkJ42ercOmxoCf4FouwLTCwgUe1+wUpCKQkE7Dz+bF70Ks8lFePadzKeZYYOyhHQAXWP5RFPNIv1bgNWAQnUNCXnvAkj2zAA2C9L379zFcSsIDuDF4wE2dijAgpX7YXDIREe8xYDM6O9lTTpzMZszloc//ALujaVQmx8hQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044616; c=relaxed/simple;
	bh=vgdhw8rACnZl7y0Wg1EtOUtcX8opsAU4+r/FkpeeN1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzimuSeMkHssFwEOGapbl4gmAH6M6IHpLQqVAhIIO31GeancfU78jG5rpU8HjSiAFoFlqyRKT7e9KmrIv+T1+yy8EyF2dbKBtrQ0HkS7LvbL7Igx32q7DQzK7H0k12Pxgo2si4xWtiiwUe7W7eLLkdSJs7zkgGiKWuYP7MvwkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DVCnUW8m; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DVCnUW8m"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-154e9d2d979so32131c88.1
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791044613; x=1791649413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jxWbkNMJ0gxrVSfCconXVhPE8tqLr4BtV3xGSiKP/9w=;
        b=DVCnUW8mDIrBI0sxxcwwHhvOXIhDL6gv8kV865zpsusVbDpJIQYXKf3iNI1W2OU5bb
         eZ7WgE/0UvN5oRML0M6Z+j2jXw7m1NBvs3r1BCZhSSfQx48BUo9NCpTmM5+Wgz0EauiW
         Nu5fB/h5fbo0ZtPI5oPkMXs3Z1YB5KPPXIrDVr7ZrBSW61y/VgJhlyXhnRSwIZvoDAJZ
         LmtGYhYjppO42xeJQq1L4YG2mMwNa3xnQSfAMbbPR7BdwstuKhWpt0CUxCETcHazMM9q
         arhN3MCSk1HITukaBWJcGAC77aP2WlYeW9WSi5yDnMl4XFjHHnY2p9SLL4OQRE2JL3UQ
         3XDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791044613; x=1791649413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxWbkNMJ0gxrVSfCconXVhPE8tqLr4BtV3xGSiKP/9w=;
        b=ZS0kPJaiUZZKmFJC+2NGf0NIIszZzTh1zCjYb0hXn6CC+KG+jGFXT00wtuoy0OdpC2
         TN8b41nN2y3JxEBB51ur36jOfWvfAlQlM6Cq8mGnOtIva6gNLtU6tXOuCsYAI1Jigigv
         6h2dbbXoeSshgzZkioP6+D52RcXA33EGj5w9bzSc7xrtjjux+b4g3WV2NMslAJEtWBZo
         Z+LxDlonKx6UZ0uqg23tcM813PF9ycWOh4l11FHkWyVwmQCakN6Megv9Crm4XWD/cki+
         Q7hjcaUHa1lV/zlehZTJajw0ob0y6pTVDxQZwyifpVrSTnWP6z1+jyYeQXY1on+6PoZM
         cx+w==
X-Forwarded-Encrypted: i=1; AKwUvBzIu7AOUGY4Y1LMAf3/C7k4fMAy7GDLQ9+8SftvK+Lf/AU/jn8mRlarGx63snv9I5DO2Fawu7l3gv9I@vger.kernel.org
X-Gm-Message-State: AFuF++knJ/vHddjzz37vqTm5DeP+RF0BQydldR/PzvTIy9ozYqY88YGM
	lFC6FVrEwOD7/WC0g8UatOeACtSfX5zmmGvqswGY3HpoM/0+1E36cHdlXWuCGD43ebU=
X-Gm-Gg: AYBFou2YoyJ0NOe4bIVbsp+VdL4Ca5jXJMLZo7Cr8QwyV0j8nOYo0k2fy6FREf+UCCn
	hQdv2aphkIldSeGstYNnxCECNQ7c0lSnH0e2Hjko5J/yuAHVyHP66NcaXKodM+nGq/PUvryG8pN
	xdpbhG3gusWgqQDfLUqDk9E+jmqHOMsmVIpL0QiHXk54CTNQIRchiHgXHylP7tWBy+E0dCZoIay
	3mlfgFPhVYvfgv7D/yk17qTo8NDje6aEoKAixWQwCXm2SvgwYOONi/Ugm0Yo3j/zxpZ9aivDTNd
	oiJ7CYZw+QVjF1UtwtgUk84D3XVVFZ6BPJNCnUeFy0LQPO8BlwmWNlwU1bVtHM+aY1ZlUiR5tPM
	kJZnZ+bwsXTArKNwzMp/iDbCtxvx2l7yn4c5nj2UKA4V5I7D3Vevm0u1EmPjTyTRPNoH15olqvh
	iK8XmC6BNrQok8wTnqtHYOo7CIh8fShfzZO2JETmR8SlJcZRRO2+7188eHC4B8FxrQYD82Yidzc
	dzbE61EFAg8pqHuiMPtG5DGMPHfurQY7bcp8/9qRTo4vthdvUfLhvN2hIk2jg==
X-Received: by 2002:a05:7022:4386:b0:152:97a1:dd36 with SMTP id a92af1059eb24-15297a1ddc9mr3493127c88.10.1791044612830;
        Sat, 03 Oct 2026 09:23:32 -0700 (PDT)
Received: from hiagonb ([2804:7f0:9541:40e1:2108:ffa6:f94b:baff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3511d87cfa7sm3498737eec.26.2026.10.03.09.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:23:32 -0700 (PDT)
Date: Sat, 3 Oct 2026 13:23:23 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Longbin Li <looong.bin@gmail.com>, "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	Joshua Milas <josh.milas@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy
 node name
Message-ID: <asErZOk1RtzqC7Ao@hiagonb>
References: <20261003084627.353899-1-chenyou910331@gmail.com>
 <20261003084627.353899-3-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003084627.353899-3-chenyou910331@gmail.com>

Hi Chen-Yu,

On Sat, Oct 03, 2026 at 04:46:26PM +0800, Chen-Yu Yeh wrote:
> The internal EPHY node is named "phy@0" while its reg property is <1>.
> The unit-address should match the first entry of the reg property, but
> this is not checked by dtc for MDIO buses. The kernel confirms the PHY
> is indeed at address 1:
> 
>   eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]
> 
> Rename the node to ethernet-phy@1, which also follows the common naming
> convention for ethernet PHY nodes.
> 
> Fixes: ba1abacc57cb ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")

My only comment here is that I belive you should remove the newline
between "Fixes" and the "Reviewed-by".

> 
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index ec3bf305274a..cf672cc6b935 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
>  				#size-cells = <0>;
>  				reg = <0>;
>  
> -				internal_ephy: phy@0 {
> +				internal_ephy: phy@1 {
>  					compatible = "ethernet-phy-ieee802.3-c22";
>  					reg = <1>;
>  				};
> -- 
> 2.43.0
> 

Best regards,
-- 
Hiago
