Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C32E7378;
	Mon, 29 Jun 2026 08:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723056; cv=none; b=WjV+m6mPWG8HBSkLKfAZK7H+IjHX43XMn28xQIU18yBN5UyAA3BxeqFXcNDGmRZ98XjDa5Y3v2Dab6fTcCfW4IMj15s/sJ+Oe6lzgXSZsapIYIg1UoqABLLOUpr/pATGL/p1vZhelloUXHjBkmgrqrDG6gW9eFVvWcTetDAqo0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723056; c=relaxed/simple;
	bh=sHGQep7ELFkSFXFgF6ohC/kAmip8vIV1u9toDMPmMJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HyDFR2NE7Ql9j8rM+o9MUODeDtgAofdDMwyZzT/+mFxivzw3KXdy24X14xCEFaUFDSRgJFN4ar6A2zExnGfDN/yGhmxPuCAsmWRPJWDUlgivrQ82MRJb99vci5XFUDI4r0KLU1G/947Vqxq1mOGfE65k4sJqwHguUTCtx+2Gyr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ldeuzNsm; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ldeuzNsm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1782723024; x=1783327824; i=markus.elfring@web.de;
	bh=sHGQep7ELFkSFXFgF6ohC/kAmip8vIV1u9toDMPmMJE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ldeuzNsmfhBUhmva3E0muXGSutoI+R/Mmp28MGepfGPYAkEz4zBUtUBfaylpz4l8
	 xYZB58FNM1tFVxvW0Hr4WkkoUJ3z+sNn9rk6sziVwAfJdmIiM45RSgCNvYBLJzf+b
	 ZVXmc8vo97GZODm6qDpLs6vwJ1nl6XJbPSpAxgeVGb7OdS+HPt4bAnh5TX06U9u00
	 PsWkOJ/dPkxVLvZoKbLQtWF0eRHm/49PXLZMDqObHEkAK5Uaod6RmGuguJjd3EE0O
	 ZvU+MhjBgdxhETuWM2qqGejaQbP+a04hl3WHtRpDzzBnkZRp3YYn/qNQIckU0Pmmv
	 UDhcaZlE9ZRGaJUFXw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M6pYY-1wlGpi13PC-001Y3E; Mon, 29
 Jun 2026 10:50:24 +0200
Message-ID: <1df6b921-368e-461a-af01-d453a3898cf7@web.de>
Date: Mon, 29 Jun 2026 10:50:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [5/7] soc: aspeed: Add eSPI flash channel support
To: YH Chung <yh_chung@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Maciej Lawniczak <maciej.lawniczak@intel.com>
References: <20260313-upstream_espi-v1-5-9504428e1f43@aspeedtech.com>
 <3ab543eb-ca09-4d75-b75c-b8a4c71b2173@web.de>
 <KL1PR0601MB4276C2C831B257898AAB363190E82@KL1PR0601MB4276.apcprd06.prod.outlook.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <KL1PR0601MB4276C2C831B257898AAB363190E82@KL1PR0601MB4276.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O7xlh/3cxMfm7JNJN+7muJKOH6hzFljVBaT95Mv64SGWo4IBCry
 6Pelh3l7niIZMbDAhodQycE8UDxZQgZV6c/NInikprdJ/8l1XiMDWna1P/ciwRLQUucrHnM
 iLj5kBNXTSJ0+eQKr5n9s9ta6oKU1sc8132tRNmwgfPt/CsBMwLUqS7EUhYi22lg1JedLvl
 8DiovMciqBwkQFYpgE9uw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hjMsPVnDpog=;kr4pKmKoaXqa16mtm0ViftF3HDN
 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
 fguhVIrL7iXPGxC5M9PgoSgZiZc=

=E2=80=A6
>>> +++ b/drivers/soc/aspeed/espi/aspeed-espi.c
>> =E2=80=A6
>>> +static void aspeed_espi_flash_rx_work(struct work_struct *work) {
=E2=80=A6
> Thanks for the suggestion. I agree that guard(mutex) is helpful when a l=
ocked
> section has multiple exit paths. Since this worker currently has a singl=
e
> simple path, I would prefer to keep the explicit mutex_lock()/mutex_unlo=
ck()
> pair for readability. I can switch to guard(mutex) if you think it would=
 be
> better in this case.
I hope that development interests can increase more also for the applicati=
on of
scope-based resource management.

Regards,
Markus
