Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591912;
	b=zdiyjRIqoxrV+si3VdPSmYElgLtME5MXsSf4equdRswucOoVZRlKU0d+YGXuxFO5q4O4
	 g4+Z2oIdVLfKN5lqBGXzoRnoPaVD5ow2QUNOdNyqgouApNWaAmU/iocRlk6a9gsSQTfOB
	 8nmzq4ycBQKeg6PcRUqwfz7+RA7uhJTARPOpF0xiNY0bFvH8NczbANgKQXVrWOA0XqObA
	 Bxy9aoKB1dyL2UtFVV3pC1iDkV8LEVFixLae6uYnXTWS+Abn9vt55qHFdsYtDYScRfbBH
	 QgYrS8X5pex5E6QefThvM0Q66CFEUkEjwVpQJlSFp9n6ZKM4v3pR+kA0dhmMn7dCdqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591912;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=DQoRVtL1rIECgPFKDyXfClZIANIPEM74LIvbEMBMv+s=;
	b=mMnFo9CEbsp48NaiZ48Z58AFTUChbhz91UQzoJgDPvpF60n21HNBCz5BNlJkznAsXe24
	 JpEBmBFbWrBF/Y8P0emgMjvAopNx7tQ8FCXaIB3GHydJ/ZhrceAfoivY/Fhljw7TpEdI5
	 ekSie6kvmpw8csURIKD/DcjOrH7oAIU9Y3RAqj6ZWkIu8HwJc024XAv1aF8l1azR7uFE/
	 0ixsJi+VJcSLHBfi6ntr9zAnxFhqVDaIk44U9D6DKtZD4EEcwSBzxKLCJJFAleyUKWblT
	 ZiEpzmsoUgOLEnpBVCYfWTomCcoCNa9GM+fCHhZ5j4o3+rgZXLz5Z4edBS9xypq1CfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="b5/gtSJ3";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pss0aYuc;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A33606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A33606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b5/gtSJ3;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pss0aYuc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792591911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DQoRVtL1rIECgPFKDyXfClZIANIPEM74LIvbEMBMv+s=;
	b=b5/gtSJ3x7PfqMK29ljS4m4zElRPFT+HnR3KNaKta0CaHazB4OduyCH71r8ZrNsUNDx0RE
	KoDSfEKAqTg3ITzmVy98xO7P0b3DdIAIYIqeXM8xWUXl9UrIpmjj9lhYetM5IjRSxZ/qu3
	jsWjrpYA1qKklEy1Q6uYsaxQtW0XQJ0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-WSgRqBTsM8yQP50qOcU3Ig-1; Wed, 21 Oct 2026 14:11:49 +0000
X-MC-Unique: WSgRqBTsM8yQP50qOcU3Ig-1
X-Mimecast-MFC-AGG-ID: WSgRqBTsM8yQP50qOcU3Ig_1792591909
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91961d4b31bso18647236d6.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792591909; x=1793196709; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DQoRVtL1rIECgPFKDyXfClZIANIPEM74LIvbEMBMv+s=;
        b=pss0aYucAiSo81W8btFkKaqfv1i2414u1+VymcNjolAJT8GPgnaXRRWz8KmJbsyuu0
         YTeDyNBulnjt/vBcwA2pSgsXt9DOnwmx9D2aU+dpuuGTRZV/B3rFHhtQqH6n1nM/DqwD
         FJH/rly/RStrZFTMzShMWAZdudz4B1MT3OZwahi7Xrsfyb7Q43CkPIphfxn+fQau9f37
         WfOU/bHECiKqLdXgDW+gAH/Rcdk1O0BeBE/t5JK7+hm19DIJwy8mZ4SwOM6kuP4fHD4O
         DZzF212z7T70g3REF9wyRxivfQ72fBHPYyRJNG8955unsDGDuIqcZTmKFO4/jn8JbQ+m
         WByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591909; x=1793196709;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQoRVtL1rIECgPFKDyXfClZIANIPEM74LIvbEMBMv+s=;
        b=bE16dwY4dEjWEz+NIVvMiv/CY2A/TvpgSj1n/UcpgP6LK2yqF+V/eE5BTkOIz1nMst
         7v1BHw1Qpx9+p/K7LqspCgmAQnd+QLSTPmFJ/fyCO3IDiIb71g/PA8oYan0VqWS5Jzqf
         ygjsSQ5hXYr4xnWRaxuU31FeotB0hkTqxULm6tMdg/WNppf90VoR+BeG1cvNFHuSYHqn
         O8Gz+3KkhSq9mP1MSK6tJfEPyGrrXFLJ6C0pr7B9u7CL6roGk/ZRA0cX/sXCBaeEzl/d
         c2eoXH7tedQJvkkvsVn5wRIzFzlr8roka6gOE/LoLjycRpBN+bRCHpw1NKn8dmFALd6p
         tQoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTnKGHvVZO9qouPUUqaoAxO7sR2x8yyAf6t7WamlXWjyse+xgkyFsyj9JFYU70U9OYqzE8oHpCv9dZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKgPHREOj6hH1sGoT4Yg8ODc8ibCQEnx4wExbUb3up+nobcRvuQ
	miYaSX5Rr4c1kgqZkEMHvcyK7jyg0sgtPZSE/BV0m6CwEyg9/3LimUNsOpcLoPZeSL4sjTpLZqY
	W3kNIpszU7K59+RA6v8JKBHJObeOJ0fsXlxn+g4EqnTyWQAmA8oLEaP8liUjCWMY=
X-Gm-Gg: AYBFou3hzy99Fvlb1OPlh3IYP1P4Ukxk1S0XgWcllELiJ3q8gBMXSe49oXjypf0EXAt
	K+AQnZE1zGx9cDkehASbnq/AxYHNmi1XxdOimGR0ifaH+pMDwcEi/tXnAZlkNq4nYQYnp+iLALh
	kJtnmvF+VvBlcqLq3PK7juz9Gbd/U64NVfNBWLqQATPGs9khrSXVfPXrmw1M3b82HkRx6JTSgpg
	uqre3ypJElTpB923gwqqcl+DRMB8XrgOZOaG/YUYMkFreczM7UxCvYa2SIbBP+5yXnJNW4ehAsz
	5y/NqDgK+2bfPJly//dlH1bjMyjwP43usoO6fqXu7RFLd9F2IiOZ5jWazYyKjs/U2R4QhFomMhi
	nWxRbCs1o9d+Hjvb8S39aXn+WmXdWtseLZYDKYuIFQQcS5y4tAc583bzKZDGgVv6FIa0=
X-Received: by 2002:a05:622a:888b:b0:536:8ac7:3936 with SMTP id d75a77b69052e-5369b8e6a57mr31496851cf.61.1792591908931;
        Wed, 21 Oct 2026 07:11:48 -0700 (PDT)
X-Received: by 2002:a05:622a:888b:b0:536:8ac7:3936 with SMTP id d75a77b69052e-5369b8e6a57mr31496191cf.61.1792591908163;
        Wed, 21 Oct 2026 07:11:48 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10f38a6asm24903486d6.29.2026.10.21.07.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:11:47 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:11:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: Use v2 rate calculation on i.MX8MP
Message-ID: <atjIIHkoNwBVDO5b@redhat.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
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
In-Reply-To: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Miquel (and Jerome),

On Wed, Oct 21, 2026 at 03:09:56PM +0200, Miquel Raynal wrote:
> Hello,
> 
> Thanks to Brian's series, we can finally solve the problem of rate
> calculation faced with the i.MX8MP LDB/PIX clocks. I've tested this
> series using a v7.1 mainline kernel with a lot of unrelated DRM
> patches. I then re-applied it on top of clk-next after fixing the few
> conflicts when applying Brian's series, but that means I cannot (yet)
> run a 7.2/7.3 kernel on the platform (and applying this series with b4
> will fail due to Brian's series no longer applying on top of clk-next).
> 
> The DTS patch is there for reference, I don't mind if it's not picked
> up.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for testing and posting this!

I know that Jerome would like to see some changes to my rate change
series before it can be merged. I'm going to probably poorly describe
his concerns here, so apologies in advance if I miscommunicate this
Jerome. I'd appreciate it if you could clarify.

- Currently the latest version posted (v8) to the list has the LCM
  helper (clk_hw_get_children_lcm) in drivers/clk/clk.c, and the LCM
  helper should be in clk-divider.c. I agree that it should be in the
  divider code, but we'd have to export some additional APIs to allow
  that. In the future if we went with what's in v8, and wanted to fix
  the fractional dividers, then it would need a similar type of helper
  in clk.c, which is not ideal. I initially went with this approach to
  limit the APIs that are exported from the clk core.

- I have a draft v9 series that I haven't posted yet that adds two new
  helpers: clk_hw_get_num_children() and clk_hw_get_child_by_index()
  similar to the existing functions for the parents. This allows moving
  the LCM logic into clk-divider.c where it belongs, however the
  downside to this approach is that it expands the clk exported APIs so
  that providers will be able to fully walk the clk tree. The concern is
  that providers may abuse this in the future and it may limit future
  changes / cleanups to the clk core. For example, if we wanted to clean
  up the way locking is done, this may potentially limit the available
  options.
  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-divider-scaling-v9

- He would like to see it where each clk consumer sets the min/max rate
  that's acceptable, and the clk scaling in the provider takes those
  ranges into account when rates are negotiated.

Anyways, please chime in Jerome if I got this right / wrong, and any
additional concerns.

Brian

