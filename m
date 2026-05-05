Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111EF429838
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 13:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987511; cv=none; b=dtSutfbNIy6WAb+Uc2xcVa+3sTJ6GHxtDEpsIVqQ7P7w5iaYEGsUd8czt7sgSWc/Cd5ZPT53JOlVs8cngtrWdGUztNgt3+yHTMIW/QybI69CJ4/VCxopumyuRt4OgrRhAN5/s6cLIcavloJya9fK2y4lfmQrBruRNcTQM/pkoWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987511; c=relaxed/simple;
	bh=9jE5BAElNnScnCYcMXYk7RtpDdhMQf5dQC7MoKiMH+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6DXIJFHsJKNQvRzQX4K+QitEkjs16Wnj38hgUWyA+ROs55gVYr5htrbtk1pac0WTm5mHl6uLINjc+Tny/RfnSi5u1iWDPHbCKMQ2ZIla5jh+i1XWZL0JPqKKXL0C0OpLh91/VNJq3+Cu5yJcBQU2Zh3x0bH2WfT9KnFcFhtChk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHdp8tDr; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHdp8tDr"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c8ccc7755so7398745c88.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987508; x=1778592308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlKqL2HtAcItt2I5xifrJGPjZhKvbb1ZobgqAWPrJ9Q=;
        b=cHdp8tDrUv7F3QAAdyaFLgi5kKaP5GVojtomOovxh8KmeoJ9jQwik0ayqQG5YrMJ3M
         ad6Gt8FAHD0qGGYL+t8A4YTEO1ZPSMSaXp2KXnyvPqCu05y2FJb4IPeW/HskwL8395be
         xEOMN2lD4fU4KnztRGuESWsjTjM8uZDnrsONDfJoY9OI2eSEDXoHHhGwlEEFoT74zuxo
         Jm7Tybi3kHdi8z5sggETjqfJcvGk3kijX4CXzsAlLo9Vm8+vwrABMSVOrulaJq0sZM97
         5OjZONEM4oXuIBG+6UPVUgcDwsOebBvLjVuk00i2FGJa80rn7vROKIk8tC3aMSDL2sGY
         6pOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987508; x=1778592308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QlKqL2HtAcItt2I5xifrJGPjZhKvbb1ZobgqAWPrJ9Q=;
        b=sRkAx7d2mSvMtbE3WxdZw8CSO422JTnAUntKeHW+1XGqSg3KhNWR+kt7jXELg/kbtD
         C9q2ySCSD/kxJsi49CdWhmHWjUzy4+JPsX2howOKT9PpJSkStfrAI3DCDoSF9yX+yqct
         vuLcUMj+/f9dV1Hv2gU49Q46g0xQwSZuKsDcOPiNHlMN9wDHnEU7FD11EPQUFFRQz/Sq
         L8HeepgbZ1aTQLaU3ikY/Im6Fzo8GgrrUY5AMOVUX4dVKoI2qLPN/vlgvTYogtr0fQyR
         FvUbv3LracVDFqxTV51GZDOTDYtvriUSTXmoQo0g0UNTT3HIFtTh6K6id+8NL274TTEK
         eTPg==
X-Forwarded-Encrypted: i=1; AFNElJ/nw2Di3t6CRSwHCJhcwjkfulTSAjurwoAn/dRLsSwsSptg05qK6k4/3VfUGDqnZ645En4WfrNtEsED@vger.kernel.org
X-Gm-Message-State: AOJu0YzfZQMIw+/Jc/fKiZiMkuzBvJ9slwalu01u4EOrxlaZWtJOx/ST
	aayBT1nHbtwDrD8GR8ytuoAXKgfHSa8TGW22NMggrCGDfsDMUluMpXDOg7jCMQ==
X-Gm-Gg: AeBDiet/4wtYK2+WQoAE26VMSF7F5RP7iPiw6WCPuJmJd6cRBck1D7nL5eGxkV/ef2U
	3YmYJEfwzRBpOpXT3l3pgKUc6uL+kWi1EdzQ8xbHkyYkUecjYVMvamGbXTo7hSIB2ejRm2yXfna
	bpOCSiZmQWsoangybv6/kl4NAu84FqSHBOWfPVQVOi297CfaeYUiBRVUED/5Chrrs+gE4aLpvFN
	bIp2RFnmhLLoffwfhbxPLBMKLlbdQvRP2xjKJK+ci4RsTv6HfNAw5P9oUlaKACr2ao1Fg5RHsO8
	iWXwotI6r6UHkMAxpdry0UxvBmvn93byp2ouXNdBSOzxGnpjq17iDf/JvBV2g1mread+O8qpzI3
	/ncKKxkpINvzr3o93R7Qg0kn0DGpSW4DsgpRjuW3z9AmGlwk6rOu0sfVSuJr2ct27sLtMPWAwsM
	h2DUciAA8eowGMfQxW4poUPp28f8c8GVsnym6KSfNhLejINKo=
X-Received: by 2002:a05:7022:f8a:b0:12b:ee92:a60e with SMTP id a92af1059eb24-12dfd7ae956mr6378632c88.8.1777987507851;
        Tue, 05 May 2026 06:25:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84252c0sm23316498c88.10.2026.05.05.06.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:25:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:25:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (lm75) Support active-high alert polarity
Message-ID: <66f6c065-f004-4129-acc0-6a04ba4cdc1f@roeck-us.net>
References: <20260504151020.462342-1-markus.stockhausen@gmx.de>
 <20260504151020.462342-3-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504151020.462342-3-markus.stockhausen@gmx.de>

On Mon, May 04, 2026 at 05:10:20PM +0200, Markus Stockhausen wrote:
> LM75 devices supported by this driver support configurable active-high
> alert polarity. This is already documented in the devicetree description.
> Add support for it to the driver.
> 
> Follow documentation and defensively enforce active-low if property is
> not set. This avoids possible inconsistencies for future devices with
> wrong parametrization. No API breakage as all current devices have
> their parameters set to active-low.
> 
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

Applied.

Thanks,
Guenter
