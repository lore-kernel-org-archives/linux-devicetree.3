Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC35B3FD97C
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106375; cv=none; b=SotE8cW10AgmoWJwi9JcNGrjezMCdgXYtD15qbtpTnC/AtKa31tVh7R7zcDca1tFo26wKOwpJnyP96cx0CosR5TuRZRvzD1upg7LOKvwArLalBA6mLNBvzlfdaZESG7vopnwRVYmhlZ8PJgNO0m1MOfQL8Amxz5UYPL2uvzUt6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106375; c=relaxed/simple;
	bh=GbCD0aAEiw25vvSVd+Eopv/uSeqO3UJZy/ArX20gXKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdaEQy5GBs3Y6vvyQsYYffqUXsrovT6UukRMWqEb4woVL7+5pnixZqv4EdZHHWv4x2mJQVmPDq96rPmCLcA/5lSRzmjWGHAN5c+K93mLfmN88OBav498L7cr1pIQy8Ok9mZacSbkI9Z9XjoxzFW3lWb0BOuDfoqLBV8/zYeBi3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=h6zoxgCf; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="h6zoxgCf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8+pg7I8Mbwg4j0XO5DjLnEMwVuYoSblXIRe51x3rQuQ=; b=h6zoxgCfEzO5HKeM4/v8EtMWON
	whcBygWdkmhNKwZCFsl+iokpvANX/698CIKgRWqNW88Y1fgmNUxMSKfaaBrIKSjqZNaobeZzcVXJN
	ivkjIstgzb8zRMlkJ6VM7s1Gc4eGegr+SuJ+FDnGMQCRYShuV4BKsdpZmTmqr/kYZLLc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wOwpt-003UGf-TX; Mon, 18 May 2026 14:12:41 +0200
Date: Mon, 18 May 2026 14:12:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Message-ID: <ddb781dd-e117-4f9a-a5a3-94c192d8c2ef@lunn.ch>
References: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
 <20260518033440.17569-3-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518033440.17569-3-prasanth.padarthi10@gmail.com>

> +&mac0 {
> +	status = "okay";
> +	phy-mode = "rgmii-rxid";

It does not matter if this is what the vendor does, it is still wrong,
unless you can show the PCB is adding the delay.

   Andrew
