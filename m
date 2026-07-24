Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DF044C51F
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784914029; cv=none; b=j3lv7FZrrvoRrYpifkzkyLC0iIa3X+fMCEeIEXZmNACEz2Ii+sIe70lX2CuWPRTucrUIQPOmOzmUMPu/Dl04TJjoVm4n6rdKGMp3KG/+VOlBCQZb/DX3G2ELB1yPCrSzadVxv4QFkMdtiRE/f5lzcOsm/V//Dyy5RMgetH7vDyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784914029; c=relaxed/simple;
	bh=7/2f7PPDnywk//9ri199+3+jB563CTBa1UTHshm9lEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlOl8JyLMaFpG/0EZLmKEgTAdWgyd+YU5IweAdobjO5hEmyGlG1sEWIoSQp/9GcWHXtlY09KCIXjNMMp4vu7eZOrSOxyZzH6dnBKqGGZsTL4+9Uv2RpA+nk8Ff5RAooz54u4WvlCLWnPqlVo9To0PfHIJVlDwRpMaPVQxvdupjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXTEdlON; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXTEdlON"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so771074b3a.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784914025; x=1785518825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U26xbPdFXYP/dp7KbvYNjIdHJ0Q5KZ3g0wD5029039Y=;
        b=kXTEdlONs7ay7JjThyas2ZWACxH6wqfR4gRleUJ/nom6Nx51Fm/FAbFGrDd06/KKqA
         r2izXs8Zuo4G52TDij254xKO/PWBdZcS7azvVkzPO+PkyD6E4phyNLrPYW42RcaI5bYp
         HLzVXsKH+VrXDAdF4dfGmPYIjrVqIwfGjWsYGhJFx61p2b+Ke51o3t8fh6j7Cs1cbZ9U
         QLuaL0JWl4chTY7Jr7gkQtsaieegNsoGNvpiEk/BL+RZXo6QcxqXKxtmF93xEkmoo2xq
         G9X5ers1gRDXeKvhAhMmIQB/R/SOHdevXENglJT7Drlmaw6eJ5TgRpWtFmEk+Q41g8Lq
         QBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784914025; x=1785518825;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U26xbPdFXYP/dp7KbvYNjIdHJ0Q5KZ3g0wD5029039Y=;
        b=bFZo5j/p3kSQk9Hoif+4bXsyRjrhdaH7x0PomzlJ7SiFzEWEsz3bu5hyixAsstfocd
         1DUNKGWd3f+u/v6MZ7dlJUWGDUvZTw6DcPmRYIrEsl/nKTS+qqQpAQHfMpGEi9wGH/qr
         foELRP5ClOBTMsjEIvJFPft02kg4gzTiv1fpgyZC2cRnDK3RtQVSCRVQzmea9n/Wf1mJ
         MZGpU/pgCcM0V6pb7cGowF/NTgGe4nR0Xl+Gu0aecbQ3PvXNG4JkbxNSrmplTn/AO1Vv
         hrWItYpgfgTGEcXx/xrSBYdUpW4Vf2uF8qZm3LVThMapXmBVgG6YlXpr2JzM9Y722pzI
         tR4g==
X-Forwarded-Encrypted: i=1; AHgh+RpZweceAWaIbrLBLaT3pPjvwjykYoibpCAAW7RNzUczsjaP34hj7G7QIWvrwgYeIe+8YY9ZmqzIgjP1@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ/ca4N5DS9G5LZ5vbO//ELQ5Q1nV62kqrnaJNxKjwt2JT/HaE
	0L6IN3kBy0uG2Zf/sbxQvzp8Mahb7SCsFiR2bigpsiSq6RwwjuDssOwm
X-Gm-Gg: AR+sD10IM77u9VGWMEdWRU6pMat642Y/8cxcQjsxKEbY8rzZVqkrLNJRgjshU7mPsti
	X+zAQ7Wk7zAOtc7izOKbfkzfU6v7xjARQpH6AJJSnGYIhYlIeHrMhCFF32hjERLv25n8XaZ39HL
	WoT7e3U7XpdBk+7T29jFUuf8zwJOBttyKgT3rswK8t1mtgM/+rWrtTBxQRESAXWPhyEcB2Qy4bn
	w20IPD8YS3ik0jXTZ3WHgJYwMecN7pAGc1x2KtQc+ufuOPefTPU+XYDa8SwsC/jrtuAEC7mkjJw
	laf9tkOU7zyyC/PditVFpaKlCqmXhqFwRuy1kmauu3J1DY+ewB4MWR+VQIEXbYz6qmIe9JFzV1q
	AGyVOU144aZf4NIYICxqIy1nU7CI/wURaGlemseLc9oGJhp9/YTuf1rFvP8N5pAXT8xHc2PsiCB
	d3LmgH6IdZucW94qU=
X-Received: by 2002:a05:6a00:4b51:b0:847:8f8a:a05d with SMTP id d2e1a72fcca58-84e2bc6b53dmr8461030b3a.29.1784914025173;
        Fri, 24 Jul 2026 10:27:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53258428sm229838b3a.12.2026.07.24.10.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:27:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 24 Jul 2026 10:27:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	Georgi Vlaev <gvlaev@juniper.net>,
	Dhruva Devineni <ddevineni@juniper.net>,
	Debjit Ghosh <dghosh@juniper.net>,
	Jawahar Balaji Thirumalaisamy <jawaharb@juniper.net>,
	Avadhut Naik <avadhutn@juniper.net>,
	Santhanakrishnan Balraj <sbalraj@juniper.net>,
	Brian Mak <makb@juniper.net>
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Message-ID: <ff49ae92-cff8-489b-b702-9d8fb8dd4c69@roeck-us.net>
References: <20260724164919.247162-1-sanman.pradhan@hpe.com>
 <20260724164919.247162-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724164919.247162-3-sanman.pradhan@hpe.com>

On Fri, Jul 24, 2026 at 04:50:00PM +0000, Pradhan, Sanman wrote:
> From: Georgi Vlaev <gvlaev@juniper.net>
> 
> Add a PMBus driver for the Analog Devices MAX16545 and MAX16550, and the
> Volterra VT7505 controllers. The driver reports input/output voltage,
> input/output current, input power and temperature over PMBus. All values
> use the direct data format. Peak input voltage, output voltage, output
> current, input power and temperature readings are exposed and can be
> reset.
> 
> The reported current and power depend on the external current-report
> resistor connected to the ILOAD pin, which can be provided through the
> "adi,rload-ohms" device tree property.
> 
> On the MAX16550 and VT7505, the severe-OCP deglitch time can optionally
> be configured with the "adi,ocp-severe-filter-us" device tree property.
> When omitted, the existing hardware setting is left unchanged.
> 
...
> +static void vt7505_set_m(int *m, u32 rload)
> +{
> +	u64 val = (u64)*m * rload;
> +
> +	/* Make sure m fits the s32 type */
> +	*m = DIV_ROUND_CLOSEST_ULL(val, 1000);

The largest possible value of m is 7578. That means that this _will_
overflow if rload >= 283383960 because 283383960 * 7578 / 1000 =
2147483648.88, rounded up to to 2147483649 == 0x80000001.

Please add a range check in the probe function.

Thanks,
Guenter
