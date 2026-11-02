Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619827;
	b=Im6SfE44xk1XrHPvfuPYvkR6pHyNeyOB5yr8JlExTsT54zm4HGfEwv4XBenzVlUSVNuu
	 rB5FJWvrOv26dLy7zoX+1rG7vAXRYynwesz80oB5DynrYOILLg8AGG2PvNhEDMmLoYvHR
	 IV+/oaCHWdbYU9cFI46dKnkD+CWvsjmT4Y2FnAbdNZGan8f5fVMre12uyUhb7RwQn0PXU
	 HY4hI42aeMYrMi+C9OpkKK+6UAAvyfpO8LXdZyRiBhb7l8el4xdrYI2BTKSiti7qKaFUn
	 f2Dn3nzrMoJApqmUmyktXUMp8I/5TyJqfAtZb7gsZi/Z5FmIssLhOjfQha9ay7q/Plg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619827;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=deiRugqUlG37p9Wv3fsfyPkX3UWvJLBCmJ/1+SGNcog=;
	b=h443SiInViFZmhi0iTrZ7KrsG7HKDScButoMPm4adkGcA9jYMJwg+pAATcoN1MAxGkJl
	 meBPVUiLxt9dNZ87TzDNIYB4ha2/x5VPJCQTpW1Wd4hF10YuAU+Ksi2AFiyBK+zxLH9cs
	 2aIrZs01yAIMKDytTOaZfDDQ5Ruw2iNeDaMU8G9nNJNqJW6fWAMMBHtu0+rbJH7ZcgUuc
	 IzrX3uAsGzKFeUYKByZrk6anCHjSdO5yr1qVYDgzUOuf+zTQ5h1CJFMS+cLTW0yFTOnkv
	 1X9x4CRmsXzZYRKVTa69aURwbgc/L88nhY25r9YFPvEnnTyFdD0rYQ0AlJjISf2Zhug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dcUgFA8w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AC2606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dcUgFA8w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A15C1F00A16;
	Mon,  2 Nov 2026 11:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793619826;
	bh=deiRugqUlG37p9Wv3fsfyPkX3UWvJLBCmJ/1+SGNcog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dcUgFA8wh35BSOtvCYcclVQlwghBnwx0GfFoM5RVAt3mNNYY48YZaftacMfKTw24x
	 TFwBl2NgdC5ILeT+gED5+Mk7ub3fKYpT4fRYH1Th7UK/y1Z+yZCNo3nvMfupn7nML+
	 CZY9EViu4HfDSpjouOmkWduYsO7wxYha1m/UbqGIfegrbiipfM6VeXshs+L+ykaRMU
	 4UR/ahEqSfwNr+Yh04AHyIVd2S71lN9kmQ0W3uZTko9Vl/GHlnW6ZZHYzCMNUT20Fp
	 S4B5iKYaIM/si8ISYazkCcKr4LTYBZZPBGwpd+yt1c1kyvRtwo2m7/z5OFzJzvDsEN
	 L990q7EN/OlHA==
Date: Mon, 2 Nov 2026 12:43:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joachim Eastwood <joachim.eastwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Shawn Lin <Shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: add FriendlyElec NanoPi
 M6V2
Message-ID: <20261102-annoying-vulture-of-development-9eb1a1@quoll>
References: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
 <20261101-nanopi-m6v2-v1-1-e401ea64b394@gmail.com>
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
In-Reply-To: <20261101-nanopi-m6v2-v1-1-e401ea64b394@gmail.com>

On Sun, Nov 01, 2026 at 11:00:52PM +0100, Joachim Eastwood wrote:
> Add device tree binding documentation for FriendlyElec NanoPi M6V2,
> a single-board computer based on the Rockchip RK3588S SoC. This board
> is an updated version of the original M6 board with a few changes.
> 
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

