Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444332;
	b=VLaLeO2679zDplk15tbWZ+7GXNUjpks8s4VnCv4CvpIg43fB6M//VtPCzterymQyGnB9
	 /yCxv+ALzwHSkPzy73z1q5UzI+E268wK4L1/M0cFwrbwpaQXu2tsnsTlDFWCt/my8qwII
	 ygySv5Eeagnu1DuPMAm2O1vOWqWzJrGFIqe3+0WgMk7b6hh9tjKyUn1S/aILnuY+8KUdV
	 bgXYmWuaVLk1+h4jZYsTO8Lbi0mezNr7Pyo82PNvdN1K0bMtpCiMWQSUZR9TQKxClZRVS
	 ADmsET8kT6vPty/xzptC5KKGL/dyb70sMCTWipjJTPq46g8LfIXa+79S0ky0EQb+zkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444332;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F8jfPCUe7qNLVmh/bCCWGpaAKG7UBlJO6QYBEFeRggQ=;
	b=vGMIrpuw0klpX4uSSScmrznmohMRrqpyU/tX1inZfEeCGhiAg1CeE8mzcS8aEKlOEcPR
	 YwSfv4HQlqyGzqqiVBbyRLegiyN7KdIY9KNz3w1WDvkGKjGFbboK7wgcxQera1+wbEGKc
	 b3bTPxd/zx3+HGHKpjrOXV17U55+8mh3T6S7A1PZMPPTWAnjSgc1qz/gSJrdEhhLr3AFT
	 1csCfGVXv5aKCIFKLcHB6+YTIpKJeUd/jsveNZCsBXzKUr/cd7HtXECStNA1ikP+X2EkR
	 VBlESVO5IM2KW99JbDA6RXYHMzQRwZnpU7CDAkRQBsjjUGnoGQ/pszZWAO3DX03iw3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LEVGNvwY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=r77Fjaq7;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0A6606A330
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B0A6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LEVGNvwY;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=r77Fjaq7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795444331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F8jfPCUe7qNLVmh/bCCWGpaAKG7UBlJO6QYBEFeRggQ=;
	b=LEVGNvwYYHmJseGa9Mi0L+zZHX7eStyyk8pJtIOZmx01ui1rCwhb6LcxRuZ4KHr8/YfOgH
	eGIr3sBkUkIb2up7Nhp4gxCF4z7sNOZiJhQccsmrtqzf5ByYC13NncNCZQcOREJbAuW3Iq
	Attp9stiF+l5+bG8W0sGT81QSGqP7uw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-lH7tjiE3MdqIx43yN8k9yA-1; Mon, 23 Nov 2026 14:32:07 +0000
X-MC-Unique: lH7tjiE3MdqIx43yN8k9yA-1
X-Mimecast-MFC-AGG-ID: lH7tjiE3MdqIx43yN8k9yA_1795444326
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49090fde23aso2096480f8f.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795444326; x=1796049126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8jfPCUe7qNLVmh/bCCWGpaAKG7UBlJO6QYBEFeRggQ=;
        b=r77Fjaq7oyAu7jRBkeDEwwDtkwcrWjK9Xe1kgrgyNL9Vg3rDB5J3jOiMIq0tMNE+l7
         Aicvg7zSFi5yVmXe76P416K+Lg1iweLtmWCmoFRDGj2LqvNbNY1TqZygmZsKaAW4B/ei
         40OFry947mFcvOXVj0z0CIl1DzsXjQqSs+aZ773XSMPEh6x1kJO8sEekc7HefjEwiM3Q
         7Uv3I3u8Q8hZUPdH+HtzbagSLEgoV+iXZhxIvAWVChJRoxnscucKraBJ3g9nXXtxqxId
         c/B+gqZ4hSOQBkDlUZLA98eiIZuHp1c2lnHYRKR4NOWAtiJiXzfg1A+ZchGKVGsSf03G
         jlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444326; x=1796049126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8jfPCUe7qNLVmh/bCCWGpaAKG7UBlJO6QYBEFeRggQ=;
        b=bde5jONAM4V12UgYtKPnnD/0a+QjxtQQQ+AbsQnJCiLiKw/jE67GdfxKi/G0ZreDlz
         IbcxH6Xyjw88gv3hZK6NFRRLyRyaorKf0o8ZUyl/+AcPc4eBFc87vhA59trc4OXLhefW
         QAX/cCCbnl909J4dfJZrsFfujn/bi49o4pR/S7N1bRuXyh2WO9+qXTDnLua1i16XUl6w
         9ztUvyu0KrXeN3yC+pRKuB9X0zgXCJwvV0UFf2j+5K7Dyn3lKwMwZFJrFxdKcl9alBDS
         uQ5bTpOT0Uzg07xtEBRLgeU4drSJVcx4ayFHYjFVYJCOChO7eUrrQHj/XPySGbcQIVxX
         3kOQ==
X-Forwarded-Encrypted: i=1; AL+hErFyYd/3NAxT2l6ukqzhlzYQoINFttxiL+RKcL18a8ylPlQ36BTbziWvd75E3QKuJvwgFI4JAO0JY4lU@vger.kernel.org
X-Gm-Message-State: APuU4Z/a/t8rfHt3QLC6gaKcm36um+UL8TCdtLGHo7/hxdT1Cf/iAmhD
	irGDLQVmYSIOsecjFBFjhiiiXOU0aKDxWtGPim9DbkIfQ1pPWdigte4ALvw16u2FeQCt7RD1a5a
	k8D5vAeHPUk5VDyhqBTqhiWO4ns54iji/mbJtdQkd0vYrF2IC6YsV2msa1nCxuD4=
X-Gm-Gg: AZFdTZcI8X9Rrb8q0uWj60Lo6E7EoC/rxaSmxY6QhQLOpVvAiLpRclsxFffgxOMIDak
	U4w9XILLc429r+srb97xm30yi+lBBzvuka9jQgFUA8KI74GjUEahub0ue4X4cZo3ZjtM1tb/CMl
	5pa1TIJjbCYWKfvvr8RnCEbcMJqyEkQZ8t+dZ4dixqLhI7TnA4b3zjLet4ry0357ufyzEX8lEo9
	wUXV+4tvWkEED3vG7Goqwgu4MxMrJN1PVw5IiyCckxHXIiRMqG1rUF9Y63UkzpgEeL6fvkP89sy
	jLznmeN2XGCtB9tcUrkGYsN70Mg/14rIZHjHR+sylc428DbirMz8ggsA6eZf8LHdfM788GxK4zv
	I01xnXyI1/eXYLkazKg9r8nC0IqSzjC0it1T3MXaj5QL2IZZOed4hqmdI75d39XaCOxPLMnJX+W
	1LezyAtcpGF0m2lm6t4FvpHfe1GMXYn16J3ouxZ2jEy2bU
X-Received: by 2002:a05:6000:4b03:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-4abb2ce4d3dmr23940938f8f.23.1795444325666;
        Mon, 23 Nov 2026 06:32:05 -0800 (PST)
X-Received: by 2002:a05:6000:4b03:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-4abb2ce4d3dmr23940880f8f.23.1795444325262;
        Mon, 23 Nov 2026 06:32:05 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm23554628f8f.8.2026.11.23.06.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:32:04 -0800 (PST)
Message-ID: <b745d596-97ec-409e-9673-176dce73f6fd@redhat.com>
Date: Mon, 23 Nov 2026 15:32:03 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/3] net: pse-pd: realtek-pse-mcu: ensure MCU
 does dynamic power management
To: netdev-bot+sashiko@kernel.org, jonas@jonasjelonek.de
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, sander@svanheule.net, russell@personaltelco.net
References: <20261116115224.1454885-3-jonas@jonasjelonek.de>
 <179506764349.3136.14504567519359431973@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179506764349.3136.14504567519359431973@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/26 06:54, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] rtpse_mcu_register() (drivers/net/pse-pd/realtek-pse-mcu-
>    core.c:854-857) now fails probe on any error from the new…
> 
The above looks like worth to be addressed.

/P

