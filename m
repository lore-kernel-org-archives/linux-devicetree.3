Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB5457E70
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 22:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894753; cv=none; b=vEV7IAO1BGNlEHsLWyiVdUW0KWrOs43WbI9/B4lm8k/noSNGnuloiI5NPxki5Q7YQs7RkwDmuSfRlQHa2H0mv/JbO0X7JZY81XSEEGP0GWShXsC7PhzBZaASU3y42/6EkAnGHcD0XjkQ8ZEe3xss94e0p/r+/OPTFcyf4DGFMfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894753; c=relaxed/simple;
	bh=iyOloBZlQg/MDR1GswDFmzHuvue+1j2j/aHCDmB5nFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGcrmS5Y/x7jWyLNykctKi3ODnAJUPo7Qn5cXSZ2aeUxijHRUQuk6E4ntNZrMnKP3aBf0KmviOmlp6SxQir+kZPAmCi3YS4FRz7r9JBSE+tvZ/GVJYiBq+Nyodiy4QdYIEV3ftOg2xt9JzYHFvbIhGs7QqE/05ONkY7aCvat1Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeF0yUdq; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeF0yUdq"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4bbc51755so365296a91.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 15:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790894750; x=1791499550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T4uVz4BtQRRTWyCl0InjTyP+HuCQAABpXvCRfXa1uFA=;
        b=aeF0yUdq62zFUiqUopKLxv/6g24uwHkL0+dm+ZZBZVzofn1SlzwpNamXysaZse8o7g
         y/rqograQMJs1xvHsHZFbf/dLQU5oljYHFQTAIvIb1vFiKmxh3cxjq9XeXLYdEUqrloZ
         plBB8AJrVSzh0bgpQ6lYq4Atg/129Z4ujSBFLSUJvY+u7zStpzsn9VunpGZwfwjhzbIi
         69E/WXqVExCbUfyUfO0s0tZL6EK4BEmIaI8npY4iXwMXMW4QWGKW6Bt9hx/q0lI/nU+3
         CWFjfEIniKGeZZlvHxLDnYHZaUp6VeBZtFsWCDpi54fro7BwK8HnGKaXMzzvAM1/QTnS
         zSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790894750; x=1791499550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4uVz4BtQRRTWyCl0InjTyP+HuCQAABpXvCRfXa1uFA=;
        b=GzN8RoGZxQ6Q0Gh6dftn7tUPU+V547zF17GvFlbB3uqaxkcJCryWDvw5HeAHsF9mfg
         PXMVttBz9JlWuDNWCZWcAyIO1TuKw04N2o7wAnK4Zn5exE3ndiKLYSog0JV+JPP0jDiM
         HS7xxxQc8Kq9p3cKRn18aHy+sTj9CXq53LcDafKU3jTY+mD05rSeEoQt2B4mE77Baj41
         aZgPparA7cUcqxjgnGG/R4vRwkHwURfQ8HqPVH2sjY/sRKdEp4TB4CEpqa2ZgO/u2h5r
         x4CoAvkRHwsL4qOnOIS9BSUpqC3EVFv5WLCcahpdRFmkAGZxhEG//v2RuAOeThKSBeNr
         vWnQ==
X-Forwarded-Encrypted: i=1; AKwUvByfuZxoA2yF8D+skvjr8bpxye+OYu8SzUji/Yfl/gM8Xych2PlFXvSt+Ox6fAWN4F6kvxymbRsef+Rv@vger.kernel.org
X-Gm-Message-State: AFq9FYIN8FFojxQQx9NgJMZHsC6eOJZqcnM3wlaMhFEdwWylW+6r0ikF
	d1DDvVIwxiu5uDGFj5YuZYq0zsHiqbWValTtjN9vN6ufYHrV9FzmwfZM
X-Gm-Gg: AYBFou2SSy6ggUdDxFKUO3LoBfZS+c09XCOyM3Yzscrkqi1EKfhugiFWzn7uyMmhE/c
	rqo3QL7k0qN0vGljKqNjloZPVF7i+WAJeyKGmvdA+1vhuzZRUBTxG5iLsBZu3heu3+JKf+GuIjz
	Mm0e1LQ+yL0rgjL9ihFUg4dPKlyLuRE0nDCxlcqwfVH8HUJ5lS2ZmylwQxRp/KVSBHm1czsJMCu
	ousX+zO9zyBiNxQ0ETN5vtVpWTzu4Xg0T+jb1Z0ORjfWzxor1JHTh/tZA3qnDwDb+dU0Y8cdxdk
	e7kWf9cSBx8Qnn9y3qwuWhfr+FhRXqLPmq3XKpJXpggAuofIskudPosIydnJyLHml440qNTfbSs
	KiIkmo4YD/oZTzeOQAEtE6MwCxtz0Bg6lwe8Gbhwe3tw9fwXCvaC7nrdqcFHz7PAIOEkdlxQFT1
	pzgjkTy9T1BoYZqt4ZCbJLaf2HJ0iib+wdEL8H8ewIgY0y0JoW2ZdyQHQoECmyNlRQbtEhr9k69
	nTN51s=
X-Received: by 2002:a17:90b:4b0d:b0:3a4:9fcd:6189 with SMTP id 98e67ed59e1d1-3a6ce69ac99mr1528647a91.2.1790894750283;
        Thu, 01 Oct 2026 15:45:50 -0700 (PDT)
Received: from marchy ([2405:3800:8e5:44e3:ee8e:77ff:fed4:d18b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ccc92646sm1146396a91.1.2026.10.01.15.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 15:45:49 -0700 (PDT)
Date: Fri, 2 Oct 2026 06:45:47 +0800
From: Adam Azuddin <azuddinadam@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, jesszhan0024@gmail.com,
	airlied@gmail.com, simona@ffwll.ch, andersson@kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add RAiO RA8875
 display controller
Message-ID: <ar7im3iTb_UF8VxU@marchy>
References: <20261001144128.2336301-1-azuddinadam@gmail.com>
 <20261001144128.2336301-2-azuddinadam@gmail.com>
 <20261001-relight-unexposed-1a3d7dd8bfed@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-relight-unexposed-1a3d7dd8bfed@spud>

On Thu, Oct 01, 2026 at 07:54:19PM +0100, Conor Dooley wrote:
> On Thu, Oct 01, 2026 at 10:41:25PM +0800, Adam Azuddin wrote:
> > +description:
> > +  The RA8875 is a TFT LCD controller for panels up to 800x480 pixels.
> > +  It can be connected to the controller via 8080/6800 parallel interface,
> > +  SPI or I2C. This binding describes the SPI-connected device.
> 
> This binding describes all three, or at least it should describe both
> i2c and spi in the current state. I have no idea what the parallel
> interfaces look like in dt, but if what you've got covers spi it should
> also cover i2c. Probably remove this last sentence.
> pw-bot: changes-requested

Understood, I'll drop that last sentence.

> > +        panel: display@0 {
> 
> Drop the unused panel label if there's a respin.

Will do.

Thanks for the review,
Adam
