Received: from r3-55.sinamail.sina.com.cn (r3-55.sinamail.sina.com.cn [202.108.3.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727BC2857EE
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503684; cv=none; b=OgXhlhCsosiJFi8DZO8iT7eeJC2EGkmId7QS8I6GYQkQPOXbnpTryWxKvsFUeYwMAmVOcjRifzUGt3Daxro36Mf6toEAM8zxNX42Cr7goE5L+xaw/XtW+COfqiRocFt126TyXNYBXBcqPlZRlZptSbgVcdYPGB3BKo88s1iyGpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503684; c=relaxed/simple;
	bh=AUdimFTexxZwClYm/z6jwEfeqBrojqxOhlxN5l/yYBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=NB8wmfe1DGxbfBlFZtNi8heKDkm1koHCUdHqgs2ngI/qbZtktzHTJxrZ9ZoRpSEAIvDWgPlQ1xQK/s+vqXro7TMjJu4Ibm/J7rUvuS1PuIDAL6v1QQMIqTEOJmoOnvmmmEBcKGugT5Qo0Nwaedtaw2KIFJFyX0E81iWvoDJj49U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2F96B200002371; Mon, 15 Jun 2026 14:07:47 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 060A3B3A33EE4A8FBA7316C5896DBAAD
X-SMAIL-UIID: 060A3B3A33EE4A8FBA7316C5896DBAAD-20260615-140747
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
Date: Mon, 15 Jun 2026 14:07:44 +0800
Message-Id: <20260615060744.18775-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <fa710884-e66e-4ef8-bbbd-034eeef8ee62@kernel.org>
References: <fa710884-e66e-4ef8-bbbd-034eeef8ee62@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

> >>> +    $ref: /schemas/types.yaml#/definitions/flag
> >>> +    description:
> >>> +      Indicates that SCLK is used as the internal clock.
> >>
> >> And what happens with mclk in such case? Is it still wired?
> > 
> > Yes, setting mclk-from-sclk does not affect the MCLK connection.
> 
> I am asking about wiring of the device. If MCLK is used from SCLK, but
> SCLK is used as the internal clock, then how can you still have MCLK
> connected?

If MCLK is derived from SCLK, whether the 'MCLK' pin on the device is
connected or not has no effect on operation.

> >>> +
> >>> +  everest,hpfl:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint8
> >>> +    description:
> >>> +      the HPF value of ADCL.
> >>
> >> Is HPF value in dB? If so, use proper unit suffix and proper units.
> > 
> > No, the values here correspond to the values in the registers.
> > The value is not in dB
> 
> What are the meanings of the register values?

The value of everest,hpfl is equal to the value of the corresponding register,
not the cutoff frequency of the HPF.
The code does not specify which register corresponds to which HPF cutoff frequency.
And we did not set the HPF to kcontrol because we do not want users to be able to control it
while the codec is running.

> >>> +        everest,hpfl = [0a];
> >>
> >> <0xa>? What did you want to say here?
> > 
> > I just wanted to give an example to show how to set the values of everest,hpfl to 0x0a.
> 
> So use syntax I asked.

OK

If you receive this email, please reply to me.
(I'm worried that the issue with not receiving emails might happen again.)
