Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793666519;
	b=Xs8o4cFYCMinqgX25e8L8c41upzw1YRXyxFrXhGbOnIzIpyPNMlciIdTqtR4nj9ALCJx
	 qTP1MPi4+7tValnE1LGizxQiWsbHClJjQtdKJOFJtS41rtSRqJX99YBbxDA5quHKHTcEy
	 VEZbKRx5rilYLhqEl0x1Nja32WydHmfp6lLUDavNiONiuD+j5lVAHMwwFx3f+k5islwF5
	 i/xydpdEo8J5FDj22wH5+fyuHWUSru0h6NWLtQQNiSFtIgEKfFJbIPei5GLIEXNpyXu8u
	 jz6z7EVm50w5sMZchzy8OgDEcqPaGx3jpBKeARbgmxWVGwqhQMrGFMJ6UX4Z9SkOGNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Vh/cvDInRTV2ogz1411cOMX/5XEmrB74tytYBj9+zVQ=;
	b=n95He1geTEtNK9CBW/pUmWlxpGuo+JUmyrkzuhpLQDdl7uyXKazRzvpoUO0y8fzG5Ne4
	 9/LI5AJr83eBDrPqynx75S62RvuBapc1xf/mi0zUNZl4j6DhFvKEViQHsyC5wNUfan9Y7
	 3ksaz2Yxkeb439ChSvnNwTqE6EGwooS5zmz+SXq/3gz9PdnKBL9QSYWowSv1BoN30Z2ru
	 7Ro0eZJkmn3Boxb1k8OY5ZP2AMRshLPRidFDSC+/RYfJJZpJcfwendsd2vbyRu6EuJDyh
	 zrUYNN/af0GKm1tk33TzRn5CtJRYnz6iL2p4MgGn4f2rjDFwdJeP6EUfJcy4r7On2Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlYgoHZJ;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83135606A329
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 00:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83135606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlYgoHZJ
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4e4a4d77e5bso124744b6e.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 16:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793666518; x=1794271318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vh/cvDInRTV2ogz1411cOMX/5XEmrB74tytYBj9+zVQ=;
        b=mlYgoHZJPyDH8aKsCrRTOTDjkn/aAYIuANPWW4NFdj3cAAxSk1WOS8ot81rJ+DOEvL
         RY1FsZgPT6NL6xxURQIGTx2LwhVUyjz5SojX+TtvhCn/b9O3GvLRgdJgiVvRK9LFWo/z
         8gyOsn4BbOYm+3d8n/OkA5TWliFDTlrbhqO0Rd2DtVYhWXIf2a11C62f+Hw3KOhz33cS
         xhxcTfJBn5yDU632B0voD2ZGCYlrjnUUTlxlXZoKLnbj2YcI5qufZkT27bWPEMcdZSWe
         2i6vUxVatS8BvYy7nGyr7SG41YlVpGsXx9uUl67h/1jZhwzx81pKp++1pCmRTMf/7EkL
         NwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793666518; x=1794271318;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vh/cvDInRTV2ogz1411cOMX/5XEmrB74tytYBj9+zVQ=;
        b=egnjhUlArJy4dh0yMeeVvaArwT9Bt/LdJ9oT3nyfBcs/XmChqrhB6iF6copPRihXU8
         gwkSgf/2Rny5DukePXEToOYQZ0XYVs6xfNR9BJJkK+4Joeg8r2pkCpCIgJw948IOaKI4
         /ta4wqpE9s1RepjmZzec3iXgAtgvyHqftkoRVxskzonmN0SFNDMPJ0ow/5BqBtdd3IsJ
         z1kEOkb76RKCWXd3K3rfKeGN3nHUkFMh1RXyNmmplbMEFyPPjrlR2Nlf9Dv985p30Cdr
         m9fSNmvLOf9siR8BD2WojmRfr8yjiQfyppwSCc52pzyjU+rpWr65RbgOwS7Uqg5Y2yMq
         gtqA==
X-Forwarded-Encrypted: i=1; AKwUvByyqz+3cAFi4MFDx0scEFIQQAVA5mgsHMkTQO2i3E1lztzkz9z/v2899pGZlRStjt8sOyct8BSsix1N@vger.kernel.org
X-Gm-Message-State: AFq9FYLkgJMstDiBT4IKplQDvmiUQPYMGaq412aHQsduxICtNO7T8Izy
	RwvqDyxOc/x+7OygqdzD97/CfxUCMuLpuEKiQ5vv723DhGANg1zxNvaA
X-Gm-Gg: AYBFou2co3Z3I6z3AI3GTFvGNXgWbAT6GpVuPR2/zXddVCnSxrslNB0BRRYEy3n9sWy
	/EAqpPOhqdniFZiBD35M5TqGNRNppdwgN8xI/xDK1KFRmbXmgTqsphrPoMAuDG4QtgVMvonmD7Q
	XdSykddsXkeZbdRiq/B5uhbzF9h2is+60O2af1Qg27pGrejYQe6/Os2Y8Kyn8zO34kiXegUu6/N
	uxuW/YskeltLFOM1Gw/Ev1ag4YwcfO3w2HNUP7lPEauh39EN1c1YMcID4Ogzz7TiOuM0TAEbTAC
	27KTkG1CEiMeqRnKVZp54apwLWMbkR+HzKbTM2cHDo5IsuUQnR4iW0xHjrILwK2qfyJqeJWiqLw
	eK6nXyjuoDZL1xEdS8ZKqgNDj6bz+zdMD91IXK4pcbyPbywy6A2USEQKSF7jnZ3CDq1m5jkdYNt
	dBQkSCInuDwt2L9dPL8FhIvbCzcwZbfxkUGI/6Us1C3gWJHLhoJfOrdT4E3FjTTNYEizG+Skc+R
	pTWrGkbRpmEJcCyhTvXzm5FKBKnBzl07i0wx41eSyDs9/S8KhKEMB/SLuRfZIUhxks4+dZY33KP
	80uaLyD0EjDs1Vkk3B7b2oButeXHGte1x5OGJJ7P1oAoQvzgS/aF7vlZwTPrHj18HiNgd+QSTVB
	hPQ3n
X-Received: by 2002:a05:6808:6f82:b0:564:57c3:2b28 with SMTP id 5614622812f47-56457c32c1emr1301058b6e.8.1793666518415;
        Mon, 02 Nov 2026 16:41:58 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56523cdd0ffsm388473b6e.8.2026.11.02.16.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:41:57 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: krzk@kernel.org
Cc: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH] dt-bindings: mmc: describe the Allwinner A733 eMMC controller
Date: Mon,  2 Nov 2026 19:41:55 -0500
Message-ID: <20261103-a733-mmc3-withdraw-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102-steady-grateful-chimera-e2363a@quoll>
References: <20261031020640-263f7b05-a7s-mmc-binding@gmail.com> <20261102-steady-grateful-chimera-e2363a@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

On Mon, Nov 02, 2026 at 08:27:19AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Oct 30, 2026 at 10:26:47PM -0400, Enzo Adriano wrote:
>> AI assistance: Codex:gpt-6-astra.
>
> Drop, we do not advertise slop companies anymore.
>
>>
>> Assisted-by: LLM
> Drop

Will do, here and in my other patches.

>> This binding is a separate prerequisite for the disabled MMC3 node in
>
> How this can be a separate prerequisite? Binding without user is not a
> prerequisite.

You're right, it isn't. It should not have been posted apart from its
user.

>> the A733 DT v2. It does not add a sunxi-mmc driver match or claim an
>> operational eMMC path.
>
> Hm? Why?

Because I can't test one. None of my three Cubie A7S boards detects an
eMMC, and their vendor device trees leave this controller disabled.

[...]

>> prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
>
> So this cannot really be tested.

Agreed. Those IDs came from my local tree and are no use to anyone else.

I'm withdrawing this patch. André, you asked for the other MMC
controllers because the IP is the same, but the manual documents a
different descriptor layout for SMHC3 (A733 User Manual v1.00, tables
11-3 to 11-6), and I have no hardware to test it on. The next DT
revision will describe MMC0-2 and leave SMHC3 out until someone can test
driver support. If either of you would rather have it described now,
tell me and I'll put it back, in the same series as its user.

Sorry for the noise.

Best regards,
Enzo
