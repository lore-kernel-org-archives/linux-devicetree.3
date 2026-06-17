Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE363BF685;
	Wed, 17 Jun 2026 08:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684101; cv=none; b=LxnTB/1SW6Hqt9PuS5aPX0msqIRKqe9gqLwQbwj1WvHH+RxkOK7kk8o2RIv/jcui+7pqvSCBuofsrfO6EpktRKNlQFll69zjjSh23SpsaUNBnGigVZ/27NVgg0liQV38AzAh6LPvnnm3Gk2q5SkV/0u0BY+YbXEsZAir3vfDLUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684101; c=relaxed/simple;
	bh=UFRzjIZMl4fqCNAO5kfBRw/n6pttuXrdM8a5f7agF5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZnzby2P9TDp9bVXW56mClz7TWz1PDqIT+zDtMKRKNSyMjH/A0Y8z9czNYD7SZF17xSYAqvMhibzVEUEoDFn+Npc7RJJz4+dDc6NJmB70x9ZBEF4DdGfrJEA1yOgLLi4oH9c8F4C3pBc4Pf7PzzjZCoINRkg6KMTsSz/Yc8R6ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMGMPguA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMGMPguA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25471F00A3A;
	Wed, 17 Jun 2026 08:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781684099;
	bh=otwGeQpskHHm+wFZ22SL3D9NNml9z+98KO2A26lz/sU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mMGMPguAcaxnFd677i0gfTX4THeS7dJC5EQ+ItxTaqGvRSAK6JhcGVdlwsf31YW9b
	 pWRcuk2k5tz76jQ7L9bfucppCYWJ8ZcOCGNvG30GmP0aKPxlcbmXKVbmpC54Bzo7rE
	 +eSMyHdXdlKcpzOh/zQb75TFgLHi+VbPPs1XZ9hfaTFi/yZDNeQRHZiMSBkFvY1svm
	 YuClHdvZtrM23w1fs5626fsyFoMAy+GOyO6TqD5DGPVNYNbWSD61hfE9TuJnTXZSdp
	 xUNP+rCuFrdsBPOJNLYUNEOGRq2Fqo4gozHNsYoAVCN8OlBUfq4PL7yJ0DkSP5nSS0
	 pTenuppg7wCHw==
Date: Wed, 17 Jun 2026 10:14:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: interrupt-controller: qcom,pdc:
 Document Purwa PDC
Message-ID: <20260617-flawless-quokka-of-radiance-1de6cd@quoll>
References: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
 <20260616-purwa-pdc-v2-1-8dda7ef25ce5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616-purwa-pdc-v2-1-8dda7ef25ce5@oss.qualcomm.com>

On Tue, Jun 16, 2026 at 03:57:13PM +0530, Maulik Shah wrote:
> X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
> register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
> Workaround hardware register bug on X1E80100") is already fixed in
> X1P42100 silicon.
> 
> X1E80100 compatible forces the software workaround. Add PDC compatible
> for purwa as "qcom,x1p42100-pdc" to remove the workaround from Purwa.

That is an excellent commit msg, really very good! Thank you.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

