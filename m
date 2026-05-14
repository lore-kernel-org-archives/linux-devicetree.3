Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE57F2C1594;
	Thu, 14 May 2026 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762560; cv=none; b=c8Kein0Hlg6/ucyB5UPbg6/2pX0NWiLWxoV/lgzdOOhTKdktcWsYm14Mi0VnHCX8oI+rdU9pq3XHoPIdQVQ1kjFq2rpiqs5PrFTXEXfmLhfGq0Na8n5cB1Rfuc6T30S5pDszsMYBrLpHItWjwpt7mlFSd7LFCR5X4dmKEYOLj7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762560; c=relaxed/simple;
	bh=NrSRxXlemFsmOMgUZCAZ+tqMQQxfintqAjkNN79lNsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0s+e1PKCKMQa9wOSWRD3xVG/rGuWhWCT6uvc4LBZrzQNPto7RVZ2Lhr8VCjUUXrbSvDHbysU1SeafCph08smE5BJlFmN6tB+t6vGwEoN5wknJJUW9eTE2tqQMD04PN0NEidSkO02AtVCOPIVfzCYb37oGXdA/jjWPAL/pI+BdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=d7BamG/8; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="d7BamG/8"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F18E610CF24;
	Thu, 14 May 2026 14:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1778762550;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jfgRv5pAT5KUi8yA/K4qBUoW9PFLUAs7IXTAEOVarg8=;
	b=d7BamG/83Fwznq8MDxUnMhZDJrFHWpFpnKbh6NUc9yAwHZh/YzKnV70njY7ZjDgDb0gqKj
	D7/CN4Eykq5uGCAdE/FKQyFoV8jWRHmlw8LYVujRGNyxOlXe7XlimYwRyzOfHNX8OUhfS3
	CsFp5AY/LewgFfUQ34PwQ/QhaEKbr+yv65c+U2/AR4AJH0npL0sNiggm+2nDHu1l+qRbA0
	aX1X7wm4lfegIhcDTEhUz4Ci1xEW5tv4SMKgkzMJASsd3BoZe+ytPKBEpr91nkyX1ue9TM
	f6jSslPqgv+qKepmNShDJVEX1Mru+BqEtXXQy7R4rg1DltU1ZddtTQ6po+a5Gw==
Message-ID: <6150ef93-16e8-41e1-8cfb-53313e2cb924@nabladev.com>
Date: Thu, 14 May 2026 14:42:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/bridge: lt9211: Add drive-strength-microamp DT
 property
To: =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <bstruempfel@data-modul.com>
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513133127.376458-1-bstruempfel@data-modul.com>
 <20260513133127.376458-3-bstruempfel@data-modul.com>
 <8bf05bf2-66a3-49e0-972e-4ab7ad9f0ff0@nabladev.com>
 <agWuyCxPqwZ4ztVF@DATAMODULBOERGELINUX>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <agWuyCxPqwZ4ztVF@DATAMODULBOERGELINUX>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 5/14/26 1:20 PM, Börge Strümpfel wrote:
> On Wed, May 13, 2026 at 03:45:43PM +0200, Marek Vasut wrote:
>> On 5/13/26 3:31 PM, Boerge Struempfel wrote:
>>
>> [...]
>>
>>> @@ -666,6 +675,26 @@ static int lt9211_parse_dt(struct lt9211 *ctx)
>>>    
>>>    	ctx->panel_bridge = panel_bridge;
>>>    
>>> +	ctx->lvds_hsdrv_isel = 8; /* default: 25 uA */
>>> +	ret = of_property_read_u32(dev->of_node, "drive-strength-microamp",
>>> +				   &microamp);
>>
>> if (ret && ret != -EINVAL) {
>>     ... error handling ...
>>     return ret;
>> }
>>
>> Then you won't need the if (!ret) conditional and can reduce indent.
> 
> Thank you for this suggestion. We will than need to do the lookup even
> in case of no value being supplied, but that would make the code
> cleaner. Therefore I am changing this in v3.
of_property_read_u32() returns -ENODATA if property does not have a 
value -> the error handling above would detect that.
