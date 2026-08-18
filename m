Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C838C3793DC
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787065845; cv=none; b=SO7FjCpB9D4vYx65NIzc7wlbF9S2MDLSeXsW6s2GzDuxVbIXa1YbyR39Dr6IyGmxtDtnr/fOLbTqCeXQVntcd4ciLWF5nJPZ7ZEqTeeZ1pnUB/ICceX0Xus/Srt0+84DPjzx6EbuzwK66whF7RoHflNeVvLyId/78Afpt71nYZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787065845; c=relaxed/simple;
	bh=XZ4hAV9fFse8n9VMFwqhdJ52136MQa8txkIr3VvJTkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OEjidEtTIMd1U5GrvzkGlNSEW1uaUukVF/do3iz7uOS4tAB6QRQsvJxTiI9h49pR/p3ibsSE/ct8h3X+QUUQPqMIIrLjAv21C3FbzggI0mj+JRbkQM4yf8eHAGjmjOaFHZgQhUCVVB5P+gvsmx0dm2q2S4yDMVauRKGSc83etpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/DGuEHe; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/DGuEHe"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2074710751so756141466b.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787065842; x=1787670642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=teOP2uP44OhR2SoM/Oy3bMAWk99Bs5sno8zRbiNQZ5Y=;
        b=D/DGuEHeO+ZGhi3uUHyS3stYHnY8PbRP4mDb0E4410URH5OUkNPY2cJXLOB/nkMtyh
         v4XM/9Ezio7l9MTHzX7etGgJMFY5FxwaarzcJJWykYPCO7HfmI8KRdnJjW8wqoLkbvbz
         WAHI0HJ12qSvf4Bi9iSHTunEs3ZvgNwCWedvZGLREmJQ+HUnP7V5vMRDfBgV1S3dAMeS
         Ttf3HE8/+bGSQE9zk/MYjNuCD8cSP8S8ufFQMbe7lZgwJLkbatiGncJyia6ht5JAzaVh
         tFb71yWSHh78h4sJffcVlXu5ufV4l2To0uRyh8CdZwdbPSihNoUXnvwSlcYGk21fEwSn
         hUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787065842; x=1787670642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teOP2uP44OhR2SoM/Oy3bMAWk99Bs5sno8zRbiNQZ5Y=;
        b=mMHguj2g0yfZzJy0yntFzIXYeShlzOh5bAKMCRn/ESNmCZ6qrOTuIRNLIXUojqHE8q
         jP5KTZGggCxeoQGpqJKS/xDg7JfHuBXdPhDNleRGIqHPv046LncU2+j8KP0CZ0Zkc9Wn
         9ZNv3tMyMi+zj6+KJfnvqLVfW8jgLQC6ZhZpcz9ZTjC3a+pVIcJpw2JpNYzVRKh/547y
         ylaYMPP6gyGtkR0xnHThPRWRv+cke8IS9HLB0SIGEhAS6pHtYnBP8kC4pR/TDZmwXF4I
         vZP0AjK6a3xhlawSrZSMCuo298NTlF5RmS2bSUY4F+9sWSC1QkXpg/gy4EzR2ZFBPzCY
         8Hrg==
X-Forwarded-Encrypted: i=1; AHgh+RrhGwUjmmriK1MnbjTT10nln58iYURlpsX4mpSv4ECVibkHcCfp0baJEEVOZiG5awbmRJ2YUmfhx0El@vger.kernel.org
X-Gm-Message-State: AOJu0YxChdr6ZokvgtJi7k8HJdJYwsOF3g5cCOx/E4V0/GMKxQ9I0Iou
	tFo7UpwVYBMiTuqx13KuIJQMVhlKzOm1wpZ4O4eWh5UVU1AeH+22v1TN
X-Gm-Gg: AR+sD13pkpmVyTCppdrL9QcY7c5Jjd0k3HqFn6qz5SducsEee+rEafgNoyCfG+zdFpH
	Z8arhtQalMS6tQwKZhtdfrUxTuS5QCPP9f0La3VF7Vz8u+8Rx6Q9GYF9Ixt320fjWIdCMwmwIKh
	07je/8PxbF4sIc4fMc7QUppc9UJGpUM2IwrNxjZ7WDMBmGGgP4A1uMi1xlSi1Uz4VqcwToOSJ2M
	eBdytX8CCpjTUQaPG6LkKWQYdUfo1Hv85UI6+8p0dIc+L4d1IZuTEd9oJ+BgcShVRampeoyLNTH
	4yqOI6kVY7Iv94XS83mm5bXEvv4b2w0j68dNRNNLPUr1IlaVkVhRzDdsJNZ+OhLmX0kR1F6tHjJ
	aOfDIbh2xpObbOKHVmgy2CHvw3cvAR/oLLn6zMv9GncGm3ValD9VNVLfzbAwqH8vYVRZ8vgiCES
	Od/PwlTV+RSTlwbX13sm8/UgKDzdT8VsbQ7QRhvGyvB6rEoOR8R3JepEKYfsvObudpHbS0y8raS
	os4XklJK5x7Sef2EbRmFQ==
X-Received: by 2002:a17:907:928c:b0:bf0:b39:dcc8 with SMTP id a640c23a62f3a-c212a1da2bamr1864248066b.26.1787065841859;
        Tue, 18 Aug 2026 08:10:41 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe69cf4sm205772266b.3.2026.08.18.08.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:10:41 -0700 (PDT)
From: "user.email" <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [RFC PATCH v2 0/3] Add Xiaomi 12 Lite 5G (taoyao) battery support
Date: Tue, 18 Aug 2026 17:10:36 +0200
Message-ID: <20260818151039.409767-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stanislav Zaikin <zstaseg@gmail.com>

Xiaomi 12 Lite 5G (taoyao) has an additional property with ID 12 that
breaks the parsing in qcom_battmgr. Fix that by introducing separate
maps for lookups properties in both directions.

The other approach that I tried is manual shifting properties:

+	if (battmgr->variant == QCOM_BATTMGR_TAOYAO && prop > BATT_CHG_CTRL_LIM_MAX)
+		prop++;
...
+		if (battmgr->variant == QCOM_BATTMGR_TAOYAO && property > BATT_CHG_CTRL_LIM_MAX + 1)
+			property--;

But I found that more obscure.

Will be happy to switch if the maintainers prefer this one.

Changes in v2:
- Keep the qcom,sm7325-pmic-glink SoC fallback in the compatible chain
  of the taoyao pmic-glink node (review feedback, patch #1 and #3)

Stanislav Zaikin (3):
  dt-bindings: soc: qcom: add xiaomi,taoyao-pmic-glink compatible
  power: supply: qcom_battmgr: add Xiaomi taoyao support
  arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific
    pmic-glink compatible

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  5 ++
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    |  3 +-
 drivers/power/supply/qcom_battmgr.c           | 86 ++++++++++++++++++-
 3 files changed, 89 insertions(+), 5 deletions(-)

-- 
2.53.0
