Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A050243901B
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 22:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672883; cv=none; b=q2KIb6xG0dtBlM/TUKX8vDoxLp6r1zEdjye5g/zFDEwdrTQh8H6piTW3U/kvbkkY1cYJ0PcQdTDOBMkpCb4H1/tvWtKc2DM1FYJCrmTPBEw79j8eP+eftBlsK3lzlSIbRDSlNmomiVKueyt6uz9tLehl48tc7Ida9AsCbK8BaX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672883; c=relaxed/simple;
	bh=AiL273mSE4gg9a3rOKpInyl33G7+dlhsLzpFmrnkztE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FplCoLX0/PTHv8s8R0H+8j1Ch1g5Sa+UGhwXLTZWH+WqW4ove/m/3LpG4NKMaTeGJER/WavWGPwJ4UYONT4E8fsp3YTxJdVZF/9Z37vtdC2iEvsuH0jkHKcGOakCHJ0rBQWwEIwlY/FNvEna0xKIwlOW7wolxZhHWJjyYbAqko4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CVciH6m9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CIF8Qka3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CVciH6m9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CIF8Qka3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784672879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yt36Kd3pJoDwA98nx3FwkXQgd23O8Obc951fqCUv4hA=;
	b=CVciH6m9NmAUUU2bArxVG3Z1UWv/2K9XHheEaTWfYC0hiI8Beybqb+GYl9pDa86F0dL0fe
	zmrYTyANfY5KGmxt+vzAYcrhAVd5SiIKjxtYOujD/S0XzOu3G5lCDFuB7Ql/d4fqhZi4RG
	+gsgH/Gs3DlQ6AZA59PclGLeXAsQLxE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-MqkXm_ixOEigC0D7Dm3YSg-1; Tue, 21 Jul 2026 18:27:58 -0400
X-MC-Unique: MqkXm_ixOEigC0D7Dm3YSg-1
X-Mimecast-MFC-AGG-ID: MqkXm_ixOEigC0D7Dm3YSg_1784672878
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52769fc3f2eso14579791cf.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784672878; x=1785277678; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Yt36Kd3pJoDwA98nx3FwkXQgd23O8Obc951fqCUv4hA=;
        b=CIF8Qka3NL53C4uMfi62eYlWFmp9gPVWV/UaBV7z3I55PDtxwVVMU42+T8lJcBUXvb
         Re4uptBFBttMq/1BhoT7EBFtW3icg4UmckYbDzUvpGAxkIgF2FZfoVtncDfKakhK3Zr8
         7GHKoOLmYbpKEHKPn3H6c1OH7ZlFsyYSzITjiqlnoho0iUVqtU6sWDlkTCcPdFjpgqGS
         b60q0pgFJUNsDQL9fEfZAsXyCsyNWwbhcuLBZNCzr7pLIeWwqjBCxsg9lWgOWuInS5x1
         Mqh9xXiunUQMo13dTzGlMh36UWrb0Nqd/jFXWkMY0mkJ+MbC6QxltoWblJufwqdh+CO5
         CXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672878; x=1785277678;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yt36Kd3pJoDwA98nx3FwkXQgd23O8Obc951fqCUv4hA=;
        b=gBvCYd1szbSdroGF5zwNrqgEawddkVAthnPWTMztUGv79jP4KpN8Ps+Fa4PwPRtKIV
         4yEY4eCJL8qP2w5Mf2dMyhfXisab+esVUCAiXpm0Efdqa96wQMOg1ioKkDuT63tZgKi5
         0HeWvKGwuLIkmJnMuKM6ovtzvdmIM2lDtLxV7hssdIZhHbXNpWSbHnxSvQYoFtt4a2TG
         tIplaHL8+JNGY4iEkyuyxKpU5IATq4xL0e632kC/HZEquh2XGGlBUOexid64agWE71d3
         wVad5YicheMq8R5g0IIXN4CoEyjh16kTdvG+SNBTb/OqhXFXQBxVInRYl49qJSNSy44/
         Vv+w==
X-Forwarded-Encrypted: i=1; AHgh+RrvGuvFQsqb6Or6F7o+DPUhhtgZz4CD7aS5bVGsJq9nlxtTnXOGem1P5kTwOHNgf8zgYlr5AKS5waKf@vger.kernel.org
X-Gm-Message-State: AOJu0YxkpRxV1DTJ43azYfCY2jISgRUQpOAnKmsmHFc+lbwZ5Utpz1Xq
	Q6v4r8MIy0MbZghybYdZPzaeoDXAxDzNDVowuAGElv1AfEbNj6STBW8t/2itpa+1uEo3PFGl1Bn
	50OITrzAZP4JaehIeGUhENrW9gW6lXM+n3Hik6bOyAqp7xveY9apJzXayXOEAjLM=
X-Gm-Gg: AfdE7cm6JM205j/Ih8uh+Ib/uFNbwA7WbY/6eITMuhdCM05Euhfs1XZJoWBMKxrnJoS
	uAE9Nr66Pt65aINp6lzcS/MZr9R0CWe/BNqgCONnBqGsVkA7MRc9LTrghK4jtXNjZoQior/fss6
	VZKgeub65635qvz6FeYZfRDnzfsBp6pXrxdaxkd24lZ9wE8whj/6wn31rzsT4Eq49Pm9HF60CJe
	v1azvdAQ+JjYC05BYMmr7FYWSU/s3Mcf9cr16qG0j3sb/o4pqTcHRSwIjCMa0nM4KhuwDKtS76F
	3QcER+sk5p0oCIDjWIRDmrUtIEXRdNqOvZ4HKrWXnrzx7DVQ+MfPmy/jIzd61K+KJp9K6jv5k3+
	IqIEuWzZ1QV987enkAuUApAU426MPhhRY0WQ=
X-Received: by 2002:a05:622a:110c:b0:51c:167d:b346 with SMTP id d75a77b69052e-5213c5f3a9emr187338701cf.23.1784672877813;
        Tue, 21 Jul 2026 15:27:57 -0700 (PDT)
X-Received: by 2002:a05:622a:110c:b0:51c:167d:b346 with SMTP id d75a77b69052e-5213c5f3a9emr187338451cf.23.1784672877293;
        Tue, 21 Jul 2026 15:27:57 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d3a47ee2sm3811811cf.26.2026.07.21.15.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:27:56 -0700 (PDT)
Date: Tue, 21 Jul 2026 18:27:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH v4 2/7] clk: tests: Add clk_parse_clkspec() Kunit testing
Message-ID: <al_yahLEBEucckrM@redhat.com>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-2-751547e160e5@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-2-751547e160e5@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 17, 2026 at 05:59:18PM +0200, Miquel Raynal (Schneider Electric) wrote:
> Create a new set of kunit tests to make sure clk_parse_clkspec() is
> working as expected. We currently verify if we get a proper device when
> using indexes and names. If we make an out of bounds request we expect
> an error.
> 
> For testing purposes, we must ensure of_clk_get_hw()'s symbol is
> exported.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

