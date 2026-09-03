Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0584D8DBD
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449303; cv=none; b=o7EiVgEGE1j6h9rUcyCLqi+nl8TQT6uzFMS/p1kSTmkkMpdqegJPbRD/99vOVoVN0ZEpTt3wishfk395NpiOO+5IFT/afde71dtjHyNrNaY5hRCEzhIfiihsTT0P+nOxILaiziFpfOcUmGsKVWlgxYdpGIm3lPFR29sqRrY2OJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449303; c=relaxed/simple;
	bh=3OoVTmgZTrg4i4eHEg4VVIqIJ1fjXA1FcNrE3GukeZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4SE45HXdibCjmTbmkAOZakXYJWlaNxLkMZIFHybZns7RDlVGr27pASY6yPmmf7FWdv5eJoJMEhUAhjTUmJc0OFSBSenWs/ISX/P1/hL2BQz35GmfZ7OFscAkifsoLMuIOdaSqMt7JbmkpXimfv8kdPICxKxu/D4Qf21imnoZGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WFodjiYr; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WFodjiYr"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b1334a3b16so1841493eaf.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788449300; x=1789054100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isVAKZBdOdl8BGB6lxhwXRv6fB/dregp4QMCpfueusA=;
        b=WFodjiYrFzfmE/2V6oGcRMNwn1CWjJQKJEdVrUUjwhntJru8xk4i4PNiDo4+Z9kh0A
         ox0ue5hPVYT3fdc362/CiXBnGrBDLjJKeNhnIOjBJMY3FYbBX9gnQMJVSf7N/jJNO6K8
         QKmYLsOvdb3ajguPK6q8geWq8KSqMaE+O8R8ocXasPEYlg4dKnmxaLdBPPnN7QWnPkdw
         gjyv6fnbrTu5EwvMwO7MJzOve3HpvZYENcqBLoNxJyqnHEg5wskJPQZAWV4P0AMY9p2/
         mMRuqOSuI4Miko3v4ErUqmekkWlBq2zgLxaT1x8PhGNsK0Et/6ZBfoVS6d8N7qo2jOgA
         gvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449300; x=1789054100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=isVAKZBdOdl8BGB6lxhwXRv6fB/dregp4QMCpfueusA=;
        b=F/RLe1jXIoDa9KikSRh1IdRNi5wT+ipKIsjQAU2Mpri0GYU+OMJJR3On6z2z2YUz0r
         1+MplzbLNzAmgwCYt3q+sjAI6pAjhC4eRHQfG+RPlQKALRqzNv5qSzp9HuNcc3BkA5Kq
         nrHVYhdXzdtV9sVJ5HzU3E5m3EUxyfxaA9c4/oru38WCQgoUezNL3lPRN47Z2Hm12vTl
         qf5pjGTpqoJ+8lA2SFwJk7hpcvCrduHi2sN6hxEGepbmsxO6jWUAUduLZjVyy+ueZpv8
         arCqAnqSQgKEVRBCcNIDbq6jBkw9Z+xvKUloz68MFaSt6mi5I0ngkPV3J5p8TiGLPf3r
         TAIw==
X-Forwarded-Encrypted: i=1; AKwUvBw1DS424IKi2WJuO6McrCnnInD5vLpMKNQpKOyv/GlUr2yzjIoxNulu6LXbCcgx0RxLwsK6g6nPyqSS@vger.kernel.org
X-Gm-Message-State: AFuF++k2IR02gx9k19YL8hXpjLUIXzM636GzJCVnd8Yq598DHvQBekW3
	+S6iSUUt9GgmfNNo1O6ZUyBx9ZGboMzmujBYM48g5OEpL/r/9hpuWBGauLsx1uDyrVk=
X-Gm-Gg: AYBFou3oq0KF9KN4wr7SKH0D4Kte1VXWlI2OXs8rcxmLf6UaQhXlyxI0AJDAWNBH8CF
	3ECIXgKUcU4d4nEdycPS/fefNr/ui8+Q1o5nccB1MNRJ+W8VOTqzT0qcPhKZVsYllUy2yODn5we
	WVWYP6RIppmRY/5kqh9tQ+0dcC62W5iV3sJIPeD1R5MsV4Ff2U6SGT/pgRKD/AmVmxRBiqx/+MR
	uU5SVhjXb/V7USutAcwcbsmi7jeuBM58MjgQpP7XffGdZ2EjTdJhgngE5xhcY3dADmbv8DEL1Fk
	gLVXTHa4updbZKHXAeJ/Uxoh6+1LCchjXVNJSB+77sebk7DNkJvtP6rypF0OpndEA8alPvMhzcC
	sGENZPgvssci2fJFBPsVwN3Ex5peMJL824tkKxfvQAd3mBgy1Y5enoM/vXRvS9MlsuniVy7cDJd
	ulyMbK6bSQ374s9IKngXQOlFMcue2mpnN/dJR0z88Om6HoKHV8U2OmwqrZoFMdiHOWe6gtvfrUc
	0b/whd+3zE3vn4GTMuSK6OBsQWDVrDGp7Xr
X-Received: by 2002:a05:6820:f09:b0:6b0:ab1f:ec11 with SMTP id 006d021491bc7-6b6e067e113mr163012eaf.29.1788449299639;
        Thu, 03 Sep 2026 08:28:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e24:471f:c835:8147? ([2600:8803:e7e4:500:e24:471f:c835:8147])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dd07214bsm103730eaf.10.2026.09.03.08.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:28:18 -0700 (PDT)
Message-ID: <c7381f65-d895-4ee4-be24-695ca69a0337@baylibre.com>
Date: Thu, 3 Sep 2026 10:28:16 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads1015: Add support for label
To: Flaviu Nistor <flaviu.nistor@gmail.com>, Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
References: <apkRJ8T-X-HoNiDB@ashevche-desk.local>
 <20260903151627.5011-1-flaviu.nistor@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260903151627.5011-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/26 10:16 AM, Flaviu Nistor wrote:
> On Thu, Sep 3, 2026 at 9:18 AM, Andy Shevchenko wrote:
>> On Wed, Sep 02, 2026 at 01:37:45PM -0500, David Lechner wrote:
>>> On 9/2/26 12:22 PM, Flaviu Nistor wrote:
>>
>> ...
>>
>>>> +		if (fwnode_property_present(node, "label")) {
>>>> +			ret = fwnode_property_read_string(node, "label", &label);
>>>> +			if (ret) {
>>>> +				dev_err(dev, "invalid label on %pfw\n", node);
>>>> +				return ret;
>>
>> 				return dev_err_probe(...);
>>
>>>> +			}
>>>> +			data->channel_data[channel].label = label;
>>>> +		} else {
>>>> +			data->channel_data[channel].label = "";
>>>
>>> I think the normal way to do this is to return -EINVAL on channels with no
>>> label rather than an empty string.
>>
>>
>> In this case the whole dance with property_present is not required.
>> (What you are saying sounds like label is mandatory property, but
>> how the old DT will work that have no such property?)
>>
> 
> I also consider that since label is not a mandatory property it should
> not return -EINVAL just be simply not being used in the device tree for
> that channel. Since the iio core exposes in sysfs the in_volatagex_label
> for all channels, there are 3 situations:
> 1. The channel is defined in the dts and has the optional label property
> assigned, in which case a string is returned in the console in user space.
> 2. The channel is defined in the dts but has no optional label property
> defined in the dts, in which case it an empty string "" (a default) is
> returned.
> 3. The channel is not defined in the dts (in_voltagex_label is still visible
> in the sysfs), and reading the label will cause "(null)\n" to be printed in
> the console (as indicated also by Sashiko boot), since the default "" value
> is not assigned during device_for_each_child_node_scoped(). I think this is
> not an issue since is just the way sysfs_emit() handles an NULL string.
> 
> My initial version (v1) handeled all 3 cases, for case 2 and 3, an empty string
> "" was printed out.
> 
> What would you prefer? Any further suggestions?

We should implement it like all of the other drivers that implement labels.
I did not see any that have an empty string, so we should not do that. The
sysfs attribute returns -EINVAL when read if there is not a label.

(I think my previous comment was ambiguous. I was not suggesting that we
return -EINVAL from probe.)

> 
> Best regards,
> Flaviu Nistor
> 
>>>> +		}
>>
>> -- 
>> With Best Regards,
>> Andy Shevchenko

