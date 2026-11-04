Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823393;
	b=Iu5iVGSkQol09g27x5ETLYEk4GJgibemMbiLhvbx34oFutVhGXem7lNodJ+AkYF8W+2B
	 7iceo9FswJoOwYiA2mAapDJ+4hRRH5N691PdTnhwQbGqTUlGVUcVbnIPMVHeaX+EWPecX
	 gKleqSi+LjymS7AO9FatlIXcriKj4Hqr5WNL+ww5Nu0C3YC9Zo+uVBbyjgx+WpMWlaLX6
	 +yPHpHtbQ7bp8B/Xk8A/0Nu70sPlZeDVtKz4uiH9gXHPmhRiFTerEYzMXuClQc86zoVXG
	 jJd6mn34wQCUcoBqwShgp/062b+NijM+cuRHVeziTBtP+Q3aWY4P9j1zvj0P3cmMQ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823393;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=foLRpBa47s9ruCMxuyoA6DXIF2wwXVPMOzwICiq0ito=;
	b=Phc4zhLS9jHck6UHXqZ03OA05WGWKKiIkpQA8Q41c91s9mtymvofhfdfp+h7jRunFWZ+
	 thePLUG5dxoyK/typ1Inxn5VVvfKd7OEKJTKTMhWKWXFLbw/MIrqNCVl4bms97e1C8gHw
	 ytnrGgNSvC8x1k3LC+d+AO/DkpL+48KPSOeh3kbnJzj3fXk1NSdnMIZ6DC0NmcfkgrTyy
	 wDwSrEVm4s82czsAN/YI8M6TSI6ihbtU+Fy/mCxo6VeQydZdVmtDmeE/wcqXzBGHefSe4
	 jcaNeenkdIDFDPulsAU89QPRBpq+fYAG1yx4nBrYFso6UoEWrk3Jp3Qhd7sharVoBqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ED96071A13
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 20:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3ED96071A13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1442104a91.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823392; x=1794428192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=foLRpBa47s9ruCMxuyoA6DXIF2wwXVPMOzwICiq0ito=;
        b=D5doRQpCRNJGl+6dEdJyq+kegFXC68FxTKMlVhrJKQB5f5Yr5ZyhQVZi/Tj/TfANP9
         51R/pJlspa0EYRJZX0q9qGcZgLvJjQBfEAp8bCD5HH/O6b9sd9rcr2ik/d3smJc4+TeB
         HD2zMtJn+2qbKsW/RhgQ02F12yfKVTvL5DBS08lHo2S8eHO93OtypjMjaaRcsb4bl5Cc
         cH/2suc97UM7sQA+hoHoMDUmubnv73zNKujs9J32OAq21OCN9WoNJodpDQaq85Rdsh1N
         Uk7UiWqIlzsicGtwpaDQ1Qqii36l1j06FFa822DB5R1pHaZ+keUf2DhJYqPKgjmQgqqy
         kdhQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2DwBOCBWpUpEk90SrS30EX1W+dYM7ToqMPU2J8GPtZnBMhHBJLaLqrtuwfWOQ1VB6kzlCQkuYYFEK@vger.kernel.org
X-Gm-Message-State: APuU4Z+sORiXArDHNvv7v3B+DokQZquBthbPL/QbDVF86C1zAZYGxJQR
	k0xI1bs9+j4ftMwrmPPoxZ9Rr4WBHBqo3k6bx0VGDQYdCLMTHd8jzeXSt8kpr14M
X-Gm-Gg: AYBFou1y4RVKaReEVLSm9Q/JguBqOqJ7mroRGdR3FSFSyLrNKAAqjwbN52AYGmPywyu
	PjOfQ0aMPPIq1j1KuMtixVnYf7KW6jROq/5oyBdwrvj5gzDhcjZScSFvunG4IukiYDBcODNNXbP
	O7wtaM5PYlqwJNux7PcD//Xgqhg1Vy4x18YO95mYtqKPRVMpQ/mJUYIGQBzvOLhg/uy5bP/44Vu
	5RAJGMOAJSN4eCtE2gQmXEJVrZbl2Vo/mnaB3dujn6AXDConBN1a2tegRC+B21DOQXeFNyzdikI
	Y3PwhAQn0HRwSrU2V1XB4PMh+WzB30yaZfzuzIU4qyd86gMXred+J/B2wB8WNlbnbvl2lyD4A9u
	CrCwSxDW6sV2Yojr3zOsWh7rE8O3+H0eFAxLjYHuoWEYDzvA4JyAT/toKQ3VQGfzR5KWuHngSGi
	TeK30eLiR/ozKWn/PBPugBMTqF/zPKl8x6PCbcERa+4te792tBHwGMR6hw2HBpbtXzbXodFvpr4
	aZoxBJ9egflRF6jqkI9NE6ZWGoOaxiu6ty6dVLtgGHmwUgUaIdk9vEtyhVBKnfOtJjDtd1dk3UO
	KzBPwudc6cTZmItiMnAzwE5D4lG98Iwn944jIgGCOOySeXoO06oWaC1k1HreC3dx6qmRw18eXDk
	9Fm3j1ksEpCXgxnoWMsCDClVDiJKPGoZL6HW0Cd1FljQ=
X-Received: by 2002:a17:90b:3e4c:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3b0afbf697fmr338222a91.5.1793823392362;
        Wed, 04 Nov 2026 12:16:32 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm416157a91.3.2026.11.04.12.16.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:16:31 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36cedf1bd63so1205537eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:16:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzI+JHTwOe87u7ghDmYE8R6gxfNNlfuOBRshSOP2wbnZuALvEtJnf53HcgKOBgtach05trcVpiJBFSH@vger.kernel.org
X-Received: by 2002:a05:7300:dc10:b0:36c:a1bc:6102 with SMTP id
 5a478bee46e88-36de0488bc8mr1203042eec.0.1793823390961; Wed, 04 Nov 2026
 12:16:30 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev> <bd0d89d16c9effa60088131aa81b6d5786738c0c.camel@pengutronix.de>
In-Reply-To: <bd0d89d16c9effa60088131aa81b6d5786738c0c.camel@pengutronix.de>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 15:16:19 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ76e+ij8zPg3kEi_1qNt1gqh2PuJRCTcvQghsAHr2Ft2A@mail.gmail.com>
X-Gm-Features: AclHuK_OSxtEYlXiOHps7a-cMZJsR_Cw4vnjS7VT6Pg5ApAUwbgB-aNStGUXOis
Message-ID: <CAPY4CJ76e+ij8zPg3kEi_1qNt1gqh2PuJRCTcvQghsAHr2Ft2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuanhong Guo <gch981213@gmail.com>, Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

> Consider replacing this with
> devm_reset_control_get_optional_exclusive_deasserted().
> rstc can be a local variable then.
>
> Don't use devm_reset_control_get_optional().

Thanks, v2 will do this. The binding makes resets required, so it will
use devm_reset_control_get_exclusive_deasserted(), with rstc as a local
in probe.
