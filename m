Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26133313E2B
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 14:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767968; cv=none; b=WF8o4w1x8F+qLRYtGgTCV+TIhWm9bI3sLtxRkN2/LP3lvYxp3Oi8w1CDebUpnDYIYnE671HykQ5sVDEzdgWbjrq7eHks0r+HbnhvcxcV7ST1wQQX4pTvS30wTmpNauE54srwzwttKaU8J9hpMepid0xMaynLGoLPJUlSm29H6DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767968; c=relaxed/simple;
	bh=DhELizj98R/lR2a2ctjeOkiNuCTenIyitx+zvL/TJvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIp77ZH6BaZJGxq36Hkn+vuMsK0++AdL1Z7/rynIGi1pajlFDvLLHkqvqvCwuebSLmGp65UEnwHTv0SWyhblGuznel25yzOpoXrG0/t1Ytc4DEStuGuCx/yrKJUcJeaH11xmFq4FwBfJwz6vw+WsE6mkv1YQrSdigUyZLBPZu70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VpY03RXh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y5X0jC0k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VpY03RXh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y5X0jC0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785767966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JwikhXmMiyptngbwEJz5XWlF1hdjeBqdvWFYDWbslQ=;
	b=VpY03RXhZk7JddF5W0BLas5Uo5sDSPoMwjKd7D93nQQftm1QZTXy7Spoi0ELnzckK9yshJ
	u4qzlzlmfMEUQs2OhgrwU9SW8ZYZKl0YcO3nuNfXra5tkZqg72RXCeS3bPcMqJJkU8I+uW
	EmorgzQogPs+u+hJ3r6irI5xpH0vdlw=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-emKAugjNP8K1s6LDa3A52w-1; Mon, 03 Aug 2026 10:39:23 -0400
X-MC-Unique: emKAugjNP8K1s6LDa3A52w-1
X-Mimecast-MFC-AGG-ID: emKAugjNP8K1s6LDa3A52w_1785767962
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e76f0dec0so84679647b3.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785767962; x=1786372762; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/JwikhXmMiyptngbwEJz5XWlF1hdjeBqdvWFYDWbslQ=;
        b=Y5X0jC0kZM+YgMQJHcgPeeEFyoRNjuz4ikW4QmXO73vOk07H4TUI4V5tSywgIE9wM2
         TcYtkwQC+sTm7etUem9SetLS5T1RWv7hCf3l1wJNarsHkZvTIm2ikTvdd/QiEXFTmqnO
         C72b6vJbBAjkeYY4IMUJWm4on8PPaKtjl9T6E4VvcudmynIfORg+XzxBCG0zBD6D64tn
         W+ao0XnS/7rfGVu5j73U2XQhVDEbyWrHoGFdJeC7qJbmDWAPBj7hR9Z1t3Pc/6y0Uuzd
         8MouKok1H3Zmpxp5WBLdihmsTQevO/MSfI/1h5ADl3HmiKT6CxH6MKsYaTu0+CDTAAwx
         vlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767962; x=1786372762;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JwikhXmMiyptngbwEJz5XWlF1hdjeBqdvWFYDWbslQ=;
        b=IfZEDKV3VjaA27hm/HjppOz22NRAuLUlinyUAYcqxF5oF6T0myne7GLld9Hophlzo6
         qXYH1qxZZ4hYXvYDfYM/b4M7gTDZh+XD/kFqq2KrM54pdKSo8MrWY+sq1cxcTswSStoE
         Ee8fF/N3AJWluCjmhDqRRYZMsim8O4zuH0S57OwVNUygSsXopNmCWeWM2hrkE/xExBGp
         cRABaO+lKKnkz/NysfSaEdB4ErMo55HDBSzk6EwWR+RPG0B33gfuuMnw5J1EITYoWRrx
         P2PekhG3hw9t25dU/fe/gJeKrgnCLnFZlNZso0Z7pgAf560gMq1hXBFLB31aoGE3LLeq
         cGkA==
X-Forwarded-Encrypted: i=1; AHgh+RokFchnfgAxeqrdHSXTSreFgpmiZ2vdAD5KLseoTisB2FGq1Vao//Zz+EVV3x6E1bh9T7qz6RWOPWlE@vger.kernel.org
X-Gm-Message-State: AOJu0YwfA/Ze05HcFm9puEEGswUdHbSTJcNptYF45rTm12A2K4JxDg8I
	lSXucvv1DedTtfvjyZU0YJGqziUY3glwfuvNCM4LVTZGBmJReERAKc9uyveMqZJqXvN0HyBRunm
	8ub9sQcLVjBB2tvTZyqVtCFxCse3eadsXLkiV/0Kine3RBLmiWDLAmIWVWT9PDaU=
X-Gm-Gg: AR+sD13MynTREWD/rXR2UDP3eVGxUr7g3IXmxY6a2YeVTsHZIDPGi1+KKl8l5gUhDcE
	Yf7q+gBQEc9kFGzUnHWcRb7N04s7zOdUZ7bBeb6fDO1y7IwVWpNaIcjTjJ8MH1vFUDI8LP6Ampj
	kF20eHP4gowLhcgYl0uEY6dlfVynCig8Al+Yl47VOKZiGNNYf6mdlzKi46ByzdAdiVZN4/wtuzX
	M4m6Ca8wQDE8hudtDS1+MyxjwVPODC06EVd/76lxo7+lJse9u6wOv7mRnX81/cfXpKEroPDQN+H
	e8234bCMfBIdLFMH9Zenr19KgPGeyKI+7CRvPFkpDrNQp6HCjb0bk5GB+S5ltK6B18p08vQ3Kbj
	lmoq3JL7r/7y83GZFz/BdqOAqu7RtjBgAJJg=
X-Received: by 2002:a05:690c:e3c6:b0:81f:69a:3739 with SMTP id 00721157ae682-81fcbd4e504mr154831767b3.18.1785767962435;
        Mon, 03 Aug 2026 07:39:22 -0700 (PDT)
X-Received: by 2002:a05:690c:e3c6:b0:81f:69a:3739 with SMTP id 00721157ae682-81fcbd4e504mr154831257b3.18.1785767961867;
        Mon, 03 Aug 2026 07:39:21 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf9555dsm57109317b3.20.2026.08.03.07.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:39:21 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:39:19 -0400
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
Subject: Re: [PATCH v5 11/25] clk: mediatek: pll: Factorise pll power on/off
 sequences
Message-ID: <anCoF9SJ9nDHqaa5@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-11-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-11-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 01:20:57PM +0200, Louis-Alexis Eyraud wrote:
> In order to prepare the MT8189 SoC support, that requires different
> registers to control PLL status and perform reset BAR, and so a
> different sets of clock operations, split the pll power on and off
> sequences from mtk_pll_prepare/unprepare functions into private
> subfunctions.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

