Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0503C5DCD;
	Mon, 17 Aug 2026 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786956637; cv=none; b=YhZ8B7oQwIq7iXu+1GlHLQiz8byAb1Cigkg/RPgbW/+eejFpFQOhuB2tFz7Jdz8TPMIO4aH4K6d/qCLZmeEhGde47H25TUPZgfa8IayLcuTYudn+3YPknabLAYnzIpT6Hx43lh/Evr0bAcuPSgSq8K26N9uT+xuRnsVIEjJcP4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786956637; c=relaxed/simple;
	bh=V7sPI09NDnv/TOzLlwNQAD/D/vMmaFozAvs6QH3s8rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzkdpFljIu29NqaXyDYpr0KuewfKPj+I7JHHzOnBQDurT5Qn4jTmvDvyWAC3JlDzmH5nwPwX/0WQBJ7IqzeaaoljszQowZhtcJ5Uj2f1RM/+vGsw2TkWKIqmT4XzeVgcmWwDJKMOQfFTmM6SfDNhGLg6mAqCeykMXXlS14PCr94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKHrevmA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKHrevmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2671F000E9;
	Mon, 17 Aug 2026 08:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786956634;
	bh=3NVG/fnIH1hr1Z4451wftXcoqSh2NidV53lUO4APREQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UKHrevmAycsLJU+tXUxHIvC+VA72wNnduTmMJWHnxQ9pJVdRpUGh1j+BtWpTpE2LP
	 mMU8Z1PniO3m+TXpxaiIg+ulOQzYKbCIg7oUe8p0eBRVwyH+TWHU90BvwqgYOBh30d
	 4janILwibPAWnWDiiHW2qw9UOmenSVmbHtCLVpiwkHg3/cwoU9oSzTY7Ar74XFNKi5
	 gh/eM9Dy9opAbnhvT49NWoEa27q2dd9keR9dSRhmgWs+5mjSIOLQlSg2xg2j/3IckN
	 I/wS/umbSy85s21WeD9WMf+z2zVDXkEqd8hy/U7/H0L8oNRtYvknCX9EGcvLhnhCzF
	 D2OCJ+guHF94g==
Date: Mon, 17 Aug 2026 10:50:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260817-spry-attentive-hamster-ea3c0f@quoll>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>

On Fri, Aug 14, 2026 at 05:21:53PM +0530, Shubham Patil wrote:
> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> IP. Describe them with two boolean properties.
> 
> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> capable design is always IBI capable as well. Both events are reported
> through the controller interrupt, which is therefore required whenever
> the capability is present.
> 
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
>  .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>

So the same SoC using this core will have different synthesis options?
IOW, why isn't this implied by a specific compatible?

Best regards,
Krzysztof

