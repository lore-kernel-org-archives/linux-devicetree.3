Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB74D313E24;
	Fri, 12 Jun 2026 10:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781258779; cv=none; b=ZcaJqd45V5Fol77p4h2bcQWmS537qNA1tjJUO18DtEXWN3C1e7RDL2tKtonUgMOnVaeAulJUYUOlsW9rMOV167ZziIPluvYnTavelyzOEi8taA2F8nnzhrWRkXXUbFXB2PnEcguM9Tm8bx1t8Su6na68S4qFA8VWPTOU65/HY9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781258779; c=relaxed/simple;
	bh=nVO1wcbg8Vyx+jEaPD7eQL4wlG4suC+xgJm3XjJHzpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwTRIiLFQefYpIb6omilO8f6ByUt/aCZo6qWm2emgSWPILVrwj3kD1ikBB9qghSe8AnMZGXDkUB8q41QzeWLF+3I9Do41UOH8eX4LRqHIYBQF/+lBWTxSWyqtes8yFfKp/vniKUMw60vsyDsWF+G5lDdoqP//ZrGRFa3+NGHfAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jhmgg5Iw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jhmgg5Iw"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A346F8D4;
	Fri, 12 Jun 2026 12:05:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781258737;
	bh=nVO1wcbg8Vyx+jEaPD7eQL4wlG4suC+xgJm3XjJHzpg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jhmgg5IwvBUCs/OSuHJNsZIzZlsohD32QTJgQASAhzb9brW3FYhPMeYd3GRJOQpcK
	 0oZ63Hs4/bd3Xrf8drPKsYfOU/fch0EOrnnqa44sgCHh9R7RvCVbcC/LESDnUQJxbF
	 yIAVIgFaGOzp6hkm/qJJ68/VgAGTO/UqwDEF8ygw=
Message-ID: <059f2866-b39d-4c26-8889-b5acff5372ad@ideasonboard.com>
Date: Fri, 12 Jun 2026 13:06:03 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: ti: Use syscon for the Control Module
To: Andrew Davis <afd@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>,
 Roger Quadros <rogerq@kernel.org>, Devarsh Thakkar <devarsht@ti.com>,
 Swamil Jain <s-jain1@ti.com>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
 <29c9bd27-df32-4c56-8df2-987722d02b9a@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <29c9bd27-df32-4c56-8df2-987722d02b9a@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 29/05/2026 01:59, Andrew Davis wrote:
> On 5/28/26 7:53 AM, Tomi Valkeinen wrote:
>> I have been trying to get BeagleY-AI display support to upstream:
>>
>> 20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com
>>
>> One difficulty has been the handling of the Control Module region, as
>> we need access to a single in that region, surrounded by registers for
>> other subsystems. In my series I made the related node a syscon, thus
>> allowing versatile access to the registers:
>>
>> https://lore.kernel.org/all/20260513-beagley-ai-display- 
>> v2-14-9e9bcefde6bc@ideasonboard.com/
>>
>> However, that's not a correct way to handle it. I realized we already
>> have ti,j721e-system-controller.yaml binding for older SoCs, which has
>> syscon but it's not used for the newer TI SoCs. This series takes the
>> same binding into use for the newer SoCs.
>>
> 
> We moved away from this system-controller thing because it was always
> a hack to allow us to poke into random control registers from nodes
> throughout the DT. This was a mess and also caused issues with multiple
> mappings to the same registers (some sub nodes inside the control space
> also make their own mappings). If you need access to registers then make
> a node with those registers in the `reg` property.

Like in this patch (dss_dpi0_clk_ctrl)?

https://lore.kernel.org/all/20260420-beagley-ai-display-v1-14-f628543dfd14%40ideasonboard.com/

My understanding is that that's NACKed, as we end up adding new syscon 
compats and syscon nodes for (possibly many) single register blocks.

  Tomi

