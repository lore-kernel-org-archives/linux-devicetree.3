Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168E423BD06
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 05:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330247; cv=none; b=U/7K7TW9DBrRmQniBimazOA+VrR76PXUDPNj7cPPCww07Mv3Q7Sbi29+H8GbCDf7PgoCkdgeRgin2pI+PVxH7Mevx+6EcOwMYskN7m5eK2PfA6aZTNWxpzPJDhTC15z6ktAqM9xfPkq+c0CfFngBBxMEZTU+tJtid4nU80sJfyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330247; c=relaxed/simple;
	bh=Q0ArqHSl+q9M0lc2WBPsmo+M9eRUhQ2FiMj2Sjo6eYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nZvU/2uz1rdN+OS1t3mPTA/UcWnbrbeaTobVgzt50zA44DVa25Nm+mMcwO7WpE5rutHl6dEM2UHrgMvr0NmXLj4QDyB5XN8LH5ugLxQf6BVpFK/50Gu5+L26IF8qIjkERlNE8CLDuXVGxYMhNfm0pl6HMtE2HVQgsMLRtt9SFJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XMBHy2Tm; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XMBHy2Tm"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35b88a4f123so2415121a91.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774330245; x=1774935045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ESEAu+z9qQDpWKYSwQTMrWov5dMVmlm0gnO2s95QVs=;
        b=XMBHy2Tm6sz6lf1gqwtJtMXqDdDyjE5H6M7ODVZUABdJZCS/ZcLOHwfJywBTxsHX6e
         4REuVsbRfnCfrjO29KaLCoktF+py1STc1tUMl3RT0HZ1bqyDGFnEFe1j3OQjTKDKCG09
         ISEb6u6HL6a+qGnsI+wrBpS7FsOfhYUarj7Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330245; x=1774935045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ESEAu+z9qQDpWKYSwQTMrWov5dMVmlm0gnO2s95QVs=;
        b=TEqzNjqDhUGlVKiejPLK+G88/JQj2CQIz1/IeREw1uCe9KNY3lzvAasnheY0F2LyQE
         8ormfnzLUTtHOAI9DZ9bve8VkjnwW4ti7QeT+7mYqI8Adqx34AzMc5tB3d4O4PhPHuED
         oK0+pVW3pJhD5Gow9ZRjQUd+4QGt+RMQBWihx7QBfxUyVaqwDl63FR+3XY3kNc8HIgDd
         fLJVUhSyzHfkM0iH2oZti/BFpBf97Gsmwl73SCoyGoVA6ILVQuxN/jaGcwU2v1sEZIj2
         ucDMLoSU6a67WprRRUmjbNxG5u8L2OdxsPlOv7u9bR5VIf8FX3TR1FImSZQitm2mKPXC
         C/Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXw2XfQ/pB0MwzWxyDzG4yJts4WNmHpacWu+INqWeSOIQ5O1zAM4v6zvM79rHBa6DEStNKJ6+4W9DcF@vger.kernel.org
X-Gm-Message-State: AOJu0YzJUcClszUYvQP4FKFM+egaBRg7s7ds7cOfwX9dMmFHJajmmoH/
	COnMoX/OttlUQCnJLQSxqwGXhWnMKHFOImWUhwHndklOeLO1qStFdgdsB+wnU29nWw==
X-Gm-Gg: ATEYQzyPCtD8CTMck0x9Qu24xq8q88mon92A+fOML8McM9c6hIU6Tkr0e1AnEuY0q/X
	Tvk7h+OYkwGuUCMO5nC4B8a8WehGqP3hqL5rMNVIgpnb7zVSCrb7ZqoiEu5rMpDkZ//4bajVTzb
	ihJLG5BAZfn30fmPxzh9NlTeWQ8oPTVizMnGVJSRylmf7mJY9JOPZeVfiWU2sX2sB2+EMCzyvXr
	+Xzc3Jh2nFh7+Q9SC1CYcn7RCUmYG9QAzpznhqmeCH3lu5Ez5UJx14DC3tgt0eAs9XtlUTmEGyT
	CgF3UxQQUFHSJqSdcEOIh61IGnzw4/jvnaUfpvxLf5g5Q9yDk740bMzdoS3VlG/I1h5HxuVIzmv
	xA4eeqc9jM2k2yYvYe4/7TVUvXN2dALdIDhfkD8Jmt674ZAA4nMqrdD3aHhtkX0Jj9PRWr3JO6P
	eXX4pG+f090bcK2St783DrG46Vg4DgccuhyFnNFYkWc1NZ81eHb4W5vwBaM+b4QgXMn9JMQEcEw
	cSw5goJ
X-Received: by 2002:a17:90b:3a4f:b0:359:85b0:4023 with SMTP id 98e67ed59e1d1-35c008e2fc5mr1410367a91.16.1774330245449;
        Mon, 23 Mar 2026 22:30:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03211351sm953507a91.15.2026.03.23.22.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:30:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH RESEND 0/2] regulator: mt6315: add regulator supplies
Date: Tue, 24 Mar 2026 13:30:27 +0800
Message-ID: <20260324053030.4077453-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Resent with correct subject on cover letter)

Hi,

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6315 PMIC.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 adds the supply names from the DT binding change in patch 1
to the regulator descriptions in the driver. This patch has a
checkpatch.pl warnings, but I wonder if it's because the context size
for checking complex macros is not large enough.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (2):
  regulator: dt-bindings: mt6315: Add regulator supplies
  regulator: mt6315: Add regulator supplies

 .../bindings/regulator/mt6315-regulator.yaml        | 13 +++++++++++++
 drivers/regulator/mt6315-regulator.c                | 11 ++++++-----
 2 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.53.0.983.g0bb29b3bc5-goog

