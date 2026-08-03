Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DBF40F757
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767584; cv=none; b=myTXdWNLJ9U6ClbxtMotPbt3AAUTWndJO1gaQDMahEaX6hHEWOd/yp/CHwgK07ro4B+/6Rc1YIBYuhDnFOX/qvBVv/rcj6YUGAjSAt6kABvsSmKq8uDYMg8ge83dEY44WOStz50IJS26r/52mGhWnY58qx51QWguAcc2u7KK/J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767584; c=relaxed/simple;
	bh=YZJ61eFfvReBupAod2kvWhHnn4QDKxkEAslDrdpHu+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djLUgx9UzkY+6idWpEv79e91Z5Uw8EnH/KsY6TZJ3/5O1OpF4cXtC9AH3rnOHeBu/p41BKKfyIbsy/3q5TTwj2wFcKYzBrcPBfvjeVvYIitIFitahqUUyr/clb8CONlUP/tD8tjGqvC2CoszDCbUi6QGqDHRPvOLG0ktorUTChM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=feA8npFB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HJZWs059; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="feA8npFB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HJZWs059"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785767582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=76NPEec58Tb1M0PywXo7lghUl4mVI11dXUa8hA9GYgI=;
	b=feA8npFBdir4bsAO8U+Rw3uCx+rw+rGLNj3MYBa9JxyCKxPYOqnUh7qpqwZEMgYuH0b8FK
	RRUAsKnCP++VndsaSEu0O1Uho/nhOjlyvCx1FsMe8NtYbTcOi5MkLQRs5FE67v49mgB93m
	sF6r8u0L8CLakV+eiOFLFlWZsrGjA2E=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-n2wlpYcvPsqQoGwffVmz-Q-1; Mon, 03 Aug 2026 10:32:51 -0400
X-MC-Unique: n2wlpYcvPsqQoGwffVmz-Q-1
X-Mimecast-MFC-AGG-ID: n2wlpYcvPsqQoGwffVmz-Q_1785767571
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6683ec3fa34so8128919d50.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785767570; x=1786372370; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=76NPEec58Tb1M0PywXo7lghUl4mVI11dXUa8hA9GYgI=;
        b=HJZWs059adXQo0/7pqBwTn1wQZodkTVa5YboSb51o2+1DQzOUgeDmXgsnrizmZevM0
         rZloB18lK3wnnJ4ZEOYMOBiZLyJI3JDv7TrBkrjbNDR5wTul5rIABIJ3OBA11UjB0URV
         bNb7DBWPaZuUjbaLx81mtZLTY1DniySny50HPWdyNBav7P19F06+5xu9dDugIZPjc69W
         76FcMPoJJH4nB269lW2r4l2Lq1SjXRHikYmDN92A/T7ALNVywUDbvlNGATOdM5oPx54n
         UJEDEzh8+JwtncInVmbk4S9bmbjpZqfZLK8DUrDHsSih8IsHP9iFGLoU256OuPc1pl8o
         Qk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767570; x=1786372370;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76NPEec58Tb1M0PywXo7lghUl4mVI11dXUa8hA9GYgI=;
        b=I04YUVETEYBtxoK9v8V8qAsj4qx7R3evkr3nNqRG5GYTsB+ShCRpVcftdOQXACPn6d
         V1H6XPg2ye5BeSnj2ykAQ0wlhEXT/79f0hZzYSbYyZhRh+SC8Hxyv/5rJ2BfL3bVGLbG
         nC1IZ5g4+sF64jEAC0o9SmzSn2GUxktNLRKoiDwWl1nlSQW8y8OhA7A+ONqcZB1cQoix
         rmVu+oFBYm3zUcEMNOL0Df+eDpLg2NA4FPDo3ARClLsqkJstP2KsxkyS8dkjQ4qG1PmK
         nTwjc+yXwQ1btIaH/BjXI9xrAYzn+XJWVsg0f215KSbowK7q3uCSxGPfL2bDMe8HE3a3
         ZLPw==
X-Forwarded-Encrypted: i=1; AHgh+Rq28ujp3OcQ/P5brInbdqaKp381GVWMezVgsUXTJJ7CXdE4t8EF4q7mR5QEuD9yZsNCfLOpazmUa41x@vger.kernel.org
X-Gm-Message-State: AOJu0YwLFDYnqdkHzcr79Nv7EskZ1Tkl8XZLgHBkeloV84i1DkR5Se3u
	KGfbPHnLAii5kHCHHooXEwt0YSJ0L0uuqrvhqlNc3E+g+6cs1wmIMN2Ar+sqeZdpnpIFwAsB+Nt
	gczTLppwwZIlIvqTWZq/TY7z1KKG932FHuwNYpkXZD1QLTzEewcWELqxXsC7EQPg=
X-Gm-Gg: AR+sD11WVRQyM/0MfQEuzFaZSpvsAIUVCc/55krXCnGUE6g7EoNad76hOVKo+iYJn9V
	7RZNyb1l5XNjBAVvHl3NMmC5YFkpnlomz+BG+9eIMGJ2gq+0PndVYspmnTleBTaz7al7kbkIGup
	s9qHmmbFrmAJiGSBoMcnnxrxcHK0zKbAiS4l53dK26DhkEs3e8Zuy0kaz8Zv8/tVp88jKZ4FuUc
	EbASlDJUfXhTiOpOXyqSg/cz3SWvPha5R2LCmAxUsI+kVU2bJF+gE8Xty4n7WsYEwhf/BwKkbVO
	pFGYg+NuX4sLWNxru8yRejiiLJlKFqP9NtrSZF7278WkPXaqqt9LA3pz/hNPS9kcNS2H+FpU29A
	+vbzWpSH2s+cb36xHxET09ZGBQyT1g5i7B+I=
X-Received: by 2002:a05:690e:43c2:b0:666:2274:f9f5 with SMTP id 956f58d0204a3-6694f1d38e2mr8779921d50.37.1785767570684;
        Mon, 03 Aug 2026 07:32:50 -0700 (PDT)
X-Received: by 2002:a05:690e:43c2:b0:666:2274:f9f5 with SMTP id 956f58d0204a3-6694f1d38e2mr8779869d50.37.1785767570090;
        Mon, 03 Aug 2026 07:32:50 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948ffb54bsm5747947d50.17.2026.08.03.07.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:32:49 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:32:46 -0400
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
Subject: Re: [PATCH v5 09/25] clk: mediatek: Harmonize mtk_pll_fenc related
 symbol names
Message-ID: <anCmjnAVH1MRkNUS@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-9-ac4410697cc2@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-9-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Aug 01, 2026 at 01:20:55PM +0200, Louis-Alexis Eyraud wrote:
> To prepare for the new clock ops set addition, with support for set/clr
> enable logic only, rename mtk_pll_fenc_setclr_ops and its callback names
> to harmonize the naming with the same suffix.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

