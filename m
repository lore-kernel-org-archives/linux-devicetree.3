Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8518374731;
	Wed,  8 Apr 2026 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775632201; cv=none; b=RBKPjzCX/ZOey5kcvQCOvsOqvoLAAcmgGZZDVy9qkotxXW4/3bRkFhvYaaHuqRJte26JY/LCT6vDkIUyXIfu0HYiOgS70m/AE9lbI8sN+CE1Xf2ouBKhq2F6a6hofwMlvKcIQMO9VRgc1z/4V0KZYWHXovcQf0OwwhjSqkOoA8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775632201; c=relaxed/simple;
	bh=kWXdgEcmDAqUENv/9Py+CnG+l3u8cKbufZMywSmhyWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPrV5iGoSAGug0fkAQJf4SijUB++fHR1ESgrrsedAI/oYXw0S9qU8xCVfhgcLIvFPx7bUp+ZJCZIEYq/b+gxnAbFlKQDrEB/sATuHmeUf0h0hsvAwnFYkA0kWu+lUOQQAMU2W9WBi2KjNYB/bUlpa4MmYvFOLtVFqITQB8zR7Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTe/Gtjd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTe/Gtjd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06597C19425;
	Wed,  8 Apr 2026 07:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775632201;
	bh=kWXdgEcmDAqUENv/9Py+CnG+l3u8cKbufZMywSmhyWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTe/GtjdU7gh3w/jVqaYAKJC4Pe4nGjiN5KUYWWdwOUkUN2pCfVqZP3x+CCA2bXjN
	 VQ8VP16LXoeTiplkBZ7JGQ61OqYUFuyjlz9fEZdxO49rJi7GL2G/0f1krxABrtv3XR
	 Ebg1ucRL33eAfQJxbkGSApEO7mSlxpQ0OnHRLnDqbfMqIttX/aQRrzIzrdyhZzE8qa
	 3w+kYDOG6kmLeFYfkXVMIXdE9SJGhgzsjLjMOp3B5mlyMl4C+pV8cN4NTbCwv8pAb0
	 bd2GHIKSj46G0kkgaVy2oFE1ImESCLxxEzGbUZuK3/ST4NiHs+n6U9YDXNbh5ascOm
	 J4UQsr4dmdq5g==
Date: Wed, 8 Apr 2026 09:09:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: Add ChipWealth
 CH13726A AMOLED driver
Message-ID: <20260408-skilled-wine-bloodhound-a6e71e@quoll>
References: <20260408-ch13726a-v4-0-9bb1a9b8f329@gmail.com>
 <20260408-ch13726a-v4-1-9bb1a9b8f329@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408-ch13726a-v4-1-9bb1a9b8f329@gmail.com>

On Wed, Apr 08, 2026 at 12:32:39AM -0500, Aaron Kling wrote:
> The Chip Wealth Technology CH13726A AMOLED driver is a single chip
> solution for MIPI-DSI. This is used for the AYN Thor bottom panel.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  .../display/panel/chipwealth,ch13726a.yaml         | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

