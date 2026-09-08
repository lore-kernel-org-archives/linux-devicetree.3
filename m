Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6879B33DEE9
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 16:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883940; cv=none; b=aJSr0e0NKwacdfEbFg6fYyiF6mAezDATbjt8YIWfEyms7M840B8N0iZ9t02s7uChIRu30ziCwkZNpil3rjljzn7Dm9xYRTM/xE04gRKDjs8IUmUHxx4705icMQu/loMygHQfaUPJtZddHqke3THUXmjzupmeqeOqr3RTcebtw7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883940; c=relaxed/simple;
	bh=ngRQZd35Jt8WtlvrkxLAiPGXLe55YxX1GcCgc8p/Miw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTMaYRv47duiM6RdagZ/T/YSMces/nX4YjbkIh03jdzZsrxq5uVpn9htKGoanjIJzNZSqaHjUjOjZimrODLwoVzphxSmOeuY4H0cydcszTYV2gmChPWjO5oOgXbeUtVSfaJl6e5xBndLN8q7DiBjRQcDIpJf6cbMAnb3gFAnHSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4J8Q2yy; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4J8Q2yy"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2db858d60e0so6461315ad.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 09:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883937; x=1789488737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2RTVmx65sj/OQ1FTIJA7qw5cuQ/6mnn1iGRNRdhAkxI=;
        b=e4J8Q2yyLgnaI3DuH2ilWxg3DHl3Q0BkXvbDPlZXmC2w4+ftoonQL77NoEVp338iiX
         gJFWe/t0mVVAw1ODfUoCMFm1GWazrQZ4Yx5xlxl0TXHt9oKcEOd5UO6SgZsIkGSalrcw
         8KqiUvLhF9XFYJGdo2jbToC+/M/DQh5KuJndIHo5NfPeDp5MBK+SpTddcwyCDXa6Gw3d
         Wi+U3v3cfm0E3s8HY+LEas8r7lq4ckD0dtfZCO3vOJkVO25cxCEkqRBp5dYvza6Rt4iu
         bl1MVzlG7rcvcoBQZ1g6gjLwoK7qQxNvqfnv2YZVDf3sQESJLZ8gB8jvrrZnEPWr28OI
         NIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883937; x=1789488737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RTVmx65sj/OQ1FTIJA7qw5cuQ/6mnn1iGRNRdhAkxI=;
        b=qPoFsCHgRG5bEWk5TyZj4ZOK2HYqvIaLmZjxmWmeSQIQgdebeYUZ05+MFXxSbO7WI1
         Zs27DwZ/skWXf7PhWiIU98TSdltJW4+J2icCBvmuAqocJzyyOqPp4zKjJHPxmZZkGOBY
         PsWxPs3Gph9HoCo50/hnIlHrUSvhRAfDTNlm6mdGoSSdew+Xjk6UcLZfPydMle/LU0A9
         +jQ0hTJxTV/In9x/Hdd5/v6yKnscuk2TK+Nsr+XXrGR389phifMkl6LeMW7pJqs9V5j4
         ORUHesv0PRMcHQ6DCU5FEy4MskGfYapytbcd+YY49z/WCqaaYZEtxAJ3Y+56Bzp4t0Mp
         0E4g==
X-Forwarded-Encrypted: i=1; AKwUvBxyiyQUpTfck2vGUpCqw6YRlc27yCnHSTaXHupjiz8qZVuHKZbv6cqJYv1TvcpzPEDk/pugT4uAVVdt@vger.kernel.org
X-Gm-Message-State: AFuF++mqCSHIvZRmTOxhctwYg3wVyHLhVfPcFek7Qo2j1Lw64J1PggfE
	RAYg9VL9F1dXUkOOFXa8KkJ0J8c/rREhb6eCUE88FYyOLNSsT0qELOH5
X-Gm-Gg: AYBFou27X9yclSXxzFrY1uvYQ3hDqy+ydehpzTM5jgEzfc6mis9eBWxTTUuJIikRdNQ
	yybDSgCDkoM81ccoq9uHssRrNLa4zGwCV3nk2XA+QPiSn1BmD9YUYtJ97duDISyDfS+CPbul4Eh
	BFSxbkIfSrKRC+r2ewj4a6YfRDvQgP8EA6gej85NsnjvjVIdpGM/zg92qh5Utbpc4WzaXoJrjo9
	3KEcJ193liayZDPLmN5LUJVjVXwZfiUREfPVosCOrDHmrN752kpetF116d94ILCWrsmeQj8kpS7
	0Stl5K89JseYzv+9zyHMqauNYUcSDqDnkDjzGUJ3P8UALbNLaPQf4NN5d+TJYFxLEaJzo2DaJHg
	jLiiCwS5eWaNtXjuyOkCNtYOg/deo2fcaHsA4bZ3YAy7BfShFJfTXW0auYfw7nW7T57YK24engl
	5eRF1y3Xp8aTwhKEvdJgpiBeoC2+4H62YxhorwlqijTEMIUMLQ5yyWl2eqU0pbSghmUOwREGcN1
	w==
X-Received: by 2002:a17:902:db07:b0:2db:5ea1:8b04 with SMTP id d9443c01a7336-2db5ea18e2amr170023395ad.5.1788883937378;
        Tue, 08 Sep 2026 09:12:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b419sm61093785ad.13.2026.09.08.09.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:12:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:12:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add Axiado AX3000 TSADC
Message-ID: <ba945a15-bd57-4c6a-a738-53177a9cd814@roeck-us.net>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>

On Thu, Sep 03, 2026 at 12:09:47AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the temperature sensor ADC (TSADC)
> controller found on the Axiado AX3000 and AX3005 SoCs.
> 
> The controller monitors the on-die temperature. An SoC may contain
> multiple TSADC controllers at different locations on the die, each
> represented by a separate Devicetree node.
> 
> AX3005 uses the same programming model as AX3000 and is compatible
> with the AX3000 implementation. Therefore, axiado,ax3000-tsadc is
> used as its fallback compatible.
> 
> Also add a MAINTAINERS entry covering the binding and driver.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
