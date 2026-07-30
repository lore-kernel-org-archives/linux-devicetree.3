Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F54446820
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429319; cv=none; b=S4QDfXy/DDsMzHBMirJa2Jjd/HyeYf16lMnk9ir2uo67b30wZlMvXq+BAfP80laiB4mnTD4zl0RZL9y32VMrjZSXGmAVXkpShZMjU2eJmRD1V1FlNe0Tx/7Wu1zyqk/xsQSOWY+Nvz0Ojquoe8b8fX4M2Xy2RZjKef9xLZkgz3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429319; c=relaxed/simple;
	bh=IQQ9nUJIesZZcmOoIYOVxVaJ/DUB3Q/ehc5Ru15VyUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsP2pWZuGQRWyUpZMG71nHgPsWLVIQ3Wjg44qQXbAjaWMkJQiAdDerT18huP1ncvETv8A4g/tV4aQq25Mv3/qnR6xZLshkKsX5EvbBBri38FG+ryxu9j0SGAk/r69ZT4RDV4A3ief0Oj7iOvP87M7tCCEiQbIpSJJU1c7js085E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ku+djM+1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PttX6h/G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ku+djM+1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PttX6h/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785429316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ae0rKiO6QS0+h8Q8O8N/F/upuiynCiCImWPcUdOek2E=;
	b=Ku+djM+1VhpqvtY3FbrKtMRKOtO0ZPfEFSruzRRzEgQtPgAmA81jC8UwPea+kjX9IXvOwG
	VGALwdk2fk0rAG/vOU1FvHPlz9FEwLJcjUgUucawWTdxKip+ROr9towZminONhSsCPhsQn
	m3YhDoil8WFd7KoPoW+OMBFlZ7rweCg=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-nw8If_zdOKKTPE98JsDn4Q-1; Thu, 30 Jul 2026 12:35:13 -0400
X-MC-Unique: nw8If_zdOKKTPE98JsDn4Q-1
X-Mimecast-MFC-AGG-ID: nw8If_zdOKKTPE98JsDn4Q_1785429313
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-668910ff32bso5084204d50.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785429313; x=1786034113; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ae0rKiO6QS0+h8Q8O8N/F/upuiynCiCImWPcUdOek2E=;
        b=PttX6h/GTL10hk5aZjScDAHpnx5qaR/EkFhtxzRqW3Ev8/uFSHnL2oj4w02RMGF/WB
         L4wowdobNU1eKw+VpB2Vr6PyOUTHJ/n+4ITRm5N3mn3sTL6+HLQJJUJv7CJyj56O7NYD
         3Ae58pPE1o0X/VPR+jwrSlSXkmuh9MAO4Zn9tVxDEfgc59cKIFg1YK7DBpV8v3jBEOWa
         U3mmOgeFNrGz7eQAUokZrm470o1ui4g3lMl0nOd9U9ZPQGRI45pheJ9HaPdkRCWtUDuZ
         LBey1vgLLNa2xIbBSEBG5u07TdzPnDtTquqXUfNN5pn6BYbBgRcIp3s4L06zvAeNwTcC
         yZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429313; x=1786034113;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ae0rKiO6QS0+h8Q8O8N/F/upuiynCiCImWPcUdOek2E=;
        b=TKPI0hd5qD0RpbdgKJuFe1gBHG4RRRvC0lDyyTcxSCKJjxaWYtKLMJrhBiHfn5uDBC
         ghrElV5Vxtr5RYRFwNWezNsBmMrcfzPflpAZxFMy1npestlw2JA9WyC0ijRRsVhsa/zH
         E+qU/ILIV5Av0y9f/bNkdydK2BlDTxhepdxg4zYDB316qvTgPPrAqhcQdilaiNjWAGFZ
         3WdtAms9HJ5yj97I7l981+95pDMRVJXUgBPxfR58gI/6O3hS+mvF7GKkcMCpN7/sao9P
         RP/IzvcMI9FkCLVEsoyZ0BvZ+Xx7D/qFfz50Nj5b8o18dvOPxLxBM1JOIsauTq6TMfoP
         MvbA==
X-Forwarded-Encrypted: i=1; AHgh+RqBnIbobiy0mphgvKmylxqrMO7VPJGzSjuQpOyiX6/OJT8Y+e9QVHCUK495DrK668fNwQ5QgAXjtswF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf7JYwEpZI/1zhEy79qdLkw1ye1cdl5w8If6jiikIm/ZF+3AQ5
	abXh7tsDQqdLy1BTkoCquGrxJYqHyGzBGDsBlgkdURg2kuQ++FWtrL06myqYfqCziDk0BxM7OQU
	opDrqdWlS0pqtIB3QiAOp3mnUMI6HnzeHtM0jDtaceVn+leA0JSfySFGJfjU+BOk=
X-Gm-Gg: AR+sD13RAf86DueMso4Ny+54yvzTOPX8UmnEyCPkIBaCy0aT4rCf4Yf1togBs4Av1qI
	OCt7tYnQ+U0JZ7hB3LyP3Z/OPLCSJ/pUwNWqQGkeslqlbflFc4PWYaLDDFsdIZAhJ8NgFuhgdIn
	Lkps/IPJ9iy7CBnOwFbkA3QpVj7m94TIq6NB9IU/Kv9ftDVytJ6J8pPwusptUHB2mzQLe4dTa9K
	hxLTE5rSyFsWSWOEJenmgjmJK+JlJ+5YdVG/DZzXhBUy1WvdbHkO9Sj+c+xJvLz8T1y3+CYmiYB
	sNumlmqVXk7foEmcJLVvyTZMECHgM0UfdAY+RhANa3phTsXljfQ/m8f0+U5VjMsrNuxUDTXfsDk
	l5/VrKs8s09JEK2nbUSWJ7K2H/C4Z2Zrpcp4=
X-Received: by 2002:a05:690e:484b:b0:668:2e27:22a7 with SMTP id 956f58d0204a3-6692f4d43c2mr1753682d50.33.1785429313010;
        Thu, 30 Jul 2026 09:35:13 -0700 (PDT)
X-Received: by 2002:a05:690e:484b:b0:668:2e27:22a7 with SMTP id 956f58d0204a3-6692f4d43c2mr1753652d50.33.1785429312567;
        Thu, 30 Jul 2026 09:35:12 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c734cfasm1633877d50.6.2026.07.30.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:11 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:35:09 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 06/11] clk: realtek: Add support for gate clock
Message-ID: <amt9Pby8K7w9Mxkw@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-7-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728142806.1954638-7-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Yu-Chun,

On Tue, Jul 28, 2026 at 10:28:01PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Introduce clk_regmap_gate_ops supporting enable, disable, is_enabled, and
> for standard regmap gate clocks.
> 
> Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v11:
> - Add 'rtk_' prefix into struct names and function names.
> ---
>  drivers/clk/realtek/Makefile          |  1 +
>  drivers/clk/realtek/clk-regmap-gate.c | 70 +++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-gate.h | 65 +++++++++++++++++++++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 71edc18121c6..90c0658a83bf 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  clk-rtk-y += clk-rtk-common.o
>  clk-rtk-y += clk-pll.o
>  clk-rtk-y += freq_table.o
> +clk-rtk-y += clk-regmap-gate.o

Sort the list.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

