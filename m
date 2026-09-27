Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C2A335067
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 16:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790525457; cv=none; b=KHrHLGVu6aKEa0OJ3fNFHDezesfW5TDoCMxxxStY4X04rg7Raj46acs0nsbE++3lcCTnAHdjIEy8LvY2Xiyyb3uqbKt6PNfPF3NlGyuUOmXCX8lsViR8q66jJOzw6mboGZ4x5j+Ejoox6R5EH5QFGvD0Cgin/dBH8+BW2F9zJ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790525457; c=relaxed/simple;
	bh=yuL1X501G9c5cX/76JFc26fxYTcztoh7tZlLf9u8zeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssaD36jvDWJPhqIyPXAEkw1x8dTbnsRhUmwG6V3hVsvkBmpCeHhxr0WbaMA+J9bgV10rrOdX5FaFmvxM6fwrlSxI4t/4u7SO+kOWMu628JMtPasjUd3XaJcCkCxwYujnLDctMMpj7jvc8wF/eydompmhGtHzDLb96wYTRu3G0gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=QJ9NYif8; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="QJ9NYif8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Qkb44GxQlkJlaGvSbdXr/VqLO2OL9eSsLbx5+2uugSw=; b=QJ9NYif8+G+w6Kao0mVbEdQGg2
	ip5qdp0JOj3TqDJ6gbeys1zKRezu1GqXg0YeQAXaewSJHK15K03NVP2Nm8KX5Bk0nXr8E45Kfdfhb
	LWU51QcP+wDLt/PMs1ffXuaCjnux5t+Is5Qhmy+PKjP/7WLiIWYsjia5CYEkaputd39Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xArSk-007XPL-HJ; Sun, 27 Sep 2026 18:10:50 +0200
Date: Sun, 27 Sep 2026 18:10:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: BG9OXA <bg9oxa@163.com>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Message-ID: <de8c3f72-26d1-4c9a-86c6-12afb3fe97d6@lunn.ch>
References: <179051708448.31632.16350193430088134671@163.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179051708448.31632.16350193430088134671@163.com>

On Sun, Sep 27, 2026 at 09:51:24PM +0800, BG9OXA wrote:

> Changes in v2:

How much time was there between v1 and v2? You need to give reviewers
time to actually do a review and point out issues.

At minimum, wait 24 hours, but ideally 2-3 work days, and allow the
discussion to come to a conclusion.

	   Andrew
