Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532997;
	b=wFTRqOvkD1GFF3Nqmk52eMYL2TfIRZiOemQhYkUDUoH6FCG0472VU5X/faXnHN9fw8Sp
	 xVVdm6QRNUW1SDDUV660r+FFBIEtafPhYZM0OUev49Bk8AxWyJn/94h0igAv8NHKrXZDX
	 vl64SFlJFtRgWiXLBrF9geLvPhrGe15BFJFrxKQO8GYYhi8oH0zxvXlbG1xmyiw9WdqGY
	 xh5/6Yk/B7gPJV4A+E75CKH/w0uwtUzCjiEXn8XLtg8RX0W8P8fY5za1mByYFhCn/GM/n
	 T226lWY+QYcdFe+X5PE1PUNz5uq0I/JC8xazvia1fOXuLImv9U+6zPiaZF6lFhKEKLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532997;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nWampxQB424gwxrOvpdloUObC51lUQL513OOmTFYZeY=;
	b=MaKwkR34sZl5aR5W9cFhhXXmTAwF7ok58xKG7wktniMYIjysW2kp4Spb3ZSypt+oHzx5
	 LFcu9QU70ZVI+C2BHjUoaHbEwJxS9L8CKsf4ShIkBaBC2X4j3/tMh86hH5e5ZNjsy3Tf2
	 kTHOM1IHh69HqCTtBupPksXRHD3wsZXjjoiAX4XDVWb/an1v0wn7a+WlcUIrxS0g1LMS4
	 IzD1A3N7hnLCQZcasm5SweH70c9GTcQmz5R0KF+H+q8WueQodWtaviQtWiSMP1RTCRoJW
	 hftBc7W+4YrkAqAWzN5D6X+5Bvcm4YhHj2Gip8VMlK0A9DaqDV6Hy8OJKRNEvUu5uKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBbnGlC+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743DC606A31E;
	Tue, 24 Nov 2026 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBbnGlC+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4355B1F000C6;
	Tue, 24 Nov 2026 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795532997;
	bh=nWampxQB424gwxrOvpdloUObC51lUQL513OOmTFYZeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NBbnGlC+Exd4PREioknqiLUW1fefdNP7xPke/cgv4L+MbVdPftaz2zGHM3RTU1fhr
	 vIvfu/eri8KDimwy8iCLnJX1kwMJsuoIZTb5rz8i2eKN0V95yoCSqiytq6n9GpoFIc
	 iOcVMveapW9qgppmbcc5QSE6Ll5v3HVp0dENYo1denSkFLPyN58HsOPTvs/lN7aNht
	 fNG+n2T8bOcDntZXxYj1GviAREcUoSRz5xaixlKzPcwkieDjlXdd1B1vXbb25Qzv5X
	 urknobvdpFVWtSXN9UdF1Y14a9w64+3thv/KrfkLfrOJBjxSZ0G5tHigRhcfuqn8Hz
	 vVBUZjpLcbUJg==
Date: Tue, 24 Nov 2026 16:09:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Gary Yang <Gary.Yang@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Message-ID: <20261124-benign-bullfrog-of-chaos-9d2af6@quoll>
References: <20261117022858.2210212-1-hongliang.yang@cixtech.com>
 <20261117022858.2210212-2-hongliang.yang@cixtech.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261117022858.2210212-2-hongliang.yang@cixtech.com>

On Tue, Nov 17, 2026 at 10:28:57AM +0800, Hongliang Yang wrote:
> Add device tree binding for the CIX Sky1 USB3 PHY, the SuperSpeedPlus
> PHY of the two USB3 Type-A ports of the SoC.
> 
> The two lanes are not separate devices: they live in one register
> block, share the same clocks and resets, and are brought up by the
> same initialization sequence. The node is therefore a single PHY
> provider with #phy-cells = <0>, referenced by both controllers, and the
> driver reference counts phy_init() and phy_exit() so that the block is
> set up once for all of them.
> 
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

