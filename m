Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF8951DDF5
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699274; cv=none; b=LOeKnOslSvqwxmqH0JUolrNCntRUJIaKCrbeg4ZiB+TKWR4ZE4pXOuYiiU5szFbcvFSykZJoKhm3BHzkJR3zKLBeLJzVjtgDCrv6wXchxWZAeoQJpektg2Gme7cbS+mAVfhpwI4f9EJjC4Zxk99CexCB7SOth2wzP3+mZ7nxPcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699274; c=relaxed/simple;
	bh=TlF85b9FzlAi4FP/IT9hZjHLJeMqbT7XAEDuyX4ADf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYKA4RsQ33MOI0bfpZtmahzrCrRICveAI23fcvZIe5vANDpsZhBfK+aw8IOLRY2EPJ07uybYnLT0TfKb1QK54UCjksx3x2Oa3G6Jat8E1jaIyKOUvaJr6wLS5suZAakksZyWOkAH3VfPc7V5oaWB3m7kyqk+qt26qp8rI8APU9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHxlIZjr; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHxlIZjr"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d719d99dso2106705ad.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699272; x=1791304072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TlF85b9FzlAi4FP/IT9hZjHLJeMqbT7XAEDuyX4ADf8=;
        b=CHxlIZjrItL4Qm6UYVgiiz9MY0YrnlXrov4K4LvyfEyWePqkawqnf0+OtgL5V7OpGt
         AFbp+iQFpLm01T4ujPXHx3XSWRZgufKH6KJ0+2BdR/9olYJi48R59IA87J84R+bNaEfs
         GSV3QTN/yIN23gHVJkaInq/BisSXOxhEr12iFF13eS95DhNbxVCnImlY1bFktaMAl4M0
         aPtSlSpuOxjK33uQ6px82nRkYFcn6ktXYqT4reo2+pLV680gPyUbWWPNm9ZFiwgISrFR
         H/Zf+UStHeCZMpAxsLuhcrMg0zJxE4VtZVdaDhUDlFabcm9TrrhVrhvJZt/67i9eJIbE
         aOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699272; x=1791304072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TlF85b9FzlAi4FP/IT9hZjHLJeMqbT7XAEDuyX4ADf8=;
        b=Z9HqkP9Dyn6lkiA8hULHXQvGWEso9YcQgwkIVIbPz6vNTyERlqjfnnhj3o00hW/IYH
         T+ut8qi5XEy2/A7q5FFeF0nk5dTbKmgI6L6vwLA6kS0HPBB9nLIKg+xZ0dhaZqFCo/WM
         tWpKdfvj66nmGqLW/YqR2Wvxp4b0/0vJOPJVg3J2zqEBV3A84qtuNy8CZbuQNQvzpHyt
         nHN6TuRmQgRAo9TMEPuM+VVNt95nUkKnQuEMbXc7ffMm1R/zvnScuc/JzFFOIddAm2FL
         C8jiLgJc4eDdGlh0td4NJw1jMmvt/IYaTx9dYssGP7o9R5cX21+4oBzoFe2UEUObwvTD
         xCkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCFg35LZJ4lBKBvV6Jh464DmXu9scpXLGS9rcapGyyjUWUtiYKF2qm5AQYHsFLwRx7QMkOQvph+iFO@vger.kernel.org
X-Gm-Message-State: AFq9FYL7I0yAV8ajD9OblDQYqadBoEd5CprN4D6i7UvKyMXzB+oTgfm4
	sTnkacmu+GziEw17tUTdeHa7vrRqyVprwcqV8ddgfYdF83Gov2aPr/Wmy8xOQ4SQTQfQFw==
X-Gm-Gg: AYBFou3kmeAAiDBbtI4KGvmL7jK7c2HDFpd93W00VvJDCTol09Wb+eVZGS3v5lls+qf
	LrYz4ROdxMEjAcHq1SH7fi03E+rTJ5AQeickYFbFpLWHJGwX+AD3EVedqqQoKffflLd3o1bVFWd
	82/oEWS0cr8aJVxmVhGHM2XU6cZAXgZwUeA9s0RO88fNpUkE9NNTfJ0H9hvdwTu8Jk64M5U8zfM
	l6Z4RqZwh1zjjY1EeMcd5zViie/enrcjXYZtSR6dVyhM/OKYtK9cZ+04QtKH0feYF/9UpRVlRIO
	KBAbBihhqPyAo7i/zPqmtsRU6UBHB8fISEE4BnSf+LbKFJoWW3muycIQ8umrNYVXQ2AtqJkqwCB
	0/eV0fjiReTTOd5TzKgMYAb3s8ZWl3KWuTDpAgkqiFqnhzGqUmfJesWXuN1wJ1UZUSrwWPrs9sj
	O5w7As/dDL/eYNqfFZlfFYLt8mFFUu/9TSekV2a5HYyBkixWrStpMTaul8EEwEMXywuSOx4Tv5Z
	fFjlcb8Gqw=
X-Received: by 2002:a17:902:d4c8:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2df7e669010mr133501945ad.53.1790699272230;
        Tue, 29 Sep 2026 09:27:52 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91475206sm59198875ad.82.2026.09.29.09.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:27:51 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: Re: [RFC PATCH v3 1/3] dt-bindings: mfd: rk808: add board level power hold GPIOs
Date: Wed, 30 Sep 2026 00:27:42 +0800
Message-ID: <20260929162742.1374-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260929141534.358FD1F00893@smtp.kernel.org>
References: <20260929140649.55-1-yaozhonguwl@gmail.com> <20260929140649.55-2-yaozhonguwl@gmail.com> <20260929141534.358FD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2026-09-29 14:15 UTC, sashiko-bot@kernel.org wrote:
> Does this update need to be applied to the other RK8xx family schemas
> as well?

Yes, I will change this in v4.

rk8xx_probe() reads power-hold-gpios for every variant that is the
system power controller, and all of rockchip,rk801, rk805, rk806,
rk808, rk816, rk817 and rk818.yaml allow system-power-controller. The
property should therefore be described in all seven. It is not only a
theoretical case: Firefly's own BSP uses both pmic,stby-gpio and
pmic,hold-gpio with an RK818 on the RK3128-based FirePrime.

v4 will add power-hold-gpios and power-hold-delay-ms to all seven
schemas, each with the dependency on whichever spelling of
system-power-controller that schema accepts.

Thanks,
Yaozhong
