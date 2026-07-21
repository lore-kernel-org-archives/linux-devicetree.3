Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5E63BADA7
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622317; cv=none; b=T3eXnXOvOzMO/5tiHEK7fDZYyXYMX4pwFAICoq8soMXlyyxALA8DngyDq9GTp4SbTxf6FsuGY/mp5taE1n6gFzEsPsY12QpnZq0ypC1IJovMK5naJKHU6T9q6vjSTAptcwCAAxH5Lm+0XnsQ0VvC1kfaQ9jPh1aNYTWIpKlase0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622317; c=relaxed/simple;
	bh=jykxtaXVnSoyTKVPJp1znE2mN2KCMcobywMTcQilV0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ple061baNsHcZL/cqtt0z3Z/WHGNP0Yv3tAyCbu8x8OGOUQTddlQ26ONcQD+ZEGaMdqVRjF3pDHB1483OXqfsFV1qftHpffD1G8mBh4ecodMyhrdN7sKY6F1TNXibFIC6yZNJKMQXk3yEK2LEscMi6YSkCjI6RqIsGa/iYeEu3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZbiuqqP; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZbiuqqP"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84864086bfeso11724806b3a.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784622315; x=1785227115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAt6DAOdlJUc0rABH5B/sK5tagQJrN1Y6Ns1Hb/K3hQ=;
        b=UZbiuqqPCey8DM3SFd5+PnzsOQHEKHQ6YbYAyne1aw5Q0z4BMYBFa9DnEh5OBijRmw
         S0pmTXgyt9PcZV4T2dZvBQyvmXWPORHBiqTqyi2/I2XZaaGRsa2S5lmnoqE7fpJ/SdIg
         5ZjsPE8PYf+iIFgfev3aazcz04CAGuXhy5asiyrsYWbMoatNtP3ng5f8rUAOs9BgXVyh
         aidV49fS7yBsgQfuRP7OyFg0blSiXlmeugp3rGYKpuLpsJZD21xFnYW6yrSTlKCaCY+q
         QsJWYinC/ymyJPp2rBoTBn8zIQjumo2tX7hxHUlY1b2Ba60y/JF+24sDEvxOC6sdksNp
         BTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622315; x=1785227115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAt6DAOdlJUc0rABH5B/sK5tagQJrN1Y6Ns1Hb/K3hQ=;
        b=QePcz5Nvqr3LGrNqmE0g0IxORP5lbJPhWA8k7iDEOOd1izhqn6WZtiAbRc97vo83Ws
         5GXM9ie/OLiFEz7VNScZmc8vZBNHUQ1Yqjv2unZE0xyngojD0fzWOXqk/Y24xcbmacLx
         tyJj/GZNeANEGX0PnW4rBWCInKFtqQhlVWKwR+XYIGYevGoBgrqB90JfM8irpd2zXUV3
         +yvDPwOclC//cSYJ3iuVDRgyYgN+mvHmL8wK18p7sghLzDCAXVAZYYRVCAHDRw0rz+cL
         HGv2JXRdHl5vF0Y+bjbKn2/Udf9K6q4jC9np8Tnnd+HUxeGuMgFoxDqE1EJ41bUjHyI6
         D6Mg==
X-Gm-Message-State: AOJu0Yyl+lmsnA3FKS6wUUxEugrllndAwx+gprHR7KF50XgtZm35qGoh
	tTR7cjV/uMaUPG7qOYh6V5zNBWOMf7FWb7gE3VkU3GQ5l8sziYAP2oQHM6Gr4u2hEII=
X-Gm-Gg: AR+sD12X3Sm1Twog9tv9nZzrk6vGBqQVKj2wvWy7y4lt4uNWs1lYhXcvobbyZunjSFN
	+CqpF72qQWoDpLoVekwydwBsZjEEyoQA0RDGkT5ZO7vDDdbVSoLVsfwNFlFFdS25DnxYN3rYh5k
	T0TZWCwg8pJ94y9hRliwl/mbaEcNEMKl+HFNOt4RSYeoPz3oJWenRsf1W0ZEgG/dn38j3Nvc0ek
	+sL4JrnKdx7tNu0vW/0RXTrrLT6OFVcmI1dz1kt8NaonHAzHmzGPZQulv15OoXTlzW02RqpCTxG
	TrEA2C7MN+ehMt1702l7jsz24nkKQq9jVxJ50Rlc7POjvl0BIW18/5CWZ6U0XQaRpTHxtFXLFxO
	Z96pKVbts/FJdZFGn3Oo4UXGbwQMvm3YdGulmtCvOlNleWMybNuOREun9LezibWYKtsO7tXoCwo
	aYfB9V34lN
X-Received: by 2002:a05:6a00:18a8:b0:848:2f84:732 with SMTP id d2e1a72fcca58-84c294e8b92mr17030900b3a.69.1784622315353;
        Tue, 21 Jul 2026 01:25:15 -0700 (PDT)
Received: from ada.lan (cwgw.codeweavers.com. [4.36.164.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2ad88582sm6886600b3a.1.2026.07.21.01.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:25:14 -0700 (PDT)
From: Kaipeng Zeng <kaipeng94@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	konradybcio@kernel.org,
	andersson@kernel.org,
	Kaipeng Zeng <kaipeng94@gmail.com>
Subject: [PATCH v2 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
Date: Tue, 21 Jul 2026 16:24:08 +0800
Message-ID: <20260721082410.18275-1-kaipeng94@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The work started with x1-crd.dtsi as initial template.
HDMI refers to ThinkPad T14s.
Bluetooth refers to x1-crd.dtsi from the ubuntu-concept kernel [1].
PWM brightness control refers to Ratizux's GitHub repository [2].

Tested on linux-next / Ubuntu 26.04 LTS.

Tested and working devices:

 - NVMe
 - Keyboard & Touchpad
 - USB Type-A, Type-C
 - Battery & charging status
 - Internal display & Backlight brightness control
 - HDMI & Type-C display
 - Bluetooth & Wi-Fi
 - Webcam (usb_2)
 - GPU

[1] https://git.launchpad.net/~ubuntu-concept/ubuntu/+source/linux/+git/resolute
[2] https://github.com/Ratizux/linux-device-acer-sfa14-11.git

---
Changelog:
v2:
- Fix Makefile entry ordering. (Krzysztof Kozlowski)
- Use readable compatible string. (Krzysztof Kozlowski)
- Fix sound card model name for this device. (Krzysztof Kozlowski & Konrad Dybcio)
- Re-sort nodes, pinctrl-*. (Krzysztof Kozlowski & Konrad Dybcio)
- Remove those regulators without consumer and lack of a required value in DSDT. (Konrad Dybcio)
- Remove ADSP/CDSP fastrpc memory. (Konrad Dybcio)
- Add iris firmware path. (Konrad Dybcio)
- Delete usb_1_ss1_qmpphy/usb_1_ss2_qmpphy properties of Type-C. (Sashiko)
- Delete usb_1_ss2_hsphy. (Sashiko)
- Remove unused pmic-glink orientation-gpio. (Sashiko)
- Remove node related to WWAN. 

- The Webcam is a USB device, can be probed without any additional
  node. (Sashiko)
- Using reset-gpios in swr* seems common in X1E devices, like Lenovo
  Yoga Slim7x, ThinkPad t14s and Microsoft Romulus.
  Because speakers do not completely work and I could not see any
  effect of changing it, just retain it. (Sashiko)
- Also, the HDMI audio is the same reason as above. (Sashiko)

- Link to V1: https://lore.kernel.org/linux-devicetree/20260702063156.35169-1-kaipeng94@gmail.com/

Kaipeng Zeng (2):
  dt-bindings: arm: qcom: Add Acer Swift Go Pro AI (SFA14-11)
  arm64: dts: qcom: Add support for Acer Swift Go Pro AI (SFA14-11)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1484 +++++++++++++++++
 3 files changed, 1486 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts


base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
-- 
2.53.0

