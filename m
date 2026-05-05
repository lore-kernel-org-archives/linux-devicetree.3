Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F1B36215A
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987466; cv=none; b=F8plqkwCf+Iylur4l3+CipwB6cDe3mTLL+c5k9GOZCFMM9/9anWoTNs/KYPZzGAIFk5mPBawmauG4U2MY54uwkCay4H1Flhkp0t5dBAngg+pvSagJ7xgERbkEUjVJ5MRPXyw1HqUxG5CD5DqfFuaiDKhOf8De48XL4tEtgw3Xu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987466; c=relaxed/simple;
	bh=BCQQNzv3GON7ruA9Nlhu5qOoDFbRBmprHDZTlG0oWvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6kVcbexSZoTsCrLlFekKA3mTrwDkDaMyj7ZDMgpZ/aD7sWN+9XtGNeCYunkZDsbXUeS/pqSsKxGFHiizIT+I2AZa1SMFsx5Ig9murNjvlr8zuvsx3dPvBfl9zwy8Y4y+DWQ3jqAjkK1tGJsIc2wiom/QC+0iAexMBtbpmrwMXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAPhgQ3n; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAPhgQ3n"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so3383708eec.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 06:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987464; x=1778592264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+EXrgvvQiGT0IERMW/ekjto2TEHKAk+btDJAKmACAg=;
        b=nAPhgQ3naTVbWDaYqPFOuZhF5G65dF8GYeLCX7Xcm3fOI6FVu7l+nma6vXpQdcd9f0
         f1nYbryuiliiEz/26AihqtXuAHs+M4mnfiK9vx7PyXaEjhkWbJAFRRArkW2JceEOyOBQ
         lO5UCErBXKPpv0GNPukYSBpAanciX2E/4Jpfao+cQ2lvHHtK9VDE102fiWhw3CBp+Osi
         fVCWD7Gcir43l4KDm8EwW7Clk4n6+6HZEMJ7DMVmDcG9YLQLiWkuevbymY7JPWdPd3Yh
         6SFkpWEciIp2k+iM+nUcBc67fwitziF/3ThftrFrLPlcGniI7Yh96AhvA3SmIBztLqkB
         cKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987464; x=1778592264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a+EXrgvvQiGT0IERMW/ekjto2TEHKAk+btDJAKmACAg=;
        b=k6ZERSWPefgG/Xt4D5rtxP7GRHHvUVoU1QdXlQn5SrSOmsv1LYDhGF2/dnDfUyZjYp
         rNSdRa/+qzUWvWC8ol1UskgW/M/r/7E0iP3zgG9Wl7+CnX1g62Nmtq1exWwEEWpA1ZUB
         X6KXuS76LzZhsB8a17BppCGS8D2l5+MlFYXr6bsj81MFjgWGEaUEnD0PUWbx5HypIUqG
         YtxJLYQVK5aEBu3oy0wvQ+IV4u+Dk9wsHjPkDzsDRD+wBki4OKqFUv8gBbgguQrAqspq
         An+R1SKNLrh9ZfHb0OLtlIPZlbWlMNoIKkfpkfoYAG/dFroBXzOv4XzACI/Ltl/BMjV4
         DG+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9o9BUDWxHsywK1V/645RKGq7w6RTbeJH9FGPGBf39Yp6OAInyJzeTpe6Eoac9n96+65cP8fNCj6dXU@vger.kernel.org
X-Gm-Message-State: AOJu0YxzJnDilwi0mhjwtqSsGUxMEWEnRTp6dFND9TdMiZs//ozKRBra
	2044NkoBdUym54gU/Wyd8HVk0URDXc6Bx2954wX/jLV90kpaEWurMqtG
X-Gm-Gg: AeBDieuHEE2hOsbo3YsPdS3HKDLLorJ7SKR/ak0QNleuB6+RSpfZXdhoqSuZCOCJnil
	Hs5Qm388GLud9bsmdz4RfyGO3ZAi58hlV+HWBtB4ict296WmU5XA19zQM0IpzYlUdbCl6WkcBUe
	+21VUrQwQaaORVLyJJ0zSQkYjuJyvRi7zwaTfj8WQyTuQzViwi4z8mir2aQQHEWBsbq8hgBXtcG
	pn/hKIQKpm/yoRoYaLs+lOFPSbXmcxpJmpgab2eQDLtQBJLYmFsIVeh359rCCrv/2YEO8TlplvN
	ugLSXUjzZzPTIB6dlTBqtiLtp/2SP/3wb7gDf+Mk4xmQ1RfJEmECyrO5DG8/8kHPs0p6iS5Jejy
	mZynnYfuSR2y0joOu7YjDlS8GEeSBrE0tHpan/GpzO0aNvm3ioAf827onFVXwfsbD44t/IFgK8p
	HvZP8fKXQi0bFw/4UMCqmVAJoUMvJ1YxcLLxSXR5C0zo0tlU24hWEJQhXeAbEArrRlwnBy
X-Received: by 2002:a05:7301:1295:b0:2c1:7b61:8731 with SMTP id 5a478bee46e88-2f407a43f1fmr1223357eec.10.1777987464450;
        Tue, 05 May 2026 06:24:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bb63c5fsm19728501eec.25.2026.05.05.06.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:24:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:24:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: lm75: Add
 ti,alert-polarity-active-high property
Message-ID: <963eb802-0f8e-44a4-9acd-5319cf643db7@roeck-us.net>
References: <20260504151020.462342-1-markus.stockhausen@gmx.de>
 <20260504151020.462342-2-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504151020.462342-2-markus.stockhausen@gmx.de>

On Mon, May 04, 2026 at 05:10:19PM +0200, Markus Stockhausen wrote:
> The LM75 alert pin is asserted based on the value of alert polarity bit of
> the configuration register. The device/driver default is 0 which means alert
> pin is configured to be active-low. A value of 1 maps to inverted (active-high).
> 
> Add an optional boolean property "ti,alert-polarity-active-high" to
> override the alert pin polarity. When absent, the default active-low
> polarity is kept.
> 
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied, after shortening description line length to 75 columns.

Thanks,
Guenter
