Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956463B42F9;
	Tue, 21 Jul 2026 08:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621864; cv=none; b=FNXv5dVYsgpXoGyB97/EyXzcyztkGtZG66zHWEfSgeo00Zz7tx4WyGA8iVNqzjnvRdrOtYeVEg+uMeCIR/LkwIXwd/RmwcSWDIp7hivIEIHi+gIteYQpLn80ycJes/kHpy3FjGf3agsk1An/tHyoDCv84TK2HqxwvQ/M33L1ess=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621864; c=relaxed/simple;
	bh=CuIpPx0dTIkDO1h3xtFLv028XG/ZqzQom3CwSihHLag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsxBpXsZrhF+uEPXepJi35cfsPLFYRCFZrihzBq1+muXpCnCWHkc4woHtQo8rxyM3hEg/mW+qLGa4I9f5Mk4EPMEw8sjLVdTJcq+W72+GYP+yaNyS6BTYuJizDHGclYwZ9C4i+AmO8ZBGofW5cE7SdiIty6yFETRs5TycakRURo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQl5LnSI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQl5LnSI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277041F000E9;
	Tue, 21 Jul 2026 08:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784621863;
	bh=gEp+GbkZD41eG5XmcLmjYK9IEYFdhEokvcqQUSEZvgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iQl5LnSIVpHkgpx1UKsBCW8fXeN0+2TX7rxQ6KJ/A2gGKrGXOPdhjfh4ZEYmpgKl8
	 i3R2Jic+M/PaEsogf3M7aLxo6gl8jBT1Jz6FSzC8gqoK3EiRE9UeGcHeBxFVD5cI42
	 F/3Jc0k3X4yqGWnpz/5NdeSzIu5rOVtvUg/q4o2avRihxy+2rPNVt1N7B6fqKNBvHw
	 ZXVGnhaBg8aJMjhvtNcZxrCJ3+b199SJLhKUssiBZMJeSC0jJiTwTXGV2TtFf1xBGf
	 PxuIXsoOAFgY4pX0RTY06Pg9ZnO5ukpxrS3BPvDkg1qmQJKK6iw9WRXV+/LvSCqTAX
	 j8Q7FNBH0mFWw==
Date: Tue, 21 Jul 2026 10:17:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Mao Jinlong <jinlong.mao@oss.qualcomm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: add CTCU device for shikra
Message-ID: <20260721-stylish-dexterous-sunfish-1653eb@quoll>
References: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
 <20260715-add-coresight-nodes-for-shikra-v2-1-ebd485e39a51@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715-add-coresight-nodes-for-shikra-v2-1-ebd485e39a51@oss.qualcomm.com>

On Wed, Jul 15, 2026 at 09:16:14AM +0800, Jie Gan wrote:
> The CTCU device for shikra shares the same configurations as SA8775p.
> Add a fallback to enable the CTCU for shikra to utilize the compatible
> of the SA8775p.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

And it should include useful final prefix.

Best regards,
Krzysztof

