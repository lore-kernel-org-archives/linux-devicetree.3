Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363289;
	b=2xltOrgGNWfjx2cE1xOSGrCMEJs92tLBWJbKmqR3gHG0Ci3CU/ZraN5Bs+cjypjKIa1R
	 lboOwcZeRXrPVkzf+LxZUkkeVADDkvFVuwWT6AvTU5CfMIxv6ggAFGB7+ayG5wwCArUEG
	 MX9bLvSKvtEUG9VEuZBHcxO3pFryT8ITckz3WsNUmQvJLlLjZGU/4avBYrc4lCOvNsl7e
	 noQ5cVvb/mk7k6QsFmLTlB1sRp51My6zqI0GP+tpPeoEHxKEVDxdY6+S5wGsgER8SSHGv
	 1tPhMafhcfbwDi0t1CGucomEDpZ5I8i8OFbayKIcETTs3pg3RU5AEgbJzkmMHkPMgLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363289;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0nnzDdRCsGSeP+fBdqjwR5i2BMDAgYKhOGLFfKlLzIo=;
	b=lboQw4Tc4ULJCalpCx8pGXzWuK1TOZjj2qW761eLAJNEjBPjm0A8sszG3igrihLJLsZA
	 qg47nVC1zwHq/nX12DXCGnxNd4AAuFTV1sWFugtkYEX+7AW2KJEdD1VLancRYvlkRULVo
	 QVAW4pRrVK3HdhC1vR6LCDkat4c8LnDYDPaXAL1EvAftY4Er7TtYbO8XZ+1OTaHkKuhc4
	 VA4qJ6zUL+dQx052sBXuk1/v6wymFtVCi1atvcrNw5IlCs2T9ywiDp5d+ANQsn26bkt8c
	 453lt378UJJEfVmWj6n2Omwd470sLlIZJmQKKc39j7mJs6rlEKRVnwY+m7elHsvRT1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=Eh+7VJEr;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=gbuRDhUX;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F634606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 16:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F634606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=Eh+7VJEr;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=gbuRDhUX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795363286; bh=0nnzDdRCsGSeP+fBdqjwR5i2BMDAgYKhOGLFfKlLzIo=;
 b=Eh+7VJErFIBUDYkPbpbvDOQjk5NsWIvUmABvhX2IorJ2v3Zh0ajUHVdEJ7UqzqMisnBjoz0kq
 hjQJHPgZL2mO7dEFFKUzJgH82rqN7V2Q5tzFJ8WfX17hzTzKIrPZzHdTdQxvG1cdnTNAMrIObsb
 XZq0WY0usSo1uphHJdJQMI4R33z1QWAVCVtR3dYMU5S1sUISZKuYD1IMZdJnGc+PGz0sh4lmCXN
 yadoiJGtxYrn7nHbSwfdbYhVNFCo33WLVj56hqcq1EL9Iv0wdR/30jzL/tBBYcPhcQGj7QBGLG8
 YuLTjtOGnlW7a7dE6V2/cIOcn4d7lhImBYC1TYDMt24Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795363286; bh=0nnzDdRCsGSeP+fBdqjwR5i2BMDAgYKhOGLFfKlLzIo=;
 b=gbuRDhUXS9DJyWrHK1POYbLb+X7FywXZ27byfLHCmbzV5K5X9TbqRx1c1R9isMfribNWKc0Dr
 8s24RnfOob1nmoPEl2x9OkY4UKGONW4FICwkGpgsfAy0wAZ4xbJklXpwDWJ+epUV8MqWFTG0ANI
 gT+HYei2DvV6fWv3KyTHOCo=
CFBL-Feedback-ID: 6b0311c84993f8611a547daf:b2541adc3895f43479a7fd6879cc7454
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0311c84993f8611a547daf
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5cf52e28-110a-4fc2-acfb-eb264e8c31e2@kwiboo.se>
Date: Sun, 22 Nov 2026 17:01:08 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] ARM: dts: rockchip: Add support for RK3506
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-3-jonas@kwiboo.se>
 <86007bdd-6c10-46ba-aac6-197939934c73@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <86007bdd-6c10-46ba-aac6-197939934c73@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 11/22/2026 4:46 PM, Andrew Lunn wrote:
>> diff --git a/arch/arm/boot/dts/rockchip/rk3506.dtsi b/arch/arm/boot/dts/rockchip/rk3506.dtsi
> 
>> +		gmac0: ethernet@ff4c8000 {
>> +			compatible = "rockchip,rk3506-gmac", "snps,dwmac-4.20a";
>> +			reg = <0xff4c8000 0x2000>;
>> +			clocks = <&cru CLK_MAC0>, <&cru CLK_MAC0_PTP>,
>> +				 <&cru PCLK_MAC0>, <&cru ACLK_MAC0>;
>> +			clock-names = "stmmaceth", "ptp_ref",
>> +				      "pclk_mac", "aclk_mac";
>> +			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "macirq", "eth_wake_irq";
>> +			phy-mode = "rmii";
> 
> Sorry, missed this on the first pass of the patchset.
> 
> phy-mode is generally a board/PCB property, not a SoC property. It
> would only be a SoC property when the SoC cannot do anything other
> than RMII. But given this is snps,dwmac, i expect it can do other phy
> modes.

This SoC only support RMII mode, so I put the phy-mode at SoC level.

Datasheet for this SoC lists following:

  RMII 10/100 Ethernet Controller
  - Support two Ethernet Controllers
  - Supports 10/100-Mbps data transfer rates with the RMII interfaces
  - Supports both full-duplex and half-duplex operation

The Technical Reference Manual also only mention RMII:

  38.2 Block Diagram
  ...
  The MAC only supports the PHY interfaces of reduced MII (RMII).
  ...
  MAC Supports 10/100-Mbps data transfer rates with the RMII interfaces.

Regards,
Jonas

> 
> 	Andrew

