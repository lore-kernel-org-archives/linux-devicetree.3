Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C5D439328
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 21:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786399120; cv=none; b=VJbZlXA51JIoZW6IlNSbydhTCPRvg4NAsifQw4C6umfW29tY9V0QiJZgj0r2G4rGS2QGW2Of1v3fyyQWbD0Y9P6XMCKMtQ7IcT1ZnpghA0VW8zaMJwMRl9ZPZJV4PlPBmrdagYosJ+Xa8wYvRi4K5gpP1po3NM0zLDH9hfKrUyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786399120; c=relaxed/simple;
	bh=NoSNnLeKVX6y1LedGuemlWhGAhmlreluV4Z+fWM0exU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMlZDSR9AW7jCZERR7Jm+UGtdbjbr0WM5BHdaZg9DqIH//kyOj33pn8puBUswXf8vEIEUcDgDw9K+95XiPenL7VvZKhGddgPwAlOuOyCYuCh3oeU28kQOQCTWFR7HESgJwceK2YaCCe2ph3px2QONXRfRftYzOozuQl8jAH6H6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qm1AaD0h; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kGTYmVzU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qm1AaD0h";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kGTYmVzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786399118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qy1gE2gFEXUChO7E1GpI7tnTvfBOQiRyPrmqiAECFfg=;
	b=Qm1AaD0hJTPeE7gdsXZFO3vMGYD07M62mZo+l+oAb+0X8druWVLg2ZdcTQ1RgliGJ8Mxp9
	0634NhboIfhJdY9JjV2gzCwF+91Jf9P+d53b0vd+qckpDxNIS5qW9GNnC3zmw92EyI9HYh
	o7Yq3LvnotLAJ/h0Smd15mgkEV8Okmg=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-SPpd_WzvPjCHjfjs2RH38Q-1; Mon, 10 Aug 2026 17:58:23 -0400
X-MC-Unique: SPpd_WzvPjCHjfjs2RH38Q-1
X-Mimecast-MFC-AGG-ID: SPpd_WzvPjCHjfjs2RH38Q_1786399103
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-668b2c03fbfso3904269d50.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786399103; x=1787003903; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qy1gE2gFEXUChO7E1GpI7tnTvfBOQiRyPrmqiAECFfg=;
        b=kGTYmVzUzMc/uHXVKIzXSyJ9dbBEO2dUuRh81KpjrrX2jvif/rupUNLNxTeiQ5yrHS
         /K41NSus71QIogvu9ZbJsaF3t8oDWYVlVSsZRENjN7fbL+Rf7lm7qIQi0K6B3NRovu3O
         oiZl8RXW+1laBqG+T4kfS26yFvuTHEsXHsDJpWxOXv81Mg+pIrwI3DMwM6SmVLhl51B4
         hZ+lSMyTRlolUq9Aq9BJE5LiskVZGMML1Vj2UQaSNriebqCiiafZfZS3EEgwa7354RmO
         /KjVyuxP520lpCIefKtS6sjohuQBSA0hgFCjBdWccFyw+03XC0oC30VEbukHKS19xOmL
         F7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399103; x=1787003903;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qy1gE2gFEXUChO7E1GpI7tnTvfBOQiRyPrmqiAECFfg=;
        b=UWzjBbUdcnTwJ0x7eJXNu1QVHBTa9XpN/MYqHQXVU3vkw5suQialhD8eIQ+1hh5Po6
         s5laKne9C/4uSuXbsqlHIhlUmp95fSRVsfsD+HItmcI7zOK/qjANPa4Fsq1zg38EDMw4
         saA7X6cak4aNNikoD+yfyG2sSsEk/awQ0aAJNj8jpYS2CwpPKlY9raE9q0+AxoyI2cjU
         1SwxUryXQU6qUXjPOc6G4XmJLGJaQ5xUTnlOOk0/+ra585st200V/4CgCY620Q5eNpsk
         mEy3YBESlpdxS93IKYcraBYLVNE/qZ6Jf5PCn6dnuzBlqhBX83izgcB+7mkTCD4jB1Jj
         bkSA==
X-Forwarded-Encrypted: i=1; AHgh+Rps/GfbsT8Mv3iNqk9QON+i9v5hKhtmcpFmlIq9jdU42VbzmoqEaftlyUwoMVfrGz87jRmbeqtIl2x1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2MUbrVPhpN0Z8lWHo91yGwTGnwXCT1+/Ur6b9yWdX8eI4F/xM
	1pw4BW8Hw6JWDvuvZrkaoCJXvBQaRsTFG0nzcGEVEUKMIh3ioBOKFdgAb1ejUyLiHparblKeQqT
	D02pLPRNMqFeKUsLtfyypAHYwEGU3BG+it4a+0N3nq2Q0Ey7HlR0J72CK+OLvFg8=
X-Gm-Gg: AR+sD10/f+Ly8qNvwypVZ/Zlmzk2rDRBgyvqmAB1Q6t7sSfzflieJENgqcCl33eQL7v
	5HOJMYFF9GzBYe+H43dAtKno1iC8yLNhAMInlirtNV1ylca9yDd5IVcn4N6aEYnajalXo3CmM8B
	eCYQIcRe+88gdc9wYh2zJCvJUOLOz0hV4kZ/p1AW3kz22zoDtgNoWFfvWTyiwOV4RHEcBMplUeO
	YjnHFO3k8T/TCgEIEY01SUbDBM5muT97FWUin4UzzyjO/gU4QUhbluknphrY8M5rYJQZA7JPfQH
	bzl/dUPQWdON6sH4+eA8TRnxhxXZ6YBapFEzED+mkgT0CCAthEg0PIN1V9nrwPyScEazs+uhc5T
	UCHOh8/HmMgKOLmQJgTSaW8Fvg9AhUdSzMNQ=
X-Received: by 2002:a53:a48e:0:b0:669:113d:7183 with SMTP id 956f58d0204a3-66ac3016a1amr14341634d50.40.1786399102949;
        Mon, 10 Aug 2026 14:58:22 -0700 (PDT)
X-Received: by 2002:a53:a48e:0:b0:669:113d:7183 with SMTP id 956f58d0204a3-66ac3016a1amr14341602d50.40.1786399102538;
        Mon, 10 Aug 2026 14:58:22 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acae8584bsm7562472d50.10.2026.08.10.14.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:58:21 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:58:19 -0400
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
Subject: Re: [PATCH v10 08/12] clk: zte: Introduce a driver for zx297520v3
 top clocks
Message-ID: <anpJe3-voStp-5Pw@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-8-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-zx29clk-v10-8-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Aug 10, 2026 at 12:28:27AM +0300, Stefan Dösinger wrote:
> This register space controls core devices: PLLs, the AHB bus, a lot of
> timers, the USB controller, the Cortex M0 processor that boots the board
> and a few other devices. For some reason the LTE coprocessor is also
> partially controlled by it. The main application processor and DDR
> memory are not found here though.
> 
> The register to reboot the board is found here, as well as a register to
> control whether watchdog expiries cause a board reset.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

