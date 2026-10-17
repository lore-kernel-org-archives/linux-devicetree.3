Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8A13AEF5A
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 16:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255358; cv=none; b=Zx0HFCE29iwmd6Zf8FA6LqOpxzA7VcmcUfMBFH4+j3SenIGuFeb0p1EjrnWXyeQdEWcdTjHv922elzQ9IrThI2GpF9twyw1NCHJ5GosTYYGXbRRDI+dNim/aM4ppx3HC1b09U9xVKNO4mO36HyLhbuzXN85RMzEM9c7ENJK2VXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255358; c=relaxed/simple;
	bh=PvCtvOycJmdiDgVzTzfFtgjjZ7LYOBs5XgQP+trDJVM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tcZnLk7oH51oJ/DeeVx9mCS6/KSj/n19R6Y1jQpfgkIA0nx0Blpws+apBz3RYlFZmfchrHyA+0MH2CcqsMdD9dA4L+gjtpGhjIf4S/lhYMMT8slotP4crlYGPe+cPQZgijLbeA+rMb9II0akbRJX7/gO4oJDfVobRxO/LHV0gYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fw4WZwvf; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fw4WZwvf"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so461428a91.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255356; x=1792860156; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kv1aGnhKIy4dQPOs4e+ES3Qr9yc3Tep8lN5nihq3WSc=;
        b=Fw4WZwvfriO+l3kRN/bjOuImPUIFcZ4lRcFN8sxbu/R3cDe1FXp4WayNlgdiBmv9RL
         3M+Sje4h0j3Wl2Kg2POv3bAOlngb4bKncoO/Kbpu+6NmXM5mm+HN0v4W01F9VHcG3Ve1
         19JI4PTBa5/yworDhfq+D/T7dTs50MaREmNhr/I4FzNsu9qkzsibWS11efYeSahjOyar
         ke/yq5QSzuKc3TIedoyCV5JPonmqGY8Vl6BSBb3zbdy+NsEUe+d4Kw1rPojVPDK9glvg
         oh5YO6Meiu4mWIJI9k8Jb72O4l71Ybalm3lle22OjHBf8h5RGF1Ka25baN+JxO1uVdQz
         5NtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255356; x=1792860156;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kv1aGnhKIy4dQPOs4e+ES3Qr9yc3Tep8lN5nihq3WSc=;
        b=VwajFVRTps0dfP7PKRVpc5l21kO5IGx7XfpsBy/QxvCIFhxDqs+86Dh5hf99akF2gS
         rUcnHsJHHwbR7aHFSCzP0LdVBo4IRpMd67NXIXKIaNILYP8TRT4KeJO7R2O9Hf8d3DBG
         yTHw/d1TuQoOZ9Zb8YC/9yfOTL4+wb7S44m8WfXBZH1G9OmF4oxQMAyGOjgKk8KWtzaW
         xQJhIBSoqafbIr2Ee9EUrwl9gacRs9wlVuB9SPsaMOKzqdxDOsTmuhQ0RM9GcUmz0U/u
         5KpavY1jEvdM0xvFMTZX0qO7GLHTC+OuXSLChkQryYKQ6R0XJNuhmPuf+E+YPeslCJeG
         MSuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUtEtdg8rlPeFj9YzfFaywxDOCb/IVwP39bf3LHZBjMBU0K1v2GrU/wbIBkrTA+z4AKNKEi9IhJxwy@vger.kernel.org
X-Gm-Message-State: AFq9FYLJDomCHA07IzBEv7r5HEjBgKmXVgqErXzmvH84JWUXquXyae7D
	8W9yYVnzuo1qUb24FSV3dkbK4/q2wRfazo+NJaFAegAsnuVMPopiE52n
X-Gm-Gg: AYBFou1VxZMuAyYTOjQdlNoCe759HU7FYsRo1Qm/W+6N4t4CNcejVp3Y9VAalhmvot6
	MD7cYPEHMxAiL9GX48RV3ZMjEZfxVsWcOqhKPr35WAEZNwkSLViwaFAlRNumzb6kjb7uG4Ta6ts
	UYXI6xSswp2VNCFt3SKYNY8kH/YJ3sNE1zbFbHw6WKSz6sXdD3D/EZjhFUl3XPeVRo7co6VwFKb
	TW218M1uW6rnxjai2jCTAwoLsRNbxMIi9b9VJn36ueXT46nWd4QO3yWNmSugQSJd6OvpjSSlNVr
	H390Kizxyh7IuGxe3YRvSJyiwrXYOVsW+/JPty8Z57JxUcg1GxXS2guZ+tGb5mCDzbOhVWyW7aR
	EdmC8rugU0neA8cl4OoMNg9IjWXSE8foeyOkJq0S4GfQAoQwR4cur2zfHzcqWSunI5VPyIZJWr/
	Fdu7PoDSH2z4ckRzYjKEB+PVNTMdpTpHn8iZ0F7HTPJmlxxUim+TZRq7UHvsXIfw==
X-Received: by 2002:a17:90b:4c8c:b0:3a7:ecab:c4c7 with SMTP id 98e67ed59e1d1-3acef1486bemr2929602a91.34.1792255356104;
        Sat, 17 Oct 2026 09:42:36 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:34 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH 0/4] Fix PSCI on MSM8917 and MSM8937
Date: Sat, 17 Oct 2026 23:41:22 +0700
Message-Id: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqAIBAE0F+JPSeogUS/Eh1M19oOFW5FIP57V
 sc3zEwCxkjI0FUJIl7EtK0Fqq7AzXadUJAvBi21UVI1YmdHItAtWqud9EYbEyyU+h6xxN9VP/z
 mc1zQHe8ecn4AiZ//EGwAAAA=
X-Change-ID: 20261013-psci-fix-8a2c0d6266fa
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

PSCI on Qualcomm MSM8917 and MSM8937 advertises support for OS-initiated
mode through PSCI_FEATURES, but rejects every PSCI_SET_SUSPEND_MODE call
with NOT_SUPPORTED. The cpuidle-psci-domain driver treats this as a
fatal error, so probe fails and the CPU PM domain topology is never
registered:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

This series adds a "skip-suspend-mode-switch" property to the PSCI node.
When present, cpuidle-psci-domain does not call psci_set_osi_mode() and
continues with the topology it has already built.

Skipping the switch is expected to be safe on these platforms since it
matches the behavior of the downstream kernel, which manages the
cluster power level in addition to the CPU power level, just as Linux
does when OSI is supported.

Additionally, it also adds the property to the PSCI node for both
platforms. For MSM8917, additional change is added to fix the system
being unresponsive at idle.

---
Alejandro Tafalla (2):
      dt-bindings: arm: psci: Add skip-suspend-mode-switch property
      cpuidle: psci: Allow skipping the suspend mode switch

Reza Kurniawan (2):
      arm64: dts: qcom: Skip suspend mode switch on MSM8917 and MSM8937
      arm64: dts: qcom: msm8917: Use a shallower cluster state to fix unresponsive idle

 Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8917.dtsi           |  9 +++++----
 arch/arm64/boot/dts/qcom/msm8937.dtsi           |  1 +
 drivers/cpuidle/cpuidle-psci-domain.c           | 16 ++++++++++------
 4 files changed, 29 insertions(+), 10 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261013-psci-fix-8a2c0d6266fa

Best regards,
--  
Reza Kurniawan <imkyufie@gmail.com>

