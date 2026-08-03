Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF03305680
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767829; cv=none; b=U28WQMpN2g+zkK0/XFYKOaF/AfcSNyATihqwsfN40AYhemywOKbNFggX4DLG1SdgVuDEO6ZlVWQbzCMNtSJRrpzmmIEHkgSlJrrMT17P4wbz0XSfmdIJxkf5mczw5e6OCrJrcrxeq2Ct9EtnBuc2eVkeuGGvRKSeUgpb2SPEgCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767829; c=relaxed/simple;
	bh=pb/2bJn713F2QrBfYFAcNFUuDl0EojezK6P1ZrrJCpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/TU2N+xKarcqjMgOh92oYxJnBKlXKdU7rLNIV4LP+jwwlTMBP5cUpbrj8tcmYiMhOYvHbV/WcyH0qwBQ8G1MYm8h4WtZsShgMWN+XrsfAleSBzmgUIx3T8cVQLR7Q5ykBz63uM0Q6Q61jTGcVIPlZ34lXvUwyM2C72nHGY7qYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AhhZb6dF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qPNkLhd1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AhhZb6dF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qPNkLhd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785767825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oz+46xoU5Ps+EiowJN5fDiWs3w3cNh/2x67ul7cY68U=;
	b=AhhZb6dFYDSyf3fXIHJkD6toFMUxcQO3gw+M77LoOUuSYzr9bA7KkNPok4vdzAJE6zC1yU
	jNh394I4zvt5DDHxSge/gcgI0Qif9Qeis1aJsk+xwK0FWUUk40zHtgfWXmH++RTQt9Kne8
	quQaP0qCNNCYvVDzO1D2fbcqP/Qa3YM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-Ki5cURwwNeGLyGZlYNQxQw-1; Mon, 03 Aug 2026 10:37:04 -0400
X-MC-Unique: Ki5cURwwNeGLyGZlYNQxQw-1
X-Mimecast-MFC-AGG-ID: Ki5cURwwNeGLyGZlYNQxQw_1785767824
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e8653ad27so117713177b3.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785767824; x=1786372624; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Oz+46xoU5Ps+EiowJN5fDiWs3w3cNh/2x67ul7cY68U=;
        b=qPNkLhd1XpZ6n0+waw7ob2Ef/S5em34NvI698Jkmz3YZNTALwFtdn+jv7MCNcwsFSt
         WmJsWcT1YSUD7IPRF64DSf1Z3iq8lhsTw5pxg2IrrBe2JgjK4F4FgE2gPm56W1k7+ZUg
         upOIjHmOL7XLbSI835Jhrmm2IujcdIAPejKlKoU5se150sZNLn5l2DoWN0nqqwnkgKkp
         4xvNq8J4Z9m4T+NapUV1X8B4ZW4BN4B0qG4RsUOBwEMHDso5DIsXP5CMDEbUsCUcywq8
         n8ta7fMHWVykms7CsaV1HubrG2YI6X2+wFVtX1hru59T9JT84LKsm5UMfEs7FN6N09kF
         Ds7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767824; x=1786372624;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oz+46xoU5Ps+EiowJN5fDiWs3w3cNh/2x67ul7cY68U=;
        b=HToSbGcYRWCrtFJ1gAeoNyIfD0GJdWx/OVZaHUvc4SdSwTSa0xSmpUuNmCz1LaQvoG
         GyJmMz48Xn6Phgokrl1FQYEhaOMnbFB4gGcRclUXS0RspbM69domZZk/sA8zuZ6dxhHr
         HXzEHR+09R3XJhqrf5sEwKggGVEhXRF1n93zqt9QJLzKgT5yFmwYQgCqkrjMLe3k1RoU
         cuSZg9MIK6r5lcLaO8U/sXoDgJ1Y6JGG8GVra4NE+40kABvJ48k+Xv+BOVB0BpSH5Be0
         nIhEfjX1jce0VtD/YEFkeGgh0zwcdd1od4K0mUt68NeLDJXsmlPCWl9eQfGOtKrokxt6
         GJ5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr5ihx1zebRrgnxEu88TgnsquysPV1A/OPG0hh1HPHQEDRKEMATdX0bN0zG8ENY9FCxdHARzQB1cZ8l@vger.kernel.org
X-Gm-Message-State: AOJu0YxcyStOXLdOaGn493MDP+SzUqXQq2hdNnN9BbAsUmDNWQCK2cCQ
	81felrM8pFe/frNkkpP2fFXxcRIf6NyY0uY9FtDonBSHiNPXG9H6SBod1QXNxMpIqej8PilxAbI
	1vEaFHzisPNbY09SIQqKRlUyBXp1dJV6v5+JLfU1HjOylP9sVVnpoxm/vy5oza1M=
X-Gm-Gg: AR+sD124EajMKnXez1zJigdnKLkSfCrZ+aLZkwiWnuq76DK4WHhcfQjdlRxu1VaISKO
	eIN8lB/rPV90Cm1Y7LslNFLu1dKBKHbUAXRpNenCtkCX/Be2HZB+4suGjYDyZX8yrc5g0csTpjc
	Mhjanbm8Xpzm1lxmczILFAgjYgBRLOhZ6UeuNfT+VL6ld5V0mgjVW/NhNDytJ/USpk5AqTr4Yug
	YQ0Y5gIeOiQt95WWsrEN9KinmQBJd2zMMAePJjmKSMHyQIosjVDx8xxA1cmnnj1XO2VQWO9OIbg
	JxWKDnLjtHXZ2nHV9vTRrUrO6H0ogWyMLAOijspcXRvv0l/vb7h2LdCMbCNvFHUUeg/Z4t0nWWA
	rNDHZQCfD/e0D6hTmjdYSWp/3pGviBcRMSc8=
X-Received: by 2002:a05:690c:4d83:b0:80b:9f4e:a70 with SMTP id 00721157ae682-81fd4ba6936mr134850567b3.26.1785767824063;
        Mon, 03 Aug 2026 07:37:04 -0700 (PDT)
X-Received: by 2002:a05:690c:4d83:b0:80b:9f4e:a70 with SMTP id 00721157ae682-81fd4ba6936mr134850157b3.26.1785767823526;
        Mon, 03 Aug 2026 07:37:03 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d70besm54676927b3.31.2026.08.03.07.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:37:02 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:37:00 -0400
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
Subject: Re: [PATCH v5 10/25] clk: mediatek: pll: Add BAR reset register
 offsets
Message-ID: <anCnjHectpXOqQku@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-10-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-10-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 01:20:56PM +0200, Louis-Alexis Eyraud wrote:
> Currently, the register offset to handle BAR reset, for PLLs that
> support it, is hardcoded to CON0.
> On MT8189 SoC, there are separate status, set and clr registers to
> handle this, so differents offsets are needed.
> 
> Add the new fields for offsets and addresses to the MTK PLL data
> structure and modify mtk_clk_register_pll_ops function to compute the
> new register addresses so they are available for clock operation usage.
> 
> Also, replace reset BAR address computing by its computed address
> from MTK PLL data structure in prepare/unprepare callbacks.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

