Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B0338A715;
	Thu, 14 May 2026 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761239; cv=none; b=XBd6dVJhjtR0JjHiIILzu359kslxzt53p5Zv1/j/HY0rK2TCtsKy7CH48wVQ52dzqmCxFqhW8A8qeypukS5UOdy+A8r79zo71WuC0uMjHvsTEORDbRhIc5s408IdYL1rnHqhEzYja/r2qTN3gIkYUW+qOWm2a+k17vyrc4F6pQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761239; c=relaxed/simple;
	bh=IbTNOhq3+JGJrRBK3S3BqU51FTc5CP4V6aEDy37QsuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nd7gpHyoW8UdHX+HSEwPZpuGmqLQDWkS9DJ6jMvUfA0BIt7Q42L/CZTpATUVwnVHEeBrX7HJL+yJNYqehKqtEuJSA7nRdNDaC6+LNssZdTG5UnTT/USROApmuAwcQeyDM8DU9gqMVQizctHNxNLYmgi4LneLYhhk5h0H9Hoy3Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaOusny+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaOusny+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BA4C2BCB3;
	Thu, 14 May 2026 12:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761239;
	bh=IbTNOhq3+JGJrRBK3S3BqU51FTc5CP4V6aEDy37QsuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QaOusny+HTlYYKcwcQ7uaViYslQMQxSG25pjHG+wfaggMuETmlHpFlqmDPOSddwdZ
	 1fZZ8HWNeOb3XSSpyhQ6kpywd7ObGX+3gJgTFz7m7eEzzElToiDvdRXUzPAZ1/4R+7
	 4+ECrs4EWBm9P3IG9skx4P6t2mjY+lL923cuh36yrGer3G6ipy0u8LeEvmlj0KUB/v
	 LbtHPjTKCE0acdrwHMglqB4kfYBJ/CZT3iSZvOzi+ku/aIOYWV8ltsyJJU1UOH/e0e
	 Xw06lsT2bLKYp8qtmCeqASgScrWyudDdmhUGOAzk9xn+9z7ajpmepYnNdFOj2LJ3qK
	 g4JR3jkhjICDg==
Date: Thu, 14 May 2026 14:20:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Hamamdjian <azkali.limited@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: document the Ayaneo
 Pocket DS
Message-ID: <20260514-electric-industrious-zebra-7818ba@quoll>
References: <20260511-pocketds-v2-0-299dd4247f2f@gmail.com>
 <20260511-pocketds-v2-1-299dd4247f2f@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-pocketds-v2-1-299dd4247f2f@gmail.com>

On Mon, May 11, 2026 at 06:33:53PM +0700, Alexandre Hamamdjian wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Document the Qualcomm QCS8550 based Ayaneo Pocket DS gaming console.
> 
> Co-developed-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>

That's pretty messed DOC chain. I also wonder what was co-developed
exactly in this trivial binding...

Best regards,
Krzysztof

