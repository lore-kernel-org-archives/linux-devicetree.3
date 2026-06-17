Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8504BC010;
	Wed, 17 Jun 2026 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713974; cv=none; b=fl1yTrPdQT/MalWogWT1iMFrkiDyv/2vgsE2/VCh1dosB9OFXPOZmsO8amHzSMqGYvq1UN2hkuLG/QFQ7Ajez9Htr7e9h2zsYlrtvhDk04nLJILOqT7/t4XYz/mnW+3IJ7FLxW0c/vGGoflqmZBsXJej+CNYWgRrrBbHktcVumE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713974; c=relaxed/simple;
	bh=lauA3KhQOJ2vR8L23iRATb3eVlvAsvvyRywvGKgSrLA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NmcVxCaQ5uQw8RyiOEhltJp+50wEwxQCiljjokS4owStqxwMhQUmxhO9OiBgfC1eJb2TbjFb0bz6sO7EbKTEa36DtTKh+sMkPGBYhzNa7f6Zm5TVuWg/g5c1T62IkxxSC44g52w90JMoLAajpSZI9MHY5tXj4w6VNQ+XHQIh+RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtPPEq5a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtPPEq5a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0302B1F000E9;
	Wed, 17 Jun 2026 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781713967;
	bh=5d/2tc0EopS1tIZ0a3SHGqtQX51JXWpYZtaG0CjTUVo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=LtPPEq5ai+b1COnw25xTntRxnIwpdO35PjOKcEy0Jg1xIeGy+dgtxQGsqCPQ+wzJ7
	 jyjatBIR1loIdhTDSMeentWFOvLqojAMakp8agChi6mO9pEaLzYJsgkK+eZWJy/Kmg
	 A4+BXI8LmI8n2IzlR2KFoCt7BIcPJ2PZVkHSw3n73Ip/hgYMJmwNDW5cZId6jdJpjq
	 EaKRjBTs7tRp6n9uZsqGscawrulHhjPOUuwHY3h7fq3AqnK1HKBIaiDwANtHYtLtX/
	 MqJSikDgHX31Rcdo4BtYGl33KN/NtLfoozcPNxRZ6dlZv2LL3Sa7War/6u9fHKAarJ
	 qZJ/la94wHOnA==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, Maulik Shah
 <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] irqchip/qcom-pdc: Add puwra compatible for PDC
 secondary mode
In-Reply-To: <20260616-purwa-pdc-v2-3-8dda7ef25ce5@oss.qualcomm.com>
References: <20260616-purwa-pdc-v2-0-8dda7ef25ce5@oss.qualcomm.com>
 <20260616-purwa-pdc-v2-3-8dda7ef25ce5@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 18:32:44 +0200
Message-ID: <87mrwtcekz.ffs@fw13>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 16 2026 at 15:57, Maulik Shah wrote:
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -704,7 +704,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
>  		}
>  
>  		pdc->x1e_quirk = true;
> +	}
>  
> +	if (of_device_is_compatible(node, "qcom,x1e80100-pdc") ||
> +	    of_device_is_compatible(node, "qcom,x1p42100-pdc")) {
>  		if (!qcom_scm_is_available())
>  			return -EPROBE_DEFER;

Bah. Can you please prominently tell in the cover letter that the series
has dependencies on some other series instead of hiding that information
in a lump of sha1 references which do not exist for me?

