Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F233DA7F2;
	Fri, 26 Jun 2026 11:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782474159; cv=none; b=R9PKjH5bLu0Dkf4QaIEoAUyYZN9MGZ+ysmeXz8/XcUy/IlV1JFfPIRTJhhd+9o7XFL6I/A07gnYtcEpnOb+tuCPg2WNAzW2TQm2Gxo0oUEFhnURKVs9A8hNE+8Hnj+4My7drR7Xq2mKvxG8y5xTnyDb80nxEXctWd4C1V4/y0rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782474159; c=relaxed/simple;
	bh=BM4hFHiFsObK0LIS+fIVKgawCpiGQpH+mXX2lBxwRJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGRiGt772shb60B6Zk62UMg4rFfVfP3s1TOfA3119CzgF1QLOmfePxxnDgohOuD5uKKOhyJK3caxuC/myKCXGwjn/QlyS9FIdq9jJCzUjXRMg5kysX+mi4ZGkpoBXwhNUvRpHqEYKAvwy/F2AfbL++yCQaotT1zW4J0l6xBoax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dp3NNdvW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dp3NNdvW"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5C911E6;
	Fri, 26 Jun 2026 13:41:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782474114;
	bh=BM4hFHiFsObK0LIS+fIVKgawCpiGQpH+mXX2lBxwRJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dp3NNdvW1pGAEnSKWCxg2578oLJ6i0AisKoebBSSrScvuDG0WEWSdGx/Wj8MHWwOQ
	 P6WeNBn/2U4LN/5Vbsuc7XrYurGyDkqHrnEFiEQVXDNd0NhxnXHWUl5xdy5YWePj4x
	 Dd6NfsJJjmNzoUiy3kIbQQrZ08/1qFbUZ7SGcI/E=
Message-ID: <15d76a14-4deb-4f4e-a14e-2094df75bf75@ideasonboard.com>
Date: Fri, 26 Jun 2026 14:42:31 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: ti: Use syscon for the Control Module
To: Andrew Davis <afd@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Abraham I <kishon@kernel.org>, Roger Quadros <rogerq@kernel.org>,
 Devarsh Thakkar <devarsht@ti.com>, Swamil Jain <s-jain1@ti.com>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
 <29c9bd27-df32-4c56-8df2-987722d02b9a@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <29c9bd27-df32-4c56-8df2-987722d02b9a@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew, Krzysztof,

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
> 
> The only reason we didn't get rid of `ti,j721e-system-controller.yaml`
> completely from the older SoCs was we were told it would be an ABI
> break to correct those DT files. Let's not spread that problem to
> new SoCs.
I'm still stuck on this issue.

So, to summarize, we have the big control module memory region from 
which various drivers need "random" registers. In my particular case, 
the display subsystem (DSS) driver needs to access a single register 
from the control module, but as the control module contains a lot of 
registers, there are other similar cases too (I've seen at least one 
other series, trying to add access to control module registers).

Taking AM62 SoC as an example, we have this in upstream:

https://github.com/torvalds/linux/blob/4edcdefd4083ae04b1a5656f4be6cd83ae919ef4/arch/arm64/boot/dts/ti/k3-am62-main.dtsi#L44

"main_conf" (simple-bus) node representing the control module, and nodes 
under that representing either small things like clocks or, in 
dss_oldi_io_ctrl case, a syscon.

I'm aware of three options on how to handle this.

1) Adding small syscon nodes under the main_conf, similar to the 
existing dss_oldi_io_ctrl.

I did this in the earlier series: 
https://lore.kernel.org/all/20260420-beagley-ai-display-v1-3-f628543dfd14%40ideasonboard.com/ 


2) Making the whole control module a syscon, as I do in this series.

3) Adding the required registers as a new 'reg' block under the dss' DT 
node.

Both 1) and 2) have been nacked or at least very strongly questioned. 3) 
doesn't feel right, the register is not a register for the IP but an 
external SoC integration register.

Is there an option 4)? In your opinion, is one of the above the one 
clear choice?

  Tomi

