Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAAF3C0613
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 21:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841740; cv=none; b=sj/W8qVKoaBXN/2PmBZvZYn26VgWaCFn+AUX9AaFoNK69fspJcwmlciwa++aWcAzkE4hQKaYOp7qIxMaXpURCI4l2JkaDaALhLZNQrm7Sc/2kKBKcTAvvpieGP8UNTTjGToFcCRIX3FV2kPG2WSeAw19T5T3341x+AL69qVcs3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841740; c=relaxed/simple;
	bh=+LM//r49lcXL5ulzjzgjIm9/ZR3GBPhGYI9a3F9PvLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9vnzP2+DpXm5VQOnT2ZeTXMkdjyNMdvmpK+lg5pD4pgOa4OhE0xOgSKrKkVZlZc1E2BmUHKUmgwhYbnc2E1WyIn+9VnRBG+1Jl8tFE/OEZq2boy+GcEOb/W4uNYyjV54Z6WxG0vMZl9HsGARus0fFgqTwnyq+WiZvKgNbP3sJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPHTD69Q; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPHTD69Q"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e836252e1dso18139225ad.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841734; x=1792446534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzqsIiDe8Lj5/hNhbQ747+w6QQ1iGRWw+s7eZPb+FgI=;
        b=WPHTD69Q4BSSs8GKF56nQ28NGwtzMmd/jsMN/EEo2BkL+mXjWRO5XpDSu0u/bK7+xN
         N8CQ17XNUvtuM2ak7SG6AW0rJ7i2VqNmVNZ9GxDXB1JQERzjImWU0mkElVYTiPCFL7nJ
         jtzRTtwnN5OqzML+aeq7lRq4QuyKv8qcisJuyVFT9gM58js1ZO2UgfBDsm9rIYUZWemR
         IZgGJMDiKdEyWdCaRqeih5GCeNVtzzxPbKpKB32vm+90KjPm/VLx/kF22DFdsyjP2Bcy
         bTdQTRkE5Q0iG8VNsv7Zf8c0RI8DFmbipdQikEdPR4Imj82b9rT4Ao+jeXybS1l/POXl
         DQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841734; x=1792446534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OzqsIiDe8Lj5/hNhbQ747+w6QQ1iGRWw+s7eZPb+FgI=;
        b=Ocj0aD1YCurPfEV3aT3sC1JTw3gS5kQmBnCe5Z3HfLiv+042wL2paSEUus9ZFKRftI
         uFk5MQ/UYKuylURbw7MdapQy/2sh10EJ+4JNCdwlKAuenLEFr289qHq9GJu4nSWleuck
         /ahgcupzVi/1LuGCgjG7YDjH7P7XAbvppsLvrW7NM6wQ0OFq1cJzhHXj5+vHqkD/3mzc
         M5jsoNm1j9qtBeUvmquUCP4Iur8zPvYO7OuTxYLjsva1AfmguyabBq+oVBey+nCbwDfT
         rRJqb3e7lkuf0sHuVJPUwAYorCe+7DZWXDcbuUjQEOetDKpSCx9JexZz+6dAC24u/ozY
         1W+g==
X-Forwarded-Encrypted: i=1; AKwUvBwUTVNtjTZktwFtH5yrUtq0bVr4PFCT5km/4x5vosFx3mawAysZWBzwjPjH04pCy2l12loLxe8qgrmJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJsWLg8zXe1z7fCBxFW++Sa84c0yDrVZEMRALzdCnwNNC/qtyb3
	Wvxa1wmwJuvijgXhoeqqkW3I1Us7fnXH1X8uS7Rn2YBrpuAp1zMmgSkR
X-Gm-Gg: AYBFou0hZFs6TSPHWQC7YZAc3QjLb4+nos4JcS+yDpcjxgs7Bs8l3MGZz/I6fBN2QjZ
	KlBxzY46btBeSEfcNMLhBNQPQls0R5pSVQJi5/UOZsaWQ87SRmE4hjqGNionNPzqmvyMl9ZX95F
	/4puvbobQev+6nLrTpkt+TWdD+b3AQBeo9LIs+aOcwgupjlnSZ0JJEO7HpD45P6Z5JmHQHUOuCl
	vG05rgHb9sL7tcMQ39aPes7Kn3CBIbEftcH9RSpmZQPvRsMyAfsOCoCMcr3nsrBmcZWqpuQXCJy
	p4NBk/hCwwQ1YsV3vewqfsmdUDZOarhct3VG0fZjTLeMvpUSEytRegV9hZPglKlu3ChI8ZKqUll
	OisteoQWlkXNhOQqWRf8OzwrwK4wwcClUYKBsYfwy4JD6Hzwp1No80+W/yL6DD7bmvYyC86wQXg
	+i9jlL+jjfUg0pwlYzKlIcIONA5avYLRy1UWjZgjypEgYL0tGA3dcYgGOZFxgsptF1pMNyKVjIY
	QQbZ27+4cji4wf50pn4wPqFpFYlBRi3EbuAIBDf6fD4UG9yHvtrVjCnei1aZw==
X-Received: by 2002:a17:902:ffd0:b0:2d9:4358:73ab with SMTP id d9443c01a7336-2e842aa662amr86633865ad.19.1791841734180;
        Mon, 12 Oct 2026 14:48:54 -0700 (PDT)
Received: from ryu.remote.fontis.id.au ([2403:5814:a404:0:cbc1:7a8e:f385:c576])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e1c89sm45467445ad.75.2026.10.12.14.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:48:53 -0700 (PDT)
From: Lloyd Hazlett <lloyd.hazlett@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Lloyd Hazlett <lloyd.hazlett@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/12] arm64: dts: qcom: x1e80100: Add CAMSS block definition
Date: Tue, 13 Oct 2026 08:48:33 +1100
Message-ID: <20261012214834.357754-1-lloyd.hazlett@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-4-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on an ASUS Zenbook A14 (UX3407RA, X1E80100), which this series does
not enable. Applied onto next-20261001 together with local nodes for this
machine's OV02C10 on CCI1's second I2C bus and CSIPHY4, written to the
pattern of patches 07 and 08.

The media graph links end to end, with every hop enabled:

  ov02c10 11-0036 -> msm_csiphy4 -> msm_csid0 -> msm_vfe0_rdi0 -> msm_vfe0_video0

carrying SGRBG10_1X10/1928x1092. libcamera captures continuously at 28-32
fps through the software ISP, and the frames are correctly exposed images
rather than blank ones: a captured 1920x1092 ABGR8888 frame samples to a
mean colour value of 118.8 with 99.8% non-zero and 203 of 256 levels
represented. No CAMSS or CSI-2 errors appear in the log.

Tested-by: Lloyd Hazlett <lloyd.hazlett@gmail.com>
