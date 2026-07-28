Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44B53DD528
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 22:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276956; cv=none; b=omLjxnzI2XkR7kdsowT33iiiXVdSpuK9J6WgbjT+0U7gkAjl9N1gTFf6v9ySPAgn4kI/i02+Uo/pOHR7fmAAlhzYkWfVej33AcdAyxng6YoFOrG0fPxGJF/HmZzHQdgtp+E9/cF/FC6740BHaEOJxb0O9lwCI7pF453WTDF+nVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276956; c=relaxed/simple;
	bh=iz5eEsTOMdWHCyx2WpA/dZYo9o9pe5LN+o8YsCcB1vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjWrM+hu6Kys9ApSAZ8rC5w2jQpfwLb+4VGdmjn92EMDmR1d6lr0CSnZzaJYvmTK01bxHXu4I6VflvjddnZ0Ppd7/iWFJDa94ogeR/jgWy9MiNYb6NL/m6O0SVBBjh0OS0MPDcalrjwCBTA/Tq+6vAMzEpe7eZ+YCxT22ltpwmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCfufqr1; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCfufqr1"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-845c92bc464so304121b3a.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276954; x=1785881754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rje7HhQ48HT1sXup0TRphJEI0h4NvdmNL/JFa+vFWNM=;
        b=BCfufqr1jGl3Hzwt1eo3BGdICvap8SxVDDoQ9RuJZzldlQAks7w7e60fSvcGO3BH49
         sGFvImd0VzPg9dduY9uOIqAKZwM59sX76fj6L0QUYhl5UUoEMQeGSw2SYpH98eS2uDHk
         vmOYrDbKoNid0kaaYvHECODym5DVG6JHcRzgga+TPc6pKHrIX94ClpW9XtZGvcruoWW5
         wjSNZvqx2ltbff5U+5cA0iqoNlgLJedbxFMPeBK2Ia34mLUEkWyK2cquAzj8s+p0tw8x
         voG5hlOUW8kiglWwGCA3gHkQW+twhNihrQM1EsWskhQCdJ0rmJfhTNUoaku2fc5Ho4iS
         /KLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276954; x=1785881754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rje7HhQ48HT1sXup0TRphJEI0h4NvdmNL/JFa+vFWNM=;
        b=nB+aPHdL9qyOVqOQf+mDf+xvdc05luGeaqX4170vFkNi5AO6Cs9IqeaZeUOK70h3cx
         267COT7hBfiWP7L2iIYaj4AEBk+9buJPZXHNp8yARRaX+thvJHXpF2aIT6y6RWOgHhgY
         /LsndLgdRcvLo2+CqFFaYSoFgDqd/2RUN0kb2NT+mj0RghPDI93SvZvhQ4AFktwA/LA5
         bjtU+1heJ0bqs4zkYbl/hEPaoGhTw6kXQcCStZ1NQ6s0ytya/rGzlQIcPlKZbJkxUMUz
         7tP+LJedZDC7nfjjKYNViOy8m06tBFDows3WWQJI7e8P5vq3PvsQJB/nwVjPia3aM3Wh
         7bnA==
X-Forwarded-Encrypted: i=1; AHgh+RoysyiTT70aFhvW63kSP4AWcVDcrh60p8g9LRCtEg2TgY0yauDzg0B+10g/VS/xbzKQEkdFXTvRvXIN@vger.kernel.org
X-Gm-Message-State: AOJu0YzoXSEOnbrWu+Lyq3RDJJ23EjjV5evrVlloBRw1kn+4NXhFB3iQ
	PRh7SmBaYKU4crKuogvVFBxKZpPrJ4UJDh19kwVu0inQ2GEk8DEMTP02
X-Gm-Gg: AR+sD12Ef57YjeQx18hKT9JlCsJ71C3tJPTq5qH9eE/iGLRGXAecdHexOdKAqZ/iVWo
	QJgdapaFmSsRb3va5HPvYbxZ12oBkbRWZbAB6yAQEbRdNK5TjFgHyK2fwxdM6c34jFamX6K/zZw
	14ZtGdGz+hVXdfS2I+UbPtN377foySvM6HNL5BMDRiv1k12FnJ55FNVF1CUYrcfKBtsDDWVchd0
	EC4Vrji51yVQhMwM1Lxo1BmSkeNM7hwKd6HKvqFfY4yDGbIaZGGMOsEomCtPRRQSISPZn85x3hn
	LEz8o4Td8xQLgfDKppH5wss8y+/6Gn33vuMrKi1kmmNO/72YnhtijwttVgnVUbZt1dUpA9NpWM4
	3yGWAXLb+CS1cO0gMOebcY26vSbNNIf6sJiWH3+NFXzjvX/Wue1z7uAMVTrrx5Mgfz7k2/VQEGO
	HlqbUg80hd5yg5gvRHzxP3SAEd91itsiuItviXFsKdFQ2Bv3vNRhart7lpdC8=
X-Received: by 2002:a05:6a00:3992:b0:848:7f8a:8d0e with SMTP id d2e1a72fcca58-84e932c5f3emr4027335b3a.55.1785276953823;
        Tue, 28 Jul 2026 15:15:53 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea005287csm484155b3a.16.2026.07.28.15.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:15:53 -0700 (PDT)
Date: Wed, 29 Jul 2026 06:15:43 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH RFC 7/7] riscv: dts: spacemit: k3: Add ACLINT MSWI and
 MTIMER nodes
Message-ID: <amkp9dLCVKTilhO-@inochi.infowork>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
 <20260729-k3-aclint-v1-7-aef88614d3a5@pigmoral.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-k3-aclint-v1-7-aef88614d3a5@pigmoral.tech>

On Wed, Jul 29, 2026 at 12:36:33AM +0800, Junhui Liu wrote:
> The SpacemiT K3 SoC provides ACLINT MSWI and MTIMER controllers. Add
> these nodes to complete the ACLINT description in the Device Tree for
> M-mode firmware such as OpenSBI.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 5fb719f79467..ecb5f4fcd8fd 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1303,5 +1303,24 @@ maplic: interrupt-controller@f1800000 {
>  			riscv,num-sources = <512>;
>  			status = "reserved";
>  		};
> +
> +		aclint_mswi: interrupt-controller@f1810000 {
> +			compatible = "spacemit,k3-aclint-mswi", "riscv,aclint-mswi";
> +			reg = <0x0 0xf1810000 0x0 0x4000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu1_intc 3>,
> +					      <&cpu2_intc 3>, <&cpu3_intc 3>,
> +					      <&cpu4_intc 3>, <&cpu5_intc 3>,
> +					      <&cpu6_intc 3>, <&cpu7_intc 3>;
> +		};
> +
> +		aclint_mtimer: timer@f1814000 {
> +			compatible = "spacemit,k3-aclint-mtimer", "riscv,aclint-mtimer";
> +			reg = <0x0 0xf1814000 0x0 0x8000>;
> +			reg-names = "mtimecmp";
> +			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 7>, <&cpu3_intc 7>,
> +					      <&cpu4_intc 7>, <&cpu5_intc 7>,
> +					      <&cpu6_intc 7>, <&cpu7_intc 7>;
> +		};
>  	};
>  };
> 
> -- 
> 2.55.0
> 

Squash this patch into the previous one, it is the same device.

Regards,
Inochi
