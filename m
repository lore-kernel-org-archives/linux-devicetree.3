Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465793;
	b=Fh1HUJZrjCuop6XhySRcgrwZCfNcIS7eS31YG25lMQ223H1hBdZr9eXIadAvKSyGAc8x
	 plibaixW/RBtsUfBF7mzrblXaiC8H1cCq7a4dvyreOytjadXnZPtlJBhu0a0qkNf2Qwbs
	 ezR3O9Yx9EByz6xMe/PaXDP9Vlhw0pKH6ZNt76puZQu4srgV5CFp+A1ZhC/ZQdDjMAM0S
	 qu8G4x//6GvlD+tfnDtoJmQZdPbRnIsKopUNwuhqnXd+BVO/lodjdcbaIzZlBtGXiGlr9
	 NVl17KOUWQSP1I7Xi7gdq31jHJRcdJanJeo6plGkXFFy+PSUGCMIfTjxCTRkdzvwTGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465793;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=wlC+kjkiKSHVW+PSqiaF4f2pjwKQhRHfb2cKIphdn9U=;
	b=jlteo48+ODBOwFFF+TdW7xRccRTQ3QdjTju2ZK2mLeW/OmDZiW4ErdguR5ImqH3JC562
	 VPldZ9ivTInAIgCpMhM14mQrWHv55rdrVNB3Nz6a5jQA00C8jS8V0Dbd9PopQkXmDBXII
	 Dv2aEkcIGBbRA5fYi1mbMe6c6yC3RY16143j9SNu9ERCEtvgJtKJ4H+yc56qqvegAg0Fv
	 64ZHEiM+DoY8bIB90OywRZKgblBqGlPeuy86kwZRkLWitbmYnsAZHbETO40eY+TSMT8ZI
	 QqEXuudxPj50DSg9zX5JY/pBwYgiMxO05a6VbGALt3+mIFRrJnYnCXODvsYYOOb35LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=FmrHYrXJ;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB02606A31E;
	Mon, 23 Nov 2026 20:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB02606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=FmrHYrXJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wlC+kjkiKSHVW+PSqiaF4f2pjwKQhRHfb2cKIphdn9U=; b=FmrHYrXJEadrjDC2BS5JbOp5t3
	B7SVsyoKFsu4SvjCcqhTH5RYDSnT6C8rFGUj2pA2WcChqvykaqqWLgbmSHt1N+bGoHYCc+6IPGevD
	K1JnGIwbiD9PAB2AumRd7HJAeycyLksDJKm/Gj6xzsTXzrRgPc55gOBm9e4AkJbNiLa0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVafd-000t0Q-PH; Mon, 23 Nov 2026 21:29:49 +0100
Date: Mon, 23 Nov 2026 21:29:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
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
	Ajinkya Inchure <ainchure@qti.qualcomm.com>,
	Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>,
	Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Karthik S <karthik.s@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board
Message-ID: <609ea06d-10c5-4727-a9db-8d42e526befb@lunn.ch>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
 <20261123-lemans-draco-final-changes-bringup-v4-3-dbfc15cd0883@oss.qualcomm.com>
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
In-Reply-To: <20261123-lemans-draco-final-changes-bringup-v4-3-dbfc15cd0883@oss.qualcomm.com>

> +&ethernet0 {
> +	phy-handle = <&hsgmii_phy0>;
> +	phy-mode = "2500base-x";

> +		hsgmii_phy0: ethernet-phy@1c {

Same here. Broken 2500BaseX? Or properly functioning 2500baseX?

     Andrew
