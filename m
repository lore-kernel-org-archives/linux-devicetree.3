Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A3828852E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 20:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783368266; cv=none; b=V6VFceXkDSMd8t3gAJzq8DcxRyJ2TfiCRkzz/8okEEI46trkj2fSzM6dhnbTSzAsjAPHHmFpoxDKvqvVoyseKJU9/mJU8G52tI0OMjYk0s3fccndR/bu1dTXnyw82kpxqj9oJ0IFsHCTkcI/1kFLbBeKdoIyKPFDYrNcuthJztY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783368266; c=relaxed/simple;
	bh=cs2yBHOX5oyI2jRYpGq6JzwexFF3gKQEOOrC7alrvCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVM0HyajrJhdbfJhlJIS1mxXeejpnxINP2YGqPJoXrexCIMjuL6a0KOTU6GBd5RbJnoNRWmgBIbDUAk3+p4kkuqit3nxbk+G/JIMpBKkAJvOmc+pLHcLnYF7m12QdfE+3r76V0PbB0FfHCu7RWJfEQHUT/+tsAtrhA+kPkLS8WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kvt8liAe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NUYs/FIZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kvt8liAe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NUYs/FIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783368263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5wdjn2ILuT01gLTBdftJHP++YDd3DzxJNeXyKRqGWZY=;
	b=Kvt8liAeILEy7FnbVWyKuz87v6OwHewA18KO8LQ+dBvpQtpXi5SxeKOO2J+xEY5agAKMIv
	RkeYnm8ymslZxN+lMICk97F8jFJvK9bgIsMfIHnd1BHXk7FuiLAbk4LkDSb7uS4mLfUM00
	O6k8c/SFdwVtT6/ikXc8hNYo2U6okD0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-b_PZV5YePUKw7GvYOfMKww-1; Mon, 06 Jul 2026 16:04:22 -0400
X-MC-Unique: b_PZV5YePUKw7GvYOfMKww-1
X-Mimecast-MFC-AGG-ID: b_PZV5YePUKw7GvYOfMKww_1783368262
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91ed0e140c5so623146685a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783368262; x=1783973062; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wdjn2ILuT01gLTBdftJHP++YDd3DzxJNeXyKRqGWZY=;
        b=NUYs/FIZoIRlhjDUyWK9tv/cibyR0Le/uqLaeRoB0Fss7hKYybW88GMOu9OV255uO/
         6Vd/X3HDv257kc/ifv43a5luF4d7ihzyQh+qWITyvX7/jGpt8/wT4+nlmcMGYFhQ9Orx
         ZUiflCyXouAVjWgQIW6VOUkuYgm6HtReB95cDd8IKUI9MMIKV1SHxzwJrdOFlUt1+iRx
         jlfSmi47wz3wuAcE4s2SowSzva2QeB5x8WpEevFwOdHGyLAwnJkyIGBScyWVSXHtPO/w
         etBvoKDasforr7Q/JT9KINotmFZzBBpgWFo3VZJX/rH6Q/uIUd5EOrUi0jAmBNHUatf2
         hZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783368262; x=1783973062;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wdjn2ILuT01gLTBdftJHP++YDd3DzxJNeXyKRqGWZY=;
        b=XFNMaBxsZC7qOTHI/ZnvejRczHVJqWa5jKPgdSISaXdxGqiCw6v1ZvuQiXn65QRVdj
         FxUgodwyAoVNpBX5v4HkzzxbkIKVvQJwxXUW4PRoSNB9cKa0eGxn9lS1W/68tqj2YpIb
         LAPOqjUZsqafQrHCvyVSg8DNUyqztieg0g4/soEZ+yG2CWvIltHBJ+YUHBO6oYr5DPyY
         phROeOhgJi4ROZV9klTsXvfZLfN5QiZZi4U9vshGmq6DeoDjppF46NZSN5l2GbsfNJEB
         KWB++fiiGZc1kIDWlXSLwttfP7RzMPz4cu8gw0T8LN9v7vFj04dhCs6diymgX8h7ZWQL
         z7Aw==
X-Forwarded-Encrypted: i=1; AHgh+RqqV2J03of7G0o4LRvm8WJSFSbCFiQckbM2el56GZkiGPAkh64RCuBwOS0rGOaFQvbVyq4nyex8eHjD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+6b7JK2pEnz960sw9EXzzSaQiX4LiPNz/rJ2Jyp1YyVtgqHkZ
	EbpIE38shYZltAfcVI0gr3VsFpO4vMJ3BXbxQNcDLnXQ76ZoaZh9gGSi0CXLzOG3UXRxTsHQnVI
	VK0fUJkRtG6nM8YPxoWdpkGIUObdCCDKZimWII39jfgI0EQiT1DClZKZuk5sBx6Y=
X-Gm-Gg: AfdE7ckpA1zyg0AO/QMQEvf1wIUtQ1NnGVTcfNilCW+JKIfkNCp2NmGUEguyrRZAucr
	c6tHrBr0PpZVBXqpLB4Kr5nlVFgj1epe/hQBTc1Qdk1ESQMBhONqJsL+lVF2/JcqZA9+WVX9Pcn
	I+jmuFf0LPAQ0pHYxfx1cWEAJg7cdoFpBnno7ex50HDnDjNt97r1odPbMmxvgay+lTYJgnkBMof
	ptBPzk0RsvVC6GLkQM38Y4qtlC5tUjipoih+PzOW5C+jO8zJpM3ebD2eV7/NJnW9jvL/r0CNdBV
	HBy2TcZmU1olvO6PbwyhjvjMMLZLsE6fSsfssd8M/FIt/6D0wSb8hUD4SvZ+ooQnYNoO8eP/UCg
	H1Ehr2hUEhnzeurKmqoBVtV+olPxB7WacAld83EHkNQFTrw==
X-Received: by 2002:a05:620a:2954:b0:92b:6805:9191 with SMTP id af79cd13be357-92ebb5dc455mr291579085a.73.1783368261928;
        Mon, 06 Jul 2026 13:04:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2954:b0:92b:6805:9191 with SMTP id af79cd13be357-92ebb5dc455mr291574585a.73.1783368261495;
        Mon, 06 Jul 2026 13:04:21 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b7fc3asm982333385a.9.2026.07.06.13.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:04:20 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:04:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pavel =?iso-8859-1?Q?L=F6bl?= <pavel@loebl.cz>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: si544: add support for si549
Message-ID: <akwKQgdNEO0Z_Gp4@redhat.com>
References: <20260701145101.3932655-1-pavel@loebl.cz>
 <20260701145101.3932655-3-pavel@loebl.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701145101.3932655-3-pavel@loebl.cz>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Wed, Jul 01, 2026 at 04:51:01PM +0200, Pavel Löbl wrote:
> Add support for Si549, which only differs from Si544 in internal
> oscilator frequency. Si549 also comes in three types A,B and C.
> Each having different maximum output frequency.
> 
> This patch also fixes maximum frequency of Si544 C. Which should
> be 325MHz according to datasheet.
> 
> Signed-off-by: Pavel Löbl <pavel@loebl.cz>

Reviewed-by: Brian Masney <bmasney@redhat.com>

