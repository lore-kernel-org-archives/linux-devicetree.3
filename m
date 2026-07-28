Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33BA46AF38;
	Tue, 28 Jul 2026 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250460; cv=none; b=qjQwlL0NJMsI5eI3BmujrQAr09RFCsbo5yyktSSlemCW/tlsEHjJ7+Ri+3VaR34SxS2LTf8u5POLMjYjTQOo7peAlFuG+GaN/B/x3o6dqcq6fdg6UQdclW/83CusFUrYg71k0tRYFLHQ/Gi8cdGL8gklMHpxDvv3GNgWDexgWDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250460; c=relaxed/simple;
	bh=UJm8H35I+8nfeaaMci1paDXuofcCLcDQmqdMrIFR8zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgNi/Ys6c2mgyMLDViMTXapd33p7tEqx2HLXexmscNgwTOdOH+7OOW2nz8PJbkcnvhxq10iHXtsuF1jjLPYjibbyzyixUu2BU2NYhaUwewNEzV4EORWrx8mkNIQUHlPDse+LvnSzbthQ9uLfzKdBKh3qjpS6v/bzXFcxL6mZGV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mqe7LPXa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mqe7LPXa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CBA61F000E9;
	Tue, 28 Jul 2026 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785250458;
	bh=h+fAmrTW72qqMMcOYFoeOWHWqQS7fUq9zxncIYnGVww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mqe7LPXaoUVmN2CjQpJVqJoo6XOe+Gy2GFpVJit4QAn4lh1+zDdq2gBXI7HkMU17Q
	 qSJEmYdZ4PzIByNblC0qluKMyQmF5GCJA2QNdLCjPWZBJjxnx9aRwrqXUxZWis4+OZ
	 pllbQYh5WMYoa2JVkNx/N83meROpHim6x7Lo0i9+1/OiAlW04wr2L1vOdmz01xxYQZ
	 6+BAfCe+MWHerCn3K1uTW6CcW5uhSYYOUIi82mvjLes7ApSs7zFm5qZ1Je0ltNESVv
	 cPwzgi9SzaJ0DcYWuONEWf1h6hzuDM6zT4YtlAr+S+fRrwAVJsNnNtyIaAHQhf0TLu
	 FGoFLnJnTsbCw==
Date: Tue, 28 Jul 2026 09:54:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH RESEND] dt-bindings: mfd: qcom,tcsr: Document the IPQ9650
 TCSR block
Message-ID: <178525045757.2160571.123555841344177214.robh@kernel.org>
References: <20260727-ipq9650_tcsr_binding-v1-1-931ac0e056d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-ipq9650_tcsr_binding-v1-1-931ac0e056d0@oss.qualcomm.com>


On Mon, 27 Jul 2026 14:14:12 +0530, Kathiravan Thirumoorthy wrote:
> Document the TCSR block found on the Qualcomm's IPQ9650 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

