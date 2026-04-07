Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E1818B0A;
	Tue,  7 Apr 2026 06:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775543492; cv=none; b=e5IOGMHGmlQqYKKMSxhYXymVD6qjzj2+6SMkvdDJqkZtuvFEQ0638TtS76GOju76o9vMpMnQYYd0BlxjwmAuxpqwvoGu1mC35WDDHCNVPkmZhde3S5pJTAfis2DwHbu16WAN0q4ghpSHxIPuCiYeyhelJ+wEALAQ2Bz5tbWxTb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775543492; c=relaxed/simple;
	bh=bXTcwbNDsiXrFc3ljW48JmyQKwUopmkQMOxR6xsSBnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idlV8XZDy/TTNXRba0cA4oCc/Da8F5TKSiflj5C0L3e+NnZS5De6BcoIFHU/NIvtlvFwQsRR2UxgALBbheg8s9W7o5roSfMPY0lnd1r4aO3glCjoIc3rbIFcCzzHKC28mP7YoUG/Dt6QgHXLkTMIJMHrjxBMpfH9Z/wpurlZXmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ogx4blcb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ogx4blcb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82AF0C116C6;
	Tue,  7 Apr 2026 06:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775543492;
	bh=bXTcwbNDsiXrFc3ljW48JmyQKwUopmkQMOxR6xsSBnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ogx4blcbI2hcCwHaWTU0fh2IzbKd4n1tVJSTIgDrAMtZAIttlH5Emg7jUbClX6rr9
	 GCzY86cIq8/ujUsTidEZEeVQVBLHHlMH7hNKI9OlX+bX9lV44SrPgDMzCtcgsfos6H
	 6N/pU1fNUOGIZE2jwCqk+rD2GGB8Ixuz/c7nkH0wGyishQdNKHgPgQFyxDDswvDPvo
	 2uxdburmuPMp+mXcA0bsxRMeqTZ6hJrUC2F81qbCDf6nFsuVftxybLHRCXLRtjpbTS
	 K/My6q4mzBW4Wh6U3cBeDWC6ZvMNOzB7FqS4AzU66A6UKX24Kzqj8yKueB/Ju0vbZP
	 UxIpvRQshtJkg==
Date: Tue, 7 Apr 2026 08:31:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: arm: hpe,gxp: Add HPE GSC platform
 compatible
Message-ID: <20260407-tactful-roadrunner-of-competence-feaeaf@quoll>
References: <20260406143821.1843621-1-nick.hawkins@hpe.com>
 <20260406143821.1843621-2-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406143821.1843621-2-nick.hawkins@hpe.com>

On Mon, Apr 06, 2026 at 02:38:18PM +0000, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> From: Nick Hawkins <nick.hawkins@hpe.com>

Duplicated From parts.

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

