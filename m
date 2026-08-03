Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C273D41A925
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785768390; cv=none; b=G5Z6pG7/io/S0rsqxmQkKtogRTNGQzdjlCXpTH56c3qdRArmHEYd+rpdnlzYYoxB1NwajwUhBdogEiq5lQ7cUz04g6YZkdgck76bzOhtPtfmGWKcB3VQmMBL5pgMn3B17sbYDr4cr1mBdikOugmHAKiCoXc15fTVnAcNfo7y0wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785768390; c=relaxed/simple;
	bh=IHJ/yuYFJFmwqLHp9N/Jmi/pCQSvKzfbgwSzSkQuZxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qsg9GLRXUJer8UJQfUT+KTktDbpCYURBHav5w2dXZIhGXbRU9RfLHTq2fjgwbdGKDQM10i5qPzmbqUyRXlFkAb599/6JWeWcrztJa1EaFs9aiKLwWtYvw2KXbcH5nJp3MmcSwn/XfthwRUHslkxB6sdcdAy1fcG3fLV4vbfwBeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XrlQhXF5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=a5ADtsE/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XrlQhXF5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="a5ADtsE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VF0Hp4wXirEtYNRHmmEHQLkJjRzPvWFm3EoPuJFZJNc=;
	b=XrlQhXF5akzITkbHHXFOmgybz3ff4WE2owvZ4nQnAylwZyHoy1MEVN0ztn2Fc72ZL0mb1r
	7DzNYQdZovkDvI0f6z5Qk1LzNkhhjBdvEZjdl1OwtuRTal+zXAHM9WX6faUcboKv9JQdJY
	Txju6ioPKsdc05HbpZqkzD1RvT5qfzA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-yXiSy66_MwSNazRd3kZspA-1; Mon, 03 Aug 2026 10:46:25 -0400
X-MC-Unique: yXiSy66_MwSNazRd3kZspA-1
X-Mimecast-MFC-AGG-ID: yXiSy66_MwSNazRd3kZspA_1785768385
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81eedabbefcso116712437b3.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 07:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785768385; x=1786373185; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VF0Hp4wXirEtYNRHmmEHQLkJjRzPvWFm3EoPuJFZJNc=;
        b=a5ADtsE/yz1IpT++o2jFDRWump6ECvj1ch91KYIiBHbXchfrQxjvmPYw0Xu2E9zJ8p
         DTjPkcn//Iig5IwhkxqvP6hXMjoFI1I9M3/gOfMp/5sGTr2aEYREJm8RGr+nURB8wTcm
         P1rOEKFWrgaTBE7y8eX8RLyYWHwrLB9AnH9hTtZ4KOvovbgLGlmGh2TuLRpboLLHJLe+
         mOQfa0GkmfKOqTo7LVF6N+e9zBLmiaxpq/eSz6rz8yW6wOcji/F63ljnAEYHpt4sF2V4
         XeT8k6XzXHpgNIXTqAI6jKTtb6917Dauz/OB5PNN9UA9PKhGEqGK7ww8wd5tEFtpWaTm
         hUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768385; x=1786373185;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VF0Hp4wXirEtYNRHmmEHQLkJjRzPvWFm3EoPuJFZJNc=;
        b=Fsp1FraVIVZNfMnMM7tEs/3nburGiEOKbtE0038gR27FaR4B3aRsTPKOQWuh9ufYAd
         Sg7Pufdj61wyrTyNobHG/lTGuGMx1iFdHz8muMXqqNy+PBOon+ihqE5P/iPMsZ6Ng3/7
         +HLXdGPQsa8603lNlBBaJfrQHf9osnCpdRvKIw7ND7DojRsyhs3MMeUm9i22k2xQKYO1
         kZR9YhSCp4IPbZend/eblCRUUiHx4l/O8xEaFqUSbxngRWzHJObmTTBw28YRW1dFH89q
         kZB76ttGWkdu5wIY4TvCqUNor5WnZC46Xl0ajQslB3xwGnr29RDti1mK9iNHfP88sBgT
         PeWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmgH5uF+43KBjo7aNRwg+xvsFK71eajJsWV9xeRc7I6GpR0Ud//xrT3KlK6fYrL22SX1SaeO9VVYM/@vger.kernel.org
X-Gm-Message-State: AOJu0Yze4C7Z1JQrhwHNHoRcl2H+ahtxm26cS/ZC254j2P9SAgcWih71
	jkzZu89lVqCaIWCk+H9mwBir/GPuKqbCyhcBEtAs8Ae1S+BGoWX3tWJgW31f3zHt3H8fl8KMjJN
	UENmxuC2GMlJg4hnooJf65Sf1SA6Ha2bBkVn8VMI1pxqjvIQCSf6sufj2sxZYy+k=
X-Gm-Gg: AR+sD12NJedu7npInX6Y7gY219IeMoy1q/lsR9hNyGBtQlwz5MMfpOW5QG0bGepN9ji
	vPdNc8tLDJRZNrxY8Uep9rPeZb7WoJdwMiJU/95JHjJbmbNaqGqju8QmCS2LK6VVH96nmEDRfwi
	2C5iCMJPZDoElO6EXA+gqR5KlYzmUdWA7PyLkzy8+DNU/wk9HrHHmZxrLq9T+pdBzZN+rAPdBBL
	8Id5nnrlI+rQyR7xfQU2WLymjT3ASoFkU0/j2aGZZCvkszH4Vy+PUIh2I4HhUYqBsMrLAGpYUsR
	n1rE91wvepVc0YVt7BpT9io+QgqQkppo4OsC8Zc1TBhP7TB9PGj1UWCJLknokeJBfkThkKffzLv
	bQWZZbbCR3MKaFENhhZMgE8xU2A4jmOqGIJA=
X-Received: by 2002:a05:690c:a9a:b0:80b:9114:3b7e with SMTP id 00721157ae682-81fd4a2d85amr133508387b3.12.1785768384930;
        Mon, 03 Aug 2026 07:46:24 -0700 (PDT)
X-Received: by 2002:a05:690c:a9a:b0:80b:9114:3b7e with SMTP id 00721157ae682-81fd4a2d85amr133507827b3.12.1785768384377;
        Mon, 03 Aug 2026 07:46:24 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e2bbsm55709907b3.9.2026.08.03.07.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:46:23 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:46:21 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 15/25] clk: mediatek: pllfh: Add ops for PLLs using
 set/clr regs
Message-ID: <anCpvYJJf2FChBHE@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-15-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-15-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 01:21:01PM +0200, Louis-Alexis Eyraud wrote:
> Add new set of PLL FHCTL clock operations, that uses the new prepare
> and unprepare methods, added in PLL for MT8189 SoC to support this
> logic.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

