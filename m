Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A706835202C
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773136; cv=none; b=u+SVqsHVpmcP7B8gAOdLabst3YDpDLqGn0qGYCjpZ8FPmXdCDWlWDA5l024HbTFy0cWUUbPtp3xTauOpTQZfF5EQ2NwakM49M6AWHp+6VTKs2stXB3FJOUvoMVqo4wB60AtHSlifTlzO8EnMWr9RSJy6J3MWxXNyQWHhfKG4P1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773136; c=relaxed/simple;
	bh=jjmdBTOcGsvvUEbiWQaxptxR3fZBHNirFhVPTnjc2vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaopTNWZnp9GebfJ7XZQoxPCtN0bKMzgxZf0fTcv40jd8cKEiXmPcAxYiHULD5bObIjLPZNXBJPrfK/dahkodLK8IKPNMxgtuof+Vq/tSWVIiNpTEjrPfRGFkllgptMOTt0ao8Zz97iBYTsVGTXVI13lATm5NYtB4zICVY2n06Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IvCuQrHN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ax0dazgC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IvCuQrHN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ax0dazgC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785773133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=357lP/N3j9Pe8409LQo6pgh/hm23lTt1qCsWKe9kpVU=;
	b=IvCuQrHNqAxukO5AaQ6Avure5gpxAfZk4Bnvrkk357CPjv0zG25eC9/nGQVSt+ZVwFAkGe
	slxHSKTZqtf9ZcDcUJ5KJrZprfPtO7NpbyhMWHkWPnAtx3wsvj+cGjd3uZhIMZhenD8zwh
	DxCRKQiNeLHalW9lDU+4NiExkcEhi50=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668--kEVQyn1Oxe2GtQ6RXsy3g-1; Mon, 03 Aug 2026 12:05:31 -0400
X-MC-Unique: -kEVQyn1Oxe2GtQ6RXsy3g-1
X-Mimecast-MFC-AGG-ID: -kEVQyn1Oxe2GtQ6RXsy3g_1785773131
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e6ae12b42so51331857b3.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785773131; x=1786377931; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=357lP/N3j9Pe8409LQo6pgh/hm23lTt1qCsWKe9kpVU=;
        b=Ax0dazgCo9jwxDz71T5sA+iFPmfBn6jOIh2qSOx/8pOz6DoO+LtXcJYwQSNmtGBu1S
         HhKc/03tG2XdaO3mc1ug49koloQtOuqYJl6Z2vXL0l94CAvSvEZ0je8TRaml16aGOfgb
         a/BW+rfWHVEarSN9L1fpqqoRtNmReLeIVnmSFAsXjI0sSgIEn+dydqT1FjlG9OuUddBs
         2OETHWc6HNabDldSZkZYMXX6dIaz9Rmo+XBt68AnaVz6x1Z556TxZ+YS9ev6jebV3PDX
         nCIaiUXKzS5N6KeBoQqeeVFCoJW2pxuI9574DnQmeLieXkstBBtSQ27MunInJ71DWekp
         5Q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773131; x=1786377931;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=357lP/N3j9Pe8409LQo6pgh/hm23lTt1qCsWKe9kpVU=;
        b=hYFrbai4j33yJ/4ajFrNa34a00FnWHf92wGPuf8QTRI4Fz4H0kkSVc44pk4uved4TL
         bsuXCA+Vfk4EgBBgPFKMhXXPZ5XWFBdPlKD0bknzQJK8+2kPvUXh2H5eDsBFQ8TJtn0e
         TN8z8J+nS30hCo4Yzl1RLxtWmkfPx8xIcyEZqoxRSTqy4rxkR01VWcAeR7xIv3JArQhg
         AQrAYy4Yq/6un6ODTIulxHtMs9mtj0BpAuNUvr7NND0iuWK7DnJ8C3601CBO5dHVi5D5
         B9fMf5L8QEovVV0WXD82uDO+4IBqlAHWk4cg3580vVNRo0BVcresEmw+BbWGl7duGv97
         375g==
X-Forwarded-Encrypted: i=1; AHgh+Row4+51v4wkYcHQNNVb2TESXG8DrLG6sZFBM5GgwD1wBlR0zEbrPToYfZpPW6uLw6R81aNkqxfkzNLF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0QuwnotkbbOBOE5uJ8KONgS6WqqjbXrbJ8VyoFA2A12Th0mom
	VV6FJRpbahxE/PR2QSFLwhhayx05ZvEF+0Bw8C9S/M2/N+DQxaOODKNUTIP3PksyP4TU9Yd6G9V
	vWZ8GvLvfTgTAOuDhoUU6/1KNs3b5D4uMNEyaEzbcIOwCB+yiumP/Yj2EToNmvTc=
X-Gm-Gg: AR+sD10krb/kWAcxVj1kh9heidD1dijWQMvQHh0JphbRngsXuAksSSp4s1l3aVFsmaj
	Zv5rnGX+uDqrSrHWSuKkXZ+kn/VlqkZXR08agQwIS7EjQ5pj8YXXzqnORvJgm8td/3bxay6Qq9g
	3d/7fCraCm3MmYrtSytiqqiYCqFbFdVDH6lN+UubvwUYoIGIQIEhkqGU3U0LVLwedPTHjjoZWLU
	JkEpDoTv7OIoW6MxyNnWPzEzQTIYjPGX4PwdAEdtUB0xbFmGzRc2AZVAMhIfdSP358NKrzK0wTn
	7DsGjvnCQ2QRLMv6qIvPMopMhiejKLBz3pAf1Jh0dPHwa4RkJtoKxfdZhk4bS1QQl5cu8ksA6m+
	C29w0rdD3VAvi3p58eLRH3XHuS6hcd825kD0=
X-Received: by 2002:a05:690c:6f04:b0:80c:ebd4:762 with SMTP id 00721157ae682-81fd49b4b80mr130783387b3.7.1785773130737;
        Mon, 03 Aug 2026 09:05:30 -0700 (PDT)
X-Received: by 2002:a05:690c:6f04:b0:80c:ebd4:762 with SMTP id 00721157ae682-81fd49b4b80mr130782967b3.7.1785773130388;
        Mon, 03 Aug 2026 09:05:30 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf30319sm57712047b3.6.2026.08.03.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:05:29 -0700 (PDT)
Date: Mon, 3 Aug 2026 12:05:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <anC8R2Nxgv_w7Ahp@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sun, Aug 02, 2026 at 11:33:37PM +0300, Stefan Dösinger wrote:
> diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
> new file mode 100644
> index 000000000000..175fbba3e0b3
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.h
> @@ -0,0 +1,142 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 Stefan Dösinger
> + */
> +
> +#ifndef __DRV_CLK_ZX_H
> +#define __DRV_CLK_ZX_H
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#define CLK_ZX_PLL_PREPARE_IS_ENABLE	1
> +#define CLK_ZX_MAX_PARENTS		8
> +
> +enum zx_parent_type {
> +	ZX_PARENT_FW,
> +	ZX_PARENT_ID,
> +};
> +
> +struct zx_parent_desc {
> +	enum zx_parent_type		type;
> +	union {
> +		const char		*fw_name;
> +		unsigned int		id;
> +	};
> +};
> +
> +#define PARENT_FW(_name) { .type = ZX_PARENT_FW, .fw_name = (_name) }
> +
> +#define PARENT_ID(_id) { .type = ZX_PARENT_ID, .id = (_id) }
> +
> +static inline struct clk_parent_data zx_get_parent(const struct zx_parent_desc *p,
> +						   struct clk_hw * const *clocks)
> +{
> +	struct clk_parent_data ret = {};
> +
> +	switch (p->type) {
> +	case ZX_PARENT_FW:
> +		ret.fw_name = p->fw_name;
> +		ret.index = -1;
> +		return ret;
> +
> +	case ZX_PARENT_ID:
> +		ret.hw = clocks[p->id];
> +		ret.index = -1;
> +		return ret;
> +	};

Stray semicolon

Brian

