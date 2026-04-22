Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A75371860
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 22:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776898121; cv=none; b=q2At+I/vBTUSR+hA05/CfKHkEXUkLWLn+MBQWxy1M2NvOB8ipGSSI3ULLUq5eafZv17WEnLAEOZNFBL4h++eLK8vMHlIeoDm0ydP/cFhsY+MrWTGNNMd+ayrIJZROiY2J11rZr+0du2FTts44q/QXamkpNdhrcS3W12pGDk81zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776898121; c=relaxed/simple;
	bh=NRWSIj1awYbKDb7XDOAYoJaNnOVQ29rl0pbbuAh0CXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Vhxn77BmXpTDnu6HbdM4GTMMnFPdC3mA0XMif2R/tLQ+9afQz5e26BwdOMxXc5yachAKp62bfGaqGS3TWsKVKafXgobgIeJz+4dNCSAXoPQQPtaSiPxaJvAykyf6G/Xeqe3pRk+tpSypQiyWqiyWwN955/CrAlJpqPPgKMQI0Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=xP0Kzkm4; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="xP0Kzkm4"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f351ca23cso3067131b3a.2
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 15:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776898118; x=1777502918; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4qI6kGELEoPNIDxXAqpiIcX3kz3Y96gemHsRdJV8MIo=;
        b=xP0Kzkm4cdE8FArVwyURRIHBqxgKXjsZXcCImcT9GabegLK8BxG5yXw7MeEN+gWO7c
         2iJgGQFINJgAKN4BIjv2ysJkJXWZlOQxbXwci6oucu29d124FfVSkzHu8hXbi/VexCWw
         hjwhyIsDf6MUPD82KchjGOPlF86Z5AZ0DIdldkzm/ImvFY5UnGqprIWIN/8ggT8MHI7x
         C7bkUNY/zv9Slh+EsjBw7mM+szwXkfl5dyNd+ipkpHdIFjyG3Dc2g+IoVn7132uP1t7O
         wXQk5Z9aE5FO4TfJFxv4BHrYkyNiuRepGZURqK7AOiZEUE8x6Gx8H0zBwRCrirocoUvd
         v4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776898118; x=1777502918;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qI6kGELEoPNIDxXAqpiIcX3kz3Y96gemHsRdJV8MIo=;
        b=Q9i5RP6RjEZVmPCBTnitcmRHgRikhMbsKM9eU0q+xgumtrbsttDRBjo/N87rPOrvRX
         N1Q2mvO9Hq2i2xQutUsyqc9L+wyRptkn7nczEUC2gmfbmq+ghT0QZR3lzJgaTjYiKlkK
         s7anOZ5T6GjTBjei80DPFn+wmRkR3yBw/EBM80+9tVy9srRA+qY0+Sm1S+zd+cp8QK3p
         KUhuVjBwH6TYKPPkKA6Uaw+ctduBcT2iqWNmHNka2lsb2noB0wl8HNPMdyf2NHI/1lUW
         PyTDzP3AB7diOnuZXe5vWiD14WPnkVlEKNCFKD0k4Xb+qcbmWjCLQiJkTefBIXMNCRst
         QL2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8/9PW79g717Zx+U7BgnSuJTyFDZyWCDGYsvj+VLSzpetScZALrgFVcbo5UISM3SxGRVeLFMkePMcNh@vger.kernel.org
X-Gm-Message-State: AOJu0YzlCyNJp9g9WHrua3ZnQw69/kqR9Riv5EW5e1pi+rub/ewyzu4P
	MwmsvaiZRd0sGhdKq0Bh87OQW9qUYVY42B1Z1rfjC6zjNhwKTZFdnRTWd5OTVBFhnC4=
X-Gm-Gg: AeBDieui9nBoioYhWya3rT4E3yAVR9VgA012er4CUClR+7jrlQBEDuFfhpip0LewVy9
	cyrl7PSZ9XzKVyKuWHyTAwA1fxKRj9/sPn3B7MK1wcQbG2AmDLsYQsJBKNkHxI58Q5oTTO+tVkU
	0WU2j6KPNb4BggeB+B0qe+qSKrCwhhRNv1ZYg7wIGUmlYeKzB3JGvXpM5VkB26d7iW6ptJfodlX
	g5EtiNVI0IijbKggMKHQsV0evf1b6mdURr/Qn9LkCrXFWKTSZ7EqXv/vF2vQTMhnSX6BEWd3ZZQ
	Sv4yDj2LMPGLqWqie20dyPOAYNGxSeNVn+F0dj+oOQRAu7fqVQFYoBiyoe4BWAFVPfZSaDY/OBY
	IndJDDfUQLoEalznsavhnPwFqmX+zI59Q29Hpv2lfJVEo2K+84b8SBK5LHHcd6karotUuFgEL7J
	5jd1bkZgQ4hV1UE1jFV6L17zBmuBRckg==
X-Received: by 2002:a05:6a00:c8a:b0:82f:98c:1465 with SMTP id d2e1a72fcca58-82f8c8fb258mr26682792b3a.27.1776898118539;
        Wed, 22 Apr 2026 15:48:38 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec04448sm21836313b3a.55.2026.04.22.15.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 15:48:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Sudeep Holla
 <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Saravana Kannan <saravanak@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
Date: Wed, 22 Apr 2026 15:48:37 -0700
Message-ID: <7hcxzqr4qi.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> 	Hi all,
>
> TL;DR:
>
>     Describe hardware in DT, and perform the mapping to SCMI in Linux.
>
> The Renesas R-Car X5H-based Ironhide board is the first Renesas
> SoC/board combination that implements the ARM System Control and
> Management Interface (SCMI).
>
> This means Linux can no longer perform various system operations (e.g.
> clock, power domain, and reset control) by accessing the hardware
> directly.  Instead, these operations are abstracted according to various
> SCMI sub-protocols, and Linux has to send messages to an SCMI-compliant
> firmware running on a System Control Processor (SCP).
> More specifically, the R-Car X5H SCP FW SCMI controls access to:
>   1. Core clocks and module clocks,
>   2. Module resets,
>   3. Power domains,

I'm very curious how power domain hierarchy is described on this SoC,
because one more issue to add to your list is that hierarchy cannot be
described for power domains in SCMI.

I know you're aware of it already, but just FYI for anyone else
exploring this space, I have a series[1] in-flight right now to address
this limitation of SCMI so that we can at least describe this hierarchy
in DT and the pmdomain framework.

Kevin

[1] https://lore.kernel.org/linux-pm/20260420-topic-lpm-pmdomain-child-ids-v3-0-c2c40bef238c@baylibre.com/

