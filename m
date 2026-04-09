Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B263F3BB4A
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 07:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719903; cv=none; b=TCvJRc/+4/+P/LPquARME0bHRc6ipFxxmft+trT+vbqo6QJACNl+Gf44T8D9H6NMaPlMB1z1J3oQ5eeujEheQg+SA74mQpuQLZC8rkpRstjwZ7tHjyZZ2lcDdYYa/ouwFWm6LQXz8AHQCmoB9HZwOB6b/ZnIEnFDTRxMb4NMMPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719903; c=relaxed/simple;
	bh=xoXaHyJutfcxSGhgHWM74nFyJDBXvAN8t1HEtk8e6vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HahsYZongDdnFSpCfbK96Xvw21ert+CSf2xbOPiXKBCqWY6endxF42lD7tiYQwL3C1hog2cMaMWa8llF7Rl81VgSaSBXJeAa80fqxcXr4n7vNxOf5Vbj5DuRV73hITjKBV62zUIO9vvNcgKZYimHlAqv24ZI6NPc2cm4uP7RNi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1V3bA0G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1V3bA0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C547FC4CEF7;
	Thu,  9 Apr 2026 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775719903;
	bh=xoXaHyJutfcxSGhgHWM74nFyJDBXvAN8t1HEtk8e6vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1V3bA0Gzx8Fwg65L8SnBoKFD6eyiea3S/Y2uxq8LK+hYe0oJUYUkPN+ZpqJGS9Kw
	 txd7qibsvXqwu7xi5KYPir2Agb/zIPjfAR6CRySWRvrffJPp0rQ6jVLTlWL5t9z4aN
	 wY/ohTIkESdhFiKCEp9eBzhEl5HkEWyHKLhQLy8zQNBzJjlsaYoUkIKsYJfYI2z8jd
	 Z68yTV5jmF0LAcPe/fuCY6/c7BMtM782ASnFqB2UEkU6/Wyc8oQgO+NCpthhnxgFgi
	 n969xqxvD0SzDMwlTr3oo4RGRuNy0pVeKeETFZS5xkALG0mIaM3VC8rtdsF6g0GLwC
	 dR9q86Zb7gJUQ==
Date: Thu, 9 Apr 2026 09:31:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Maciej Lawniczak <maciej.lawniczak@intel.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed-g6: Add nodes for i3c controllers
Message-ID: <20260409-beautiful-paper-labradoodle-d846f1@quoll>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <51c4bdc02b45f67a0e32610a228091e137c135a6.1775679285.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51c4bdc02b45f67a0e32610a228091e137c135a6.1775679285.git.dawid.glazik@linux.intel.com>

On Wed, Apr 08, 2026 at 10:34:34PM +0200, Dawid Glazik wrote:
> +			bus@1e7a0000 {
> +				compatible = "simple-bus";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0 0x1e7a0000 0x8000>;
> +
> +				i3c_global: i3c-global@0 {
> +					compatible = "aspeed,ast2600-i3c-global", "syscon";

Also undocumented ABI. Apply this patch and run checkpatch.


Best regards,
Krzysztof

