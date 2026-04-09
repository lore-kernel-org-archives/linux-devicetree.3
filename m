Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AD4324B2D
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 21:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769651; cv=none; b=f6QOKbjp+FzbpvXNs0DIhoA/j3No99ha+Is75UXAUx8X/b+weKDlIowXSCtJzpZd4tY8jyVeTXDculABIYt7ycrgnmeFOS5R5IxTPTIS+Icc0EW3f+CYCbjd1ddcxFpIiV0ad2xi8RxaLcE3/v3V1J0PFTNzA2Rkf3kNDtV3pis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769651; c=relaxed/simple;
	bh=5uOmEpadRadRKkZuxWXITM1R8uvvnmGzgwB99E1jOtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azoj95WF1ldzQU8dlEXGDAm+mg9xruwbZBVvOwD/JYIe+SIaxPH6ntZvuuYylP/bVvWPXEwb8EOLBIssrXbpuPL+e50EA6xac+vI8u5IfZ7AmPhL7y97kd9w3iosI/cL/66aX8b8P0ZPH20pUS/loAlC7bEI7DwaH/t7HCbH5bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7a1Tghi; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7a1Tghi"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c76eea1672aso513679a12.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 14:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775769649; x=1776374449; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sr5YxopLPPl6Lhy7H+cJ2Jp5D/0HQnUmZSE6Kn+2cL0=;
        b=A7a1TghijWOY7IB4jn32kyk5mAY2jKgFQYsEsxry1kX6tsdsYRaJrZbZbnsLDzrRkI
         XgeqtKVC+k6kEjaZMhxIqzAXfFeMCVyBOcJi3BrDJ7Rr9NTcVuTKu2ZP9K2+7KLycfBu
         AfamMjAsI6aRIkH0XbrQivKcXBM6eFVQ3v+aP6ttTQ69pQppZRHz+tZZtZwGdmL981Vl
         3xQMw9+RbB0Xxikq3Kcwe5XnPvpyxZQqBsOa0cqziuOMVooWRXAo2m68vWQeYviJuyEv
         0/8nfjngEO5YfnxqLJr6sdMt2hoNMTzrT1pIhks3i5/BgfId/ki5+racs/AP3kzU6/oR
         cBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769649; x=1776374449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sr5YxopLPPl6Lhy7H+cJ2Jp5D/0HQnUmZSE6Kn+2cL0=;
        b=AZ+KAHuE/FCdKBJtXnspEcitxRcxtl56nBooa2lqYLM3S5pD+CuBxwyf7BQkQMiNbm
         SSQ8Nl35UGaCiQLcrDdI5aTQYaXjj+ZBfZVlrdnfqML01OpiOT6KkbmuLPtt6BZaIX5z
         pehCANc0uYEYyal6TjDVlIu3z/1cWpsRFiBxH8CYV649Hj8G4oszA8i6DGjJoAkVo9UU
         ikplr2J9GY3JlQ8bJDsGXWb5tIbIrva+ysdL2tcJgEdfofu++Ql4V9xmXZgmZXtKfufN
         DVf5qL+3gEhZOkrcKxbuqPWhgAILP14EcGn7iHKjcFJP9a2LjNhbLZDGEJx/rA90oUaK
         qEaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkn7URlnf+wzIiXCln//WpHglSs0XGtWHRNsavO1mThF6dcEyr52DeBIi73OaPi0xQJWnWdM/wSSRx@vger.kernel.org
X-Gm-Message-State: AOJu0YzDpZ69A81RHzxLJsn20Gm5nx7hNSTeslx9Q7XwoId/E2GXzwDY
	vR7T9y/n1Hmp59uZr4gJF9KQGmdOXjBKEqOn/2H1PtUgvX2Bpo6zZbV3
X-Gm-Gg: AeBDieutEWa5tHkp7mNRX3iLgDO6EWPBpzOpstc0A4udTF9aZ9BAscSDyO6yUoGVpAk
	6Mph3cvUWE4YMO1U8Kugb35EwxvRUGurX0GPUU4q286OQLyxrQ3LvW+T/FzMe3Epe/YylUIZNxI
	c9idAhC+YO+2udpRptV6B6LLA60diH7QnmnviUWkFaweYEfjjL8JsiPa7tm4YPot+Qmitnlh+SY
	RrMxSageSK4l4ClHWFzPUNiQSY3ozBs/38jLUobaY6LcNz1a/YDNSUZM0iC8nUDKF+4oqRkpJuL
	xIOrG0U675calL/YP52PjJ8DttkZ1+VU+JhOP3rNltKB9uHhmVZNiMiKGV8VUIz2LJfU5Ln4Nqa
	mCiEa2rY/uKRaTP4bq5stmAv9hHOMyd8s8eg+D1r7Sx+vOPvL448nIgfSF19/Celb9U63hXKkj+
	0AxflJmTTi7/krRxS1XnnwnERfqSEMfocrVeqR
X-Received: by 2002:a05:6a20:1588:b0:39b:989e:6d34 with SMTP id adf61e73a8af0-39fe3c1c2d6mr551016637.4.1775769649341;
        Thu, 09 Apr 2026 14:20:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79218fc64csm344061a12.11.2026.04.09.14.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:20:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Apr 2026 14:20:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/2] hwmon: pmbus: Sony APS-379
Message-ID: <9abbac2b-ef37-4f8f-9193-f704d1669189@roeck-us.net>
References: <20260402024101.4136697-1-chris.packham@alliedtelesis.co.nz>
 <cce0e8c4-8df3-408c-b3ac-6ede3c4b2cf0@roeck-us.net>
 <20ea1c7b-d7d4-4f29-a0f0-c8a8b5a1076d@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20ea1c7b-d7d4-4f29-a0f0-c8a8b5a1076d@alliedtelesis.co.nz>

On Thu, Apr 09, 2026 at 09:02:43PM +0000, Chris Packham wrote:
> 
> On 02/04/2026 23:38, Guenter Roeck wrote:
> > On 4/1/26 19:40, Chris Packham wrote:
> >> This series add support for the PMBus hwmon on the Sony
> >> APS-379 power supply module. There's some deviations from
> >> the PMBus specification that need to be dealt with.
> >>
> >> Chris Packham (2):
> >>    dt-bindings: trivial-devices: Add sony,aps-379
> >>    hwmon: pmbus: Add support for Sony APS-379
> >>
> >>   .../devicetree/bindings/trivial-devices.yaml  |   2 +
> >>   Documentation/hwmon/aps-379.rst               |  58 ++++++
> >>   Documentation/hwmon/index.rst                 |   1 +
> >>   drivers/hwmon/pmbus/Kconfig                   |   6 +
> >>   drivers/hwmon/pmbus/Makefile                  |   1 +
> >>   drivers/hwmon/pmbus/aps-379.c                 | 178 ++++++++++++++++++
> >>   6 files changed, 246 insertions(+)
> >>   create mode 100644 Documentation/hwmon/aps-379.rst
> >>   create mode 100644 drivers/hwmon/pmbus/aps-379.c
> >>
> >
> > Sashiko still doesn't like it.
> >
> > https://sashiko.dev/#/patchset/20260402024101.4136697-1-chris.packham%40alliedtelesis.co.nz 
> >
> 
> Just out if interest is this something I should be looking to run before 
> submitting? I was put off by the low quality results (and dubious 
> license) of some of the earlier AI code assistants so I tend to avoid 
> them. Time to revisit perhaps.
> 

The latest AI models (both Claude and Gemini) are surprisingly good with
code reviews. Failures are often because of missing context information
(for example, Sashiko doesn't know that I3C selects I2C, and thus that
CONFIG_I3C=m and CONFIG_I2C=n is not possible). However, it finds lots of
problems that I (as human reviewer) had overlooked. Which means that, at
this point, I trust it more than I trust my own reviews.

For this reason, Sashiko now sends review feedback for all patches
submitted into the hardware monitoring subsystem.

So, yes, everyone should look into the results. If there are obviously
wrong results provided by the AI, we should [try to] fix them in the AI
prompts. Sashiko is public, so everyone can chime in and submit prompt
updates.

Thanks,
Guenter
