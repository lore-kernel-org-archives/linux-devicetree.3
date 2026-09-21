Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146094534A9
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981626; cv=none; b=Tk7+Z8XLFPA9DTPhkMivWmNqSrD9Bgj/LIP9sE8vqH6b8H0bWQRJeWZvdn8nu587O95PEXkt1HPP58iY9Khc/e7BLQmkIBoLshY29HOhS1iK3zFcz/jWwdUawQHRuyrKyoLSvefehVUzzrRpNNLQgcRZjwqtK44qomMQHWlspCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981626; c=relaxed/simple;
	bh=iDIhe959ua/SikBJ74bK34sKU4nfDpfOT2s06pZ7mig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBEn9uVeQIRwu7cFwr355SpIkAdsuD//J1eB0cFbGojLFX2GwaXNeqf3bi0KL9SEVtvcNF9fuHetVOGZkE0abNQtymxgrxhxj385r/tDdazdiB4PKTdDmt577eUUQoTBGAWKHiHjooJjp8oH4y5Ix9dvZIx898kxUiwNXHR3Axo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=LcELMFTc; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="LcELMFTc"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso1609380f8f.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789981623; x=1790586423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2+7ioR7GiR1kYXn+2PMvzz5CAFkiiDN0weZk3Op38I=;
        b=LcELMFTc9uCxsSJTqGY/uWTl8h54WwZk68BjEP8XitQPa+JtVy78n+pzQSDaW+gkE0
         GMh5qqobPeEZB3tmcS/YexxustrXGFzm2S/n8rHeT6pQINeSusjVySCv8xVQuz+zO4Ev
         9UFJ7R7lb5RO8ai63/xIRLaDj59wdBfmtY1Y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981623; x=1790586423;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2+7ioR7GiR1kYXn+2PMvzz5CAFkiiDN0weZk3Op38I=;
        b=YDZwLMZpalrUjQtUwcNJEIp2mhfy6eU4w6CwcQ886pGSjzzmPG5D3yNcrlc0xKstoQ
         gcc0zUf42eOzqnZmRDRbOOYKSh23KNqd6R493SW0lmKxXjI1GMFFt5dGO/IfKCFPzjsv
         E28Ld6fH6dY1cyKSa9hO4WNCAGd2P7TgxlrbFvMC6pzBXYAQijj6wNwTsldTEdw4cE/k
         0KWLSrLRrHvX4rslyMjTO1S/CyUAfEdj0DjC2dSgw/eo1bZ9il50zqBWSFLgLCD9KhQ/
         ZEutomr7uJE0hTPeBMxdvRzDTrns2Kmykbz4byVAxfgpcJYx0xfJnrYbM4t++Yorkmdk
         EX3w==
X-Forwarded-Encrypted: i=1; AKwUvBx660G342HYJpUIMZ0JpxayFIKo0bdqpQg2RcAOJEC2nZQMKvvzh9Nvt5QL1ypGATn95rOi3YAU1cZg@vger.kernel.org
X-Gm-Message-State: AFuF++k9bP8Hf6wj4hIvYINIfTQPeKukQ6wvleQaWu/w6FWpX7iEG56y
	xVYrqB0bx8FFxzwPCwIhyWZuzC7Ya2AQizz2nHprTl4axDqQTnL5ZgYmjalKvNhlOcQ=
X-Gm-Gg: AYBFou1xdqjTNADTbXF9QoRCD5gF80Yxcqoviao+BfrN59SikgfUofbMnR1ntiimNNT
	EMm09m4P7lmPUuE8t9mPnUynRJ+2wH9lL6KaqbC+IXF8Nf+HJg0GYsjB7V6AhK76mbNVJnCvDIO
	ZZN/PVQUDh+3Ls/8u4oZ5R4XjHmFR5WFc6VfCne2UXEmu1TfE6r7BXHEVLIF+szb14XGHc91+qr
	Ir2tFOh/kSna+yFlvyVouDbIZUlAHoKQE1IJhLAUXCykzgerRgPTNvDL91P7WuvoJ06nbV9xIcr
	YGxp6lBwFHTMzoe22QcWR5v1hqH3h/rf0wwsnMwV/ye1ZUmJQhg94qHftgJWah1phEUvbkpZqlg
	fc4FcEm5qOA4AernjcHOifSYp+PpTCaHN+7kBrPnC6NhsuLH3ETynMcEfoRWKBdYQpSNSm0/+nh
	MK0zKCVNV7bd6GNmE0QcKIAY1lDUkLJWXudo7rpDf5XFJmNjriMqkI28vIlFLuxlxrQ5rW0njJq
	gXorxUI+L5tWRwtZrb6
X-Received: by 2002:a05:6000:4287:b0:487:f37:7ece with SMTP id ffacd0b85a97d-4871dfacddcmr20021033f8f.0.1789981622977;
        Mon, 21 Sep 2026 02:07:02 -0700 (PDT)
Received: from cabron.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487245636f2sm20225040f8f.17.2026.09.21.02.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:07:02 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:06:59 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org, arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com
Subject: Re: [PATCH v6 3/3] arm: dts: altera: add Draeger M48 CPU Module
Message-ID: <20260921090659.GD14552@cabron.k.g>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
 <20260917163157.1380860-4-petko.manolov@konsulko.com>
 <20260918-strategic-hairy-kelpie-46e807@quoll>
 <20260920075924.GC7878@cabron.k.g>
 <042c39d5-0642-4bcd-b965-61fce77b52ae@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <042c39d5-0642-4bcd-b965-61fce77b52ae@kernel.org>

On 26-09-20 11:52:36, Krzysztof Kozlowski wrote:
> On 20/09/2026 09:59, Petko Manolov wrote:
> > On 26-09-18 13:57:22, Krzysztof Kozlowski wrote:
> >> On Thu, Sep 17, 2026 at 07:31:56PM +0300, Petko Manolov wrote:
> >>> Draeger M48 CPU Module that is built around Altera SoCFPGA.
> >>
> >> How can you run a CPU module alone? To my knowledge there is only one such
> >> case, only one exception, and it was explained by the authors. If this is
> >> second, I already asked you to properly explain the hardware in commit msg.
> > 
> > I've described the board/carrier/module/whatever in the cover letter.  When i
> 
> Cover letters do not matter. We don't read them and they usually do not end up
> in the git history. Your commit must stand on its own, not rely on cover
> letter.

Fair enough.  Shall i drop cover letters entirely?

> > put the same text in the commit message Sashiko rejected the patch on the
> > grounds that there should be just one CPU architecture there.  But there are
> > two.
> 
> Sashiko cannot reject a patch. Does not have such abilities nor power.

It does influence your decisions, though.

> Regardless its comment was right - your description was between incomplete to
> confusing.

You do realize your comments mostly criticize, but do very little to actually
help resolve the issues, don't you?


		Petko
