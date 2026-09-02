Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BE83F6610
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 21:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385142; cv=none; b=TatumBZ+sSzy8iX26vJlWNx5hEKaeL9HoiGK/opu/RyFG0aOmrlqvjuNqkmGL8UqWsmjtlTRBDefOfJSU1r4vV+aL69h67ru8tD/wxOJXnudMjWDxT/TxSDu62xgvUWOfFNk3VUWYA13WJSLouWyPRkxbQQrFT1udx4kKiS5rh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385142; c=relaxed/simple;
	bh=VCeTB6DA6xhpX0r0q0Xnripoc1RfKaEs1YtzFpOgihQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6xveQe0Dfc4gInyiqnkeZouhTI/1+jFgEKhNvfZhZRJyC+KoOuF09sVE01fmp7iW6+E4Rn8i8d5uUDxnsihNv8fvXUwNl0tjWPqDPbQRTyyANgYfIjaUvBu+b2huA/sLBUEyjLgtzPJpHMLe0TQ3LOywkpwWuO9xqsiSH8ymxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4KlZuEZ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4KlZuEZ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3964e480f76so2181500a91.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 14:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788385134; x=1788989934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=51ibZFOFagQ+E9ZIDyF6lkMloDUoQoVNjs4ypi5okac=;
        b=E4KlZuEZkT1KfbSLisjkwWi7JEyEk+K4nuog4aSXS81zzVZ0fDTb70pmhzTV16XguG
         u8gJQ3SK+eRAgtdnPUgsTRLSbfBFcASfF2WnZHNySEc+LXmhLsxEobCQnlraPc3a4Jkm
         pFl+bL+ET0fnD9U32EYde24Lc4HAu+YNaBzhpBJCcB+Z4TfeZYW1JV+GJYUhu76blfuX
         KFwzMhsczPUeXMy0OxpbreRsW3y9gjVbsaaRevYo41cjC5ypnWVBToEQA90PDKAcjsXX
         CcvNIaLG8RJ/de483JaYnQbEYPtiNDs2HMWPzKHQgXHbbDO8Xin16/4+4jjMRJhRXPsm
         4zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385134; x=1788989934;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51ibZFOFagQ+E9ZIDyF6lkMloDUoQoVNjs4ypi5okac=;
        b=MR0ZGqoKk3p7rnU5/W67jUBwAoFnMz8uO8XvLCoAXEGLyrRL6XOHB6rlVYLxR/c9OW
         3QKXGLN1y2Y8ezrTK3BRq0YN5M4cgc873taBF8OhU/ddEMgrGanCS+MlsxePMjZY525k
         5mdhafDnG4Z3UDP/hkIt7xV9JM9MkPhwoyngi876mLStYJ7DOFo947wkKQlWR9juaQQQ
         MlzjtJTI+8WGdbELQDwiuvbqwcUGaj9Qu8PkvIE/xsGW/Uz1D2x/ibLyPG1aegDLmGGg
         Ko/c/92479CzmfN/xh0RA+anF+ngALucCiaHcbAmPJQ6qeNXuHrCC7fKIUVfuCqaBGpq
         oylA==
X-Forwarded-Encrypted: i=1; AKwUvBxIf4V05BjoaBg4LgMwJtEtqLuNVeaTOkKhOAhjnxQfcVA/Kk3UuyvfgudK6mwZLlkiiUDiBjAk7doi@vger.kernel.org
X-Gm-Message-State: AFuF++nlt5IQwJZ4II4hMXe6PMBuurZJnJ79vUCjtGBcHjz8QLdV4FA6
	DINNgAomrNiewZ9Ja4mEqWclTFLsAo4eZZjDUQa+FiSWJ+SnL1DpzJyl
X-Gm-Gg: AYBFou3VwCLDdn2NDpS3/Z5Oz7ze1II7o34Cvt9/YbTFHB/sGv6q+q5obUP8mJWmc6p
	5EnbjMLqtrjV1UiyfTlLFG47Tmz0UBP+VcYlCjSjMrLLFY7Mc/TDWZ8TT3iHUy41mbcqlaa6oT5
	eQgUToHphjKYJZ6f8R/Iw8Xr9CwmLWuUQL1DlX5P0rMoVMqeQfjWOrpuKcTTGKJtmDNy4ls9IlV
	aymWn13uTAHcjk8/GpEyI8KznkYIGS5iRJAX7E5z5F44jl47vCDLXVQ+SgsSXGgti5b2k5d/fgY
	/mEjtwjhLsW9PfBkF38bDt5XP8ocyzeidzKXROTIYeRI011PH+uoN3RzuvQ3NGXX/QUQ5zgfQqq
	jm9qpIOEp/25qEWobRcNZhmoxsoroJU7og+wylA64rd1Z3vJ7U5oa5meJ8PdJf+TT2nJCVB2CUd
	5D+vE09VZnMhmRu7rOBMFrGABURlIQ3P220Yo/NDlHn6HXB49MjAs4O0zaTiBrh83SLAYvXiwBo
	Q==
X-Received: by 2002:a17:90b:4fc5:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39aedfe18c0mr12990696a91.8.1788385133676;
        Wed, 02 Sep 2026 14:38:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875e5e9sm1358930a91.14.2026.09.02.14.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:38:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Sep 2026 14:38:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/tps53679) Add support for TPS53622 and
 TPS53659
Message-ID: <56544fb0-55af-4e1e-83a6-73107bc152ab@roeck-us.net>
References: <20260901211129.360792-1-sanman.pradhan@hpe.com>
 <20260901211129.360792-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901211129.360792-3-sanman.pradhan@hpe.com>

On Tue, Sep 01, 2026 at 09:11:53PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS53622 and TPS53659 are dual-channel D-CAP+ step-down controllers that
> use the VID VOUT format and VOUT_MODE identification like the existing
> TPS53679/TPS53688, so they reuse tps53679_identify().
> 
> Shorten the Kconfig prompt to the family name and list the supported
> chips in the help text instead; this also adds TPS53685, which is already
> supported by the driver but was missing from the list. Update the driver
> documentation, including the per-attribute lists, and fix an existing
> "TPS53588" typo (should be TPS53688) in those lists.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
