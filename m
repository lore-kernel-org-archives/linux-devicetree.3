Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712227;
	b=Szp3+owX+wuVUzIi+wvkJ4jPCMq+7GaQFjXXBF+N23twRdbrKChbuucWnWUyHWZvcfNF
	 ojmx4Vm7X/WmuL6lts/5i59/nsPnCMOrP/kcgJNWg6IGG5gqGJKJ5SBTjisHfTL0fF+MW
	 +ztYDjwgkE1cRJ8Mj1J/+2+Ve0/7FqHM65dPI1TXBmDt+CtE8B7VQsspFECHg3NSqFnGl
	 7PUh9TL6mjcp6PZlIDzbnbIhm0Z4GRIdYVZqjGXo1502/pERVIiTOWI7viqjEjaLJ+HjC
	 7i4VoKYwlseWv8foDBLXqENNdMqZQuf6pizj4x+Lm8OA8PpOERfYChNWPW2IVk29j2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=LYqgeXyiX8XVMyFZcD47JEncntf0/UCmpJA/xWCOZns=;
	b=xkA69pZe9WpC1tHczOxwBBanOTiJjohY4b05X2xJgIpUQ0km6DL3cuYOPW8MTj5bRC0U
	 aAdAdT8fWm0YqB1rudIQ0nnHgxX0xM4GikKg98S5sqIiL+7Yb6Bqg9zA1I7ICzlvFN3Qy
	 Trtatwi11fNKTQza3WL50ZXsNJKKjhQ1IAyPhDvioIh5nrw1d3wxODegcm2siPDodZHt9
	 e1eE7m+328UsMtNdsnvKYM/rT6ZPJmUOoPlgBgE0cPeks6kphDzd23g8ijqJFvj85b887
	 l/zoMpl7as4WCTDtmRergprcT8CQ2tYC5ZKZKr0stv6AaeaZO1XcOa7JGtxwU8yIC3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ffroot.co.za;
	spf=pass smtp.mailfrom=ffroot.co.za;
	dkim=pass header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aXmhSvV8;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C959606A331
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 13:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C959606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aXmhSvV8
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so31550685e9.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 05:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20260707.gappssmtp.com; s=20260707; t=1793712224; x=1794317024; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LYqgeXyiX8XVMyFZcD47JEncntf0/UCmpJA/xWCOZns=;
        b=aXmhSvV8WyLnGfnVJqEd8aHGaEhsAdqn7rjhu7boyOefGlqsewcRwSHGp3D2jS+don
         4VlFam6GVibWBDwg1evA+MIXFQvKm2BvUVe0DnJL2NRUbmBYQ0k+WGBmZrSkGXI4Hd0D
         oxV89lIE9OUzRCQdaLD44PPtCj4CUJS9tVx1cA9BARjlQC5YXSqP6R7GBW9eDFMSmUq7
         2JC1ilUinFN4qDdvks8PWb9U4mT24uoPV+/lQlfpFwnfqekuRYWQrp+gskZLoR9QWIzl
         nZllHDbNj05p2wz+WfTSJFZ6uM2lYYPLX597kMlvw/MWIFJDxKUfMOhkY+r6mMQJRxJz
         OUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712224; x=1794317024;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LYqgeXyiX8XVMyFZcD47JEncntf0/UCmpJA/xWCOZns=;
        b=FWmHxTvPDlZSUKMUpPDuUwENo901E80v1l9zPpUH8r7aG5e6MyXFw8K3SUGWXuTZrk
         VUTnoIFBzcGjUwZlDhyk15gYEe37o4bSRMZqoh0XASrzfghljmYaWPwnYejAkLI9GEKL
         fXJQbSZZ0sNOvKRrpU1sh5K6BP0zRp/Vfw4oJqzn5IP+FxPGhI4AnDw3j3J/bro2Ijiu
         sclD+LZ9udUTbwskSuBHcy/zr/R3o7WP2vVYqHQfqo1WuCtPEpL9yW2TaNeBlWOZZFPV
         LWhh5UXnqNE8Ox9EgxHNmPilun3qUjobnqKGecJyL8UPXTEdTSaCgiJ1lrB5i5db/XhI
         dWGg==
X-Gm-Message-State: APuU4Z+/uNyZNVQRwBk5i1gknGbhz+gmFrjsFNseV4NyhPVKU66eYL5j
	D2+fFgNUY0abl1staXVLtiiTj4Pw8IcSFeB4MIlghix0YrggXUqS0Y5ww67aqyIYDEY=
X-Gm-Gg: AYBFou0EA5sCCbDLaCchJW1qsZnPzfFs1WZcQAAZUMjFrHc5GgIhiZ8cj7cbFnbLE5K
	I9+QbObzQ0rpMm3MVj8eLRTSgNR9STuuwx11wQ6a++VY16ylZMiznYsTcFH3f7g3UPgMIFcVheZ
	+r4nTaIg0hCMO7BmWtiEhCorQOQcAallmuiPiv+5zyIeNzqLFh60hzOFLDApRpDIifQWssipF8J
	VIjbGj51F7z15wxm3I+EybFty5sumAMoa4MNrFo9Y68dxHGGbCse3SknrUoloZEW5KqiEYYAS5c
	NvD1pdFjHBUzTW8LF/QwbLb46MsDFtUizph17ww8KgEJgTpoPaRqOrnc3v5+KXyy22n4zMzK8N0
	Liq9nlz1v4DBbPM7+YlayjfDlMjjpav4nQbYSXoOxAg2exwIFERIQi8bMLO0jM2YOK93v13WpFf
	FzP+RkTAjtx3/xCqIfMaQ+WdGCro8ADRj9dWNV9J89/cvzY0Ge0R+MPiiILyZ6m7v558n8L7mVA
	O+xx2dvAgUlRTUi6tErVPo6SAPF63ubUPVEDZ1ixokg4pfHKIasHP4wis+WjCffY0L97LxZylvX
	wvRIQGlClP7uYYVWoX2Nk9OJOJZhdbnTtTlegkMLCswhuRv+nWQc5y+CBQ==
X-Received: by 2002:a05:600c:e547:10b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4ad5e09ae61mr139983985e9.29.1793712224232;
        Tue, 03 Nov 2026 05:23:44 -0800 (PST)
Received: from andrew.office ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ad414e298bsm163615055e9.2.2026.11.03.05.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:23:43 -0800 (PST)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,  qinjian@cqplus1.com,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  linux@armlinux.org.uk,
 soc@lists.linux.dev, arnd@arndb.de
Subject: Re: [PATCH v5 0/6] arm: sunplus: add Tibbo LTPP3G2 board support
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za> (Andrew Gaylard's
	message of "Thu, 24 Sep 2026 18:49:16 +0200")
References: <20260924164922.117236-1-ag@ffroot.co.za>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Tue, 03 Nov 2026 15:23:39 +0200
Message-ID: <sa6mrrqhwv8.fsf@andrew.office>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Andrew Gaylard <ag@ffroot.co.za> writes:

> The Tibbo LTPP3G2 is a board based on the Sunplus SP7021 SoC:
> https://tibbo.com/store/tps/ltpp3g2.html
> It is the platform that underpins Tibbo's industrial IoT products.
>
> This series adds board support to linux-next:

Hi all,

Ping?

v5 was posted on 24 September.  Patches 1 and 2 are DT binding changes
and have been ack'd (thanks Conor).  I haven't heard anything from the
SP7021 maintainer; mails to qinjian@cqplus1.com bounce.

The SP7021 platform entry in MAINTAINERS has no git tree, so I am not
sure how this series should be routed. Could the SoC maintainers advise
whether they can take it directly, or who should pick it up? 

It still applies cleanly to v7.4-rc1.

Thanks,
Andrew
