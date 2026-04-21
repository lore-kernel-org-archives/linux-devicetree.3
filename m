Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8F93DD53C
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 20:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776801788; cv=none; b=ExZ6PV6LshsFbJ6FR/1ouAGRNEEe3tu63zIUBZJBDwBpP7owQPyXKS7AP6JiIImXsNM06GO4CxxT594Zm1bXx4/1x9id9DaaBXEIAwYEcrehoSU3dJ5gr29WjN2qCUEP4LUOwOUR2jqP2CofaaEOOquC/C3Ef/pTR740Uvb4LJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776801788; c=relaxed/simple;
	bh=z/yo03AiSA0eCKVwpNdHXlr1nQWbFRacndf5yazbhEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YywngCJKz6DAnOeaUf2Lkezvwf1uRuJT52WxbFao+4hm7qQ0I2unoYWOy26hP70Gwothi2CXJV0u+b1iI3cFakf4odymJtzWilvOUGs8h33T6tZgzYf77vdkJVM2pFtCQBPRpA5HTh+B7IFF6WuaFum83zSm0SMm3tviRwMQYpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NUOh0Iy6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qf5CfghO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NUOh0Iy6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qf5CfghO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776801785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3zuspwqjQXluBmm8BYsT+wPUm5BBdmNQ0nxP766NAw4=;
	b=NUOh0Iy6C0uf3xQ4nV4W/dMLQmEzQI+6UEDFs5oa+GF7qmEXgEE8DBZNFi4xzizqj/x0Ux
	3r7isUOUXFpdokJE3hLsbivUO/a80LY2g2loVR21wK9WqUAyRCtFYFRReU6lJ/ldMvmLq3
	j9+blwwaQL/9CWzDmxv6HD5ehnNvcik=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-SqIGVxuENGOOIWITDe4bbQ-1; Tue, 21 Apr 2026 16:03:00 -0400
X-MC-Unique: SqIGVxuENGOOIWITDe4bbQ-1
X-Mimecast-MFC-AGG-ID: SqIGVxuENGOOIWITDe4bbQ_1776801779
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so70006176d6.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 13:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776801779; x=1777406579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3zuspwqjQXluBmm8BYsT+wPUm5BBdmNQ0nxP766NAw4=;
        b=Qf5CfghOVthZvhlWyx//1FRq1D4MEv2vkPpXuvZRNNKNtZ1GdGI/h3UDhH/WP8brUU
         2fBYsUlv+FLtOF0MeiwjAgPLHVS9pqRL36VN84uOkdQFlZgwrEfoHFneEW7LnCAOLA2S
         er7vnuc0kNZAP45MakmSHkbWYikZNlv9FQ2VzVvR9S+UyYgEx+lBS6Xp12Biz30utn6+
         UHeJnihQXQCoNFe1Zvts8Ht3emDdBPeevdwyiprqTznV5ZvY79KPENwqVcQU5yWwOQzP
         PWsZGfC74eqZdktTUqT2vAFlxaO0EsVu/WeXm7q/ecwiMDGxEvO2HK03GRaf4tWf6XIC
         UbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776801779; x=1777406579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zuspwqjQXluBmm8BYsT+wPUm5BBdmNQ0nxP766NAw4=;
        b=pGnppnigMmZY9ZX3u9oeAEtACBj6oc7uTliLLX3IuSL5gE7587AZxKRG/cWGHoLK9U
         scD5gvNgSMPTWh6DkY0KGnd7ankzLeYYhFCQIISJwtCxMKTdEQBopoQ6oKyCnQ3M/UeB
         FpCWj8jPX4sROTyCe83GHMBhtISzJZym7M82l0EcCfoW6u0dWo5DKj91FYOlmcvOKTLE
         NKRE0cYl+XhNOoKE1Qx6zYGGUS5+Pqiiq5JsJkQoLK6Jn5I3y5IybMehnlGbp/08sRI3
         vxCUqyjgZ93u9jtmzl4oHbmDZSKMIZQGQzLntUU1q9t78JHBg8H8WGLt7pDZUwRvBvmL
         R7YQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nE7UeXzS4Lsxy2jgar+GLIqMz0uPDEn8pbXPPRXBwXrOKEq0Q5rMGns0fH7xpxjyRXJGyesItpSdj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8OSMWqy+4GRUYdJp35IBrA8QAhLBxw6iVfqZvyni8goDKmw31
	mJXEnOdoEGY4bhV0jxbZ9HMgO7N+U6fvQuH92fsy6g47cV+4kbnyEKUbGK6ODabi+GiK+ZTDGsj
	iqfUKteWJ8tj4Qt/XTo/bedU2Xq77f1ZTm2QxBIqetNqOGYbvhqrHi87C58laDR8=
X-Gm-Gg: AeBDiet3Rjxq10n/aL7s/AswjsJ48dNxO5JVxR//mGLdfQSKAx03SAD//tQozYXnOHv
	QwCwaKa4whlh3/SAYc9bOiJ3+jyZNrHQwqk+symBYsUw6rsQ5ja9Gl6194CzYEk9EOZCHU5kfJ7
	29Ij8Nik+sWGep3tqkLFkLf0HJlIbuJuEQMosmb82EJFsMilEH+ONegM2/FbrqJTYZSlzWXAkIh
	l4gBwcbLJPQQkiDnxx/3lkGj4AIgZXSUdYvett0UYIiJ2hZg7/3YFzV3LQZ7nGWe38LzmjDZ2P8
	4XYBhtalUh8+fwP1mg+lPnF5p1yCM7sKCKpW6GOxEhJnzWABXQu8E+Zp12fzxqlX33M1fd88hAG
	7yedkhFeQQfaei+gI1IvbUjdtyG/WmrKY3xoxGIHnXw==
X-Received: by 2002:a05:6214:5b87:b0:8ac:a5a0:481 with SMTP id 6a1803df08f44-8b028015984mr335684726d6.4.1776801779260;
        Tue, 21 Apr 2026 13:02:59 -0700 (PDT)
X-Received: by 2002:a05:6214:5b87:b0:8ac:a5a0:481 with SMTP id 6a1803df08f44-8b028015984mr335682706d6.4.1776801778111;
        Tue, 21 Apr 2026 13:02:58 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5ec2dsm115982646d6.29.2026.04.21.13.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:02:57 -0700 (PDT)
Date: Tue, 21 Apr 2026 13:02:52 -0700
From: Jared Kangas <jkangas@redhat.com>
To: jan.petrous@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	rmk+kernel@armlinux.org.uk, vladimir.oltean@nxp.com,
	boon.khai.ng@altera.com
Subject: Re: [PATCH v11 4/4] stmmac: s32: enable support for Multi-IRQ mode
Message-ID: <aefX7Ajltzt5EqIR@rh-jkangas-kernel>
References: <20260312-dwmac_multi_irq-v11-0-09621ccb040b@oss.nxp.com>
 <20260312-dwmac_multi_irq-v11-4-09621ccb040b@oss.nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-dwmac_multi_irq-v11-4-09621ccb040b@oss.nxp.com>

Hi Jan,

On Thu, Mar 12, 2026 at 09:55:30AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Based on previous changes in platform driver, the vendor
> glue driver can enable Multi-IRQ mode, if needed.
> 
> [...]
> 
> If those prerequisites are met, the driver switches to Multi-IRQ mode,
> using per-queue IRQs for rx/tx data pathr:
> 
> [    1.387045] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQs) selected
> 
> Now the driver owns all queues IRQs:
> 
> root@s32g399aevb3:~# grep eth /proc/interrupts
>  29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
>  30:    0    0    0    0    0    0    0    0    GICv3  91 Level   eth0:rx-0
>  31:    0    0    0    0    0    0    0    0    GICv3  93 Level   eth0:rx-1
>  32:    0    0    0    0    0    0    0    0    GICv3  95 Level   eth0:rx-2
>  33:    0    0    0    0    0    0    0    0    GICv3  97 Level   eth0:rx-3
>  34:    0    0    0    0    0    0    0    0    GICv3  99 Level   eth0:rx-4
>  35:    0    0    0    0    0    0    0    0    GICv3  90 Level   eth0:tx-0
>  36:    0    0    0    0    0    0    0    0    GICv3  92 Level   eth0:tx-1
>  37:    0    0    0    0    0    0    0    0    GICv3  94 Level   eth0:tx-2
>  38:    0    0    0    0    0    0    0    0    GICv3  96 Level   eth0:tx-3
>  39:    0    0    0    0    0    0    0    0    GICv3  98 Level   eth0:tx-4

I ran this series' changes on an NXP S32G-VNP-RDB3 (dwmac-s32) and
confirmed multichannel TX by doing a basic iperf3 throughput test:

    # dmesg | grep Multi-IRQ
    [   37.463467] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQs) selected
    # iperf3 -s
    [connection logs snipped]
    # grep end0 /proc/interrupts | column -t
    29:  0      0  0  0  0  0  0  0  GICv3  89  Level  end0:mac
    30:  968    0  0  0  0  0  0  0  GICv3  90  Level  end0:tx-0
    31:  0      3  0  0  0  0  0  0  GICv3  92  Level  end0:tx-1
    32:  0      0  3  0  0  0  0  0  GICv3  94  Level  end0:tx-2
    33:  0      0  0  3  0  0  0  0  GICv3  96  Level  end0:tx-3
    34:  0      0  0  0  3  0  0  0  GICv3  98  Level  end0:tx-4
    35:  67302  0  0  0  0  0  0  0  GICv3  91  Level  end0:rx-0
    36:  0      0  0  0  0  0  0  0  GICv3  93  Level  end0:rx-1
    37:  0      0  0  0  0  0  0  0  GICv3  95  Level  end0:rx-2
    38:  0      0  0  0  0  0  0  0  GICv3  97  Level  end0:rx-3
    39:  0      0  0  0  0  0  0  0  GICv3  99  Level  end0:rx-4

Also tried out multichannel RX by adding 'snps,route-multi-broad' to
rx-queues-config/queue2 in the devicetree, which showed activity on
the corresponding rx-2 entry:

    # grep end0 /proc/interrupts | column -t
    29:  0   0  0   0  0  0  0  0  GICv3  89  Level  end0:mac
    30:  4   0  0   0  0  0  0  0  GICv3  90  Level  end0:tx-0
    31:  0   1  0   0  0  0  0  0  GICv3  92  Level  end0:tx-1
    32:  0   0  1   0  0  0  0  0  GICv3  94  Level  end0:tx-2
    33:  0   0  0   0  0  0  0  0  GICv3  96  Level  end0:tx-3
    34:  0   0  0   0  1  0  0  0  GICv3  98  Level  end0:tx-4
    35:  68  0  0   0  0  0  0  0  GICv3  91  Level  end0:rx-0
    36:  0   0  0   0  0  0  0  0  GICv3  93  Level  end0:rx-1
    37:  0   0  91  0  0  0  0  0  GICv3  95  Level  end0:rx-2
    38:  0   0  0   0  0  0  0  0  GICv3  97  Level  end0:rx-3
    39:  0   0  0   0  0  0  0  0  GICv3  99  Level  end0:rx-4

I didn't see any regressions with light network usage, and both TX/RX
appear to function as expected.

Tested-by: Jared Kangas <jkangas@redhat.com>

