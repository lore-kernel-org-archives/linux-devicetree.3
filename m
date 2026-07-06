Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C9C29AB05
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340555; cv=none; b=U3G/smfOUJPQfh5boeXtAjEr+N0OMCwLaXJmU62AGQWtpCFqu+RrO3iNl3x/mvzxRi4PrRlxWX5t/jyp652y3/4r0GWdgPilQgnOccmgtVy5B5Ll7NjLjDdXBmF+zM175IWPC5L3P9cn71zUo89frV+O/Kr4RCUgYbIILghYK/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340555; c=relaxed/simple;
	bh=9puO4WzhuQqvAPvccPQod0OtAEMgHit/NnWCitCv3nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hh+Is/rBOlX7BCbhPm7YtLE1rvZRUHrKwQJ1tooKbf9paPtMU5ta1lf/8oAq6Ao3g7lzkPWRbsB+2l/KT4eDmVJGqkcHiAgIwhtFMDjarTJHgmW0OihXJzrIe5i2JwLydgoKDgZHWoMl3e9qtedGL8I4f+pbseRIBhFYcDJJ9fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=akCXFGFt; arc=none smtp.client-ip=209.85.210.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="akCXFGFt"
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-7e6128bd9b3so1298211a34.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340553; x=1783945353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLVgC6cNDTSB1HzIGOHtutMGeBSADJe23erI5N8jSv4=;
        b=BueLPayhSDGtz/wmgaV9nt6cM9ozVnSEEJCg4fdDgoFVSqzLqSMehCc1WVM9jytiIV
         ACeKb/ozmLRCGLS5EbJ2/x5/hv8ZAS/SDUFSXRFb2t+gdoNIH4jqkKaUrSIGqNryegO/
         pzjd0j350cfgI4WFiW7lnd7I0rFkjxwj+j3Xxh+PlwWoFtHtgVBPLUyoETf6vO9o7cZU
         SLyh70UkP1Q/+w4MXUBi8//v9BzdREfqlMx/2xxLcH5p9XHEb7GROq5TfhFcDcIsvdW3
         TS+7O7RXzDOtMf1IUWeEGFJRvQorCFPhE1UI638xxQwljhvqZ4Vbx0qo1RwluZnwbsnQ
         II6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Mcfbab+h6lKBnUMahMInyWDN+NLfLukyYGTk7hmJvN640dKaaQauMzuRTkTAZn2RDffeV60yyfgF2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwg6JUFU2pm5RtytMhXzh/NMXhzeL7hASzgc9PPqpF7Qwni9qJ
	kdExZ7hgugwE1g5PRW08Ibr4TWBDB4yBNzWkX2VGhikJAb3dQ2m04S/2gRbVz7sEN83O1gktFTf
	+gLV8ATv6yUiQsOxWAmg8yQlbVmaJ4/rGc1hM+gHuOhqeBiDPoAzdFx+ysEDlB+m95DsjAvBvCl
	6sg/Ot0cfbHTpzQlwASBGIq6NGS9R/hnCRlYLi3eal4GB9C1TD6yplolJSxl64g90ekWHhinUms
	Aon1/Bd1jcF2mnyZVZpYJY=
X-Gm-Gg: AfdE7ck84d0Voo+IC2EcgF93t2H85qYFAbPm8YV0qReQVYu1y80pg3tY4XdGOTrdedW
	E/Q7jj+7ETZD3esfFfMkEzstm5iu3Pe97em286KhRWOt9jbeit/brlc+4ZeerZLhKTxcGdm4CFz
	zK+0+V+dQVC9lQloCSkdzfDt3IJ6R5RlgfMN7cBtwoqYeskBQd6gNMCoP/W8UlWo1jPf6E43Xnx
	kAbh5iH9Q/HWtkiRfHrGD7SW8G1rFfXoe2BWph5AYiBzv8GD7ypBP67LkspGEVV2rErn3xogsG0
	1j72aGWzwUzPc4olLIAo1rlRD3uE8xqnYy+etvc3I7cEZ50ntnbOIhgiDIdc1xM9BDNLunaaVBo
	AWKpwmVBa3pMjBSuibnmZpTIwfEW5RrG0RlweFkUQN3/yWL1bW8lbG53y4HkIOJSH6ofsBM7+Mp
	0KsIqBMg5pTl3AEAq+xfPRGh9F/bFphQ3Eb9HiJ8RUfvoH33skRA==
X-Received: by 2002:a05:6820:a0e:b0:69e:41bf:fdcd with SMTP id 006d021491bc7-6a35552f011mr113562eaf.38.1783340552966;
        Mon, 06 Jul 2026 05:22:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6a3103f5531sm811070eaf.26.2026.07.06.05.22.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:22:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so276950685a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783340551; x=1783945351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hLVgC6cNDTSB1HzIGOHtutMGeBSADJe23erI5N8jSv4=;
        b=akCXFGFta7CZpNsk+jYnOOw25KecStFAIoDK/RKtW4chdOcPY0FOluEoVCpEIMbjtn
         +gLLgr/Fzq3tFlJZC8TYF0ihk7nTM9FXJda+80Zqhf86/TbRwEhRC9uHLy/QMfSAP1xU
         IszTq5gn/3xodSeKi91N3toLvSUMKQZQbTNSg=
X-Forwarded-Encrypted: i=1; AHgh+Rr9NDDEi7lUz73UAaVAX2h6kv2B8lRvyJmjreaoVP23roDbLebOFfydqqMfkbnRtAeC49QLQcgVtZ/P@vger.kernel.org
X-Received: by 2002:a05:620a:31a8:b0:914:c226:ece1 with SMTP id af79cd13be357-92ebb528f33mr42122085a.13.1783340550892;
        Mon, 06 Jul 2026 05:22:30 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:914:c226:ece1 with SMTP id af79cd13be357-92ebb528f33mr42116485a.13.1783340550296;
        Mon, 06 Jul 2026 05:22:30 -0700 (PDT)
Received: from [10.176.3.92] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e84e1casm144360916d6.11.2026.07.06.05.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:22:29 -0700 (PDT)
Message-ID: <a860b1ca-ca5e-4ac6-b9b8-dc1d35e18aa7@broadcom.com>
Date: Mon, 6 Jul 2026 14:22:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] bcma: support SHIM-attached big-endian SoC backplanes
 (BCM6362)
To: Alessio Ferri <alessio.ferri@mythread.it>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260529-add-bcm6362-wlan-v1-0-722242777f58@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260529-add-bcm6362-wlan-v1-0-722242777f58@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 29/05/2026 02:05, Alessio Ferri wrote:
> Some BMIPS xDSL SoCs (BCM6362) integrate a Broadcom 802.11 backplane that is reachable
> through bcma but differs from the BCM47xx SoCs host_soc was written for:
> the AXI backplane is big-endian on a big-endian CPU, and the cores bcma must gate
> (ChipCommon, the 802.11 core, the SHIM core) expose no per-core DMP wrappers — clock
> and reset live in a small SoC-level SHIM Control register instead.
> 
> Rather than describe these quirks as DT properties on the bcma node, the SoC-specific
> configuration is delivered to host_soc via platform_data from a parent bridge driver. The
> bcma DT node stays a plain "brcm,bus-axi" and all the 6362-specific knowledge lives in the
> bridge driver. The standard brcm,bus-axi path is unchanged.
> 
> The series is:
>    1/4  bcma: support driver specific quirks from soc pdata
>    2/4  bcma: allow SHIM-style mini-EROM wrapper-less cores in scan
>    3/4  dt-bindings: bus: add brcm,bcm6362-wlan
>    4/4  bus: add BCM6362 on-chip WLAN SHIM bridge driver
> 
> Patches 1-2 touch drivers/bcma (wireless tree); patch 3 is a new drivers/bus driver; patch 4 is
> the binding. The patches are sent together to keep the whole context intact.
> 
> The original Broadcom driver materialized a fake PCI device, i don't think that would be allowed
> in the kernel.
> 
> Tested on a D-Link DSL-3580L (BCM6362, d11 corerev 22, N-PHY):
> - SHIM brings the backplane up,
> - bcma enumerates ChipCommon + the 802.11 core,
> - b43 binds.
> 
> b43 patches are necessary for the last point, but those has
> already been sent in linux-wireless.

Hi Alessio,

This patch series ended up on my patchwork plate for the linux-wireless 
project. However, there is not much wifi specifics going on in these 
patches that I can comment on. So this probably needs the attention of 
Rafał and Florian who are already listed. Added linux-mips mailing list 
here. Hopefully it showed up on the review list in other subsystems.

Regarding this hardware I suspect the rest of the SoC used the Broadcom 
UBUS interconnect so the SHIM bridge would actually be a UBUS-AXI bridge 
of sorts which hooks up the WLAN cores.

Regards,
Arend

> Assisted-by: Claude:claude-4.8-opus
> Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
> 
> ---
> Alessio Ferri (4):
>        bcma: support driver specific quirks from soc pdata
>        bcma: allow SHIM-style mini-EROM wrapper-less cores in scan
>        dt-bindings: bus: add brcm,bcm6362-wlan
>        bus: add BCM6362 on-chip WLAN SHIM bridge driver
