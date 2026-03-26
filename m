Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE1288CA3;
	Thu, 26 Mar 2026 16:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774541926; cv=none; b=EPuXJLklj/LNNziiRGW2Pkc7HE0XHbE4vwptB2zy+NputcOuvf6NAFemH5LxB0Ef2GAausp8XRgyoM7Ec7tOEUn0RtgpbCnuTGAfBh9WQWCGNLp9H+NFZoFZrf7cDaiMjtlQZPvu5P8PXM9rxYBo0dzxT/7+jleweUplLlB4DV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774541926; c=relaxed/simple;
	bh=iP2N4mDz5wd1aZ6Wxxj7t6nxKqaug3kXSKL9agz0e1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H96hgg8Uxu8ZhkN9ConakLCCjAAGTfGbrhB1F1G1jt/W4tUe5izz+JTmnZ0u8mXgc+7zL4pbdmkddRBZwC5o8k7RgLs73ReNcSA3F6+EHjnQ7SQ7tEhQUo9jUWekjC76y33vJVcF5b+s9GmATkb+F5IX78Hp3hO/w2hIDuuqAvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYZqjYqV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYZqjYqV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86408C116C6;
	Thu, 26 Mar 2026 16:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774541926;
	bh=iP2N4mDz5wd1aZ6Wxxj7t6nxKqaug3kXSKL9agz0e1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aYZqjYqVWvwpxVjjiGOLe4aZ0/ABgSZPAFWQjfuiyRnRwWSu/M2PudcE33FOHG8uI
	 hwAgOvc96AIAlWAI6XnorqAE3TJKEPqUBvIvUtGRLjntPifOngYFCXK2bHnvVvJrLJ
	 M9UEQOOjfo59VC26sJDlnH9mep5ryNyTddRki1Ch72BlMW/CHGqeei7AyeoArGQdkk
	 7bAY8+UFedAbVnnzqi5P9No3UfqgR6PlfGr7ah4sXIzAnvQczXM86DOq6igBWMfNQk
	 4feANr0jh55eqGLrQlzYJfDtJ8Ediy8UihKubcx24ol58mR39pteXBHJ9gYSy/OHxf
	 7ex3ZmFVqWtGQ==
Date: Thu, 26 Mar 2026 21:48:35 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document the Eliza
 Inter-Processor Communication Controller
Message-ID: <ghcsj622vm2i7rx2nkfzjnlp743w3ua54jt6tqax64fdqy3uw3@7eio7ivai63j>
References: <20260318-eliza-bindings-ipcc-v1-1-8f066c33ce7e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318-eliza-bindings-ipcc-v1-1-8f066c33ce7e@oss.qualcomm.com>

On Wed, Mar 18, 2026 at 10:26:49AM +0200, Abel Vesa wrote:
> Document the compatible for Qualcomm Eliza SoC Inter-Processor
> Communication Controller (IPCC).
> 
> It is fully compatible with the ones found on the other Qualcomm SoCs,
> so add it alongside them in order to have the generic compatible as
> fallback.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 7c4d6170491d..f5c584cf2146 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -24,6 +24,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,eliza-ipcc
>            - qcom,glymur-ipcc
>            - qcom,kaanapali-ipcc
>            - qcom,milos-ipcc
> 
> ---
> base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
> change-id: 20260318-eliza-bindings-ipcc-c636f38f88e1
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
