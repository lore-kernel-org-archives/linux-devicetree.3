Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DDF386C3B
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665290; cv=none; b=ZHxA7qMO1Qd+FN14eG0iEYeY9S+U6fMpJlf0YmSZ/gL7y5k7oaLvkhiK3lPVY8dR9EDZzphEaRicIdfPkzjOvhjrgbjQ1aq2G5vn57RCCnQWr/6E8MmyA1OIWVGbuRvJwsw8Kb6zftdE3oYguyFlOl4tboP2HSto15QpA4oWdkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665290; c=relaxed/simple;
	bh=iCNE85ieT38V40SytsBgY6taKmcQnUJj4OoTrJALY9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZapPkq7LO7PrXdpZPPmkrmJ6iApad8yl/ThD0TUvrgXqWBiKjlKIDVyx7DMHr2b5Sd53DC4sVH+6k2OvS1wqH1xT/YBtvJF+N4JlxTZssKTMOSVInBqfh14okF/bTd766kQ+nkehmevTM/pc7ZtPoRy//owJCvDmtfNA9sCOpEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=DKzlQDH1; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="DKzlQDH1"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so3704723a34.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 06:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1787665288; x=1788270088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RdLU1QE6jZBJNVqT4VGlcr4l8tJq40LqvRHk8VAlZOg=;
        b=DKzlQDH1MgZXg5cfKcUZIeB99C0zfogvgEypNGTlMyBIb1VDDQMPAQpE61K69xlxe+
         Om9y0MetdDyZhmbJ4PVPoW8CU0hHysJT9HdAkdUBSziEFP792PgT84MbjSGjArf4Jtk2
         9gGvRahZgT/ANztm10764f/wSduMfXbDdOEjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787665288; x=1788270088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdLU1QE6jZBJNVqT4VGlcr4l8tJq40LqvRHk8VAlZOg=;
        b=fpD2bukohovM3bBpEEoOI0mCKTeSEanQHCVgGz8bY7uH1ZJO2xlpryEi0uJJvF+/TA
         M5ctlSy7qO90NigRTdEr67UC76Ycvgrj+7Jetz3G4CK4MqkW+IKQ2Vwp3S0CRPyahV0L
         wvOVUAnubKkbNF2hRGZVOTVWKKn7DMWoXK32Wh81EH75tp3WGA61UjxpWcvibIi3CnFt
         iakt7VMIyxnUbTQZjeGJOnftPnavXmlx8wk0845mp3xZtHYWiqpozTA6/I7rZ4Tnkmb8
         HqjIV72kbkM+Yq/Ery2PFYYY/OkbydU0OT8C8n7/DtwsEX1vMyN7SzU3/yIUH/yEmWPA
         Q/Ww==
X-Gm-Message-State: AFuF++mtKu3ijkSJ+9lHFPbJAH0gmB06x6p4XvxarJxn68cohTMr7Ciq
	eNnU+UaHqZj28tHO6UriiDbgyvl84wWnzFHWBhZjVQTz2n7d5pl9yUGSx8Q5Xgax9Md+6ftOfb3
	P6ngy2bxNq4LM
X-Gm-Gg: AR+sD134LwOM3abbRoCHf5GGfhHtRXvrv6O0+qUwvmWRSjtURfqX2GinvpwEVly+XKp
	0kfqDxHwTHU/hpzRCvLHa92kYCdAys2sU5w5OD/7AHftuXdCytE+FfTU2rJWgQaHnvi4McoIWjz
	K0yZWp2Ggw7D+AACulmBxqf0tYfg8MrVVuq7k8ind4YarkfNL3jJCtJgkCyu7ipPRFT/unu/r+W
	b9qCpSLSm21TK8wpje9ZRygg2BaAGZk0DISZ1aqbLT6A0aAfyWcRyx+1+psVzp3Hq3EjrpcTCLt
	VphQ2HXkE3Bglf6bpCZu94vG2bJPOoyUAA4QjQoXgHFroF03ShlwwOvBZQ0jHhOPh54OVHHTtD8
	FJXvbcF3NpksHVnGZ2ItmLYMhijjnKGPwZ9QTY7j5VqQ2DP3JujeRIrsHRQPhusjJ2XCELJtExg
	Gt2Pb0bwuP2E0ycrNQxo/e5D/U5KpBwiuSkqOfvYutrz4Qm4FwvWTy5Hvi2j1lVXUhaMLhC+sEO
	8dOnzCfGRguOLNX4TK77dZX/th+i0v6PF7IY7DEhmId/tAi8jpNIKHITJGRrSYyKLyc1FCxjlqa
	WvlPGDozzw==
X-Received: by 2002:a05:6830:6515:b0:7e9:e709:44f6 with SMTP id 46e09a7af769-7f4afa2cf94mr6453979a34.12.1787665287764;
        Tue, 25 Aug 2026 06:41:27 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-56.totalplay.net. [189.203.100.56])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f48f903f44sm6889965a34.0.2026.08.25.06.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 06:41:27 -0700 (PDT)
Date: Tue, 25 Aug 2026 07:41:25 -0600
From: Tom Rini <trini@konsulko.com>
To: Ian Campbell <ijc@hellion.org.uk>
Cc: devicetree@vger.kernel.org
Subject: Re: devicetree-rebasing history incorrect from v7.2-rc1-dts onwards
Message-ID: <20260825134125.GQ523975@bill-the-cat>
References: <fe88ed4f288c261373d2ad7184f470a8ea19ec42.camel@hellion.org.uk>
 <c0ef5f140cb5e4e1b953b42c3518a5a432c67a93.camel@hellion.org.uk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0ef5f140cb5e4e1b953b42c3518a5a432c67a93.camel@hellion.org.uk>
X-Clacks-Overhead: GNU Terry Pratchett

On Sun, Aug 23, 2026 at 11:41:44AM +0100, Ian Campbell wrote:
> On Sat, 2026-08-22 at 10:35 +0100, Ian Campbell wrote:
> > I am looking into what happened, once I've figured it out and fixed it
> > I will force push v7.2-rc*-dts and v7.2-dts tags as well as master.
> 
> The issue actually occurred between v7.1-rc7 and v7.1 where the rewrite
> state tracking file got corrupted (loosing the mappings for every
> upstream commit sha starting with b!). As it happens there were no DTS
> commits starting b in that window, so v7.1-dts remains unchanged, only
> v7.2-rc1-dts onwards had problems.
> 
> I've just pushed the updated tags + master.
> 
> Updated refs are:
> v7.2-rc1-dts: 09832bf2b0b2e0c68573cba8b0fb7a8e44e1f549 -> 607f3ab2da8d12e1f768681837d0148e1434f4f6
> v7.2-rc2-dts: 9e215244e26884918782c9f04edbeedc20423900 -> 15747534cdf8337d5fee021aa4460349289163df
> v7.2-rc3-dts: 86f4635ad4ec0d3f357dc343abe987cac59a0beb -> 6df412888270fd1e722415f96f9521030ec8a54d
> v7.2-rc4-dts: f2fb2d33ea008de172c130de0b42e2a0d7b37239 -> 1fb80695c541c7e4efd067676f14b43af568f33d
> v7.2-rc5-dts: 87ccaa2dc91309bb5358d39873f252cea79561ce -> adc5edc9140c341a7c3f46b3230e4ced158cc42b
> v7.2-rc6-dts: 7653fa238d797bcfcda9fdf57ab9192fb8f93341 -> 584cbdf196048458bfd6c0b4d997d1aa4020dc08
> v7.2-rc7-dts: d8f117c8aee92c4878efd4d17e47d3a1e51e6b89 -> e5f14f4c0501a6d4013513ae2f76f6fa8ae26976
>     v7.2-dts: f4bde8516d3849987e02e62411e85a6c10c8f239 -> 41930a1eec9ea89c684a8ed95bf8e147f636f10d
>       master: edd49c1cfb49fd14165e83e33360c789f23ce39e -> 1826bba6fb1c8c0b6d845f8308590dcfd1f7f859
> 
> v7.3-rc1-dts will be pushed as normal.
> 
> I've added better error handling for failing to save state after a
> rewrite iteration as well as a repo size check before pushing.
> 
> Thanks to Tom Rini for bringing this problem to my attention.

And I can confirm things are looking good on this end again as well,
thanks for digging!

-- 
Tom
