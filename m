Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C64837B03B
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779712292; cv=none; b=rB1XacwDzONSpeRoiAh0uA2EG1DoWJrZWD+j/xKffZhxEwR67ck/DM8Q3asxpu+Jeqst7SNu2NMSxRV77Oqdl/DEbKppyI1I2ndUW3UTYEhJFl/O1/1vhWraIXkwpRWcPo7LA8R3+zJ/RE+0yylOVkOsWGz85/s7mM+jYQPdV0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779712292; c=relaxed/simple;
	bh=qpbNNT9LTg/BQrpX4c+/wUPqtP5MSqmpILKrnhojHyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b316QOCyQjQdSsv2UvXutUmT/UuGirssa4t0JoLecBfVJiTvZo6BOdI+avkwEUGUbsHJQH93P5BHijOcKiXXc63xdV6MF93IPXBVSnwpFIPFrCIqougO+mzwxIGw4XYfB6R71Jkd9cMScGc380bZB7qjfeY/9fBD3qsY5XnrP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2Km1n4E; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2Km1n4E"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso82043865e9.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779712290; x=1780317090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrIDVk+3CslyJkUrNGl34AIpYDsI+Gmqf4gQKToWHJM=;
        b=c2Km1n4EqS2KLiF8/aD/TOQ6BMa15NRDAYhTmh3epjc6mGYfSNE55qzGliy+SPhYc+
         7IHQ6lkTJ6dSEzgH9XnWMpxSC5E+NeSpxiKZIwep90j7F9HMspamzLSOnhqDZms6D2+z
         bJAKVoS3525EKJzgIHLprLyFgRsxDe+sjBV8Ld71pOA9ufg/hMKzEXK5uhkSrsLwvXsB
         6VmNU8YATKyKEOk9XLQtrru00ECQUMErzE4moxPHDr7kobDXwhOatt6VLWO3VEaZHl4h
         lbkB56fuPwy1v1Ot6hFAsJJKinkCDcEbuTySFPZH12JGZUg4/IJv/f4jyKMi4w9WEFe/
         WnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779712290; x=1780317090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrIDVk+3CslyJkUrNGl34AIpYDsI+Gmqf4gQKToWHJM=;
        b=HKWlvSlI4mUUTd07aJxrZC8I4JAdUzNnGEVJPCANDhKeidJ1vSEtn58mIQSXINIup0
         uO6Np/uwBf2Rwm/RLvGWSkqmicb18uLEQBSHpwP5WBXpwUUmr6DxfEg2ubIOKhP+dATa
         iVwlVhlURkdVaZzA3XMMGRcjJi/EDh1wesb/dGQarIhhRwiduA64hhNkuM9w/pDs4+sU
         vmaUcloxP2dBgmLYjDMqMEmEeVats5FJC9A93EKJeT2Tq7ZFcBBmeU2Ec5iV+Pei3tR8
         50/5nZgCbpICD2hPRYKRX40N/H9+PVfbbwL7qQK0C8ouULgqbdmG7Pmebx0j6vIF5T6u
         bnPg==
X-Forwarded-Encrypted: i=1; AFNElJ8h6bO7cS5GhjWdNNkIN2DRXFbkQy6WRKQO9DkEhe/HaxdiLzQ0ouWU8PQyYJiGWediB9Mr+E/g4re+@vger.kernel.org
X-Gm-Message-State: AOJu0YxjvaBzLEnf8diEhMrAD6Bltt8IZrqjxswSYLyycob0NnjZ+9YZ
	ZSi15CvZCA+KAwbJ7oWmeKegBxdqgFFAANJs8/jpWj4QAAeFiL+btNMB
X-Gm-Gg: Acq92OFA67N176QmyPU67Ar0AW9FzwWo3sJLjgZo2/av6U2QiYUzvynM4g4q+xikUN0
	S5gQ519TyBIhZ3AAqyk3cJ93Lxr20JYNQOWeqgWhBfHE8RxcV4YtSju783Gso+JJ2udQcO4n86B
	R4h1W3Oq9V+t9SW0ByfCoyZAs+2FzOwUPWSjEH9sKYa3yGGHkTZG1Wx3X++qJRHch7hDEA6aqP+
	ZyTUzcFPlMjNmCA6a9FbxJ3ZnIJtpLU4PQIVndCltF//Dgf6c5CY7ojgekUCIrTPao16iEbljZX
	k4GYzltf1yok5KuMo4KxzAb2gP8YpHa0POWEwkaX1eOovgO0evH9MIRRgL+y/sk0KT/2GnZ1s4V
	fCHID1LygqRXtxDQnSRA+XWHAeYxIetSo6XjLImqS6GG+eAmDFyphi3LhzfhcnHikwhM0/7vMrS
	2npN3+AnCgYZzQMep0CpuJr55DINWWUgFf0kmr4VB+Okb+2JmVyF4Fr71W
X-Received: by 2002:a05:600c:3d96:b0:490:5429:1513 with SMTP id 5b1f17b1804b1-49054291bbamr158545285e9.6.1779712289494;
        Mon, 25 May 2026 05:31:29 -0700 (PDT)
Received: from [10.25.212.250] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428e6d68sm85965215e9.22.2026.05.25.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:31:28 -0700 (PDT)
Message-ID: <9fb59c65-8cee-4502-bc10-1375f276e25c@gmail.com>
Date: Mon, 25 May 2026 05:31:24 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] remoteproc: imx_rpoc: fix carveout name parsing
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-3-laurentiumihalcea111@gmail.com>
 <ahOwO7LBXCYFIngw@shlinux89>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ahOwO7LBXCYFIngw@shlinux89>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/24/2026 7:13 PM, Peng Fan wrote:
> On Fri, May 22, 2026 at 04:18:46AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The imx remoteproc driver assumes that the names of the reserved memory
>> regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
>> conflicts with the devicetree specification's recommendation, which states
>> that the names of the devicetree nodes should be generic.
>>
>> Therefore, instead of relying on the node names, use the names passed via
>> the "memory-region-names" property if present. Otherwise, keep the old
>> behavior.
>>
>> The definition of imx_rproc_rmem_to_resource() is added to a common place
>> as imx_dsp_rproc.c can also use it given that it suffers from the same
>> aforementioned problem.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>> drivers/remoteproc/imx_rproc.c |  7 +++++--
>> drivers/remoteproc/imx_rproc.h | 19 +++++++++++++++++++
>> 2 files changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> index 7f54322244ac..1ee1c658dcc1 100644
>> --- a/drivers/remoteproc/imx_rproc.c
>> +++ b/drivers/remoteproc/imx_rproc.c
>> @@ -672,7 +672,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>> 		int err;
>> 		struct resource res;
>>
>> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
>> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>> 		if (err)
>> 			break;
>>
>> @@ -850,11 +850,14 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>> 	if (nph <= 0)
>> 		return 0;
>>
>> +	if (!of_property_present(np, "memory-region-names"))
>> +		dev_warn(dev, "using node names for carveouts should be avoided\n");
> 
> Please check 'memory-regions && !memory-region-names', some demos may not
> need to use memory regions.
> 
> Regards
> Peng
> 

What for? You'll not reach this check unless "memory-regions" is specified?
