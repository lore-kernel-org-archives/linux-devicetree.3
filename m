Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9116B43B3D3
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784564159; cv=none; b=GfmjjFVPSsUlvhwptHSz/OfYpEaXfd/Z3iSlW27YEEzXwrIP+l0g5PHED3vGjudEzj5YkAAsFVBUwpQDXCoIKGUyIzL5pMAaBbJaOa1QvPxzuLsZ9KFwdZNtqZyBRb8Uh9o6d0hOto8Le6gQ4u8r0wg+I7tFASqrhCuolECiv8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784564159; c=relaxed/simple;
	bh=085MF/GevoRaxgn2oNQBqmCbgD1r21gndgud8mN5OxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXmGVLjByoNldLljp4TS6QRkZxdJk7IQt2+1LRvdufACBuMEV4X2qFxezby6pK88eVwmu+hNtqX99oBWgE42//uOR9CJ8IztIAkDm7k6gYFGPUAQFj4+HujIAGzxr09SpTBeKTAyHM88HzcSESENjSXKDTCF3Dhr3TvcFvw/Aco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YT8Uk+Be; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YT8Uk+Be"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-382ef647e20so9781693a91.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784564150; x=1785168950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3tTr+RGt8QXwsbvuUoMSTPv8PVwzNX3CqkyBWX78eok=;
        b=YT8Uk+Beki5+Jxm7y5dKc0r4Yk2OPRb0xq3qh3JiqLwZvPpiLZruiCNGQyAuu2esmx
         D2z9d0q3OHSllaFH+T9uFdcbnA0v3Pu3i+Vz3TMwN1d3D3wmr5ETNjkKPVi6gbhUru2+
         3plHbYoC7Xz8jxN10nTmJJ4io+Vh8rBiQueIfFNqHCDCPOlzcpmmAmUf/sFN3t6UEgNu
         d6s9Sf4TmTnoKsnrxCttcpqFG2ff+fwA8XYHOOTsxKXsYKquaD02+VOu/PnYru9JEA5/
         BznnzGA2IWhX5SaeDiWZus7RhqEmWL4wOCwyJ70g68/WpbjIQ7MG4EyZwU5qEZhvlMtj
         HWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564150; x=1785168950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tTr+RGt8QXwsbvuUoMSTPv8PVwzNX3CqkyBWX78eok=;
        b=R4PsHbXjPp/WjcMAnEUmHkKXbd8pc8vjM8iYeTYBfjBQ8XAXyPYWVfeL2gqsBLQV9f
         TCTjbDNBPBCWejc7zUGZgZ6dvwrKDepEFuc0Y9aNxM1+NN5msHXcpuKhjK/2FwBK8oVb
         HcPtTIOylgNh0jekij1JVUNffV+IJpXnqPMGG8k7Sq6NeD723bKTDjyknjnvplx6HIKr
         9a+bUumPRCWaE9f6c9vhZKgGdaLYG2yk3juA8Y9lBivpx/DOvYPrqLHIh5nRizQzGAcV
         vR5jzuYzRRAQe5QaY1OI7J3/hVwjDm0V58qji76oBWtKszsY0ZlT7Rzz1hAjL9ZOvL6z
         oVLg==
X-Forwarded-Encrypted: i=1; AHgh+RrGo+xnNzgijSBJvBkOXDHwkHTFpQxnb96iPn+zHU4njI706AxNH/0A3/rTpOb8ZqzTB2eD7AUruti8@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtxl4Ldic+gvQa9Sf2334SWuMecfLqP18+L8uYdr9iyK5gQYWA
	AE06K5nZicvXnrK2YGxFXOqLS3FLAHbgFgKDmOUlqWWVV0tF9eQXDoO0l+HpOw==
X-Gm-Gg: AfdE7ckwfbDP0fXiDQ16NDRJ2ud1bQVqR96zM1mmBaQ/MRYSt6oA3zQjoa5jVb5gk0t
	SMcgXVI4MzxKy5APCaehZ79xj7mQoRrhyoCDkmsQpxd0NwvdO9SaBA3XfxnxZLw+d0MSS36H1CX
	q/DEOh1oMOiMTHsHzqFIFaIAwV1fb0psiSdlJOjqm5S4lEiJ2K1JovK+ET0mauoEmawVDYkGCAA
	BxlDY+1xIu0OIJM6+wgL6thX1+xpowMNIxqxTjMLLRiB3CkrMyzyVAqlXLQ2XKm3rvQ3iVvs5Ob
	enCBbdp8qETszjN4VxLKVfRCS4qMdk3laaWC7EizF1HaEr9m4nrOhhR6NybC7OHUpfIjpREPsz3
	kmChctpE1mGm1Z3xHzz19y2eyHXYO1zXFJrKTcDSr7j/3rR431JiHVw7hEKlT6pBOMCZAdSlo18
	oe3U+c0GBP4enfxk8=
X-Received: by 2002:a05:6a20:914f:b0:3c3:ad17:eded with SMTP id adf61e73a8af0-3c3ad947d8amr15223942637.36.1784564150015;
        Mon, 20 Jul 2026 09:15:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm45298283eec.5.2026.07.20.09.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:15:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 09:15:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Simon Glass <sjg@chromium.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jamie Iles <jamie@jamieiles.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: watchdog: snps,dw-wdt: Add RV1106
 compatible
Message-ID: <434ac32d-9f3d-4b5d-aeb2-91ce317f8e70@roeck-us.net>
References: <20260714131856.v2.1.b5339e64b3fe4338b3924ebd9dc0096904699744@changeid>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714131856.v2.1.b5339e64b3fe4338b3924ebd9dc0096904699744@changeid>

On Tue, Jul 14, 2026 at 01:18:57PM -0600, Simon Glass wrote:
> Add the compatible for the watchdog of the Rockchip RV1106, which is
> compatible with the Synopsys DesignWare watchdog.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Applied.

Thanks,
Guenter
