Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA2D4921B1
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043961; cv=none; b=aw2MS9S2U0IvEWRsUyI6LDdmQpCK9BUqL4FKX02jSYlTk7uXeU2WZfnoZYSY7M3DJ4FG37eGT9+tlWfkNfRMtbaFbBPnQRVVktxe5B33dvq8j49u9WdwKFYTvGfozIq53WErtvpQR/dEV9vNjoxwiOm+97I/tJezr4UR/ayyH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043961; c=relaxed/simple;
	bh=B4kz5SsRggjEFJjV3J/sE+7/gP1ESaf/r5J4kQ1a0Po=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N8sULs5IbEObobBHW9npriRVcVmDAcr4k+W41l5We0EKJPoiA3v+iVoTBG8Cadv4enAV66JIrGj0mpujGFuXudYebd+A/65zgZ0TSzru9vdoz+zgYRE4+5jE3U7OHzXHFN1HARvNTd91ft1uPvh1TZjiG1EqcBVLUAtKtPBsKVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QCQJjyR5; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QCQJjyR5"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c858b392697so2924635a12.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 15:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781043960; x=1781648760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46q2U4nrUSnKYOo0Qk6SmRB++eNAzeKGUuI3ymafY8U=;
        b=QCQJjyR57x2jUdD3ntf6Gyww23PmARz4+wAcMdlzZE7wY0U7MqkScjLb+CT50OyZh6
         J/daVsPnZPc4yBpihDiUbgT4VGV0h9dxPXWbvpUu/q4qYgmBdvJ1euYLyvNvSbOGRONc
         NPjGHwYjXnDtuu5yVjS/sY21m3uBsnTPnRJuOsQneVVFuatI+lmoqwBhPbOjxxEK26i+
         W4YVcitKlZ3LHPjK6MRkSuj93knXfvNFg4+cImH/6dZ3x/Lgwx6UYIH+KHt1tYJGrJ+6
         +QB+g0IXjgcInp0c8o8Sfa8HSlJCsKibi7ZbFiVKKp+yCmGtIOHT2erGIHX2sRanrN3V
         ftYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043960; x=1781648760;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=46q2U4nrUSnKYOo0Qk6SmRB++eNAzeKGUuI3ymafY8U=;
        b=IMOyLiPTZegalwCee4P4TS8FL03bPO/GeUXQqyItNh3Ijb9Cu3/GY8QDYrgTSnAhzv
         qXcOORS3Z//05/agSct2y7S2DJX6bSyuIGdBeAyFxRTa9UO7XMvcjzpPRzfW2L2B0RbD
         rEp0gZ7rYh5hCsiP/0EZiBa9Pl7qyK4YeG7IDyuX2Za7DGyHCl8bDBzWQv7MiC9Hhkbe
         cv5pnX0fLkAv018KG7b4+pvV9iY6EkoH86X08DVzVPYm+o2zuBdHwZdTWLnq+OSt1IVf
         hz0nMHYALsuLAVZMxUzO8NTzaXkhwJ8xYtW0o0/Dkxpa9j+kSICxjkra/26CSXhN/+xE
         UMjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sqYzmIpWODnXrI5Jx4M30WHrc/ESD0VvPynFTcdK0LxAOJEfc1se9rA0NOb1Z735a+t7bz4FLhz3H@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd4PNr+4azw36j9y5wXeE6uwsmf+2+kMI/M6wa8rdtlhCWPduX
	OGm5jFYUaTXCTPfeovjwBJzLR/n2u/zdH4cMCrjTZXGkN2m47opIf167nZ2/VlpKIHC5itHVuKZ
	xzmagYRUCKzJy
X-Gm-Gg: Acq92OF1u3e9a4pv57DypqnOOnJI4/j8EodMsw2YITWWkpvFOoZwp+xOCIO0c5MXJm9
	pfa880sQ8sPuWP3NOjm5eJ1OG7XuvLdQaO1Li+BlEkF62kTa2tCvxL9rOvLS9sqyprcOHfWp1Zk
	L+mxIXzLUFBPXmroKnb5SEa51m9IDKhUqYWGJZhKinPt35GkzUPSvgsKLSDuyWh7ha4LxoGnLue
	kRgru0dECx3wBs5cw0KEAaaPmP7Nb9Le1vjpL2cqSP1a27yAS3WPljQrMjCKMZCDuJ3/BLq0DCz
	wwM8iJsLSj5GfJI8GO2vNb8BbB+ZGDK3XmJ+MskE9EzPqCyX2qXxvb97wo81wjzxtL4mpgg53iO
	lAQLv+hU0TyGRyq8svXCrwQ4CRf8IiQwhtvwWAJ7fEKuS+JIC+J+6wOG9hge+syn9ZPlloXYC2/
	0N/NrUCgR5EvxI7vpVseAUbnplUgxBTmU=
X-Received: by 2002:a05:6a21:390:b0:39f:a42:9247 with SMTP id adf61e73a8af0-3b4cd0670f4mr27316925637.37.1781043959893;
        Tue, 09 Jun 2026 15:25:59 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-c85df0bd337sm19404461a12.29.2026.06.09.15.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:25:59 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: nm@ti.com, vigneshr@ti.com, afd@ti.com, rogerq@kernel.org, 
 tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 richardcochran@gmail.com, aaro.koskinen@iki.fi, andreas@kemnade.info, 
 Parvathi Pudi <parvathi@couthit.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, andrew@lunn.ch, 
 danishanwar@ti.com, pratheesh@ti.com, j-rameshbabu@ti.com, praneeth@ti.com, 
 srk@ti.com, rogerq@ti.com, krishna@couthit.com, mohan@couthit.com, 
 pmohan@couthit.com, basharath@couthit.com
In-Reply-To: <20260428072046.3022679-1-parvathi@couthit.com>
References: <20260428072046.3022679-1-parvathi@couthit.com>
Subject: Re: [PATCH v7 0/3] Add support for ICSSM Ethernet on AM57x,
 AM437x, and AM335x
Message-Id: <178104395875.234140.5899663583168202275.b4-ty@b4>
Date: Tue, 09 Jun 2026 15:25:58 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 28 Apr 2026 12:47:26 +0530, Parvathi Pudi wrote:
> This series adds support for ICSSM Ethernet on Texas Instruments AM57x,
> AM437x and AM335x platforms.
> 
> The AM57x and AM437x IDKs support two PRU-ICSS instances, each consisting
> of two PRU cores, with each PRU-ICSS instance capable of handling two
> Ethernet ports. For the AM57x platforms, the PRU-ICSS2 node has been added
> to the am57xx-idk-common.dtsi, while for the AM437x platform, the PRU-ICSS1
> node has been added to the am437x-idk-evm.dts.
> 
> [...]

Applied, thanks!

[1/3] arm: dts: ti: Add device tree support for PRU-ICSS on AM57xx
      commit: 9c4fc66a770a018062e371d1c8a77184d4c15dad
[2/3] arm: dts: ti: Add device tree support for PRU-ICSS on AM437x
      commit: cd080146369be3a1750774eabbb839c45cc9a750
[3/3] arm: dts: ti: Add device tree support for PRU-ICSS on AM335x
      commit: 19ab47bb6b96820c28024ebfe674050fa2c54ad5

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

