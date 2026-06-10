Received: from smtp153-176.sina.com.cn (smtp153-176.sina.com.cn [61.135.153.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D3D3D8906
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781085516; cv=none; b=dTfekXpDq3rCKT8LspPoaFFsdnWuJYJqOwGkX6xc3FTp3qzGImhzKCcszXRTjE27MpbykecMFNIL40pW8xiIlvwe75X9x4iXm5e5Vu0AhJmBqPPqS+Dle5rVXLDqm6gvVFYu2QHhaoxf1G24ERB8NfK9bziuxB+V+5Sli40+S7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781085516; c=relaxed/simple;
	bh=oZRsTOopmsHuuLRo/SvOPe2iEO5p9MRq3KT651K81Ns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=NSMiWK3vZZUvO8FLZNckEA7CBBkQKzX8nTeooVO5N+STjziedRsnhU/SVwv2w3jmK4j5YjNhLmZa0lHTSWvFmaXe/VzJF6Mwb3y6YshN8X7+hQZk8e89hZhTeb+63dl4hUnpltgh5UISf7w1K6iDRybWOlIkt7iNKO9CA0yuilk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A29353E00000515; Wed, 10 Jun 2026 17:58:23 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 6D30F50FCC8345E9ABD23D34604E4AC3
X-SMAIL-UIID: 6D30F50FCC8345E9ABD23D34604E4AC3-20260610-175823
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
Date: Wed, 10 Jun 2026 17:58:20 +0800
Message-Id: <20260610095820.25386-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260609-vociferous-thick-lyrebird-d53eda@quoll>
References: <20260609-vociferous-thick-lyrebird-d53eda@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

> Please organize the patch documenting the ABI (DT bindings)
> before the patch using that ABI.
> See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Thanks for the reminder

> > +  everest,mclk-from-sclk:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Indicates that SCLK is used as the internal clock.
> 
> And what happens with mclk in such case? Is it still wired?

Yes, setting mclk-from-sclk does not affect the MCLK connection.

> > +
> > +  everest,hpfl:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description:
> > +      the HPF value of ADCL.
> 
> Is HPF value in dB? If so, use proper unit suffix and proper units.

No, the values here correspond to the values in the registers.
The value is not in dB

> >          vddd-supply = <&vdd3v3>;
> >          vdda-supply = <&vdd3v3>;
> > +        everest,hpfl = [0a];
> 
> <0xa>? What did you want to say here?

I just wanted to give an example to show how to set the values of everest,hpfl to 0x0a.
