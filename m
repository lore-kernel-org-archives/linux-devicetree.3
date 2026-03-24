Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198EB390999
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340028; cv=none; b=HtoWRRVBguC1fo9DvnvVBik0PZiRenwDy6XQn76z4c+58Ojo3S/67CxcvSTOtoM83rMy2uOegm4ZTDny7nGzcn7e/H/c8dJ2rid2sVv53+6bUusyIPr/pEDA4J6MvdXGFWLwJa3X2BXXQbfRfPPkgKCrEMwugpLSjrfkDihsDhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340028; c=relaxed/simple;
	bh=iNaf9eBN6ctYm3Zb4iv7+Xg3CD88VXO0Qx3TRMXdTrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxEsW2EHbEx0ChvYC0z2Z4IERMRHhlsMLyJY6MJo7kqkJduZUntJQcmUgRHS1+cv59/wr1StNGxfEdVTTtrqVYeGrrVIAi/9R+Z4tolKmNGsV8swFwDPRRj7gfmG+40Na2AQpNNbOF2D9UnVowBcfcXbAZtRZA7gofNAavmnw/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KbjwEFuV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tLRjGBKs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KbjwEFuV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tLRjGBKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774340018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ts8QTgurhQrOhcbvZk0taNObr5EoxTyEYtshId05lwo=;
	b=KbjwEFuVqe+3MSvIDCuLMhDqswHy2DIsgTubivBIaRVDEBaUQAmMjkFXdGpnS69UpKF3Ba
	MVynQPG82zle71D8Safc6Qg9HZnn48J89Hut2VQBs8nHCWRI3kqj0CkESEJRkDIHHtQ2mr
	I7G47z7wCmeJJvWK9Ec+vAqUpyIIWvo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-SBMIwDewMmWXjbkqCkd1eA-1; Tue, 24 Mar 2026 04:13:37 -0400
X-MC-Unique: SBMIwDewMmWXjbkqCkd1eA-1
X-Mimecast-MFC-AGG-ID: SBMIwDewMmWXjbkqCkd1eA_1774340016
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43b3c9568a3so3871381f8f.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774340016; x=1774944816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ts8QTgurhQrOhcbvZk0taNObr5EoxTyEYtshId05lwo=;
        b=tLRjGBKsWx2v3MkqFof6mhkeG72MBCIalqseUCWx+26IeUgmwOx483p21Vv7uTmGPk
         8Dn6GtmSnjS4K9yS0XgDPU1ezNssjfT3HKMI68OCBHuVEhWi8YgHraQXnBWz2LVpE2RR
         6MvG7IUHSxFglOcL1y9spYDIp8oDSS2ndlG9sCJPzmeFDbOyE1tNSb2HIhLrq6p1BGjL
         f8FrPrFsYXFc8Iv6Ykc/27hS5nC46VG9w1IFBiUfewv/i1qpIoqtmqY8YpLfGUIT8d9I
         1edNVHIpev48Um5iBxRsQ9b7Z5sZW51jfufsAVmS5U4zqndPB4iPUgOm8KqqkEZA5Yy4
         CtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774340016; x=1774944816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ts8QTgurhQrOhcbvZk0taNObr5EoxTyEYtshId05lwo=;
        b=dwYMML1kuGSXN7Qpog43neYcCnaaRudPB5en2L9Qrk/XjAT14CsPwGwd/0gmt1E2Ac
         Y2C4jXIGd6Hv8VsV0C6UP1hmUUGShRVeq9h98cpmoy8iwjqglzPCSvJjrCBDZwLF9Ttp
         5Ee1S/eRTGXX6NBSocgSeb8RkOpOhXAA7ESvUiaO040PhKWiO9KMTdUTXgUpmP6V2gfv
         4DKRFgWSKmihkUE3TK3RqYBr6z2aBelh40yhvp+xx5yHEhKd/dw5+WckYVyk4Guh+/0X
         S6nAsdsyIjt4OlwvRq3pXZ2HkgSgMrJdq2RnRX7rbU2g02s6Jv9vuAGs/mAZLXDy3hG8
         2iKg==
X-Forwarded-Encrypted: i=1; AJvYcCWk1yqeoGpzCRq/Ob/tFOVyvMfywshCJc5p6F3PhEARJWPG1OyS8p8LKNNHbk2lNDQjx3VbAP8Zyf+Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6U+makgLkSVNDAGCUU8lHPz69fKaUKqsGlPhdn+WzaW7iggq8
	61UI06NSfsBp90N3p8lpZO9JnahwYcm2wIBKk6LW99L2dEK4rTsKK4py2oOdNAiWu6pRdz4TuY/
	fck5J302wa+Ezc6O7yr+nJvT6We3I79b5LR6Mu7f9Lwv8Guh22h6mVexKwt7RfsU=
X-Gm-Gg: ATEYQzwPsa0o0xKWz5t2RXYirFPB7/2JE55WThtEFQoZ4Uf1sY37rnthj0dnXjZPag3
	6ykubCep9S69CQSkYkbisO7yZuILydWOwGQQq3rfSc9jEQR1x0js8kEa3H7KBlW6hO4v9+4mfsi
	8QaKnOG+zLEx128JYWjOnZEDmhXzkwJJsiORZKbTOdDnUbUc4Cpo1jE4GsumAfix+klcdOEBb+b
	t2EDas++WO6Lx4RYH9VQbfnfMFHx3iH1iTY15GkyBBwF1CRClTzrSmlFNho+Gy+/4VA6kZXq/3d
	xHSlL53Ag7FTabbTyiGbfetvE02MI/opOwQM+9slrqjqeR3bLYDlIkMJp2DH2CvmAC0K4vgXzCL
	4QAU08N6JPuUZdZPqoYxsUTxG+pxRNP0gnp9rwBwrNdKLNzZ5sL1CDIpk
X-Received: by 2002:a05:6000:4382:b0:43b:3e40:222d with SMTP id ffacd0b85a97d-43b64244451mr22895160f8f.19.1774340015876;
        Tue, 24 Mar 2026 01:13:35 -0700 (PDT)
X-Received: by 2002:a05:6000:4382:b0:43b:3e40:222d with SMTP id ffacd0b85a97d-43b64244451mr22895104f8f.19.1774340015382;
        Tue, 24 Mar 2026 01:13:35 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae048sm35875560f8f.1.2026.03.24.01.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 01:13:34 -0700 (PDT)
Message-ID: <c4e3c49e-ecc0-4702-9d2c-88ff420c4647@redhat.com>
Date: Tue, 24 Mar 2026 09:13:32 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 11/14] net: dsa: netc: add phylink MAC
 operations
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 f.fainelli@gmail.com, frank.li@nxp.com, chleroy@kernel.org,
 horms@kernel.org, andrew@lunn.ch, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, Wei Fang <wei.fang@nxp.com>
References: <20260323060752.1157031-1-wei.fang@nxp.com>
 <20260323060752.1157031-12-wei.fang@nxp.com>
 <acEIQqI-_oyCym8O@shell.armlinux.org.uk>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <acEIQqI-_oyCym8O@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/23/26 10:30 AM, Russell King (Oracle) wrote:
> On Mon, Mar 23, 2026 at 02:07:49PM +0800, Wei Fang wrote:
>> +static void netc_port_set_mac_mode(struct netc_port *np,
>> +				   unsigned int mode,
>> +				   phy_interface_t phy_mode)
>> +{
>> +	u32 mask = PM_IF_MODE_IFMODE | PM_IF_MODE_REVMII | PM_IF_MODE_ENA;
>> +	u32 val = 0;
>> +
>> +	switch (phy_mode) {
>> +	case PHY_INTERFACE_MODE_RGMII:
>> +	case PHY_INTERFACE_MODE_RGMII_ID:
>> +	case PHY_INTERFACE_MODE_RGMII_RXID:
>> +	case PHY_INTERFACE_MODE_RGMII_TXID:
>> +		val |= IFMODE_RGMII;
>> +		/* Enable auto-negotiation for the MAC if its
>> +		 * RGMII interface supports In-Band status.
>> +		 */
>> +		if (phylink_autoneg_inband(mode))
>> +			val |= PM_IF_MODE_ENA;
> 
> I would prefer newer drivers not to use phylink_autoneg_inband()
> anymore. Note that there is no need to support RGMII inband in the
> kernel (nor is there any proper support without a "phylink_pcs"
> being present to provide the inband status.)
Would you mind sharing a patch adding a comment nearby
phylink_autoneg_inband(), explaining the above for future memory?

Thanks,

Paolo

