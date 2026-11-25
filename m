Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600163;
	b=5K+RosVLn/Q9xwN+hMQQPt6OV64ZTEt3aBOXy697b1o1IRSC05hxeTlPO1aZnY8WMdi+
	 TRB8KA0ZXEVVhXusr52D6J+J/Ey9KgNdKQ5cSCy953ayXE7k74D3DJXzR4itx3qlbStpJ
	 3v59ziP+0kPafi8Hew1Zr+gX/YNLtU57t1YhzP3WUwvgf9NROag14L5ANUiP6YicvnAo7
	 EIqUxQzgR88trF0QwglOgTwATtkQzNwJZo5V8Fc03txXtW2SG8mnV/4KU91+B7zjpfZGs
	 51k35w0H1uNYY300pvWVHqb6nb0vDdcf3hI5wtRSfxrfNNIlklGU/75mFFZ9s5Vasug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600163;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=00kovWLRB5mU3CgTrku2HDMcvSM5rYFHby1xKMT+4ZA=;
	b=FyenOXyvav0l0+LU6pn2gUuXBfnFnQrznmxrcpgGeZK5BSsg+/fdOY8kskdgKy3Oh+J/
	 bfvLUg9nfi5nMoQZvuge2WNEWsKSEZqdTdYlHh2WdHIhxufklOJ6uzA9NPEmykcXA0ONN
	 xanXPwM3ZWq03x+3g+odFd9VQmCcOOa/HpT8jYoD57Mj2josqwSqJfsVOVuATTDFZdCs0
	 EFh9XiTG6hgmwtQDzSzply01VSxLLlpgsiw+iPEtjtNAG9bMeHIx1dHxpXa49LbBulTPS
	 F0lsx8zPd5RLq2XCedGNfkNunwOrG78PDhy3yi4I7cgjIfFh81UTBUo5hGyXwxb/JcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkb6m36X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290DA606A31E;
	Wed, 25 Nov 2026 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkb6m36X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE4F1F000C0;
	Wed, 25 Nov 2026 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795600162;
	bh=00kovWLRB5mU3CgTrku2HDMcvSM5rYFHby1xKMT+4ZA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=bkb6m36XwqElmmdgvWh48LQ8cYvUE9yizrdy/Hv0orBIxi17IupuLJ+xWcwpRX2yf
	 lqZ72h8XbM6NvF5tdJJX+uHA0AMJpS8oztAPagiyy3JSZoGGPuVdKIQnB0znNM1DAA
	 Hg2Y5MTfptol870TvCbEQxSRrltn9uRrtoqoDDJ7InwsROCvo8NhgpsN8ostIwtUAm
	 P9Vh5CSkl8wHakaiazTm2DFFAs1dzLz8TCfVCP8+jq3Hg6H0NFVBVVyNAaCGwoVoDq
	 mnrwugtmNTse54crHfUizVjvOcj+5m6/dcCVmyjDQYbpmLpj8zuOlKm6baUPCV4RZC
	 WzBdlFbtN8WYg==
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
Subject: Re: [PATCH v2 3/8] dt-bindings: arm: rockchip: Add Luckfox Lyra
 and Lyra Plus
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261122060114.773624-4-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-4-jonas@kwiboo.se>
Date: Wed, 25 Nov 2026 10:49:20 +0100
Message-Id: <179560016006.14607.17784216803858338533.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-22 06:01 +0000, Jonas Karlman wrote:
> Luckfox Lyra and Lyra Plus is powered by the Rockchip RK3506G2 SoC,
> which integrates three Cortex-A7 cores, one Cortex-M0 core, and 128 MB
> of DDR3 memory.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
