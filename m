Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68803FFFA9
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484822; cv=none; b=MbrPsoeuV4syGf7CEOyFl4zpzyEdLw/ahuBtlqvbIE1O8Gw0ic80OoVnAPv8+NPgQVLuNr3ComtaJVIfGIiANuI/Tp11XB28POB4KQl6/P+BslSsoqayALwPTQ58Drnd/SSngy9J1xAmxJhM9RVJMB2K5fbiZylGnYF1PZvjNWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484822; c=relaxed/simple;
	bh=rh3m1Cqo9mCNPPwXdaSvQmTI/rlxBSq+XzBXjNmFPQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPixv6Ft2dXF14dYX00wsNBhhEN34LEYZIHkmoBrK1v7NtYpyKBYgeK80pGM4xwE9irUq1z68+dK6fYeg60vYHTdfwJSi7ujhEUwqpH8rm68E7R2vHegtqKnhGZShvN619HUgayEv+34tNhJrvnNR3no8FbPe6+8aFYgZdnYtUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6WT8UMj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6WT8UMj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4996c452e95so308665e9.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786484819; x=1787089619; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgndDYlcvXxrotByazHMiHza1kewS9hYlmxpzQFlVp0=;
        b=T6WT8UMjrQ8kh8l08SNDpELA3BVLQGdVy9KofzrVsidiHdMqyFiAIySttQ0Z7ptoQI
         L6J+vm/y39r/aG/Qi9uySXYWWIXvHaI/dHH6DHDDQ+tUwBzoCyWe3COMdSlFvZWDjxnW
         OQLHSaokRGHJtdYH4W//UtSjmFBDP/Og7QD3h8JarNU18alf2JCqMwjYP4711YGPAiRh
         80RJ5WQAnSYtTHkS6jeQ2VctcJXVs9yCd9YL/DtKbvzwEyCQ3LeN/OrkLOfaot6P9uTF
         DV0LEQ6SOHK35hEu9n7sxeNJ5qWr8UMmy44fOoEYb1eTuoLKEVwCR5oIAPQrLagFbp+W
         vfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484819; x=1787089619;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TgndDYlcvXxrotByazHMiHza1kewS9hYlmxpzQFlVp0=;
        b=mW6GtSePr2EMqkMaxVZx6I6ytsmY4NrvzMB/ts1/VcUfZls0v8SENXL9dNJNIvE93U
         yGAF/7g6Rr2lR5tNgn3ZX3bA+3fkSRJ5nEjfNHvPXNlKW8IWNHGtOEGxeHKIvbOQjnVi
         ZF/utO8FQhPQ6X3sQZhRYeA/DNMgghDR/yJlwKPOaqSCmkf5FhP2H6pHewfxHLbkw+Mz
         gQm4tJq/UjBnRpJ5jr0bMBDsvgbEV8YsxjTMhtr6F4If/nXsA5DnHitfMUbZkL9Y10Ob
         Mdlh5aYSdg9LPP+7ZJbtfygzwsXd4dhed7WfQN9l1Ph3MxrNphyJkAfKDZpYU6qkFJk8
         MTVQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUOm+o3DvPO7FhQFw3ZS73y9FktYDBT2/NeAhgQ+zYlwlQlPxGXYeDDhSoy0BJ9ugzBykRo08EVu/E@vger.kernel.org
X-Gm-Message-State: AOJu0YzAIVjg06upvBO/RNMzoPIKmtMDx3W1j7ISiQ/WSYUxAMPoeTx2
	t5tlpSCyQDPhz5BCi/k4uCzLeeuVxLMGEzXCJ3YPcFP0fzc0k4V+4/G1
X-Gm-Gg: AR+sD13zoswsGL/Or3b8Eb+E0VS1lpn3LxEa0JSfmG6vJsQ2rDRhYvjJjEEX3fJVZuR
	eD8JusV+ggLwdKgoEeRpYWI0v+CqW+QcCEVfURi1Azi/409YX5u0xqIgrK4EguRzrTSpZNSayQn
	ymXXmqg9X6eKS2cmzorclr9rBbNuRMStsQn7/VQ1JX48xwWO5hj9/tEf+h5qgoRplN6+TLJlzap
	rcwUIbggfjIBEf9sp40h3FN2OVvQDVtXmDiK085WiBtuSSTowN0y82+iQT+nKzDnq024L5DjQ7/
	R6KG+xj0ykIjq2OV082hmWyN/bVwZx4oT8GatlBu945Q4KWMQhb8TW8aMF7qm+ExWnqB7ssTB2p
	cLVqqFKakDhGG3H8AGGxqLrWnv6Btq3sv0RH62744x1ujcI+1AKPWn8yY9mA7ARYwmfH7ovdj7c
	Ib09+TfLkvkBAbpID6nyWgET4pK8OOZfwLv71e0UaOCFa+D8Ry
X-Received: by 2002:a05:600c:3b8e:b0:495:4126:1e55 with SMTP id 5b1f17b1804b1-4997c11024emr1666045e9.2.1786484818882;
        Tue, 11 Aug 2026 14:46:58 -0700 (PDT)
Received: from skbuf ([86.127.220.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abebacfsm16561195e9.10.2026.08.11.14.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:46:57 -0700 (PDT)
Date: Wed, 12 Aug 2026 00:46:54 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>, netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 RFC 2/2] ARM: dts: BCM5301X: change Luxul XWR-3150 CPU
 port from 5 do 8
Message-ID: <20260811214654.v7elo6smkknsyax4@skbuf>
References: <20260811193658.14304-1-zajec5@gmail.com>
 <20260811193658.14304-2-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260811193658.14304-2-zajec5@gmail.com>

On Tue, Aug 11, 2026 at 09:36:58PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Northstar devices have 3 CPU ports (each connected to a different
> Ethernet interface). This design was meant for dual IMP setups when
> WAN traffic goes to port 5 and LAN traffic goes to port 8.
> 
> For practical reasons we label only one of those ports as "cpu" (the
> rest remains disabled). It's because of Linux behaviour (and it's
> probably a bad thing since DT shouldn't "care" that that).

Did you see ds->ops->preferred_default_local_cpu_port()? You can define
all CPU ports in the device tree as such, and let the driver select
among them.

> So far the choice of "cpu" port was based on how vendor decided to setup
> given device originally: which of three Ethernet interfaces got MAC
> assigned and which port was used by vendor original firmware.
> 
> Most vendors decided to use CPU port 5 & relevant Ethernet interface.
> The problem is that only switch port 8 provides full functionality.
> 
> Change the choice of "cpu" port to 8 and make the third Ethernet
> interface (connected to port 8) use MAC designed for the first Ethernet
> interface (connected to port 5). This makes Linux use switch in a
> feature full way.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> This seems to be a slight abuse of DT. Instead of describing hardware we
> make it steer Linux into using a more appropriate switch port. This
> isn't strictly a setback on its own. It's a change from one choice to
> another.
> 
> I'm not sure about that MAC however. We say that the third Ethernet
> interface should use MAC that was designed for the first one.

So the NVMEM is not provisioned for multiple MAC addresses for gmac0 and
gmac2? Can they ever be used simultaneously? Even so, I'm not sure
whether that would cause any problems (depending on whether the switch
supports address learning on IMP ports, it might not). Do you have a
specific concern?

> Is all of that acceptable?
> 
>  .../arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
> index 8e487f60a2cc..7969f0f331b5 100644
> --- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
> @@ -81,6 +81,11 @@ &gmac0 {
>  	nvmem-cell-names = "mac-address";
>  };
>  
> +&gmac2 {
> +	nvmem-cells = <&et0macaddr 0>;
> +	nvmem-cell-names = "mac-address";
> +};
> +
>  &pcie_bridge0 {
>  	wifi@0,0 {
>  		compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
> @@ -136,7 +141,7 @@ port@4 {
>  		};
>  
>  		port@5 {
> -			label = "cpu";

label = "cpu" doesn't really do anything and just confuses things.
Labels are only defined for user ports. Please remove this property as a
follow-up (or preparatory) change.

> +			status = "disabled";
>  		};
>  
>  		port@7 {
> @@ -144,7 +149,7 @@ port@7 {
>  		};
>  
>  		port@8 {
> -			status = "disabled";
> +			label = "cpu";
>  		};
>  	};
>  };
> -- 
> 2.51.0
> 
