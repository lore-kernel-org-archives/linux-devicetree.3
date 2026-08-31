Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B9C37DEA4
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 19:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203514; cv=none; b=II2dPvUSI1EbDEIiHvx4vWhDgxtGJiwNIpf9yr8mAadHvaFu+Gh1mr1iJWWvuxytzogHQCvBdi+4klhdnoBQXmppHm/+f+MicXLrPvHMPgoZsg5B7rbWTsTZ6UwvJT94EusfogIboG2P+/e5RxCyxp16ldYLuNYIKP4acKDE+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203514; c=relaxed/simple;
	bh=FXXEx4MCYHMjoxsymbkUfncpijpehd9wrTIFJ4PF3ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bt1U5OA/2rqk61+Fw6jtXsXliXeQMDyEuleBbArcnMy1Evc1t31mkAK5rpswuzmvrWWtRkkMaMlQuRO+jp0kqsNZfvuZF9VVH1diSH/lauGiyD83owuiyhp9Bmfu42WOfp9uVPG+6aTbIBRSXhiS6uU1mlODZz7XPEgzwhD6FRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gopcgmuj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gopcgmuj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b965570d7so793215e9.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788203511; x=1788808311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=160ghW89x6vVgcdXm0ih8CF8apLHqLlHRmefcz3+9KE=;
        b=gopcgmujNuj9AK+jElL2BIRO/PFcQXLVhNE6qzB4y4gNE5hHBOuFjVrOU8gtJVfbtu
         uVshklIfiElQTkAD3YZ35xTFCHIdGlE/QqPqEKgZnlOlQLQ2Bah2xn3cRHCSTDbjpP+E
         CmPVxujrcGqt87MWNdTIeep3Rinyz/L38D9oJJht3fIhFkQF1I4vRBfytMwOf0mkG4jh
         tweKGG6g2Y8G0jsX+MQozPLz7VesGA6ftLiZ6yPgUUSLSSb9OffXDL4jbTswGSRJo+Td
         bVmt2ECTAqd3EkHQAn9H9Rq1xwrsJKJMtte6SB2UFoTMDBpiQZPtPHrVQozmEjCnRgUx
         XtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788203511; x=1788808311;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=160ghW89x6vVgcdXm0ih8CF8apLHqLlHRmefcz3+9KE=;
        b=Aro7HpFHXo+8jPT3MVeM8jECSIqkDHib1jU6/Q5tvao6r8q3FwrbpgEmAp7c4SS2bv
         S8LH3bDTqeV6g7fXTMw1XLoPTriiFZXTBpKsS1lDvXdO9+ur7TERxh+i6lJUrzmIX346
         G/Q58BZXMYR3rJDS/2Hr8pNDxKmonHGKR/Sdxw/pojARS1DAALOQ+hz4BwpSGhdkup/M
         ckv/cLQvTi5fuf9aamr5zMCvHr8nX94dPmJjHG7OIFOfKyuevqAWA4UqPa4FylL1lKEM
         GEEllel46OEQFhvxQWhMKw1WCqs7l2COCOl7dSy8AhQVf3hHKHJZ+88GB8xGGKuFDFaw
         P2pA==
X-Forwarded-Encrypted: i=1; AHgh+RqQQ4q/HuQZK2ccvSpL95J4F/FS94rKXdWlc3jaaefw6XMCBzL2Jr05+LQIT+tmJOVDBo41IaOwVd6d@vger.kernel.org
X-Gm-Message-State: AFuF++l8FYqCTRpME9qFbWslEhVubxqmny7FFtammXGr5J1tI9yd9gXx
	RT8oPPChPzngYqxAkpjNiCvC5sb1JWKUqcLyWrT5MaN2TdQ1Y0ZzDDIY9/K3EEtJgbI=
X-Gm-Gg: AR+sD12Z6nYFCltzkajGiDx1fO0q4ocPKs7k/x8nGJW1uFZdh3UnHv/7bQn78ktPd1C
	tnJ+7ebYDpMaKOY5DCmNnurbu5dCsMNs7Da7GH9MQ4n5VTBA7jlP+GRklyQ0zwAujwN7jhmEAhw
	gS5mO3i4T/IiKVKdSHXHMD0G7zXK8oO0pnVpJUy/mMCGaoUdxsoRXDnb5j4Bkqw2RBKgznZTpss
	W3wYnJQ8x1yu/YcziFu+Oyjk61IlK6Bb96gwrvuL8y84IQokaeAWgGN53SlCawPz59Rm+ouynzv
	2/Xhogvkyf8iN6N20qd8iOczNiR6OiGcRbtcy6aQlyRvyYZnAYspQp6cUcIpwFojU5w2zo6p1zB
	dhm0ARPwDmRwk3805sXC85Jl8wpuRjKWnafuAIkIZP4SPp+Ok+rk++YH7iMaEmMMgOS/TEXAhBq
	NF1lLGTUKxV3cjMQYnXIG716wc+M9odZubS3eNWsc/jWxuyrSciSHxjiTw+J8uG7js+kYMZz3b6
	A==
X-Received: by 2002:a05:600c:354b:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49b91c4fb4amr418655005e9.10.1788203511166;
        Mon, 31 Aug 2026 12:11:51 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7241:bd4d:644d:33b9:dc56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb28492sm23543129f8f.31.2026.08.31.12.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:11:50 -0700 (PDT)
Date: Mon, 31 Aug 2026 21:11:45 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: hamoa-crd: Add thermal control
Message-ID: <apXR8RMe5UriwO4r@linaro.org>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-2-27108c40fba5@oss.qualcomm.com>
 <apVCUObyxf8Akbsc@linaro.org>
 <apWIbtyQQ4mOjZKn@baldur>
 <apWnounPP8kRxFeb@linaro.org>
 <apXBxvBlgWa3xfEQ@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apXBxvBlgWa3xfEQ@baldur>

On Mon, Aug 31, 2026 at 01:14:06PM -0500, Bjorn Andersson wrote:
> On Mon, Aug 31, 2026 at 06:11:14PM +0200, Stephan Gerhold wrote:
> > On Mon, Aug 31, 2026 at 09:20:14AM -0500, Bjorn Andersson wrote:
> > > On Mon, Aug 31, 2026 at 10:58:56AM +0200, Stephan Gerhold wrote:
> > > > On Sun, Aug 30, 2026 at 09:02:03PM +0000, Bjorn Andersson wrote:
> [...]
> > I have been working on finishing up my corresponding patch for the T14s
> > (which is something I can still test unlike the CRD). That one is
> > unfortunately currently stuck because the SYS_THERMx mapping really is
> > different from the CRD and even the schematics are not sufficient to
> > understand where each sensor is located. The mapping seems to be
> > different from the CRD, unfortunately.
> > 
> 
> Yes, each design have their own sensor setup, but at least if we land
> this we have a reference for the mechanism.
> 
> Would certainly be nice to get the T14s pieces landed though. And I
> would consider it to be perfectly fine to not fully replicate the
> Windows/ACPI setup - since we don't have the additional layers.
>

Indeed. I tried contacting Mark Pearson a few weeks ago to get some more
details (since he offered his help in [1]), but unfortunately he did not
reply so far.

I'll recheck the info I've already guessed so far and will see if this
is sufficient to add some basic thermal throttling.

[1]: https://lore.kernel.org/linux-arm-msm/ea0b329e-ab3e-4655-8f27-e7a74784302a@app.fastmail.com/

> I did peek at the Dell XPS13 DSDT and I see the same problem there.
> 
> > The ACPI side is also extra tricky because it takes the thermal
> > thresholds for the thermal zones through some lookup table in a random
> > firmware memory region, which is also applied depending on the selected
> > fan profile (for the T14s: "low power", "balanced", "performance").
> 
> I think we need to just treat the current ACPI situation as
> "inspiration", do some measurements and provide something that seems to
> work for DT/Linux.
> 
> And if nothing else, it's going to be way better than what we have now
> (i.e. nothing).
> 

Agreed.

Thanks,
Stephan
