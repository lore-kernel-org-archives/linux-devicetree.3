Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68AC369996;
	Wed, 10 Jun 2026 19:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781119729; cv=none; b=XZyQy7zIbbMPkAFAaftSOo1+uRgCzT33cpVdvEHAmjiIjUC1zQGmbFV4nqpGQyFEN4FB2f6kvOsks+zQTHuhQp0EjyymgeewlVFJrfmvDG5eeR6civqKlPiYwbr9dX3k+zvdjEgnLz2Qncy/Yxqduu5wRbzVK+HcEB54h+rlxAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781119729; c=relaxed/simple;
	bh=qUBx29/wmqyzY0rA9h5mQ4NRZDPkR+qDvNH/3sZGOKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyCGpCQFiF85vf3CJRrqnGVEF11TTVATCmCI/UIyXZm766rSdvW/Hyg+cXkrWlinN+RRuK0vjVHvt69LxlXFYwATaJnFP3tEp2XXcFbZrzzacu/T+v50ntB4ahW8sOL4/ME2eicUFBJOSOvIbkx2QL4z/RN4iK2GHuMSoUrRbGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBq/yg92; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBq/yg92"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9FB1F00893;
	Wed, 10 Jun 2026 19:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781119727;
	bh=ervZ+AMsxW6gxwu8P9AnYGdICqIpYdSYZQ39jE9rlRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iBq/yg92w9R0y7fDQGxIAn+4u6CEXtuKThkbpXBaXO9jFTx8ByDsR0GA6CNXlXr9T
	 NRNvbkKtlx2Jem02L3Rr2yXarjpqdOEFf6MBukGgz8J3SMA1DFoN+I4Co+saXwqMH1
	 rO4gbQVhgYA/OdmIkaZOOZ0jj6EjJW+g4+gCWE5wb/q/+pNHKU6HMwL9i/uk9Gp/U6
	 gsM2djjw7JQDr4kEpgiUlKFHp3Is8Yu9CPpIX40NKhs5v8NK2IztyRWlr8pe7XYwhf
	 D3hyUIJUKc48V9lI3YqKFxj7SREMpZFCwu3zoSywf2rlFAtygudWo95KXRj2nGd5CA
	 VzfLYGpvsuy9Q==
Date: Wed, 10 Jun 2026 14:28:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: nvmem: consumer: Make 'nvmem' an array of
 one-item entries
Message-ID: <178111967044.674793.5974554745587773283.robh@kernel.org>
References: <20260610-topic-nvmem_schema_warning_fix-v1-1-4029becf13f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-topic-nvmem_schema_warning_fix-v1-1-4029becf13f9@oss.qualcomm.com>


On Wed, 10 Jun 2026 14:52:42 +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> 'nvmem' unlike 'nvmem-cells', consumes references to just a single
> phandle with no arguments (i.e. with 0 cells).
> 
> Constrain the schema to enforce that, so that the number of such
> single-item entries can then be regulated by IP block-specific YAMLs.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[397, 398]] is too short
>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
> qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[397, 398]] is too short
>         from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml
> ---
>  Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Given we're close to the merge window I applied so it goes into 7.2.

Rob
