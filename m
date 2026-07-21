Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03771481252;
	Tue, 21 Jul 2026 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784635299; cv=none; b=oxvQZX9DrvtvnsCbUCA4itXlDQ+hFndoquDz9RSjiE7Cmt4kC/gs3/ipdCMeWGPqxUvF9+8ndv9dkdFYtaHLzXffj5Fv5lTio1paQvOdTXNQlcjRQz5bWF29LdlnqY99NtdiW84RTZ/MOnBOfos8OMxpe7Ss9qVf41L8g8Xakv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784635299; c=relaxed/simple;
	bh=PCe7hEV6iQH0579aioNN8vvkJ/H0RwCGn6Ei5UwU1o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ICaIJAV0+3R7DiSpT3mCojK0qe3Jsd8zIm3RAzOOkyMEU4IpddWZBCgxScnO3kilt/GtHL0J7xGyDiw/gt273/ZS3u2uz1cRKJQGS3MTWqnopfDAymEuYVKXN/UOYllaKt10L9w0URKWBpaAt4/7AtMxTohw51yN2oFVhp0aCSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gf0l9KNi; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gf0l9KNi"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E51FA4E40E9D;
	Tue, 21 Jul 2026 12:01:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4FE660368;
	Tue, 21 Jul 2026 12:01:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B33611BD2234;
	Tue, 21 Jul 2026 14:01:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784635289; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Mfz+XYF9qEUPFn7vVrHbhU+dMueG9FqIjc17rMHYptI=;
	b=gf0l9KNidokNm/7c0EhDfFkJHuGxPwKzr0QShggJ+Q6UVWE9y2fPzZWR3NE3wz9xuleqfV
	O6CkPbq/+qFSLL7IlQVRnf/m0/MIc8KUTKzHAdfpG/xvdHsgWCYraQfImINouLc5rg+FXD
	nNEon5Pas5phPl4MNLgScqwjYoweV3IOg5MnrHyFfPsxfc44fesu4yoePHP4tlyEoz/ep2
	3fiBF4xsJkXL/YRz5xfUw7IkJDNS8CdGaXaEEilQLjVGTla+FETwYtPEup4ieeihBjPpps
	PrDWVz/0jxsvYvXCGAQmvrRgCTfwDQB/QDx8H/D69nxKYFhTTxIrqdFaEDI5HA==
Message-ID: <c0dbd5a0-97bd-4d04-9fcb-d8c0a805b21e@bootlin.com>
Date: Tue, 21 Jul 2026 14:01:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 03/12] net: phylink: add phylink_release_pcs()
 to externally release a PCS
To: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan <saravanak@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-4-ansuelsmth@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260717065448.1498335-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 7/17/26 08:54, Christian Marangi wrote:
> Add phylink_release_pcs() to externally release a PCS from a phylink
> instance. This can be used to handle case when a single PCS needs to be
> removed and the phylink instance needs to be refreshed.
> 
> On calling phylink_release_pcs(), the PCS will be removed from the
> phylink internal PCS list and the phylink supported_interfaces value is
> reparsed with the remaining PCS interfaces.
> 
> Also a phylink resolve is triggered to handle the PCS removal.
> 
> The flag force_major_config is set to make phylink resolve reconfigure
> the interface (even if it didn't change).
> This is needed to handle the special case when the current PCS used
> by phylink is removed and a major_config is needed to propagae the
> configuration change. With this option enabled we also force mac_config
> even if the PHY link is not up for the in-band case.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
