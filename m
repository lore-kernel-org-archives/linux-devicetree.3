Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086E51F5821;
	Thu, 11 Jun 2026 07:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162355; cv=none; b=Swv/JkHVFVvcqVAuvW6xDs+plgMT3q0PtM1Zwdkl0VGld2RHIR34Z19JGHSDqARFB3tj899KSgJE1cH2Av3AjWCJHYosApSfkPotN3izmuHGjG/VkqiUq2TbUeE3x23pZpt4wIMyo2kp76C1o3EJYeX7rUvUB8RVb8JR2A10MBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162355; c=relaxed/simple;
	bh=qWiheM4BZI9VVY77CZq618g3xfyg6lVDaj5UYiTUw1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BAfH9OoL/nMjjKeiuOBMn5RmRWjGjcoU5l3BTqkF0a9hlf6AHrZsg5GFRok5O3wCHq0QSgCpKzwSpBTSbIUOAYkyuaRA996Ho20jobLcYVr6Wl4sHzeOIZS8ZZbQcX5pJdDDw50fqFRQJbg3yWjhEb4IQVefgeiOnUHS3RBl/cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OldRZJg4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OldRZJg4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8521F00893;
	Thu, 11 Jun 2026 07:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781162354;
	bh=fJDlxxsLRKCJxE4tq/bQfb7kaHEjPHmrFHttZV3A8Tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OldRZJg4cl2BkuUG5C8sWo2X/W1MHVERfrYW+skyNmJ+xGMaTofH37rv9MxovbJTd
	 1iVHx8limBNypRMyzcf2bmxW5hH3OUjdwkwt3G6G9Jw3gDmGDZPkppGSDtz3zmUcxg
	 JFUya95s27aInYuvlzGbZ/uOWV1xozzE0AeQr659eeswVfaa6vJ9h9ZLrxkGCLq2ck
	 lqnfUyTBJ272ZyNlm8r0v9P7LmIDg5shmHeJhy7dVwWpO0YQXhg4N3L/yOKl/yvKpn
	 +OxM+JbYKxc5gQoiFTcrRK5nsPCOyVGWQxG25V+VNdfvOgKEkzwFKlZcEDCzCKxr4K
	 VElwRlj3C54AQ==
Date: Thu, 11 Jun 2026 09:19:01 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, yijie.yang@oss.qualcomm.com, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>, 
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom: Add IPCC support for Maili
 Platform
Message-ID: <dwe3yexvmaciuvhw5ahbnqe3fww534hulpbt7hkx2nblujafr2@pgyjmkkfr3ze>
References: <20260526-mailbox-qcom-maili-v1-1-1b689a42f33e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260526-mailbox-qcom-maili-v1-1-1b689a42f33e@oss.qualcomm.com>

On Tue, May 26, 2026 at 11:38:03AM +0800, Chunkai Deng wrote:
> Document the Inter-Processor Communication Controller on the Qualcomm
> Maili Platform, which will be used to route interrupts across various
> subsystems found on the SoC.
> 
> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index f5c584cf2146..4b69a281971a 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -27,6 +27,7 @@ properties:
>            - qcom,eliza-ipcc
>            - qcom,glymur-ipcc
>            - qcom,kaanapali-ipcc
> +          - qcom,maili-ipcc
>            - qcom,milos-ipcc
>            - qcom,qcs8300-ipcc
>            - qcom,qdu1000-ipcc
> 
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260512-mailbox-qcom-maili-7c5cce6e672f
> 
> Best regards,
> --  
> Chunkai Deng <chunkai.deng@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
