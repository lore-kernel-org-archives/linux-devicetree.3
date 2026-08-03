Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0612F416854
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 14:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785768020; cv=none; b=Pt6cFlutg/rdGNj5vpqzaL6vHllQlGyGvs7K7iBuwcuU4WdcouU+rydWZyld/8WhIG2AHldE3aJ9L1juQZh8rlz9IaQbPOL7FzdwoR3sLXFCDbQezge2KMgduIWcwDeUcqmPr2bZWAtKcJisI+T2iy9BClUULFMjfxrFouS2nbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785768020; c=relaxed/simple;
	bh=yRItg3rDqLQ6YBYhIhF8iPn7fPEpjv7eS82GGOPWVH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cg+wY1vjrnOpbPjIo3CUxIvV4loV9AYztxW9BdFqkCciPd4ubrHVlxJurSz8wJhwKUKqamtTWEJmE9ow4KnYdj5HOlHlk950JswavOp6a/oAoPdXiSR2Vq/VLmxmSOeaTi+XRlrnpExebjKpTF4jYcEdoRztq8plEk0mR/CdbJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fnYKYavF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GaCPVV2C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fnYKYavF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GaCPVV2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VmoRzRSGaYrgmLSXQHd8nxnywAiGDAxo7QcVjOS8Dtk=;
	b=fnYKYavFcpINdb7K40+tc4/VABTRMNMtVknCxtmKkU+yEEKVu+aunsgYGfBG999fk4PNAD
	EWU6HHjElV6gyCxd3wExuTmQzK4syHAbXPuywWZu1KmS6q7QWWr+fTdTJBktwkFPsaqXXU
	gbEzEMrKk4VCYgAa+nelxgemJpxg/BI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-4C2RB4phOc-IlGlfINHxzw-1; Mon, 03 Aug 2026 10:40:05 -0400
X-MC-Unique: 4C2RB4phOc-IlGlfINHxzw-1
X-Mimecast-MFC-AGG-ID: 4C2RB4phOc-IlGlfINHxzw_1785768005
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e67e87752so32286087b3.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785768005; x=1786372805; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VmoRzRSGaYrgmLSXQHd8nxnywAiGDAxo7QcVjOS8Dtk=;
        b=GaCPVV2C6EiEsAPf32UL1SA6BBsZ7S8GnmY3MeGjMgGxUI/AJ/RyV/kTFgxVVa4H+Q
         Vc+nr7dgrPD2C5BNy/hCHzb+ReMBg+ecv14vBNi7QsWbWpA9dpzv+xoHJx+p6lvACXpi
         EMF5f8jLBmzhBQEvpdRdag7uwy1mHxMpAT4sUx/SVSCqdTV9FrEcYWpp2QO2VhhFqSEg
         G6TXsbOL7uKsWvWA18oeMzT6kWy8TAnm5VCufww1E0oVl1GaAHhZhxB8hPWZb2LttA5b
         BIRnWWVJbxRyQvZHqIM9XwNrxhlhfcw7y1AWl1Y2xpu87Y4zfby/pre2qoZQa6FJpk4Y
         gW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768005; x=1786372805;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmoRzRSGaYrgmLSXQHd8nxnywAiGDAxo7QcVjOS8Dtk=;
        b=ILpCtDrcopQ1z+GZ+p37z6YkNOnGuqjP5OKRFO9ChpKpRLe5jkIqcd4UcO2ceOVp4M
         1jOwEBdpxFuMLfcPCuinG7f0JRHradDqA/v1kgYCAOQ1KeqAm3RIEyXUf2pqqAMlVeY5
         d9LtnJPSpSXvJ4tGsDW2yPiKaylRMZFv4/qj92IIvd2oRuyrz7UWMBnsmxHXrzwRjWjo
         K4GSBfzJUOrRXRgNLA5WUlL2sUeHPEcCMcYFbmyKJBVGaqgNAX+bGrWH/ZiJVJOWCA6f
         4CK8D/YgdWWM4/O3BrX+47Cti6r4T/VfYv5i1l25m5tk+TyiXCRtpK1RdXO2o9Q03Epm
         OIVw==
X-Forwarded-Encrypted: i=1; AHgh+Rpbe8/NPF8OZCj2XAW5Kvx7cvuCO5XA7s4o8kXpo3t7RjS9jpXavw33p5DSOUaux6QVd1Px++tL6vWk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5dqOfFIwqRPijjFmZkZJz23tJUW+WVA5yHYl77peinuqG6Pkv
	UzuVbjQ9zjgDilR/e+rBzOTCpsgnHK7K7W3tC1fkTWpS4O4OO5ohIFUDxdIb3jT2R4WosvfN7xM
	VWie0gIxG9PhUmQfaKwUXiS8kfh9emMerXmZIsjYAJlSsj9cOFQ3yVezLMML4nkg=
X-Gm-Gg: AR+sD10bf48Rh/fkOzvvJAcduYikDM8vi8/WL/l/2aYF5pP1tJjZnccJWB0RuiHsiW9
	EOSloF4jYklD3kGa9lQWIAkdJjzWjNbQcu/QLUCXGwZTT5O9+iyD457KZWpXlt22aDJZFdGOQ8P
	a2qgnyhD3Nl4NIWObL7yWjDpZeCyC7H8gz9FeCgs3zwBFLvxskwoQMf7sATKHB3UOa7Emhb10to
	bbNXU4QQQ58hxzWl3qXx4rkFkyWupmgBKJYybjp+rpRBAiY0ZjIl0AHg/nXQtsow93j7BuyXHPV
	qQAFt0oezZ7n1PikDMwVqMgYolYj1jMl1pQficHcuWBOwY+M8SkBV+KUL4JxyNXc2CYnRBBXWUV
	X+QowMhnVsClRepXkji84+p/EHSByi12qkng=
X-Received: by 2002:a05:690c:6b0b:b0:81e:5a57:b8ad with SMTP id 00721157ae682-81fd4b51df0mr122408267b3.21.1785768005019;
        Mon, 03 Aug 2026 07:40:05 -0700 (PDT)
X-Received: by 2002:a05:690c:6b0b:b0:81e:5a57:b8ad with SMTP id 00721157ae682-81fd4b51df0mr122407797b3.21.1785768004486;
        Mon, 03 Aug 2026 07:40:04 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d6fbbsm55781147b3.25.2026.08.03.07.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:40:03 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:40:01 -0400
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
Subject: Re: [PATCH v5 12/25] clk: mediatek: pll: Add PLL stabilization delay
 definition
Message-ID: <anCoQeS2OoucB0mO@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-12-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-12-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 01:20:58PM +0200, Louis-Alexis Eyraud wrote:
> Several functions uses a hardcoded value (20), to represent the
> needed delay to stabilize a PLL.
> Add a common define for this value.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

