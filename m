Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFC443B6CD
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786538950; cv=none; b=Q8iv9WIBfvR4Xxfj3oZGCPf+F8W33c6UPVg83/dPAI9JJEt9RltB0homTORB6DBCJIK8DvHDr/Z9jjRj9vaIZrFi5ctkQNy8ePwJPK/m3/eFgmr7+JNuEzYApl+nYh9W0BO2jUMSc4ObEvcsQz0k4bKIklYz9js+hdFATFXIvvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786538950; c=relaxed/simple;
	bh=R7P9GJg/MAi+yHuvn1qTceQ9Hb4OgtvyY2bPwHpj89w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Brz/g56+TQiGhvvg48Lmxch/qq0Z4tbBFwlKFZQjoB4mh09N2V6yxofDKJgMMrUVwqHuByt6hiNU0mNW2rGCweg5+D4ax+o0cYy1jAfmBDRfHgxsLy5MQFYNemGPC6k5K67WcyTJdsaRnk3pZJC0Up3xf9TqBGyeufdEdzDK69I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIR1uC6r; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIR1uC6r"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4994d41ceb9so593955e9.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 05:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786538946; x=1787143746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1u30g0AMKY150GAPKUik0QfLk+MxUjv8vUartSunHuE=;
        b=fIR1uC6rmeM+mHENNXc/fnvnknL8mcOIZzIFmN6iCDXKBXERPj8qmmfSshs++i18SV
         io7Fk85wb3zQNQoN1/QXGnqwR4m3QkL6dOh6z9dsdSxFDM1A79pczZcyGIr7WI1kNPYJ
         tJ5T1n080IRo1d6enj7QljjpGmcZLX45O2NcpL+1md4zTfnI2MgpdkwHCTrKoKPYK8qq
         Sr6Xx7p08wzTSMHpo4/9Lj0lgKLQdSqgx5cwsVugjqpvNld945Ov3h44KHVkebTk4P59
         J3TQCMGe7Uz9yWk1UI9ChnLZEwkMyuDEFrFnnN2GuGpM6aVkeN6Ru9P+/AZIdzyzw5cS
         fbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786538946; x=1787143746;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u30g0AMKY150GAPKUik0QfLk+MxUjv8vUartSunHuE=;
        b=PTFcK9J+R+OcO+cDx/CWnyHVNvjAXZH8UGDgobrG5fsbWHrzRzCgWfydQ+lcJ/UYQv
         692x595+YDsYvHwutp9KcE/hxSMJiFAxBWaNfB+03FoCE1TwvLAN8aCjKwIY3k+EsNH5
         76mhwqP1q1zQV28KfUo4uNJvdrBDfXubjSEHESUkU9bovBlXKpiZphzFQKmORD/1k3Si
         cqyEnPkOa36yz7eq+wKCijdxwR+aotsoya5ZIOzwsg7sHD7XBDVpU8KpkxNSSI96eHp5
         s7cFPnRTBfSxL7tQAOaxxBt1RJ04myj8HXJ2ItRdjhgCAzdyV/yzc783pTbo58QUkaE3
         qkeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8cvMA0V/nZvuwcCDslownah4CVQvrdL+6KUPwjFXKO+k0CDuXO08X8M4FqhUOPjyD1M9unl0O9QfM@vger.kernel.org
X-Gm-Message-State: AOJu0YwlGtmZh2CfcEI4NS90NyL0TWQIu4zqgGxLJKaB1oazP3cK5oLH
	Tj9BkYaMDsN8NbhjyqDGYRvgJfkd3QtLYo3bQdwzaYYxBuoIOP8ESFQ5
X-Gm-Gg: AR+sD109J+zZNUYT8hzKtMizq74tvgmYeAFLVwmJk0bLFJSiBO9gkrpGxbHAll4iWd0
	JwxHP89LGVwF/CTBwepIM/NfCGP+m44SmDCs3OOHOeZuJzQQlbldd9Pz3kUUANxp2GwkhirlJ05
	PmXWEz5vvBdjYBa+In/Sdhi7rGlTiSP2PlfRbTUUmEvyUzXCkR9rwoBuMGw1up46khaVvI+nL2u
	AeOqUTd6swwuQtFaazQxxFZo9AJEklvi50sHp4bJiPrstvUE+W63VrUJrcSNoZxsJWQ/MOY1rvX
	7PlAuXMSHwRSE5iqPJ+NolYMDjEmtvdTrkxaUayHKuQfUnoUzUa10jdJw+dL1yvHxV9WMj2dJhL
	xmyMPqQ4Ku7kkRJQ1xl9uz4f/z62/R/QtGi3c74645R0KmZ6A/tILhu9zIqcN63b+wk0pv+aVwK
	jN0sbBKhv24F1rbw+jsoohz5VOdI13UUQ5pcDbESN5iRrstN3tZXdLN4Ryzqh7/PMj2KsntX8Ko
	+6TbFx9Z/KNDD+sRtv0odGUn23ybVfYMIwhtx9bwuz3aOfNjdpPOx9kpMnamtzZT7oN
X-Received: by 2002:a05:600c:3b17:b0:495:71ff:598d with SMTP id 5b1f17b1804b1-4997c0ca479mr29063825e9.1.1786538946151;
        Wed, 12 Aug 2026 05:49:06 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B84A6001A34C2DD5D9E0419.dsl.pool.telekom.hu. [2001:4c4e:1b84:a600:1a34:c2dd:5d9e:419])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d4e260sm7247226f8f.17.2026.08.12.05.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:49:05 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>,
	tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: Igor Paunovic <royalnet026@gmail.com>,
	alchark@flipper.net,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/10] accel/rocket: add RK3576 NPU (RKNN) support
Date: Wed, 12 Aug 2026 14:48:47 +0200
Message-ID: <20260812124850.6597-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812094106.1391698-9-gahing@gahingwoo.com>
References: <20260812094106.1391698-1-gahing@gahingwoo.com> <20260812094106.1391698-9-gahing@gahingwoo.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two things here, one of which I think has to be fixed before this
lands.

The first is a comment that outlived its subject. This patch adds the
following just above the PC_TASK_CON block:

  /*
   * RK3576 arms the same DPU completion as RK3588, but the interrupt
   * never reaches the GIC. The completion itself is visible in
   * INTERRUPT_RAW_STATUS, so sample that instead. The tick cap bounds
   * jobs that never raise it at all, which is the same open problem as
   * the wrong inference results.
   */

That is the v6 comment for the poll. It states the premise your cover
letter withdraws, it describes machinery this version deletes, and it
has no code under it - the next line opens the second comment block.
Left in, the driver would carry a claim that contradicts both the
commit introducing it and the register description two paragraphs
below it.

The second is placement rather than correctness. This patch also
factors the completion tail out of rocket_job_handle_irq() into
rocket_job_next_locked(). I read that as behaviour-neutral on RK3588 -
the return that used to leave handle_irq() now leaves the helper, and
scoped_guard drops the lock either way - and the numbers I posted on
1/10 bear it out. But it restructures the shared completion path in a
patch whose subject is adding RK3576, which puts a bisect in the wrong
place if it ever turns out not to be neutral. It would sit more
naturally in 1/10, which already touches that function, or in a patch
of its own.

Both of the things I raised on v6 are right in this version. The power
domain list is attached before anything that would have to be unwound,
and the comment saying why a plain return is correct there is a good
addition. clks[] grows in the same patch that adds the two names.

I also went looking for an ARRAY_SIZE(core->clks) or
ARRAY_SIZE(core->resets) left behind, since that would walk six entries
on a four-clock RK3588. All six are converted in 7/10, including the
two in rocket_drv.c's runtime PM callbacks, which are the easiest pair
to miss.

Igor
