Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793929844;
	b=PQN7a+o0spOK3kONlv5CbC8MHwroFuanl0ZzUlnwQcy2aR9tEa0JBHSHvUk9uk5kOenS
	 aj4lTJk7x51W6QxKBDStKonJkWIcdF0t0K1eIjSg4gBjRmggsn/w/xQT3IPzpl672/FAh
	 V/ZDUH6sUeH0t/dbyUyJburNkHiZ0LBXebsvZb2PEqjC7+n0RzxkcDJ6QUJpNblfY8UhX
	 Fa9rvNJWXMLlcbzpFiFASTEgkzxXeJsGiVO4vHj77UKqKW6rTLeTgMl36YwiCjcyJsOS6
	 alau+rKA0s/v8D+cm5F3TvE7CohvOyJJgYY1M/nzqS8ZyFOmIp9ZmTTvb6/60xaRA9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793929844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bMCFjChOWXQl08hcopau30f+4A1VG5iv+0pA9BSCQ9s=;
	b=bhI3UAXagJayr0wfcpF5gB/jEeSPLCNnyHhGuIvuh4qYp+DDrFkrC2w8CICPUiF7SLcr
	 J4lBzW8p1iGk6JZ7jZOBncBw/69lEBvmHhl07pN+fIBfvNwAh3cOS0R5NzZ7z3AaXdxxk
	 M9451MCuNDZXMvNNkhTntbqNd/R58GCRy92PwtyWabQMuDBqWFaEAumztXqzcR533LGI8
	 fZSFlR6cc31OOFDPurw+3lf0KpzYWxw3m1zWKpGMJaW8OFX83hZCsZ/o0D/gFP3rLRG48
	 hkdgmp4MxE1+mwajQHZ5+TW4nRlEHQQyFfX4tLHGaB/imqVsFWobGXHSB6Tp1HacCmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=iFiGgm81;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554F5606EE89
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 01:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 554F5606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=iFiGgm81
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-475920b9ca2so21994fac.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 17:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793929842; x=1794534642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMCFjChOWXQl08hcopau30f+4A1VG5iv+0pA9BSCQ9s=;
        b=iFiGgm81vaMCUIvQp0P8W9hQsBzQpyVVeiayZlgE/yRrYx/diZVQpRy1S9MtZcstGs
         8f8rbNhbmL3dxI4BO/m7AJJWAWPOZM/zw3cEaKG15fv6idU0I2+vL1Z+ABuuGVyupR29
         gISnEyCTgBHbx8tTUlHBk5hoPStY8wxRfpRDjCEM2DYtE/GMWby7rrDhGMPx+5KAHwTq
         Uzp3v+Xi6/NyKJAnomo7Bn4clGD/ic8gu7k8WLodKyfOZVPZJMfr3AzauPlot/tjoby2
         X3Vb1fN+YLnRKHduGJSyimAcYJ7VWXa80+rsqkNbO4n1awfE3zoS6tndR0kUg4V5LplX
         Yz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793929842; x=1794534642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMCFjChOWXQl08hcopau30f+4A1VG5iv+0pA9BSCQ9s=;
        b=i28kCmNNluPqqEtKejsMTbqouP+2/KJYL5ofanPE5wR1X3JUrPTuHYdIcTyf+H2quC
         KNFi68kws3iN0+r72uwzBCcxyTDFqZX57HZbx0dm/DfMIIluRonK3yYHGJ5+ouki0KuF
         B1j2Ctkv9Lt4gOysTPO8WauPeRQWxk1pbxNE5ZnJoSdcFw/leJOjcsmbfAixaZDeFCiA
         fqM+h6dU7gMqhAQZu7wTdMWmYHa5pgt4/bRakp+QLMqj/UfTl95EQiE9oHszQ9slYlZQ
         TNrBsIGB26J4f/XYb4NeVs85axFfq7gQ477V/DUs66q2Xg+qalX5Fh5eTI34vaHWb8cU
         xKxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfKoqGhsf9VWBu7+AFFTQLkk90ozzu4OpN4Yah0L0RhhjRdmQbztIeu61rUCpl/l/W10EfHaBXBBmp@vger.kernel.org
X-Gm-Message-State: APuU4Z8XaXpaAklWT+fCjwaCJMBJfr2CmbhYin9UxjnkXZdAn15x1aN+
	jGhnaeuy94IQBIww/0n+EBHAyydb9XKNqPaRNVJSsEOWfpeY9LXyd6gTtqGgAOSxlbA=
X-Gm-Gg: AYBFou12UjNiCnx6hzWKAnxrM4xXcbZP3h0Iztq24+rk15kQS29RItHiJOvrnxvW+/1
	E6jPUJKrwuPRkbbgwSlTqgHC8l7K9wovwz6r8ir9qFnL3ODqTKh3nzNS2hPszwnazJlbtSnxIOp
	kPB5TifpbhthBSObVrSkJKylqTpD9M1La+KnY04Ll87lDUDybtczTnJB+obg6mtTl8vIy/nbKZ6
	lQFhVw5Kyf6d/Z+CaHlZikJR8deprOmfkDhuOW493p6ViUY8rDTDrZderIZ6zJzu7LsJunJF2wd
	YcXcbzE8gd9dQwu4zoC8YeIT8LVDE9DlM4i6hYJxa4oduJ/Rqu2OfT3IGzvM0K8RElTOMq/SQSz
	0yxEPtv9hvWJ3J/7GLtzgvHOQG2BPk4IfljmqTb8CqJHtPv8c4Th72n4tAazQ6Z7yiuv4YumcMb
	wp7Pd9zYRbY+e5okvEOHlP5Wt5MXR0dpo9eEi4YKkdXTqMPrl1GLnHV41cl5mKOo1TyFX1xZJdX
	eSMbHygTXf2TjN+pzINKb8DfV6JSHLhL92k6PAA/2Dk15yRkq4rxAFvxEK7wN/O5ZbWyggkRfU9
	UOzcovLKPQUMxYUl68P4RSl0+vec
X-Received: by 2002:a05:6870:a0ab:b0:4ad:8800:b277 with SMTP id 586e51a60fabf-4ad98b4feb2mr759024fac.24.1793929842253;
        Thu, 05 Nov 2026 17:50:42 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ad97887090sm817691fac.6.2026.11.05.17.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 17:50:41 -0800 (PST)
Message-ID: <bbeb0df0-10ce-4f8c-8b2b-07437d959b3b@riscstar.com>
Date: Thu, 5 Nov 2026 19:50:40 -0600
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
Subject: Re: [PATCH 0/4] soc: toshiba: tc9564: config system controller
To: Krzysztof Kozlowski <krzk@kernel.org>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, p.zabel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <a724d159-1509-4649-afa7-a2669d37b4f6@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <a724d159-1509-4649-afa7-a2669d37b4f6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 2:26 PM, Krzysztof Kozlowski wrote:
> On 04/11/2026 01:43, Alex Elder wrote:
>> This series is comprised of some code that was previously sent
>> separately.  It now incorporates a new system controller driver
>> that advertises clock and reset functionality, as well as regmap
>> access to its address range.  This combination is being treated
>> as a new series.  (Details of previous versions are below.)
>>
>> The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
>> It includes a PCIe switch with three downstream ports.  To one of
>> these ports an embedded PCIe endpoint is attached, and that implements
>> two PCI functions.  BAR 4 for both PCI functions provides access to
>> registers controlling blocks within the SoC.
>>
>> The system controller driver adds the clock and reset devices
>> using the mfd_add_devices() interface.  The clocks and resets
>> are implemented by drivers included in this series.
> 
> Toshiba TC9564 bindings and DTS should be posted completely. We spent
> great amount of time on discussing already and I pointed more than once
> that big picture is missing.
> 
> You are not describing here parts of a SoC.
> 
> You are describing one, single device how the host sees it and DT
> maintainers (and writing bindings) ask for complete picture in such cases.
> 
> Best regards,
> Krzysztof

https://github.com/riscstar/linux/blob/tc9564-dts/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts

