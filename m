Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9235B352009;
	Mon,  8 Jun 2026 08:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905863; cv=none; b=vCy3Eqb5ddfS2woTgmIc35NvqxbsE0I5mbBl2T/g9usevcD2PDdfInyhhMgjSIqUrtRlKd8H2yDXvlxvNR5tm9ERngju8EaEdOPTmHfcaoBu7qY2bX4KHHPet6j5Uaulv7pWJHnqDse1r4+DQQFWkRFxlWW0BGzo/w1Fmy8QbxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905863; c=relaxed/simple;
	bh=AgtRFOGIviCgasKMqCBNwv1ZSVgJM+/Vmhc1Ou+YutE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSbxQiGaad+eaC6RlLxYjAl7E7kYlD9DjIoK1OpMsQb4GFf6gm0GTgCeWTe7kVUhW2hG1M9dtNJsILJ/C7GTn/NeBKEHI7HFIZYa9ct1RW6letyUAPGkZop32CrJ5l5Y21SrzTPjOt86WAowShqNoT7iORR2q5YvqatmYxxUj0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnxDpAJ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnxDpAJ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4772C1F00893;
	Mon,  8 Jun 2026 08:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780905862;
	bh=KQutdxs5ADBqnbY26X9NSt2Xu29A9zHjMopO7CrzVvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FnxDpAJ/fzH3vBmTSSmFSZW4zYebelDfI+A4HSSarhGjZYymI7KdNH1XWzoNx56zT
	 JC9bcRIe/E6AVk9vnGZLq7jzpBRAGgAW3e1UL3B2mpeKpdr8Nwl9mflyfm7KXpIV36
	 ZGe4IJubvicboOcu74Z71TzKOB6LA3wWjkvF30YP7Npzqn9jJdICkvLQseOb4qQpud
	 9RNakVBmWJqPF6kntd4nfXIF4o+eAhnu+K+qEF4W3JU4wdSsMF/HtDa2OXztfxWyyd
	 ZzQahvsdnp/IdTPiOI2WIFV/yXeu5FT4FYbyBajnwjHcffFKX2BK0Tq3R1HpYFosc/
	 pOetpQz/LZFKg==
Date: Mon, 8 Jun 2026 10:04:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
Message-ID: <20260608-elite-dandelion-goshawk-bd5acc@quoll>
References: <20260602-fastrpc-v2-1-67a55e22427b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602-fastrpc-v2-1-67a55e22427b@oss.qualcomm.com>

On Tue, Jun 02, 2026 at 02:51:08PM +0800, Yijie Yang wrote:
> Document compatible string for the FastRPC interface on the Qualcomm Maili
> SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
> fallback to Kaanapali.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

