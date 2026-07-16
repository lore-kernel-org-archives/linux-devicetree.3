Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3B9346E56
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194947; cv=none; b=CiqTeqxhbucX+jGLBLsQ5GJ3DdFujCZrZvcwyBkBNjAsD6J2SQ9qUVeDazxFjydOTzDihkl2AVScTZQi58wIh3Qn55YYtboX2o1HdOquCfIg6GVLb8d0G36cqzaSlH5qkj55YyHtEOs49GErJcnbgsz13YN0dAKGfad1pauwwKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194947; c=relaxed/simple;
	bh=39XAndTQmo1NBabNFph+WMyYTOzWodq39/QO5d975ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kp0BXtMEZscxkvWY5iUXncm4VRv+dDncm8qS0FysEa1lodSTBgSUMcT7GTl6q7Y7Dyxe2TQH+s2TFWYH6BW7bEezUwlhfpYT3uN7YHo+ad/iG5qHqJzW1Mk5cwJgmLvwWW+hCU93wtOYgHJM7GlNdNvIGXshoNxCV/+1ZPVkGRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVnzoGim; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVnzoGim"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69e2266b07fso2411779a12.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 02:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784194943; x=1784799743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWQ9oJo6FYvzxfcIJtWdNxYH0ur72y3xrCIEL4tMOu8=;
        b=wVnzoGimyIuFYJpQ+bs41iY0dB9gOxUSZbBh97G0xWGZpgKyYvQy3vWv2r+gnFwudb
         VM1UPrkQYTKCGp5f/2lLd/gHL8ZVziQ3lDhMwpxTsIHV4B32B5Sr8IBzFx5epym+4GcL
         7oStHBLNWPcILe1NpsOOkwjY/MWIg0oHi+iqbRijHn5eB8RRzJVSRUbXBkkBKcuujNv6
         uMhyBwnb6/thgYFaZVYvWq/6tf5lAZihrZEBxtHevBst2+CuwUpqdi6oChAfVCbmHC9c
         COb741tB3SW2JEhuQSc3jTT08b7MXIIl1lC9QRVZZGd9jRXZLsPa2YRMpmJaZIZBPGd0
         gzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194943; x=1784799743;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWQ9oJo6FYvzxfcIJtWdNxYH0ur72y3xrCIEL4tMOu8=;
        b=NLAwgjOEWnQppMfaLKu3WPjnFQdvSEOUjlfI3x/+IRSjpLDgx5eteFlmfS11Jm5w/g
         M2inIHV0RrKkHDh6O+SMr7R7/Qq6QAtmETWmE/ul3Gh3kA1ntJuXntVrUoraubIw+P5G
         PFOsjhcVnGrlpvSDNZiMQ0PojaMCwGziW/+Yj2Idr2Zbt2e+ZfMRJr7wlvgbiYhRd8Ld
         XvBNZwGsrmSJbT8+ZBsGU2wnxkdZw4uiOQ1tQYufVZe6Ub9K4paJNbGBoDEeM+z0tvyF
         ZTiHYYVEtBVqf8K6gJlSPqrtKDbKDbE3sPlUUzE8qmswgIi74T6JffY3Hkcoat2aKEMI
         WyBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzNGB+DUJLJjqgjJCfRjSYSQl87Ctu4C1HDmDeYPkDSFx86KOiBK35/L6JokM+ULOEJoEzeUczqv89@vger.kernel.org
X-Gm-Message-State: AOJu0Ywql5Ttm/0GxtOsJNvzmFG6MRhF9agHK0+1Tp5eCMzEFjfU2R0S
	1PbE4XjdBm9Ro3SFW07tyxnPjTyWeDDWErx88URwAfzMeCDNLFVEWTYg62cjqt6JLTM=
X-Gm-Gg: AfdE7cnuKASVt4Tz2/dyF0gMfzVWnbOg3C1y0RtLACsuCUsRRkvYwWlJRaGUF5F8zV3
	JKmUsJI47Q9DHgeS61xC4dABy7tVq5N+sBa5qJO+cCLpNGLNUfTeokfTIIm7u4Y7+U2EV3/Y3LI
	SKZFd0a73diUXKq9fYhp2EPKmH+TlD5eljG4tqFv2jfdp24TY7L7vUBOu3TzfzSsAenIVKet4EJ
	I3uJHL0Ibc6BUic9up+U2+cyxX9AD1v7t1iQ4tF6TJN3FWYR2Yd55/waMitPOeMX+vFNprABLKl
	/jQr0t/1HL/B7FWZEtjS+D2H8nSEhhVkN8UkB1xYAwPrkcnJr09w9n554mcgrQu4Yh2YsO1fptk
	HykV7/O4gXl4iwTZrEve/WKblpn7ogWRybjJyM3zsMzQ/hE5VCjx0xIlIbUvXiUGcemCWCaO8dm
	vZvoBUhfpmBcussac63vDGM+U=
X-Received: by 2002:a05:6402:51cb:b0:699:39c5:204b with SMTP id 4fb4d7f45d1cf-69c5f0be27dmr11018264a12.18.1784194942921;
        Thu, 16 Jul 2026 02:42:22 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.36.131])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd294fb1asm4400218a12.26.2026.07.16.02.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 02:42:22 -0700 (PDT)
Message-ID: <c731b03e-b550-48af-b338-37ac53018247@linaro.org>
Date: Thu, 16 Jul 2026 10:42:20 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
 <20260708-x1e-csi2-phy-v9-1-0210b90c04cf@linaro.org>
 <YSunV_lNJ8xW_y-Aa2psZavniF6mcHJlJipuj1RYWMB8Zb8yLC-gb7eEnk0XMjfwQOneMGsZM5foFKutCNhYqw==@protonmail.internalid>
 <b7baffda-b97c-4b83-8d9e-e381d0289682@linaro.org>
 <3ab676ac-919b-4a80-8dd6-71dd7f6fe06c@kernel.org>
 <-iN0mG5nS2joxEn49UrxFlORE3R6Ji3HRebfOMNMGnupMIobTBdRDvnwjRHAXHeLmGf6O4JJENVauduwZXwhiA==@protonmail.internalid>
 <b834e9a0-a61c-4912-b57c-36d571938b75@linaro.org>
 <4d7a0e59-7c34-4557-a475-8cd7fd2ad2d9@kernel.org>
 <CAFEp6-2J0WGF6g0K7s--PxciO+d9MR-SCVnrWJ3u=sgQNwA59A@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFEp6-2J0WGF6g0K7s--PxciO+d9MR-SCVnrWJ3u=sgQNwA59A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/07/2026 09:56, Loic Poulain wrote:
> On Mon, Jul 13, 2026 at 1:18 AM Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> On 09/07/2026 08:40, Vladimir Zapolskiy wrote:
>>>> As explained in the cover letter: I'm following guidance from Rob on that.
>>> Pehaps you've misread a given review comment, because Rob's guidance is
>>> to remove 'phy-type' property,
>>
>> I'll just quote verbatim "Perhaps putting this in phy cells would be
>> better because the consumer decides on the mode."
>>
>> That is not "remove phy-type" - it's "move the mode into the cell". I'm
>> shifting this back to the DT schema maintainers since, I take their
>> feedback literally, seriously and canonically.
>>
>> Any of the triumvirate will do, Rob, Krzysztof or Conor.
>>
>> Absent a different answer from the DT schema guys, v10 ships with the
>> consumer deciding the mode as per Rob's original guidance.
> 
> On the #phy-cells question, IMO we should drop #phy-cells to 0 and
> derive the C-PHY/D-PHY mode from the endpoint bus-type. The operating
> mode is really a configuration of the link rather than a hardware
> description/limitation of the PHY block itself,and the sensor endpoint
> is conventionally where the bus type originates. I guess this costs us
> nothing on the driver side today, we only support D-PHY, so the
> mode-check just moves into the endpoint parsing we already do in
> phy_qcom_mipi_csi2_parse_routing(). It can be a minimal
> fwnode_property_read_u32(ep, "bus-type", ...) sanity check and adding
> C-PHY later is then a one-line case MEDIA_BUS_TYPE_CSI2_CPHY
> with no DT ABI change.

So I take your point on link-type - in theory you can select the mode 
from the sensor @ config time. The established practice is that the 
consumer decides the PHY mode, so if we wanted to make this a _runtime_ 
configuration - then that should be information that is passed to the 
PHY via configure() not via DT because we've said its a link-mode 
abstracted from the DT entirely.

In the extreme case I have a user-space utility selecting sensor mode, 
which the CSI controller parses and then signals the PHY to switch modes.

If its a run-time config, then its a run-time config and DT should be 
excluded from the mode selection tree.

I'm in fact willing to entertain this idea - but it will require passing 
the PHY mode to configure() not consuming - DT data from the endpoint.

My core point here is both acknowleding Rob's point the consumer decides 
the mode - and _if_ we go the runtime configuration route, then actually 
making the selection @ configure not at probe/dt parse time.

I just wonder if there's any real upside to all that additional work and 
delay/churn.

> On data-lanes numbering, I don't have a strong opinion here. Keeping
> the current 0-based values is defensible, in this driver the value is
> used as a physical lane index and it selects the per-lane register
> bank (0x200 * n), so 0 maps to physical LN0. In that sense 0-based is
> a faithful representation of the physical lane position on the SoC.
> 
> Regards,
> Loic

