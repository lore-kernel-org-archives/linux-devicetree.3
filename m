Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C188A398919
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774325255; cv=none; b=qFfkuO7xlH1XapmU8h7zI1CoNobxOGSgtDB51cdVAMGI9IKds9Bz69cA0e7lyfBKgxRtklpAWEupDK71YZHHMLeXh+Await4ruf2uOUpxDShdsvTixJnhdNFteE6FyYbdxqyd+/LzVX8ThFfEqHuke0O2678KIfwawNQfTopBhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774325255; c=relaxed/simple;
	bh=9CGkjdaf9efUWmVF8DkWsBSG/mNOtkaQY4XZbz1OfAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZEhV6j59JPFIFeUjQlUGwE+rx9POzdcxIJ2JyUfOz137g5JdNepP1MVlGyRzjKnKm7jKR8oqy5ATb28Gz52Q4YUa24qtjoRHSQQSV/9RRaLLCJ+VsRKHkKrbmJW3bzObDby4L3gAGkO19T1WEpDuD3h+O0jf6zhVq55iioGnts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ygsIKuOt; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygsIKuOt"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82a73593410so1784619b3a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 21:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774325254; x=1774930054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m7SqHnHYZqEYtwdh+YkC9S161bBgEEEQDmxfAGwav9w=;
        b=ygsIKuOtMQ3hKmi54IkJFj3o4ZTQvxAPFmrDZQA/WuJX51JT3yp0RQLBgpcEv9vwZP
         dQwPi18O2PuJPVTDi+X2mt4zV58XePhM+0EN1t+26BMOWBR/kKtACbUi4Ja5lngZjD/e
         pElL+06ucmyz/aBgmWzkHIRi8Pi+HqaDv2horrX3WOljIrl8r7dG0mhen54QKU90BWnA
         zq2pM7RPhd+C9vOHS7iIC0yzSNIfXMMQPSzzMrClqBMsDCCyn2aYhD0ZyVlDa1O87gKA
         dhMBEeq7OkHCtnsKBAf4vAgAlKKyMt7uLrF/yI8O6pYz1hVlFToL5FSDzlf18UsTqznW
         ERog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774325254; x=1774930054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7SqHnHYZqEYtwdh+YkC9S161bBgEEEQDmxfAGwav9w=;
        b=lN5dUPLgVXUReD5V8uRis7/rbfZKOwDrAJPKCXLHGu2+3mQEao5DTxOVcJVju6ZQLQ
         O3GIfMZvKjSKH3fv0IdiqZ8Y7qq4A0GZWJjnduPbbdFMIbm98FJq3Bo1WAcGW3+13GjX
         rXI2lyInECIQiCmWQpMWNGB881kp+KF53YwcpN/egGb2aBVtofZfjWfRPnxo/q40yrqY
         2Tpq9bbjYwTe7NgR8f/fPv9HlZPnHBCLPjX7IV0kudt9BegYWhceVKJk3afeLTSR9pQM
         EC6WcTiLoZN40Eyu2V6XQnp0UlPgp2QZFBrmgEKKmduw0q0ArYAb8R0ZfSME03NFZdvK
         B0eg==
X-Forwarded-Encrypted: i=1; AJvYcCV6Uvdje6Kc/t5XrIRsTf3A0PjXjvguH2M+oczZTlxv2I1fvB0aCcsd3w6dZIjCOcPoqEXhV3q1v+oz@vger.kernel.org
X-Gm-Message-State: AOJu0YyL+Z16nsEDIoQWncNRGxOHiZHI/ilAMtp92np66e7IYikP/gWQ
	r8BbGT/2Cb/Q8ytby2H1vgxHMO01nt7zxe/qF3jpa7d1qrr79ygLSylumGZRtNA84lg=
X-Gm-Gg: ATEYQzyxRiBvpd0EfxHTibKXf87VDK07idqZaGpIht0SKw6PbLSr52fnS/xdoAIUBNU
	/4fvBYzCGuWI1H4VTFJujv0aQyvYnBdkPgdKQX9TJEcdtGmoyJzk3Vu95XmqwRp8cGKM5sh5C01
	BqrXdepE7g9E6PcFJATfeVDsPOUEpfIMOJvVmLTGPi3WmyBvsGhAfGdqkspAFA6Ps3onERXqUEM
	Jb6B8/3s74j5NnUGWw8FYePjiNrCO85EjWABkVN5ERzQYEIkbVJbLQMfW5GXT0Lk0RouAt0mNpB
	jbwoSI2IovVPB2lpCfLtHUoV8GUYUAB+zBY3m50HZVTuzX34dEDXk4mc7IBqQ3nMMMCUUMQwhtb
	yVw5Qo6CAIJsShhrXT8bKJ41M+5JN5vw34a2/uzWQLVAqCrHd7zwxfZs8ACOIKuoTGF+3NT/5KM
	wTwgKTEaNbXQNYQlqUsagjSuIArB0oGhak5rY=
X-Received: by 2002:a05:6a00:3bec:b0:82c:2155:5b6d with SMTP id d2e1a72fcca58-82c21556203mr7996673b3a.12.1774325253941;
        Mon, 23 Mar 2026 21:07:33 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409bf65sm10979176b3a.34.2026.03.23.21.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 21:07:33 -0700 (PDT)
Date: Tue, 24 Mar 2026 09:37:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, vireshk@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com
Subject: Re: [PATCH 0/2] dt-bindings: thermal: st,thermal-spear1340: convert
 to dtschema
Message-ID: <n6jllrlsu5fatso5geeyjgiuefzj7qclkpsptgpowdy6splnip@re32x6zwepsp>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323133814.14152-1-krishnagopi487@gmail.com>

On 23-03-26, 19:08, Gopi Krishna Menon wrote:
> This patch series converts SPEAr Thermal Sensor bindings to DT schema
> and renames thermal_flags property in spear13xx.dtsi to
> st,thermal-flags to fix the unevaluated property warning in
> st/spear1340-evb.dts.
> 
> Note:
> * This patch is part of the GSoC2026 application process for device tree bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> 
> 
> Gopi Krishna Menon (2):
>   dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
>   ARM: dts: st: spear: fix dtbs warning on spear thermal sensor
> 
>  .../bindings/thermal/spear-thermal.txt        | 14 --------
>  .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
>  arch/arm/boot/dts/st/spear13xx.dtsi           |  2 +-
>  3 files changed, 37 insertions(+), 15 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
>  create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
