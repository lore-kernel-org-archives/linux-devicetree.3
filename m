Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D4738424C
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317912; cv=none; b=uyuUDmYQ6EmiJ5o1UDbCbJFPuyWkU8t5tD4IOL4KmV5a9J+QplmKp+qX/fgHyIxRD2KIh8WEFG3sepRNhSBuA+ne3cVN9eUut/75JxNA6o35SwxuCzWmQm5dMfwEW5u57BOSyj5l/VZ2N4o3qY7U3zQARgPyJ9cSHUxxmxvCECA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317912; c=relaxed/simple;
	bh=+ehVjjn+FFP1aRjNxMvD8VGxFjrfQtZn+7RGgcX7Sic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBx+owDZTyfNEiCNHcw+1qIWfN5AzmDXnX4IcrgdeVvTbddlXD+7qciEZ2YY7bXqBkm1eMNVAVeXWqxB7wpCoiebf5Yf3kmzKp9xo9OCAeq2CHj1wliYepjOhSyGdqrcxD2WrRY9G2+QHnfTD5V4UZusNlhIvzNHHTIL9osQLtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzYjxuNV; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzYjxuNV"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cfbbf35354so464976685a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317908; x=1774922708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WhBxiKr+CpFwBrUC+deA+ndmr0D+vf1b3ZxKGdD13Q8=;
        b=nzYjxuNVWsy2FAJrdUup/mIJSbRkLFV8btqoBVKVP6d3j7kaRWMaVCI1a9kj5foQ6S
         dNkE2Ur1Mcd6lE2LZ5+/gkgtKM0ls0uYRXYuAvYgnJwg+bmjKkVlRZlObOn3qVfzTN8R
         HH4viLyYStE366bC3xc700XYNzdbUVq2FgELOFvyEMqN2gmUOAt3r4ZiWNVE20yvNN8s
         BZDDAHTmYUNlIhCFRyC4WVuL2lmUGpr5WNwEPmhwmvgqkyhcoeiw3yGJ/gahQExhMZ+x
         +q2lDIpIk6GrGVGXcvcrj1qxwqJSTezPv4CIOUaxx7371PuaZH8t9xo+WPcqSHRODHgI
         XPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317908; x=1774922708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhBxiKr+CpFwBrUC+deA+ndmr0D+vf1b3ZxKGdD13Q8=;
        b=tAQjnUMqwvK1A+We4L8yBe8o8TWhGoJbe2vwZpeM1J4Aio4rx4TnLRklZsjH38rlBv
         tCkxuMJ05bGBFwMI9f7rDygGasfe4IbOx1KgWYt3SpCfVRQYzqXACyZ6aJgnlH2KnEza
         kW4bZDJ0deOQgex8wka+hBpL3GsvcXGRoRyaYPzUwt/9xV4GrrOgdOZW/HVxyEjxHMI4
         ZObieMljFRUc8Phbcl3pM38lOScm+v/YDE9RPbvdrib0IhoJtz07TCETKL8muzPPplyY
         f7EslSm0sS37IDZ6uZKUAK6H6MSSPnd1c3MnQfqntGXi/DOWm1ZAaABZPfRx5GMTuZiO
         K7uw==
X-Forwarded-Encrypted: i=1; AJvYcCUTZT/Yaco1T+P3RqbprFvFo+BEzm4JixNp1P6UXp9TRXQw0t2Pr6QapTtzXZLpkigX0RDn7GTwHwT8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/4zX+jrtQhlPL7+kU3n0yyRnYSxHMWurCm7qSufyAEU9Q2HgU
	bGVLqYgmelTnOqB5wWjZC8CKBIMWK1X6y+tae29ATIXeD8Zpa5xgKoVW
X-Gm-Gg: ATEYQzyk5FjDM1hHBuZq+dd+/kdxP6IUcIiiODL6pp6NmFevqwVl73HmQB8L0s9Jfi5
	6haxlHrKpnKn+CVCDmUEHbaRCezSX5XmBSPwyeyjSNfP3elvyRDFnz9osSBUVo7t/OFnub/1Xiy
	KIJYAXbOE16L23NSMlvIJzHmhBwZfnX/xNr2HIAXqdCg8cC/9H2fQwejpaiRW8LwyDnjc4unMBZ
	7f05RoU58kojoFyvGm2vMWYUOJIsAk/G4QDorvGj64oC8TlamTy9xWs/P94y2YdDr/RIAsq1e9a
	uc8m3h9JQDda5Z0vUHBq5nahgA/xyRFsb7xaH59S71KHjfDdvn6lwDa99n5YUD131vsdbBGwFYm
	RJVT1l6kNAPBBtN8woDVAM3j6pHh+6+6HxuvPCcWUEkQbhFKulcqVU0pCfG3B9Y5sijmWDuJs3W
	IFaTBXhHipbHPMkf+b6M5MmEkNKWGFcaUxB8IFtS8qX6Pd7Z38dIE9fqjVAs8OAcHxn25eyznJO
	wHW5xYa9jGAVhI=
X-Received: by 2002:a05:620a:4543:b0:8cd:bfd9:e2a2 with SMTP id af79cd13be357-8cfc7f33feemr2140906985a.43.1774317908192;
        Mon, 23 Mar 2026 19:05:08 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cff5d486basm50081285a.45.2026.03.23.19.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:05:07 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:05:52 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Robert Mader <robert.mader@collabora.com>,
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <acHxgIsyPiQTeqCB@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-8-mailingradian@gmail.com>
 <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>

On Fri, Mar 13, 2026 at 07:26:47PM +0100, David Heidelberg wrote:
> On 17/02/2026 01:27, Richard Acayan wrote:
> [...]
> 
> > +&cci_i2c1 {
> > +	camera@1a {
> > +		compatible = "sony,imx355";
> > +		reg = <0x1a>;
> > +
> > +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > +
> > +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > +		assigned-clock-rates = <19200000>;
> 
> Extract from #sdm670-mainline:erebion.eu discussion:
> The imx355 can operate on 24 MHz (on both Pixel 3 and 3a), but Linux kernel
> driver can operate only with 19.2 MHz.
> 
> I assume it would be worth it mention at least by comment here.

This might set the series back because the devicetree isn't meant to be
written for specific software, but it's included in v11 because you
already asked twice.

The frequency could also be stated as having "better software support"
in general without mentioning Linux as the reason.
