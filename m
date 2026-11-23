Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455769;
	b=ZxJOWbMIlttkJJBNfChhylkCgBqLTYd0TtNPzrvRdOcxL/MZc53str3l2FspouYbxiq/
	 CuVhkI1icm+m2Kq3px1Jj2aPRthuycrWr0RrDLL8RVWIg7x0AEL3WdiQU7jJEmV6lLq57
	 bW0llcTrjDuan9OwjT8nOXbo0cHAJ8mEm7obeZQS5bA+lGCPAQFGGQsF66jEkilPhJGHo
	 2MItzKzA743U76K9q7hNQ+QrwHVD/pGikM+T3zG5M6JQGcl2oKB6c/gJY6H38oM0FEg7a
	 T7e6OnlSx93m4X5+dkiMSrF8Dxw1cTBtzODmjYA8GyOTDntA+56NlijIsXsI+xiF4EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=stSeoWTVSoG7vClTM34jNRVTmfdv9ae2mpsLHUuBopA=;
	b=5eWY0PKP3oqgQDWsnyqE0zCNf+4QVCQ+e75/dKou4DR2bml72ez6Gu/LUC1vw66ZCVUu
	 WmljYmICfBkbimwDXl0U8VhNZr2EdrFuJEQPDVsA2ou2VZi/NBtXG9UW1bEF0M+LCZ5NJ
	 HGPnRqtj6YVBYmCvfVtt0zskgE4cSrh0DeUR5MPtMjxqpbbZ3vZFKVE5BtAKG9QgMZWHG
	 pBz5bxe0yceJIOxOELL2niBENF5YP3iEIzyrESi33F5ilaRJ2igNMxfOrAEsfCNQHMnkC
	 uVRSUUlvBovQU3yObgN/4ZUzCkZSOKbhaj18NywsD85c+OabLUl8LT7Exu/E2dL/DVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMTPLQ+1;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F8F606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F8F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMTPLQ+1
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-833e671ee9fso3392647a34.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455768; x=1796060568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=stSeoWTVSoG7vClTM34jNRVTmfdv9ae2mpsLHUuBopA=;
        b=XMTPLQ+1CDEhcn3UvZ25OQuWfhFLUZULm0I1zSaTSjUfCBWMdLqOXd2FbtQI9IgvZx
         6+RBzArB5Y+FBU+5SDIv6CQPyaYcmkLLcZPz2UmnqQ3MfLzS9bOz5kW92/axHluUxd2C
         jkAO8/S7kXsVvJToIRZCbxbIcYGJV0WopTkIBya+6HufFkhjb8ByOdheIQ0xf9EC3giV
         UGFlk5XHJhcx69yV+hTAXriQHOkXm/fWlPDzcJoKshB5L9fdxhlc9qz6RANUavclDZVP
         Yo8DPecRlYT9k0nHlCcBGVTg9Oh9YDOr4PZ9l9wZoJcvihAdzd+jF8uGikm0fJz4Q+DD
         Zwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455768; x=1796060568;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stSeoWTVSoG7vClTM34jNRVTmfdv9ae2mpsLHUuBopA=;
        b=bD9djMPGXjHdczOZtrJYcn7AiAP9uPhNbo47XtGVrovPqOoa5Tz3FFhF2rN8CQWMDg
         ixxl3HQyhbG9jHCjEhE9q8AsaAvPZ9EumhTWODyx0TBVQjZnMw32Jc8Mn9Kej+J0HAnU
         WOS5A6V0WAxo7lW1swu5AmErb2p5WzOR2z1IwksqRTL5t9ScwBXyF6am1BLRbuMnH+3Q
         HXrTVKiPpptHb3YL3tZfbQ5elZDuhvwFqu5HOdyVDz+nCCL7fkARRRpdS1d6wpp9b6PI
         KJQHzymluLShg6Q/4xTNkKudlPVtUJ9tbOFKlp2KCwFPS7VFJpe/9YHgTAVQgOmXwpdW
         QxSg==
X-Forwarded-Encrypted: i=1; AL+hErE6RtwnbK9JmXe3ftpWnOsg6MzEOZhBtDU7IRXirHx6ek+pij3Q+ytTzg56FXwqbKv4n9+qRFNqvAww@vger.kernel.org
X-Gm-Message-State: APuU4Z8hXNzefzDsqJe54bN0QRqCEoRUm0mbRfv8An8Mi6eBNo7y/S9K
	cCkIJjkqfWTpV1TL7lYWKHqChNrMg+tm7MTgX5iAk/gxKEVTO59gkuDY
X-Gm-Gg: AZFdTZdHZh6PXhNe/Ezq9gNWFWP4ucEj0PPWeBwiIY2HBd5VNIMYV+/13/lUBouoa6N
	llYAK95gOcGamCyjZ5D9MC/SyVkQumuASYgQrOKeIpqBFkS12tEoCxZwawudee8uXFnyHCBoeVN
	jkJuILelgi5HW2OV9pUR9BkQyvc3kfMuxSOF+EtSc1sfBpu7FWGq4WFpvOFEp/SmIUeAVHaLMbe
	o2dynO2tWccsRyZOtdJWTbnkxjTao0P9oa7IM6J3JrFIsEst2hZ1Cn2xJB5ZQAbNliaSJaWE+t0
	O4xSs04i20MFpMtyy0arse1Z/LE7iLYhbb9f4dS3J15RBF9Ys93Q/KaF82cn2N1j8JNJdboHeEr
	9nzU8hnReRSfjPXfFzAPgQHgAtxHKuPn1dJNAzA3RPzXT/Zv94AhFf7wDUKuAX1NUM/K92sYP7u
	5yunswfLkQ20wKHFaMWHOOCHagT86icnd7yi1V/ENG7Hs8dIoCG0QWsXHFaFmyp1hFpobg8XDwE
	PPXsL6Npgnp47vS+6V4cyqSpS/IFwO9qsyUvKewB8La6trXOO3HNz3dSKyOITA9x2pju3ZaxxC3
	DXdvwDhZn9DwA31Z+qTPIoVevlMdW1KHu4w8CwILCl0SuJEJzbTQsPGe8UeVxhz/7eqLCOVGkZh
	zdILe
X-Received: by 2002:a05:6809:747:20b0:572:8a:59db with SMTP id 5614622812f47-57a742be1e3mr7669480b6e.25.1795455767809;
        Mon, 23 Nov 2026 09:42:47 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm8959220b6e.9.2026.11.23.09.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:47 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v4 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Mon, 23 Nov 2026 12:42:45 -0500
Message-ID: <20261121-a733-dt-v4-2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121112312.75ba7299@ryzen.lan>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <dbfb7c5ea8b0ade2d48ef8e5cfd0b9e5a9946483.1795034153.git.enzo.adriano.code@gmail.com> <20261121112312.75ba7299@ryzen.lan>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> So what's the purpose of this cpu-map really if it's all flat?
> I wonder what the term "cluster" should really mean, here? I mean there
> are surely different types of cores connected, with separate frequency
> and power domains. So the cpu-map should not be flat, but describe that.
> Yes, they all use the same MPIDR affinity level, and the manual talks
> of "cluster0" only, but I wonder if this is not what this node here is
> about.
> Looks like the RK3588 also uses the same affinity level for all cores,
> but has a differentiated cpu-map.

The map records the topology in the A733 User Manual v1.00,
section 5.1.2, figure 5-1. The six A55s and two A76s sit in one
DynamIQ unit and share L3. The BSP's separate PLLs, CPU frequency
policies and DCDC5/DCDC3 supplies (A7S schematic sheet 4) describe
two DVFS groups. Mainline can describe those with the clocks,
separate opp-shared tables and CPU supplies.

RK3588 and GS101 both use 4+2+2 maps. MediaTek changed MT8195,
MT8192 and MT8186 to one cluster each. The MT8195 patch says the
big and little CPUs are "in one cluster: fix the CPU map to reflect
that." The other two patches make the same point for their SoCs.

https://lore.kernel.org/r/20230126103526.417039-2-angelogioacchino.delregno@collabora.com
https://lore.kernel.org/r/20230126103526.417039-3-angelogioacchino.delregno@collabora.com
https://lore.kernel.org/r/20230126103526.417039-4-angelogioacchino.delregno@collabora.com

I kept one cluster in v5. Do you still prefer a 6+2 split?

Enzo
