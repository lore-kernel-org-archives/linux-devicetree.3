Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449981;
	b=GdFHC4c87RPtdseTxuSdzubXWVKDZBL34nBH/axWLnGzvqVy8hQjd9NcAVDE8943bn9y
	 zPcH1eFGWurHhOpmLJvFiM6zaNhOonJOtmfSGBw4lf/lfqEXTacOkLfbypYxjlpHQYI5e
	 m83JuiGbgkln4v6ce5wVmVoi2plsOU1eYwKL5tSbkKQB/+suAXtEhOevhOzrK/oKGKLjd
	 kEANmDm/f3E9dRYHf5EKpZYgviBBWADOB2A1yeF3HxxsbpMLn5P9OTJkNM6ka2fWAubji
	 fhRh/sWYgnT9top6WujUMuU69t30aqeI/4t+p9XPSDRhVlSGbnS2X8JetLcGBHAi65g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449981;
	h=Received:DKIM-Signature:From:To:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=aKQbuNwFr/Nx8wYobxXg0xTCe3AGkTE27xzzOZwvQns=;
	b=XzZzg0EZzfMEVaTr0i9esHmb5ZWta8TnEqNPhimvHiM1ccZYMi8ka2gS/f7FKFBglofj
	 aG/XXI0IOeYFwkohwCSX/wTRd/5xLIKoUbCJejVw6pa1sZGRW6/AVobaBG8F1X5j5dm/8
	 7F6G3gIiumGk0FsMt0jcmCaQzz0CoRB73z+ECOsHv4zof+tq/6/znqAzGoUQJMfWxMBy9
	 FM++qpKuYj/e+DPDxBy6iU5wiQnmGuS6Dlq0jlzqC/+Zfti2cQsMWQ7UIV2BWUsclSTyg
	 cte4c0zDBUsIj4ICgEoVH2qUCZtD6m+mTYqn2FlODCJauQqc7dEofPpBs1d6qo62JHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WSIYT+gE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F83606A31A;
	Mon, 23 Nov 2026 16:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WSIYT+gE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321BB1F000CF;
	Mon, 23 Nov 2026 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449981;
	bh=aKQbuNwFr/Nx8wYobxXg0xTCe3AGkTE27xzzOZwvQns=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=WSIYT+gEKpICbw3GpJkX6XyH75SqxoAe5i0bgAzQXRBOCGuLUF7s45+CexEyKh/sk
	 j0drR9z9Y+kXVhQPZSK8BawDKGyuPmJJTkt35kqKmx0++A2xfcMQAwR4PdS32rTslX
	 cmiIwmmJ0wgScyLFsF4n5v1UnFc7XvW8KTbGgc3oqCgJnAuhZpmR/ykNM+vG1pKx1H
	 4vGZ46QYKXcNb64q+29MBHzm971Jd6yImTij6G/ppndpM9hLkdAjnTzo63ilZtSiQE
	 ybAI3+OzJSZSv3kqnO7h8qBHH7qA235LlZgoZ0030udPsHVZvzpe6dUmh3Zs+V50uz
	 AzqKuLhtuLE/w==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20261103194410.6632-1-ansuelsmth@gmail.com>
References: <20261103194410.6632-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v15 0/3] airoha: an7581: USB support
Message-Id: <179544997784.275844.2168533333903460863.b4-ty@kernel.org>
Date: Mon, 23 Nov 2026 21:36:17 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 03 Nov 2026 20:44:05 +0100, Christian Marangi wrote:
> This is a major rework of the old v2 series.
> 
> The SoC always support USB 2.0 but for USB 3.0 it needs additional
> configuration for the Serdes port. Such port can be either configured
> for USB usage or for PCIe lines or HSGMII and these are configured
> in the SCU space.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
      commit: b5e699a21adf36206a826089b8e8011c6051a716
[2/3] phy: move and rename Airoha PCIe PHY driver to dedicated directory
      commit: 27f22b201fe3c313e88b2256646b2513ab22e0b2
[3/3] phy: airoha: Add support for Airoha AN7581 USB PHY
      commit: 7c6c29cea0ef6b810424381277bbdf1a98c31b8b

Best regards,
-- 
~Vinod


