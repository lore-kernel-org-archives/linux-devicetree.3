Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334697;
	b=4UDXiapzNstmWEBi8MUxq9eDqrUDf98K8dfcbOXg5b71C7t2WSQ51BosX/Hj7wO8sgrZ
	 3FPg/EbdOmcwZFyk4v4my/+lPo3bsIUWSCIXVVU6GE/t4K6mb5eWw/4OoeUVLnOO08Ucc
	 8W1/6KWVUgaRu8vrFOc7B45rqyELFA5dK0GugN25Gphx87MdMy/CPWUAI5O1CLxfOi0BT
	 WUZ9nG+jajlHayZGqbtJcLbvhvLbWc/x2NXR8ZITpOr8ehsnzjorTNyaImyRAETlTgcdV
	 t6te3tA3ob9aHBB1rOA7smZ8fGA2iwxfetJe72qSNuMzCs1LbbXywvCpBuxkCgadyvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZmwcF5wgt9UlbFWPL8zpSNJ6XTb3NksP2KGyLQtzBDo=;
	b=qhrqHOlmdRvCqvAUNIidSwPMuV7B+jXqbV1Q0imwahKw1jh6875BXG+Ci5R3frt6Bz7S
	 jwouWo3BzbL65/pO1B50z/vT9qCpM/uMCaL/blw2BGY12gKvGSA8d19w5GnMOFi9DnbiP
	 dLsdq5lpqm0A23aI83PrRen7pg42EaJ5YplpxAsDMExKPfWsQxNdGUzbfFDPHA/ufCc+X
	 TUbdKPZBNxLBkD7OUDOeKIWVOl/GokP6/zs8OSUT59G8x4FT9S7370lFLhSMupvUfbvM2
	 sWk5xEr97AXC5S7WLcBjhwXxXAene9AhozmINsJWffLqKjTb6p9OZx2jTJnftkq9hbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xkWQC/Lo";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01600606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01600606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkWQC/Lo
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso116586a91.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793334696; x=1793939496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmwcF5wgt9UlbFWPL8zpSNJ6XTb3NksP2KGyLQtzBDo=;
        b=xkWQC/LoB26hhGfn0zGpbbOjvSjxtSvYyfsNZwxGMLIKcHiS4oC/ac+8BnkPoKJsXK
         yie/eewiy7K2gOWpvcw+6+mgJFwYlY0gJam/wCfuASg7yUN5dOCQbFmVNkMvrjBjSCqK
         e2w9aihkqgJPcf8iActWxxlpYt56dcdC5hLvm68OthfbKQ9yzhFKF8bEbhnHNkfHSOSF
         hj8MDGd/yWveymrYwLb4Ou68GcjkWKjgVPtFqKTw+An6X2XYlAXNjXscYzK0PLhcEB3i
         hk0sdQhoCksFeaVshV3t1YCbfo89/VekNeJnrkUe0p5BgbAbXKUazjiRfU0hX6qMz7by
         229Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334696; x=1793939496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmwcF5wgt9UlbFWPL8zpSNJ6XTb3NksP2KGyLQtzBDo=;
        b=HoEEkyrOvPLumUXTkxPD191oZcwCjMzDiDXcYE48vaseLoSWq5tvYz0Kxl9C23rW3N
         id1C6tiAcDPJ0ACj/LS95glxGtxJ5BPrOwIzg6MI1mNaLPC0YV+HaDSfOzyZBXYrhggC
         GAwawTnCDbgnKFkmL29eyQET8BCKT+3XES+Uh/6Jp1cDogdegMqL4OejMf6Q4/M7Afvp
         D99miC0CMWhco0P4/TE/QuNO6JHydxDIUjvFr5kznh/3ZB3mMAfwAEJQhLAjpxVrOyZV
         cZfL7ZlAIItnWA3UzxTZaa/GIR4ewqwYYQf69R6IYp1PGKcrR18F9fhgKhpVrZ0FK9wV
         vfqA==
X-Forwarded-Encrypted: i=1; AKwUvBx9pg8E7alPyTd1mHk5k734pgtAxO1L6gsHVS+TWe56jBkwAoVdT1mLB/jNI9oCWVQU/irWX2FzSAI+@vger.kernel.org
X-Gm-Message-State: AFq9FYIwQAsucgQwNM1HK6jJsu77bkgqugsQz0KyZg8BJh5EMoYHQRrW
	kCAsCCTAkbqEpJK2d7EUQTt+1HpNG1tx0Jt+0MmGHFDYyX7lddWYikY=
X-Gm-Gg: AYBFou3SiDSt5KfvozFj+8g8lT+6AdmAmGXi3kv+sUP709Q3gMmxJHkqcKaDT3Gh1OT
	XpnNn6FsoKNhkSYWp+pbOpkGqqZ/eXWuT6D1utDwfd/vhwo0r/+0Op90lsGfVwv+4UuRhD3WY9s
	oy+dSOA56plxAXUGoy5T38lWu09XQISB1vKkM9oG3RGbtpXxcRT1p27SSQUDHzBMCBwtKHx2BeO
	Airhgs37H1SLtdZySytToKtD5cbQLYhTDw//1H2Fe/B7sCeTmJ7iCxoH2YFAdUvzpGhno7neJRE
	Pv34cHOgOI86wk+4sUk+3wrWnOSyvUw6+pDsicFD+OD5nmSRHn5BK/1FqFH8sB7XWkFL+kYDsJ4
	LT2KsO67V1bIxwJzQLUy7smOIOqW+vZLd4Xegarc/QOxMtBpPR58KEMNbwCMB2mDHXTZDJtRBso
	05Y9/Nz8AYS6wo4HZiPBeBGnEl8uv7WvpQDADRKMql76U3w5jseYT6liZy07llpiG7vnZbx921Z
	/CUSpqrJGUuVAUDQMhLBHdRd2em9MaQac38PToLW7VthZqZ1UJmvxcg8D3MKJS6/eAbjKRVnJF9
	BNm6YJ8XQ7KXM3sF4BZWMsyrTvG5c6pgPgBhDm0Zt0lEzVgCnn9l5CoTe2gSViLByPNSbZNu38R
	nyzrc4fEV4KVBBA==
X-Received: by 2002:a17:90b:1a85:b0:39e:6a80:dd9d with SMTP id 98e67ed59e1d1-3ae898194acmr914461a91.36.1793334696274;
        Thu, 29 Oct 2026 21:31:36 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84596e3bsm2259922a91.9.2026.10.29.21.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:31:35 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v2 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Thu, 29 Oct 2026 21:31:31 -0700
Message-ID: <20261030043132.2746814-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
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

On 14-Oct-26 16:01, Jishnu Prakash wrote:
> The series also adds support for skipping interrupt configurations
> which is needed to support SoCs where the PMIC's interrupt pin is
> grounded, such as Glymur.

Tested the series on an ASUS Zenbook A16 (UX3607OA, Snapdragon X2
Elite), on v7.3 plus out-of-tree Glymur platform/board patches. Its
PM8010 is described without an interrupt, so this exercises the
no-IRQ path:

  - The MFD and regulator drivers probe; the three LDOs the board
    uses for its two camera sensors (OV02C10 RGB, HM1092 IR) are off
    when idle and switch on only while a sensor streams.
  - Both sensors stream through CAMSS: RGB at 1080p30 for a 60 s soak
    with no dropped frames, and the IR sensor at 560x360.
  - Both cameras still capture after s2idle resume.

I didn't test regulator mode voting specifically, or a PM8008. Happy
to re-test v3.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
