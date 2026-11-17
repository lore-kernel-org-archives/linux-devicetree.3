Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918144;
	b=B/r7XBCaASPufv6jYR17mxPX9gseLD/dyDvxxEj6ontHcosYKDhyoTPYMMa4PssKAao3
	 KDMEtSKpKOBbRv/+EHqD2mYKSFF4MYTZNKOSGSPWyZKwXABpXZUm1JC5Sfu0E/y6bP+R2
	 mrCNRY05QC0I8flv0WzJtYAIjvmvlZthAuZZKJpt7u6lyEJLS1EzrWyr0iWLaNU5khX+2
	 FzfsmVAKuuGPatHvO81POkl567S7eotMM0ZlVAzNVI2Xc1YB8Qh0pnrw5STI0kRfy+Ke/
	 v7Uk+AGrfAUlbG9VCXBN9g3RwnzYx23G0p3kgAwRuiAV4gU/tfkAZmq5x+cqkVCAjDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mntxBemduMZ5IAPGeXV9h5oyYqbo1gfqzxaQ3yOHoUY=;
	b=BXnGatUK9eV3tO0RRrCChQ8J7GA+qdjnK2SExXwwVPnGHOaCjBS3iJ3PnroFBZvf6vER
	 h5ddw5sUSqnymxBAGiO8G0G5wZ1QGJE2fFyrKlp46XDpDi4ttTS/lLr0ovhyXgl7VJo7Z
	 EeCARw/EewjqiTi6dP2N9NhobJ8sqoBqrYN8g2F/mHcVIXrLQQgHapvCA7UOS3a9NA0EJ
	 sWs2FfcqaicMk4S37LXwXPkVj7n07o74PDamLnmZEz3B3U42GvnZuv+sq56nfjgbFOkU1
	 tQs3uZ6JMSoJmbMJaO1AatfzOQclMFS6cu3Lx8HKfvXYUcsvEYwIZlm3nDmQaIlBwWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUpotCsR;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFC6606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AFC6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUpotCsR
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9d7791b00so45720135ad.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794918143; x=1795522943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mntxBemduMZ5IAPGeXV9h5oyYqbo1gfqzxaQ3yOHoUY=;
        b=dUpotCsR8VDbxO6BPwe2pm2Frlg8byuRtnKfEYVQxIsJBIP57ZkkVkb1pTQTWPWgFg
         72SwPlggj7OMi622Vo5qpvNu3MddcOt+bi21dl8PBjMZDab/rWf9EAYXttijjWjgJ3Mr
         Xs2+igDLWg+FyQrIRH9slYhs+lpwrk0iPZzVtXxAAxOFGxTS7JXoazTeg5v0jfn9Guwn
         e7rG+9N/6gBN8zWkhYHNe4kuq7J8Z4F4be+Kl+yR2jl9Oz8YD4ZvnaG437/cYcwaN5ew
         oVE6DYCxwEPiWQvCbtJohUg6d8pdXZovciuRaDhUUH4RFbA9e8eIe0p1f19jqkPJCgGT
         mREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918143; x=1795522943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mntxBemduMZ5IAPGeXV9h5oyYqbo1gfqzxaQ3yOHoUY=;
        b=Zkq7YMhOqhVSTQUxyfunAXhzk8FY1jMNM40+6fDaoctaOv7v/DgLkM6GF/Xchme+GY
         0+XP4eU7Dq1TxwMe8JTF6cOIPQVI9hLayQxmT4ra6maYU2zv/tTr+x1jPA/6gyuuEU1B
         SfesLLboMGXRvoIKRb3cJmy84iTC0zWJJYuTpIKv/NJgYbVZ6oZExogVVOfi1onBnbp8
         m6/DOGxz24oO/jDzdpKFk213tMQzuTeXOSPKjwUMaaKlWVcUsUWV9/79ymS3MEVhLv7i
         4znVVTvcJoW6aK08DMTm8Fr4ge3B3BHwVuf5Bw4SKqDY0PXrV3K1hy+/HlkUS7/W3oeL
         TUfA==
X-Forwarded-Encrypted: i=1; AL+hErFaDE0COCgC1CgnJ9zY5/3gj8xO3/SDssEWfq2aeH14fEP13RajVJf3/FRy/C7CzXBus7tfbX8tFbgt@vger.kernel.org
X-Gm-Message-State: APuU4Z+Go6K82Y0pdeN6w+eWJGIcy6lauZy6a/WqrrFGQHxUzO3fEtDl
	JfSdCXpVW9gyD1F+YnSq5JyOkpfGcbWOL4ROqfVLHQPOQuDTIAUoDZ0b
X-Gm-Gg: AZFdTZe/LKb7oxHIDz73Yq5GeUHgHWo9vDGFFXuMexcEENJ+st5a1aFQqSOILUpIbIl
	k9yJhJZF8vdFJqfPw/SLbB+T4xyghMp+didF8N41U6vekR4EvzGzUhbFeHn8Fz16k9YQRRRNd9v
	hOwJXBHip+4aSBjLC3r+xie4Xan4HPFL9nlpq1woOb3qcQnEEdBsxVkCS5aQmH/isjtD+aQO+al
	Ats+Mk41riQ5lPyZoYAWHfjnww9olDShsudw4/tODCXcm9/jhEujmmRH/WKJ782F2bTGL6v6cQ4
	7JROu0+K/RiOcuIAWktLrC1gdUqkAz/w/QfhiJ6LrMvCR6Ogn5oHd3RdNxII5mWlYbwTG1lixnE
	ItuAGosTIrc14ZY/Q4qIQype/aMx4H/sxkSa7tBK6IjE32Wwg6vnmrv74Ss6M1m359p+LtxEMDj
	BdjkrY/xsri6A4WuHkBg/97uRbxwV9ih/v3PNcxxVtQ1ycxnCgYdxLVGWzDX+kaFTDdLBAmViT7
	e9g0LwkkzHIbUzcBQPdTHXPKTockrYNCzTE2rihMN8iuHSMXIKJ7CosHC0RQfssMcG/Al6NCydB
	ImoWzBD6bmJ1FSTYsQ0c0Mkh2jZB
X-Received: by 2002:a17:902:c40a:b0:2e9:5059:4468 with SMTP id d9443c01a7336-2ee0d664b4emr129370335ad.7.1794918143343;
        Tue, 17 Nov 2026 04:22:23 -0800 (PST)
Received: from duge-G3-3500 ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d86a1sm14701045ad.8.2026.11.17.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:22:22 -0800 (PST)
Date: Tue, 17 Nov 2026 20:22:15 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	aurelien@aurel32.net, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <gwtbssramb3rnp7dgqxm5fu6ywkn2h2jigdh5dvj5fvtv7rktk@upytexvwkjaq>
References: <20261116075423.1519438-1-duge1256@gmail.com>
 <20261116075423.1519438-3-duge1256@gmail.com>
 <65f843b0a46f14df575d998acceb40b68fe64a62.camel@pengutronix.de>
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
In-Reply-To: <65f843b0a46f14df575d998acceb40b68fe64a62.camel@pengutronix.de>

On Mon, Nov 16, 2026 at 12:54:42PM +0100, Philipp Zabel wrote:
> On Mo, 2026-11-16 at 15:54 +0800, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Keep the root key and SSK registers outside the exposed bank ranges.
> > 
> > FUSE_READY reports completion of a software-triggered reload. Trigger a
> > reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
> > FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
> > snapshot. Fail probe if the reload times out.
> > 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve reads
> > from the snapshot and use keepouts for the remaining register ranges.
> > 
> > Enable the AES_WTM clock only while accessing the hardware. Leave its
> > shared reset deasserted on teardown because WTM_RST resets the entire GEU.
> 
> I don't understand this, possibly because I don't know what GEU is.
> 
> What is this reset shared with, and why exactly does the reset need to
> stay deasserted?

GEU stands for Generic Encryption and Fuse Unit. This reset is not
shared with another consumer and only resets the controller state.
My explanation about needing to keep it deasserted was incorrect.

For v3, I've switched to devm_reset_control_get_exclusive_deasserted()
and removed that explanation. The reset is now asserted on driver
detach or a subsequent probe failure.

Best regards
Jiayu Du

> 
> regards
> Philipp
