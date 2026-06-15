Received: from r3-71.sinamail.sina.com.cn (r3-71.sinamail.sina.com.cn [202.108.3.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAFD3DA7F5
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781518481; cv=none; b=gWzqiMPs46I4kVfx+y9NR35o2iPuSkaN29jD6rux+Y112S6Jor/OdlhCkNsX2KhOv+Zp0p9M77NTJtN+InlmnX5HF+G0whTDykf6wRkZ6h1nKSNA1jJAEhWDdd74XBEGNOtgnvhtIkp1rXZfKn5nOppPQ7qnHR4LThSJ8BUOEE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781518481; c=relaxed/simple;
	bh=9NGg8hDxj2vdLvxEygzDIHhkUl++kdXXyURUQkJD64k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=WxIewtdsl4U43/bzZLUCL3Mw4vFupKOGkA9gcCaJEX6/Vy9SsDMi2mUMqhTNpnMmTxiY9Z8v2IYBJajWW2roQP9JNDw7dXBn7AUqNRL/oxENJnNxNVDrby65KbCCCiHPa4w8XDO+TnNQIEdvmJwztth30v1LyVvzJ7p6DvLKbc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6A2FD08000007C99; Mon, 15 Jun 2026 18:14:25 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 889CB02C459244E5BEE42764EBC27718
X-SMAIL-UIID: 889CB02C459244E5BEE42764EBC27718-20260615-181425
From: Zhang Yi <zhangyi@everest-semi.com>
To: krzk@kernel.org
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tiwai@suse.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH 7/7] ASoC: dt-bindings: ES8389: Add members about HPF and clock
Date: Mon, 15 Jun 2026 18:14:23 +0800
Message-Id: <20260615101423.19781-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <241d0fab-26ea-4c06-9928-e256f2cc5d1c@kernel.org>
References: <241d0fab-26ea-4c06-9928-e256f2cc5d1c@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

> >>> Yes, setting mclk-from-sclk does not affect the MCLK connection.
> >>
> >> I am asking about wiring of the device. If MCLK is used from SCLK, but
> >> SCLK is used as the internal clock, then how can you still have MCLK
> >> connected?
> > 
> > If MCLK is derived from SCLK, whether the 'MCLK' pin on the device is
> > connected or not has no effect on operation.
> 
> If MCLK is connected, why would you derive it from SCLK? That's the
> point - your clocks property already might be telling everything needed
> here.

This is because sometimes the codec does not work properly
when using the MCLK provided by the CPU.

> >>>>> +
> >>>>> +  everest,hpfl:
> >>>>> +    $ref: /schemas/types.yaml#/definitions/uint8
> >>>>> +    description:
> >>>>> +      the HPF value of ADCL.
> >>>>
> >>>> Is HPF value in dB? If so, use proper unit suffix and proper units.
> >>>
> >>> No, the values here correspond to the values in the registers.
> >>> The value is not in dB
> >>
> >> What are the meanings of the register values?
> > 
> > The value of everest,hpfl is equal to the value of the corresponding register,
> > not the cutoff frequency of the HPF.
> 
> You keep avoiding answers.
> 
> I don't want you to encode standard units as register values.

I think I understand what you mean.
Do you want me to enter the physical values in DTS and then convert them to register values in the code?
