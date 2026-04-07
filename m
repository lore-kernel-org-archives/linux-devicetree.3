Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE6C3B47D8
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 12:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566324; cv=none; b=ZuJFsL69/7ZSvsFI+SAoOm7uLJjvKQg592BoFGbYo9hEZRv4P9HhYB7IqxW7yBF4c5BVspVRDNo/xy9dVRepSK5pLKv++854ysP9/MX8htY1YwD7GScgBv0d7x6LFUgkbKoDJn8JQq8zv62cWrjXVKL4Xs8F8aRzaJGGdmwNFFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566324; c=relaxed/simple;
	bh=MLG70cZPHbMVCayA98g50Pt9/HRyo+CUlZFeaApT25E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSdpWXXITTFcIGIHUOd70Azv/Vyf/siTnKlRos+Ju3ER/pWHWSnoQfphlgyZeEEQiBZqsaK5LBROTgTEnLDe9cOwBhqmr3EwFvmo6TnJ5kZeJTwjribHCCUQ1ZsvpRqIvTUVKxDQdTiUqMhfxM6g1TvXdfHYYwzKoGEnnvJU3PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=Y/mxi5YA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="Y/mxi5YA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so9296255e9.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1775566322; x=1776171122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLG70cZPHbMVCayA98g50Pt9/HRyo+CUlZFeaApT25E=;
        b=Y/mxi5YA/BCplCMMWTMw5nOiv2fJ0VCWQW1kQ6Rx4qBJJw6W6j3bnHMy00Z6hQ5xQI
         GQ80bB26YuECqLSUbvDGSWp/ULU0EMSDX8W+U/0/NVPt6a9NlMLgX89vOixBwzk7duUd
         Du33ONIeNXVNXpEmm+um0/+mK+VOjmWgmAXBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775566322; x=1776171122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MLG70cZPHbMVCayA98g50Pt9/HRyo+CUlZFeaApT25E=;
        b=pjFF6BlHumk3LYvCa01h+OkobPF8r/B+1gRfpe7girLrDeP61AUWWuAgooIrBFo6+I
         Z56khZ6EW1x8tuJr11kWRPxpSW87Zah2qvSQ5SxlfZV2iiDTZF5hHrcsPL5NSWftL3Wc
         5ljz9CxlI/lV/I5gAXBgtonyN8g9E188BYsd2n8ql+K8VHCfLgqNc63pkt7M3opSffzI
         l2Rykh/6QhlNHf1aLn3asBj5qMImKXgzlzLSaTjh+HLIu9MbHNhMAYdZ3PdsD/Hi56MF
         DpTgYW7HLDrNHr56GgqimGLP3ITKBD5/E+GIO1Lvn8j5BahBzHrvf/cGdMXONiWls9LA
         8vpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7qk8/2Of59HS91B3+u0d532Y9GqrQEk69nftwPOVmTUMK7eYtLcs4evOnsbdp4u7PiOriGOfigMpj@vger.kernel.org
X-Gm-Message-State: AOJu0YxPosZlP8wUkFIDQ6KaRuofJZHnn0b7gtGk3qk4rLAPMlsixo5z
	CDu1BdiCWyVufSK3CWtqwOWkXgLEG4k+mwsDz8IRC1Tp38gNjFEca4TjeyKUF2QWLaQ=
X-Gm-Gg: AeBDietvwHhvF5R9bCXLH+VurUJnXTQRqhtPyZLPnZfX4/LSRUYfBymIrPXCNSR+55A
	BhfC8xLA7+wpUg7gP+ToWKq8VBtPcG1Mnrq5GLFR+0shoTQLQq3ZJkEFhCK6caQ6/4bB4+tyCpZ
	XEp7f87oEb3g0Til7Vc31zoW8SMlCm55205+Z9CrI736Exx+/6g9/HJL6/CLGrxS/q1xwg68aYe
	sk5gur/RmJarvQ72WEOoiBfCSZB+3GKCRFOHh6fo+3YvVMqoSRNIGLi8qsYVBbSbZRqx61B192X
	0nOCvnCIRA9/rTCeG7SOHPBjbaRKwKP8KDM6q60qlUuod6IxcJq0czAP2e2nvbo41RdUDbZsLHp
	df8YXx7l29fZ3BlAFJ9pvkptqUMX1HPL8+jwWDbNB+gRV8aN4zEqLlYML9dOY+mCc+JTDo7qy+a
	dG5aOYzaWAsveKJ7IQN72T3ePmohv8nszLbHFepfgtnbdIDYjCsZwYCqcJ
X-Received: by 2002:a05:600c:3b18:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-4889970dccdmr220831905e9.11.1775566321939;
        Tue, 07 Apr 2026 05:52:01 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48893f39027sm365288315e9.2.2026.04.07.05.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:52:01 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: airlied@gmail.com,
	brgl@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jagan@edgeble.ai,
	javierm@redhat.com,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	megi@xff.cz,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	yangcong5@huaqin.corp-partner.google.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH 13/19] drm/panel: jadard-jd9365da-h3: set prepare_prev_first
Date: Tue,  7 Apr 2026 14:51:59 +0200
Message-ID: <20260407125159.282144-1-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401-waveshare-dsi-touch-v1-13-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-13-5e9119b5a014@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 01 Apr 2026 10:26:32 +0300 Dmitry Baryshkov wrote:
>From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>Sending DSI commands from the prepare() callback requires DSI link to be
>up at that point. For DSI hosts is guaranteed only if the panel driver
>sets the .prepare_prev_first flag. Set it to let these panels work with
>the DSI hosts which don't power on the link in their .mode_set callback.
>
>Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
