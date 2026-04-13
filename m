Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5992632C924;
	Mon, 13 Apr 2026 16:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776099399; cv=none; b=ZHyy23R395iUpqxTB8u+3c5ibjBfw+68V48aFfVHRhpJ4QeahwRMCwNvNd564BL1KvXpSsmDCG6aQBD0Fi9iGh6iX4eqTOXpxJLsRKtrQazg19meM5iVz+wGhSuHpgaxO7usvYlzS0hxpOUu1WMq+xgAFF/YoQ2g8QQ+w3ihhqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776099399; c=relaxed/simple;
	bh=A2WKUiolSN0cifqJeS1wIZRnUlA6BejCiUNUjikFF9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9cX6rzcvEnYrfsSI9fj1C9l2k1KUHyGnno/jBNSzi44JamNtFoANXMsDKWT5ezp3oMixc5A++tbVyFE0vSjiw9rRbu3pFKhFyh8G00Fwt6bo89xiWj0PzKgvIUQyhGpUx+Guna6XTp7JM62BoPzIEIdBQIKVC57k8Z9A02/jlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFXetNPb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFXetNPb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E360BC2BCB7;
	Mon, 13 Apr 2026 16:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776099399;
	bh=A2WKUiolSN0cifqJeS1wIZRnUlA6BejCiUNUjikFF9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KFXetNPbHkpkD6oeSvI0ClRDN4DkgKpVb9/tau2iXoD30Xij3ryha74ZpSiGxpJIH
	 d4MDtmFjnaZL5xxRiDzN9IDydR+UYwH2HSYpQHp1KsZ6+yApqvPPsoaiRdqpRzmi7S
	 bdYur8Bzwv+tTciq1vuFOvHpF8iER9rEVXRxawqjIUPraQxSXCV5iuh0g/nAnsL4Cz
	 ktOdv8PstAvgLm6jv9izTLJoKjD/xa+j4HycKBA7TY/ByS501TGPsg/GAfQ38Fd0kt
	 vwxzvRknIGqbqBTLY7A4d74lmyUrLedIs2hSE7TaqRd1ZxSKAxxENREG6aCciX4EB1
	 bE+eX9UpRAGsA==
Date: Mon, 13 Apr 2026 11:56:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: sram: Document qcom,hawi-imem compatible
Message-ID: <177609939245.2987177.17896963682646094969.robh@kernel.org>
References: <20260401125528.594108-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401125528.594108-1-mukesh.ojha@oss.qualcomm.com>


On Wed, 01 Apr 2026 18:25:28 +0530, Mukesh Ojha wrote:
> On Qualcomm Hawi platform, IMEM is a block of SRAM shared across
> multiple IP blocks which can fall back to "mmio-sram". Document
> its compatible.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

