Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793844565;
	b=jIyaYUlBGq4vsZlXTxpPEQd4N5dTX6uCIdvE3NJEOiawTuecJxyX/sE3OmrIUuqgz3M1
	 hyi4gVW9jGpw25oGDQ3FBFMYwbm+O4g9jtfO9njcsW1kWkx5MJ+IM8mSis74HBMFZs0Wr
	 pIsckyW5Ofa5VhYcfX4I693irVumcN0RJEi75lmxsaxyXQk8AjylOOEQhFm6FeAOkE25L
	 C5Pca17Ck9XLwPsL93LZC1uTC+mK0SjvE5RDn8ybEky3tLq7iCRE/cFiNYeFI3xG98WPE
	 ItFOuibVOVvc+seHGhsgjOptmoeVuAEQodjSkr2HLnJ9AWDby09cDmNhs1y5FWZynPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jDAfiOlVrfcIrnBYrikcNDpkrwfsc7W/pzfCEuEFbJk=;
	b=vC08MSctFcf2L/eIGbKFT15QrIEKHSli3FHs/pIM9Rdcr3n9bc1HmP5owvOgn4aszLYS
	 BdcRvQneiOKBmeiPo39PF8oY6aiT+iWzrZkE0ERRjfkM1RykyBiZO8hhxL3JaIRD/MWcF
	 3p6fqMGjZE7NXaBI2gIRMUc7z03XV8Ln+UZt44qQgQgrqMk5NeLQzPxabLpumbgCRSgKc
	 uLiYSb6Lg5qPESkGtSo1Dwnh4OxskUvbbCz4CC2lhgYpmJZXz3NnhE6G4GuNIQyb4P4U/
	 7ifprnP7qONWiA/XxwaLju/GeV+sa7F+C6Cp9bYiD5RlTywoNViArz2jba0h7tJCLcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bQKdoPaY;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9ED606A32E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 02:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C9ED606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bQKdoPaY
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-833e671ee9fso1369766a34.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 18:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793844564; x=1794449364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDAfiOlVrfcIrnBYrikcNDpkrwfsc7W/pzfCEuEFbJk=;
        b=bQKdoPaYIBZlncDH+3xR78NU4SZUy1UNzYe4/3iE/eTtE3fc1boBVnfn1qAh43yNoS
         Yv5rHw9B+zMsENMqNuSO21592z1vYg7F1Vb1HUPUBdPXtD9BbCv+q2xYF/6n43abhPLo
         P28bN+i/ukbP2L97wRtjJUFA2G0hg8hcmztmrqIfwwPIm1DkyKgR834K4zCUMjXKhssv
         TFNluPBDfBn1byhqxr1I546yDOtxyARPVZcWaXqv3T7oHOf591/5YXxH8guy8TAXg0pt
         z3lGong9nI1CVZqT9ZnY7VtfMLaXAJeWRqjP0GKbqsphQ7oy+C6eiupBdbyjtT9Qatro
         W/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793844564; x=1794449364;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDAfiOlVrfcIrnBYrikcNDpkrwfsc7W/pzfCEuEFbJk=;
        b=sHVSJVl/J6oCRtyjvXe1jYGJtBTxXIRG/+CTgMrjzCoMO+njl3Fuxn14tLDdZmx5go
         mrBO03DEZzftn2ZOZtl/fRJBGDXVdZ1kup8Q35Ogbh6MZZ416TlfUi4OUsGjJ1Em2Dsw
         9OyrEyx8GZUF4X8Ztcg3el23TGMH4Y1pMvjC7JDLYaWL9PT8aY8Teg76wzr9hbzTiVXa
         sf2sa0f6v5Ouqf45AKSp3G2T0ehzYPqNdZ2AJ3/Am8estdWv/11D6VGFRrqlwKv/f6B6
         eXVnIjALeVHiMWr4Rqhp7ZxOXS2oyRDjCwr+DWWNcZuV7v1cxRZEI89hWVYqMAgCczsc
         NwTA==
X-Forwarded-Encrypted: i=1; AKwUvBx3qYkwHnGcjrPPqY+6gX5xSyQGWYyBnZzUmTII/+gQTCG9NolIyJ29oHOubV34Vliyf39w8C1VV2yD@vger.kernel.org
X-Gm-Message-State: APuU4Z8bEJrY9MumpT/PAYQkCTtLgF9djnQmFeQzylBpICkc1pUcM361
	8+RxReeceEQE0AxBpQTMNrE3L1w40TUh5m50wk1RT7fEr1IRxh2ddbOw8WF6oP8M980=
X-Gm-Gg: AYBFou0Jo+L2uGxhDrAuHH3jJganL1pkKFXbOpEsuabVz2b5K3ULtuGLxVNBCy6gpjw
	qexkaE8XBdET+egpWgVNYkFBxD0EB5CigSFUc2ZepV7heO5DaK9TsUhx8ti2yGsmjpKFXJZd+ZB
	VyK2K03mx8m4ZmFaeXabR4hXMttRmO7fN6ptvxHFDq1V6NiGeeMclmGXYDnodx6v2CtJbiiiYQe
	PUh/UsqVjXfMpZLycsGq7H+wxJKr7qSto4OLcd062zleBY7rewyPg7odVO+qNJA3pSfxOHuYf+o
	YJ6i7qwVonT1o87BfJ2BETEktyG3SYR1JOddPXhMHTdV5Vumys93AkYF8vrBuBTr2y7eynBgwLx
	/D8zSGbNNQO7eZltNAi1bh+2H6H0s5OiKYklxNq+/uRwoFR46tnjvGoQbTM8XLeP69jXZCu8cAr
	S4JC2zj35B+369GrBGIamI7tpYhokysfDpPgKMdnJ13chw2wnBggZf98VI5cytpJrrZtWgfubqj
	0+/reGxJUSUhWSKrHV8hrEZS0JU/IRg1MSQL1zvVQZq3dVMl7wutjslivnA356n2VEpUtJM2FYN
	9acmiG/GubwZiaRXeHH4YNEXcZRLpw==
X-Received: by 2002:a05:6808:11cb:b0:55b:f88d:6ebb with SMTP id 5614622812f47-5640df0a2eemr12633362b6e.54.1793844563998;
        Wed, 04 Nov 2026 18:09:23 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm3235689b6e.11.2026.11.04.18.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 18:09:23 -0800 (PST)
Message-ID: <8feef6c7-df8a-468f-863a-fb2f83c5e478@riscstar.com>
Date: Wed, 4 Nov 2026 20:09:21 -0600
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
Subject: Re: [PATCH 1/4] dt-bindings: soc: introduce
 toshiba,tc9564-config-syscon.yaml
To: Conor Dooley <conor@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-2-elder@riscstar.com>
 <20261105-irregular-awaken-b329b9c37e70@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261105-irregular-awaken-b329b9c37e70@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 6:28 PM, Conor Dooley wrote:
> Actually, can you mention the other features that this provides - the
> service it provides to the mac, for example.

Yes I will add that in the next version of the series.
Thank you.

					-Alex
