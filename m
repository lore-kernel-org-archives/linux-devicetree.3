Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751714;
	b=wJbNqXYUuQm+HdXxua/8KHY1kZAkoTNZbE4BGPkgne2DVFhsLzyeF1FLdI2BYA7JBaHk
	 ZktKXrpf3xbBxY/KvXL6j39g9/WhSCBUqJ9zAX/WicbHmIFxQLac5DyG5zYa3PgHbQBsl
	 sqWMyYmyl6RmNomiNLfXCA60Dv6JRYxThkvw1E9/BTzeeFYrkugPexSMlqSH8+Vk301qc
	 f/wujJoM3TQN2XZy4PAZaU23mbQ5XvdtR++yPg1iIyviLYfBo4wwsZnzVXqFaTfnd1o1q
	 +Qd1Q5Py8sw3OTVv2uuLAqS+10m+jTiJeoAMYxeKiBDHBId4YYifS/V5szufSHxUUbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OAwUO3xw9jddafsCMcqvt+DK/SLIQKUYqgCB0JnxYDw=;
	b=amIygCvRZheccbRVjzQD7gQg3L9b8laBE/RyBib3qxOG6Tuwvp4Q28ztL8pXwhKIu/nj
	 ifGMOUzGmUziKxYlA5+ajXsiW3E0wP/14dSGTVmbNu4fVPMCkz6yihke76btFlkv/WE25
	 qPTusabu7Z79ocPaM1pjKWkF6Mj6wNvaY/B9OEGmZEESbOR1IvqgIdSwoCHhb+EXKn7nz
	 wpA3EHYheGrssoVSqwpyWYkqzTjVkBU1BKTH3feDxh5BxjhfdnveffUe3Si0qY+a0ow4l
	 L3V/8Z+i3i38jnmavbA9SGnJAnvfWocEe9S5n0Ya2ND8qhh0gXp60Uvz51UCINhCpdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YvPzcphU;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D360A2614
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3D360A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YvPzcphU
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso482791f8f.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792751712; x=1793356512; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OAwUO3xw9jddafsCMcqvt+DK/SLIQKUYqgCB0JnxYDw=;
        b=YvPzcphUeUm9ntiRTjXKfvXX0Bscbb5UYsaP12qKD0C8ZUDh/CjG5GhOd30VyS901B
         I7injMmS92W+KzSmo5Vnk04EdkGjUDDKA5Sx1u+znNMjnHEAmhw0cA9hDBYeNCPIBk/3
         lalZ5NSjW2bDjo8ape9ruRipgTlQQFHtMidGrqzr++5bd8PeNjVTLlUyrNwpy0sO1wPb
         PHPBODmv+H43y/gEzChKYND4BmwfNpF11Y210c3H9oTaqc+W1+1wbP2A1W6iggjqkLf4
         mQ+5PXQ/1OTr8o/M5/RM/JwJbaLtIPPEBRbilXubhnYK09dJX8xEpS1zm3r72ZNl7Yuw
         G4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751712; x=1793356512;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAwUO3xw9jddafsCMcqvt+DK/SLIQKUYqgCB0JnxYDw=;
        b=FP7FPbWVUKpSYdILAjorceO+tQvw8YYL+akdFILz4P3Ya8KvUIjTaqS/zA109Bxjdy
         GCJ8A1R+i/OuP7uvNqyL6gR5dxqTRlpDOeVat/cS9WzUdCDWm/Vz5YuWIWKgAYNCb9BI
         5I9oy7zlt5dNu5lmuQWKCu3P2r0uZCBbxrv4D63iJPIBkHUnG7DBn2k/k5OnsLsITyFj
         0VzG0SBsa+m/ir/WeKz5Hp+BXleS7fwL60Kd8+bWh57t4xSkeNwv7lGgffyXxBgOAFOc
         lpJ8nX5Q9p3NpG4M4CDcou1sjltf8hLpL/bfsMJR+h+qioi76dVf4Rw0EVCE6lZyu2N4
         8j/A==
X-Forwarded-Encrypted: i=1; AKwUvBzox5C17TS+1ccEq6BzXMHZVxs70TuYy9bPxLcaGZEN6W+qq3i5jHTrbB/2G+qVRjO8g18I/QAaIrMw@vger.kernel.org
X-Gm-Message-State: AFq9FYLIhuhQj0WWE0Y2yc1qf2ue4FSQ9uY0AdIky3PqctB6ydXqMUy4
	/T5xZ0pOC4qyZwF54m8BkKC/eda4M5+ly8/9PaZY0gyzau4IeOe72keUoqQ6A3dh17g=
X-Gm-Gg: AYBFou0P5TOtkPapt4jyiuWD+zDtwffj6m2A3fxz8lEo9SsDogTZSac0TPUfRQlVnls
	IFUhSywXZcKd7W/A0a4/96qdbFQrfj45dCNxa/MGtTXV1+mPlahlqetrCPrfKzIlGgshhvf/CjG
	o5lmUfUKSsvjyrrP8kd5sX5SpO2f/EEGR/V5w/ls1QOCJE4V5xNHU5WjqfadFnZj17ksDQwgHn5
	NptG1+UJIM4TiGNnkx1hxaK0HtwbGwTaRsHargycpRInsEoCTPMDEvbAMGUnP/fBS5wY+uo2KkF
	kI0rHH7Z4wh8BvWELccfXm1YXRCOoVKOfQ33KgyiPliZJllUg+kD5Y7KYX6SDCZC4Xl95drtTxl
	HblaheDmWDWwgV5WyphES4QA2QbuW56PN8Q75r+QyoUYE/A+AXqwDzuGmmUUn2Hb5ukCPgjFtSz
	3SbShVIfJZ8uRjQX15LJvUEdbGzkIlKckBsNqDQyg9i2S4BLiqa+9PJznK43A/Pien45VyfxEXO
	siodnorK6ZGxbcf6a9v0dB3d+QzgsaG64YnzYsxnFd1ByjvvcciWHJFXL9Oh7VBy+FVh0SbkBk=
X-Received: by 2002:a05:6000:4916:b0:487:a15:b4cc with SMTP id ffacd0b85a97d-48e38595e5bmr2679426f8f.23.1792751711919;
        Fri, 23 Oct 2026 03:35:11 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edfb3fsm4713525f8f.8.2026.10.23.03.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:35:11 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
From: Jerome Brunet <jbrunet@baylibre.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:35:03 +0200
Message-Id: <179275170360.4070168.11650113664838519061.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=dNgQAFqyGnVxmM7oecHvQ23reWhdI9mPMjanH5L2B3M=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm3LaJkUwN+3WXTmhS0Wn1LV8+H60VT70se+bvq/c/mj
 X9XzNSO6yhlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBE8tYxMpwu5GVlv+ARel/H
 l4mrmS0wQetMf0lT0c80eYtlV0OENRgZLlT8mjPF1ViKdcu9H62FN3cvnnFj228+iQvsp3ccXsR
 nxw8A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Preparing a clock protects its current requirements, not the resources
> needed while changing its rate or parent. A transition can temporarily
> use both parents or access an unprepared clock, and a parent rate change
> can cause other clocks to be programmed too. Raising resources one clock
> at a time leaves those operations exposed to insufficient power.
> 
> Failures make this worse: hardware may already have changed when the
> operation returns an error. A matching cached rate is then not proof
> that resource reconciliation finished. Retaining a temporary enable
> reference without a corresponding prepare reference also breaks a
> consumer's normal disable/unprepare sequence after a failed reparent.
> 
> Make CCF acquire the affected tree's and parent paths' resources before
> notifiers or programming, and reconcile them only when the walk stops.
> Keep fault recovery independent of rate shortcuts and subsequent
> consumer reference-count changes. Require explicit recovery of an
> ancestor's uncertain parent selection rather than reporting success
> from a descendant request.

I don't think all this is necessary to address the problem described
here and in the cover letter.

IMO a new provider API is the wrong layer. The framework already has
the hook a provider needs: the rate change notifiers. What the core
should do instead is fix those notifiers, which do have a few issues.
You are fixing one in patch 1. Another fix, about setting the parent,
was sent recently:

https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/

You want to act on some changes before anything is programmed. PRE
notifiers are the right tool for this. The user of this change in
patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
it, ABORT drops it.

Also, what is acquired here follows the requested clock. When an
ancestor switches parent, the chain of its new parent is not acquired,
although it feeds the whole subtree after the switch.

With notifiers, the parent fault state is not needed either. As it is,
it blocks every request on or below the clock until the same switch is
retried.

Could you tell me what you need from this approach that cannot be done
with (fixed) notifiers?

-- 
Jerome

