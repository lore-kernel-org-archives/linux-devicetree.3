Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E56E46EF63;
	Wed, 12 Aug 2026 22:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786574111; cv=none; b=Xwu77+oaMOLRajPNeQjL8wY/Vo7hncWkKaczTxsGs93Lsy3DEV/IZZWTVbIFKRWZgZacwazpG3f72SFOyU7HIO4P2Lvm8ecaDowlrRVrCHVvb29CGf8aG7EuVTJ+SfTw7k5f4xXMJLeD27FrpNLDsjvfSeMebRspW25D2+G7zaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786574111; c=relaxed/simple;
	bh=VKg9PfQ/3JnwKeo5C37cGrjsWyJcdUgPIDrzhxh0HOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcTtCB+BdIGl0MyAUlt/wet9yWNLhlJdSd0rzuJijgOLrrBLPJ5L8XVuSlFO+830cuQ96p/V4Wb1JVSIVqA2ZBnbIiUhxl5Kv5UM3HtwNOx5LW7m9Ywv8PWCEJB2KCyvyTDr99c7kqXvxUKaV07lUJtdEHaM8fAc9KvGKD0mCkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kD1lOdsV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kD1lOdsV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0707E1F000E9;
	Wed, 12 Aug 2026 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786574110;
	bh=3DyAtmNNqEcGbct8Bc987uj9sJr8TqTqWRSZ86F3g04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kD1lOdsVzDIFTGQm0b7kGYxMd038tt8w+QUKO9mU1/bRvA4rvb4OGcxHdzZRZVPlD
	 x9mPbywNwzAFA18Ad0lzLZu00q5ByPXRWhNpMAoOjhzrcm0RDpqgEjDFtghOHuTQun
	 27F2aGILOuFcaopz8vbA1WnPcFcYWIzAKiinWQI1rZpbj07erZtZfQ34qDNXfcJW1F
	 Nz0EYRngotYvncmBQiq8ZRBOaKqJjlyy0ktMVEqp2bDyU9nqYkUSTZR+ivfaCYIvbD
	 gJW4rlMZr5vB+vK50s6bsNopdQB3ThslF9nLntlAJgaiJGVa82y+7Hhjpt/gSdYlP6
	 LSOCk6Ln7+M1A==
Date: Wed, 12 Aug 2026 17:35:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add Radxa E54C
Message-ID: <178657410907.1339705.15898024139333185288.robh@kernel.org>
References: <20260808080018.1492239-1-amadeus@jmu.edu.cn>
 <20260808080018.1492239-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808080018.1492239-2-amadeus@jmu.edu.cn>


On Sat, 08 Aug 2026 16:00:17 +0800, Chukun Pan wrote:
> The Radxa E54C is a high-performance network computer developed by Radxa
> based on the RK3582 SoC. Add devicetree binding documentation for it.
> 
> Link: https://radxa.com/products/network-computer/e54c
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

