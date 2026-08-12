Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6850D46D2A6;
	Wed, 12 Aug 2026 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547207; cv=none; b=rOKr7BpS2YZLjRUtT9yy3SOrZ936adTm+3LBVTor/LydP/dc7wiDMaLqn3g2dCCiNdGfxfKIaYe+9oy55zjwxMB1C3PXrN9SEWJ0AQ8fVJQY4EYxo2DHYQGbDfjF1TMf8Iu84X1QLh2FqltLq5iYNRwfXuIby5NEuBFvwV1fslE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547207; c=relaxed/simple;
	bh=3YM5hovjI9K74vw2Pr482HDnXVQuvK8ty7aP02tW44U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnl3CngmcGCSQVspE8nufVjXJod5QxlS4HKbgSIkKvjluyiMoieBvlTcWRsTBFd++uO8czDIckb4Ukc/Ud0vkt4gipbC857CqOUZyPEWk2Xod+z4s+EEeMiB6CsYwDXg3cIixuDWf94p8oAZQ7Tby1LGAf8u6TtPcmAvBMqf7UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNKSEAeb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNKSEAeb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46AD21F000E9;
	Wed, 12 Aug 2026 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786547202;
	bh=iB8Ml9iGe0F9QaTSKAR14j0H2MWM7qyvBRoV1bz/NsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eNKSEAebdUBwP+FPnilnuZtbQzbZlIdUh05s/GFKEw5UETnqkaG3lHsvdsI4F/b+F
	 6q1vzC0mzDted/HpfztLhO/TcAqi89zJtcaQou0VVAx6WuUT3RCX5eXCzmFdGhzmDk
	 th4+wH19BXs5D3tje+pTQUIxI7SAqi0EKPrObY2jYcvqqKDNoY7xtdj4w6ug+JP/Fn
	 yUDrA+DwZAOUlk4M1u9bF0h4mikxhxja7ZEwCv/KeQSh+pwpQDVdYI2RTQZWUd7mO+
	 NYfPFGuktXmtVSj/UjzI9RYcL5xfVO4sS9trtvmyPf8WtWLYxMKMLOBjdF8g6hzK83
	 ndYQtnAlABbWQ==
Date: Wed, 12 Aug 2026 17:06:35 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanley Chang <stanley_chang@realtek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] phy: realtek: Make configs available for
 MACH_REALTEK_RTL
Message-ID: <ffhzuivxrf3kmarkk2hwkcvzzzv3cuhg34ecamjip4m4pdsuld@zv4sm2bcaxtf>
References: <20260520175728.720877-1-adilov@disroot.org>
 <20260520175728.720877-7-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520175728.720877-7-adilov@disroot.org>

On Wed, May 20, 2026 at 10:57:28PM +0500, Rustam Adilov wrote:
> Add the MACH_REALTEK_RTL to the if statement to make the config
> options available for Realtek RTL SoCs as well.
> 
> Signed-off-by: Rustam Adilov <adilov@disroot.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
