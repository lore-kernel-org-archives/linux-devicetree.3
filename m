Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ED13E9F8D
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774966609; cv=none; b=GaP+lbe0rHHYx/2hMHQ6hnVi71o0MWBQbPoazK3B0YbBfZimOEEvZrKSQZnAO8tYWQ1wgi3gIE/GKOoFPM3pgSWS7q8KClVGhUWxDkuzG1VmSFN0f0xCn87cQqqIInEzd8O8xGVU7MK4Z1IA7066KaFs5WbwlhhB1boouvCG7Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774966609; c=relaxed/simple;
	bh=5Iw9URBB2+huCGNNmJnyie/vcU11kN7G+C2oBsp0qj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ju59hV8gAqHXNcCTjMNjRWBy6eWkrHQEjulU6JGmbpty3tAsljgitcVDHVBLP/JBE4cKJUb6JlXSXtf/g7XnNYHLxZabMkIYZ6E1vwBYituO7JwKWWWivZ9mIUKyThNYdl031eER/mW5eb8Y4z9GJn325Urd6iXefyFUwKdtaFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CJjvZzK+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pSOLESHa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CJjvZzK+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pSOLESHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774966606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+cvItjsGlgO+YKuRpumctJ3y5xeOoIq89E46KdlSIjg=;
	b=CJjvZzK+sWuY+fgBbqyrjx8+cQtOp15B2H4koVxuc5ZNuxIcBjWAYDCAO7etEYC63rMix/
	053FS2EGL+/2yaWqVAQov26htbN70CpDB64TVw55nrgSLFNtQ1fXNQ2EUmaPDNpO9EAmh5
	WOD7xnx34d/bON1yuS4sJLeOcO8Zo+c=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-EQHFgMsiNjOgHyUZYCdXtA-1; Tue, 31 Mar 2026 10:16:45 -0400
X-MC-Unique: EQHFgMsiNjOgHyUZYCdXtA-1
X-Mimecast-MFC-AGG-ID: EQHFgMsiNjOgHyUZYCdXtA_1774966605
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509044f54aaso181820241cf.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774966605; x=1775571405; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cvItjsGlgO+YKuRpumctJ3y5xeOoIq89E46KdlSIjg=;
        b=pSOLESHaqVDimDnxFL8zT5QRh29M1bZpMV9G7EJ+zI9/ScBml+6QddKKZO1tDDnLbf
         816Bzo1xoGiAfTbPFvo/NWM66ZhYk29VPsLlEfaNlbnRPh0qc6rEnRumhglwjc6I6tTq
         pBbPo+HDjCexVFif7wezwXggccbI2iNrosFF3tTyTgRgacyhxOeDH9+bVWRupaUSxdai
         BsDwqliULXNMZh1ekJ/foQqVD2v+NC+6+g1RATdKEgGq4A4LIKyJqEsPXm1oqr+eIc8I
         TU/Cy85eJspvGn2E7uRUePn9lFIZV6KzK3tsxMihDF/LxuDHcd6PRPdC78vIcoDRjF3t
         2WXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774966605; x=1775571405;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cvItjsGlgO+YKuRpumctJ3y5xeOoIq89E46KdlSIjg=;
        b=klheMRQOJzftCzZA7DcrEK67ynYGRRVFAYgjg1A6VkCQtkn4b5X+xInhDhzhM9fZWi
         1I9VVkpi/wwsxyRrHVbCCvZv8nWnI8G7oV5FFa6BzknD68nnyzSRdh3Oqbk90UK688a8
         lCGEI8qprp9NnUfXGf0wLY+QXTZzft8t9Xx21Lc8X2mo8eDEOGDPacP1oI5xKBs0PuUi
         UpCYPs4nlEy4yImrVKFDOKS2YTgWpwYctGtqTQjoFZtUL8QqHS4M0pg9SjE1l+qb3CAd
         6Bj3+ediOOZjCln6AfJp84Re1dre7qjVfg115BkLWCypbaAZwlqhp0XExdAssuZPO3mH
         6LtA==
X-Forwarded-Encrypted: i=1; AJvYcCUiYA/iuorevJtNaIrYYxDlCaSo+yGTs6Dt+9I0ySbDER/OPAGdTDfbAocUx9JAXAWKjgJ16rbEBqEO@vger.kernel.org
X-Gm-Message-State: AOJu0YxM1N6j4vZs4NMuiRSjTa+ZDN+bPzXa6RJYTedm6sPBVB2hDNZZ
	BWAJas2wZyJWozUF57UY2wujDvWzMwciVpmtZMHW7r63nvZrp08wLoWg81p+/K4y4oB0WdV1AjB
	/eRWuhyH9TNGi5rdQbqevGKSgn50LJQcwPpqYQVOtM2t8a/Xe/hV27hRp5acboV8=
X-Gm-Gg: ATEYQzwzAHTfTbPZOaxwoO6vLt9/o21qq5VF4ZrD3nMIRKTO6B8jn29ojId0Hf4Kg6j
	bYoEj9jOrVX6Ssgp5A1Ny8YJwHHEtRR9WrNEeBhL0jAtu+4/U9bcSVQr3JnU4ujc1iz9ZKuItXz
	92JlV0Si/LzY/EnZBUub6YZp4Umcu7xhyHf6jbVJAa1LtodCJI7MIm3ziY8SOmfJSaekl0VDlf0
	s0cCOmmUoq+ns1BMccpw3KH5cykR9la1tohuhfv+fCH0zJdSrygvzKppefJ+e5XXQWNmtSeenOI
	hdII/0CTx3oej3eQ+I8og/93gKKvGZ2D4ikOaLbfpema+JwRBwRGjJ0hOPeFHz73jw6OtLkmcc8
	KYuFRR/hIrIjaVVdt
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr227957651cf.17.1774966604500;
        Tue, 31 Mar 2026 07:16:44 -0700 (PDT)
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr227957191cf.17.1774966603971;
        Tue, 31 Mar 2026 07:16:43 -0700 (PDT)
Received: from redhat.com ([96.66.166.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c67fefsm86643111cf.4.2026.03.31.07.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:16:43 -0700 (PDT)
Date: Tue, 31 Mar 2026 10:16:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Guodong Xu <guodong@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/5] clk: spacemit: k3: mark top_dclk as
 CLK_IS_CRITICAL
Message-ID: <acvXSXNWIEcDUpQ3@redhat.com>
References: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
 <20260331-k3-pdma-v3-4-a4e60dd8b4b3@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-k3-pdma-v3-4-a4e60dd8b4b3@linux.spacemit.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Tue, Mar 31, 2026 at 04:27:07PM +0800, Troy Mitchell wrote:
> top_dclk is the DDR bus clock. If it is gated by clk_disable_unused,
> all memory-mapped bus transactions cease to function, causing DMA
> engines to hang and general system instability.
> 
> Mark it CLK_IS_CRITICAL so the CCF never gates it during the
> unused clock sweep.
> 
> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

