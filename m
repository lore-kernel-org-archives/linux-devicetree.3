Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370648;
	b=Fj4OamGXns2lCI0C2+SREs0gWSPvhTHAZfJwTYPL+ruPfUN8+jA1ABqA2p6/tHekfjfv
	 5qbUhSV50tP9uLqgopZtTYQejMOm4ul755INDZ3qOJJmVZYfy11RwOQKrV20ui4F0Jlno
	 c3Yso6s8C3WeyYyms+2MumE/Whbem2z6Yqmx+EIw2oGST0pUNwWUFsI9aQBji9gOV89LZ
	 XakuVJbZ8a36MAdBkKu68o8ln6OGthXeioJVcAuX+ns7yRgdQn5E83h4LyTxOMqFzOSOe
	 6BGpUXTrHFQQ6ik4Z8aQZUzFXNiZ+OohNqzkP0pMrPUVVE6Sb2lXaC/I7fNcC5XEiJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=ihpfqV09MUmYak+OSGP8+YzvL6ralFIX4WEZ4Ld4FXA=;
	b=c+L9UJuMxVYFxjmFs33pWI2p+cIsPdgmpSFAmWR62bs40XNvwgwD2AzcDBAanQRzYhks
	 40yLKyZ2PW3Guh7WOe/Qv32Tj5xItHPQU4BdM7GbkD4m0C/KK7lhytKnx07PUl2TY2W9v
	 ewAeBYf6WjxdTxIP0Bw6ODrQ/xuEi6TyfbLlj5+3h9WuGBJ9+lgwtBF2WTdd2hqrjB3Sl
	 V0p0cVnr7rrpnwETXYtQ5whBIrNRpNNDShZYh9+6bPYGaSiN+ksITzy6Kw5gVybiPtJta
	 FGGQRZhHW9QaBBtBPJl6fL0n2mLwlVT10dQE3f6v2wpWHADdVQXL8CljzfoMb0nN+ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suxrScFN;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48DA606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A48DA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=suxrScFN
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d21051042so424310166b.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795370646; x=1795975446; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ihpfqV09MUmYak+OSGP8+YzvL6ralFIX4WEZ4Ld4FXA=;
        b=suxrScFNt663K/FCQKi1rTK40Oo7KcLgwAaOC8a6sQX0y/Btq5ghhX3bSV+bHz2gG+
         ZjQgYA4LmiWBlz2NFBDeNclDDwGblOTVPkws4xILKxoDtFtQFoW2A5YxJAHZhnrNChir
         nAPxJoZtTRyV++BtC5YC6fXTo6r0Xe/mYU00dKH7SNqghMPcUtDDRGEQz65f0V7Ptfv3
         zIcoEksb0gZr9OGQkbD/4qvEs694yA8Fb2DV7MvKk/cqY0Rp3U0exU4RuoX5MtPMbc6m
         BNiIv07Cixo8P7eFfXXBlTIxchpjtQoLF9Z9XllTxXztXLS5mSp5NpAQwslZeMix28bN
         VATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795370646; x=1795975446;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihpfqV09MUmYak+OSGP8+YzvL6ralFIX4WEZ4Ld4FXA=;
        b=qdHZwXUxce44vdpRRgTPiVTDfyaTBO13DdxBc9G4DOxzfS9rNZsNw944Huz4nHyhUG
         4M5dMVJDVzVnuQ5OhWhl/pM1YzlWEvAV1Z0rePdkA5FusDVC2SPeFDFNh7YIDVu8ozcn
         Ch3BxsfPTutDVbsu0TvQdFdzLJgkiezkL0pelEwLYPjKwJ+RNOGepOxbbunj3dODUkFg
         yIvwwZ6uFk+7ZlTrwcQVGskhPYT8mvtJHM58qS7MuRJOF3wLPBM1fwENUUUCutw+4YHB
         D7dRH/Cy2fUfVdR2BYCR8v1a3JlUQiKCnphPcuAqTNsbxS8ugmKNkAAA8K2Z8Q8gEx0y
         c2+A==
X-Forwarded-Encrypted: i=1; AL+hErFo9BCNKM0B2kLjKcmEIsyFmk7a4mFyJ+p9Mks82cZdxNhL0NiC/v7R6e6/4iaDF+MVFroXGAHUnR0J@vger.kernel.org
X-Gm-Message-State: APuU4Z8s16WzOoALcyq1cMMsxwL9SH+yydsrktqHK6XJssuH+x6YwQVc
	qOEnFXJQD5iYsf2MiPbsfpACqP1oz5p0eHEpSwQo5kO29MnbYAxIAheX
X-Gm-Gg: AZFdTZcTyzq3dCqnsotGdr4iua9CiCZdsHN8GEmnf1AGJwN0GHm162t9THpOQZKyAmr
	KjLY1b4yrTGtSxXwFSgKFBoYjk59b7iOzTdNE9HcAfuE9w6axJplAGLVRw27LB3NrAoQPc0k/hW
	UHCCknKOuLZZx2g+pttkoW+2TPc1+W8wT7PY2Xq2WP1tytJ5eiDJZBPpHus8lgCuICGUEknqHS3
	UWRsJEq5s1Sb+/XfGio6WbfYOxKvU6ryziRit99Hw8DskcQPcID46ckyugsqP3AooJ+HUKwJPFW
	TU2SgwxJMTwSVFp+3eAQOgRpKJVORaEYmUvHW07YLl3yqMU+S4CJnPBBkquqvVlfi8e0B5NPxuS
	dw5aB/5hIJYzjdvDq9DyY6qaaks/2dFSxP1bVh0ICXVMBspbbEfTSMfP7dw8KwFWmke+vIJjny5
	8gXSBSdvrnZKr3dC5Kjh4bgzd254RRnavFt1Dhakp4Oq5jmyxlQzGKoIp91YkZ8ZUSGYM/VoqKH
	Sfu3A9G7GFVGuWN1e7+IfDohJPSpu+D5/I+vCllZMIlvgFi/S5b1RcWR5L/n+mBi0I0+nFoXJg+
	sj8diV/h9dpP0+l7kHlg607VJkUR
X-Received: by 2002:a17:907:1187:b0:c49:903e:1e19 with SMTP id a640c23a62f3a-c513a8595d0mr591204966b.26.1795370645863;
        Sun, 22 Nov 2026 10:04:05 -0800 (PST)
Received: from localhost ([2001:1b81:1b55:aa00:48b3:8eff:fe5b:7d15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad00232sm346383766b.12.2026.11.22.10.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 10:04:05 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 19:04:04 +0100
Message-Id: <DN1XRZVL1VTQ.2HAQS0P1U3042@gmail.com>
Cc: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: hynitron,cst816x:
 Reference touchscreen.yaml
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
To: "Gerard Marull-Paretas" <gerard@teslabs.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.17.0
References: <20261122093405.70406-1-gerard@teslabs.com>
 <20261122093405.70406-2-gerard@teslabs.com>
In-Reply-To: <20261122093405.70406-2-gerard@teslabs.com>

Thank you!

Acked-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
