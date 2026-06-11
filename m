Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F305B2EB0F;
	Thu, 11 Jun 2026 08:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167655; cv=none; b=pxUs0YJ9sQvRQJKvVFamwt4cbgnaqkVKq9I2VWz9ScQCjhEJ3eRv3eaBBEyxJCAPLxGnmepow+3UQll3RF8WZL0EVyAxnyN19dz/XiNeHsdU5g4FVPgRHpEB7CHqD/OrSLDxY+4VgZWl1Qadrcgf/q5Hiy1Lhp3ECcatYlu5yP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167655; c=relaxed/simple;
	bh=Dn8UVbj0zs1ZUe0IOB6qP3nxSnT+/bnMDNksgNxWzFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5dsIEeoU+yZXPe6iQOi+GKbSkkUFxKawaHQzaF4sqmUQkklguaXwGFOQd2I3fiLVqFVU07p7D/dsNvCUzyP0lpYVVi9aiFpo9Me3R6QWP6UpOopRxrXh9Ru9UbUZnzqwhna302DYhmd+ip39UrzlLkofE1NdLxiD/8tPYHF0Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jkkzl2+e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jkkzl2+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039F71F00893;
	Thu, 11 Jun 2026 08:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781167653;
	bh=AGrwJZ0sY0M2HR4rSEbgJJEC503fH4NBp81Cj404JMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jkkzl2+eFyv2pUiodA1NJsp1ZitIDI1JJS4comW9HaioCzZZpnPx632C7w7Y7g7R/
	 g+Mm4VDCO1qHfqHS+bDGW9LZVB2AauhpM7TMNm0PxnAgqUVTcG5yXNJP4wDpCjnMGM
	 Qh7H/ak/py8kdFCJLnbgwYfjEWvSpdIyj66z34u82wU2ERDRvBrMbbNYJ3licp7RIo
	 IAiBqIvAft2VOVr80ZUEjqMz0Iy2yYPB/oUlcIXMjQ0uzWfHhtIPm18zmJm5ZIqyk0
	 iyyqbyyShyKpp0PE7IyCdpEi7RKQy4Q23t0FGk/sRBnUMwl1X2NSs4CQ7oq751hJgw
	 ucLNAAwguFCFQ==
Date: Thu, 11 Jun 2026 10:47:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	kernel@oss.qualcomm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: qcom,rpmpd: document RPMh power
 domain for Maili
Message-ID: <20260611-swinging-exceptional-peccary-acacd6@quoll>
References: <20260609-maili-rpmhpd-v1-1-c8f976377726@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-maili-rpmhpd-v1-1-c8f976377726@oss.qualcomm.com>

On Tue, Jun 09, 2026 at 10:43:31PM -0700, Fenglin Wu wrote:
> Qualcomm Maili SoC has exactly the same RPMh power domains as Qualcomm
> Hawi SoC. Add "qcom,maili-rpmhpd" string as a compatible entry for
> "qcom,hawi-rpmhpd".
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

