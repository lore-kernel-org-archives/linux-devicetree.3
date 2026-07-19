Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1269E2459E5
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784472558; cv=none; b=vCaakzMLyCuzy9sbnxQqho5pz5/NgZTfh7v69rRaQu0t9Bjl/x92cfLG67Fodeoq0W+LcFYRrK0fVGgJJKcxFQfON2RCoritxxByvFK+mGvAZ+AdVCPuylOr2Rq3FrNF/V5a+KYNRNR+ym7SkRrbhJySq7O0AS4+aACCORsaaro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784472558; c=relaxed/simple;
	bh=Q7gzfp1xZ2LJLRXakoxDM6BFrJKfq47cA5ROeBV11tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbNYV9zFRKYrao0Li+8K8P3FKBEAqSt6yCot+uzWLklVp43yoEcVkArrjzKV2qKXLLZbEA5Iho9T6QeDxUBXhE4jHckJMEfXYSfPDaaiOhWAdSBY8/LQl7FyGCCmjEosSVV9/adR+6CzT0uvjaI3a3sFr5woxR90c6gUIlPASs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bALFb5vg; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bALFb5vg"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38175907a56so2189854a91.0
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 07:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784472556; x=1785077356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G8ozcmP5Do3BF80PgSf++jutnr7umepQsuoe/U76RbE=;
        b=bALFb5vgoVSnztkqrbJBw9i/AEV1eonjxaninheOn5ONRjFsYUejuTDwskloMMNpd2
         iHJ2vzh6f8GFhmZsDKWpF/JVyOMyLbb4pqql6uXhMdHJP9It3UawsMPizOxoWt6gBE8W
         RjVbWH95UZnXPSXruIc6WSKsOGrcIIu3m3GyqZVZmnK28Pi0OZ/yaCbXLovlAvF64+Ic
         1UUPST/SkJA0XsJ0JFu1AAlUKSv5wAqK0mz7yPg5SWFTsVC3zge8PzF+38OITz2N2er0
         +UojSmYaIpUTiB6sj8uNbFdOMCqKqAT9ZGhyA4pMeM3OudI3g1ZFwNzWdtTDOGcl/DY3
         va9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784472556; x=1785077356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8ozcmP5Do3BF80PgSf++jutnr7umepQsuoe/U76RbE=;
        b=UmUURdHpsX1P7Dap9+n0AjADXTwVohiVlb2DWg/cneUphGivtKhMYjHiofr7A2U+ZJ
         Cml8cn4Zc3sNF63CWxYnu19L1b30LzSk1VDl1sa2Kh2+FLLstLKpHbGG0RPDh/Ypwy3J
         kkTylfjawqLdbjDGXQZI4Bs0qeFV25wwNDgo0X7Lb/p7IPYNClw0p7XBa4bqgCvv66SD
         rIwNIS7QtCKrJ1G/1cey6xy1qMukJh3tlZtEjtZWEuS1MCoHvYHlHqb9kil2F8UCJzV9
         Gty9Hg1QXnxaLYO6j5OM1aL1MLKRoud4tExJ2r7AD7AztIFUXcw2dMYuGVah/3XAk08W
         bKdw==
X-Forwarded-Encrypted: i=1; AHgh+RqS0Yo5i6Tr4WYrwcon8sNj03hxWUAu3ZPZxJMYHR1KAb0so7NGwWhWAePsoeqjLmBXfa7T2qvn+wfv@vger.kernel.org
X-Gm-Message-State: AOJu0YyCgN6uB00viyB6ePRFJTOhEDID8rW7pVQab/TDGxknf6o59S/y
	FxhzA40GBX3mdjhn+rM5m8nDrB/CjJZ3IedTiiRgwV2qX5uF8MP4ZhGV
X-Gm-Gg: AfdE7ckaaiTVZ79Q26e12h3oUBTiEFRWW8LDkl87hcYwodgnXuX8dRxkj/CUkwov3Ez
	6swA7C31SJ/HUPmRWOkr5fIrR46aSyAe53tMsjDVFWuzdcum5KNWUm/7pQGvJyAp/EML/u30iMH
	FggnCrdtxDa3oDf9CK7l0cKijIOf7BqKVZ9SI9vuVX0TvhdlDuoj8pYaiOdihU7mj2Xwvu/cCzW
	p0yoO0C+m1bL5Gcwz/OWzRjTkur4cE6Vs5hxU6KPYJXfFbwJwaij9tlXwsCZ6bCj65hybsDQdp4
	wOJ3jqBWNoMg/i97a4bIKXpE8eYGmX+6dV4km2QaOIwJ4SSMpDHX74UBEuqxb4ov+T5c641hHw5
	tNXqaYz8ZvrGPDzhUdqiJi+7MYEMXx2C7GC7hwYwzHAqIRS7rMJeZDjCbvZbGmBSJy3fPFZRWmg
	ufm3c0GwODBZ8EN7c=
X-Received: by 2002:a17:90b:5644:b0:387:d5bd:622e with SMTP id 98e67ed59e1d1-38e4b6828cdmr8514207a91.17.1784472556341;
        Sun, 19 Jul 2026 07:49:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a0d82d1sm6034463a91.10.2026.07.19.07.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:49:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:49:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 5/6] hwmon: (adt7470) Register as a PWM provider
Message-ID: <f882feec-c764-4990-8a11-186c028b6cdc@roeck-us.net>
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-5-a55147958fad@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-adt7470_thermalzone-v2-5-a55147958fad@gmail.com>

On Fri, Jul 17, 2026 at 05:59:18PM -0300, Luiz Angelo Daros de Luca wrote:
> hwmon: (adt7470) Register as a PWM provider
> 
> The ADT7470 features four PWM outputs that can be used to control fans.
> Previously, these were only accessible through the legacy hwmon sysfs
> interface.
> 
> Register the ADT7470 as a generic PWM provider. This enables standard
> Device Tree PWM consumers, such as "pwm-fan", to use the device through
> the "#pwm-cells" property.

Use case, please.

Thanks,
Guenter
