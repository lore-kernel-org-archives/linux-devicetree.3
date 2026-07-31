Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4188329C60;
	Fri, 31 Jul 2026 20:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528939; cv=none; b=M0hB16jkcrncsXXyqwjeg0tpyB8IV1SkbuIuWXRtvQIb7ecSFCJzBUqRLXaz/jwFeUm9iCsyQz/yq2f623WDxOLMrJEiHpLeKtZhZ/KXQ7AFS7/b47OFcp8SP5iurri5H3cQC5YvZcPYwdIfxZYl04fwkeZVeVXPtRxzwiPig7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528939; c=relaxed/simple;
	bh=gnf0nbZ2qsNY/p3GjXYAAuVwlYgeUJc5Gh6n5IsuUZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGO+4XvBVDik+ZhHSzac3pOQ7PEEBseIx1JQmkcNsHMBFmxMKsQtm528pS1LzML8p+9E015DdIXbuV44mBXgcUHbHkUhJewqRoJT0Lq3Y+fyBz4DszUiYn+MvlWuKCPSYUvCSLs0z3qsp1YAoL2qhfvZJFlI5ynUW/ZW7B4JNWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIcoKZao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIcoKZao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246E71F00AC4;
	Fri, 31 Jul 2026 20:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785528938;
	bh=smrkd6WlPJv3JC73FVVo5YhOrRs2gOUzXj3M5ZOEgRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XIcoKZaojCQn4oYN/6zTVYmRPSNCzbOLVpzRyBwgwI/99K8zS7znMnfzCqUKw7+M0
	 T1s3SJ7hHXQ/VX37y/O9+BlLsDbvSwO40LkwAtTHmPm1g+9AEFMB2MB/g5oyzL5awL
	 YDnYHEwx/JajP+UBhSW203X3nCP15Uz1CRG73wSX1P52/Tl/k6dBl6o2SGLSI7YqMR
	 IcG+XebgPbOb9jcGjOpTb+OW/1HE0EhAn1L6YERgoET7WD4TVio+iEMlBOXPoUl/ve
	 Fv6ZBkllGlPIciYVR0udlv/BoBK7mWi81Ll5gofBnTM1vf4AhOpmjzwc0OqhbHU00R
	 wd4zXcgupBIXw==
Date: Fri, 31 Jul 2026 15:15:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xing Loong <xing.xl.loong@gmail.com>
Cc: Jens Wiklander <jenswi@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add mbedtee
Message-ID: <178552893708.1585375.2477394564041706505.robh@kernel.org>
References: <20260720073558.799755-1-xing.xl.loong@gmail.com>
 <20260720073558.799755-2-xing.xl.loong@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720073558.799755-2-xing.xl.loong@gmail.com>


On Mon, 20 Jul 2026 15:35:55 +0800, Xing Loong wrote:
> Register the "mbedtee" vendor prefix for the MbedTEE Trusted
> Execution Environment project (https://github.com/mbedtee).
> 
> Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

