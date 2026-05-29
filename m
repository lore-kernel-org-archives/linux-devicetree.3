Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F623B8127
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053043; cv=none; b=Vl8Wv8BfngsyciXyx5EtvLSyvqOImbr7Aj3jMqN/NioIwB+ut/p45aN04mBciCZHFwkqLMkslVW4wTN7yEOqV12E1kXf4l8xH0CCx9gSCNVqjXvphIC9Wbk1aMqCvjulpRGgrKtGdb79Kenk3NC8Yvdqzp1rhxOpM9rjMAm+r5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053043; c=relaxed/simple;
	bh=VwGJ1aVISsmjGLnoNcjoGKPnok5e19Xi0seckWEDRu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZYyNyzDMWuLq11c3/B9ZxbcKS/nyLlF+gyL7EX+YXX9uzgKEAAQ2ZWicSK/QTAUf2XPG+UttaP8poZDM0ghSqnk0yI4qaffpHpKY3hM+0aRmsA34t92GM/Lh88S73J4y3wOdONaoPJ1OEO1c0PG1jpKeW2Wdv+VcRr8GpjqFUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=zHK8lmBu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="zHK8lmBu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso70252275e9.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780053040; x=1780657840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VwGJ1aVISsmjGLnoNcjoGKPnok5e19Xi0seckWEDRu0=;
        b=zHK8lmBucbZ1kGYWNxWdhPPADUlkMHzI3vr/HtsrxyRdyVZ5iG3yZ9ZYZ57JdWiK8O
         Nj8/ghwxaaR9CN2MwOzZftw6rWW5HY0/VgIk8uWJEEVMnvoeR0jiiV4j2K+iPZNDHjY/
         9OgFRmOq6lzmOS7R44nxtdSpkaGmRKzaIuG6GxMxUpR+4ix131SJVw4fclFmord8xWV6
         5qP0M0B+H24ll019X3oA1PztnydZq7Xmwq4/8bvp+VbE/UP9UETZ5zybyKl7IoBreLZm
         1wEMEitUqJog6Sz0xtKz1eCC7dgcDpPmMf746vzVqLxWRsu8QSDGuJgSik4+lf1xmny5
         Pjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053040; x=1780657840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwGJ1aVISsmjGLnoNcjoGKPnok5e19Xi0seckWEDRu0=;
        b=TpnUa75kvP9SLpEOTXx8wRpcKcaWE41r7ig8hUiOWjYqauQZgwmRD35woedC2TfhrM
         7fqENYcAG+ceaQUXjsNDifoJlT3sbf53dyR8dzvQhVQbzCZLATqjEf7E0MjpTt9AFtDY
         n4O3tdP8PLgzJKGYTisX+6AAGpzy+Zy3KrMmL0X04UvnQ1Q3AQ5fCHzC+QeGmz9oEQ0x
         pdWRTrCa9nf41r4K+3q9w2qbJ9JJF3IHPhz11kZd+qqGc9mx+eirYYSmkQ3Wix2oeDPw
         wbKzBkk5+NYjMHfWhHxXeHtIe2IG1OVowD9DmrkK5of8pqesUCjqpoJInH5qld4H4x6H
         L3kA==
X-Forwarded-Encrypted: i=1; AFNElJ+SNI8JXb4qW88PSxrk/N4bDLZXdnW/b6QBdXxFA7ue4lkTMFkVi6opCz9bGfEy232heFbbgbuxaoPs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7y1ezDn3j9soKSjGR1Bf2l6SMN6tVVDL/DBQxo4NqNigXjl2A
	MUCII/+aWSt3ztWnk8l24Eig+uT0hyEZnlS+9r1E08XLZUCcYnN+mSy+zJBlSVAtofo=
X-Gm-Gg: Acq92OGajEYROYBpYzBql4H7eLU2N2Z0FeOOBFFVwj5O4zoNXavgIcQmwyrOsCEAk6C
	CBkzJxDzSL5gcP8KzUbSQq5bm627Rb0K0fvtcO8GvskRn4oT8vonmqDfk71MHCCJjmocMxIPSsm
	9vnHYsDwE4mtPsDl3yKKb50PQRyf6njrAKi3atJoXU08QqQO9t5qbkDiegmseXa5z112VipiOR3
	mBcKVT3OS5eLBAhBhJnMo5sA96/dglhbzd1l1EzHpaOBPVgVMcrb7eVHNeUBhOzpJRfNSHupAUh
	MW5gMSExruzZO0GPuq9UhDac4KdRJJfhmZqKKCo19d7NR9ynd22NoubzIHaxIt6TQRi3ugGRqdG
	gqte6mSIYHZF7jTNotxFH9YVg7/j9PRoOc00eEKN33oaFX557HZas7cD0lv+tOiWGM3wPc17TQF
	EJpumaPZofXfQCkgyLCSkrsditGwA549ihxOnnKULO86IlU5USfX5Cm83LEihjXWM63XLwFt+8z
	UZQpT7uVEKporQ+k8Bvz83EfSpf+9upfrAQlhTLq1lYUqqekqISkuGZ/sgpZzZWfE2X7aEreJE3
	PaskltPpa4vN8LnYYtmBnNwstM6oYg==
X-Received: by 2002:a05:600c:4595:b0:490:52fb:12dd with SMTP id 5b1f17b1804b1-4909c0a4c85mr41540435e9.10.1780053040047;
        Fri, 29 May 2026 04:10:40 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c103b98sm11912765e9.19.2026.05.29.04.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:10:39 -0700 (PDT)
Date: Fri, 29 May 2026 12:10:37 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 5/6] video: backlight: lm3533_bl: Set initial mapping
 mode from DT
Message-ID: <ahl0La8OQHXAlV3m@aspen.lan>
References: <20260528135123.103745-1-clamor95@gmail.com>
 <20260528135123.103745-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528135123.103745-6-clamor95@gmail.com>

On Thu, May 28, 2026 at 04:51:22PM +0300, Svyatoslav Ryhel wrote:
> Add support to obtain the initial mapping mode from DT instead of leaving
> it unconfigured. Additionally, update the linear sysfs code, which uses a
> similar coding pattern.

Words like "additionally" in a patch description can be a sign the patch
should actually be two patches. In this case the patch would be a lot
easier to read if you cleaned up the linear sysfs code (patch N) and then
added the new DT logic (patch N+1).


Daniel.
