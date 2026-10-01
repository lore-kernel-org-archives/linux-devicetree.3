Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C33B3C4565
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 12:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858336; cv=none; b=s7gpwafDcMXJyxSoQ2axFvcYVytngEM0SokjxNMJDNanAB6vt8DcS+wJhNoECtuSbr04LjCigGSPN2u4PYgi+LlbdGK/8NyufXyjnDJb35pwjy3MUlKZp2rxKTIeRbyI1xIQdtysKu4pDygQq/gDVgecAwZAsH91YADzBTvODCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858336; c=relaxed/simple;
	bh=LH7NORxv66FEX3jWbIOrRO/sqHn5Y0T6wUJ1L0gRjAc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WaZgDcczTNC664eftjN7NXdiE3cZKYutsqYSZH0NQQOnf7WTdYneSWYSl0ZXIumtlPKEPut0/UdAh/8ycLJIw64/cPLpeQ4nh/GZFLcj+tZBUCM+ame8C0R4fh4J7obBWuXrxg0zUp/imdsGZpbjgrJbKQjCnDGZl3yloTkavwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=20SdLa7/; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="20SdLa7/"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e20bb4583so265762066b.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790858332; x=1791463132; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OUyuclWQzI//VqLPH9CkNGa/oPcpJlozfgVYmGJRkxg=;
        b=20SdLa7/20FjJtCT9zY2doakqfF+431cVDD/as7w5VVDZGsKq03i3V+N+XDlz8vj38
         mwSQMe+ZerQqLcIK9Obr//n8k2ynXnWcjQMfr4EaAsLsb/pL3EMGIrdCKPNtinDMCr8h
         j7eEQhYSwwIOWu7w9U/+DXBEd5Xow7afwcke0GiuALjEm2vLOUu8gJ5eI4EOdEUKwwNX
         w2t2MnriuuT2c8wFU79rmYAh9Y4CrPBya9eNW4X3HoK9nq7ZuZA6JWaM8kSCJ+xGB+i9
         qcevUqnSwyAKhTCb2ZTD3HUxHmm8VeBoeCnkZAdmSKRXjMfxOJXQQCIvSn1oFDDR+su6
         qFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858332; x=1791463132;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OUyuclWQzI//VqLPH9CkNGa/oPcpJlozfgVYmGJRkxg=;
        b=BZxGV8U7/eTRtndoUCuUqSLUgfmeXJ5VcmIqI0Lrmf7IyvyWKaD1Lw1JWXaPSPCpdD
         pUAlWAKKCveHeUIA2Oo2bbt0zimYKxWf68+nDeN1jhFNeDbOFFGG0OOR8r2bJ074gspo
         jpF1XmDhvVDRajcmoxXPYBq8FIZolouSJNWpkMVRsEy87vjHweiEkjbqr9+H7PKuBNpZ
         2ecIJCc/gpeqsBUpoeh8fZgYkg4wwWmHQ1vJvTKsp2KjrBqc3Emo56SVyPUjSylXJHsa
         jXG6FQqN8nEYnzlOIBKswBPHSa6JLhTJnbHtuzm/6BI7+4wReEz0aqR0VRMu83UBHL57
         n7vA==
X-Forwarded-Encrypted: i=1; AKwUvByeQHKMGSh/hqm5YP9tH/eCBLjjrxk71SLBMCETUPn9hscRNSGdQx90iNPRog1OASwhbbwb2rdj1k5q@vger.kernel.org
X-Gm-Message-State: AFuF++lW1ToDUdry15DcI/4ck01D8hRmkI9l+L98pXyOF/6aBDT2y8Cn
	ELsn5+9fxMaQLINFtOvn0mS8WLjAvdEnZRqgdI+0QV6imatENVERqmkOqqpBhc0ljeU=
X-Gm-Gg: AYBFou2xyw+0xY/LfI8aWV6LlGxMZuFyY4ShLSpx6xz9iaZw+WzBkNK58ci/NDKsU/9
	NP1ViNQjGOF4bvvg31ZKMt1qHg2wHMoVOrCsF+wGXM1tKfwIRN5laADVUQuEHIb9+nraX/Etmuo
	R79nU3Y+BF87qC0/buBWvykw5Ux4YMR2jnjYY1Kgyh0Ri7kn/RsJ7OYDSu5XlyLuAlP4EbT8prZ
	4eHPD5X0LKOIMj1NRygbhoEgJs7QaHBYhqwzgEKaBQbXciqxV5XvSBcTvX5AWXSh7IFd5lEudNw
	sAS3quAt0vGZFEGwnU61O1g5LWKvBTvqYWPieUfTQ4XauoetlfsqaZEMc0GGhyQ6R5ZWWbvjN9O
	XMAQMs/kgrPmqoSXPaRPArrEMIBPUKXyEcm8oodsKbm7UUvsWxu5qeUlFEOJibFNnrMvn3ph39E
	2PXzABMbJ0M5EfzTj3rDHdWysmGWw7oMX6U5le+dmu7UVvumWkRiI8JOV6BvPewMg+QdklNnOkz
	FH1qpyKd0CcBiWYHmbih/lBtu00VYnIDjejq1obx4sXHxJ2GSLUiSC0
X-Received: by 2002:a17:907:720a:b0:c29:6136:9f66 with SMTP id a640c23a62f3a-c2e23ca277dmr381283966b.14.1790858332210;
        Thu, 01 Oct 2026 05:38:52 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c8ee1fsm150346766b.24.2026.10.01.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:38:51 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v2 0/3] AW8695 haptic driver.
Date: Thu, 01 Oct 2026 14:38:49 +0200
Message-Id: <20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFpUvmoC/3WOyw6CMBBFf4XM2hLKo6Ws/A9DSIVBZiHgFKuG8
 O9WWLs8k3vnnhUcMqGDKlqB0ZOjaQyQniJoBzveUFAXGNIkVYmWSthXqUzRDHZeqG36OW86Jo8
 sMqPzTKLRKish1GfGnt7760t9MOPjGRaW4whX61C00/1OSxV5HWeC2wJ+2YHcMvFnt/JyD+8CR
 ub/BbwUiZCF6nWRh6Cx594Sz8M0YhxWoN627Qv3dkoT8AAAAA==
X-Change-ID: 20260716-aw8695_haptic_fp4_driver-397431e97638
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858331; l=1438;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=LH7NORxv66FEX3jWbIOrRO/sqHn5Y0T6wUJ1L0gRjAc=;
 b=EnZLRLKhoakjdmWYHztx8sNsElJOrI+eqDJC8ddS0p31KWyRFj0dzH7nU9U511OQ/Yr0lhH+X
 BCjRVrfoRnTD1pbn+C3jVQcqzyZBrBQBGkf+qNklvlPKNODC09i5+V/
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Clean-up of the aw8695 haptic driver patchset that was sent in 2022.
Variables dependant on devicetree have been hardcoded, and unnecessary
functions have been removed.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Added power management.
- Reformatted DTB schema.
- Removed unnecessary IRQ dev_dbg messages.
- Changed reset pin bias to pull-up.
- Changed error handling to reflect subsystem style guidelines.
- Link to v1: https://lore.kernel.org/r/20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com

---
Griffin Kroah-Hartman (1):
      dt-bindings: input: Add compatibility for Awinic AW8695

Luca Weiss (2):
      Input - aw8695: Add driver for AW8695 haptics
      arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695 haptics

 .../devicetree/bindings/input/awinic,aw86927.yaml  |   5 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  26 +-
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/aw8695.c                        | 803 +++++++++++++++++++++
 5 files changed, 844 insertions(+), 2 deletions(-)
---
base-commit: 5a956dde5526a634dca7ccad27c051ebcc306089
change-id: 20260716-aw8695_haptic_fp4_driver-397431e97638

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

