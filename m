Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F0825B0BC
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 18:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610953; cv=none; b=nEHZgvCSdD5nk7f0mv1N/IxgCtgiVNcObXKQ3AA9bQZCFcKAyiocBlhhAoWgaDIgOEj9kwneqt6D9lKIpjcapsUnlxP2N8Pw1Xx9lM8n2y/5/nuWidGrJV8KLqg3UJlVW7vkczw0KWi8Jb6XTCpWD2m3G/pLco5zBb/Zc6LAoxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610953; c=relaxed/simple;
	bh=xQqCOuU9DWlde/ylJHf4LafF/NPKYekbCZL1w4nuN8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEHq2RKUcE1okzcIUtO/Fak8y4npTgu5yJcguYMFpOJzvUpyXMTUQfkaTbq4HzEQk7l7Yug3/GvhO9v3Sza8vAn45Jiw7URD85KadotnwNVJwqRLsmlxiHprjwuhhoFe+0xYvPIldb1m1Xk9XODvYweCl0PZeGK8A1s3HjcukdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=nV2d+QLp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="nV2d+QLp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+WDbnRCHLFMZ6i6H4Zt/0Gy4jkd8hmSy2ikld2vqGyw=; b=nV2d+QLp3RrNtrhdA34wuJcAwM
	gs/9x/bxhYD/Wg/yRraDtqj4Q+4emUAjwDF9PmAkBgW0dy9W90F5SfnyYxnp8fSnPZUmOSszRwCt9
	LDbLbt8dm7uT/NAyVbD0hQ5zBA0aH/dWcwSyDM6kc8EMWb5JSx0ukeFDsQ/1YARecg64=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wMrxA-002bMi-Po; Tue, 12 May 2026 20:35:36 +0200
Date: Tue, 12 May 2026 20:35:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Message-ID: <5427ff70-4676-412d-8294-da5743c736a7@lunn.ch>
References: <20260512175019.47548-1-prasanth.padarthi10@gmail.com>
 <20260512175019.47548-3-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512175019.47548-3-prasanth.padarthi10@gmail.com>

> +/* Dedicated Management LAN */
> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;

What does this connect to? A PHY? NCSI?

     Andrew
