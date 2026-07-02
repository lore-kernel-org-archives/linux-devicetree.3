Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291C9331EB9
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 17:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012226; cv=none; b=BysiOxXiZkNHDHNPy2CEJqEE5Ntn4DYXo3U94cp4AD7bNiEF3auDoKyK/eGKrLjUmUaQ0SuBpXDhUrGNZkb3K6ckcJnZMXiVh5COa+LaE+VRlGy8XM1pKJ4ZC0hhkX8AZ/c0aX6jmzQm2mpuaqr9wi2od/x8RzlPMLm4ZEJyEyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012226; c=relaxed/simple;
	bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mcw0mCfZMzWmD2G3QW+bPVgBke5oFuEqKlqxmfRtzk0EM/AvcVPa7VoKpHj6e56U3JVRmswrowxoPt7MAYYoLS4wj1e2FwCQS3Q+jvJxW9ALn+ZRdhZRPYxrTgRMTItsTJSLB23YhzMFZ2JSujPmKwYFrn5bVpXmDCrbaWferq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoABn74j; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoABn74j"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664d22d7337so1625921d50.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783012224; x=1783617024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=;
        b=aoABn74jmc6ri5jbKOTOoCpt9z0X40s/ceqaIhyaC0p9NOqRHV6wNqaz/Iji2dQD7c
         UZepj02NWtBjQSNdaPRJl5QpCjhtBkdztn5f50zSTQrFbnlcOe5lDUpO7CaSPuzCQuKO
         C3FTuWuNpp5oxuvn7kmIkhw6F/uU7E55tLsCC4RMNWk1njx2vA5+6UnhxGpwViOj2/Qz
         ctni57tMsinTf7tEWCnFxDsHdSSuIuDak/geZ8OJfQhLfQJgIaIArsFSEuBvWT2exCHe
         iMWWZCV3LDe9QKbvbtuebSeq/t8mJnJXzHk1SoTJUIWN4hWDYwiSALTcoudINlInuLv4
         R+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012224; x=1783617024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=;
        b=Q9/MUMXWeHLYuxQd8g1zSGpTGbNNQoD8h5aM+OhpJ3Y3LcxRzEgEWxI57u3+EcrZIp
         zqkkbJLuXjgEM6pyfSuRECR6J8cu52sUH+ofrW9hmvw9FBwQ1PmUHPKiLd2gbKFLmFWk
         /mBFPYIiFva1Rmv856dToMmx3FcpzEAIOE18KYCVjP7Nk/pXozX0kx/sarsHyszZLDg2
         uHiaAMDZ0kpTLaW7K+JOvuBhN5uGK5cmizBtB2JZ6cWKeir3D9nyMVh0MdRkFcGkFR0i
         Nt0zIY4BE+nm6nvXTHGiUSLIbBl2rlMdBWLc3ySBTwosdztG5OgAwyR3oiGXTdZ5Cnvw
         MiVQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0n0Nrw/+LSHhzyvbqhfqv672sXIxbOYltfNDojwUuyAo2VQo87tIZu2JQ+GonXNrVdic5s2zW7yaF@vger.kernel.org
X-Gm-Message-State: AOJu0YynJDj4oE0qOAcI2tuGEfZwUL/76DWhUHl7fTgW3IuYgG5FGuIm
	/G/iCPW0SbbVGHirZcQsVr2SC9GaW/x1R6x+RB35r0TCSWdKmFYeaAYH
X-Gm-Gg: AfdE7cnc1zERs4+7I//ttfFrlFRi/F8TzYCRQb/atlNvPGQk6ND410VL2f5eG9ZRd7m
	R8pXFARm5tOCR7OIovy4bNmalFcFa+K8nwFBPaL5rtbximP7JYHYoiu7qoyhAUxfPEUyU3nSAne
	l1L34MZBP6JvyiA/fS+X7eM8Xl1GdXim95JmqHLBSibw03ASpu0+9QCZg7FBv3iv3JyrHgdFd+f
	CYAecjjUan8mjn9wOemFf6FkHz9VVVBq+5luTPvNmyj0kUse6CBghZutfhif7wT29TVAwuuGQ00
	/D+qB7v+XSH+3a9mTALa5KwSOVoNVL+zyqfg1+0qfRrGO5Ah2NXeBXpZNXkPu/QPMmREdICEWHE
	SYEVAn51SSfem6699zWUyT5Lu3wMO3uBTCSQhMrrgvsilIdHs74t2lzL4iySqSB8DmqxaTwSHvY
	PZOuvgop86S8BbwCatl1FMXKeVc+Z92Y5WpU5eb4yFeXsV+cD1XSS+0KuMEARk
X-Received: by 2002:a05:690e:2447:b0:664:f562:1fa5 with SMTP id 956f58d0204a3-66636ba95e5mr448218d50.46.1783012223973;
        Thu, 02 Jul 2026 10:10:23 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1354880d50.11.2026.07.02.10.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:10:23 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 4/8] clk: sunxi-ng: a733: Add PLL clocks support
Date: Thu,  2 Jul 2026 13:10:20 -0400
Message-ID: <20260702171020.836546-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-4-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-4-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Register check for the PLLs against the public A733 User Manual V0.92:
13 of the 14 PLL control registers match the manual's offsets
(PLL_DDR 0x0020 through PLL_DE 0x02E0, section 4.1.6.1 onwards).

The one exception is pll-ref at 0x0000: the manual's CCU register list
starts at 0x0020 (PLL_DDR), so the PLL_REF control register is not in
the public V0.92 document. It does match the vendor kernel's CCU
(SUN60IW2_PLL_REF_CTRL_REG 0x0000), so a short provenance note near the
definition might help future readers, same as for the other
vendor-sourced entries discussed in this thread. For what it's worth,
on a Radxa Cubie A7S (26 MHz DCXO) we can confirm at runtime that
pll-ref produces the normalized 24 MHz reference with the hosc-side
clocks reading 26 MHz, so the modeling demonstrably works on hardware.

Thanks,
Enzo
