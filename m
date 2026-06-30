Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2097A32B118
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 15:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831884; cv=none; b=mHIpuAz8sD1Jna3WX+VssEhAOhhGGXmM/HJWajvDQJ2YIwNo42G4BhmdT5EVuvQeMEaOlulGIjQZg/KtcOrpZAzUlIxO95/BFdQ/7v/XLbSwAAilX6U+qsMjfknSqYdeZPn4WgAPiAqM+A3MPSaRnV5Qcw4ZbXn2HEbV+VLpX70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831884; c=relaxed/simple;
	bh=G53oip/VRJX1jkABWM0rA5x74Zly1bzZ/Ts7FsQ5UO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fr1u+Mm9iinraoVvh6WC2ZQbE1wKUzLyrqu31Rn+gRyvDt4Y8A+x2nHaG0uwy3YvwUaRrE5YQb8q3lbNjxcTCtCsZyN6TAeY9+VZnGOL4zSlkt0ytqRnv5Qm6rwE3qOizbScwRPvJEmbs5eLdT+GxuNswmo8uteubwxBUYvoAGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=EMN3kbzp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="EMN3kbzp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so38959815e9.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1782831881; x=1783436681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WMj3CTl/i66z/a52o+JrMpg3PaRS1thixire4ZFkGn8=;
        b=EMN3kbzp9gVAxGv5iRPJB+bvYs5lq5hNy64v4bz7L1Vuf1WJokx6aAnTUAm6gDccGQ
         HSiguNdS5CAXzMZunVjE1QZovlRGeuwJcWw8isamQKpWLCOYkIMLP329911mn2ECjwJC
         dgAEAQ6N/5td5G3gt3iJ9Qb8GsRaablcHcCL5EIhLZlxrfw4qRTSW5C3fOKT7SPesCG2
         Yz/74vgYbesKOLQqKNACfZOnHZnFTAFtOKKMyzYgImRizWQO9h5MxqmpWSCdtoewhGCw
         bJmwiVU2Pmc+9Y1hUC9/3XGY8n9wrplnFjnMR/SMKWsqqDFnubFnbWbot3rAn641frH1
         Fn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831881; x=1783436681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMj3CTl/i66z/a52o+JrMpg3PaRS1thixire4ZFkGn8=;
        b=VyadeQ+HTcjK6jU6mI5CmcQJL0y5brnmtqoJA2jyRp+mwYlFlNBvgGYsJveXRr1A2s
         gYoKhg9h+25PlkNwJz6RP3zyzOVWMcnchKIpWCnBXS9ysoB5/1AQgIriCppkECHt7872
         bD/c2gsWcUSnH4wwqhlJeymF3zUBMwLey7nHTKRgUh4ooIIihw2Dcnd3Z21VUM+JQjC6
         4pwm+45ZjSZRkvhlUh8Woa0nKqvAmT/IYMubcLJDppNI00NDIp1+PQg/GPLsqnX/wmvZ
         isvEmUEFI3ZpnpIu5RfqBlvYlYQECahckl6LyeT/V+fxXmfQHtwHqkUpsps29yNtn2xc
         vGcw==
X-Forwarded-Encrypted: i=1; AFNElJ9mQvIHljgo0eyepZzzdcd28n1+PF+IKtuXvpOUhR15MO8K40mhJ34WxZwQash/5XzmfhvVumcG3PMZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwkC9FI5qZgcZ2BViw61c0/5zi4sDVSDEXl5tDkpU/HOHraLZf2
	GeM6XFdpRTKE/5MtrvpN1dGZT6PVvg16fqYdBe5qXBf81JlWzJbQqNEY3Uhv9AzCy9Y=
X-Gm-Gg: AfdE7clsJYda5qfAUaEFImIEKnnVAOqfiNzccCi/G/anNCQ6gojeFG6lZUDsdd0kgX2
	sPr6//uMXHhBBbOYoMMT1Oc0bmWoborF0DJE5Own66VYX/LQCH9DSOGgk9YgwfqVDnwk62DLJkV
	ENz1fgzl5zOMPMFBWr3cQul2uxpYBMq/Qpi78mwnJkD3vpu2x8KyYpu4gpGcHhP16kZ1N+/FIej
	3fidenbOeuNcRS4Yvp1qrsm7fWSCyjIu61yO60h24LsY7F7TRyamqgJn83TmRvqH356LLQdhL9R
	eGzlnxGF0v4NKqQ39t0Q5nZ3IzTc6TvYIDZQ4+hrWe+JaLlPJodrFDRPCzk6I1OuyUKQbS68XTe
	fu6Sg4rq7MQfqqqlD1u+D6z0D4Dk9pdRniZ++hotP6eCJpKIgAUzItUXaNnpqi3oz9uxWNI0ZGe
	oxkrxL22x0OXuPoQukfh+Qerc0p78ROW4ZNl3zcHwpbWa1lNX/NASJkPTP5d7/yFKn43IOUNvBx
	qBOdMp4ZF4+57V6Q/9AT9jH7WBHYHUsXCAllRthlA==
X-Received: by 2002:a05:600c:3f1a:b0:493:b89b:9a27 with SMTP id 5b1f17b1804b1-493b89b9a97mr57185355e9.9.1782831881162;
        Tue, 30 Jun 2026 08:04:41 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:272d:c801:719d:f9cb:186:93c0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf1asm9083577f8f.18.2026.06.30.08.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:04:40 -0700 (PDT)
Date: Tue, 30 Jun 2026 16:04:38 +0100
From: William Bright <william.bright@imd-tec.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <akPbBuWU11mrCsfD@will-Legion-Slim-5-16APH8>
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
 <20260610-imdt-qcs8550-sbc-rfc-v4-4-358e71d606bc@imd-tec.com>
 <8afbc9f9-15ff-4b60-9a0f-845f903d3c9a@oss.qualcomm.com>
 <akJIGk8BEgHQrt34@will-Legion-Slim-5-16APH8>
 <c56732c2-2aff-4c3f-801b-b798c95918fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c56732c2-2aff-4c3f-801b-b798c95918fc@oss.qualcomm.com>

On Mon, Jun 29, 2026 at 04:03:18PM +0200, Konrad Dybcio wrote:
> On 6/29/26 12:25 PM, William Bright wrote:
> > On Fri, Jun 26, 2026 at 05:18:20PM +0200, Konrad Dybcio wrote:
> 
> [...]
> 
> > The PCIe switch we are using is a NXP CBTU02044HEJ, this is a simple
> > 1->2 switch that is not PCIe enumerable. Given that there isn't support
> > for this IC already in the kernel and that it will take quite a few
> > weeks/months for me to cobble something together, I am thinking that it
> > might make sense to drop PCIe support from this patch-series in V5 and
> > then submit a seperate patch-series with a driver and bindings for this
> > IC whenever I get something working. Are you OK with this?
> 
> Sure
> 
> I'm a bit curious why do you have a switch there in the first
> place - is there anything else connected to the other port?
> 
Yeah both PCIe ports are used.
Here's a diagram of both pcie0 and pcie1:
      pcie0                           pcie1
	|                               |
	|                               |
	|                               |
	|                               |
	|                               v
	|                     +-------------------+
	|                     |    PCIe Switch    |
	|                     |   CBTU02044HEJ    |
	|                     +-------------------+
	|                       /               \
	|                      /                 \
	|                     / GPIO16 = Low      \ GPIO16 = High
	v                    v                     v
+-------------------+   +-----------+   +-------------+
|    M.2 Key E      |   |  LAN7430  |   |  M.2 Key B  |
|      Slot         |   | (Gigabit  |   |    Slot     |
|                   |   | Ethernet) |   |             |
+-------------------+   +-----------+   +-------------+ 
We used the CBTU02044HEJ PCIe switch on pcie1 so that we could use pcie1
for ethernet or M.2 Key B with static boot-time selection of either.
My limited understanding is that enumerable PCIe switches are expensive
and hard to get although that might be changing. With pcie0 it looks
like I can just add the Key E connector DT node like you suggested and I
will drop pcie1 support for now.
> Would you like for that to be switchable at runtime?
> 
> +Mani will probably be interested
> 
> Konrad
I didn't intend for this to be possible but its not a negative if this
can be done. My original plan was to use the below .dtso when using Key
B: 
	// SPDX-License-Identifier: BSD-3-Clause
	/*
	* Copyright (c) 2026 IMD Technologies Ltd
	*
	* There are two options for PCIe routing on the IMDT QCS8550 SBC.
	* By default, the PCIe switch is configured to route to the GBE PHY, but
	* this can be changed to route to the M.2 slot Key B by setting 
	* pcie_switch_sel_gpio high
	 */
	/dts-v1/;
	/plugin/;

	#include <dt-bindings/gpio/gpio.h>

	&pcie_switch_sel_gpio {
			/* Change the PCIe switch so that key B routing is selected by
			* inverting the GPIO polarity.
			*/
			gpios = <16 GPIO_ACTIVE_LOW>;
	};

Regards

Will

