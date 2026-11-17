Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936793;
	b=rXUVKm8Xo7ryn0VDY9U9eNtw3Sjj4JMvTTiB3tZppLlS7i8QaFRC9WjoB+uEn/7zwggf
	 qYMfG+gR4CtP4t2KsudLm/Crmk2gFGmxM0EAuTD5Moyu2Vim77F8MpVe1wbxKFwuzd20r
	 11KNa9wAjOSmD4qnAvTnuj9zW+0tijZ/s7q21Zdn46ol3uuVpbK6dPVfEnwUOwV1d/eii
	 hA5fRrfnA921Ltn7+pATiYCf5wf+VsHi3IXcNRmRg4twBG+ERXf4tWnYYsRGKBFUyz1jD
	 S/CQw5DWxua2GoGWqJeQmkKQus0z1Pc2vwoYIBTVslwhvx4ZGO0ZQSpkwLBWEu79Tpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=wClEush0em0gomV0MbpA2Fe3wVn1p16r90QsMPKpJmk=;
	b=X388CEYsUn1Zv6vrlNpUYS3HPjw7QulPsvs4/XF8UvDLJoMl7Z3mYVijLL+TYFlta25S
	 8Cxan4x+EbixSkOcZ0gzWy1jbEoydc4N4V4V67WEXyY0DFJFHrP4kANNzyQo7C1T0dmxH
	 VWVXHuWReZz/RQG9V50qq6gkvgpOgmFl/JmeuIH2RYX6r0nUsjElu0USpHU4f8u3HYVob
	 glO3bygbtOTYd/LsbNriywusfImTwhBeDowdWyVa0ftYQDBldq7GdbNNs0iLKRZjwNi+0
	 vKETci07aE18ctSFno1Xh+hIXiKy8tx03ZplB1hy2+3QMLDcDTKCbpvhUTcIPB+se6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e72OyF4m;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D372F606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D372F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e72OyF4m
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-497614c95f0so8119f8f.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936791; x=1795541591; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wClEush0em0gomV0MbpA2Fe3wVn1p16r90QsMPKpJmk=;
        b=e72OyF4mYU4s54zIGzNwRXjE+lIsOYo44pmtsBZB3POuY4luLULw/JUV0oZBzRSs/a
         D4+O2TLbP9hQjTcVPW6VDtQIy8aFJWIidI0d/8PWVt33gM5zv/HLYU8j4dw5BCEdLq54
         aSD9wn6d3++LWjcr5BoWSea1i7q4NZCpDVC95HTHs4HBHhMwvrvUfXsvkcMQ474CrStA
         7C9zblCBS6dcabzOOvxYed5wIQOrn1S5S1iuhqU3FfJl0KUgH0EWW/V/HHBXB//JZlRt
         RVMe7jwqiWk8Xh+ypYR9h3z/CcmAevvJe/w659Ee1NwQ84ApWcBRZ2uQQ4XaZIWkL05l
         lCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936791; x=1795541591;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wClEush0em0gomV0MbpA2Fe3wVn1p16r90QsMPKpJmk=;
        b=2UGNr5P0mXKqGtDPQ4VyMSxFkBQJ9x9DPm30yLsDSgdm2YKoZdoNmPKBZ9Mx7Rj4kq
         CO5dgVK+CJKX8LbOHC3vtg9z6HDpg7soAZJgwwHLRdN6Rn0A8iKvdgdIfIaefI1lZ7K3
         oGGhXR5TCyKCGCE8Jg3mZQssUH3SQFwhUIYa0OTGoUczrsHHqEUMfJJuD1KA9NfK+HkT
         5T+6hupR+4VZZWzmykraF8DKa2LfElrvWfvpANGOLRWUDdKVnbmvjXXYJvDxJBLXua5T
         X5zc+oqK+8N2Xg8HjfCAZPBNfu+CfqLTE/O/whUbcRJZXBuwJ4wGNwznfR0CuU6SX5gq
         12QA==
X-Forwarded-Encrypted: i=1; AL+hErHOXavvXLMIe74JL4VFMKAYLkhIB9NG64/zwl7ZRuVKzkPEk51NWGN+/Bir6quazAoO4zFtatzXE2Sk@vger.kernel.org
X-Gm-Message-State: APuU4Z9LlVCQuexoUG66oznEuCTEzC4NlxOWJmZsiSTpibkn4oVkYM9e
	9cM2FOuv7dlUZlkkh//ra1zoTj/Hi8sd0NowiitEPLUNjecjYFiO1E33
X-Gm-Gg: AZFdTZewQorTdjvdElGNBymQfwjn+KAV4JhbkwWu61e3CDe1I0JMbluTMdmhlnDQTnE
	nYCSEAQjyf4uNFGnoBB188kPYbFWt9Wf/XMflAtAoKZwaezep0XJr06NqucL6cteNH8zXm/HJKx
	LY+sEX+5W4rgSRygvVWPd+cToR6T+omvm3RlUEdGhTV6WPaJTlwcrqTS7p4oHv6kwgbg+LyMF+1
	7KQ9FNBOy0s03wrqm1O7X3AaHASAbybb621JlYiNyliQ2XIcVYo2xKqtBm/51VdNgHfTwf4t4E/
	j9hLcyNXIROQTnqh0OdVbf4uOCXPud8ggtbKV8vjMi/wJcBFUkMm0j2Zf1+cZi4OXcMWKH/szbK
	a+H4eLPYKCLbPPop5mDdbkkEqcc57FwbXZIdwewQIkGTEEt/XLr8ReoyC4Fha8CDTeY+xdXHq30
	/t1Uk7lfAdcf4a4C0FUp/Xol2v8rikzXZi7BJaoXgBt+aBQdO0B3BZ5fI5PN2bmq+kpFmOwh9FZ
	lBFC8FYKsYmmQK9Zs9EqCaYHitaLvVIjujZ7fnE4Iix
X-Received: by 2002:a05:6000:24ca:b0:486:f907:ebec with SMTP id ffacd0b85a97d-4a63a2d70dfmr399933f8f.31.1794936791043;
        Tue, 17 Nov 2026 09:33:11 -0800 (PST)
Received: from [127.0.1.1] ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a38b9b986esm5691057f8f.59.2026.11.17.09.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:33:10 -0800 (PST)
Message-ID: <6afc8fd6.f0979b8b.2e230b.cf66@mx.google.com>
Date: Tue, 17 Nov 2026 09:33:10 -0800 (PST)
From: Adil =?utf-8?q?H=C3=BCsrev?= Tepe <tadilhusrev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: novatek-nt36525: fix v1 review issues
In-Reply-To: <af565a17-f7a1-4c24-bf2a-130a025c68e3@kernel.org>
References: <af565a17-f7a1-4c24-bf2a-130a025c68e3@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

You're right, and I'm sorry - that was a git-management mistake on my
part, not a deliberate choice. v2 should have been a complete,
standalone patch against mainline; instead I sent a diff on top of
v1's own (unmerged) patch, which is exactly the kind of thing git and
b4 are supposed to prevent when used properly.

I've just sent v3 as a proper, self-contained two-patch series
(cover letter + binding + driver), each patch applying cleanly to
v7.4-rc1 on its own, with the full v1->v2->v3 changelog moved below
the "---" line per your and Andy Shevchenko's feedback instead of in
the commit message body. Thanks for catching it - I'll pay closer
attention to this going forward.

Adil
