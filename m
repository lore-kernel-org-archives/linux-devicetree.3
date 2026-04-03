Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB0F34753B
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775227257; cv=none; b=iCTwSb8I+590aFZwSIUGmIox5TH09tpO/z5lbug3pMQnhZ+XJYLpPocsLo0WraRD5CXpVjxtvxXwJDT4g5vzeX8dQmJNCeCRXED7tZxKO8/Dvz488PtIfnmyVD7otW+cTVkvml6/Hh0HFO+xLuIhzk0NPbzvtv8s7pUZgT9m2l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775227257; c=relaxed/simple;
	bh=KR2lS0bJIllIDJJuumGn/2W7QLauULetuvssl/QgRro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HamxqPucESXJh12uTF5UTZMQfxCdxO4a/WNJ4Fs/ZnUgwiKjtlzyg5/iq1bRjE4yxyZ2faw1R7042i4QYydttZx8ISl9+57zXOnuxnnr58jcPYFaE2rO2AHsHZtsvhX1qxGX5HUVtF/k/24AOj75JkpBiInjedPhR2rhA7OxbE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=InhUhAwS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kdy4Gi0V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="InhUhAwS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kdy4Gi0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775227254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cw/xHnIEFNZBzNrWCIwBvteuoMIEapEfBqznZh6b0gM=;
	b=InhUhAwSdkCgNJJwjsmTykbsuxKBTMwk9yPYpxp4L0EceKWOIMiQAdoZUMqNdAwJxO1nvy
	rHfhoH9Nnd8AQ8ewBfSpxfwDAfztvStXwUL+LAnqeIaApNXMhxQmWZN9QcQMGNK0xNMcNb
	X+qBGr0nFu2JdyHW8PvsDKkBT6UrAIE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-Z21VwAMbNxayxtbhCLGW6g-1; Fri, 03 Apr 2026 10:40:53 -0400
X-MC-Unique: Z21VwAMbNxayxtbhCLGW6g-1
X-Mimecast-MFC-AGG-ID: Z21VwAMbNxayxtbhCLGW6g_1775227252
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd781c0d90so738948785a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775227252; x=1775832052; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cw/xHnIEFNZBzNrWCIwBvteuoMIEapEfBqznZh6b0gM=;
        b=kdy4Gi0V1uqPAaPOLUEipzE8FjGqydgT0EyHXEF47xWwr2cCnRLsJZkjlmt+iC30Zc
         dx1+S1DRL2LxMMia6vIoYv/CZS3VFQvDM6L6PQr9qn3tzAuNma//PT6rbNizfJoIdEs1
         jd4y5o6Kho7Wbj2MvbReQQluLS90NWb3tPkgjb7TQfYODHLi5991uuv7GlZ5pLRaY4l7
         8aLqgn0Eh+AtG0ItygVPqybGL9H2pPXU8nEaWEcQ3EJZT1A2KF1gu+8NkbEjd8KpWLdB
         HHQ0YvVkedMobCY54APLKRTAU3BDNrS9fMgMY57ojbkexwz1kqRRDJvgO4+J2Co0+eP9
         dqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775227252; x=1775832052;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cw/xHnIEFNZBzNrWCIwBvteuoMIEapEfBqznZh6b0gM=;
        b=p6i0nUM4T5vtcfbBNWxMentxz9g/BVUIxgmcgz0GeN7Wb8AIdW3fkXQNdRHHsBuPJS
         Y1Y9hy3aOP40zLIe2dV1PsdVclmgCI7VTA81arxHKPtepI9rkFocQyQ7ccEHjCGeMOv6
         H5fvE4ahnw9QPFG/k2K2G1B38Vrw4sSTB7R3uwFGdK6ZKVG1YpE82s5Pbi7JGk5B8DbE
         upBhPPktLbu7pQynvDQGjmL8BvbcRKcFSn05uxOFgUMkqdKFuT4n77FrMBxVuQ3JgWyc
         TlJOLJcyh2Q6ZJMVezuxwC2Oj66JnQqa96ddNgTWysKvXyGU9Z7ESZ5OF6UtQR9Xp2/c
         JdPw==
X-Forwarded-Encrypted: i=1; AJvYcCWDacWVFe44wH5mSaPJRAsLi48lWoeLRprAcrqg8uXpoB9ACGQpu1ICwbU2sA9r2I/dJvy5YcjVD+bv@vger.kernel.org
X-Gm-Message-State: AOJu0YypMrE1zmQBGoDDnmbl0HccdvyJ8uLcMJYv9gk6ifMgt8OL2/wj
	UaRxWv1Cp7pvlHbhPHR7p24H2tv8Gpsf1oa7YAFz3/Bp4cG6X7k0ijcb0BQQ9uUpnfbHD3YOGLc
	yR50XT3Y1V8lk1A6nAxpiM7H/xSbmQYlRyLqN4Yfm+TaH5+yOcbM4rw9giJ+Re2w=
X-Gm-Gg: ATEYQzy5xgYE3cgXigMiOxSS51SflO9uO/Ou+I1dZ4jlbSwSXEJtwS1S36+EXs8LWDR
	hlbyBzn9RYQN0nSpq/boU7RR8/+ifX9M7FfPKSDHWx0fOpTyY/SYy+NwmDFdh33tFEF52vkeBG6
	IwWEZ7Qb0WHU9ebVs5gLkzKdiu9i8JgpsuLcvmteVWdhbczKwbhl2WrMVHQft9bK8Eph/hOfhPH
	SCD4xAFZFl3QOKrL/JObgBavkWdfzBUzItBs+GQUV70KNnuy4YW6LFAveR1BRb/rvePMEJQhLvS
	zuc6HDD5yLmW9yOdzDbCWB0mACy7YxQuL0f4WwoyTmqBwi1zpz4EEaWaSI/AFnXhGWvBKgfP5IG
	p3JsYOud8Hj+46kR1jkOin15vBpJVWlYMvD4p8twUntWu5ideiYsBN0iI
X-Received: by 2002:a05:620a:294f:b0:8cd:918e:e824 with SMTP id af79cd13be357-8d3042ce0cdmr791438485a.42.1775227251584;
        Fri, 03 Apr 2026 07:40:51 -0700 (PDT)
X-Received: by 2002:a05:620a:294f:b0:8cd:918e:e824 with SMTP id af79cd13be357-8d3042ce0cdmr791435285a.42.1775227251080;
        Fri, 03 Apr 2026 07:40:51 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593bf2769sm50504626d6.14.2026.04.03.07.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:40:50 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:40:48 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 05/10] clk: realtek: Add support for gate clock
Message-ID: <ac_RcGSpVBpt3S7C@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-6-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402073957.2742459-6-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Cheng-Yu,

On Thu, Apr 02, 2026 at 03:39:52PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Introduce clk_regmap_gate_ops supporting enable, disable, is_enabled, and
> disable_unused for standard regmap gate clocks.

disable_unused is not implemented below.

> 
> Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v6:
> - Add the headers used in c file to follow the "Include What You Use" principle.
> ---
>  drivers/clk/realtek/Makefile          |  2 +
>  drivers/clk/realtek/clk-regmap-gate.c | 69 +++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-gate.h | 65 +++++++++++++++++++++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index a89ad77993e9..74375f8127ac 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -2,5 +2,7 @@
>  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += common.o
> +
>  clk-rtk-y += clk-pll.o
> +clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
> new file mode 100644
> index 000000000000..8738d6c6f8dd
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-gate.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/regmap.h>
> +#include <linux/bits.h>
> +#include "clk-regmap-gate.h"
> +#include <linux/clk-provider.h>

linux/clk-provider.h needs to be included before clk-regmap-gate.h.

Also Sashiko reports that linux/export.h should also be included.
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

Brian

