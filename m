Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153471F4C8C
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 00:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775695323; cv=none; b=d8mRs7+ckzBG5x3uIWOVYZs0lgsh/QNP89TCnkppf123tYKAsAvwU4cuIdjwkClUk1zJuFPTk4ZhqAc8jedyM0B6kEg9R1rKRs6Upblc6wdg+qLDiolHCwKtAVoms1RgKYclU7pBWFzg41Z3mpwdW6TVlwDMGtDkjtAwrleaSRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775695323; c=relaxed/simple;
	bh=I8+D2rIPYlmBL8Vtp9AQuj++1M4cYDSlEqpsNTwvx5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sa+ZyQ3XIKAY0BYMhOdKquKHKFmC9a0qulxIgrLUEUNPTi7hprmnPi5N9xeYtNqQZFDPwXmP1OjK65Hm/8wDlEC1/wwf95h5Bzig4F5dWkVub+iKiPvCDWOCFbkYUY0deA33cJ/TH4CgmtCz1fog5kWj3zytRts6qe8OTyj4iw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TdDQU+BC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYHSRnkp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TdDQU+BC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYHSRnkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775695321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t4QXOBa/UPZ9Yv/mDvjcaoQFWTAL3SoG9ObyNB8G5Q0=;
	b=TdDQU+BCvi3NRBM4SnOiR03hZvckM/rnmNyOz11+yz0tPntApdDEAxpEd4ne+qVNjX4YXe
	wNOhdL30Ja2yConzjWrqXBxCO9PkamzQYL95oznoiQd6lgUwNhWtmYkKY8hWvys9WCgBJH
	+IkMe5wPUV1SFScQ+20DSBAsBOGGvKI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-2e3U3QQFMB2UGeRaHxC2BA-1; Wed, 08 Apr 2026 20:41:59 -0400
X-MC-Unique: 2e3U3QQFMB2UGeRaHxC2BA-1
X-Mimecast-MFC-AGG-ID: 2e3U3QQFMB2UGeRaHxC2BA_1775695319
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8ed08aa4so22725521cf.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 17:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775695319; x=1776300119; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4QXOBa/UPZ9Yv/mDvjcaoQFWTAL3SoG9ObyNB8G5Q0=;
        b=KYHSRnkpiMUsLlxHaqpbS23w8JDN/UmxRar2cvbLbFI+rIuO1mU/LXEGRTX+mlyLuQ
         e5/ipAV0Thpdhv4B9DHqjFjbt8PawMvTvIF4Nx0RRwz9O6xfSNZTTDEa9YCaPzbqvlV8
         FN9spV+Uibc+6zhH47llqgTmUHnRgnzyQt9SoPvNi07m0PIbK/c/AO/DBovg9uS0Ev25
         DHXoHQalP3bENkpqS+B9VhNBi3JJFLZfXtTjKoQIHe3Ogh6IjHXJwsCboPJyea/u7PrG
         qtTPL4Z+0UT2M64IONi8VUADiIYk+EBL/7tadfQaxHR09PrXLBDsK69skFdUTq8VAur7
         mrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775695319; x=1776300119;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t4QXOBa/UPZ9Yv/mDvjcaoQFWTAL3SoG9ObyNB8G5Q0=;
        b=MCSXKPO/jyjXy8xH6nwA/7DSCl54+tNmqL5TekBFjgHqNYR5gnEUp2e9KPWqMPLKuh
         cb5xVDdkyxi2/f3FGAxWSMYOpjz3sZUgDhvgOriAs8UQvZXZosd/RFMEYUIC8wcY++h+
         oLUvUAmd9c78pxV980bRtl2Odm7PxLFcYiyOOT4kSMppJvVlrHm7NdQhbme/BmyNs00x
         8aj5ad0MkBa2x82E31VC+DuJJcOTJfO+VkyMv+6YcM2d+n6twQ7wR6AxIbST71wiFlwA
         uon+8yNW25PXhCc5x+pLZrbg25nYFo48AcUBKi1rGrlQjzXz/8a/j/8SbD8DZq8dGDVc
         cGaA==
X-Forwarded-Encrypted: i=1; AJvYcCVCBkMKJ+dykWleuxMKdf6JR4VCVdoRQ2LEtl4Cg6CXCCehUxiAy+R7AEUUG8ajE+PMpXx+mJgC5vSF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp65QHqGvUYfDQuJ8NQ1XMOKll7yRulPwhV42m+vhfvS23oMn6
	nnPamMXuzufkYWyCNxY+Scoq3CXrODcluyN7+Gi6Q8L6Y8gKERLIOOD3dSQxrvk3XVlElD1YXpX
	2Z2hTZB0Em/IToZtzWRYfaNVRmK+fn+9xUUR+k5T6OqN4kFZ478LST1b98zZcyTE=
X-Gm-Gg: AeBDiesBxejn78vH81ht8+Bg0/jBfP9TaUMlNuRTPne80Gz9PAojgFYdkeIVMPaPdn9
	dN/q1hiFNbxy71Hq/9rB36jgC4wTxRvQucqUFMryVgt+oClwXnPpgtrX9JpNWEUzMGe1yEBfUg/
	MZ5gAoMdpGH0An+iwoL/uqPxv5Un6qOAzFia5w03XqUx/Oyq1PWtvIQbrv9yn68er8ebYEEgZKn
	yODON0oPUd+yaV0xSdaM6l6YOQFXO3FVkEPBAcBjTvFgx7zHrMU2GF3EMcog6d7KsaFH410Fb8y
	FYpOmhwI1SfQGZT0ZqmXwP/u/1C1XO0b96XnwXTwELMBhnr6qKnTP1ekjK5epyzO8huFCQanOn4
	U6jO7PbYWtUwIG5wByAd1ctTt235WBKthoJtzl9mHnBa02+XCn0ATj29x
X-Received: by 2002:a05:622a:5c07:b0:50d:84e4:e1f6 with SMTP id d75a77b69052e-50dc228af69mr23516811cf.33.1775695319034;
        Wed, 08 Apr 2026 17:41:59 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:50d:84e4:e1f6 with SMTP id d75a77b69052e-50dc228af69mr23516491cf.33.1775695318605;
        Wed, 08 Apr 2026 17:41:58 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50dac753208sm39931121cf.20.2026.04.08.17.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 17:41:57 -0700 (PDT)
Date: Wed, 8 Apr 2026 20:41:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] clk: fsl-sai: Add MCLK generation support
Message-ID: <adb10qFASiVL-xKC@redhat.com>
References: <20260409002952.319668-1-marex@nabladev.com>
 <20260409002952.319668-6-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409002952.319668-6-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Thu, Apr 09, 2026 at 02:29:06AM +0200, Marek Vasut wrote:
> The driver currently supports generating BCLK. There are systems which
> require generation of MCLK instead. Register new MCLK clock and handle
> clock-cells = <1> to differentiate between BCLK and MCLK. In case of a
> legacy system with clock-cells = <0>, the driver behaves as before, i.e.
> always returns BCLK.
> 
> Note that it is not possible re-use the current SAI audio driver to
> generate MCLK and correctly enable and disable the MCLK.
> 
> If SAI (audio driver) is used to control the MCLK enablement, then MCLK
> clock is not always enabled, and it is not necessarily enabled when the
> codec may need the clock to be enabled. There is also no way for the
> codec node to specify phandle to clock provider in DT, because the SAI
> (audio driver) is not clock provider.
> 
> If SAI (clock driver) is used to control the MCLK enablement, then MCLK
> clock is enabled when the codec needs the clock enabled, because the
> codec is the clock consumer and the SAI (clock driver) is the clock
> provider, and the codec driver can request the clock to be enabled when
> needed. There is also the usual phandle to clock provider in DT, because
> the SAI (clock driver) is clock provider.
> 
> Acked-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

