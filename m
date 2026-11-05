Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837397;
	b=fon+JKvzxxnVUHKmCS3GzBX3RDnn+PncVT4gOGHlZv4QVxvs1FTuwef4g1hSqR46E0fr
	 vxaBtRiRIrXcJe+FB1otCvHYlxeM4cvSbVvnva8kn0qBlR69vIZ8YSvaFTO/CWId184/E
	 ZScynH2I7XF7uXOP6Abpjb/XyRXEiQMu9GZCk5RO0lkqix6fuEZLNIELD53HUdAlLd80b
	 MOJ/lq8CnWhv8/pZmNM0Ko28cjgk+Imdy5mYJNezAEjBCR61IkkbyvVR+FxjdLbD8A/U1
	 wgj8JSlcMStQg/qOrhNA1aly/IlNoEh4eMjTAoSasMRo9tGdW6su03FLbYeDeNCDgQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CG1nDocD+KP5xvfByl5vKPTVph1TcMgf2h/jQpKPe+Y=;
	b=lgevLna3pfD/+zIl20aLvWvYrzI83AcySXrVJ8D8UpWdPgNQzqQVyi3KIo6jjoaSQx5y
	 q+/hodZLq3t5bRjjmIgn3BlReFIBsc7AajClJ99iFpX+/VD477bwZCs0HNCNkfuBA2/oh
	 u78g70h8+LGStEiP2y2OBEBm17Y5pVUbg5Pk3i9vsmCGb3FUT+/cLjzHTCFyK2r97EOqp
	 SN3SD43Is4ROuUCx9H0NmEVFaupJ996+SIiQVTtfNhZrs3XQYDvGXzYH0x5gaJ8COdgQT
	 6R6l8GkADR9S/7ONBLdmgJSNhWO1jEbZcDoEXW0h3RfYHosqBcoIvWu5gOhRXabx2Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=g0mBkitd;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7DD6082BEA
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 00:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7DD6082BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=g0mBkitd
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14394530ec6so1854170c88.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793837396; x=1794442196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CG1nDocD+KP5xvfByl5vKPTVph1TcMgf2h/jQpKPe+Y=;
        b=g0mBkitdsJzkTXPdM8fkDVAfx5lRB4rqsTNxJdOHG6symjTGHc+AbN7Pg2AiTrhtDR
         WFshYEnwEJOp9KrR+ElNUpca9hcvBvgf8VhJ7BFa3vMZOBis6B6X6jrmtz4ykPaHtb91
         5Qx739rTER9V75MpZp07AeSfziWJQL9ZwfzQvuDS+bAfJskJkYl7V59BlhRsep/h+62s
         ZOsofMCMzt7Jnl0NNpTdu+IR/DbCtAJBZ8JHpp9a1sfCezbllGofq4llQ+QUqzFCx+o9
         BAN84GxTCOjKLdcRnGIU2S7WnKO3iqfwunYMkDpo4Ob5zTQ5EtAkfIVpzFAZH7wbw8RW
         yAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837396; x=1794442196;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CG1nDocD+KP5xvfByl5vKPTVph1TcMgf2h/jQpKPe+Y=;
        b=jn/nEfRMzyc2rbFY8YakB6LxqPxhZnDaaUYy1jWTE4tfD/OHqqb6VuDJ7LVAamjey2
         fyIUdrwH4YjMdxpeWktSzNu4XpI7sWPcisDX5QyXqdeC/EuLTtl0DTD8Ty/T43P3BL42
         kOfWD/s20isOTuKE79+jbDCEwzV9Mf8JiULcdpUFzNuioyQwr90RqE+/7fzJARyRhCUH
         abkfWaZEeNK5S6sjxjd/XrO12XLZZO5h1GLlBS+tZjWxJseGoV/JTmngSqvcDiWTjZ9q
         EEL0Unvww4XNwCh9WQzizhAiJN7IbuktvT3AhckoADZg8f28D+eLO+E2JFaKUctCf2AI
         4sfQ==
X-Gm-Message-State: APuU4Z+IjtS6VtpX5VGNZSIdyKvzI3VZMnAQEQZ9owz/ggd+GQCFtSSM
	VjBjokhVMirMT5Q7OB620yy/k4G6qEvSzU+vWGnDP+dzAVWsKxhN0iVLF/vawkX/hXnn+Zx00Bj
	Iqa2mo9M=
X-Gm-Gg: AYBFou0bZ+OZGhMLPNERv3JYhqVL/9t6ga5iu6kIfgNd4cS7tMk9q3+C7UThRnpWPLl
	FOC397AlUr4Y0Bx6Y1eeUqKC0YznCRuwGmjz21i1piMIeeHpnuoeJATf9voV43RhemJ3jiLznFd
	x4u+//hLx6a5kAxmHQT9JV3Uknsm0bAMQJ1SOANVNohbri0tzY7KmbfyV4INSSBhJZG+pvvkxH5
	+xObtxrhNfyxik6yOgpLBLbURdD6rb6TmdsOsEUE9hp9m3oTbByjTJFj5oGgYZaT/QRnLWl1ZL9
	ZaQSeo4frTBMBByXNaRQRoHGM6/MnbGVRDA72RuEukddIbEdtKhakUkum6lANWPFdGfAgic0Qyl
	uPSYIYluS3eT13b2ZBbPkAQ+otvOgtfvGaus2OA8iTeHexoc9984SX//1+tSEhdVEgFNherXizV
	/pbLU3KnTmd5hHUYdWBcDBPi06GeRpujQFTMQdLuBTkRgjaPf1xVTcuZr3Ip3KiawGFI0PUrMqw
	Z/WBg+a/y2cG1J3X1TaP2syw1XZPFlFtIXabOWdkyRWHNIkk6kFAVs1xTgigh6GgP55VeFAw429
	IVfXMCJRlfMhOu1eOUorop0RKdbKHPE=
X-Received: by 2002:a05:701b:42cb:10b0:15b:afce:62c2 with SMTP id a92af1059eb24-1ac5fa237f9mr26911661c88.41.1793837396282;
        Wed, 04 Nov 2026 16:09:56 -0800 (PST)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c748eesm11075781c88.23.2026.11.04.16.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:09:55 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 16:09:55 -0800
Message-Id: <DMMUAAR38EEA.3CXX3YB386C6C@nexthop.ai>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 0/6] of: teach overlay code to keep /aliases in sync
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>
In-Reply-To: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rob, Saravana,

Gentle ping on v8 now that 7.4-rc1 is out. Patchwork has the six
patches as "Needs ACK", so I'm guessing the open item is the one
design question from v7: what happens when an overlay alias names an
id that a subsystem already handed out dynamically.

The cover letter has the full analysis. In short, i2c and spi fail
registration with -EBUSY and serial with -EINVAL, so the device never
silently ends up on a shared number. v8 keeps that loud failure and
documents it in overlay-notes.rst (patch 4) instead of adding a
mechanism.

Can you tell me whether that contract is acceptable? If you'd rather
the OF core reject such an alias up front, I'll do that in v9. Either
way, a yes or no on this would unblock the series.

Thanks,
Abdurrahman
