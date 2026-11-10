Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289167;
	b=AU/9ITf0sTq3kLAiXkqvSiEk7vhy0/ZKTZZuGBLxoPTEYDA/lJDLOgFy52uBTr8KUjyE
	 3jVRIoNonBzaKfh7pqlsOA35bzvtqvOc0jEMy1Uz3LN35bXmw0HbD/7IpVD2CQ4u2quiL
	 jQuxTffgG6a55Yy/pDCNBlgmCq/H616CI0kwvHoF5fpmGldkP95bWI1b/8FtDZ/jaJCtW
	 oWlxskbsoM5PPWPD8LZ3zknpUMaJpL2INWjbaZNJqGTyQT7W4lbgGsW3YiudXuDsvXWvg
	 D8ZSQNlTRNurfSb9kXoCm6SQQhqRUh5BBT4ImxTpB/Mp4kfmOMKmOgCsaFUp2oYfNMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289167;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NZXjw7iHdBYOz25+dloLm4rv1gSDvBYEq3SFSQ7c0Jo=;
	b=S0n0Zwc2VG7Fghf6BWvPpo79tgTQ+VMBsB8lT5Af/FK0xvyvevwFdTyYs5HUALtEaJ7N
	 tSa1s7/TEbI8th5znMc8ca0I+rqP1UMx/tJ0APtqwCiO9BXx+duL8cKn/I06u13dQn+9u
	 XgM5Ql3PP44304PvdfDrP5nxLDHO9FNeO/2BCJD6v3nTuL2dvQfH58WW97Qf9FJ8baaRz
	 x2Rb7FDCxcxePCfgy7aQW63wVpe7lklx3CKr8+63Gkfbm3w9f/P2s2LyOnNvFtj4eiJhZ
	 AwWzmupDcYwMiECPf6Bq0oaALIYPtxNGB/zND0cfq1pox7RtgsfQoMC4FveLtXQPaPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q11nkyxb;
	arc=none smtp.remote-ip=95.215.58.184
Received: from mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF03A606A325
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 05:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF03A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q11nkyxb
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BeEpc+Ak8iIFPGrajMqKB8SxEGKljrqyyyjENWLZtvI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794289164; v=1; x=1794893964;
 b=Q11nkyxbklIE7a1OsVUnYsONQBP5jWofJRTEVU0/oWy+6WSrq/bHw4x4gRHBRY4SwsaMdsdp
 BYsG96ilsPlaO/d8VUJKJvWIkyJmkfmLe/paVGp/pwYf1d6FqQaeKKoZepI2k692UO0FCFZgp8r
 Tdy50+7jtPYLV79K5wddcwRs=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 13f18eadacae033a;
	Tue, 10 Nov 2026 05:39:24 +0000
X-Mizu-Trace-ID: 13f18eadacae033a
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 05:39:15 +0000
From: Akhilesh Patil <akhilesh.patil@linux.dev>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, crofts@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
	akhileshpatilvnit@gmail.com, akhilesh@ee.iitb.ac.in
Subject: Re: [PATCH v2] MAINTAINERS: Update Akhilesh Patil Email address
Message-ID: <20261110053915.GB2506228@u5ce4748bae3b54.ant.amazon.com>
References: <20261109063924.GA118887@u5ce4748bae3b54.ant.amazon.com>
 <20261109104443.GA531570@u5ce4748bae3b54.ant.amazon.com>
 <avG6iHBBDp0ATTsi@ashevche-desk.local>
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
In-Reply-To: <avG6iHBBDp0ATTsi@ashevche-desk.local>

On Mon, Nov 09, 2026 at 02:20:24PM +0200, Andy Shevchenko wrote:
> On Mon, Nov 09, 2026 at 10:44:43AM +0000, Akhilesh Patil wrote:
> > Move to my new linux.dev email address akhilesh.patil@linux.dev
> > I plan to use this email for kernel development going forward.
> > Also update email address in few yaml and driver source files.
> 
> ...
> 
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -1030,3 +1030,4 @@ Zhu Yanjun <zyjzyj2000@gmail.com> <yanjunz@nvidia.com>
> >  Zijun Hu <zijun.hu@oss.qualcomm.com> <quic_zijuhu@quicinc.com>
> >  Zijun Hu <zijun.hu@oss.qualcomm.com> <zijuhu@codeaurora.org>
> >  Zijun Hu <zijun_hu@htc.com>
> > +Akhilesh Patil <akhilesh.patil@linux.dev> <akhilesh@ee.iitb.ac.in>
> 
> It's not a rocket science to see the order in this file...
> 
> -- 
> With Best Regards,
> Andy Shevchenko

I missed the instructions in the file, Thanks.
Updated in V3 patch.

Regards,
Akhilesh

