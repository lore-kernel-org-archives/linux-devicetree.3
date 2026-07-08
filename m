Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438843AB26E;
	Wed,  8 Jul 2026 07:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494722; cv=none; b=rpX470B070zlr4qWt9d6zw9ETTvXWe2nNniRHvr/bff11qkRZVD14HCEaNRuzxevnWbYErbhFeISsvomTCN8LinYk5f+tgzM9HXzyya/nasNDfZWPcv2B45dZ4UU0d4AFOF4ZfW3EPj3Bfxc7MtCSRkD9X7uukLAbfAwXZ2St6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494722; c=relaxed/simple;
	bh=S9uEYFvx4PsY/t4Ui7+hrvpbJL3AqOBNQkD+ZVc0Yxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDgKP4Uen40OPrvTnnIGWh5G32zkpvZA5O0fsYwKvIN9EfMvbn45d6q22wwUJzjWYIEFvd2gc+vp08o4+k/Ud03w3UkOJH19YxJKaFIqWUFAhg0lLRHoPuihXnuGZ+I2LS5v54TROLCQu9N6lq5V4ouwudujYhSCoAnjlbzJG6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpcn+bRu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpcn+bRu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEE91F000E9;
	Wed,  8 Jul 2026 07:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783494702;
	bh=Z+wjSAKNbtcG5gkpojA7VMnMewbLe69OoijhfgLiBaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jpcn+bRuleOzjL9yzPm71v+1hwOhsm9CFRyWqY+p+hXwGZHGQMoUwWOXU7SaS5Ok3
	 W6X9Yjdgt6vxY5TdHANzurLCGpKJ3fMkASc8qtsQ7WofNNlbLEb2V6E2Kwuqxhakav
	 ARfgF+wm2wsfOLz9WzjV+Az7hkk/htQZ4lOrhVLzNa+FZVmz2qwte4ZfYUZt/shvpy
	 mm9jYUWL3nffkGNo31tyg8klxRTEhm4yXmqH8wH5sb+YrGlRUWbiNsTpmVfkKgcYPi
	 M00wA/0vYH2n9YIXnPRKOi3oeh82a8z+EyW5rQIt3PtDGGtlqq1UUiFjq0BW/Oyajj
	 Uq23mrShcH6uQ==
Date: Wed, 8 Jul 2026 09:11:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Bharath Kumar <bkumar@qti.qualcomm.com>, Chenna Kesava Raju <chennak@qti.qualcomm.com>, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
Message-ID: <20260708-slim-naughty-mushroom-dbe81c@quoll>
References: <20260708-dup-sessions-v2-0-da40f9c98a2b@oss.qualcomm.com>
 <20260708-dup-sessions-v2-1-da40f9c98a2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708-dup-sessions-v2-1-da40f9c98a2b@oss.qualcomm.com>

On Wed, Jul 08, 2026 at 09:28:32AM +0530, Vinayak Katoch wrote:
> The qcom,nsessions property was used to duplicate FastRPC sessions
> inline during context bank probing. Session duplication is now handled
> at the driver level, making this DT property redundant. Mark it
> deprecated.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

