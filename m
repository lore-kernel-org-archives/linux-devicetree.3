Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0752D6E5A
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 02:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787364819; cv=none; b=UBSzkK0IgnLYWhnN6PKxAgDO5Z9OjlPXBzBMxKQPAwGNeAYgPqSjcr9p1TPvBtimzpKgu66W2FS2rglcknAkgWukFM01nYQDd5eH0pajIJrcik9RquEGlbrmqkUDJA1g1kqp6cVKblMLcqBUxniSlP7EcS2Xabs1nqd01BGA33g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787364819; c=relaxed/simple;
	bh=N3/pYQ/HqTfCacdx7qd2fQ6r0Lsg3Bu7F8Hanritaow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FToE3wQYCbrJFMkngCX2VA9rrg+vmaLUvilgzHoPY57ETFUYTX/AQ5fXMnztzT6cjo6o2SeG8SV35XQ9mbiAFTbQLna/DeEL8ygLOEwaI0cSxt9bi4YyB2WrpinogCsS2qDabkbwi2Fe6Mj8qlmcRVgpwli33ZtAtvpwQYyKnSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azCNplo5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azCNplo5"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1741905a91.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 19:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787364817; x=1787969617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+kJNsMh7lbuSLTH19NsCfuQgNIbC7xznYYNfdfSxlo=;
        b=azCNplo5iIm/vgtgsdUlbvVm/RSNv0kfD7aWZkmGSFXr7P6WKOGwzTF8F1efrKMUeh
         Q8+c1Km5uSNk0Kw9Ygq7sUflnFTLX34hNxKUSi/6w1DQpNJBhx0meg1vLWvcdo1UjwqD
         jJDDtN20RlZDQ83R8r/GLyC2J34nO227ShH7+9MEl8UXgPG2aYVvS9xb/fwwdQfcD01P
         8sQe94IRpmt6Mwfac2yTnLvHqHtnJOoZZqPvOXYmNEtotaxbyUcZgPJRIutxUmtWBpbi
         5fgYbaBRJNghUtEb5QPcBOfc7ZRd+itOir+YJgfo8hpqDWFd80mDbX/l++lAXV6hRHXc
         dUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787364817; x=1787969617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+kJNsMh7lbuSLTH19NsCfuQgNIbC7xznYYNfdfSxlo=;
        b=G1mJ7s800GhjB+Rd5h9TFzDzNLpnZyw70pq7BavY7EkRh98fV0A+caGAS0EPFJuiJ/
         pMSm4Hv7vOU/tnVctfnz/uJyltwkMKLh3Bjq/8UeAwC++YEGOJMpfeJRpV8MNmtRM8n8
         0zWbBzQlztJFipPz/pEZtGYFVUl04YtSaBdbA0nemRSc75e0Zg1iAV/9WCmsaVZTwJNX
         8sAGHOxbqN/wDAhOTgC8WNMEDScx59GlmEYtgyuGyCggYf9RgtGkHDDk6lgMnSH4PH+o
         Xx6y93CL5cZbX3asoDbGIE2WaJd3zQ2bezC0c1XNYhvmL7KjDFp8AitevPdZzdwYO4UZ
         uYDA==
X-Forwarded-Encrypted: i=1; AHgh+RqUoe++DGad0CqmzUJR1fsvccfDU51T85XT3x1+mLP+AmJEYclfWLBeQYvukr04ABkEvjiX+lUI83vi@vger.kernel.org
X-Gm-Message-State: AFuF++nqHL4KgMhrI+tIVIbRWLs2GcXtih2exl8M24l2DoRzWWh7BzfQ
	HwNzckR5FvT4D4Cof3sPAFFdWSmJNusgtLTIBs/txSaaL45pilCENxrl
X-Gm-Gg: AR+sD12PEzqI9UTl6wJW9JMw39fYtcy+X5M6i6K4PYBIyA90DJ6cd3AoQlu9r0Fvgxj
	E9wfm59MiYNwxmc8eV8+bAZ7FVgvuYBzkN4dK1ND/g4Fr0lkm1/sr9kKrRTJUxdI6L/tz7LCCZV
	TnoJho4bTHWYa3YhrU6u7Lqy3nyLWGJegFwJxxMERk4qF4gTuAfw1p17DBfKOAShWICtHC+MLVZ
	l1MbjY2yYIoEUFMH0oOyrynwmcPFZHJrCdqyDDec0OXMjsHzQtoqMgeNCwLsi4MCmqR2rlj58a8
	DlcirCA6Z0448RRVb6QmMbNEKINppqHvEgdndsNt8cN2rNzLxA2FMQtOudHaF0C4h+FbmvYn38K
	N1LVbnUNhhFZnF6wV7ucAtV8ZMKVRyKVt7A95R7G40DjZFDVJuHuK65bu2Fjy59vi0hdThYvr6B
	YD08jZOT75JXHsS/bVXBwzfjrKida87BU8jTf7g2L+e3QXaBV7qGiutTzxH5g=
X-Received: by 2002:a17:90b:4a82:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-395dee5610fmr4115491a91.2.1787364817123;
        Fri, 21 Aug 2026 19:13:37 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c91348e2sm1571108a91.2.2026.08.21.19.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 19:13:36 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:13:34 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, chen.wang@linux.dev, 
	inochiama@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Enable ethernet for Milk-V Duo
 256M
Message-ID: <aokFbP7wArV58T9E@inochi.infowork>
References: <20260803163323.74414-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803163323.74414-1-chenyou910331@gmail.com>

On Tue, Aug 04, 2026 at 12:33:18AM +0800, Chen-Yu Yeh wrote:
> The SG2002 has an internal ethernet PHY, but on the Milk-V Duo 256M the
> ethernet signals are only routed to the RJ45 connector of the optional
> IO board.
> 
> Enable the GMAC and the MDIO multiplexer so that the interface is usable
> when such a board is attached.
> 
> Tested on actual Milk-V Duo 256M hardware: the GMAC probes, the MDIO
> multiplexer selects the internal bus and the internal EPHY is detected
> at address 1:
> 
>   eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]
> 

> Link-up was not verified for lack of the IO board.
> 

This is not acceptable, I agree with something like DT overlay for
support external IO board to enable this. But you should not enable
this by default. As other may want to use this as GPIO.

Regards,
Inochi

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> index a2797c0bd767..1462a96a1c12 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> @@ -49,6 +49,14 @@ coprocessor_rtos: region@8fe00000 {
>  	};
>  };
>  
> +&gmac0 {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	status = "okay";
> +};
> +
>  &osc {
>  	clock-frequency = <25000000>;
>  };
> 
> base-commit: 11881041b745b444e4f6c87a2748f1951cf02742
> -- 
> 2.43.0
> 
