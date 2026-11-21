Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795252890;
	b=edT3adSgPSHADmvbbcAHztGA8GwXS285HOLUS8IxK3FiBLpDe20T6VTg2hLWPVJbQVNv
	 a7LvDAXytnkBvQ724W1e7quTbdDdO/Nwls52PSiFDK0wEPs2SyObKaaeJIpGLkhnprmaT
	 8UMdjbBaZuAHj/+ewz6bazvBDFmRT4Tq71Qin4yALJ+q3S0jfBgguVku2/0mv+qK/06z4
	 uC8K5K3akLJiP9FEzX7OoLUVQUhmOo4YaSvdylsMuaMDDhjxjAqQsTVnq/l8VAa/GYMfJ
	 FTnLp6SsmcEabX4MHPE//HXdQB+j4MknrgQ++Ov5kphOidn+8IeoLQLE/84TQSMT7HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252890;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SBI9zebGnI54N6IhLdlHK17/Eo7wuFwwHTz+BmtuMS4=;
	b=MNLNuDr6Ah1nuekZ/nPFk8bPrCgSf1PIwQCiliRIsLefsJvnwQa/yqT9u6woMGzZAE3K
	 5XLcYWOaoM4K6L2i621+us/d8zNJZgRIZbkdZKYoTPVaYOj0DjhWxtYxBl/T0dgI9ncFe
	 Lgs7ii/qUR1zAW/Ni0YZDTGQGTSmolCDCNSKX0BHSYZcKLHvY6ACpqab0b6hIY6Ecxtxt
	 RCmxYeUxY9XI+6Wi9HU5qYhhR7kyz/gsjNpuNtE89pazEsQBt2GCP3xZyIMBe7jRVz6lQ
	 F3kK68hjz9NVQn8ldOcExGeUF3v596nM5B/I0WMJk9RjyYTrTbKK/Fe7Je0lcu3+g1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y63YgXAb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF4F606A320;
	Sat, 21 Nov 2026 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y63YgXAb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7E71F000C0;
	Sat, 21 Nov 2026 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795252890;
	bh=SBI9zebGnI54N6IhLdlHK17/Eo7wuFwwHTz+BmtuMS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y63YgXAbz645jzqsSUoiwcfVBcI7QfiRBC29S8C+GCCXkyZXgyMcf0ZGgt/Be5eNb
	 7BLEu4siimaHFT/fzzFH1MsJhJfG0JR/Mc0I6xa0TzYWZPuTBb0YIMCA/64MpQQSiL
	 vii64LUaQQosyw/yO9ZzFgxS8Vsj2zO9u+h0EQ8WfOxhwE8/Gm+8bZ7mZ+5gcz8fXU
	 dxa2oeelJn2/J7ReAiuaFHQuoojwxNkmLoJfd6ov6sdgcm1n/b+ujfghdmXtMlinds
	 fLDIeShKMHMy7ncZMldMvFqhf+aqo6wAz2HqzBp6ax/poUN07jQejFh5Q2hhWVbhYV
	 WBRvpaThuWa6Q==
Date: Sat, 21 Nov 2026 10:21:26 +0100
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
Message-ID: <20261121-friendly-slim-jackal-fecccb@quoll>
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

Neither two clocks from clock controller are separate devices... that's
really not the point. I don't get what exactly is here common between
these two lanes, but you have several per-lane registers suggesting they
might be independent.

Best regards,
Krzysztof

