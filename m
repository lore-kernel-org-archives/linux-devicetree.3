Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB1F443E3F
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 21:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786399191; cv=none; b=f0DK28nYu6pQLfuYFnCZg36qFgXAOrW+GGCTLb6UkuPAG0GHkYDtnjpf5uxYSHq0mF6K9iFJ3W+zYCkFaZIHdEeJ/7aNCyWsRjHEgudaL4ijfp50YdAwYq6eTgiiF3UO90pJTNF2SZ+ua3WsopmGKUsQHeRoOwlECF4ZogZ1sDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786399191; c=relaxed/simple;
	bh=WGRaFchSac3g+d7dCJ6oKbRm7IjQJlD16qXgPvpuuT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/nQKYGf5A8m+rE+Z3p6hcwAko/gHWxIXWLuM2dk3to8SIW+Loc4/z3/jS++2E76dTWFwK72n9LorqUDlXJP+oqa70SfgpCRYfG7QNXYEJsTtB1OvkHbyVllyn4IYRpF3Wya8d6nuBG+Jum50EjVRM0/yMJKDE8wuxEb8fmEAJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QkyawYpC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PJtPjCD8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QkyawYpC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PJtPjCD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786399188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM0jDu4T7yH1UL3y9Xop+wHBl7p45KQE498sSn5/W1w=;
	b=QkyawYpC7SWdDey1vZaWhuhpXR+jxF2NhwH9F1Il3s8kDdi8cHfbEbjRJxHtdddQOFsdYs
	yzQDPCN23+jHb/G0hKYwxWYn1AoX34IN9vV53KaK3JrQxYKlRJM2Zt0kwP7y3FsqLOHtac
	QbewHhvxRCZ+2xoN8Q0zpBp6t3EBCiI=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-UFgubdv3MT6lOLjpHkiV2A-1; Mon, 10 Aug 2026 17:59:40 -0400
X-MC-Unique: UFgubdv3MT6lOLjpHkiV2A-1
X-Mimecast-MFC-AGG-ID: UFgubdv3MT6lOLjpHkiV2A_1786399180
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-80ee3cb097eso82055997b3.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786399180; x=1787003980; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HM0jDu4T7yH1UL3y9Xop+wHBl7p45KQE498sSn5/W1w=;
        b=PJtPjCD8zXEHxfYR141w5awgbodb/o7B5Ser56S2lZTz9ZS9njekyVyJPp6/AFX6rn
         mOJCwRmwvprLAzvVr+BLcDuOJPy5yX7cdENjEZrMZgIXxD/cCDQq9oRxPSFgxlhU6IFS
         vHXyYqGVG/h3K9YYSi6AXlK+rIOV5Jtuxghyk7T5qGR8UHVV4wfSh3G1ccK0/FMNtPlM
         5yx42ccpBNwLgqrKfTk6H5Hgp+JyUaQpcNfXlcyZejiC00diAk9kNZ8VsV0RNyCiBn7x
         4YM2gRQ9EoeFYfhDdhxmXttk60HPLUws/88BteNHE1MMNp+skS7QQrcbt6JAu88ByYx+
         tGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399180; x=1787003980;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HM0jDu4T7yH1UL3y9Xop+wHBl7p45KQE498sSn5/W1w=;
        b=BKDhAJGI0PD+qdGPjXWcI2xt41ptd539CM973HEqDB1p4Ke7/tjt5c8V0beKqE0+l8
         E5PaDfA+Clsb1q8W66LK4jAsk5sM7jyaVDQ02bdG3SKqCGZV0pfoDEnQpnqrBvXtp3zP
         OQ7SxZmfgU1m19qyjVa8b2tJLje9ZIPttNE78nMNAgAg+93Q1NXXXPv7tjI9GxRRaqP2
         kMTuQGmHzDdY7Q7rjfXVDUNz38Eh9+lSvt4sxnY8qqWOglWGRWAftFTVdqnNXINW1lM3
         v7BabJOLqEvgsYCOyCm9aYmPe/GZ9V+oV05WvCm23qJucIBMqVpxAM0F7lKRwX5CgXd9
         UaLA==
X-Forwarded-Encrypted: i=1; AHgh+Rro9Z9kVZB6t6RKWeCj8LLKJdbRvjQsGhkzWjPkrFLDOKmgqkF11WNB6xp9sZp9tCbc9dbhdYUKN3bf@vger.kernel.org
X-Gm-Message-State: AOJu0YxjUXohuInUVWXGOLboAuBashEnECmxdWLIDZ2imdNpXOt0zWOL
	/Tp9NHPP80zQ4QwadylS65rMQGNgMN9B8zBOfvtoW07iTlv7CAS9ta021fUm7A2ia0sUMOOLIVk
	pKSTBj/oXe1THBnVUH4aQnpMjueFlVhoXcyeWzjCtTB3mTL8jV8HxOnu6G7kbK34=
X-Gm-Gg: AR+sD10aaXxoEXHxy0OTd2XqQXHK1ctlr4lM9n4sJUvRBuadP+JjuIC7p+73Yq8Z3MC
	CePvIW6IYHyXzU+ObMYsJnHcJUjnzYnJgSxoDuwXpBS/bkJg814oCNhWhU67w2xjImsZO1GKYKU
	TB9W9u07loS9yqz2hKzkVagMSuSFlTL/4lO6VSe+QwxL9jbQPOl8i5ahHtp3JlGBWOQG8Ns0RwE
	yuLhiYARn0Uy8aMH6i1jCYfnF4V8RVYvSW98qmom7owVz0Q6lB+yDO67jY2tPKV3SMQ4gf6o9wz
	yKiS0iIFu/8NmtNZJg2iG35PmIQKONp8ZJjfzB3zaaFq+QdvGUifd2N8d/dOCtpUloSnC37TowD
	h4qukUnACsUwBHjA3r6kDvTKI+KmPs+UcfNA=
X-Received: by 2002:a05:690c:2506:b0:81e:eb11:6e5f with SMTP id 00721157ae682-820229c195cmr279357057b3.34.1786399180121;
        Mon, 10 Aug 2026 14:59:40 -0700 (PDT)
X-Received: by 2002:a05:690c:2506:b0:81e:eb11:6e5f with SMTP id 00721157ae682-820229c195cmr279356737b3.34.1786399179584;
        Mon, 10 Aug 2026 14:59:39 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823efbf208esm64134367b3.10.2026.08.10.14.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:59:38 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:59:36 -0400
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
Subject: Re: [PATCH v10 10/12] clk: zte: Introduce a driver for zx297520v3
 LSP clocks
Message-ID: <anpJyOYpFBe6ah0I@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-10-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-zx29clk-v10-10-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Aug 10, 2026 at 12:28:29AM +0300, Stefan Dösinger wrote:
> "LSP" is ZTE's term for this part of the SoC, I suspect it stands for
> "low speed peripherals". The main UART is here, together with the flash
> controller and more surplus proprietary timers.
> 
> It also has one more I2C controller that supposedly connects to a
> battery charger, SPI for displays and I2S for analog telephones. The
> boards I have don't have any of these components though.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

