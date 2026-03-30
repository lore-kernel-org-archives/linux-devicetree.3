Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E805839E183;
	Mon, 30 Mar 2026 07:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774855546; cv=none; b=pEazK/U4r0EZkbjFg4R/RWkKw323NBFASNsPmYuDoop9+5W80kSGNJAkzRhi/ylSkBuFOfcQ4uRK2VVvIWgnDn9UO6fqXgipFDq5xhXNGeUeDz8keB9rlCYJ7UFzadSLss2xquBTpoR00SH8gLI7vv/d9geFs8Lza9xx0vOZFiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774855546; c=relaxed/simple;
	bh=zUCGwS063CgDb5WGCtLnP7o6rlr6jER8ZntTRi6mSUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDze3rJgJiyx9i1mMgcUPha5F/fAA7ZI3/CkTUEFeSOa77Z9ZdFFI+kQWeFhMSYoea0+EAbH/RacxrN5ff0rfbWNiud+uTL1nXS4NRbNf4aY4pKn09f5ZiWZ6W6HM9At3ZLeWXBS0zoH+rBS4Yao3QcEookaz0JBUe3pbi4ge+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHGz57Sk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHGz57Sk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1948FC19423;
	Mon, 30 Mar 2026 07:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774855545;
	bh=zUCGwS063CgDb5WGCtLnP7o6rlr6jER8ZntTRi6mSUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHGz57SkYW50N80hf/+5LD0roNcM7JY17S66TEuofbuKZGgSGTAox3AlCpt7TVOyN
	 XNXZMBUDSBBea2agP7PDE7GLt6YvhPrEhMD93bTSQP8LdLzFBfsRWCIpbYz+gK0j8u
	 5M5D48XypuLXNRE5+Dh3kXsemieWx6pmQFnLq+AZIvqdRnUL5JwP9w7Z9yq9pMctyS
	 pagwXNBf7b8DgDQQaDK9jnyokMjvSXEOAgurlbHe9gCOKBG/IJyRb+u+Y3Fnx2gD7h
	 Up0Xv3LutOy9NdoXVnYi/PLTz24h/VDqXUVr/8wdRD9/m4YFrcrvxFK7Y2N4QVmxLu
	 ABI13JcgjiYeA==
Date: Mon, 30 Mar 2026 09:25:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add SM7325 Motorola edge 30
 (dubai)
Message-ID: <20260330-rough-toucanet-of-drama-7ed4f3@quoll>
References: <20260329103055.96649-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329103055.96649-1-val@packett.cool>

On Sun, Mar 29, 2026 at 07:16:39AM -0300, Val Packett wrote:
> Motorola edge 30 (motorola,dubai) is a smartphone based on the
> SM7325 SoC.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

