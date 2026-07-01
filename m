Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E7349251A
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922143; cv=none; b=gZLgYq5+0Ciz4YpBbc/tNHuQGLsQh3q+IgQIg7ar+ryGCUsBNeBN0xDOI5ZYxU0+UFCM5TWac7RsMrI8B+3Wkbm8KD5xOmAz1UqhStEeoe3CZUOH62BQsbua7i4RZ91v2ejOqIliVqdqmhXYPWvAqz/tAFgSvq6QLQS1NSIbjmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922143; c=relaxed/simple;
	bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b7cgLMBpg5z2o4MzVU0PHrU+q3v2McU/65IUQSvWsuX3WLa9Y6GgzBJBBJSMcRuKwq/pdau4rvmy6RK0MTuAZ9TudntvMl8qJ+UGfM1Vqtu5PEaz1QN/OL4zsoxdcFvpY791hyBAkGx3qznbtoAX4a2h8afHWFZYmqHlIIzGsf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhFFDJxG; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhFFDJxG"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81086f7abaaso11344847b3.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782922141; x=1783526941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=;
        b=NhFFDJxGrbfu8ORIh5ZCTDSO7HWovTDCcIe4MF1BM/paJptFSkkY57zxRyE4pZsPsU
         oPlENLc8miTKXOdue0J36h8cOBwS+1+ld81Ww7cSyTaI1Kivb8NrJcFRaThQw8OCt8Hd
         27cZKUi76JSyuVo6lSR1mglBrq8Nddx/YjO56Ww00GIZW7hr+OjFTdlNNXgT3UnYEtA1
         ruKLSBvnbo4P/EHWstHbn4gMIv0IUsxgMdPyLcYmz7msxlA/2U0pEXsd5Z05zMMAvUuv
         pFOwwXZ2e/hakMMvccnjwekZLclNol0oudPs1QvQCJQGTI+vZsmdKqypyHdalqK1ykNQ
         OgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922141; x=1783526941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=;
        b=Jkl/a+1VZ9IVxpWxFNreGAHELl9NqFN79e7AoJdCXBcsd8tcppoKotCGWcxlZiCoRx
         gJv0hT7X+FB4K+qBpSEDKwQV4Crw2zQEnSaFw2ElkzKJgLZFZ495xVmCYIGc2IrplzoJ
         hEgCogZi41eiJILhi9FAmi4o4VdgMY4IqeYLbz9Ed29zHFY4B71Ii0tbqV8iHKHr/NuR
         2A5skDFEE6bT5/cgfb1IAw5Fb1BJsiql5EZ6T4j1xD93U+8XwG7YB4ZX/SiDHUGXSPB6
         kAFR7EsCc3UPm+vaKvn4kTgQVzZYjZ6yBRhUUfMkRv8ERHjMX+5HXH7Y9sxx5viWoo00
         2Zkg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3t/easqtKZWzyoMxH5RRkB642QOn8Nw6vSR/liUoQSByv335tP6Z+P1AsQs40FEt2gIJ1nTdf8qRc@vger.kernel.org
X-Gm-Message-State: AOJu0YyLo9O0dKiBjDT/pkUiijWdAvFxQUK8zHiYjNxExRXigxm2ZyPU
	hbs1NFFMwU69M6/wCswivb3Jgpad6FWvDtFeadFdMccra5eCrMCSXdjP
X-Gm-Gg: AfdE7ckfoHbo9j9fIj3AmrN9JqJ+zpM7JtVnDDSuRARjHZq1tEQ8lTOin3SPJ8FYfyI
	tIyDk/+WffpGNBvT3rdKKwcdUCM0skuD/+JFgTWmGfAtSFfGtRoF+bp8gogrl5MS7h/n3xpSfGk
	gHcofQQcUcsbkkZeFFom+EpphWDi3BYGR4WrJdgm2HWvc3bq1E0LWuALOuC0Lk5DpbkCSmRsmHs
	52k9K7sGYmU7JprIAP7MHCg36tHf251ugjt5IjvgA2QLRAA+BUfzbyX46oRJB+4JLDvTzrYscZ5
	77eogQtIlGDFpDUaDyBUd6dGN7CWlMx+1MksYHKI94G5rBztuHt3cWhuzGBmUS+4YmMwBYvMcGz
	h5zJa1iymqchqy0ofv6MdZr0B7Zc1qJaHX+bo2a+ZjZN3SO33qIxnSuFqZpxzVYSy/x3DOlYJRo
	xrU6VT1kh9dnEW8MVbwhJMm4sckJjvWPnZUgmyr5KXzdNgPhWcE6oz1SUUmXaq
X-Received: by 2002:a05:690c:c506:b0:809:fd83:a88b with SMTP id 00721157ae682-812e8dfc9dcmr24185557b3.3.1782922140430;
        Wed, 01 Jul 2026 09:09:00 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144af50fa5sm1682067b3.27.2026.07.01.09.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:09:00 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Wed,  1 Jul 2026 12:07:44 -0400
Message-ID: <20260701160055.320000-a733-ccu-status-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui,

Thanks for the A733 CCU/PRCM RFC v1. I've been reading through the
series and the review feedback, including the NSI clock/reset handling,
the binding naming and ordering comments, the SDM macro cleanup, and the
question around modeled but otherwise-unused clocks such as the GIC clock.

I do not see a v2 on the list yet, so I wanted to check in: are you still
planning to take this series forward? No rush at all, and I am happy to
leave it entirely with you if so.

If you have moved on to other things, I would be glad to help carry the
series forward and address the review comments, keeping your authorship
and prior work intact. I have A733 hardware here and can help test the
changes.

Either way, please let me know what works best for you.

Thanks,
Enzo
