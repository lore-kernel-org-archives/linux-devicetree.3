Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDAA343891
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935798; cv=none; b=lKv0YMT3ELCcbgr1l1Sh/FpBTCem7CBN3N0Tqjbq7cRDJHfZAxlymmXxyBp1MUeiqQafjT0EQHi8hiw42rpv2QJ9POL3kuLOKc8pgBpl6eHeMAgYI6dn/AhYH1/7slWq3vUWJgMqJTtrvNwuUcqI89OcHMFvZTM0SMdNN6gQoLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935798; c=relaxed/simple;
	bh=8te2zY0sO0aPP8QOfw6I01FBJQIKoZ/+eGWsj3nDQBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6cPaO+IB92o3BNCaNQKYrUQPApVUc2XTdJQ9V1H5UC8TpbZdJ7c7KUnBNcbRVHiqbj8fGLN3tO2oCx7acR/rIAluIcVsz77G07xOv2TuEGd/SimbH0Jbm6z29ghlG7Gddb/fLzd2OdyQASEE4wjJeDlYKUOu/y5XVm05fS9gy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HecMdCPQ; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HecMdCPQ"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304ec41197bso4196769eec.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 09:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780935796; x=1781540596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xyJaeMREvFPr6MLUgM5itNfuv/IOwPcbYOyGoFxcyk=;
        b=HecMdCPQ1i59lPU4qr4EcAV4/1QRMh/G0+Oujd2PN2batwOOL2slTM2LLdjI2iM0mN
         vaY3id9VHDiBIu1dzLtiIhxpHAYYH2jTO2hwRH7yTJ21NnecTRdKw4rxvTDUCcs/BDml
         ax/WDpaAYO8Q5qEgjEtE1CNYywArc9zs+CihG7jI9PhyrwTII/eHfHfrEZbdh4CorjBq
         9Em6R9DNX1da4osXiTxejefUqBHPw7g0bCq4zJ7FRh7lTECxrKaJjE02uJBnULpAltlo
         rro266xoBORRXNY7Z8y8wU61LwxzW/f3vBjG9vgN45XJ0MA1uNSPEEh+Jv8xTTmzZ6x7
         h+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935796; x=1781540596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/xyJaeMREvFPr6MLUgM5itNfuv/IOwPcbYOyGoFxcyk=;
        b=Og5YNcfU2iYCqec2pdTQoSQy+tUde+Eu/p0MdzQbNAWPY7qeuTmZJJWeS7L5Gi4o1O
         02mVaGmWLbFtFrQ2F41OfJ9gn/N6X94WVNeH6PRnrF9W3Uf8hI4ht36C7CqH/PQos3iM
         5udg3v+E4XzXlaoKITdMjDpJ5UTPxHqfYzrlqJTJZW62vuhDpkHYD2zBBQAijtXaluWI
         RWORvY/c6Lg2jHxRQePLsQGMKfRoFIF4gaw6J+Z1za1wWaNWc5RFijgJRhi1XWk8QRRj
         uMBgQtT7/4yk/O4ZGeEAdPWN9Q2+RNejMwfJ8O/oVxV5bJOhg9nT50i80dnW0whkhG6l
         wPiw==
X-Forwarded-Encrypted: i=1; AFNElJ89Fqiv8KRAgCqNX2SQW13HS6i18KND8XLlxV4I4RFuSRrZS91WmLhU6lcIaWi+nUGKeklBRlakesL5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx67s9WE6+miuyUOd1WgDh+KxjZiJEtr6G+ll0gH+DB/KK8Mc9P
	T63xm3PwoYVMGA4Lw1Mx2Vedl+HOQlWNJ4grrUe8s0diBpYKrd8bZ06X
X-Gm-Gg: Acq92OGSyIBhyrRZFK7gY40OfwEiXDW+6rBgfCr0w7Sfv0NJ4ACYe0lX4f0WuJcmviK
	WM+iWz2R24pS3ZWy4eNm58NC2jbzjBKNiXo7tl5LnAYs9D7eNh+Ug2S+I0npA26hdgeKqnDdp3O
	XOQgxbU5M6eus+XCp1FZEMzKUScB4wnlhYD3oaMG4XauzgCaRxYbGfh4F6pltNC9AhWioZxPLAf
	mp9fKRJhAvm9xeHnnY4mu61B1uTpjzavUTMjF++9dQsHy1A6tUeIASgN+OaltnHYnA2hNrZnGrW
	MoysfEStbKyvAbbv9czSaJmA2Itzo54X/s7t2Woc/AZpcKHObfkJWEKuG0gPvq4Vv737ebnXsSO
	iXpd9UIBhqivjfXBMcW0qD+cvBRcj80YEHlS6Nmeo4skhZPawUsBjQkq0FeA4nTPMHeIzoyQtoy
	h/sWoDxXp9QRlLcDwZJHEcOWxbsekjG+exTf+MbsOY3yfIHPM=
X-Received: by 2002:a05:693c:2c01:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-3077b32a4ddmr8991673eec.3.1780935795967;
        Mon, 08 Jun 2026 09:23:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df64eb9sm15724340eec.25.2026.06.08.09.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 09:23:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 8 Jun 2026 09:23:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (adt7462) Add of_match_table to support
 devicetree
Message-ID: <49e962ce-19ad-4ed8-8fc5-3924f87d430f@roeck-us.net>
References: <20260608-adt7462-bindings-v2-1-272982c40325@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-adt7462-bindings-v2-1-272982c40325@bootlin.com>

On Mon, Jun 08, 2026 at 05:23:43PM +0200, Romain Gantois wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> Add of_match_table to add support of devicetree probing.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> [rgantois: Removed of_match_ptr().]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Applied.

Thanks,
Guenter
