Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E95382F2D;
	Wed,  1 Apr 2026 07:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775029798; cv=none; b=bBTrnGZRNOHsAyNibVUgosclmYMMDoq3sZ3d3x4HsXNcp60w6V3/VNlNyOxUkxtWdtihimsIcW+/FFzcxKGCnhDScvoKe1WOmB2xYsak06ieDufLssFt0aiMf74m01iXa1UncbP0ojV69Sj8qLYpm3D0Jj956SojozKzt69S1uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775029798; c=relaxed/simple;
	bh=9WpMSz6+rfJQ1hJYedFWyAfqy9LFA86jHw0pF1Dcblk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZcQLGQOLV/E0yT6KY+3nwEgiF/SK8JAapbNjIDR90MCekPDZDIPmdl4QtQb5ueday351j8PvkbtblybMNxiznQvJrKGng/eL0ZQG6lz+ZlH3SXAQ/3rI/VoxogUM4A68/Cf9nQ+IzFYORUCiwh/dUaA3q+YJaZnfB/80sGhKg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpNjrQjE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpNjrQjE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C35BC4CEF7;
	Wed,  1 Apr 2026 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775029798;
	bh=9WpMSz6+rfJQ1hJYedFWyAfqy9LFA86jHw0pF1Dcblk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpNjrQjEeahSbzoReGxTBtbXSOT23oSwEkxeCsBbM1z0FWERUA85l3zRlfJSB/K/z
	 wC3xy1v8Vln5JH0bzjQkcrbPCnHHHzRs9+ffGmCbH01vhXW9OudK3DCqFcleHiPij8
	 YDotGOuxB6nAWOVJ3P+44BTUvaf6WBeXxi7H9LH3/eKQxLod7pcfXHsbg87vNpu5yF
	 smEFqahpyQ2L6noWG9ss3HjKxeylbvwB2qtCg7Dmwk2stVqu5cllm5xgy3ulSKj0IY
	 pmfmfM4n5AtC8QWKBuTX8ePJUacjdO2ruYyQVdN0BplsGgu2dEvjjldctrHwQSK+rf
	 mx+CLjVPr9Cpw==
Date: Wed, 1 Apr 2026 09:49:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: qfprom: Add glymur compatible
Message-ID: <20260401-axiomatic-super-eagle-f6aa2b@quoll>
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
 <20260331-glymur-qfprom-v1-1-5b4284d23c80@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331-glymur-qfprom-v1-1-5b4284d23c80@oss.qualcomm.com>

On Tue, Mar 31, 2026 at 07:24:20PM +0530, Pankaj Patil wrote:
> Document compatible string for the QFPROM on Glymur platform.
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

