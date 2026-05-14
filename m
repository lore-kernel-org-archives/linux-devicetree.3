Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109183B5837
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760515; cv=none; b=Wq0Rim8QnYKGH4VW5efHaEqcTV+/ByYx2Zvh5uVXC3wLt5OD0Qyk7Uj1hh31Dwdh2udWZOu63l4ax1nOiC8zpmMRDSOxRDeeD5k9qK7mnSXFD/bQyOsCRmbSXBtDZxTyzqf/U3fsEhcgi+iOEit18M6ak0B2rUj/8H3msmsxPng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760515; c=relaxed/simple;
	bh=rdVakW2JsEDG/bn9la26/8KopBgfsGMbhDRdcBYRY04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VN5eTlSNIpH3hZd0Z/u1AKavcGYaKE5fMtRVs5fpdUxbG9OSsUiPHH1WywrhM1boFVidt9CF6zMDCo9hPEreS3uhu6O4GLV7epDPGJFK2GKuVksdcqJCJ95dGbytFFoXgz2FzQ/SICodv+qky5VxNHLai4DeUgtOgnhwtq09jIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=N42aHMGc; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="N42aHMGc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Tso+x53GYlnnd0bvooYwZlfjSVUPwDAvBozCDW1Oo58=; b=N42aHMGcEd3zaZq6JElfHZEouQ
	+DhFxWFVsxTwX7NXiV2+zHnq+cZuoEX6ZfJFp65Cu0xLKfjhUo4LI1ng4MZI4y7FTjjY4L3W/X/gp
	cra0CT4Y+gYEHqsX7o8KzF0XKfJyS9O+oe2YCP15HK8e5bkuhSvuwCPIL6mttnemsstw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wNUrS-002trT-CM; Thu, 14 May 2026 14:08:18 +0200
Date: Thu, 14 May 2026 14:08:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Message-ID: <a71d6b4c-fba2-4f02-9603-4370b52663e1@lunn.ch>
References: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
 <20260514031622.1416922-3-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514031622.1416922-3-prasanth.padarthi10@gmail.com>

> +&mac0 {
> +	status = "okay";
> +	phy-mode = "rgmii-rxid";

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

Please could you explain the choice of rgmii-rxid.

       Andrew
