Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0425C233939
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147930; cv=none; b=VEhzCMN06VcCPd8gldh3ITvWLFdEt0jXBnucrwMOQEEZtwzmPmYR94fSUZQ/sHWVA6o7V1klAc5atdk3jEmedX5shrDwAoV83iPjsKxiNXbDxSmgTISsEQxd0vB++j4Kn0MtR/HGXTDAAyKCPEpx17d4R1rQVIx6uRco7hZpBmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147930; c=relaxed/simple;
	bh=lBcbsVywkn8yJS4JUISrUFnUhzKRF3M8Q1Cy14ylPlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZXOnnxkaf1rBmb4AH1FJrp7m98p+cNWAqCn4qebUFwKeg9z9l/itjyP/5HtMns26RZvQeLzN5hORC4UiM/mbgpqKGCmyENMrYX/HFtfXcAPS+ZGtu7F4177j8GUrOf5grCeB/MHG0qdJBgxrGuT6xN4z3OrZfmj/6rfr8VkWF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YW31Fqto; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YW31Fqto"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2695A4E412D6;
	Wed, 19 Aug 2026 13:58:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED2235FF42;
	Wed, 19 Aug 2026 13:58:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8798E11C7573B;
	Wed, 19 Aug 2026 15:58:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787147924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=h0x+PsBO2oGdGI0uTLs5pC1K76Rc89ljaAuHphOM+T4=;
	b=YW31FqtoNx1v0+ylpaV19edkzvCvqtMyy0NX6qF7rA1eVNNXf4YxtjoWleRwbGW5PX2iiw
	GT87LaQdo4z6GgdwsXBObjXyDF0SJaYRFxL60iR6/t06mzkrbCJPIJd+eiixFccG6RJh/7
	asLCK5nLtYvBGdaEJUGYx7rYT6aERChSdREbRkRmxEFaBURZTEW1AtV24fQ6ERe/IIUB6w
	z7luYO2DwXA/u+EIM2ZWT9DAwA7219JYZwdgJIBkYpc8C8fKqLRu8baH/kegnzaXD0qKqM
	spMsm5Yukes/AjOldIeTcg2Rk6DxOgnqlUuOdf2CWpMURMXvoz6f41if2vR+0w==
Message-ID: <ba9f69a4-3ddb-4f64-b031-02c0d2de0f1c@bootlin.com>
Date: Wed, 19 Aug 2026 15:58:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM
 memory region
To: "Rob Herring (Arm)" <robh@kernel.org>, Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Beleswar Padhi <b-padhi@ti.com>,
 Conor Dooley <conor+dt@kernel.org>, Abhash Kumar <a-kumar2@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Thomas Richard <thomas.richard@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260703143717.177362-1-richard.genoud@bootlin.com>
 <20260703143717.177362-2-richard.genoud@bootlin.com>
 <178423118332.1182230.16969278384286286126.robh@kernel.org>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <178423118332.1182230.16969278384286286126.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 16/07/2026 à 21:48, Rob Herring (Arm) a écrit :
> 
> On Fri, 03 Jul 2026 16:37:12 +0200, Richard Genoud (TI) wrote:
>> Declare a carveout memory region to store LPM metadata on Jacinto
>> devices.
>>
>> For Jacinto devices, this memory region is needed for saving ATF context
>> and the certificate information of ATF and OPTEE and DM image. This LPM
>> metadata area is firewalled to be accessed only by TIFS.
>>
>> U-Boot R5 SPL/TIFS will use this area to save and restore:
>> - ATF context
>> - ATF certificate information
>> - OPTEE certificate information
>> - DM image (which has been copied in memory at boot time by U-Boot
>> R5-SPL)
>>
>> At resume, U-Boot R5 SPL is executed and detects that the board is
>> resuming (with a flag set in the PMIC), then it:
>> - brings out of retention the DDR
>> - retrieves the LPM memory region from DTS
>> - authenticates certificates from LPM memory region and applies firewalls
>> - asks TIFS to restore TFA and its own minimal context
>> - starts TFA on remote proc
>> - loads back DM image from memory and jumps to DM
>>
>> https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr
>>
>> NB: This memory region is not part of DM memory (which is not retained
>> at suspend)
>>
>> Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
>> ---
>>   .../bindings/remoteproc/ti,k3-r5f-rproc.yaml   | 18 +++++++++++++++---
>>   1 file changed, 15 insertions(+), 3 deletions(-)
>>
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Seems like sashiko raises a legit issue, but that's a kernel issue and
> not my problem if your board crashes.
Thanks for raising this.

Indeed, Sashiko is right.
Using no-map; doesn't prevent from direct mapping through 
devm_ioremap_resource_wc().

Nishanth: Would it be acceptable for Sitara if we skip 
devm_ioremap_resource_wc() for lpm-metadata?
Or should we use a different name for Jacinto, like
firewalled-lpm-metadata?

Regards,
Richard

> 
> Rob

