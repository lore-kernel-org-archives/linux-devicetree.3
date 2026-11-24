Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542265;
	b=lgKfaY7Mc/Gk83DdoPvRj/zcJZaPoquJGjBeg3xiH2PXsLtT+Pp75NCKNlnDnXa98sBq
	 COClI75YVfZU8qDYdK+P+DZQEuoufMFhANVgwAaq0sYT8qKgu5vDfUaUdM7YjlVhK13mC
	 9tje7FhD1pN/sup+HwcvpWft7wtXKK9+EynJhWPbQBN0H6rS2Tl1jY7Q5W1sKuuQ9ozLb
	 N9s22LhUj4g1TjOaRVs86RSImteJ0o1ZbCrwgkz/CD8Nlps+ZvHykpQbibIlIRaBxVUtX
	 bQwG1kF2GaSVReRNBkSTclr+Exyucr3qguCg5cqPQnutcWxxFgguyey+YCo3+/zwK3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542265;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=1yEuTAuD9qF7B4gfMwaFCShGKrw0bpyd/m1S3g6b6xQ=;
	b=l6WYYxcE49sDCtMaawIzOMvvbqWhKR1MYP4oXkCBGyxtLDaxHSpbwAWOw6JTmBkCAFXS
	 FtVjDZqxtXi/SjYPe9yq43VeVrri5a0HnNJwetDeQemzT6FN2R4uVx5O1zA5rvaG9tW5y
	 TVRLhTBEtLoJhWA7iXuwWU3MKnrf0BRzxm4Dov9IAweCc8rZwU0Dt8iNM6uaYcP5CX7jT
	 DhJp4Grr5yQHrtXK00yeonqF1XMBVtiz9tefVZhcXN8SBfkyvvShoT1mwRpn1q83q//bQ
	 iD/mHID8Ql9Ml832khFcmZqOPkJMUScrwTBOA6tI+6a5v5YjtL0BaNmafvDVpDtC0xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=E3Xk13R5;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F9E606A31E;
	Tue, 24 Nov 2026 17:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F9E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=E3Xk13R5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1yEuTAuD9qF7B4gfMwaFCShGKrw0bpyd/m1S3g6b6xQ=; b=E3Xk13R5AsgssUSrEF+rQGaRp1
	weGo5SgBnasTLKPGoLd1sL2QkiSCkfcjqyUYkD8IW7Tl2gaZmKuMQf7w171YbiKR2EaNRTHP/Z+3j
	SvbTgoJq53v8856Uj6dnYLxPlVGozp6fwac6x76Sae28kt8GdLhle5Hh5ZwaUM8PdLmU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVuZ3-0017RL-2s; Tue, 24 Nov 2026 18:44:21 +0100
Date: Tue, 24 Nov 2026 18:44:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <fef9f0c1-10d7-4718-9c45-74132ecdd1fe@lunn.ch>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
 <20261123-lemans-draco-final-changes-bringup-v4-3-dbfc15cd0883@oss.qualcomm.com>
 <609ea06d-10c5-4727-a9db-8d42e526befb@lunn.ch>
 <awW1G1Aou/65UZ89@oss.qualcomm.com>
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
In-Reply-To: <awW1G1Aou/65UZ89@oss.qualcomm.com>

On Tue, Nov 24, 2026 at 09:32:35PM +0530, Mohd Ayaan Anwar wrote:
> On Mon, Nov 23, 2026 at 09:29:49PM +0100, Andrew Lunn wrote:
> > > +&ethernet0 {
> > > +	phy-handle = <&hsgmii_phy0>;
> > > +	phy-mode = "2500base-x";
> > 
> > > +		hsgmii_phy0: ethernet-phy@1c {
> > 
> > Same here. Broken 2500BaseX? Or properly functioning 2500baseX?
> > 
> 
> Based on my previous experience with Lemans based boards, I think its
> the former: overclocked SGMII / broken 2500base-x.

I don't even think you need the prefix. There is only one PHY. The
prefix would be useful if there were many PHYs using different link
modes, RGMII, SGMII and a 2500BaseX.

	Andrew
