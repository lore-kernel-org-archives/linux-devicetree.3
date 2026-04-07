Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0DB14F112
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591857; cv=none; b=QPkJDYke93gh2SNAY9z93t6fzJ4ePU7Vh6ctlMPjaZbFAJ94IzYJ7cKXDkdObfR38P2ulP3bqhFKABlbXPgZOZOA/KRE92T9FTTaZBhxbcVM/MJCswAQd1r3h9uTcMEDiVddlya9lnpQlZwsLw5MZBtWUWgA24WKm5FVfGR2c6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591857; c=relaxed/simple;
	bh=YaMK1wa3MMIxrwEsDAo/lFZHK1vAA8Ru5RJohvf2o18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWRz1EZTI+Eq+gYO53X8V7oH5bWhqvhTROpfKe1tfOBwtVnfxGbgE8KVzi0Y80sbjArEEQvbZXJbf2Zb5qBBgLh6oR/FKEUJDatKIwws/45NVfIloH++MUDM4r7zvDTq98yGSPWeTosDVBurnK+BSaZuR8ZR9P2FYaicPha3/T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNuwWYJA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=D9t7lNKf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNuwWYJA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="D9t7lNKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775591855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=afqKvOBY6UcokwbofYX7GYTJbiVKQVdFWAEZ5QM/NjE=;
	b=FNuwWYJASDSyJUSgwfZgU1pD91wz1G+pYeFDVsIaHjkoQTtjrWTZP5DCnvZpOZ+d0ZXMiM
	9UdOWUSzMtOD459uf4Vq58pc+wEfs9Bmw5cZMxiNZ1sAS34h1rLrwI8+GRa2u7gfQ8RTNs
	s/IWQNFCfp43WsJg3K/rdaMNYi4OIVY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-vDqkFBO1P36h6eywahqiJQ-1; Tue, 07 Apr 2026 15:57:34 -0400
X-MC-Unique: vDqkFBO1P36h6eywahqiJQ-1
X-Mimecast-MFC-AGG-ID: vDqkFBO1P36h6eywahqiJQ_1775591854
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4661881eso68437811cf.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 12:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775591854; x=1776196654; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afqKvOBY6UcokwbofYX7GYTJbiVKQVdFWAEZ5QM/NjE=;
        b=D9t7lNKfmj0NZLfVhnO7KrCgFzVeFSN/0B9x37Y72vjePWg3DnRAgCSqTr8LfJEdgd
         Ewb/pFkEvbhCRBwNI8frYDISv5HmNv16MECdJC4SUbi0VC/1qmU69szN43/bhElLiZFC
         aZJg6cZdkS4P+p5SDN5NE6eKXrpppcAeELrugtCGwGENkWuJ/H4XjxQih0Dj0NdxBwT0
         QusgxssjrW7roRD/gjJH5FE+G6whwIWlezH53qhz5nBfxrIlGFX2KSsW6WFueYoXLR9P
         BieJVLgfhqtqkA2dbnSDCtwDGOGZVPoor6rDGt2TMckhl3tHc3b+Fan8ApOJfeoP0v5V
         quog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775591854; x=1776196654;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=afqKvOBY6UcokwbofYX7GYTJbiVKQVdFWAEZ5QM/NjE=;
        b=X8s1n6j60VYWcGjYui3e1UpCKhQRKH6rkvJkgDOOFQnr7EtUUAxZ6XDveOSI2Wa88Y
         2dFeZR9fBUdBul7e6nExZZeVzAM6519WsRTxeuseDbqrnrjTNJBJZOd5ip6mzCzSlaXZ
         FSwMtlu2jF6GWTXS/EB5tejfvDBXl1jTr4+5izGPSrMbB1vVve72PFo0qU+od1yFbPXw
         /fzvIeB2Dinx94h4l11QqTGsxQB5ltgTBkvWK8gCjl8CphBED+yMooFEBWQJftPSy06s
         pkHOI7w7rqirP0LPsAE5Emh1yIHgNcaQm2v/lLMYD1z7G8harTPT5jgN1Xwea65bOexl
         oCSA==
X-Forwarded-Encrypted: i=1; AJvYcCUx6nlCzNJeUWn8RKCQdQxRmLxYY+Qe0yy+M53Unuw+6HoqwAsGTd57NgyZG+yHGftOtoN9iaIu3rDJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzwpSM9Y5kWZraudAuXznsQwXi/fhTK0fVrxWlWq1jnL5g49gT0
	5sv0n0Bdi36WVJwtjqJhOKIjXijNnV74dRtMs7Zd2/oX4ouSO2fAfHogLQvKc449mH6ks8nqm8F
	RtOnKf+Q3mGqXD3NI0fvveE33jzbt6/3Jdbp3nqDpa1M+U8/FR0zdC3DcI/7B+Hg=
X-Gm-Gg: AeBDieu4pZqk0pmYESDat3n3lJeEN1LKC6IxhT1tJ7S5MSPmKI++uWUu2kCNhtKofS4
	T15ppAHSj6auprBiosX1sIMLuNeaP8tJ7qgCRQr61KuAmJ5EmiBaixs+X9Hgnz5iVUJ9wN8gHeq
	RSzqBcle2Wcdo22cEpIP1dql+jthNJX6PssP01aBYe8WvEe6N8kgVvvA9jrzQOH8qMu+VngL0l0
	VomD5GYWaad+wYZAarAb3iHCVqxNLxxOM9KZNLdXh+euF+dTHUScoXpB6S0r/h9sLxz36sCuuyz
	nqc7oyW0laLL6INO2fhjx0wlKQUGBDALlLIJ2n4TX4soBD5ubBS0+x/gktptfGrxzrKU/B8yY8F
	9x8aVEXRDRQUbM2l7oAY=
X-Received: by 2002:a05:622a:13d4:b0:50d:83a4:2995 with SMTP id d75a77b69052e-50d83a42dbdmr187698371cf.21.1775591853853;
        Tue, 07 Apr 2026 12:57:33 -0700 (PDT)
X-Received: by 2002:a05:622a:13d4:b0:50d:83a4:2995 with SMTP id d75a77b69052e-50d83a42dbdmr187697771cf.21.1775591853165;
        Tue, 07 Apr 2026 12:57:33 -0700 (PDT)
Received: from redhat.com ([2600:382:772d:3619:ed0:4a9c:acd6:3fc9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4aed181asm164262931cf.0.2026.04.07.12.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 12:57:32 -0700 (PDT)
Date: Tue, 7 Apr 2026 15:57:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] clk: fsl-sai: Add MCLK generation support
Message-ID: <adVhqkj-cFbFBrZH@redhat.com>
References: <20260406215150.176599-1-marex@nabladev.com>
 <20260406215150.176599-6-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406215150.176599-6-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Marek,

On Mon, Apr 06, 2026 at 11:49:46PM +0200, Marek Vasut wrote:
> The driver currently supports generating BCLK. There are systems which
> require generation of MCLK instead. Register new MCLK clock and handle
> clock-cells = <1> to differentiate between BCLK and MCLK. In case of a
> legacy system with clock-cells = <0>, the driver behaves as before, i.e.
> always returns BCLK.
> 
> Note that it is not possible re-use the current SAI audio driver to
> generate MCLK and correctly enable and disable the MCLK.
> 
> If SAI (audio driver) is used to control the MCLK enablement, then MCLK
> clock is not always enabled, and it is not necessarily enabled when the
> codec may need the clock to be enabled. There is also no way for the
> codec node to specify phandle to clock provider in DT, because the SAI
> (audio driver) is not clock provider.
> 
> If SAI (clock driver) is used to control the MCLK enablement, then MCLK
> clock is enabled when the codec needs the clock enabled, because the
> codec is the clock consumer and the SAI (clock driver) is the clock
> provider, and the codec driver can request the clock to be enabled when
> needed. There is also the usual phandle to clock provider in DT, because
> the SAI (clock driver) is clock provider.
> 
> Acked-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> V2: No change
> V3: - Rebase on current next, update mail address
>     - Update commit message according to clarify the difference between
>       SAI audio and SAI clock driver
>     - Pick ancient AB from Michael, although this may be outdated
>       https://patchwork.kernel.org/project/alsa-devel/patch/20241226162234.40141-4-marex@denx.de/
> V4: Use the fsl_sai_clk_register() helper.
> ---
>  drivers/clk/clk-fsl-sai.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
> index 7ec9a4f22735c..386ee5f77a986 100644
> --- a/drivers/clk/clk-fsl-sai.c
> +++ b/drivers/clk/clk-fsl-sai.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/clk.h>

This include needs to be moved earlier into the series to keep
bisectability. It looks like on patch 2. I'll also comment there.

>  #include <linux/err.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -15,22 +16,37 @@
>  
>  #define I2S_CSR		0x00
>  #define I2S_CR2		0x08
> +#define I2S_MCR		0x100
>  #define CSR_BCE_BIT	28
> +#define CSR_TE_BIT	31
>  #define CR2_BCD		BIT(24)
>  #define CR2_DIV_SHIFT	0
>  #define CR2_DIV_WIDTH	8
> +#define MCR_MOE		BIT(30)
>  
>  struct fsl_sai_clk {
>  	struct clk_divider bclk_div;
> +	struct clk_divider mclk_div;
>  	struct clk_gate bclk_gate;
> +	struct clk_gate mclk_gate;
>  	struct clk_hw *bclk_hw;
> +	struct clk_hw *mclk_hw;
>  	spinlock_t lock;
>  };
>  
>  struct fsl_sai_data {
>  	unsigned int	offset;	/* Register offset */
> +	bool		have_mclk; /* Have MCLK control */
>  };
>  
> +static struct clk_hw *
> +fsl_sai_of_clk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct fsl_sai_clk *sai_clk = data;
> +
> +	return clkspec->args[0] ? sai_clk->mclk_hw : sai_clk->bclk_hw;

For the case when clock-cells is 0, should this check:

	clkspec->args_count == 0 || return clkspec->args[0]

Brian

