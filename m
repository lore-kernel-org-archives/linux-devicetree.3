Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459565;
	b=wTnZ5F0cA8E3JU67XjrgD4vMw7R1iQlMzrRJSY1NxMClGXUVlmng+Z+rS5G5Fy3X6H3N
	 xiRuyr69s7ORQ/7ZGfFqFLWpjbIK0HQa3NAzOj3tkbnHajzPEDoJ4sQam9q+l6604NDjU
	 P8lHg2CyZjKkHffr3DKRvjqRxblViGC9kGUeGnMxR+umlnB8E4zlh+Ez/N5EZJL5CyRSh
	 uS0IhiW7qcndJvmXxpg+eUa2IsvvQCo6QqwSta4mrX/Cq7a2oZEUBHn8OMohEk5hDKMTA
	 slqWpsfYm3vuwEmq2O1UsGoPMKnhejB/2El+4ODFFRcBSHquW9o6vJzgfKEsCEIAwJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TDPMkG1SQgnWSwQUqpWJz4GemlxwNldPDN0SoLdOdWA=;
	b=0KOWjmTdeXHlOJKTnKOs7zjASmFbu+a0uTsodVtqW39ICkaSS4zLGwW+RKctlCJg0KvA
	 sHlQtNUIdfRtAozVz/DJogZrL6g4RDLly4lZMJNjFuTWznfr+c2i1+5XAfW63A03qizRW
	 zgy9DlEyHASn4RqQOjpp4X1MQwzpLsXQoAEVR0ULTtrT2dk5Qjlh0ImHKQxmWQQbSJJN8
	 vrl2ANYn4fKfa3m5VullXqXN7DV6IHhFpPExtTPEy8z7XuTmqYfuGQ0cbVlVe4ShQZYlB
	 W1QawpRKkK6j8AuAgtzXsmRYtASyssrqTD+xBjvjCDStTxxv+C75llVv5jLEwNPm6Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dtUKGBhT;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558DB606A321
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558DB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dtUKGBhT
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1543495a91.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459564; x=1793064364; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TDPMkG1SQgnWSwQUqpWJz4GemlxwNldPDN0SoLdOdWA=;
        b=dtUKGBhTi4pj2sO++DHt5X+7Sx+F3pK5XAmnYA/olV3k80cy4IDnn+ykEnmQkRvSIG
         DhRDPrRav/PXW8OqhjimAI4udO+ElQn5Vhh8Q0NIgYrjvTr4cBcTieqRhlgGp5ACYGzZ
         rfsT/Mns7cRkdieikIXgem5Hr+dWNuv88t/hqtujOTRULVBaxmqBVW7aR1OVlbGo0CnA
         54dKgRbAm4CYiUYR45AjsbmZsYE9GQ+/HDlQruDkegX7lzvdJC/sRauGrm5I4LpZyFug
         xKTqtc5sJNY+z2UJAZrfRCOWLWx+bn/CVvWjNjfILZ54VNStNOzjj925t2tmMh6pZqg1
         JOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459564; x=1793064364;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDPMkG1SQgnWSwQUqpWJz4GemlxwNldPDN0SoLdOdWA=;
        b=MKj/VATAC6Jiy8K4h0XuTwWLm7tDQWCw3tiX84eR2xqY6anvVsE+L9QklRrN7/ImLr
         lpRq0rd9pLNY2b1CqERCSTWlSnyFfbGFYobRImokAbotZHrKqMQs7yLJWDG/ebv5EzpT
         rrhRAN49h3nNUzj0TXmd6ftBrMd4ZqpMXYQD7TQUVy3sCjg7katFJD+irE5UQEEbzm4W
         V9VSI0ix+9+g5mk2fh1Jvfm422Mz2Ayesk5knmtZGnul25rp26GlxZjgiHIa02uXA8Ze
         wxkYwK3956O+aqPv73uErmRO9z5xgfPOXmS8hIuEQgtpYLHtdcQd+sRDEIC1NiZcT6Vr
         LvvA==
X-Forwarded-Encrypted: i=1; AKwUvBzl1YcW11y3XYAtK1E/Bch6RN9zRYHMk45JBLo3UgpA1ric2QafMD0/c0g3lTUqqBZh0EFu2tU43hO4@vger.kernel.org
X-Gm-Message-State: AFq9FYLYtsH4VAmCQwrW+PF5sWNgISUuMegNsepXBAF7Kg+Jw7lj7XrM
	wcXZYRw+KzE1MO7Lj200jMH8fxr7xw3DHFtP9Wt1HjQevUCtpm285XUe
X-Gm-Gg: AYBFou2zPC4FoQt6LAo3accj6TSbVVLwBGHYj55uSzjcUb5f4FeEOcwGeYxOBju2h7O
	0xkHVlzkykkZ8V4V7fO5Yt6xpjK0FKE2AH4OkFxDHeDkIoVtCYPeZ5ujPJSMXxc9R2yd6Zo7/hz
	5owPcJ6I7OQNEkaMTDwjpH+sOYytEhdyN/NZZocYdUeWb9WL/8RT2VRY2umTZxOwnzGVlNs2HWH
	krNZ28bDnsitT6VJgvymZQ1y67k23VsqiuwYp5RXWpAPoswSTTmGS1qqsUw1vin105/SVARFbR3
	ZDoyHy55entkE4Ws+DE0Ud1yBh15KodUQTPA+oipDQwYQmRxs672y54f4ZZvcMiqMXbFLFs1Uuh
	Iofs92LvdyJw8N9kSXarmjkCcuGmrYY7mMMaytbEHFJo1/lK1Ji2utTjSClx857DYMcRB22ziRF
	S3f2U/vgU3lORIb7R6O8fnmaBWH0wEKSpSiFSZyrG/x5F8iMZI8cGblWLKnz2kQGAVZhnQImlJj
	h1SvoX6i3q9z+rPjj7jYLzTYKms21teLhnbmPelz3KPSVkMYVnEBAYpuydKNywUD3ZxKg==
X-Received: by 2002:a17:90b:57c7:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3aceed9ff39mr7771161a91.29.1792459564582;
        Mon, 19 Oct 2026 18:26:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5df655b1sm1647321a91.17.2026.10.19.18.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:26:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:26:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	hajun.sung@samsung.com, wim@linux-watchdog.org
Subject: Re: [PATCH v3 2/2] watchdog: s3c2410_wdt: Add support for Exynos8855
 SoC
Message-ID: <38b3759c-b564-4826-bae3-5f0eda7ed20c@roeck-us.net>
References: <20261006161700.2185432-1-alim.akhtar@samsung.com>
 <CGME20261006155900epcas5p1b842116272ea9d75c815ebb11303cfa5@epcas5p1.samsung.com>
 <20261006161700.2185432-2-alim.akhtar@samsung.com>
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
In-Reply-To: <20261006161700.2185432-2-alim.akhtar@samsung.com>

On Tue, Oct 06, 2026 at 09:47:00PM +0530, Alim Akhtar wrote:
> Watchdog IP on this SoC is similar to Exynos850/ExynosAutov{9/920}.
> This does not have CNT_EN_WDT bit in PMU and offset of RST_STAT is
> different then the previously support SoC.
> Reuse the offset as much as possible from already supported SoCs
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

Applied.

This missed the start of the commit window, so queued for v7.5.
Sorry for the delay.

Guenter
