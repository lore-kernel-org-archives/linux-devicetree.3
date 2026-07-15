Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4D619ABD8
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111676; cv=none; b=joI4I/MdLUS+9lGLavrE+tVuRMJoLsDyEefyO56goy5D5Hhau6AR8DS85C6hPBJo2mwyFrb6FuksFtW/qu5gU2YxbwW9GgG6ptR1oNWnxM/7GJYuVlE+W3yv+W95u2MTYQbzlZaPDnY7HPxZrHZJlQvmU30MsEFAI7Z0Jv+vD4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111676; c=relaxed/simple;
	bh=A0Q4nXBnRyDHakW/kK2QunLf2JcRxCVGBMNpnJ0N+Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfvXETswM8as/G6chHrWJwHvU7/Li1RhgdZtHiRqeWczWhGNNWN1lFJWwXoO5Zc3HqrFAXU/bRYbb+QXaOHn1OSYIhs22dRJvkzKcoiwWWtm2sbRohm0sVCCRek+ALRERtbRxraEjsMBUoq6RHQUJfkQbOLaJwkYb11MzI+tHA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RJsQ6Hml; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RJsQ6Hml"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso36219275e9.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784111673; x=1784716473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KijEZeJZVwscbyyyI2a/znLma4yo3YhlEk1e+25at/0=;
        b=RJsQ6HmlsUz1MgmSldwANQXH2zBsjqKklvYEcn25giXG5t7ZKH9g476HpOvlpJuhw0
         29P8+exLCJaU7Dv+2s/AxSShIk2+une1qTqei6HBXBZI5xj4W4vvJhjfAXD8Q2asB1Kx
         +U6qHDnpKzXboCTdzCttvA+0WLzpx8yVMbh+dGprIaCyxDwxNpQxF8QpMiK/Pwkb9/JR
         S+15vtZ/uKf4Y9p//uPobjtRUX27/KJ1FBVa7xaZwX5RyuyJljAJ7aCRdNPj7JY5kYlO
         Fg3VHLkD8S5w2LweE63/1gJ+JsLCLr2oh1N5GMtGHw83gtHJHBGb3DQm+pwMTfyRaNXa
         Z+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111673; x=1784716473;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KijEZeJZVwscbyyyI2a/znLma4yo3YhlEk1e+25at/0=;
        b=sGN3ZnIjd9gyZyjE1DkDTDoCxBmkM4FU86rraDW7ug0CJm+LpzHEM7rjIEYKjJmGXI
         PRKeMcpPzSWRCvH2ShyOhnt8r3BXKq+l9gh5JUiL52a959x0DeWBP5++51WhaXDsyOpK
         N0HNbwtnRTTb/mW6Ci402Hus8vXBNTdYYCDQgo2lN9nAdaa4gz0asZIucDVNvCIzi/dM
         IQ+y5jrcW7hJ3f13IXqC5g7q2RRoX9fKzFOIb69oPoO5aDv4XqZv795frDGnkbOOhk0v
         dnbNlweMYoZTMe2moC02UPFY8ZVGaOoYoOuYLOBn444apJrt62r0eqGn1FwtHgWE7YVO
         sBGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrn1RuDUrGw7nrmepReBmf18vgi4ybsi71cWzGtgnOj2q5J3NL0itI0oMAR5m/yNkfkn2JiXIAFruVf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5FaM7nHMZ7NiA4V7I+RRiNdIW05EGCzdPjsb+qf1kOHmxkYib
	KNusQnWSMw24GwJM8T6VaZ3y2dkxJJnKq/JckYzA3/k7Hp5Pxgcad1Mi1ydALsnYV8k=
X-Gm-Gg: AfdE7clIRfoXxUE6f21vF2H7y6KQgwcwE1+NvfZYwbz2agIiGjH/pOQyduM1aChYMrS
	PJj0m4kdz2xIzdEfZLarjVWMnNiD5vg3d9hUz9ZGjdM1hbz+xS6WXkkT7Pz2q9T610tPjEq7k9j
	yZF30+24fiVf4KNo7E3OoYDMOwhe4veGAqhvDqSFyeMBv7aRP0MJSdw1YdwyxzZYBNAsjtPqYWn
	7GDJkbmHmhScqMvWTscKuimIAhyQHYATefUYcOJbXPFBXruZVYij78t+4GJeY/GvdXd9GB6iBzr
	DNv5y47+Ix/5dM7yu73smzHRHyKpgTm1MX9DVXz+PX2meBrHsEc8lkbiF8as69XGiOWApwqvvPZ
	nzbS2+5kzmwuwRCPhS63/P5oWelk2c6nFXo7l9PUnMnfvsxQUc+UZuCAnduLmf895ltCd5f7YxF
	TZ/Ccl9pE9YTnwOdbfKKstnuCm
X-Received: by 2002:a05:600c:c174:b0:493:bd37:1cdf with SMTP id 5b1f17b1804b1-4953c14534fmr27104355e9.2.1784111673018;
        Wed, 15 Jul 2026 03:34:33 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:d62b:a557:d06c:e9ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495087366c0sm256049915e9.7.2026.07.15.03.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 03:34:32 -0700 (PDT)
Date: Wed, 15 Jul 2026 12:34:22 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
	Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
Message-ID: <aldiLuYib1jCK784@linaro.org>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
 <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>

On Wed, Jul 15, 2026 at 11:46:58AM +0200, Konrad Dybcio wrote:
> On 7/13/26 12:25 PM, Sneh Mankad wrote:
> > MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> > the latest wake up capable interrupts when the CPU cluster is entering the
> > deepest idle state. This is done by sending IPC interrupt to RPM and is
> > implemented as .power_off() callback by registering MPM as parent power
> > domain to CPU cluster.
> 
> [...]
> 
> > If MPM has not registered with CPU cluster power domain, utilize the CPU PM
> > notifications to manage RPM communication when the last CPU goes to power
> > collapse.
> 
> I have mixed feelings about this case. The RPMH RSC driver keeps that as a
> fallback for platforms which don't have PSCI OSI mode specifically.
> 
> On the other hand, there are platforms (early arm64 - pre-msm8996 and almost
> all of the arm32 platforms) that don't define any CPU power domains, so
> perhaps it's necessary after all..
> 

I don't think this fallback is relevant for the non-PSCI QC platforms,
for the following reasons:

 - They don't define the MPM.
 - They don't support cluster idle upstream, so they don't need to
   define the MPM. They can't reach the idle state where it would become
   relevant.
 - The setup for cluster idle without PSCI is essentially equivalent to
   OSI, except that the SPM/SAW driver needs to program the idle state
   to enter. There is one SPM/SAW for every idle domain (e.g. on
   MSM8939: 2x4 CPU, 2x Cluster, 1x System). You can just model the
   SPM/SAW instances as power domains to get the same setup as PSCI OSI
   (I had a draft for this at some point). So if someone ever implements
   this, we should be able to use the same approach as for PSCI OSI.

I'm not aware of non-OSI PSCI platforms with MPM either, so I'm not sure
when this fallback would be used.

We probably do need some fallback for the old sm6375/agatii DTBs though.

Thanks,
Stephan
