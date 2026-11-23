Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795406944;
	b=3F8UzLbdehwKq8nqlW9/mENSS4oJMIqbwlqp74SXfNL/ZYET9O1Mm16+c/47DF+rCV0C
	 pp1T4UyC76pbal8DxulrmFchBsDeynQ3DVfiUiZn+Pd6n9nC2E6VypDfLXSUPXEoFpVBh
	 jth6EbsmTWFgb1Ajo9RIuHYriz2kh6j17owyuNWZ3nAe/muSt1lY/XRfdLPY2fBpx8GwM
	 E8mewotHbSBLNs85GxWdwDqFibANsCfjKPssdpDX12aP8rw6jnhcOf5ZHlDik2xprHzP9
	 kQuaBpahqfCsPMDjV6VMxczVBOaNLv92n3D/vh66OBZMos9tC3ACEkKyj9oj2ai+mGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406944;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TrG6k/EgDP09caUBgkCJeX8NDExo++XUhHt7v/HGC1o=;
	b=Zh11dGzoTEcT9nFN8XzzXDGh3BJ/V20N75FIkaVdMR6VorB/60LtzP4EShlAtvC9Ut3e
	 w7V13+8W8OpsmWCq9yZ9KtLjiIifFPr0+WvHXh0oPL/CJIcelVaKas6zbx2eEbwLaIVkJ
	 uUTnGst2tOgckAn9+mgWmcA1xWzp3jy1T7VGKYl580S3NwC9E2GWPXLbWzj2lFYaHNTub
	 +E0+AwYgzy7IFbKouph0L3F4Avr/uJgnY0oViVJcTtnUz92POLTjwnQcL69vn69zFsaW3
	 4wo9juiMcX3S/FdFsw9nM88EHyVZKBriV+8kocfiJROvU30q6efO4vSQuOr9pG8B/8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FEA606A320
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 04:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9FEA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-92123971d1bso24742066d6.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406943; x=1796011743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrG6k/EgDP09caUBgkCJeX8NDExo++XUhHt7v/HGC1o=;
        b=i5xIaKT9Cf9Kx0bttp7+NDYMBhp+B6/u2BHCT3vLuj5EwDWGvvDHpGhCSEg3qvWuqx
         djD2PwuiskE+iS/BtkMS2jMr7z4GKnlslKfpNJyeYWlH40DzFJ8zPyHPHrR1xmoVtsKD
         ScwSnMww3fcY18tFsBB167X75R9Q/Sai7O06nq1OsuMK/fdXp9y0bCIJKIQ4Re/voheI
         EapWnQCOCBCP7yqWkU6of6lTdBp/o7sZl29+bMTbmknKrsEQ4ADwYcnjC0TH/kaQvO+1
         xfxiyA6u9KS/ZC0aYK57KgJ16f00m0hthKYMeHoTrrCHw19rvxNAYpk3jR3+KvyZvthk
         Uw3g==
X-Forwarded-Encrypted: i=1; AL+hErGKs3GrAiidL1qsyuYaOgFFO4GyFw67wh4LRJuUzw5QVProruvTqecOZLQLDqJd6gRgiCoGUFQ/URNA@vger.kernel.org
X-Gm-Message-State: APuU4Z8EZhUzWE0Y9lzpIum5iYu+tWZ8eCb/Z1z5Tq7Opi1vSqtp/DSF
	thCRms3ta5uZoP2gb0YmCBWdEx3q4CfXnIm5T8QJ0PL2SWo4f1aN8UCMtBNQ/w56Gik=
X-Gm-Gg: AZFdTZdqOAfST7eujLykaKHT/h7c/u6Nk58dGAu/fUkjDy2Hb/CG0UPTZDsRPdn1vDB
	/qR5TtjMO2ZE3EnxLFRkMELZYNWmXC0AD5Pa281baa2pKZzxQ57pbnufr/YR8XPM4Zv4bT85eVl
	UzidIYnE2Br7MfpN5SCtO2oS1FmAmYXQ2+2Ig+c65PnucliewhchEpDD/fbQJfJpSfULxPa00h8
	jn6YN3cqzBgoygYBTFPBpVVJ6nyjCAm7BPsObt07tnFnMhMK+TlRI3Bj5Z+2mIq4hhvUzuodMWV
	zvEG4rgpns1IrdjGFEwQewIvUJaStEBbQezCM61DD0JCNY8mv5SDnYTIOi2UITG7X1DyS7tg+eD
	yxH+vxrYIBWCGUNWZt8I5NWqC6w7WsZU1qeLyjeCV/1/O3vCA/Xl1cRNBjPGWDedslvJDzT3Lxj
	2mOJ7AqgjMRU2QhvVEjrVHlg3zldPEz/E2fNeV//QIScMtHo6vGqPSkrXNfW5J+Jnfq0NSP6l5I
	X1Zl3MrspsxMip66SsNCy3NaygMn7TNCbNc/GcDJbE4FQFa079WXdFYt8ySW3m+I7bGX+FzqF0C
	HbQ5D0GTtW6goWRF8zEcxLSm95rywBFf64qojuRoxrb73dzn48jOkVo0fAbT2fTu3pGH+vsOL3V
	CN4wBajs+o6rB3mcb42ztbV4KI6x2H+zs
X-Received: by 2002:ad4:5949:0:b0:91b:5d3b:4aca with SMTP id 6a1803df08f44-92134b4107cmr206786976d6.51.1795406942687;
        Sun, 22 Nov 2026 20:09:02 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b253csm96203216d6.15.2026.11.22.20.09.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 20:09:02 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: sashiko-bot@kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] clk: siflower: Add SF19A2890 clock manager driver
Date: Sun, 22 Nov 2026 23:08:52 -0500
Message-ID: <20261123040852.50062-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <sashiko-outbox-228538@kernel.org>
References: <sashiko-outbox-228538@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Is MACH_SIFLOWER_MIPS defined in the tree?

It comes with the MIPS series, as the cover letter says.

> Can updating data->hws[] after the devm_clk_hw_register() loop leave
> downstream clocks orphaned?

Yes. v5 will register the probe-time clocks into their own table and
add it as a second provider on the node, the way clk-eyeq does. Lookups
take the first provider that returns a clock, newest first, and adding
the provider reparents the orphans. Nothing sets assigned-clocks on this
node, so the early provider will stay as it is.

Joseph
