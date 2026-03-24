Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C325B24A06A
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 19:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381384; cv=none; b=mthw763C+s5jH+70YPuxfYO5JZ/pHHIhDiDrCJlFCAP3nVrzfOBViG/hrfonH8fVsHrrzT3VjvkDnrTpbSrgOLlqPx8DcYAiCr6pJndTggLUG+DZxZy/LataZuYDqiEBOdHtzQq334MjyvyIRGLXsQcr1MbdXjnnvp2ZTBX9oHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381384; c=relaxed/simple;
	bh=fBN0MhDEFUzS0U6dx0FqrazYoqTXsoKeLlxeDkI4A7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWxqU/zbj7Mm9XCmvu5MKCt38+MztC1LxqspqCBXz7X8V6sWBGmQHpgdhom6yFtjIhNbgkx7E3SVJ4U5IaWM10S0Ae3AX0TyEpnDmWkCdyUmaitOAbSuNmXp34LJobvAq7a2OidiEP8jmnCQMCG0izO8/67lmjdjQgcMpH2kdtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UE3rHcpL; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UE3rHcpL"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so2954231eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 12:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774381382; x=1774986182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jvwht5JE6diwBV/hO3ygWTczq8GqXSLEKFpamj447+8=;
        b=UE3rHcpLU0+qHMbhos9VfKS3kSoqR/kYe5GcJ6XRbUxzRcMLZovttLpQqZlAoxJQFC
         QUtVoMk9tu3NbMpWKLGucNoygxAfBr8XNNtjJ24RbS+/iWLJSGEmct41xcZ9Rg/EpuJz
         l2onHdf0j7Zo9gBEcNdp171l6IGr5pISs04BjnGYElMgABNtG18YxKYcmx4CYE3+D908
         asBZjqEeJCjYSfI0EnfripapYmRpzUMn/WAYKszW6ngqoD4aunRHRgLbrViUsgGMqi/l
         eKuAac7cn1a7CJ/IFgyJO8fqq6d7xrt+rhB3B+2yfhz5Tiry5aDujSppn9CbKIOhbBBR
         J5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774381382; x=1774986182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvwht5JE6diwBV/hO3ygWTczq8GqXSLEKFpamj447+8=;
        b=IilOtFui3iQcCKpKyzWdo7CvDOx7eHh57w3IcfjaPxhoF4CNt0eYhGcCJbyA7LLSyd
         /HZka/p3DRIno7d5aWQFMJkrzQRuRbVGiqPbqwiU69v3N1dONfohr1npgxpUcgDhcX6R
         q2JkAhpcR7Irbf6lUw3NGOqsJVgXZhuqm0KVFgvEGJuF2nHZQRp6v6oPJGU2KVpwTHd1
         NgnH+2YDDKpEyZbyW4dfh0mqpMlFohHABcdXJrM+mS7UAurSdsVIOdbCHuEcdMO/HoVf
         DUzSv4Ahi85r0NQo/rq1Y1ELTpdn/t3Ji1MO35PsvKFe6kyKqhHt2q8WKvfWdXOerlpx
         7QIw==
X-Forwarded-Encrypted: i=1; AJvYcCV1HlJEvtz92Up7NO+q+Ob8mefFFVc92nNWZTHkHeA1KOlvewQ2U/76f6Xop42gcDfY7oUYkxksr8tj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuq6wyosBXbtH11qjEX7JYcHiww6jBLaK9MLzTzd7x57zwW9th
	AK8PEVYETI5gbQYDGl1Q/Z/4OuGr9AXt92Gv5yaxYdRY7OQqx6irdS73yumoNw==
X-Gm-Gg: ATEYQzwispeyhHZjfA4Iz7nR5q0xn6aHMkEd/DMa7LnmxneiLSKEm1a06lH/XuETIwx
	fL7e59jTyVhdPOAGsuKHXhlXyGvC2+FUG2RqSEL2fVY7N2QFX8IJYjDdt273Mc0FEyEH30a7YZU
	0pVraz3vpnixKLrLutwqWBzs/U9YPpHMOIfIpKBFSn4rGlFdTUgctEjPmVqjsYdTpkTl4I7TSUr
	nt81vvAgiNT8fwlO0sawM7zbI2gk/1yra1OtOBYb6ICz0hSsjlIVMDjHQsjb714T7v/csIm8omG
	NhNkFBNLtxGRAdV5NlZxu4kigEPP1rC8eO+gS9Mz4N5RC343ZqjyGURC+CXwJyv2GxMy1oyq3e9
	tcQ230m56KoDnWXJb41ckJVkN1iGtYUWy7BwJx+UKPWR9W0Tht9IYV5tMgtQMTj5m7nUzNiBBpc
	g+Z0Oxd2iZR2UBfVjNYR5ZK0KZYixlrFAkNNjLxhVWczhkxMRbBW0zcSSK3zQvQKPvkgZsWDRH+
	Ak=
X-Received: by 2002:a05:7301:1984:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2c15d322c28mr340452eec.13.1774381381746;
        Tue, 24 Mar 2026 12:43:01 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a686:fd7f:70d3:9156])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm2915342eec.2.2026.03.24.12.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:43:00 -0700 (PDT)
Date: Tue, 24 Mar 2026 12:42:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Vincent Huang <vincent.huang@tw.synaptics.com>, 
	Casey Connolly <casey.connolly@linaro.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 1/7] dt-bindings: input: syna,rmi4: Document
 syna,rmi4-s3706b
Message-ID: <acLpBXc9Qi5riQO0@google.com>
References: <20260324-synaptics-rmi4-v8-0-2168d2df68f5@ixit.cz>
 <20260324-synaptics-rmi4-v8-1-2168d2df68f5@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-synaptics-rmi4-v8-1-2168d2df68f5@ixit.cz>

On Tue, Mar 24, 2026 at 08:40:34PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Mostly irrelevant for authentic Synaptics touchscreens, but very important
> for applying workarounds to cheap TS knockoffs.
> 
> These knockoffs work well with the downstream driver, and since the user
> has no way to distinguish them, later in this patch set, we introduce
> workarounds to ensure they function as well as possible.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/input/syna,rmi4.yaml | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> index 8685ef4481f4a..fb4804ac3544d 100644
> --- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> +++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> @@ -18,9 +18,14 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - syna,rmi4-i2c
> -      - syna,rmi4-spi
> +    oneOf:
> +      - enum:
> +          - syna,rmi4-i2c
> +          - syna,rmi4-spi
> +      - items:
> +          - enum:
> +              - syna,rmi4-s3706b  # OnePlus 6/6T

I thought that all the workarounds will be keyed off this new
compatible, but I do not see that. What am I missing?

Thanks.

-- 
Dmitry
