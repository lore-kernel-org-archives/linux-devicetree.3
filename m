Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3559D4570D4
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071524; cv=none; b=q77izHL7DG85giX/QLNbsVpTiUzDnU1XVKAC7rH6ipJ8i8qdBZEjUMGf0N+3M4FmzYAa2oujsfvWduO73iiGF78PE/5+KHhKF/TC41l/8yXK9j82uwETMpCiuu67w+TFEP0BloIww0deseanbzy2/VsPazI1XIJp3MY+e+7y1kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071524; c=relaxed/simple;
	bh=ZE7nqI7ReohaMIqdHQOYLxEmwtEvbS+hkW9GmiQfECg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQVhFp7kiZOOzj8eHHhu0dTz7/tnEbbF7o1qQ4I9fXkLPIFVmDZmJhFYfr2UjNy1n637T8KP0ROr3fz6qhObGWe2EzYpl/9NEJxxPslHmC4ZOQTU0CfezJURVv7Qv7FPiaKSj9YvzLkdK7ItTxePCil3VvEQmBbdarEdMugHodY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iivziHVg; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iivziHVg"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39da614ab21so301682a91.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071522; x=1790676322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2+Rzsvc6cT42wPihpbCzyttfrFEcFhBrHOmp0V8ZiA=;
        b=iivziHVgD5IWTAO2MO+0qIwBtuJXWx7A6lzDVKNDFAZ33ork4p1ah4qYWwWuAeMUcr
         rVejHDOak9Wg34rDqPXBVjzIlq1pxwnzJh3mU0/d83E99R+Wyc8IQ72nSqWkwlIhESIT
         DlZDr8Fe5Fb4c80jS6HJ7VUj7/b3yKs+xmfWYvo3VzLE+NehbPGjeVY6Suw7HFv38JCE
         F8/CNjK/rRpwKo7SpAXo95QUuKll3tFCSdFaOfAjFgg5u1NGpH8sD3abxMYtXgx3Ki5p
         i7LCsxZZxofFxeWkiXPmTgu06iorOx4E4BgfvSUOMgmGP46TV2axwJ7LWFZNQVrNsvf3
         xRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071522; x=1790676322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2+Rzsvc6cT42wPihpbCzyttfrFEcFhBrHOmp0V8ZiA=;
        b=twTsc2YV3DGWpJEdAaSOVslnZ1x4SVObGFMu5GII+UnL2OZ1UPRgdpICZ16egH7yqE
         bVdtS+hynDldMzq2iV+eLgIH7375fRLJPvkKEKgBKiKNIWO/bqki7QtzJUCRLdHQqan9
         aidggZcwOXFZnse6ylmK45R3NkxqhmP01JEeni4rCEVdEwfpRfgE9yxmZLuic+xZCpIz
         LjX0F/Qo9/6KvK1ruWW+0pgS1JDBIqW0GJpctlhYwqYx8HCFXh2R7IxQx111j79hywiX
         kWldGoCDaQtN9cjqIVzOxBGb9TuZ2b5ksYtR0UupPF5xO4eNDFI5nmejyGzbPMqnTwGf
         wE5A==
X-Forwarded-Encrypted: i=1; AKwUvBz/05PSxdzieFvlz7KpA3x/YAAweWQEozPyHwaczTuXSk84xQU4cKB+YMPCBoBbJ/929aMNHnrHOjjg@vger.kernel.org
X-Gm-Message-State: AFuF++kw0pBY1UQgM52L6mc0pPeaaDWTo7l7YMDpS5rvfMOiwMswhfxj
	2BQvnMpcxN97RD7F5TofJS2em1+5OBMTHVnMcYOPosB7VhiNrHuAVnZY
X-Gm-Gg: AYBFou3jzndDiOC01tkZ6s9rHtLn1AY681lJPS1ONsING3k32wCHmaSA7nbV9W9efHI
	UkjRZcgTZmLJHjasZZMgcvAcCDurmlkl9VNev31nQAhKmDEOcPFU7Sj6beBxA2ghvKUketV9+Ud
	J4xLj761lDxoSJDVxAQxA5I4EyJBPyO1RWedJ6noGFKdh1IvE5LiT45jU6z6eWoPkMODNlhvhBj
	lcyOg++KZYjeMznwVNmv2LTueyPAWm5SjmtGRxoVfhixxHkhrzrx+V7ILUsCCyv3DS5t6ef+q22
	XqalgWWop89crpTXaadguuKXjVS5lai0aTGAL1jo8kwUUvDB0MsY2fCw4YOH5iCbak6j+N/NUIo
	zhAMb/yE+CdYjcthWufb7iiLAv5h3NEA9qF9e1lWZZQ1oXH807I8FP0jK6s9UjXnl9EAwordCdQ
	rzvKq2jZGiEJuwI1ngd9ht7sU6uVyjIK/O/PkeZFR5SCq44C+rRQmJycLQm1KcmouYqQgmp1arz
	VI3Ou3iIy/TeJC9oUG9y6oG
X-Received: by 2002:a17:90b:2ccb:b0:39e:fbf:e7b5 with SMTP id 98e67ed59e1d1-3a073394643mr1152114a91.6.1790071522133;
        Tue, 22 Sep 2026 03:05:22 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067021ca6sm3984718a91.2.2026.09.22.03.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:05:20 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add support for Acer Swift SFA14-11
Date: Tue, 22 Sep 2026 18:04:34 +0800
Message-ID: <20260922100501.8888-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Acer Swift SFA14-11, a laptop based on the Qualcomm
X1E78100 SoC.

The following hardware has been tested and is working:

- NVMe SSD
- WiFi and Bluetooth (UART)
- USB-A ports
- USB-C port with DP alt mode
- eDP display with PWM backlight
- HDMI (via DP bridge)
- I2C HID keyboard and touchpad
- Audio: speakers, headphone jack, DP alt mode and HDMI
- GPU and video decoding
- Battery charging

Note on the compatible string: There are two names:
- Swift SFA14-11[1]
- SFA14-11[2]
from the support site of acer.com, but the UEFI firmware reports the
Product Name as SFA14-11. The compatible string follows the firmware
("acer,sfa14-11"), while the model string uses "Acer Swift SFA14-11"
for readability.

[1] https://www.acer.com/au-en/support/product-support/Swift_SFA14-11
[2] https://www.acer.com/au-en/support/product-support/SFA14-11


Jianfeng Liu (3):
  dt-bindings: arm: qcom: Add Acer Swift SFA14-11
  arm64: dts: qcom: Add Acer Swift SFA14-11
  firmware: qcom: scm: Allow QSEECOM on Acer Swift SFA14-11

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1520 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1524 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
branch: sfa14-11-next-20260921

-- 
2.47.3

