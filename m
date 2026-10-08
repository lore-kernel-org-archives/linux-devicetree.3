Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B7A306768
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 03:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431552; cv=none; b=n7I9WHlktYKdwcGZ3qsXdLSbLZPg5j7HLnytmTprsKIOGdMXRgRjjul2uCxTypLBNG3hU88GwBx6H/m/IDBg8WjAvZP4ijCXO1NMc3TUdpoRZ9h0QUTwKXAR9N77hfd3bZfRnmLJBXqqlFIqc4dna7a/afsX+Px+gCEpSFR+kpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431552; c=relaxed/simple;
	bh=+S7+6b0tE0OmnLFC+QstPEqY3o50EFg74OIiryzh5ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cb8IFaMFp6ZdQ12qtT3Wm7GLpBQ0S5VvWmu3qmYqsNqycfRQdj49M1QQITDuBAdYEEoPECcgOL35NbdWYEubbIr9aKBg5oEHB7oyQt0gByZpaPkBE/wQZ8jGMdujWqgSeV/vSCAACK7IWCdwOYzfqIBTR0WTHgp9mrKOEwqLls0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c+JIULFa; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c+JIULFa"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8897e83332fso108426b3a.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 20:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791431550; x=1792036350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vy0poknliGswHcpdQnidx1yFhBPlUDC+lTCKJfWkmRg=;
        b=c+JIULFawh9O9VQ87fwLeM+LvkiSl70/x6DXs5EcnJs4AIMY1GEWJp8ObgBPZGJB4x
         Mv05UncODjqv2XyRjoBKQVbMrhjwEpgHXgw9TY63vhs/aUwuE3SSQTJZSrZUcCc/8UiJ
         ddvf+4LXB6MROmkpIb8AqBcLQdRz76QjzjoX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791431550; x=1792036350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vy0poknliGswHcpdQnidx1yFhBPlUDC+lTCKJfWkmRg=;
        b=MvJKmlsvwFQqsN50l+cwuddOCgDSF+pifiEQx9cPmFhFdMMCGvJcnPDsrz5caiVVMs
         3XvGccVA4+FWgTRRyaIwasE2sZnA9lhno+5q1nU078rwqWZUhCxiiul1U1atfsFUn4m3
         izbMb5iMGdrz0vazOH44QgQj9xBwSe3Wsp1opONacT6lLCYg3Z67TDGnTfV5nLkex1Iw
         0oGTEe4P2HQhwQOm7jVm7mviapip9VwcfmVVM9ddB+OgaR39vL6te8XgbuTOGw8chxnt
         U2oqshQN6UDBVc0Tb5Ydwq2pMlzp4r8fTcS/9AbSLukwI/h7Lgyqxun54wE5RwqIHw5A
         i6Kg==
X-Forwarded-Encrypted: i=1; AKwUvBw7MY+aLLbuhz5iVdCk9YGSlhHDMc61HIUgbQl6UlWs+sDLw+0vKAenWz/myOCP+4kt18NMQuAvsfEV@vger.kernel.org
X-Gm-Message-State: AFq9FYLUL0R24uu2Cau/ce4WTHcT0603lJbnlOD+uqwiRArVaCEd/amx
	yy7IbJfTUHhbZZJ5aWoy4GxozNqmApcv+Mp7Mf7COZW2CK1Qh/BtJvD4Z7pARg7Xjw==
X-Gm-Gg: AYBFou32v6ygtzmj5yJkcFNWPnDyYh9zsUENWpFK3DhW31MHZO79fbFdXsuGmTr4eIV
	OAgiq6JslG863V3MQxiCjpHVwx+PLc+fE8IK4WyeXf+gIOdwXT6X4zb7D1vGyU6snEaGsyuZ6NT
	hphhg1Y2jJ+GGZTgt66Ihuo4MwrrOrtshDGDiMqAPFpOoTCenFuACUlwkdvO1hHdptPgBCkZKEb
	WLiD4NtK2DFA5gLNj6eqe4t8XOnRjJfhsrKwtgKvhBFq4Vxxt65QTTZ8NGFuO6CYlW2Rb2SQtFk
	ruYeSxPv5Rxv4tbtkso+3/cYmE4SI5bQRU1XWJfDRG5CZ3XrP4B8TUjQoq5MBGE6gcoyp22Cs9K
	KNCuBeLqWV5boDE8QaT09eGB9Vpm+0f/pc7KbyukrEE8hrKSQD3ZnHpaO7kKBSvWewcvUXwMbiN
	6VKURVv71whJr8U3teileMUQkuLUDHz4KtPkDM5y6Hp0vIWXbk/es5sfu/DBJnH0mznXBZHtktR
	WGpVpxZhWe0RYyY4kFJJ12Sw4dJRrpt8iO1pA==
X-Received: by 2002:a05:6a00:4b4f:b0:880:f22a:b123 with SMTP id d2e1a72fcca58-8930d0045e0mr655238b3a.36.1791431549972;
        Wed, 07 Oct 2026 20:52:29 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:97d3:292:91b3:138d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bb49a188sm977281b3a.33.2026.10.07.20.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:52:29 -0700 (PDT)
Date: Thu, 8 Oct 2026 12:52:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Georgi Djakov <georgi.djakov@oss.qualcomm.com>, andersson@kernel.org, konradybcio@kernel.org, 
	abelvesa@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	minchan@kernel.org, axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	djakov@kernel.org
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
Message-ID: <ascS2nPCSQJxOGDS@google.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <ar3yt8Kl3WUV93lP@google.com>
 <4ed3f09f-74fc-4f07-8897-5c773fbde0b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ed3f09f-74fc-4f07-8897-5c773fbde0b2@oss.qualcomm.com>

On (26/10/06 16:53), Oreoluwa Babatunde wrote:
> On 9/30/2026 10:43 PM, Sergey Senozhatsky wrote:
> > On (26/09/30 07:52), Georgi Djakov wrote:
> > [..]
> > > @@ -80,10 +87,10 @@ static const struct zcomp_ops *lookup_backend_ops(const char *comp)
> > >   	while (backends[i]) {
> > >   		if (sysfs_streq(comp, backends[i]->name))
> > > -			break;
> > > +			return backends[i];
> > >   		i++;
> > >   	}
> > > -	return backends[i];
> > > +	return NULL;
> > >   }
> > 
> > This hunk looks unrelated to the patch in question.
> ACK. Will remove this.

Thanks, if you are going to add qpace zcomp backend, please note
that zcomp API is undergoing some architectural changes [1] (shouldn't
be too much extra work to adapt.)

[1] https://lore.kernel.org/linux-kernel/20261005122036.718976-1-senozhatsky@chromium.org
