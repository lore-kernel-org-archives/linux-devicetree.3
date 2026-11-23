Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465654;
	b=SeyygPMCmwUNooFIPCcCzjPD8lAkRmlsOker/5fkg27saSJVZq/2vgk9BGmGHTndU0QQ
	 lb8qkq2myakhGxvj/RBLkUuWo4QSBB7ueKD2BvtK9E7WEBJheoJXocXSt0QQMk3JhNzru
	 VbkYAkLFjlB5UHV2NPfUcy577Oh+5haXDHj7kFXJO2mgQtJVw+QZ0UcVrkuEUyknN2U21
	 hVlmNMpn/veviixn9q0UUiT7nVQs4j9TZPbmo9c75A0zxerKJhIIcI1LigPNcNW5xyt7y
	 xC22jtFcHGTky+VWtEy4oR18j2AUfhaVFHoTOMf/N9qXa9mPmeug7ub9oSs4WoQsASw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465654;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Umq0WhvIED063Bv8Js/EntpU1dzpqqtpNBKPcxwmIfE=;
	b=OspJ4eYZIqfmvOP+Ql1KHPPLYTgpV9AiyqBUT+qv8DlsXnFIZssfh8B+yy2kSP0+BhS6
	 Q5P5DNmLNkBmkS6GS1kF2A+GspaQ/Sj/xsblozXt3fjr6xxPjIHh4pT1FLYW6Fb2sSOf2
	 1av1MTLKtkaF7wXr9RtDDs+B5+98OCUaNuA5G8LBImcItyAehHo2AmeoRA5YL3nhSENYV
	 4Mh9c5FTBs/bFvKM55xn+L3tyLaF+ijT1+A5dwglIa614HmBggaI6arhgKh6zHe16biT9
	 meRfXiYCM3kje1y9CauHrRCP6VFpFPYOlFD7zHYKQN0stkvIuJuQdrvLY+uVug4jLzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=N1YydgV3;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B2D606A327;
	Mon, 23 Nov 2026 20:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B2D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=N1YydgV3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Umq0WhvIED063Bv8Js/EntpU1dzpqqtpNBKPcxwmIfE=; b=N1YydgV3sr1byWvahxhhf0XA5r
	ZaOMLGqukn4bRz+/gXl0USx7Ed95+zAoApAiUEEVYSjZCLJsjDkTaq46xw5BADcECOCtE2HWB9/XQ
	ae1aU0mO+xzS0MOj8K9iwM+AKCy+BYzRmf0JwBPg9PvVLA1LPrXFVvL68q3Qf2jNThDc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVadO-000sx2-5g; Mon, 23 Nov 2026 21:27:30 +0100
Date: Mon, 23 Nov 2026 21:27:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
	Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
	Dipa Mantre <dipa.mantre@oss.qualcomm.com>,
	Sravani Tella <tella@hu-tella-hyd.qualcomm.com>,
	Monish Chunara <monish.chunara@oss.qualcomm.com>,
	Ajinkya Inchure <ainchure@qti.qualcomm.com>,
	Karthik S <karthik.s@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: add Monaco Draco EVK board
Message-ID: <e3c78e7e-8ece-49aa-9b1d-6a66480643fc@lunn.ch>
References: <20261123-monaco-draco-v2-0-3ee3b2375f16@oss.qualcomm.com>
 <20261123-monaco-draco-v2-3-3ee3b2375f16@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-monaco-draco-v2-3-3ee3b2375f16@oss.qualcomm.com>

> +&ethernet0 {
> +	phy-handle = <&hsgmii_phy0>;
> +	phy-mode = "2500base-x";

> +		hsgmii_phy0: ethernet-phy@1c {

HSGMII is not something the kernel nor netdev recognises. If it is
overclocked SGMII, it is just a broken implementation of 2500BaseX.

	Andrew
