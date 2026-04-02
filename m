Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1A23A544B;
	Thu,  2 Apr 2026 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119077; cv=none; b=LIwSM5y3yTE3wNLeTKbMqJJFIQKCEyb7LQds+jqR5lm3k8dLGrC1HyzVVWT5FIRj0rqulJwLPTLSBpYx0rGrfqOSEBotVcd/xNvkcoiiqush96eQByKQr/brPmUxDjEVASG9eldFtmAZT9KgBLtBzarvrdUf/Rd/fTEAafET8yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119077; c=relaxed/simple;
	bh=6gJKyNm61ca71g/rRIl+QthHdc+5GOA/jRMnr4r1pbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebyjfds6/CNfbtBhlqe/u+qBnvyhA1Dj3Lbxtnp1i94VXPfDOwVEHKnIOPDUJplGpctWjM+Rkwi2l7N9CZpWbCvAMNYDYO/hlOaaVVQa9j6mNM2fTXhsP7yvM8w+1N4k7CggeZk+b92NsIJ4mdANKqwF85RJjmkvbGMkSdGkD24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiKMrog7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiKMrog7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AB7C19423;
	Thu,  2 Apr 2026 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775119076;
	bh=6gJKyNm61ca71g/rRIl+QthHdc+5GOA/jRMnr4r1pbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiKMrog7/BqQ53Sq0I5qWPpsxTqZhi75tjgUzkz/4FjBvlTPWqhGZ3g0sisvoor5r
	 C7xkcjfJwZBNvRqyRlEk/GIa1WlbZh1O/y8lO/sX5JldNFSClLiJGlObJkh8jh9omv
	 8aERksNT9VySzn1tOnzfc7RUwFJvX8QHfC9u1iY4h4Thv6tboYDjfR5fZAnBmj+1/c
	 E4SEWsQ9l/RduXqpKaHvMXRA/V8OVG5xfnHSMKdfgkRjha0fCrB1l12Jon20+MbP+y
	 eq9zyiUwL1F8dl4/ROp8XigsLoSmTfwktNqchqm8CAJkqBFLvtmMXny+yPYRRV/VKL
	 TCh/iQp/3sO0Q==
Date: Thu, 2 Apr 2026 10:37:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, David Collins <david.collins@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	kernel@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Hawi
Message-ID: <20260402-lush-magnificent-gorilla-2b894c@quoll>
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-1-c40963041078@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401-hawi-spmi-v1-1-c40963041078@oss.qualcomm.com>

On Wed, Apr 01, 2026 at 02:41:23AM -0700, Fenglin Wu wrote:
> Add a string for hawi-spmi-pmic-arb which is a compat of
> glymur-spmi-pmic-arb.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Another patch without any qcom reference.

I already complained yesterday internally, but I did not Cc you.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof

