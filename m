Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFB435F5F7;
	Tue,  4 Aug 2026 08:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832901; cv=none; b=rS6fE6HEyoQ6bDPva1BunBk8U7LJM6lierBxejpE7+ROAl0HYM5KPlKlgivAdRH0mUIkTrxyZljxW9Djvts8bWWP0bOm5efmDvCn8dmgOCAmCG4B+aaaRPJAIkWYgks2SbolY9F9OrWnax4djoeaon3eFFul5DAvHWFM9mnO7Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832901; c=relaxed/simple;
	bh=7LGYalmhQwZrxOtGKmdSjC1WD7j0rRgBEPhRoGP+KSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ob7nutAoKGdviMARq1RQPGFb6XI/RVkWlFvs3eggsZHufS4zR1OXq9H1jz8VvDH0JxZmEVZspmgkBTXX1g1qam2aWxmWgS0WV9AFpNhz+9tDnOVrdVR+ztK3XGxabQtxtuEvmNiZi+00quWD5rOTlcd7/Hg5Zwpi1EQUTvdmpwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=WVonSWmm; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="WVonSWmm"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A0FEBFB09;
	Tue,  4 Aug 2026 11:41:27 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1785832890; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7LGYalmhQwZrxOtGKmdSjC1WD7j0rRgBEPhRoGP+KSU=;
	b=WVonSWmmuU1u2sJCvrqoqoiWAy+2kv1AUSk8RwEiMQa3zEZn52QUrmmL+FxHHYKfJERL33
	8uRAEdfI6RCE7cZclFr5s2JezDf4xgSL+mUhJI72zuLk55jWAxRJwmoYgzQ3cmmjWTWO3L
	dnI3MU4mFKBXHkgIAA0zS7szHBUp3fW6fIt/igye6wFlylQHiglcn9JHkBfQDp3tm9BqdP
	0rcLBUdWnA1jgDL8LiVylrjoSFOGZvLHv/rF0aMD3HvpOPCCArwe7KzIgHT1YwYYL6jOqK
	7zPIRxUIJYDztfE1g/88UAzlIqTscJsNFflLDVK3HwrjGNGwsyrjmAPNI7cuAA==
From: Vladislav Leonov <vlad@zlab.su>
To: sjg@chromium.org
Cc: albert.u.boot@aribaud.net,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@nabladev.com,
	heiko@sntech.de,
	hl@rock-chips.com,
	jeffy.chen@rock-chips.com,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	Vladislav Leonov <vlad@zlab.su>
Subject: Re: [PATCH v3 4/6] ARM: dts: rockchip: Add support for RV1106 and RV1103
Date: Tue,  4 Aug 2026 11:41:01 +0300
Message-ID: <20260804084101.11628-1-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729133609.3465563-5-sjg@chromium.org>
References: <20260729133609.3465563-5-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Tested on custom PCB with RV1106G2.
Comparing with the V2 series, GPIO now works without any issues.

Regards,
Vladislav

Tested-by: Vladislav Leonov <vlad@zlab.su>
