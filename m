Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B67D42586C
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 19:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786649862; cv=none; b=LENQX+9qj63C9ENVglZp0Fyt/BTdxSo+3mCy23tuirQgmw0kBIzJcJa3ExzvPMZgwpLFn1SpK7nf7rxkvlb9/G31T+4LMayU6wOSzXIxBUj9BxijIBUPzXukfEgAA6qN+ETeQ7DSyEAoqwD5PKkpzIqhFO67J792crbfuRnsLIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786649862; c=relaxed/simple;
	bh=omqIZSFkWVF2X6+aL5ujgWk54LbjoA8G5ZfVjBIfeRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVlFCRkfcViJ7S7+Ks5EDGbVb5cFKp+kppnwcxbjaVocrLZFO8nc7BZiCC3xpFnU8n8vW/VzPObFA6A5UmVfjQ9xSZlUQsQSP4FXZzxJcpG18agn0wPmnKYD9MUv14LRXmD3VW/i5slwma0FZLzvlG29Mm6cL1hhiYUfDf+58T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUEA0J7R; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUEA0J7R"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f84023916so175081f8f.3
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786649858; x=1787254658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51c7EGTXWgCerge/+6g5NVFzyP7AuWBklS9kpsuyY74=;
        b=DUEA0J7R+M3p3ILmd+EA3X8AgleXEH34goT9fM4Ez3vDUL7XY4+K8pqFsnf0i93CUa
         9iS3qbIdQJYmripGxsDaqdfkVZTv3ShOXKZtz7Q2xu9yLpewSvV1IBWPAex4fbx2UqzQ
         Gc+8nfCoiYOY9ZlRDKk27I5qsZSYj06DZR86npxjOxp40FIs29OYuayBoc2uCbSrrn2b
         GsdgKCrTMvQBD6LGY7a63gmaz7HrSUty8C2AfPPMoAYJjWYzrTR0yNCtKw6P+D9SqViL
         WEriX96fddoUXGhtjer378rLu4ntKk9enDGu4DlO8QmoxVZBlIg3doTCiHmi8Bq56yYc
         petQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786649858; x=1787254658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=51c7EGTXWgCerge/+6g5NVFzyP7AuWBklS9kpsuyY74=;
        b=eBa32PxQlJ+UfGbcIDNuN/4hCdlJ47LpqBKfSeOkobypWnK4y451tnxF0fE6FLz4HK
         zBgOAfYC6lxFDA2/7/aR6Tet4unZH5SwN6OylydxzV1gzQAs2TYaiBFFEKBAQnVT0FNh
         BmjFe5fdLr0o0CG6GIH0Wjgs2UxbIPpVAQJX7kkKsum6ACCv/zmy1h29jwdM9miJu1jQ
         CqwJJT0oeuINPWyrro4P/GVwqUTVsq/nUZkZJv6KVdo2rxFxRjZP2drYQD8beW0zEjNN
         nAd9JE1ckOnoWNU+tdqTw6zLLlzZOqvLFRBIg42NLWmXzo2Wb7F7mYloGGnydJvD11JW
         GBaw==
X-Forwarded-Encrypted: i=1; AHgh+RrzAGtW8wyIUBPOoDL2CdZk+nqrHn2zhSWSwklXPfl9Q3M4puGdBrEFSGfMBuPg1Yd0lNQE+zpuxkUk@vger.kernel.org
X-Gm-Message-State: AOJu0YxgR/j39mjGKgCr19P57iDPmUCJi9eRHgZAO8GW10obmx6jtPFG
	/SenkQB4DsmwDTGhpW1WW74G2sL7Z/UFRTa61rpdijj/vON0lxVxYe3R
X-Gm-Gg: AR+sD13Vr5Y/SWD/+6d4ja4/iymHXNeLKAlHpjnTGYwrt4iYc/gVWhGDP1Dzq67h2d4
	Ha+sgmpoSLokCiMvXsebC7kt5QbK37ebCOMldN+MOhudngXBIcCcmQL7sQbmvyFxKHhEr7ZpHcF
	bpOPyBtZwF0DX/yievYH/BQaB6mieAGVx6XOhW9ABw18RT4coKS39tFIi3RUdZslcdzzFRpmub9
	49nggkR7FLzaah84ZdsBm7dJVy82r3rby04cZ7PGu9Avx8nU+VHfPHlwNTRAsayyY35SbQzblz9
	ktdWXyMrXnQUcsuBmcy46t4JIGUSgRFSdKWdir9FrciY/YmYs/2oVXXSUr3SmeaxwvWKEMMkKut
	zoOdlUYvt6gmdoBKMPu5xeLeebbkL3PM+DfCRjv1Ez5mXrahkSQXIJnPlEk+15xy0AaxjQdQiaB
	7d4IpyiyqUNlg1u0GJH5Z3tc/6TCBAqa4rNX1fGoOIWtYCUhZCyb9hT2Bhqmn900HQSg==
X-Received: by 2002:a05:6000:4a05:b0:45e:f8d0:d22c with SMTP id ffacd0b85a97d-48160761e84mr778789f8f.25.1786649858491;
        Thu, 13 Aug 2026 12:37:38 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b1a91sm1727273f8f.21.2026.08.13.12.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:37:37 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v4 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 21:37:37 +0200
Message-ID: <20260813193737.2346630-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAOMZO5BwLCRd_cTV82J0KgPfSF6_kUKiSUbG-SKxNxiNu0VKOg@mail.gmail.com>
References: <CAOMZO5BwLCRd_cTV82J0KgPfSF6_kUKiSUbG-SKxNxiNu0VKOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A correction on the gpiolib warning I mentioned: it is not a gpio-vf610
matter after all, so no driver patch from me.

Half of it is already fixed: d761c7e38a00 ("gpiolib: Check
gc->get_direction() before calling gpiod_get_direction()") in the GPIO
tree covers the debugfs dump path. The remaining backtrace comes
through the i2c generic GPIO bus recovery, which calls
gpiod_get_direction() on any controller without .get_direction(), and
for that I have sent a gpiolib patch:

  https://lore.kernel.org/all/20260813193715.2346477-1-mehmet.fide@gmail.com/

With both in place, 7.2-rc7 plus this series boots the Colibri VF50 on
the Iris with a clean log.

Thanks,
Mehmet
