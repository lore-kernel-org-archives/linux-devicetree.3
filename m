Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5DC3D8126;
	Tue, 21 Apr 2026 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781086; cv=none; b=RtHCwmDlfgAzycR4s/gOxeT0Jxrt+n2Ruj0UeMKAIuR/uY4vAMn1KT9Ys+hNCDaW/NTJcHJ2esWOb8NOrNWW3ri6TyfM1pkEdZHMA1b67/gf9kB3pE0+7mGF+vvQWZhCDNi1e4KCEcdt7sPNQiZ5H0mC7B/RcUASFXLPnxNWy0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781086; c=relaxed/simple;
	bh=7wHerouNRDT13GEUBPlcd+QdullpGSqh9tq21Gx3Yjg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XkQywC/TnM7Xd6xFSPP5vEHMqUrb9fb68f8DtzxAFPUibGnK1whkbsVOgEq/ZejjE4ZL4iGEaDXbX/00U8EYhckIUJOZNpfYANn8vVYqzHpRtBHHrIT+Hs0LeHpjd/bh4rEEavZORQRU073JnYS6QkgRz5s64Jlrt8y4YEkBxb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=KdkD3pOX; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="KdkD3pOX"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8D5C226F48;
	Tue, 21 Apr 2026 16:17:55 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBTX5QfCKiok; Tue, 21 Apr 2026 16:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776781074; bh=7wHerouNRDT13GEUBPlcd+QdullpGSqh9tq21Gx3Yjg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KdkD3pOXadIz+zRR3DXjldDcVh2XXzOZJ7AccQvgLf3oc/ieiahgq7pUD/RTs9w4n
	 XoOfppvPSAll0r/z6LybGZ4yHjPRBfSBLvAXsTo3XB7tV/UyaNymkFpZEEsRFqkaUK
	 i21Qzwbph9Jkw43z0vj+bQ+vxARMQI8ctEGtlkZpcxL6lA/64xHSQN1aNsAtv0GQ5c
	 GL+OzZatkpnNU4DrdHiYb1b+YhXApjdRBp7T74i8iWMCGQ7viVJI6BvJ2uAm0dv8oB
	 OkqMJtIU63VdwjvXhHeiM/5r0GiZo0uJUdS3cpl4HU84nMtZ8ZEyxgbwfRHEUR2rzm
	 xxOYF13onj63g==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 21 Apr 2026 14:17:54 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stanley
 Chang <stanley_chang@realtek.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/6] phy: realtek: usb2: support for RTL9607C USB2 PHY
In-Reply-To: <20260421-courageous-rigorous-angelfish-97a51f@quoll>
References: <20260420191941.81834-1-adilov@disroot.org>
 <20260421-courageous-rigorous-angelfish-97a51f@quoll>
Message-ID: <e4cc95ffd984ee66f2c732904b524411@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-04-21 07:09, Krzysztof Kozlowski wrote:
> On Tue, Apr 21, 2026 at 12:19:35AM +0500, Rustam Adilov wrote:
>> This patch series for Realtek USB2 PHY driver adds support for RTL9607C
>> USB2 PHY.
>> 
>> RTL9607C is a big endian MIPS CPU which is quite far from RTD series SoCs
>> supported by realtek usb2 phy driver, but the phy initilization is found
>> to be very indentical in most areas.
>> 
>> Most of the code was based on the Realtek's usb driver from the GPL tarball
>> in [1] and adjusted to fit into the realtek usb2 phy driver code format.
>> 
>> The patch series was split into smaller patches that add/change something
>> in the driver that are not exactly related to RTL9607C and that also
>> helps for easier review. That also means, patch 5 depends on all the prior
>> patches that come before it.
>> 
>> USB2 PHY on RTL9607C is primarly used for its internal OHCI/EHCI controllers.
>> 
>> [1] - https://github.com/jameywine/GPL-for-GP3000/blob/main/linux-5.10.x/arch/mips/rtl9607c/usb.c
>> 
>> ---
>> Changelog in v5:
>> Mostly addressing LLM review
>> - Patch 1
>>  - changed int to u32 type for new_reg_req and vstatus_busy data fields.
>>  - changed comments in rtk_phy_read/write from PHY_NEW_REG_REQ to phy_reg->new_reg_req.
>> - Patch 2
>>  - explained readl/writel native endianess issue in more detail.
>>  - explained why vstatus register doesn't need byte swapping.
>> - Patch 4
>>  - moved reset_control_deassert to rtk_phy_init function to keep it outside of for loop.
>>  - changed msleep(5) to usleep_range(5000, 6000).
>>  - explained why reset_control_assert is not needed.
>> - Patch 5
>>  - explained readl/writel native endianess issue here as well.
>>  - explained why FORCE_DISCONNECT_REG doesn't need byte swapping.
>> - Link to v4: https://lore.kernel.org/linux-phy/20260406181228.25892-1-adilov@disroot.org/
>> 
>> Changelog in v4:
>> - Patch 2
>>  - moved the le variations of read/write functions to Patch 5 where it is actually used because
>>    otherwise, it results in unused errors when only Patch 2 is applied.
>>  - updated the commit message to to point the reason for le32 wrappers around readl/writel.
>> - Patch 3
>>  - added "Reviewed by Krzysztof Kozlowski"
> 
> Where?

Oi, it must have been lost in transmission because i added the tag manually to .patch after
format-patch command instead of adding it to commit message. So it disappeared in v5.

Sorry about that. Unintentional blunder on my part.

> Best regards,
> Krzysztof

Thanks,
Rustam
