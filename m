Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB923988F8;
	Wed, 10 Jun 2026 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078353; cv=none; b=ibS0tV8yW37Qtm3BThXvC2duaoNzR96omh+AK/KmRXU2Xu1K4v9A9itGB/4vCoi0xRwCwzK4XM+Gye/tkNb/TDTanUYd889oFGjJlyZv7gLDSx+KVFuhLJLN3kPcAPK8oQ9xAszxeL2pD+H6Zbl2y9rsHjw+XYJAzvu0cL+0QpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078353; c=relaxed/simple;
	bh=EBBdv6Bzg5Y9btu0dO+LKzrTm4K3s9RoMX2AglowUZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IG8X2qroI+trYiom4iWKr+4xq6wLP48j/GKFunOYPtho7BE/Wh5+5ZwRZ6wTI5CCHvlKTGQOksXkp62pbiUOXSmCwHlO+tvqOTe/5m92srZCUmhlB9DV4Q/lLQRG5s5dU4MMh3o8WDoW+MM0Nj7xGGi1iBuE6/sof79nq+WDGbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8ciimsW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8ciimsW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1D31F00898;
	Wed, 10 Jun 2026 07:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781078352;
	bh=EBBdv6Bzg5Y9btu0dO+LKzrTm4K3s9RoMX2AglowUZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d8ciimsWBia9bhTpfZ1sbLaLuy3QZrcBTm9h/LMovnPMS6EdiNqvY0hTr97SAJplP
	 neGT8UPuwATuw/0g+n0LvwygPluknhiRRbpFf6wMp20frP3tJsg1hy2Ko1rPsIcyek
	 kquiD1wSP/711ibbJhGPEivM+p1vZ4FT781kQnWH0rybcMiR1BISeR9f2JjwQ3k6R8
	 +gG7HaE4pujYwd+lEwoaMwpOfcPrsiu4l26TIwprOSBRvHnCpbAzj8PP6MthCor3uH
	 /87+93Cu2CZ9F/F6z6uUT/rKkniz5FmADDw2bYDL4JIe8AJqEzk4vYfIEEMJF7aYSy
	 EpTEcAj2cudUA==
Date: Wed, 10 Jun 2026 09:59:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document
 the ipq5210 QMP PCIe PHY
Message-ID: <20260610-camouflaged-crayfish-of-energy-3da48e@quoll>
References: <20260609-pcie-phy-v2-0-83bc80e79fa6@oss.qualcomm.com>
 <20260609-pcie-phy-v2-1-83bc80e79fa6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-pcie-phy-v2-1-83bc80e79fa6@oss.qualcomm.com>

On Tue, Jun 09, 2026 at 02:52:12PM +0530, Varadarajan Narayanan wrote:
> Document the PCIe phys on the ipq5210 platform. The 2 lane phy uses the
> ipq9574 as fallback. The single lane phy is documented separately.

What does it mean "separately"? Diffent commit? Explain here the
hardware, compatibility or lack of thereof, not the diff contents.

Best regards,
Krzysztof

