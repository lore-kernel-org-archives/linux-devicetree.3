Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974288;
	b=q//wvs6oGLdvI2KokEcZlSd6i/O3wdQML6cbAcWfGqEG0QGN0oKcJZI/5IxqrDEopzrI
	 pkCavSPCTOcSdOO9LtpAZDGUz544UPDc8Od2Tfna+5Iaz7J9msI6gulkGnkKvDdv1XJ7e
	 xRELzGAEKBFcInEtGIJlDOo3K5xqYzjb3QvhWSLchjVoi9d8pD42ABB79+EvOj4hTDZ9p
	 F2I2aDeipj3gLlIsfHk4E4uVDfjpLVinlbfbuu8EwxUdyXb7LKhTzRhRUEiAqH6+BpfcU
	 FOdiav17d9EkL0TURucxMfcILIgx1BtuLJRhEV8uyZ0DVzXxUkJIvw23BV7BWs3GtRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HV83c2/+fbkcmd4e8V3tUmbhGiJJW07WJQ5LFrvg8bc=;
	b=p6xU054cYvCj1J9ktrduxu46o85FGvu60oV7OAH+mdOjDcf9R3v+7MUdNOVF4X4UjU8K
	 pmiswypwGGIzh6Ab7URH+hJXHuFK2GOFfAtjCyxT1fe1oMOH/oaP+2zcP36quaLZx1TA6
	 J+TU6xCI5mKMhoCjlgA/MOYm9GjGkJzQn8FzhaSf3cT2UmHMS4U07Upr421Eipnf0I7GW
	 P0MJ/Za6K9LTYGfvLps20oayN76zkN0osTdpelcIjWh20KWBIk6cC3IRA7L180DFiWX+u
	 wwpwDls2JlZliSnBgQXkZ5jT45wwjS4mumyEcQ/vbs7ETZ5TlmBmr0ZYyHU78cfnCgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QMARMDKn;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DCF606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DCF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QMARMDKn
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9e53d011eso17459725ad.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 17:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974288; x=1793579088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HV83c2/+fbkcmd4e8V3tUmbhGiJJW07WJQ5LFrvg8bc=;
        b=QMARMDKnwV949KW4/7O7LSMd6V/YMqHz9ZlzpWPQ+s6TZykn3tcjCrDcHALhy1p1D9
         zqqj/8P2iA+mT9qEVy+OTO4BJMmNn57xNgP9cUxA94uldrS4V3XktyXb2Npr40PtGPuy
         km/P3oDXSbst12pKwgiayxeyY4umhESjvW8vcI/lsH8231KYo2AEuYpPYCEs9G9OqRi5
         ILdIktl2YHjxn/ILB2eQPo/HJLGk1XEysxZ7njT+GgD1zhFE4eCvQVj3jq9AYneT4VqA
         n4shNZ80DPL984vmHjsFDb6Jg3k0aVHR1+XFwi0SpyargLeisyh4sSxPIXy16x4yeHfU
         TTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974288; x=1793579088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HV83c2/+fbkcmd4e8V3tUmbhGiJJW07WJQ5LFrvg8bc=;
        b=1pp2rKiigEG3FOZUqM1JsyIeqKhrcF2ZLOOoLHnWrt9xnRYrzk91RsDsF49n4O4Onp
         iXWVUZJfwOQ2i+ru3Zg+0NsA3gC/qhG6zyFQpbMc69MRSudfEVt/TfhUpyQAW/xS6Y3N
         WKohgr8nV2SqGQ8r8bglhCXTKc5wt5PzXZly4wXw4uCGSDLoSYZipDfWBJcnacj3B8WL
         ytgOTm1D/GNtOQi7FcKgtRCy3MuVZSiaGrMoC2ykSRVWO7MX35AZZLt4bfr+M4EAoYQk
         QYhVOugiSCYIKeMkJbtzw57NzCWVxJM16xa1bC7Z3LtRRfTTii0QhPN9fiu9s3nGn5P/
         JMpw==
X-Forwarded-Encrypted: i=1; AKwUvBx5k1D90t2xFqPepZzKZ+CixXU3xyQmf33MrWQGd4S3i3n3heJ+HZQpz05ctee4XN0ia4td0MK8hzNb@vger.kernel.org
X-Gm-Message-State: AFq9FYLMzMVDWGs2p809aeo/6P54erVO/Z395y0xqNMyUv+Jk7yN1caX
	h01bBM5I5sJGQ7a6oXnBOF3BtHmIpeVh0sYTei6LYtQv4ahQp9f1BIFhaexH0A==
X-Gm-Gg: AYBFou2qcJ9rg2ES3Xo2EFfs0aLNJfCJ5+get9zdh1YUyhF5fwZUWglSc6gIWh95k1p
	E6nAvBAmdiYmMge3dGJs823bF6VH+LL5TvfbqhqPg8dChn43Ut+4AAsirsj+xlc+HG/JVQzvYBu
	kQTzW8sWDMeRx+Imn9wHhWjybbtGZWSguWYgTXj4GvxMnJlKb7gAVYEYSSFxhGHWZHym0dyhBwU
	C18xXvxs9mPw/uxRwVhZkUtYP5EJ66VQxxDyAOclZawLCZS81hGWV1bp82g0uutvI5jatZcf08C
	3BaFA6zng1aPapGiItlEgTub4VWnMpTWO5MD+sqIIVHNkWqDEfsKYigrE3ViiF1I0KKONjMoHJq
	03Gk9qYQr/E1YCsLnzardcI0Xm5kXuhMjQS88klR/jzB/UvvWG55u1w51HRN0TkDxtX649IOQOq
	JnBdwDIZTnOCu6DWPEAlOZXYasJrRm3OgteKsTs28bBrtPZHu484DEU3a4pysTJMYQgL5H1uT2W
	aieEVtodJ6G4i0Qpzp9NO0r15UYbtw2gUYoIKKahY4HfS9jox66kE8mPnT4QyOAteiHNg==
X-Received: by 2002:a17:902:f705:b0:2e2:c602:2072 with SMTP id d9443c01a7336-2ea9c6c3363mr43122285ad.36.1792974287852;
        Sun, 25 Oct 2026 17:24:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b12104csm10407525ad.19.2026.10.25.17.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:24:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:24:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: (lm75) add MAX31875 support
Message-ID: <9977952d-339c-4ca0-b11c-9df45b6c7b65@roeck-us.net>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-4-johnerasmusmari.geronimo@analog.com>
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
In-Reply-To: <20261023091550.1494-4-johnerasmusmari.geronimo@analog.com>

On Fri, Oct 23, 2026 at 05:15:50PM +0800, John Erasmus Mari Geronimo wrote:
> Add support for the Maxim MAX31875 I2C temperature sensor by
> extending the lm75 driver. The MAX31875 features a 16-bit
> configuration register, configurable resolution (8, 9, 10, or
> 12 bits), and selectable conversion rates (125ms, 250ms, 1s, 4s).
> 
> The MAX31875 has no alert polarity bit, and the bit the driver would
> use for 16-bit chips is part of its conversion rate field, so skip
> the polarity configuration for it. Also set the default resolution
> and conversion rate at probe so the driver state matches the chip.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

Applied.

Thanks,
Guenter
