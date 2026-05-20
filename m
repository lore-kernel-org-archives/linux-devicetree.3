Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BC836CDEF;
	Wed, 20 May 2026 10:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274428; cv=none; b=uUtyZZ9M9+r03TOfUvMNfkuGHXs8++TRnPIIVkAmn8Te2CBs8ZCZtYQOepwyQWybNSGJCI79QHjbB7XU/ZjjSAcocIOBII5ZvheypOahn6qgO30Xf7A76/9SGMs7zL66IiDq6BCWBLVQqSwDg2g63xlNyM1slvVBqdzduOqfzGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274428; c=relaxed/simple;
	bh=IRxkVHCg2y/WRelXFfVQv7ye0MWjRJqjzHGYoMPTl5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kCJ1u+QEgZ6kGQ/0I8pO5esrO67e1cncmGNjpOT4MC9FhioOAOWRsv2xOkHHH/B+8uwE2gqinRHwscH/BsARAjGpckm4rgkY93vaYQ31eH/A9M6EpC7+/9LAzighQgfchGZZocgnYy0eU+8MOGuP4HwqmEBbB2v/OvkcwQD03gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/NC+7Ve; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/NC+7Ve"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510DA1F000E9;
	Wed, 20 May 2026 10:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779274427;
	bh=EXQR7oYHCZHCmFATODLORg7eYO0644o+GFdvHte30og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G/NC+7VeA7pt3n5i+6DttIa1k2mrp/U79aOJZ+Nnqh0NAzoHBieMRygMl6kdzkenU
	 nF/fxL2/jqehASPGeRaC4drZYlkBBuiWFCoO/jfcZuI8xTDc6v4AMNxTF3+opFjxeD
	 yeOArzrei52B+E69yk2K3zuXjr5X/RBwEpOY+s9aOVMydgcPrhxlNnhyo6l9L81yXv
	 ZHtEvDSDAzaOQEOpxA6C154KcYYQJpLVOHW0wk8RNwRB3C9TqwFok2MrEJyPvqJMlt
	 CYnRzKVKNdlPYxZho04lCQDSyZQYTQSTcMjJREuOIawJJ4NrmZ4Rl6j6UbjAaCh/G7
	 vj1pRTXwA4kDQ==
Date: Wed, 20 May 2026 12:53:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcoms-c: Include Eliza, Kaanapali
 and others in SoC names
Message-ID: <20260520-qualified-striped-husky-8bd1f9@quoll>
References: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
 <20260519-dt-bindings-qcom-soc-naming-v1-1-005d29d261ae@oss.qualcomm.com>
 <de210bea-ba3c-4be9-aa97-5d04d4d3d9f3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <de210bea-ba3c-4be9-aa97-5d04d4d3d9f3@oss.qualcomm.com>

On Wed, May 20, 2026 at 12:05:08PM +0200, Konrad Dybcio wrote:
> On 5/19/26 10:03 PM, Krzysztof Kozlowski wrote:
> > Grow the schema checking for proper SoC compatible naming style with
> > recently upstreamed new Qualcomm SoCs: Eliza, Kaanapali, Hawi, Mahua and
> > Shikra.
> > 
> > Since switching from model numbers to codenames, this list with explicit
> > codenames will have to grow and list them all in order for the schema to
> > work.  It feels like a churn, but the compatible naming is still mess,
> > for example, the schema pci/qcom,pcie-x1e80100.yaml with a legacy naming
> > vendor,IP-SoC (qcom,pcie-x1e80100) received a new compatible with new
> > style (qcom,glymur-pcie).
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> > index 27261039d56f..b5f3a750cce8 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> > @@ -25,7 +25,7 @@ select:
> >      compatible:
> >        oneOf:
> >          - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> > -        - pattern: "^qcom,.*(glymur|milos).*$"
> > +        - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|milos|shikra).*$"
> 
> +nord

True, ack.

Best regards,
Krzysztof

