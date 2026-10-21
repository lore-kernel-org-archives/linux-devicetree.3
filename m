Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591642;
	b=Cb1wBlH12zNFzn9ppDTkQkTi670HKTuONe6d9YmqIaxaJJHx+EGxSHWqUqkmaJZkOqp5
	 hHBC5GvDxVJwf4LPr41S+GDg4K6wLxTKMnk+0Zff72Vp3ZKHgrQUr4XwLenhr+ODQhbNF
	 nkrnrOsPZM63E/UY9UJqbYbUG8eYQxPMXwzw/BucU7fyzOWWXfU/6L/DuW6i3rtM2+NIb
	 5R0Cd4WyzDlGCBmHrK4kimJkaM18TOuzWcQXaOPgnDaRfrHTOoRzF1am4tcMDG+I7dp2a
	 4gMT9AZPgIahPev2925WeuvvUXAFdmJhBdQEMlLri0Ky9Skwf/DgsKZC++GLvYApKRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591642;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=h/tGrN3vAXkF4xhrgSHBlBodyDLosDfdLftjO+4g2gc=;
	b=jJjnPJud1zPnpZNfaNohiCdpRX5SIB3S1ERpdT+ulNgXM5QaFPrCGVRyJwgB1Jmqb895
	 YzFzpPqYyOufglNPhJBAvMVjnWRJAZP1gXCcrwsi1ODBpr5A2CIjcYpd8Y9Zs53pmk4oG
	 W6U4BzCoG4FEi8jTv3n6NjUbd0iqqYc9OFTRAUIU8Nu2ELM+uGzDW9nqcEZhxC6IspKe/
	 D8D8cAk/hmO24obJZykG5vvgpdUUmzpjfutF0NevC0i1f2d6gbuLPn65/uTPGwmiKbbyI
	 y+sRlTAgZL0ZpRsEj4nGkBLnwzYN3eo2Z4u3EHNbp3Yi+SVovAMZ6QbnW+UyeDx9BkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cKxGnFIC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ICya3PFH;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995F0606A322
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 995F0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cKxGnFIC;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ICya3PFH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792591640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/tGrN3vAXkF4xhrgSHBlBodyDLosDfdLftjO+4g2gc=;
	b=cKxGnFIClWugHa1o1xIB/ztnJpY8dNxh9TuaXeGdMWoTz+C8tXOeCxiiGFYg7WZZWpkvKe
	SDgqUiopr3lCVkPaF4j8fkB40MGr52DQxBHIWBGFUaBWBU+0t+//6rFFusCayLRDnH9lqN
	7JqJsCtj6lEC2ELxgHDJlvb4WZLXYCs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-TLyMVfpZPpq-PKqWaozWTA-1; Wed, 21 Oct 2026 14:07:17 +0000
X-MC-Unique: TLyMVfpZPpq-PKqWaozWTA-1
X-Mimecast-MFC-AGG-ID: TLyMVfpZPpq-PKqWaozWTA_1792591636
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1e672580aso5780175e9.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792591636; x=1793196436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/tGrN3vAXkF4xhrgSHBlBodyDLosDfdLftjO+4g2gc=;
        b=ICya3PFHeEiJVbCqIlM1d3igLwyeROOovbEBd3dIz12J1Fowl2gZUgMRvhhvjYS+dN
         3etkTZmimg37gv4VBGJpB/mflkHWBeuHFPADjBxMVcH6VysPITL/9DYKWtBB6mDmFgXN
         vhCxfJrQpJ+kpVwkGtKHhSO5cm5/47v6YVex7i5w+bqWtwu/tKFwfPKEZZxln2pG9cN3
         JYbXRJoPACLsEVkwFAmQhfcoMvICudpi8qKPfLLrXrbjin+F6Bsl9YCQeKEJQjSnZ9gx
         pT+hEw8A85P+42Xftxt9xGiNJL/WMm2lxfSWHGRqEnlI/VMqeu935m01Ot94gS8As+T4
         +MSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591636; x=1793196436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/tGrN3vAXkF4xhrgSHBlBodyDLosDfdLftjO+4g2gc=;
        b=sGFy+OTHMhDZTQs3REh35JH3Optqqoc2y3wU5iL6AdqlZ9U9RifxV9Nrkk3npghcxH
         ry3U6+mg27+8yS4tSSq1ijrch7+LxlQTjxNEgNIsH5DnM9zkN8+2vl0yOECYipSXzUIL
         iDVgVVzbv0kliMql07smwSqSj5DP8wltb3H7/60AewzpVGTF5x6t2PiUFjxdMolz7caq
         6oKm6lFxYNLFH6QVDcpkdVKo7sanpvWbLJZU8QOD46JrfcxDM08lyFUEJBHdSks8zM/1
         C87iGW5r3SCYIsnKQvxhBV3/TLFed+TqeY0avXCvqmPqZDL9RSBA7aSfMCgm4/ho+tPF
         3ong==
X-Gm-Message-State: AFq9FYINZz/7HwVeT/NA6BARjmo+LKfNSgvMldjlQqDTMcKMV5JcUNm0
	MyGlvHP1p9QyOM+226ZT+Gm/BdI58eZkf4hoLwNAsEndefTA3i/3ohHxaCOcAz4KPtMwxG97eZf
	665oVIEHAvr60QUqVcv/e9O5QEXWYpJ+co3vLE9R2UJDjG8OEhFjwz0nBw6Oq+7I=
X-Gm-Gg: AYBFou2rjmzIU7fOex77HqZGf/Nay0y27QZiBQWfcU5yx1Px8Tae+++ONe4PBfNwoQV
	dk6nr1eUn/c4/BiucbWA1ewO1OpS7gyZg8IrghfUsc2GDY/8eqxOBl/hY5/I9yJ9rwBRDHLuL6e
	a7sLToJcOndsHCbgQnRmH+qICrCZFatI1+28/l0ZQy8hyQsQGKai14JQB5kZ6nBkhgTZ9OGlg+4
	qOCeCqLb64UlQtg6MKNc2Vqrn4mXNVphcTciZGGWnElx3pRJJgRGj9xiOhGw4JWfTv3SYpEMjWY
	IX0fGMXtUCqKOvgU5Un8uKfbZ3sgu7Yddt+Bir+tUHkIH8oojKvc7DwZ4jRz+NjBLozGTtq836y
	GGcVru1gEqASqyKWAR2EY/Ngo+mbtiKef/fswqWb1ZLUcap4WhUI02cIsannIqVbzuKPVE1K0Yw
	==
X-Received: by 2002:a05:600c:3f0c:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-4a1fdd39fbamr45861775e9.28.1792591636236;
        Wed, 21 Oct 2026 07:07:16 -0700 (PDT)
X-Received: by 2002:a05:600c:3f0c:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-4a1fdd39fbamr45861165e9.28.1792591635848;
        Wed, 21 Oct 2026 07:07:15 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fe5239e9sm43986055e9.0.2026.10.21.07.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:07:15 -0700 (PDT)
Message-ID: <08a71c7d-d5ba-48ee-b80c-7997d07e6e22@redhat.com>
Date: Wed, 21 Oct 2026 16:07:14 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/3] net: ethernet: qualcomm: ppe: Add IPQ5332
 support
To: Til Kaiser <mail@tk154.de>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org
References: <20261016152449.934312-1-mail@tk154.de>
 <20261016152449.934312-4-mail@tk154.de> <sashiko-outbox-175580@kernel.org>
 <c40f4d8f-223c-441b-901e-5bea5bcb612e@tk154.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <c40f4d8f-223c-441b-901e-5bea5bcb612e@tk154.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 20:37, Til Kaiser wrote:
> On 10/17/26 5:25 PM, sashiko-bot@kernel.org wrote:
>>
>> [Severity: High]
>> Does ppe_config_qm() calculate the multicast queue register address correctly
>> when queue_id is >= 256?
>>
>> In ppe_config_qm(), the code calculates the address like this:
>>
>> 			} else {
>> 				reg = PPE_AC_MULTICAST_QUEUE_CFG_TBL_ADDR +
>> 				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC * queue_id;
>>
>> Since queue_id ranges from 256 to 299 for multicast queues, and is not offset
>> by 256 (PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES) before multiplication, does this
>> result in an out-of-bounds address calculation?
>>
> 
> This is the pre-existing issue you identified in v1, affecting IPQ9574 as well.
> I submitted the fix separately to net:
> https://lore.kernel.org/all/20261016150140.929729-2-mail@tk154.de/
> 
> I could also mention this in the commit message or add the link to the net series
> in the cover letter.

Please note that you could/should ignore reports from the global sashiko instance,
and look at the nipa ones (clashiko)
The feedback from the global sashiko instance is incorporated and validated by other
models (which already discarded the above concern).

This series does not apply cleanly to net-next anymore. You need to rebase and
repost. Please note that the repost MUST wait for the end of the merge window.

/P

