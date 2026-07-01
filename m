Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B20370AE5
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 05:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782884931; cv=none; b=JJU7BeXG7sznIOsisQ+G6amnu7wR+ZzLlWrvccK+H8uHaI0MAyPKSKYj+WQ4CRbvJHa3R8TylN7ue7V7ZwcqIWn23oj5uyj31p5+Ao8STDCNh1NX/jugCJBQtSktPnJdBuSPEjKyJMSAS80Xl0ZM+KZck/LEVsLkWe3hT7q9a9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782884931; c=relaxed/simple;
	bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qC+KyMiFcKXvSbdQgAcKWVc5pnM6kTNEogw2Bkvc1toMR9UnGXD4saXng/F+4LUom93tqtqdkUVUIBJ70hcbguHf7i5qkitT9qEag0MLneXIg11RYjnLoSXOmqthnGZhxNB7tGESV1Lvww9sEQ2WuvKZnTWSJx1XO9oVYyuu1wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGfH/kus; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGfH/kus"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664d35b4777so293304d50.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 22:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782884929; x=1783489729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
        b=MGfH/kusValSWGS2sOYAUZg7P2dHCrIE4+i5MC+fqg0jRrtpayUdRNqekt0iVYMoUv
         f3SE3ZHg9KjuonVL+acd0t07/FmT1zSLkU28Mb+JFeG+gaeQra0JznX5H2JLE2U2qpjr
         A5Vy36pHzkLEysoPJ9MappCC0ubyOi2O0i0EMl2Cj5J7WgDf45BXYKYQYApIUPXJszGk
         PlpD/FiQC8JXY/iJxEdNtB2olgYQiMNQJnphywgllciBr3nt9yu3FyVuOHxbwlqDKN0k
         Qp7us9xk2ykcWKDGqBzQ+peVBDPacwLxILS9aNpuBzVQxdZqqHLEL88ZjteYAeELTLEl
         aFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782884929; x=1783489729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
        b=Ajr9o/KQ97gdaZ3MvnP4yvflvJh/V8giFDP0hEy0M5msplw4Z6pREPuqqqaOoU0Shg
         2FGzIyWB2evqvUJlpKJez549c17SzzT5u/QI1fG2aeaA1mDKknUQ/68xF4hWUGFEkBdK
         NPcBgH5zIcKnOxhb3mGbegFhOE8uCV1udJBp87TqMujMQr37NfHrY4vjeCI+8Dg+U/kD
         Nhiv1/NKrRjkWTK2pEI70c9TVUNeNQL83om6FBhHuYa4F/FvqdRdQLPTjfzCm91zvZGb
         kMRNiuUXSO9xkdqlJoSvfaom9dJ5+WPC4bW2mmLwYHlP4bZzZHo5+/BjRtJz1xfqz9H/
         GfDw==
X-Forwarded-Encrypted: i=1; AHgh+RqCwgtvNTTBP+t7O+fvlO4UtnupEZbqzHMy0oEYGG/0FWUvjeuOwdKpCygGXy/CnAR6leDS17NiQVhE@vger.kernel.org
X-Gm-Message-State: AOJu0YwyCJco42hEbKJ/siOnh67pFduNfcQayJHF+LJNu5SFKe/4ssPX
	OWXpRK/eTPA8S5MjM1WngqfRah1Av/eexgBiuOVshwEEjj+h1Ntpn3EPhh5Hbpj/pcA=
X-Gm-Gg: AfdE7ckGE+7I33Tx2nrKCBKkj0zFpoB+IsHbaj+QEN6ucLxMIpbeTz6Nd84HIQZKDP7
	SV03990FWM0q/vsoe8rsb0jxdz+n3feljSxqQ7l4+Iew/8NarOFsNkNbJZzCkpFYTy6VwC+GIkW
	yw951owC0N07eZ70cTUNeb/9G2XUdbJim6RE+UBB7mzcYwUzmBB1fK33WlvOfkz8ngWYjbFPitS
	H68ob+2ttsxp4ZgC3KWpXm47UUZ/AmVyQ9eFXaljStpuMI3bfBvw+0edjH7LCCC5MixUtmhxO33
	aRNlzZsiVTgUljhwnaoq04tAUb7daHndQZYGFxFDlOAvlVzEt6f/GG6ijfQFVYEi6aAgWLFXz6L
	RYkvHvlpdbtAl416K4YZZMeLk+rn3LbaIsev5w2BXZrmHSAz9BbwI/KtMKV/LCUlFe8hBaktmgT
	ntRIlys+bThgfIoOAOoM0IRXQQZcr1Ayt9DDlhUM1HPvlGFNu9Hf+IS+yxnXHx
X-Received: by 2002:a05:690e:150f:b0:664:c7b0:f655 with SMTP id 956f58d0204a3-66521ae384fmr205145d50.53.1782884929334;
        Tue, 30 Jun 2026 22:48:49 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-665000c8152sm1920856d50.0.2026.06.30.22.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:48:48 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/6] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Wed,  1 Jul 2026 01:47:44 -0400
Message-ID: <20260701054744.3962458-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jerome,

Thanks for reworking the A733 RTC support.

I ran v2 on a Radxa Cubie A7S. This is local validation evidence
only, not a hardware Tested-by.

For the A7S integration test, I stacked the series with the currently
visible public A733 CCU/PRCM v1 and pinctrl v1 prerequisites. Focused
RTC binding validation, targeted RTC/clk builds, and a Cubie A7S DTB
build all pass, and focused CHECK_DTBS=y shows no RTC, main CCU, or
R-CCU findings. The remaining findings in that base are unrelated
A733-wide schema gaps.

On A7S hardware the artifact boots cleanly to shell and the RTC driver
probes and registers as rtc0. While the board stays powered, RTC read,
write, and a short readback all work correctly; the readback advances
as expected.

I am deliberately not adding a Tested-by. The RTC value does not
survive a full power removal on this board: the published Cubie A7S
V1.10 schematic exposes the PMIC BKUPBAT pin but does not show a
connected backup battery or supercap path, and Radxa's A7S
documentation describes no populated RTC backup battery interface. So
I can confirm the driver is runtime-functional while powered, but I
cannot honestly attest cold-power persistence on this board.

Happy to rerun only the persistence phase if a valid VRTC/BKUPBAT
backup supply is identified or fitted.
