Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE56394797;
	Thu, 21 May 2026 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779359154; cv=none; b=tUSPmli+xBNhMFMai/8YDfY0hJptMT6TsyM13Ki0qaBoSXotsHUhcrEzJ7lDnRzVLHqiphRuQsvyB2kddGIRHwDcfoFk3yRLLkNqnHQyGwoxNd0iX9Wl2jJjoea2DmexZH74hpl2qz9U6uxLVKgyq9gev4gbErEajJDIaFCCRj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779359154; c=relaxed/simple;
	bh=OL9ZPydjZWlQ4mUHifezohviQKeiBE1FGxyDqaYjTQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qdp4nO+L8vHRCQ0WhA2Miv5jSdIRf6ra4I0PRYserkId9KCqAbI8UzXF5eTVvqEXyzLGthjEe6lk8bjDqv5ORZJqflPmxBKF7fJF7J4rNqkxQhp/KANF6ULGU422zGokjfPUErN0zLgMd0XoP5gQ3h1hPevn50LLCYBcQYNhxBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXwhuDKF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXwhuDKF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754B41F00A3B;
	Thu, 21 May 2026 10:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779359153;
	bh=OL9ZPydjZWlQ4mUHifezohviQKeiBE1FGxyDqaYjTQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cXwhuDKFPTdj0VjEOBAA6TAxqaSq1QbZON7ExuhCi/7u3twW4TQtxYe/nLPOwH/KW
	 k2gGAuJHuqEzPdRwrgrCgTCUKSWLoJ90hW3SKZltGlv9b6pxD8LvbbQZrsnd7jwdJD
	 bPWK90BsuiMsrGn3tNFjeI0Afvm8Hq/RyReLoO+H/VMo5sMgl/4OnRkP0XKI2UYUZ3
	 T2dmN9k87CqG5rX3Ft6dj4AWf1r76DKAK1Dqe4m8qRGsmXIe4QbTgFhdNdvFjDdb7A
	 KjT3xTIVpB51XT0pZ6IhtqAIjQ62EVZBSOwHf5qUJ8BvzvzwJCnM8kefQF2ZJSyVS6
	 blTFjl+hOyPqw==
Date: Thu, 21 May 2026 12:25:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rohan Mithari <rohanmithari09@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, peng.hao2@zte.com.cn
Subject: Re: [PATCH] dt-bindings: misc: add YAML binding for qemu,pvpanic-mmio
Message-ID: <20260521-strong-space-pigeon-b62aeb@quoll>
References: <20260520164846.637522-1-rohanmithari09@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520164846.637522-1-rohanmithari09@gmail.com>

On Wed, May 20, 2026 at 10:18:45PM +0530, Rohan Mithari wrote:
> Signed-off-by: Rohan Mithari <rohanmithari09@gmail.com>
> ---

Every guide for kernel development will tell you to run checkpatch.
There are other steps necessary, but some guides are skipping these.
They never skip checkpatch, though.

Best regards,
Krzysztof

