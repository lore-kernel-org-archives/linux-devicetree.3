Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC67426D09
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781197071; cv=none; b=PQlArJqUFBN70i1dX8cYTXepiJ3p5XJXDf7JGPZ5vN6sMAaI2hdu5fwU8WRmz2lvxbd/4niNEz141bual+zGM6APigOcewkUYChhy5tD4nRyBtH4oX9lM1PyxpE7bhoOvmRXOcwMsyJpEklS1bW0uB4/v/JCdf9xirM2zLOs6DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781197071; c=relaxed/simple;
	bh=rNBqmdI32h2ItfYChnrouN6UPvYm8fGizzqJIFfXIfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4q0XU34+Dny+71q1+jAAIffH4F04bTTTJp35RicS5XnX9uo7J3/bXlcI6N5UeKz7uIJ8m4ZjVggE7A11B1HTGbcZBoUIZln2doU3pGK7H8Ed3ByOeF49+ALhHZKUtJEpGnxVPG1Z7k6tEX5VSxKVwC+3SMRCY5nBTg+kJVG8zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dgf2Ry88; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dgf2Ry88"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso87055e9.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781197068; x=1781801868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F6VZrzStJ4BscFJtA3k9EjpEizqcPtVvIB05nAc7hZ0=;
        b=dgf2Ry88oGGGvGWzhA6bcdDsplonV87NFrLEIE5IYYT328d+RiWfj6hQpgJcHUGczT
         jQkBWlCkDNSW5elCHb1kUkZMUtvLGKJb5B1Yr7XJowEVv7d0f3ice3a39H2v5dZNQps3
         XmvE+Zi1dgG1uqUTn/RUAJVwX69bCPfe4UiPKIgLFLyr8MCE6AewqEiVyx67X/DaynFO
         8KIrZ9LS3nBkWpFSJLUOdCfanNZF0fY2NzOIKLpto2eBFUbaQPpffFA2nIBPZUlfoYGJ
         RCzt3p270gitckr2hxi5iXZS3RTMPRSgfl3ax16VTHhekBvtyTNsUp6c9OXf3KKl3ALf
         GWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781197068; x=1781801868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6VZrzStJ4BscFJtA3k9EjpEizqcPtVvIB05nAc7hZ0=;
        b=fmg5CCh+lYH5nEiAS42AoI1mzQePcHGVjfYhAgMi7Kl3IeLR3x01cnbR/v8dhnQrw7
         Ld9sYzKpcRoaiZac6ZTGcVNo0+2NYTg/GCKGHrjYqzU48aXcFf6E/g1nB+jrayR7KYJL
         69icDDGCwTXtzNWP8nG59NAIli7//joMpSvxD/p6fz39XR1w1daix+/0tWhBQk0wD9HB
         iBKbLbLN/2twPwZXpaDKeQoYXh1jPmWH07YcDnDW72p4m54mH3yCROrvOZAwRMushYzD
         nN07zSV4O/OefJRDdbytxCnEqrVfRiQAISPpDuaLM6DuKNcHBmc62H/tEd3cmOND+S1U
         XPBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UiGseFzZsRnVU03Reu/RD3mPfbnAqYr74tCl90Xq4lz3BJK8edvo2dlIRIaJzNKwC4fjWxFYQEoT/@vger.kernel.org
X-Gm-Message-State: AOJu0YxMK3aYTjr7RzGabi+RbnieA34xC3IKY5Ha8AMOXBx0NSjBdaKO
	l/MaEGqI29HdJsuM6g+gJeFuKr0wHnxr5DGL55W+yYqV4O1uHH9+jFVz/mBys2maVI4=
X-Gm-Gg: Acq92OH9RY0J2OADNRI7wsYMlZ20XrdYQG4WPSYfI9oeaa68IAWpP0CvuCt7fO4e4Ku
	TMHmxMyWLEsjSVqOzc06na9gK3p0Y6pKtVryVVDkiOxudzUVJKRirm1Ox7rNsQAP90HUa2FASiK
	LcYBn7cvzwT1hDe8I/5Jona0SEGYh7ujIVWsEby7PsnR8THnMd2RQVcZghsXoe3lt6Vutgi8exg
	rjSfj4BTCz7ImfjUNNm9+6TCGf4pv8ymQlXN3RRT2sd2+PGJlHyV1vNuEm5BFYj2vziHZ2Y/rKz
	dQliFOi9xp7NNpWJfulibHB9FqYRldjdWLPyPqmTuiNWdfJ2UBimxabWIATcfI+LLN2DEJn9Y7Q
	AR39j5Vx6LdnVO2nj6TOzwaG2nY5IPx4qUy4yYNpIh8N7zwPAFezcSJKQt4l5VXjPaD81OXj04M
	U+1srSKacnmDfbispQ/O/vnKV1m++XBXToMAo=
X-Received: by 2002:a7b:cc04:0:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-490e5619a8cmr39855435e9.20.1781197067940;
        Thu, 11 Jun 2026 09:57:47 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:ff23:71de:3dfa:4b53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606c10456esm150482f8f.37.2026.06.11.09.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:57:47 -0700 (PDT)
Date: Thu, 11 Jun 2026 18:57:41 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bjorn.andersson@oss.qualcomm.com, chris.lew@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Add BAM-DMUX support
Message-ID: <airpBYZ2pRdNaE1v@linaro.org>
References: <20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com>
 <aip3_fyE8tMtJZIW@linaro.org>
 <17bfa853-d0a6-4f83-a164-a17fb02f67a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17bfa853-d0a6-4f83-a164-a17fb02f67a6@oss.qualcomm.com>

On Thu, Jun 11, 2026 at 09:31:06PM +0530, Vishnu Santhosh wrote:
> On 11-06-2026 02:25 pm, Stephan Gerhold wrote:
> > On Thu, Jun 11, 2026 at 02:11:59PM +0530, Vishnu Santhosh wrote:
> > > +	bam_dmux: bam-dmux {
> > > +		compatible = "qcom,bam-dmux";
> > > +
> > > +		interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
> > > +				      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
> > > +		interrupt-names = "pc",
> > > +				  "pc-ack";
> > > +
> > > +		qcom,smem-states = <&apps_smsm 1>,
> > > +				   <&apps_smsm 11>;
> > > +		qcom,smem-state-names = "pc",
> > > +					"pc-ack";
> > > +
> > > +		dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
> > > +		dma-names = "tx", "rx";
> > > +	};
> > This should be a child node of the modem remoteproc. See msm8916.dtsi
> > for example.
> 
> Thanks for the context! We actually referenced msm8916.dtsi during bring-up
> and initially placed bam-dmux as a
> remoteproc child. We then hit the issue that the driver was not probing at
> all. After some digging, we realized
> that qcom_q6v5_mss.c (used by msm8916) explicitly calls
> of_platform_device_create() for its qcom,bam-dmux child,
> but qcom_q6v5_pas.c which Shikra uses has no such logic, so the platform
> device was never created.
> 
> There was a prior attempt to fix this generically by adding
> of_platform_populate() to qcom_q6v5.c
> (https://lore.kernel.org/all/20251223123227.1317244-3-gaurav.kohli@oss.qualcomm.com/),
> but it was blocked
> because GLINK/SMD edge child nodes would also get spurious platform devices
> registered for them.
> That series remains unresolved at v1.
> 
> Since your driver already manages modem lifecycle independently via SMSM
> state bits without remoteproc dependency,
> we moved it to the root level where of_platform_populate() picks it up at
> boot, and everything worked.
> 
> Would love to get your suggestion on whether this approach is welcomed,
> since it needs zero driver changes.
> 

Adding the bam-dmux node top-level makes it impossible for userspace to
associate it with a remoteproc (for this purpose: the "modem"). If you
add it below the remoteproc the udev/sysfs path will include the
remoteproc and you can tell that the network interfaces exposed by
bam_dmux belong to that remoteproc.

As you noticed, having a generic of_platform_populate() for remoteproc
nodes is problematic, because usually subnodes are remoteproc subdevs.
Also, the cooling device use case in the thread you linked doesn't have
any resources attached, so the root complaint there was that you don't
need a separate subnode at all.

I would just replicate the special qcom,bam-dmux logic inside
qcom_q6v5_pas.c. I think the motivation for BAM-DMUX explained in commit
59983c74fc42 ("remoteproc: qcom_q6v5_mss: Create platform device for
BAM-DMUX") is still valid. Conceptually, BAM-DMUX is a subdevice of the
modem remoteproc, since the remoteproc is responsible for powering the
BAM-DMUX hardware on and off. The fact that BAM-DMUX is not a remoteproc
subdev in Linux is more an implementation detail of the current Linux
driver. This is independent from the model in the device tree.

Thanks,
Stephan
