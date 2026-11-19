Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124968;
	b=mZ8kOdoPf5KwfMrbZggXEtTGc/bgjwoeKLargwqQ1GRkrPAQdTrYHkQgLXsYiqfxGsZa
	 qiSwgzkyp7A0OaP18ylJKxE5gZihaL6tjNrq9bXzlDcAaWc8waI7oud1QK5IDvrRUP7cx
	 EkXbDl1MzwS9R2WW+6W+DeEvJiGtiyYC5ydpN+ZZsZxdGV8LAQCuACGQP7Pr6M1evb1T3
	 A8DH+vpooXPqDwQ0zOCcAqhgP9zPiyBDA40c7UOphN+BmJG+/soo5nV7f+d1fzOCfUKWO
	 oTCiEPQ+NQvD/D5/vtRvc2+9Xh177509AImzFNUt4D0eaqTK6cHs0tUEF4h5n9vrbVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124968;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dqFY46zm6egYH9t5KmwLXvg+tBy4Vv7ro9hejLUEyLo=;
	b=2EWABqiFA78HwMy03C4J16UuklPpK516iYoiQ3pMlm+fZ+tBXzFOdG3Kc4fwUgfQl0Ir
	 PRNVHaK4jADzLqmnPAmGNpmpnTz7MWuYDMLi9IBZ3FPAlCcBSXRcD5HFQNkHq6nc19OWD
	 T/aoO6GaaFCgOEFWr1TPGdSgCys3YaZCczC5JbA12TT8jOKVUC7ZAcuEmzlYgSX3djU/q
	 54KqaYKt+EO6+ABxZiBjHna8hAasY6hNfDm5vCpPmeMxhbO6/uF+aGl197p7P8nuTuOjM
	 BJbvRysdG07V617UgDI5OyFLsUn4SDCPJd1oEqq8I4RfNHmBj3sI6ZG7keB9lkWWfaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eVuzqfT9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8332C606A320;
	Thu, 19 Nov 2026 21:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eVuzqfT9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258DF1F000C0;
	Thu, 19 Nov 2026 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795124968;
	bh=dqFY46zm6egYH9t5KmwLXvg+tBy4Vv7ro9hejLUEyLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eVuzqfT97Y+6ATNIbIJnCGp00575h0keradQM49V9oQSUNMXYSelpv+8HDARiIGBa
	 uuYzucDmkX2px2ys9ahSXOJsJZhiuGhhTmPcGW3B7/WvxdbrsorMEgUcCrf5GirfIp
	 Agbeze0ycmbxT85EPf1I5hJcYvQWssH+y/NhyhrKkYvwumVPQvruhChuz67n26x/ZM
	 10dVMTo+KziOzofPm9Qy/X6T6kYy9O0/bluP1RAlLtBcOw5IHzzYMxrsYczUSKaTMz
	 whUQKNIUF4ObtcYldG6YX+AGq4xuHZ2VztnEF0sHv3ZDHMo/WjZZ7LjhRVoJ9pH9iP
	 dDw+pLJ7ZDXeA==
Date: Thu, 19 Nov 2026 15:49:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH RESEND 1/3] dt-bindings: arm: rockchip: Add FriendlyElec
 NanoPC-T6 Plus
Message-ID: <179512496548.785631.3672990790869029250.robh@kernel.org>
References: <20261104110640.1132917-1-diederik@cknow-tech.com>
 <20261104110640.1132917-2-diederik@cknow-tech.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104110640.1132917-2-diederik@cknow-tech.com>


On Wed, 04 Nov 2026 12:05:04 +0100, Diederik de Haas wrote:
> The NanoPC-T6 Plus is the latest addition to the NanoPC-T6 series.
> Add it to the NanoPC-T6 list.
> 
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

