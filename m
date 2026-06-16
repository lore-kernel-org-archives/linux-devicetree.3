Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1A83A8746
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625972; cv=none; b=O4qTBpKaF1lECCWOLvxDV7W0jTevKtIQPhwvvtQFRnBEZn1jGwBYF9CYZma+xALHCvovOYuOYABtXgfcpkQlUHq7UrEkDsj2s05o8wuhNsnv3JVqVtzUXheqG7BW/rJ6G8jr8oyGV3FoLyJ3/IwBWvDnAHab6Ubb6JfboAwza3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625972; c=relaxed/simple;
	bh=+FxnwydxHua8Z6tkMX36UHcpuucb1rXxmv27CydN09c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSVBqH3Quvqw/TkmM47Rgn6XcjfLCWZmxq3KHsCPIrmbzUSbjYFmykSjUH8IbPhecNISR4HA6xkUkj7Reh2dYGkeYhk/NykJz0NCimT9vxLs9LShP0FHgABj7hmtJSmULywj9SQwqTJV6Ug37cDqbrBln+ZwHlYJjeXKyQgx0ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMCfNzRC; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMCfNzRC"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-842848fd613so4194213b3a.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781625970; x=1782230770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aX9hyq1cLGDHYR490qDGwzNNEN7oKaQ0B3Q6KeGbmjc=;
        b=qMCfNzRCdhAMPobIF6Gl8MJPrSFW8NpBsVvtGDXrbPnoz4hxQmhHXFi7DgljdXeBeW
         CI/YYkLqJgJA7uFgTbczIq2IvaJkGb8G0UB/QcNRWMmvGVV93qbkvZkA9JJrS8tgHH7r
         M5rqwGJXGQgTVSu9rXrX6E5y7rql6+reYbyO/5jCThdQpo9uSImVSijycIeLRLgqk7yI
         OWfMLOuvEmj0Du1WfLfTj3fdA+bd3mzIEz4U670PJoZ+2+C6+HX0REAuJqWdpKC229Kc
         cy8UZ2qq46olmV2rn+KnTV4Kd/VvrcYaKrlLuVOSXmYH+4JphnwUHH5LkvSQ9o7/E33f
         U1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625970; x=1782230770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aX9hyq1cLGDHYR490qDGwzNNEN7oKaQ0B3Q6KeGbmjc=;
        b=IQVPV+61T+StpsWHCZCpDkSM+Odht/7d543SMQTthhtyU871IgBdZJypEkc5TyhqZn
         V1bBt6Nzofm/Pzl5Pv765IKPexMWOZAU/uZxMj+j9lDtjU0UXvzEJdRE/VjckJeXxT2w
         8yOZICg+r1uxzSP4lB2IbFHA77rthxJkdvq7XKCyWEHlYiXiHZwK5wgimlI98elT5voN
         5gPTk1gK8mmnn874GX7B4bW1VWBiw7rBaFD3DjJb7EXqlP6vSePAQvIn9MuQs6qnbI2A
         iYSYiHnaovJkW4raGJ7hl1rtS9/GBOtR3MGYsAo2N/stdFEeDt3aHNrA26/D0Lgu2quc
         0JKA==
X-Forwarded-Encrypted: i=1; AFNElJ8Xk00vSZbVoxcMV9P9Vf/oB8aq1A4Cc4lhSaV+hF3ZfaBHppWRXQhJ42dovp393VJwzLK/sy86dRVw@vger.kernel.org
X-Gm-Message-State: AOJu0YwSwavdEGAJd4cEWXgk4YGTUjgxnL7iB6+/iIYZKJ8lxrrEYi8x
	l2YHASMaRxl9OqcBvLip7J5zlOmt2/hjxWXLO1Aff+ekCHfcYaOuaITg
X-Gm-Gg: Acq92OGlqoE2WtDbyGck4rjbjzszzewytUyuvHiTNTaDoNcdlZnPNoOhP8LesFS0xC2
	mt4ADPaZB/z8ObL1sK2NBtcvjibOFQJ+DhRETtIamZErMsX2Sj6oZ+asGIgSlSPWKrdZ9/9hxig
	Lw0Gsvz8VePUmiZBWnrXz5BkMkTqBCew37G6VVDr5237ZISSuCJRyiD6Fjkf4G8jbeCHOwkWrZ/
	tStdtZnzE5rQTySOfI3Yn4RCztWLPirsNuM8XgIg61ke+rOligBiZDAQbeqX/pMfhk2gn7GkQsI
	kiWphzTxwIZKyTy+FWTiGQMvuhNq0w+6J+hQFj4uA8SzYkfekUwvk17SWnMFgYL8OfFBZEjrqWQ
	AqIR9HS+KflDyamyGflTcQVMF64Z7LlL2+uQn8WHndZz2DKLlm3dT3mf5Mh1oVsF4sQoGs54Oak
	D/a4pyCEJ9gCSZyYrv7ITkgK20NVz1eX2DCbCR
X-Received: by 2002:a05:6a00:418c:b0:835:405a:7e6f with SMTP id d2e1a72fcca58-84515357f7emr3850005b3a.14.1781625970515;
        Tue, 16 Jun 2026 09:06:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acca7ecsm13880233b3a.13.2026.06.16.09.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:06:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 09:06:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add
 current limit properties
Message-ID: <ff79cd10-557e-446d-a599-93b228f9427a@roeck-us.net>
References: <20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com>
 <20260615-lm25066-cl-config-v3-1-decb4f5b0b77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-lm25066-cl-config-v3-1-decb4f5b0b77@gmail.com>

On Mon, Jun 15, 2026 at 05:49:16PM +0800, Potin Lai wrote:
> Add a 'ti,current-range' string property to configure the device's Current
> Limit (CL) behavior to "high" or "low" via the register, overriding the
> physical CL pin setting.
> 
> This configuration is supported on LM25066, LM5064, LM5066, and LM5066i.
> LM25056 is excluded because it does not support configuring the current
> limit via the DEVICE_SETUP register (bit 2 of DEVICE_SETUP is reserved).
> 
> The values "low" and "high" map to the respective low/high threshold
> voltages of the chips:
> - LM25066: low = 25 mV, high = 46 mV
> - LM5064, LM5066, LM5066i: low = 26 mV, high = 50 mV
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Applied to hwmon-next.

Thanks,
Guenter
