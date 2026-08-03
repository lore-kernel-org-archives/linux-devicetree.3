Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B0C342C9E
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773292; cv=none; b=J7eL1/r1IVKHTmZLvQM+xrFVCOXlpbgbXRKk14xAT4aRoN6iNCl8j2RwPyspRXFuyGYfZn3mSbyKPDjrdTIP3U1hhWItrQkF+RCdm2edqdcS/dXHwkVHSy/SyJ/QFD/zKKQUHWCipfz8QkAbSYZRgGf+AHJd/MaKwBHzKFTnKwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773292; c=relaxed/simple;
	bh=CE+Rv9tsvaQNBvKMuks5uLhestHFeRNrtIdEPutadWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=proXjOQk0pMLe2C85j3E7iKIdztGFS5eG8GunB6fPzkQnrTMgwD8SQSomxppH/6ViJFnd60lxGJXsEY+uRAQqehpC24BV5bIkrUtrZmDjJuncjAP2YVYlAiu7J7emlPIZ2daKdhuw8xhMSo0CyPDFh8DM14NfbDdiQw1iqhVq+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E1gaXDP3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PB/b4Afc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E1gaXDP3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PB/b4Afc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785773289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzNObcpGyl7mZyEhQjY56czCyqHDIauV1aLv/H0dJ3g=;
	b=E1gaXDP3bMN3F+HnUOG7LA+MmNVeIhbxjbbgaYXAjerSoBoTVMvyYVzM36tVQNp2QFxyyr
	7W8rThwE6uP7mRb5rM0Qpva7cUFF7P/f0iVEwan0lVcD31j2BcP05ENvVtMeq0FhQ+H2Uk
	+JQ/p61LMtdVEi2ytnG2fjKTYpzby3A=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-n8GkGXWNPeCa03wWkeh4Xw-1; Mon, 03 Aug 2026 12:08:07 -0400
X-MC-Unique: n8GkGXWNPeCa03wWkeh4Xw-1
X-Mimecast-MFC-AGG-ID: n8GkGXWNPeCa03wWkeh4Xw_1785773287
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e71268bf6so5693247b3.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785773287; x=1786378087; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzNObcpGyl7mZyEhQjY56czCyqHDIauV1aLv/H0dJ3g=;
        b=PB/b4Afcvp2ZunYg5yU2mmfWfKsefUJt11tWTyefj9r2+YbEEMLffWJBoZeFCirLmm
         g6zfNf/2Up4yXSzfiJkFqfaskSwGzB2HqdvUnckSV+W7gq5198MeDyv3hH9ab/vm7wEt
         QPThvjEYbhP+67GAyU7/8uBvQ2QFOvQAMzac/PbjLhXrt1NiIuD/jykIuHXqjrJq9mV2
         2IBWMyZjCtUvmRGhIeH2X5ehHD7kRUWxDg47779SgJFgdKaH/hgHLNb4U0XSBwgi5a1F
         wNm5E5hbq+V32VyY8W2FDIp+RXSQxkCXCVDcLx4qo7c0CUHNBu7LooBqKtcyfW4h/QBW
         riXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773287; x=1786378087;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yzNObcpGyl7mZyEhQjY56czCyqHDIauV1aLv/H0dJ3g=;
        b=GpNzxiZJ6hg26J6E588Z9T41C3HSiskvy4C+5ZWZMDcRUVnWwELeiDbSJAo0amV8Ki
         JMxD1Cm8vqpliJdm91Swea4J8N4gkoywaYEL1eRh5XIGa1rAYFkwZBC6M++vj/ZCMiY4
         qZmwVg2Li1ZshcdkUL7+LYxnk5XIr5rJrl+zQRBnO1HBrZwYGvI0AitA1ufSU7iS0Dvx
         SOMPiv2d0bCThVoqeV8XpXMKf6poTzubyhppgFWAzJuRodTZV8uc+IB5adXk5P8mP+4O
         hT1XoMumiIBS9oKqfSQd0hnp0ZSAoWCHN4HyJJnKBWF1p4Us34S7+u2R4BHwrQMsBZn6
         6ANQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPWPxDOvtxNcMyPdVRQEIQs7IlD1/By29reHEqOSg/bykLT5UddkxLjHEMd0g+4mGCKpv922FcFlFu@vger.kernel.org
X-Gm-Message-State: AOJu0YxCMetjyTHj4AU1FG19NyoZx+HQ6n0sOHwUAWHBMia6hhcer6wI
	EEF5I+6fsOyedx++Avq/SQb95e9KMTXP9G5m0bYuTj8oPPqtA5W+BbJAT49oqwTmyvU8HnUQFrg
	zpDgk3uAn9Fxn+/Sryk9JrwKPDoHGKgXU9Jr+tAwum5/Vg4rWbGBGf1VUNTGojP4=
X-Gm-Gg: AR+sD12hz11ctL40tBDpV3L+Z34HcB53mU2hi+Qdkht2HwlCW0rUDfEwUJ7Rl+bgpJ8
	JbUKQPajYzil+9b7me1lMhZqBJrNrgtmeXSWbsYN43Q7g2kqUzNWIsiiiH1LCDkYjrrCT/MA9ly
	RhlTB/0olhW760TqcrzeHsdWu0WyuoOH3pAUhLRC//N6Ex6iOow+Sy6T779kOof4fztzKDVDP19
	MR7gfqaPuUvp0oIx7TkwVZqXRg/QF/IvK4Nz/XEQLfhwtMH380oSFNtm6dxFUwQr+UCn20HqR/F
	vQgOooyNdM1EtJBUZOq6qeIm4RiEpq6FVtahYyFvg8fC2hgLwuLSarIRI5Dm5RlrOxWPrBHLjdt
	XO7/UsrWYpSlMwtmGMAQpvrDjf60L70+7h7g=
X-Received: by 2002:a05:690c:670f:b0:81e:6bd6:39a5 with SMTP id 00721157ae682-81fd49c95f9mr134145297b3.1.1785773286891;
        Mon, 03 Aug 2026 09:08:06 -0700 (PDT)
X-Received: by 2002:a05:690c:670f:b0:81e:6bd6:39a5 with SMTP id 00721157ae682-81fd49c95f9mr134144907b3.1.1785773286508;
        Mon, 03 Aug 2026 09:08:06 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd123dacsm57310617b3.39.2026.08.03.09.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:08:05 -0700 (PDT)
Date: Mon, 3 Aug 2026 12:08:03 -0400
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
Subject: Re: [PATCH v9 06/12] clk: zte: Add regmap-based clocks
Message-ID: <anC844zWjrph3KlX@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-6-d05530d85d28@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260802-zx29clk-v9-6-d05530d85d28@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sun, Aug 02, 2026 at 11:33:38PM +0300, Stefan Dösinger wrote:
> This is based on meson/clk-regmap.c, although slightly simplified. I
> have kept the copyright lines at the top of the file to indicate its
> origin.
> 
> I see that numerous clock drivers have their own incarnation of regmap-
> based mux/div/gate clocks. If there is any version of it that is likely
> to be elevated to shared code like clk-gate.c I'll copy that and try to
> use it as unmodified as possible.

This second paragraph doesn't have to go in the commit log and can go
below the ---. Otherwise looks fine.

> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

