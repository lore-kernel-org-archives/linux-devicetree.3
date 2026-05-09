Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A875626B75B
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 15:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778341254; cv=none; b=GnT7oyCbPeQwQpZ9O1WX9shXQ01RdlyiA6YgsF3ZwgV0X4IvZyymGZGr74VzelSFamY5fdqpdUC4honCEFtWWuUN7sHWa1/1ce4H3x4d8jtPxkPFZq+lqXXyVUVl/5QyFTUjpXsRxHuIxEmgwUxFk3R7a2Jc82uKfVTME1WHVVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778341254; c=relaxed/simple;
	bh=DO0uuXw4XHQbU70ojqf9zPsomYorV9Oj36hGoursxqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cjeq3fYmS7lHNbd4uHKfl6Llr2H6Gw8cnQL0lom/1eIuikaGIRj6SAAGkahHtkWisVG7rHPY1dS0pgujNDiMGi64CxIQhJ0Nb/hj6ywoKDQmUE4d4sHBVFR4JHj/RVOm8dTLxD1N1QRsmDWpuZ5+TNLsATdC+VOrZn9B1n0WZJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmlpNz4E; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmlpNz4E"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c1a170a50so4112155c88.0
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 08:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778341253; x=1778946053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xYjp8R8MGjk1tvhBBohAtI6RYlnEbpBj/HtDKZx7fw=;
        b=cmlpNz4EZ2YnVQZycu2frjLyjTDK3E3awfeaONQ665OACts5B68i7kZV29ZFGxbw1I
         bAbLehvPA1swjzExpe1Y2zwBh92J+Mfs/uxtFK98XCGGlMDzkRtu6Db933ZKLjQGksXy
         uzd9g4rdxrZcrReSM5Znyf9BGQsMQyveyKv67dZEB9Och9OO0r0LiUs3EwcywPA+QKDU
         NFDpRfesjK3A5RvUc+OKUq792o+SQA6yPeTFK8DccEp8QnIQwHz1/7Blq8pr1xYg3xZ2
         g8dHj6WCWJXY/pVEEVjV3CGJS87J3pCEjnJiNEehuh+61BaaYde89MR/kc6Q2vqCJRpE
         y2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778341253; x=1778946053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4xYjp8R8MGjk1tvhBBohAtI6RYlnEbpBj/HtDKZx7fw=;
        b=lDWy+Ew38IUl4KvehnQE10ZNDP+wKdjN96OOUc2wi2DuXFdVg0WQuuLjeuYgoZ6p1f
         qPIVUzqDvq583sgvWv1u/lDNAE9skHiSlRsnNkuWDrqfk/qHPraoQczhZ8H9axYAuo+4
         2mItnvrIQPbDg/sJ/rpzHb1909tGt4XUWhGCPhSRi52TA10wBSHrLCbiKgcc96ieEDq6
         B853WfgacV5XsHMdWLaKRhspxfF7eK5Y3LO8gXiba1T3Iy6srCBAiQzqsLdY9zl9RNA5
         2bkaqbysKF0TBdqQ4SQv0GhVvGVJ2GkeaNRuZralQvJuk9xXDXkI+iapOtnzYxXUsn7J
         3ntQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qmwoWAr921/HKTJXqgMnFu8q7x2O8CYXW7aPdNxyrsqhv1wKhd9ZWWMY5G2xuHKqxeYiooTAtJI2k@vger.kernel.org
X-Gm-Message-State: AOJu0YyTJlBY+xZ0oKRsCMnFU7X8Hg8ON+mgQquS8+r2AOsEvaF8q7jz
	IrpMdDrm+mIiAx7I6gfOnqFCtpOGiH8xfIC6W04P/RWmOrjQ23PA1Gf9
X-Gm-Gg: Acq92OH6BF1Kst5djXmC8NAqv73LbmN5sXegdhH5CWBOz3bmf/M3LFi0t4SDQNErl+4
	G4rT9hE/UzYY5b+ZXNvZgq05/0WDwuCqDooLrTqE8ClM1wZGASYzeDl/tMW+vL+YLjxNzZTpa0j
	nxFAfH5pu6g1aNcmCp1UBgSw3OB+D3LEmpPrMyuVtfxZeQ6TDkCA+MeSOzTooRqjQ2Dik91dN3+
	8nX87e/wkQaroO0qXQAyTZAeHklMDCSVTR98g9EPvQqKQlaMxkT+SLweDIUhT1byVyzSxFM6qEY
	VhMCorCQPepVukNMLSJG3dkLlb/NG6e9jT9twzsNx1GfCHWGWFr8bkt2u6d+HUBy9xuSWXjBuC9
	DNvF4w3RBjIRDNfnRaXibRlRWY3Wijc1Rg1nqkAUB/lSuhxiLllN/uG0fjF7IpqQydoq3yHo+oM
	IsfFH4fPwBFfOZibenpWRcYyYciX+yd6myu36jPPy2E/v5K5o=
X-Received: by 2002:a05:7022:f411:b0:128:ccb7:7fa3 with SMTP id a92af1059eb24-1319d14f7efmr9154077c88.34.1778341252823;
        Sat, 09 May 2026 08:40:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210d40sm8386334c88.4.2026.05.09.08.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 08:40:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 9 May 2026 08:40:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Chang <kevin.chang2@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin Huang <colin.huang2@amd.com>
Subject: Re: [PATCH v5 3/3] hwmon: (pmbus) add support for Delta E50SN12051
Message-ID: <355daf0c-afb7-43b2-b6a2-fa25426eedc1@roeck-us.net>
References: <20260508-add-e50sn12051-v5-0-abebdcc29665@gmail.com>
 <20260508-add-e50sn12051-v5-3-abebdcc29665@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-add-e50sn12051-v5-3-abebdcc29665@gmail.com>

On Fri, May 08, 2026 at 05:44:30PM +0800, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Add the pmbus driver for Delta E50SN12051 600W Non-isolated
> 1/8th Brick DCDC Power Modules.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Applied.

Thanks,
Guenter
