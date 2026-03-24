Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA863DBD57;
	Tue, 24 Mar 2026 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343482; cv=none; b=QQ1R3K+LZFt77EzFeNRfy254ZoTfL7HnCYA0uoW5GaQ1HFk5HAcTDYngWFkJiCANw+NHypaa4HETS+wvhTeYfo+HrDFICgF4g5sHt/ivyyiHy42SLlXyVGatFQUcepjwZ7RHHe9fnltNHEb6vqk2EqIPODBq5/qL01DU1S5bh44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343482; c=relaxed/simple;
	bh=cZG8DBYIiaHe/buOYngWs4iCpUQlV84Vyl9E/F2AttA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwitjT1FrEwHdxyE0VsbioRTRAJ+hJyWWS+jWo8caAOOzLdsBeQ+zpemRed8Rde1CMamwoOWB/np6P1XtJ15ct8MVpLTznRz3nG3F4o7C2ry1W1h5/yczVi+9ICqzXjkTyx1WlmVpCqXgu3ZOoY1B4hs4SKqk+4PxQ3W+iy/TQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOK+ptvA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOK+ptvA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8684C19424;
	Tue, 24 Mar 2026 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774343482;
	bh=cZG8DBYIiaHe/buOYngWs4iCpUQlV84Vyl9E/F2AttA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GOK+ptvAw1kwAETet0dE0NfrIiDj9ffvR8FbiWKHvqBPG4O+PeUtPmPbo7e4pfWkS
	 /yP/vkVLd4Z2JYx0cU3Bj/N1ymISfqwtDNbmCkjBT9Jp6wkZbPSFmejXUpWPsGqn2g
	 8tNzCVzmp9aRbN6Pf3q6/LS26CBOsC76gFnSGRoCe+jXgpIEcg+RyFdi2xcWqY2P4L
	 EXph8vum8oGgrfwIz3B7t6hwCvxbBe6/mctPQc+mMczi/CRpYAHQhMCpfN9XonxsH9
	 aoz6DkonzdFK9juqg9nDtV2SsjYPD8sTtg8DJFy7w5NrHS8qom92/wiBuo59xPfATi
	 bPPvcvXSYLE2g==
Date: Tue, 24 Mar 2026 10:11:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Udaya Kiran Challa <challauday369@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v2] dt-bindings: arm: mediatek: mediatek,g3dsys: Convert
 to DT schema
Message-ID: <20260324-positive-fractal-moose-7b439e@quoll>
References: <20260323180616.23333-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323180616.23333-1-challauday369@gmail.com>

On Mon, Mar 23, 2026 at 11:36:16PM +0530, Udaya Kiran Challa wrote:
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.yaml
> new file mode 100644
> index 000000000000..4eea36632e63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.yaml

Apologies for not noticing it earlier, but still two things:

1. Place it in Documentation/devicetree/bindings/soc/mediatek/

2. Filename based on fallback, so mediatek,mt2701-g3dsys.yaml


Best regards,
Krzysztof

