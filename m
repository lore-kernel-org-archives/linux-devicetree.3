Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A505544894
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874846; cv=none; b=VjTGfj05QIhvoRMiRtVqCJSne8TLAaW65Tp8nukkfkW4NNs+5QsJU7x6QLArdVdn6jTm5hFVCGYj+wiQVTa6s6ZBxwfYzPecmNPVc/MjpJkeCM5ctOzGGswtzg7A7eSdFJFvt20vx/67Yegjfyh4Q7k1jTRUBk4DQ/3AKWkee5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874846; c=relaxed/simple;
	bh=gkZiwD1bUMbHLsoBAAMAF82T6b0KqXCHjaMB8sqpczs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nbmYb30/xK6LQnLWEyGiZZoPH1GAX4POAy4X9nPbh3Aj6re7/Z+Modx9HecEUQmRcwzpJFGVMGvxxeF/lYsn4VFEsQCwILfNZiQJjYV/thSYAzVwCdjEyoqRtqXRQ42Fc5991EXISA6Tmi8qa6AlXHZ1XhHch8FHJky56FW0upU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZArCEkF+; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZArCEkF+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356257so543301f8f.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788874823; x=1789479623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SJkr96/2clFb+b5z9ffMnNCNrpjtiTK03D1PubpYdyQ=;
        b=ZArCEkF+XESFYv8Hr9qQe/geQkwaG5k4vszp2yuJUUYve0/RCYtcX0CLwXO0Tq5JRc
         AjzTzQfwdlHaesfu46RrjsMbGZt+m5UHp2juT37cDf1ks+ZCIge8ZtC8vgSn3uIgjz4H
         rP9IUuZ1/DOtdqMBUG9x2WNuPbgKZsVnkaGSCB6xqk9RWDvvJU16UIv5mew0y+ehtSpP
         3lp5oFADQ3+PPeVGxhzF7wzRXfNS260aFyOgB3+F9OHBr7Ac1YPk7zLEXUK2fkRdl1sn
         J5Wv5c0I+HWbP+FZTNe/iR+vfwfIuUMAJXQcdy2ITYYc1qomdC0sch492w0KyqOlKLtU
         4KlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874823; x=1789479623;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJkr96/2clFb+b5z9ffMnNCNrpjtiTK03D1PubpYdyQ=;
        b=FUXoZCcw3Kl776duMWwZXJnftM0pBt9MNvatdjiLpWwpFSrIcHzDP/8lDoWEvsqAl0
         hl1njYsxeTA2wWPrJ12rGLmTWCiMOo0hXVAC4hM7nMIjOcbRJajzct58yr4gjcZbUoHM
         rfmndy6f0EEZUIFonHOwWYj5CWbkOkFWmQlbfh8eURUXiy/9LxEQ1Fu8jZoWy3um26+i
         XTVPdwI+l9wNZvQVOvfBKaBExBFBbGgE/BUKgqjkeRKBICtH6eEau/YtvT85zVvaGLgo
         EWx952KvskUAF5IwwzO0qHcq3aE+8XfiaM5C7NT5Jew8BRhJFmPY48DrWWqfMhrgyyDo
         +GBA==
X-Forwarded-Encrypted: i=1; AKwUvBwO264jtE8KD2dip60CPlDfY9uYUKH5csmp05KDYTlyIH0OzEVJlUswKFS5lUOKzlj23tW2hWu+f6HL@vger.kernel.org
X-Gm-Message-State: AFuF++kSN2i58x69q5K5fwKvmqxarREfgCq97zmekIeYMhbcoVZhoT/b
	CyNpG9vZcEUvf0PLkKewL2xSQgUvlC+9PSK/QE39not0XZBPaQA6Ke4J
X-Gm-Gg: AYBFou2VRSL4gc8PH7AG3ynHxG/fDUcdASbLThdwKOi4niePRff5nP3kP3ifntdnYD3
	NG29rBBMWSBz3SQMPzd9khYEKXhByIwB0/rNLqmwD2EKOAV59g6wI5ZrzqlCCa7iLpcoLy7uI+z
	XBF/gZmgCgw6FAtqY34pOHrqFowjtSB7c8EgfffBBd9LSZyA0lNWtU0CL5CmEwpbU3aWwLZbgkJ
	wMq1KAZsbpDKS6PGe9fetPDaMJoOQmhE83zPIjCis61lkSTAL8MdCnvcJVbz9EKyv8K0v3LeYhn
	kS30vK2eLAUO08u9syLoHi7ScTz5sxqF8T8cKfZ8NSeiVzNqo1BnKb+KHE2M2x6e7G4MlwwU/b5
	WARifUY2YPoP+bzED26ZTHilLwZvXO3uu8t7J82Dzq/1dnT2xIzB1GEUnwPk9ydYDNbXG7LrUKM
	rCCC0e7aB5z2H9FVgdQHQ2N/dEvjjKXrl8Ldcs6hA0lpbscdTSlkk3pFn/LbK0bXDu/XjjbaOR7
	f1DypjWnFo6BAr+H+fDTsUk/KRU7nsb
X-Received: by 2002:a05:600c:c4b8:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49d17543be5mr77030865e9.3.1788874822663;
        Tue, 08 Sep 2026 06:40:22 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm345600325e9.3.2026.09.08.06.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:40:22 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Tue,  8 Sep 2026 15:40:11 +0200
Message-ID: <178887481187.4612.2819576206036967152@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908130745.2545-1-okerixx@gmail.com>
References: <20260908130745.2545-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please drop this series.

It duplicates, as a strict subset, work that was already on the list a day
before I posted:

  [v2,3/6] dt-bindings: mfd: pm8008: Add PM8010 I2C support
  [v2,5/6] mfd: qcom-pm8008: Add support for PM8010 PMIC
  https://lore.kernel.org/all/20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com/

Nihal's 3/6 relaxes the same required: entries mine does and more, and adds
the qcom,pm8010-i2c compatible; his 5/6 already carries the no-interrupt
path my 2/2 was adding:

  static const struct mfd_cell pm8008_no_irq_cells[] = {
          MFD_CELL_NAME("pm8008-regulator"),
  };

on top of a PM8010 IRQ chip, match data and a pm8010-regulator cell. There
is nothing in my series that his does not do better. My apologies for the
noise - I should have searched the list before posting.

Nihal, if it is useful: the Lenovo Yoga Slim 7x Gen 11 (glymur, DMI 83QR)
has a PM8010 whose INT pin is genuinely not routed on the board, so it
exercises your no-IRQ path rather than being a DT omission. I have been
running an equivalent no-IRQ path there since 2026-08-25 - the LDOs
register and the OV08X40 works - and I am happy to test your series on it
and send a Tested-by once I have actually run it.

Your 6/6 also shows that describing a PM8010 as "qcom,pm8008", which is
what I do today, silently programs the wrong voltage ranges. On that board
the sensor takes dovdd from ldo4 at 1.8 V, and:

  pm8008_pldo_ranges    1504000 + 8000 * n   ->  1.8 V is selector 37
  pm8010_pldo_lv_ranges 1800000 + 200000 * n ->  1.8 V is selector 0

so the same regulator-min/max-microvolt lands on a completely different
register value depending on which compatible the node carries. ldo3 and
ldo6 have the same split. ldo2 and ldo7 happen to map identically because
the nldo and pldo ranges share a base and step and differ only in their
upper bound.

The camera works on my board today despite this, which I would treat as
luck rather than evidence that it is harmless. It does mean your series
fixes a latent bug for boards already describing a PM8010 as qcom,pm8008,
not merely adding a new compatible - worth a line in 6/6 if you respin,
since those boards need the DT change and the driver change together.
