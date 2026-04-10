Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81D53A5E82
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809032; cv=none; b=OVIUQUikPn5Hs+1/U900sQiR5Em1VmJ+0hCtMWIvLxUg5RawagnU4hvG9yc+6gS0ArVbtxGhXFUOda7FrOSK6TY+wvSwpYBzBT14EoHeMXXTFtVp3hZFVuj9vhxqv9n9oHzV06S7LbmHe7xwwj41yXp34vruisLPq6ey2HFSk/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809032; c=relaxed/simple;
	bh=TytkM0XJK6cpZlr6ajNYzfLfb5VWH8YjMrlyP4DuW3Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gc6ADA+pckXbcbUNEFHwXGcIRXJq+uY70wzEditSIaoAFjww/WrvFlnNG96u+lpIuDJ/iARAVQk9MLvMueL6BMCJCsAFI/S6SG68Y5v+KvgnLufdyaKBvTWNjh9qUGoK1kc/mDLaPrGQUJyr1qSmf1DZ7Iixkvbnq+GUxMKsFFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aENoYhC8; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aENoYhC8"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b936331786dso214483666b.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 01:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775809029; x=1776413829; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xE/5OZBL7V7EOVLmL+MSBtxCzuDnoarAuDjHIXz3In8=;
        b=aENoYhC8Hpc5D1THSurPgZNkS+9ub9VYxpILeZzcV4RVZmXOJHxUZDvb1Id87rbpc0
         cBBtgzYSpuZkODuQhtsw19WoQwirg5J3eVqoVVyYMKX7tumCFU2ECSWYrXZ2Ggo+2DHB
         lKJ8FepEvzP6YkTA69ByMnSFi05OHdHHrW4kgdnUdpTWJ93UXQN1EsFvOZQrewZ04sJ0
         k00klHU8zxLv30bt2rGj4KyPY8VLTyxyqSUF0oK6JaRk5hYMXqJbIsLzJPlTdQ5En3Kr
         o5iyJzy/sEcWw1AbMb9zhwyoE7VU2+6cBBhwucsDBkPMvWkLKaSPcVS7KoQmKHAxfKiQ
         MC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775809029; x=1776413829;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xE/5OZBL7V7EOVLmL+MSBtxCzuDnoarAuDjHIXz3In8=;
        b=ssAhTdCY3xM1Foy8ClOSt235m0mCKG8mHBKdyq9UZVtItzmqa0AeinkapYBMG2kgTg
         6/wDnsyNS1doa/4W7arBZK+qynVnvoKNqP46x7IJJSvtVjYtSne9kNT5ExeAXc84icjY
         1kMixCj4F4ozE6aCQmjRVChP4wtqYiHiGDhrUzMJiWVpm/nSzATEC0rXW/Rzo1HvDLRv
         GQ30eH4XIpYxE/UsLo6G5uFBeUx7nV6cEYpGCiyIVJcfqfOiEdO9Ao+fVF8QvyF20fgg
         cra2mxz0oIorZ6zmBob4P3zkV/TVwWvBQoDEqoRQmA5V838dy6CUumSHZax+zB6IDjmI
         xK0g==
X-Forwarded-Encrypted: i=1; AJvYcCXiwp49clC7uv0jEKEQ5jQsfXTzXmpnVt0IExdZGJ3Qsw6hkI9Q3xIqizMy1th+gXLCbPv1hNcVR3jr@vger.kernel.org
X-Gm-Message-State: AOJu0YyFL0NIHihdINF8avkTD3IqBqEYy/AS6LLc67OnhXyLzmHyVl3G
	P5HJcGhL01q1r3t15QbCjAM3zefshVJUgPZyE2LrnmJUICLC+lwMqZ4yU3xdxhpS0B8=
X-Gm-Gg: AeBDieu4y/xZ6L8iywSlY4Qrq709Ew2xHSTCPGV3ROtgdWpQZ7w4WofCVwanlHaZ40R
	Q6H8tYy/mayPFEbMJR7boWEi0uXdfpoGzHYGKUNW1FTBlNaGYbHi2BJpdx2bb8kyFBU7ki9FY8S
	DlA+8pfRdU7A2uPmCQfSXacnjkYuOh/Ck3ir7AMzV5FU2Yv452USuAjFdFNIcFBKbg36YXKmSqI
	2O+sPkJKkyctUcUiGFx9Gdd2z9pB22QqO2KKlaSSKcxqu79/w9AkAIqRjftOFSUT1IG0pW6Rnay
	IdSai+6G+VijjOj0rMWZfZjaXVbiI2n4PCA/4pg9CzrtHw6W9TwYgWHcWsD3MSxiUiBeqOlFbZs
	4KPVwBKNznvyntwF3Poj2m609FqBeFZWYd+Uph19nIxG6vTd62J3YS0icuXFgNL6Uy0NlNlWVlO
	keOry0zPz0ar2TsiIwEnrVI/GSj27Dnn8eKXNIALMtpZtjhlQ2jPaxudDuoIzFRq/eMu9o4iO1x
	+L7dg==
X-Received: by 2002:a17:907:1ca5:b0:b9c:b3b5:bbf0 with SMTP id a640c23a62f3a-b9d724995a8mr129813766b.6.1775809028467;
        Fri, 10 Apr 2026 01:17:08 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c7c81sm58488466b.43.2026.04.10.01.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:17:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] IPA v5.2 support for Milos and Fairphone (Gen. 6)
Date: Fri, 10 Apr 2026 10:17:00 +0200
Message-Id: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBBFf4XM2jHlJcrK/zAsCgwyRlpsC8EQ/
 t3yWLq8ybnn3hksGSYLeTCDoZEta+VDdAqgaqV6EnLtM0QiuohExNjxW1vkXiKlmUilvGZRkoL
 ne0MNT5vrUezZDuWLKrcKDsLQZ/AjbseglJaw0l3HLg8UTQ6PoRusipat0+a7vRvDrfHnyBiiQ
 BHSjRIScR3TvZFs+lYrOns3FMuy/ABUdUSI6QAAAA==
X-Change-ID: 20260403-milos-ipa-e5705aa87245
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775809026; l=1305;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=TytkM0XJK6cpZlr6ajNYzfLfb5VWH8YjMrlyP4DuW3Q=;
 b=c5DAttZVXDKXca5dJajEtYxfhBKCO5osIy0dsjRH5EDX0HDtg+W3WNHQMweVWMDf+CCPm8lRE
 4RYcCxofdq5A2gi02Fr4PAu6UUH8kqrcHmSd33ExCsgRxBtI/gTHQQk
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for IPA v5.2 which can be found in the Milos SoC. And
finally enable it on Fairphone (Gen. 6) so that mobile data (4G/5G/..)
starts working.

Depends on:
* IPA v5.2 support
  https://lore.kernel.org/linux-arm-msm/20260410-ipa-v5-2-v2-0-778422a05060@fairphone.com/T/
* Describe IMEM on Milos
  https://lore.kernel.org/linux-arm-msm/20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com/T/

I'd like to have specified these as b4 deps but somehow b4's behaving
quite weird with this series, adding many thousands of
prerequisite-patch-id, so I guess manually will need to be enough.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Split net patches into a separate series
- Pick up tags
- Link to v1: https://patch.msgid.link/20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com

---
Luca Weiss (2):
      arm64: dts: qcom: milos: Add IPA node
      arm64: dts: qcom: milos-fairphone-fp6: Enable IPA

 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts |  9 +++++
 arch/arm64/boot/dts/qcom/milos.dtsi              | 44 ++++++++++++++++++++++++
 2 files changed, 53 insertions(+)
---
base-commit: 0190c2c6dae368aeb9bf59a449ebe23f24bfa059
change-id: 20260403-milos-ipa-e5705aa87245

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

