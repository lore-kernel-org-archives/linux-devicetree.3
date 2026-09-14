Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BA8471416
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393470; cv=none; b=qgxjD7BmZdMgo+jEtRNrZv2la7HlmuZHcm5iid1MBqmxHcc0BEgiRFt9h2zA8lkk3358xUzxrMCfMBIR9Y2NFo3U3mtHJ9eif5JezulcsBFve0/MBdnKdrGmTLUDdrmuh2J6QOvaraiOxZCDgIKQxmJFt2QB43/k7AVsvXUS+bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393470; c=relaxed/simple;
	bh=0iMtyUqd3qePGX0foMGvwlEfIHFwid3TU59h38RyA0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmwWA50iuu6uIt0MQqUwiUHQyx5v2beP1igQXXhrxw07A/hUYWRcNzXbaDf+t9hxBjeJ+z/YaOgiN9OTW8wgPNiw5Fido/yk+JOIyeXPDLetqFbhlIPMeaQJSO30GxK6OSUhVd/EgQpePkzGIdPSnKOri2J/y6Z8hO2o6u7kdcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J9kkwdfB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MdEn/q2T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J9kkwdfB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MdEn/q2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789393467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=;
	b=J9kkwdfBEJlTC4N/deyDkg/G6X57HIVH0BNYZwuHU8qgx+q4gydEatFoaUuSHk/7uv5bA1
	W4Qyvgl+DDRy+qKPCcslhiq3LuqlPO3BUl3lTkPqTp9qL3w0vnU7DsKuQ9qv0dNyvNR5Xi
	p9o05gFnxonWDqLyvOaP66cEt/PY0NE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-iDz20sAuMcGIdB-D0D3SYQ-1; Mon, 14 Sep 2026 09:44:25 -0400
X-MC-Unique: iDz20sAuMcGIdB-D0D3SYQ-1
X-Mimecast-MFC-AGG-ID: iDz20sAuMcGIdB-D0D3SYQ_1789393465
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ffe24490bso79882781cf.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789393465; x=1789998265; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=;
        b=MdEn/q2T2o3OUVAaXu4R2RniInqSXUVWak0WQ/FEATD3DIvvXsocoE2G0QdZMbzLva
         ZHd59T3kHiDz8s4orSv6ePrWphQqswtzoGAC7buSreXD9Buazg2xcQU+kzl+blJZzjLs
         0rZEjShbfgdV8tU9JSkSYQQmiy4Th2kfwm5RZusIIVvZMGz+lES7masJl5Ty4ROI1aoL
         nScwlWN2uYHqCklNJHURb6whoX3st6/sDlR6V8w+QqQn40NshIrqE8u7an/GTcyVo/vZ
         uyza3QPeuKrDvbgtePa6RYu1dWtUhYCFMwh5zLhxsFp18JurGmWq20fT2RyJiR5dy8AM
         /ljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393465; x=1789998265;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wErMsFym7CzSTi2r09E/qapmW2jeznE/5reFNjfhCM=;
        b=Ag0jxImes4qp0q+C2OLxejn4Bk5sEwvr3ab2k/4CsZs/tNcIldUPRd5HvUvcuIgItA
         Man8lBzVZ05YvaQnBefjSZSLtmJsYwHuCHw800s2xGf+QW0BfBScA9wANNOcoyczEddt
         f4FOSJU1V0gdUi/N3max4UY/slD46xriKIqiJPzHtsgRbO7yntzOz+zJJ+hEgBgolKKs
         xhbj5q5617cWoUQZVzoL8kOhv+MLLjnWSRZdLrG9wrW1cKdBq2xaLENcY2JJ7sIk42MF
         57t+dy5sGo8qayhg1KOlK4oA0pV4Zcr+g/br997jHvU2fIV/MTza1C60lXUKPWv3JRs1
         W2HA==
X-Forwarded-Encrypted: i=1; AKwUvBxVByR8am1ao8NfSXj+7sxHW/gaGeEWacdxJ/rozFoI5M6SdQc66ZYftSooQy/zRH0kHdeHIDAuviBO@vger.kernel.org
X-Gm-Message-State: AFuF++newzxBTXbHXyiFaQFr20wUi1r6CTVBcw8TgxdN2e0op3Uv5Zh0
	Lr9TGXh6JNPPYquS68XmDuov97P7QH3Ly3ZOliVB82bmZTL63MZvBFrYMGm8+QF00LfZdP6zjyX
	4agomL0VRFwK/HwKuUzd8AWYhXOG374N1abEXXkI5Mvx7SFTM95RN9OwrBLJ97n8=
X-Gm-Gg: AYBFou33AU3diMIhXubzWsAi7eI9d0ldL6sF69v3Z5kcPk6E2bkZutPSPMN2vS1D8VJ
	HyQneweXsMggnKaxy7hdnPawogx0OhiSwfh3ZoV7s2vImMhiZvZg02sYZOg/u8WGrjOBWr5qss7
	Bxlt5fA3t2CeDrk330aReUz3of1vpw+hhPqzM4EOTHYfgvHrU/1L5hLPao0qfBqgsvRmR1Hl7SK
	xi5E3TdxzmXQiI3Oc/AYuhOa8PKn90+JOI2N4ma0sIbgrTRd1KAwLNYrPrt/kWlF19MTGjgkFfl
	X6HfI/i9YB6ztbjBs3NDqeOtT6GZF4YbSqnOJ6M33DmBG+nXU1m39hyEVmWYrQgWl7rsOlkesmj
	1HMexDmlGt+bvIeWiFIyA3u/vBSMGChEsKA8=
X-Received: by 2002:a05:622a:1905:b0:530:b2e4:d59d with SMTP id d75a77b69052e-5310d071f0cmr35836561cf.56.1789393464397;
        Mon, 14 Sep 2026 06:44:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1905:b0:530:b2e4:d59d with SMTP id d75a77b69052e-5310d071f0cmr35835751cf.56.1789393463669;
        Mon, 14 Sep 2026 06:44:23 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca309989sm100594471cf.4.2026.09.14.06.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:44:22 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:44:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v4 00/24] MT8189: Add support for system and base clock
 controllers
Message-ID: <aqf6NH-xrMtCQppv@redhat.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <amuWdRD-TBQtFT_4@redhat.com>
 <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f6bdf69-c3fe-4e1d-8ff8-0e36d9f4e063@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Angelo,

On Fri, Jul 31, 2026 at 12:04:49PM +0200, AngeloGioacchino Del Regno wrote:
> On 7/30/26 20:22, Brian Masney wrote:
> > Should there be a new MAINTAINERS entry added? There's currently 221
> > files under drivers/clk/mediatek/ and there's currently only one
> > mediatek maintainer entry:
> > 
> >      MEDIATEK MT6735 CLOCK & RESET DRIVERS.
> > 
> > Is there anyone from mediatek (or elsewhere) that could act as a clk
> > subsystem maintainer similar to what the other SoC vendors do? Help with
> > reviews, send in pulls, etc?
> > 
> 
> I may be able to step in, but I have to check if it's feasible, time-wise, on
> my side.
> 
> Though, that won't happen until mid-September... because, well, I'm about to go
> on holiday (in a few days from now).

I'm checking in to see if you would be willing to be clk submaintainer
for the MediaTek clk drivers?

Brian

