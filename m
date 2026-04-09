Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5A8279DA6
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 20:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765912; cv=none; b=aAiNK5EIfICczK44XhYbExRpi98ym54r5FtZ3ILO9jfz8diYUiQjy2biEAb9aL9wWW4A1fmmtEfQlLsLSscapG8nC/z+y1SMSejxoF0CdacIHs6V2+fhOf1qQWWuVIYrZmj3TzC47Mg5rtovTwQIaf5Un4TWOQuNUr4eIpgkS+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765912; c=relaxed/simple;
	bh=OEEKgGc4h07d0SC0BP/9593PktvbJPvWbzlDAXtwYRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xzz7v/nEQ21LlS7varxUkWys8TOECkQXReQKEnFhcWCrd1aKkeQPfc7zvQ1R1GOE7pdIEhKdS3IP7k9QVTBp1GzCqd4vr+48x4FjGM5gkt9tn3O5PCxMu3ZTCqbpUniY5LYgrDJ2LBcpTceCLGxkFhxBguKs79VXW7ZPHOCpHYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blM/TIs3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blM/TIs3"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b0afa0210bso6029375ad.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 13:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775765911; x=1776370711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlPXVSRBag/I0TSEfHEfaPNTy5vKLac57tugfy+V0xg=;
        b=blM/TIs3OulrAbcW7Oqh/4n2q9M3ILlDwa+i+mEEFySNhcK88lsrVtICKE6tGRBCoR
         vIq3N4g6SBjRdfjPhqY4+xoGyrIPjmPn46ho7d6Y0wi541HpUzzsk7bZxHhpB130KSfr
         CxbcwXiuOZ+l8BPefCxyunTRgiuuGCuomRZCQVSqmtDzdZrZqHp8XjbOKRZ54Iagw8xE
         17MmXJyRdOfrWckIUHVgUTc0wJ5OJT5tAqrV6YJi2cUknh0Y1cZm81N+ix2MhpsMl3cu
         JFEjhjki+6qs4Kma5W1Gz8y5I6swwCTNv/kYvfOJqASMqFE0L6OilJ2J4YEYmrFdk/7a
         q/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765911; x=1776370711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YlPXVSRBag/I0TSEfHEfaPNTy5vKLac57tugfy+V0xg=;
        b=eCO80mc0DaWHUTbYdDjuR2wRfORdmroLPxijvhJAPovAFFlHCcfb/Jc3mv+d0IJiul
         2VVJ6PkAInAdJDGXzX/N1oU/m7boE/WI0PXrKXs9tt9Pn5KxbNHEoVj1iMCRuy9Ca2uD
         SSEgBY2MGN24Vjuc+KthX+XTU637BILw8hCzHEZuAMmAanwh8cRCuq7ktXUSELAwcPXw
         uiQkQl3wkirnew/wj3avFWgFur0eUHQ2FCrDpLnzVyE3a/JeuwrRC/0Y8oGJcqWa/cRn
         IBaYYKaRiVZrldC9hoCzKRTGcpei5DqlM9qRrA1crifmCcDi8Hq19RhoB+KBGYFQEibX
         8eow==
X-Forwarded-Encrypted: i=1; AJvYcCUB9WT8BMJKbefF4tP2evlxWC2iRsoKBBYp+b5f2JaH2XxswgxHOa8Pqjk72TFp2lCUOJGmENDedQmr@vger.kernel.org
X-Gm-Message-State: AOJu0YwvMqoA2fVX3tvf0Jqajp47asL1n+xi+YDrMDu+TVT4EykTHKQ2
	kb40ElEDMv0W61/Cd4HFzBpuX/6JzjDXpdCI4B8XdlnbH+VrXKbzCmb5
X-Gm-Gg: AeBDiesSz4x33zoMYdLkIGBTmTp9eD8Nzv3bjAwO2TKxCX6aS/ce/5XRyviTCCtOqMY
	1Jv5y5VKQDz2T86GLkyRoDHGpYwdPqPUG3zmkeGvxO82Gypu1p8jlJVJGjQWGQIdnEdvqeTnGk9
	1b3xGbMQs3C4Y4uy6A6ilLFDeAoumV7AzMuexQRQx4zxqsmaudAgNp8peHQxZ62aLwfrIgfbjMx
	2vSD750LstUXy5jjj8j8XPg840cIQ3MPJ6v0pvgr/ed9XxTqqqbHKICdpaLkBBQkHmDAR1mFRX/
	/NIDoIith550RF2CEUj3lgjJl8G1N4X1YMifG2tlCuCUxctwdPQwDhcPVTwuvo2p1lbzrmz8uvQ
	LFEybilvX0bBJOBM7FQ9iboynri2ROFKh6QhoHUEKLnfOS1plwMc5dapn6gpuZWCxulKpj2wwhq
	RpvCAd6/O3Pi/QkRUDwFTlVYwE9HQa2EXP8Ne8MmIFcNM/68YXYhdMczN9F40=
X-Received: by 2002:a17:903:1ae6:b0:2b2:5256:9ce7 with SMTP id d9443c01a7336-2b2d5a6121dmr2982525ad.36.1775765910614;
        Thu, 09 Apr 2026 13:18:30 -0700 (PDT)
Received: from tomriddle ([131.203.184.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f48cfdsm3895425ad.82.2026.04.09.13.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:18:30 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bod@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oliver White <oliverjwhite07@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: x1e80100-microsoft-romulus: enable OV02C10 MIPI CSI-2 camera
Date: Fri, 10 Apr 2026 08:17:15 +1200
Message-ID: <20260409201717.108169-1-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260409083609.75341-1-oliverjwhite07@gmail.com>
References: <20260409083609.75341-1-oliverjwhite07@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series wires up the front-facing OV02C10 MIPI CSI-2 camera on
Microsoft Romulus.

Patch 1 adds the PM8010 regulator outputs used by the camera module.
Patch 2 enables CAMSS, CCI1 and CSIPHY4, adds the OV02C10 sensor node,
and defines the pinctrl state used by the camera clock and reset lines.

This depends on the CAMSS DT style conversion discussed in review, as it
uses the same endpoint layout style.

Changes in v2:
- rename "webcam" to "MIPI CSI-2 camera"
- split regulator additions from camera enablement
- add a cover letter describing the series dependency

Oliver White (2):
  arm64: dts: qcom: x1e80100-microsoft-romulus: add PM8010 camera
    regulators
  arm64: dts: qcom: x1e80100-microsoft-romulus: enable OV02C10 MIPI
    CSI-2 camera

 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)


base-commit: 6fbfeca7008b379fb2cdc4f1409c139185e5a029
-- 
2.51.0
