Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165693FBB4D
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 04:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297809; cv=none; b=ucu7YMrqCw5BsI6YygQkoyQYO0cfIQRctNMQNPEM4vIuhIL/r9K9UoFpjoKaLNaodHtv0hf7iVfhUQbc7qM46OUTj6CxUlotVWCZ/wxivADcmUHVPUguKZg1hLT5wZ+oMHE4P6RQZL17i4nxc9fUBJLahSXnNfeUm6G8NKqD49E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297809; c=relaxed/simple;
	bh=Anss7133/aANMPtcn5QRXQaxDH/4VeyG3Fgcsy6YMc4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jirzIrJp5X4l0FaWvQuqSCgN6c+gQ5njOl0RecW4Gbn+b7U4yVX7/dMGSjNDsEzMT8Z5g2lLM+/Yc8FsNW5ihu5tMlB2fjPPB3TvVoTyjFPhmV3ZUeP0VH1npx6nlXvOt9dIgIMPmw//jVuzUjrPHOi/Lp3HbDIZ50yssg2QZH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbJtyab6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbJtyab6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac7c7b3a90so523322a91.3
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 21:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297797; x=1792902597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VWSV2lYeWe6uhtDKhgh0Nkoh2az0FS4A25FIOTm7cLg=;
        b=bbJtyab60pRpfxg2B0XuPjmJrIruUt6Dq3k25lsiQSFIjD5OaOQTdlME1k67VsWjho
         +kj7ftF8WBjhxabYEodLwoPGSZnRYLm5aZstMbMhxCLyHYebf3Sp0eTNYGqohVEHmzWo
         trVh5sjLSBoTYSgMjy3mo2tCnTv3OzqF+oL0R4sXKTFI94F4sb75bCOcrrXGCKv5Usmd
         CmUwk/acpeF7KwjCBbxD8Qi2UxA5L9+Wbe+DKBgf5yKCMuohpEfQFTlGZh4Adty2d8xj
         JSAmU9mVqech7nH08lWEMfGxVk96sXSmX15b4f2+CFMr2G4C5wsndrxlmAZPikfb7ugj
         Ul9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297797; x=1792902597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VWSV2lYeWe6uhtDKhgh0Nkoh2az0FS4A25FIOTm7cLg=;
        b=M3xpJkVFf/uTtU8LdpWwkssytW4/lOfqQZIArb5JwkHEDvDoUEzdh6pkEPD0odAKUM
         OgoQSX8sPkLlBQHNKM2y3U6YasI+jiVU27WfqJvvb15kOCSt0Bp/ox973phW46dIeMcP
         g6Oekth3HjLh8Z1GHfs4kUL3Hdft65ub/uEXSrQG8QWHA77Etbi1eRwOdR7LsJg4T39d
         ck4/yjWwOYw8kzzkWmd+8w4hhESCecJEj6vp1zagFxvrHXU7mNZln7t8BEtmgmzliaV+
         97GKK34vAUPWK5JIg3YBgy7H2eHmUqYRsuqkNhUQWyl1XJUTUSRr0D1ZXPVzGRBqGmQO
         Bypw==
X-Forwarded-Encrypted: i=1; AKwUvBxqhFkJjxQuQN26WLf2PeGmmfHK9cF3phm6HOoLwFMtkp2jDqKEILqNdf5SakJqkpxE1lZGDax6bXyP@vger.kernel.org
X-Gm-Message-State: AFq9FYKwjYkYptAy3f3wtWda2O0KKO84FieAWK2+/cDuqNzNfPbgRCHk
	S2sTV6rfgiao4yKa6lpVS7Mz3gf8gHmadNK3uw3WV0jj6X/nqbRpxq3I
X-Gm-Gg: AYBFou2HAK94sr2ilXwcXA+KXmtKq7a8vNVDQuDw7R8sj79fhv24sKfOOrvCQ930PEB
	QQRHIgYYLGcyIzbYwLmZ31yOxRzyIY9zEdCH6ecUk+tWdgIS72aKTin6f9yFJwsEH9EnuB1aaOZ
	p+bc5SJS/caZ9CRssG8cELEKj6cqY8WAiG1+4FpxKqPKV+SNLahu5XHEecMIIO3/QRMrjH4GiL/
	thP1nILST3MiYk4YkNEAUd/5SSuObyz6Bt0mraHiMp+fenrHr6oPQ4TyNzGrDYqpFFomOp6xoUR
	N4egiTTWBinlzK7NZ1EF9EgxsYS7m6ythP3GyHpNVX6LfBz+6Bf+ilanKC5hLnXJjq3B5cmEr5n
	X6EmpdSsZ1heU0xJ4qsHIlhCIZkntjaL26uJgtLNcOILhkrXQlifId4VSNlTIw2l1HVMZAytVAO
	XA37t6XqT+HhWMAN3hwtVO7Kg4BGY10ktoFL8oqOpqP7Paa1EL7de0Ypf8eYfSK9M=
X-Received: by 2002:a17:90b:5610:b0:3ac:8897:7b88 with SMTP id 98e67ed59e1d1-3acef5f43f0mr3344212a91.58.1792297797308;
        Sat, 17 Oct 2026 21:29:57 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:29:56 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v2 0/4] Fix PSCI on MSM8917 and MSM8937
Date: Sun, 18 Oct 2026 04:29:20 +0000
Message-Id: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNQQ7CIBBFr9LMWgxQQ40r79F0gTBtx9jSQCWah
 rsLNcblm7z/ZoOAnjDApdrAY6RAbs4gDxWYUc8DMrKZQXKpBBc1W4Ih1tOLnbU03CqpVK8h64v
 HfN5Tbffl8Lzd0axlX4yRwur8e/8VRfF+2eafjYJxZtFqlA2edC2uw6TpcTRugi6l9AH3CMdds
 gAAAA==
X-Change-ID: 20261013-psci-fix-8a2c0d6266fa
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
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
Changes in v2:
- Small phrase change in the property description
- Added property check in psci_1_0_init()
- Link to v1: https://patch.msgid.link/20261017-psci-fix-v1-0-dedae27e4a31@gmail.com

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
 drivers/firmware/psci/psci.c                    |  6 ++++--
 5 files changed, 33 insertions(+), 12 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261013-psci-fix-8a2c0d6266fa

Best regards,
--  
Reza Kurniawan <imkyufie@gmail.com>

