Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660761;
	b=oPYNDt037f4PbwT1lOg/uotIXWzEQLZLDZWWyqCYU3q3hlkNPBbBJmyJiRCKnWdeHgWw
	 PpJr19QedsLr4URXUGq66fwkUumb5DAfAzc1UKZRdV3EI1nvRfbNtqfHl3mImhXDbqeVl
	 YQj9rtxi77LKy4zBY1Gul5Ww/LJ1pvXLc8okZa1nNe6AzplOImPuJj+uv6F8uLxf8T08w
	 x2jkcQq59TzgdffnKMyHlilrIoO9Js9fZohwb1fc8aLEiJFflyQDky+SinQwsb/FDSBqZ
	 Bw9gFQ3KWnJSRXMe+JKJO9PUpaP33JyAetHA07v7gimyVhgTA06cQIsvQrQkCY0blsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=x8jM4tAINOfg6rs5A/OqB01VfXYqFURFLCrahQ+gFPg=;
	b=yjv6A5a0FAq7rPEztZBhnILFpu0P1sb+R9CqG2MrGH4kMFwll6RaBv1n9j9N0vJsYDZw
	 57F6vGB3zsXm9J9b05EosUetgKLwShYCiujwNvEQZbc7m4jsnDmh72zU8UlUm0B0YaGLg
	 pSox/OQULLs84f9JskZQ8GlSUQoiV8Lfe9/9CRwabX7tFT+SjF5MukIi3lu4LjkQeELYE
	 PixlltsI4MZl7296a0ViDpEDOQ1AioFbfS+PaDCkSKSAfBg4Cxne7Mz0igRxfYp7yo26s
	 EXnsvN3mBqZwcpcphDzYViAJkj7gAjNBc9uqze6g5XKTQNz2UQbZ06TrUjiaPlDbGWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=XdFZXixA;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D60B606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D60B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=XdFZXixA
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c247f6687dcso238518866b.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792660758; x=1793265558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x8jM4tAINOfg6rs5A/OqB01VfXYqFURFLCrahQ+gFPg=;
        b=XdFZXixAP3+1xIqY19/pqmBDJ0RWMabLR5crxFylDucQM0LfrtTJ3IvNWyXLNulwAW
         LWjaTt/NwVpCvEV/Cld+WAICdUHyvhfhunyyn6CSy6hhnyrPR9cY2Lpoj7HMFzJbjUJH
         pItVH3nhGL6vFiJRC1ESOPfvzgIepgzPk5zS/SPOC4H8xov/KpBmnt7WgoHe5nwbRp7d
         oQSRfk240nnZbeSIIeRNz3gQzgqk98dudyxpvENRsSVkwJyYi2DIgKCRrZAqPBN5s1VE
         amgTaHVi6B1dBaPFMUmsXTJKshCrGbHc9hWOC+GQqEAMllqXJ3/dI5qYPcANx0Q8qUOD
         YN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660758; x=1793265558;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x8jM4tAINOfg6rs5A/OqB01VfXYqFURFLCrahQ+gFPg=;
        b=SAhYD2VQMOLQlsyibhJxtHr5QAfrmJdGUNT0uF/RvcRk5GTxDBUM49yQWBQkqLNm54
         7QdpS7CSNthcNRUldmvSth+Vy++3rr3wsmGSC+VH2jRn+RkQsnfhaCWRJS3MTg9ztaVp
         gq6DHxkg9FOF67Uc7qbwMjgIB7UgzsyA/tYN6K1hOWfGm1FZ0b0P1UII7Wuraut0Gk9o
         3NMRIs49vhEAbPHoJJgGN2nHee5WT7rBATgM3p9WcZoKQELW3p9AB1vwdMgFJpHOF2Ul
         suFUw65xbfjcdu9MdQUrQUWyrkTcykJthl68KWPQ8pWgCqw4+LBGQ9pCdKX6OM/CRir4
         MiKg==
X-Forwarded-Encrypted: i=1; AKwUvBwqmIqZeWPnKtLfcNxN33i/CcxCKqJyEcuq1pa5CHHyN1qZjtSuraa+ZZwxpK60/4xdOKyjtuqjvQSX@vger.kernel.org
X-Gm-Message-State: AFq9FYJCk9WiTwxFPdXE9YX+/0p0yOpUffmGl/W2AkSV5YuK4kJFRW3M
	swmSVun7J0MrWlarQj8BI8GiltIlF7O0czZDUR1z19TcaFsV54CLkQ+fb0jq5mV8ksE=
X-Gm-Gg: AYBFou0+TGC55gNXxMxnj+inRo5Tq6yQ5iYRFq7mGV7nvKhsxZBJEhIXXN3wSoop6Sd
	pdsZg2Uj33pyGcR266vNInXY+HbQiXxCscrwKpj6WxlA7PvNuyv61xMH72bjpnlO3TcCTrqLM9k
	BqNXZHskra/XxwLckU9nUp/SHigwBHi57IOYBdbZ5Vpt2M7cDG313qzyxMPtvjL07dlxMV9KGY5
	5vcCWP5A7Mg8OCK7XxzFh3IxR0LmI0tpnfTpSrcaNYo30emjut4mBIwF/q9SBNlPSG5elja26pf
	zKTffwi669gGQ+CAYNToD+BIS/j72ue8BBL+RdLeML41jCG+9GbWIWZypYyqn/5NWIgFZkFMXCA
	2JGV/Pe7nEawoMZcbPIPQIIazvuU5Ucn1cfpXKYmBwsUMoLTy9K+lqCWbGWOEtrDbUd47HmfM5N
	V55Kd2GhSw0VID3Ap0nGcoUneeqPB1/DS2HtLBNUZ8d8u+XF/I8NmuIv9cj8DUZpCT4PB6ie82x
	KheHH5qWFV4Mz6OKEK3mEh+jWfzkXJ18U5G95o4EoGfkzzRnVYVPKYBMGf3XyDyXr//0fz3MZYt
	FgDJBHq/C/NKnmcPCsyA859N6Igmre1PZ5ADJkYsGLZRwv2Xepy5qmY0kIzy8eu/HSGKF+0CbWc
	hlfsB8qMGG5Zj6vN6hpxgokd7CwHf/U59d764oFpalkq4SPoGbn1zcz0dWah+e6LBpEem3c86Sb
	2pmzCtKCN3d+ExQg==
X-Received: by 2002:a17:907:1b0e:b0:c3e:f39b:2296 with SMTP id a640c23a62f3a-c4679620f94mr494323166b.31.1792660757898;
        Thu, 22 Oct 2026 02:19:17 -0700 (PDT)
Received: from 2001-1c08-080f-fd00-57f9-c36c-aa93-fd36.cable.dynamic.v6.ziggo.nl (2001-1c08-080f-fd00-6fe5-b143-671a-f202.cable.dynamic.v6.ziggo.nl. [2001:1c08:80f:fd00:6fe5:b143:671a:f202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50aa01sm85790866b.22.2026.10.22.02.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:19:17 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v3 0/4] AW8695 haptic driver.
Date: Thu, 22 Oct 2026 11:19:14 +0200
Message-Id: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABLV2WoC/32OQW6DMBBFr4K8riMPNjbOqveoKmRgKLMIkDF1W
 0XcvY4jdVGpXb7Rn/f/TURkwijO1U0wJoq0Lhn0UyWGOSxvKGnMLGpVW+XAyvDRWt90c9h2Grp
 pM93IlJCl9s5oQO+sbkV+3xgn+izql9cHM17fc8P+OIo+RJTDernQfq6SO2nJgxP37ExxX/mrr
 EpQwmWAB/P3gARSSWjs5BqTgz48T4F4m9cFT7mliFP9IwOl4B9ZfZf1o2578EaP+Ft2HMc3/bR
 PzD0BAAA=
X-Change-ID: 20260716-aw8695_haptic_fp4_driver-397431e97638
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660757; l=1833;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=CeRNtKXwj6aaH+FnAhN1LCI5wbPc6KwuhA86xbBDykc=;
 b=eNrI3Wlge9SCKhzCcm+PxA35epMAcHqYm/Df48RSkdmGmgrSpp0fkkl+DYQ5Rl98R7KcvsnWB
 kPzCfRn6rVqBYF8l+Vq4D/stBObWcSYlb5RtMptUR7WNU0qh1YZODAr
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Clean-up of the aw8695 haptic driver patchset that was sent in 2022.
Variables dependant on devicetree have been hardcoded, and unnecessary
functions have been removed.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Removed potential race condition in power management.
- Fixed dt-bindings.
- Added MAINTAINERS entry for the aw869* family of haptic drivers.
- Link to v2: https://lore.kernel.org/r/20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com

Changes in v2:
- Added power management.
- Reformatted DTB schema.
- Removed unnecessary IRQ dev_dbg messages.
- Changed reset pin bias to pull-up.
- Changed error handling to reflect subsystem style guidelines.
- Link to v1: https://lore.kernel.org/r/20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com

---
Griffin Kroah-Hartman (2):
      dt-bindings: input: Add compatibility for Awinic AW8695
      MAINTAINERS: add entry for AWINIC haptic driver family

Luca Weiss (2):
      Input - aw8695: Add driver for AW8695 haptics
      arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695 haptics

 .../devicetree/bindings/input/awinic,aw86927.yaml  |   4 +-
 MAINTAINERS                                        |   6 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  26 +-
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/aw8695.c                        | 805 +++++++++++++++++++++
 6 files changed, 851 insertions(+), 2 deletions(-)
---
base-commit: ec8bf8280261294a9b9b4520414b42704c7f9f6b
change-id: 20260716-aw8695_haptic_fp4_driver-397431e97638

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

