Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFEB3DEAD3;
	Mon, 29 Jun 2026 15:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745952; cv=none; b=e29aRUgKsVRYYtpUMLREO8dRltEJfQnA+psPxKj2YFsejNTj4XnCPKElpv45CMPaknRAIigEUm2XBRymG5dVedljBUITGPAm7q8s46fH8q1sQtq6VWnrbZme2MmiRX6fawV4Kd/Wabk7dOYidpEVv8bi8Eq12ubzl0b7QKxNwKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745952; c=relaxed/simple;
	bh=Q4yRyEhw7bDXWzxs9m+mUF3vclIU80f3veW8JmIJkYM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D9oxuace5lNEIOiuOOxmWTFNciTaDxAu+EjmS5vGAuR5gRRIi2zNweJ1pVHjJ8MSlUMcP1I8AVYu55BFCSgwJ61wtkfAayOoKF1RdeIDW/7iYbE4sNKyyxF0fhog8764lHIuRcuHcVK662VSwt9LOZdnYRmxbcS2icOqzkCJ1SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcE1nbTN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcE1nbTN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4481F000E9;
	Mon, 29 Jun 2026 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782745951;
	bh=BHHurmrc65sg7plcKiIhnOsIO7ay6w+kqVqpivexUa8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZcE1nbTNFvjBiXzjgdmMBuacIzfEaXKaIEErFbYAuFENN84EXbSTN7THV/s4nOO5f
	 QCiux0pBqPSc2cSdpfLhxj1tq4e0HMwVqFdMMapzKQktKlf9QmHeVymIRcciM0SAJM
	 4LrTBVXzPiG3qQdpmtM97Ene6qv0ap2nSBoJZWNiBNMlH5KyNwV49DWtimNUkAcQf5
	 4QLqgP4i1Zcbo0cXUqJ0lFTbz6JQJv78lYgRE4n3k82TSXqr0np9IEjO4f7Ma1VBHj
	 ZtdQpBInNY4Q3enlBuwogdrS7DVyI6UXqzA8iHV25uqI0g07r5YBkFd0gkWbPw/tLn
	 jFJ9LCVsmUiWA==
From: Thomas Gleixner <tglx@kernel.org>
To: Markus Stockhausen <markus.stockhausen@gmx.de>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, mail@birger-koblitz.de,
 bert@biot.com, john@phrozen.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH 4/7] irqchip/irq-realtek-rtl: Add mask for interrupt
 handling
In-Reply-To: <20260605211646.2101652-5-markus.stockhausen@gmx.de>
References: <20260605211646.2101652-1-markus.stockhausen@gmx.de>
 <20260605211646.2101652-5-markus.stockhausen@gmx.de>
Date: Mon, 29 Jun 2026 17:12:16 +0200
Message-ID: <871pdps7n3.ffs@fw13>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jun 05 2026 at 23:16, Markus Stockhausen wrote:
>  struct realtek_ictl_output {
>  	struct irq_domain *domain;
> +	u32 mask;

Data structures want to be declared in tabular form. See documentation.
