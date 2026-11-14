Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627093;
	b=kqZtNgwFcTLBudBiAACmHM5vjg2cDFVh4Yn1hZCd5AiqiBhX1znS/Y8Aj8gt3yPcelCb
	 7IEb4clG93u1t9SNTf7vnHYpbkSvXftfCd+MqLldrBKwMjww4HbvPn5enmI/t3PBrmacD
	 CY8vK21e65EWNijdo/z1xzIa2TPV2ivEcwNFLM8hObv/W77l8ZgcZLf6mxogc53mi45zE
	 LCpUGPJMfjnj7N212+FChH9FqdpQ1fHckMnCh3Aj6fT2vJAPsJoqO5dwo8dHLqMbsuplv
	 oS6F7MJLuL9NFwipOC3JtHTCHEiKcH3KXzVAUYRk4fAYtEKU4dcovdN/qmWxp21L1Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627093;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=nng5DLvgK/63+E7rI8IKFiq7cw48tw1TvpW9VBUURCA=;
	b=KBqpf9pKMDmxIjf7lpsNpGPkUeuWdbgbQmGQZ/w3wesIpRQUNh5CNl+JizIpL1KSMkU7
	 Zu//P27Tq+PqsJ2LmdpuHCRx4I3jMqsTQjWmi7wWgm27CFh2pC/US0Ou8bYuXpzF2ocWE
	 3fyg2ClX3xoS+lAzsGzBvFKcNmBW4D5pBUXnesmNF8dCjSuRGCA857kiWRm6U4DbIQVGW
	 BreburEkZdATsqjhjh2cGgTXlc58mgYviVz8JIIN4mJZC7udH0wMRC2j0GWUAv2sQRgRG
	 vhpEJ0HufJ49CkQdiwhjF30z7z2Vl3GGR6eOxq4Kv6QrytSdx2lXBHk0x+im+70NBcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=G1a8wPGn;
	arc=none smtp.remote-ip=209.85.160.225
Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEDD606A889
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DEDD606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=G1a8wPGn
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-536717a4d83so22607501cf.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:31:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627092; x=1795231892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nng5DLvgK/63+E7rI8IKFiq7cw48tw1TvpW9VBUURCA=;
        b=HECj1Rt1TiOMUl4e2A0q8QvcEqSUmxuCUoYQvu2JW7BbjLPGamNuoW/S8Tmx8qG9wq
         WAmAoPoIwOMRhlLR3olzgTSPMoHsK1G4cA33vS0T4ZtWgDO+DVHoK1XJsUaReb5gYkT8
         wluTj8OgGFp4o0IX4yEi3950cb11GA0k5yzJxg5VAI3kM7mfjQDHabcskIUtK2OblaFU
         f2SuRItkoiWcNeWtldzNBnpCTy2ptL3x/CcQPSJaZC68OmQC9udRCoEp3jj/eUE0n4Eo
         1U2BSX/DM7oszvga9wrKgMQQMoaNB997ZYXZV1a4QptcWB4/QSuiJi/DF79e0Iv7OWd1
         EbPA==
X-Forwarded-Encrypted: i=1; AL+hErGUNnPxhJkcIKzItkAuTMmzLDUJu6l+4AmxX5Jur6VA2L3W6Lqoa/S7fIMQtWt8WGk1MGB6cP/zRtAL@vger.kernel.org
X-Gm-Message-State: APuU4Z/KVn+qhmvETbYlpXmz+1yiT5AsLpoacDn+AWMT54aoiTQ+aXCn
	fVp1hbdsNNd2Simdoh1rzKv6KhUrh9eioUJJIYa8itgPdX0eN1JAh6+1N85d8Ri++nU5SS4ieZE
	gQ5OfwNpDNk+pEOZ81IyrgN6ssEKA62XrfHl7Wkdh11FN1FKm/JzbXjAPC4FIDQZr9J1eebyBHf
	3g1zaYIdnJTt2RFT6JYlrxgyL8zNZsnn+iIUYMudZM0RQva/JOEGDhpNYJnArniGHqYZah4b4nd
	Cluw++WYpSw4+kVGh3rRg==
X-Gm-Gg: AYBFou2Tt9FmrJ7danaWoNzBjqxnOQ9ePNkmiyvDQTDxQyQUeq5poSySayJmj2cTSw/
	54WH85OeCioQezvn+3BpPKDMV5eNjIxyMXVxVnG/57imDcD8N6WEULvPdAv/CAAg1x5vQjWqO7b
	yF9H8xA6F3QrWu/0auAPhKYwY43YhJXub3qB+WYxmL3u5KtLPm8U/QsVnZd2hHnJDL3Z5NBqNyj
	Iw76iCH0aChTtAgraIs76oCdRFCyIidtjufTHzObVWky6bj+R8OYhVOTCqo61WdaEv5bJnkBwkx
	CcJ5+rjqn2i97uS6Vb0/c/oHrdItqOa9tO3Bu7e74HFR3j9kdCx3ux+F0lL8fILYs1kov2hkCvP
	P77HeuojOPm7ZhAIHGcO/KSI+BAAYm1ktUoCMCwnjmEEe0HLz2jl0PSLtgQtk/I8tAkEpcMjUqJ
	VYSX7Bcw1PTKpOpgiCMkduuQSc7qOZju4lDLAt00FVo04=
X-Received: by 2002:a05:622a:451:b0:533:3484:c348 with SMTP id d75a77b69052e-55ac8b9064fmr74957901cf.46.1794627092200;
        Fri, 13 Nov 2026 19:31:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91f23da65edsm941556d6.44.2026.11.13.19.31.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:31:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so955812a12.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 19:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627091; x=1795231891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nng5DLvgK/63+E7rI8IKFiq7cw48tw1TvpW9VBUURCA=;
        b=G1a8wPGnMSQ3Hv7smYwO0Ypht23EAhgjDOhNcH9AJul+V4vx8enR+NJKjGW0FtglD/
         4WkzbmXRs3Vj82sF5OlWII3U65rOZNmDeLpzxPgRkumwC7d8PRy+MTtII4gw0PaUIh5i
         oiS2oFNk5wHfiAagZ90rFOWzynYl58H84FST0=
X-Forwarded-Encrypted: i=1; AL+hErESnsXmvclSINgoB96tCGgCFmJE6qQPj+/7G3lMFdlEFwTjcjoxjTW8oqYEMj8urFJDYO9oWdmrHyb5@vger.kernel.org
X-Received: by 2002:a17:90b:48c3:b0:3b0:b36b:66fc with SMTP id 98e67ed59e1d1-3b1b0cac932mr4288832a91.63.1794627090753;
        Fri, 13 Nov 2026 19:31:30 -0800 (PST)
X-Received: by 2002:a17:90b:48c3:b0:3b0:b36b:66fc with SMTP id 98e67ed59e1d1-3b1b0cac932mr4288800a91.63.1794627090341;
        Fri, 13 Nov 2026 19:31:30 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76745sm7343308a91.16.2026.11.13.19.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:31:28 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 4/5] arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node
Date: Fri, 13 Nov 2026 19:31:27 -0800
Message-ID: <20261114033127.875742-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-rpi-tryboot-v6-4-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de> <20261110-rpi-tryboot-v6-4-56f680ef4734@linutronix.de>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue, 10 Nov 2026 14:00:14 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
> this mode and normal boot mode to the node.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian
