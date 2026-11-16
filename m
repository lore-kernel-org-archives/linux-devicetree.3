Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843943;
	b=gGOb3eNCM23W7mvVQBSw9shvrphMYnIwUYdxOTVNjHm1SEbTJHDH65JoHQvWDLHkLJze
	 NwVSexYJ+OahAILu+Bz68T73EoDk/XtcrEiv3VriHmTs1gx6TNK40SxN36xDjAKlcmN0Z
	 m0wnomZgaN9zBXnis5BFwWnpSu+oZcDoCuIYMUu5olDLawbnMgFOpBbPxDdndxXlIMlO6
	 Ixipa7rZExiWciew/hS0//Zj6wGX1LB7/1x7ep1rJJWd2f7QpeQZzkHsjVG3TvPo6PTjJ
	 SV5S8j/Eko1dowS9+orAvIz5+u9wJhaVW8Wncm2yphMC+aL6nKvTg4xoIOvCteiwckQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843943;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
	b=gAwGEFZWIDsLZZX0lGhSBcvzfdyXaI10+oHvb+78Om5qDh0NqY2I5glYkpNxJKoExgoy
	 C+DE5UYn8bTysg5p5RyY/mNenmHBM8NptipT+g6mzIEovtpDv+hN6KkDxJ80ds0T5lNKS
	 KzXFxfPxn31gtJfn0plfxtwJTiEU4wiE9TGWUjF2I+LToGlNIym9WaEloh5bdW9TjqmyY
	 oWvo3KhIbVp3Cj6/QMEq0a2lguAh071l/ncrMpY60RGsooAzgW6fXVV/1y+cEjws3o72e
	 h5al2zsSNUUdDlwknb+3kAQmEaD+pOEdpTZC8fv1vkJyrw/VOrygzy3mlfZfHz5ZiDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IpxnSV3L;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lwyv2BHk;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6872D606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6872D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IpxnSV3L;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lwyv2BHk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794843941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
	b=IpxnSV3LeyhKw43OXzojC97bBiBsgfWDFXHwvur6D75GzEn5hsBPO5xgssq8GbDBaGZOSf
	lwUBkiMJAU6Zvx622pwtFvT10P814IKst92PANBQAPnPHiqm5rCTORzbh1Ky21I0fk53Wx
	IPtSQ2g/gRjsbtF3kRG18U6MwWoh74Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-nxQQTrLXNfm5lBbfbN_wUA-1; Mon, 16 Nov 2026 10:45:40 -0500
X-MC-Unique: nxQQTrLXNfm5lBbfbN_wUA-1
X-Mimecast-MFC-AGG-ID: nxQQTrLXNfm5lBbfbN_wUA_1794843939
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944138ed63fso554693685a.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794843939; x=1795448739; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
        b=lwyv2BHkJDRcrulWpVLiVLdbXNrOfPaxcoojzKppTrWyoMAP1x/WR+D6xPHIFU8EYN
         z8nmEKR8LySCIgHn5shMxFCbBfELHm4ZaGzMtOqxCAOyU62c0QBEh3YWd1tltWSt67pP
         RQ1DNe5hVYlvjAsgbMTTUSdIW+FVZ450bqUkvC6mqdw8iPW0hPn1auvoho5fJnAvlbUJ
         7kib0qIL6GW5PXAqBbmPlaxmGaM/LQ+ceas5BoprGV1ptDjIDxQ3uRp5hEy/8rdTeKcO
         DPbudWuw9Dn5ByKtiKNYHLRjHwFs+uWgt6FXq2/Y5xtJtJ94nSdE+elo8H024yZ1WcGW
         AltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843939; x=1795448739;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
        b=o/cK8VbDB50YCJMsRp8lU2Xt/1Illa7s734zTp3EO85PlvWCtzAHCxfWS1VRA7/TiQ
         XmE4QgfIl9TVKxx7fYD3coosxL2qKbsWtSZruGeeNIWF5s40rR51zr+IF99W+bPn4yid
         t/yQdKH5Fw1Luc1uU/3ZRpG0rO+g7JNDJjVSFUGj3jMsm1v8nZRXbu84QaLwN8ahnqwW
         Z0GsMCj+1xHXDvs+AQY31cLEJZEO87Sl8xzJ1Q8iaKYHHByoTtr2PRANBwn6kFU7niLV
         9pqXVk3bePgmRvQGE+vfBAP8Oghj2aQHZRFvTiZfaU2tqTD6cIV/wv+mWGgcKQrjhr+d
         772Q==
X-Forwarded-Encrypted: i=1; AL+hErHFsQuNVXcJl23G87+RYmBebrJkHcJiJ7jsQUl6goCqRg2qxPK4O3xWIraGSRFtMQSErbMgpTIBXLs2@vger.kernel.org
X-Gm-Message-State: APuU4Z/H7qzdcXCtiwDumnFuU6x15d5A9/HTNDdj22uj3+8zgj1QRnTW
	Dlz36zCzuM2G0Ei/i+Agfzs2/7pzEYo4NayEIxztIBdudcczdH5Ure2ERIe4Rmdk14ReVbKiz9S
	jlbqph7Oa0Bc7CRmuO3UO4B3foFhTtcrOFJM/TJU9OSBjHVs+wQ3uypgLZ7f4Gf4=
X-Gm-Gg: AYBFou3kLD8E4E/YLp9aijijhQqP7Tde5ytLNDgEcYp3QVLlEsDzGEq23sodWyhmjrL
	dCBm4rYrKeHK0kgOsehaZXk7NLrizqqxCnVJmX6bDJZ0qHzDR9AZEqgv0Q3UxAGNqnkoQEQCJ6k
	eoQTk1p6DtyEloyFFFYM/tghUP4r2H1EiT06USaC4powg34LQq+8MZfnjSg6flDupp8t/Q3qbUR
	v8FbpZm1FOSZ3mQqTr2UW2NGaZVGjm+bRBoCeHVsAdDBPzycl4Hcthw9UAz7Pt6n9PMS4O8hAlQ
	LufCx6gjp4N50mYJRL62xxBvvs1iEFPdO1dU7dT9/bIwjxf+QQzJLPNIrV4pZhGJ1DDuw5y/ffB
	6cugC2H6uCrG1r9rVc+PkvYK2LwZJKIETubDsISO/sy/qsZPGg0AvuRp4SvrMnOUe4by51k0zIa
	Mh9zUngt11UyIY/m0XxS6Su5SmEHzqGKfB0NTzXZ1q
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr1849349585a.17.1794843939004;
        Mon, 16 Nov 2026 07:45:39 -0800 (PST)
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr1849341285a.17.1794843938440;
        Mon, 16 Nov 2026 07:45:38 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b889csm877596085a.32.2026.11.16.07.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:45:37 -0800 (PST)
Date: Mon, 16 Nov 2026 10:45:35 -0500
From: Brian Masney <bmasney@redhat.com>
To: zl020895 <zl020895@163.com>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Brian Masney <masneyb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Message-ID: <avslH10GRqkVT9fU@redhat.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
 <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
 <avMM8z-LYncKS8ip@x1g10>
 <avMmKJpczepWTRdc@ashevche-desk.local>
 <avReozTC_GEmfIxG@x1g10>
 <2b30e92.3c75.1a1e2828c3a.Coremail.zl020895@163.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b30e92.3c75.1a1e2828c3a.Coremail.zl020895@163.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Long (and Arnd/Krzysztof),

On Mon, Nov 16, 2026 at 11:59:28AM +0800, zl020895 wrote:
> At 2026-11-11 20:25:07, "Brian Masney" <masneyb@kernel.org> wrote:
> >So how about this:
> >
> >- Have Long post a new version that splits out the creation of the new
> >  Kconfig symbol ARCH_AMBARELLA into it's own patch. I assume Arnd could
> >  provide an ACK on this?
> >
> >- I create an immutable branch that contains that the two dt-binding
> >  patches, plus the ARCH_AMBARELLA Kconfig patch.
> 
> Just checking in -- there hasn't been further feedback from
> Arnd/Krzysztof on the plan yet.
> 
> Should I go ahead and prepare that split for v12, or hold
> off until Arnd/Krzysztof chime in?

I haven't heard back from Arnd/Krzysztof yet. How about wait 48 hours to
see if they respond, and if they don't respond within that timeframe,
then go ahead about post a v12 with the ARCH_AMBARELLA split out into
it's own patch. I think that's a good change to make anyways.

Brian

