Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A0335F5E0;
	Sun, 12 Apr 2026 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775987428; cv=none; b=fuZb3BVEa6CTDyfOhY0KuTdITLgXvMsHrNTnhPJJ3ld1ZYVoH340kfVK6wj18GpdEJdF/D4n1Lq7WF5JyCw6dwHonFRYG6Ul1+P0HDMhxUuj//HDyW8VElTw+1eMqq+BSo5+Xb8evFOJgvByS/fhL2XWVGaJAGBmbs1MzpdI9MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775987428; c=relaxed/simple;
	bh=7YqcioY9WuxgKy+2v9DVxJV8vkXH4+kS7HY6Sw6vedw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIntuqCnI8qpvOdjKBGVQRRw9+kjgw9oviurr5Efp1fEPmirTCfFjT1SzHJ+F+12jPmuacsO5Uq0UnmS7Ac2cTVXqtjyPVUATcHjAj1eU0mSrac13xhW4BhobwvOAD46lQNUEwNIFH8TXyNjkuysPwHfhoD+h++j2BUM3plHMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPrt1eWt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sPrt1eWt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C850C19424;
	Sun, 12 Apr 2026 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775987427;
	bh=7YqcioY9WuxgKy+2v9DVxJV8vkXH4+kS7HY6Sw6vedw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sPrt1eWtc/X5I7Z7uguicd/tj427Yx/h/GftaPRI8Vvr7PmTlXgj+IBp7nwJC+g6l
	 13Vc41QwolZf+VpFGxV/WcyXkS2ORIIPU/ZntXXq/ficMzVfCd49TVwZl9sYvmOOAi
	 ljsFl1hvpV9c4fhvS398pnbCUOkiGstPqE+zpl8YStxxb79ivW8G7tT6jUjLCcNHCv
	 LZpJ2RiXISAavepNncNF4WtaSISYGnZr/LKxQGD0OxTlCktRYw3GfX22MYh5NZMRaR
	 trLwwgXhf0x5hAu3LzHFNTdVKsIFkSgl7BlapehR2UbpFInPQdtD6NP66bLdW2OVYs
	 7NkD916p/5Kkg==
Date: Sun, 12 Apr 2026 11:50:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	liviu.dudau@arm.com, sudeep.holla@kernel.org, lpieralisi@kernel.org, 
	pawel.moll@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: ARM: arm,vexpress-scc: convert to DT
 schema
Message-ID: <20260412-hog-of-splendid-intensity-84710e@quoll>
References: <20260411183355.8847-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260411183355.8847-1-khushalchitturi@gmail.com>

On Sun, Apr 12, 2026 at 12:03:55AM +0530, Khushal Chitturi wrote:
> Convert the ARM Versatile Express Serial Configuration Controller
> bindings to DT schema.
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

