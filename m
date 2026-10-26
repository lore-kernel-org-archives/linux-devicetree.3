Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048385;
	b=BPxHovlrgXE/oyxGX45N6UBAasq1UuW1xqUoPl3R1Lw0YCB0Uli4kUOtmplna1PUtct4
	 sadWRDo543Z1Htv4Pok/VFrtucfEE6qHOc7dJ85NgZkyeTI3BOPO0GK9pasTLOmuoNwvW
	 bbIlYibDq3HEQXi3KviViCIvOTUxmUHya3t4JesU/uaPlhyGgEMoqHdFPKTlUwoeG5nXP
	 MlELY66zDM3UtFKkJEGrpWZmu7gMNZr3cfATYd9+K9Xo6WhBlS+ib9TksaGkSrKRlrhEc
	 Rl3MFeo2cQ2ic6TNSscJUeC417vc3jfvr8TvUOR93LFGiZ1WvVgtNCuqYi8sashBGkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ElnGyBhxTlC0UTRUSBEeogLksVwHxSNCvVEisIaHZ+c=;
	b=QezqmTqRSzNFI9bu+wV4++gvkpZNlHRFQ7KPJREfZHdMJXfuWXp+RrR10zLm1SUq4+38
	 jFm9zFdG6fWtum4AgWP2lkhJQWo9s9i9UeBLV55Og9PHZWyhl8aQZedG5BR+Qz6NH9uuY
	 8eiMWgaAf+3dbkSrOfc0xXWOxvNJ1X8rNATmrtaZYT5M8I8bBVAVnvAdunv5E9k8R3wYX
	 oyznHKvny7AH4jW0zxhIDGnn4nc5LH5ejgAbDI2rCNMY1URQ9JMl5oMH1cO4iO8M+lMmR
	 us7WXyeVoTCMk62IBEQR09J7VyKbjOweQdI2gVmNMgyzDHZALNVGmciU5022ki3T6Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A87SY9TI;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0CA606A31E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 20:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D0CA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A87SY9TI
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35829219da8so416553eec.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 13:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048384; x=1793653184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ElnGyBhxTlC0UTRUSBEeogLksVwHxSNCvVEisIaHZ+c=;
        b=A87SY9TIKRzMzmJAHN5112qIQmlDCnKr9GFGl0CuWf42MtLScgEH0grHVP3r+xoVQq
         0XaWksEYPI4fBCpiLeDA/sqMqIbXq3xOA4xV/K/sT/xZHl+H3mHGkIfij0HUv43H6ahf
         GfXm4+e0f06yGJWSQag3ULHpRnA/WmBj1aI11jVC1uJTwaZZV90+WXYsmOOraeNIaxH9
         MaE1K8SKFYlxYkVc1dX4KetSqISyJKQoqYxNuIlxzNh1lDOz8IEgyKq5UvYzbstmXzfO
         X+xOgAuW9/oE3KeANZYraaxVbUKPTns9c5HTirX07Ukjty9Q1teGyCk2LWlW5Zb5ans+
         LPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048384; x=1793653184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElnGyBhxTlC0UTRUSBEeogLksVwHxSNCvVEisIaHZ+c=;
        b=UOktOVuDit8iXH8d9qUtoAdMO+DfVQUUEji6PXqhhlIC79w1ZgISFuczWQ76mJC9ei
         mLEnkO8eXCIJ+8t1tO6jH9W3pu87Lj8f1Rf8FbsZepXY+YC1qYklJdhxbMMZkEsD5hL1
         SrKVDqv0XyPpkwAY0h/Bni+xJ/z2T3PoeoKR8VkjR6kAlhCaFWEPwV0NPZXtbmbHIlcY
         vAfiZI6GJdD+4qSwNmN4TXi+/yqEd9pPGGkakij50LJj4n/hhLmFt9H2zbjF1xKwyjmg
         M20JVb6YKDUr25q+r1y2ANM85GRw1GBKHWpLPCfz5o2r+i72FMplrA52VgT4fIrHadTZ
         UYug==
X-Forwarded-Encrypted: i=1; AKwUvByDprO4KHFQBx0LK2hMNmyb3K2HJRtsOfUkiXAEk82TP2CJvuyiWv1BvLwI5sYWd/jiX2ZopYttx5tK@vger.kernel.org
X-Gm-Message-State: AFq9FYIwaGaUKS4r0eid+no/Ux4xIQU+0F7Wx1eJ5erMHEXEET6tuObX
	rNUP3zJJKmJvHK23H05QEngJDUt0yD4/kNJICWtn4lC4fy+gX0uYujjy
X-Gm-Gg: AYBFou038sg66ET/HHWB4CGf8uuFnVPSmygLuNPVS9ZqP+wkG2tOgMbZb/gQqUgLU2H
	KQnYxlg2SOTU6F0j9q3JpQolQQbifr2QvWU2iO1Ydb8Q73vmED2qDRF/GmTeSfi5UbmHtdvv/8s
	XK4yHFulgnPnvx7duNLY4HyD+nGda2HaSJIcKI6T+Iz06q1GjMMtfBSd984TodihErTFbEOMiKf
	5TutL1bgzjt9PetHCzneKIoa5eWMrhEnaTck42q1j/kIjek9lWKkfjBI9BmQl+/AyuKn+v8mrs+
	MQnNqIzPcjoCw/18gVGaA0DEGte+EXhEsNwfkDZhCW8nlM8QXc7MIZETGwAZRummOHF1AtU4bia
	e1uCGfbcGvqYBFnu/jRrH5wnR6OSl34oM2vHVLY3gB50NKKXz5qLVBNoqfCh0K6Bjd4iCgPMXB2
	BkZXKJGLj5Yt2IIifAtlM7En+WwYfVkxVUILQ2+UUSsvUXqb6qWjIctWdjBjnGV2uN+Ah4BFOA/
	2+Ki0/rtRfREDD9SzTTTL4t74vWXg0VJcEki8Kp99rnkBpdGxttQoOqoDtwMMMdT4bZxQ==
X-Received: by 2002:a05:7022:31b:b0:185:6c8c:d860 with SMTP id a92af1059eb24-1a3c3240329mr1386744c88.5.1793048384105;
        Mon, 26 Oct 2026 13:59:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm26721350c88.1.2026.10.26.13.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:59:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:59:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: Add starfive,jhb100-pwm-fan
Message-ID: <9e95afd7-d99f-447b-8c16-5fb7073f51c0@roeck-us.net>
References: <20261008071950.4772-1-changhuang.liang@starfivetech.com>
 <20261008071950.4772-2-changhuang.liang@starfivetech.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008071950.4772-2-changhuang.liang@starfivetech.com>

On Thu, Oct 08, 2026 at 12:19:49AM -0700, Changhuang Liang wrote:
> Add a binding for the StarFive JHB100 PWM fan controller. The controller
> has a hardware tachometer block with 16 tachometer inputs, while fan
> speed is controlled through 8 PWM channels supplied by an external PWM
> controller.
> 
> One PWM channel can drive up to two fans, so each fan-N child node
> references one PWM channel and lists the tachometer inputs wired to the
> fans it drives.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
