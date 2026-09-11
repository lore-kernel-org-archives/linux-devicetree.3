Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CE1217648
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139779; cv=none; b=udwyGvD89FIzrOetMekfZuVAl6vxUyHn/mU71jH0iIe3TBHmxv89pnid0ggGE+kdIu3VdHxNKDLXD8t3kNeKketZz7SuKAqwB53efgR+p7B1dx+NZaXWNwHU8H0kgSgbqkxq02AnX1Qe+DA0UxJoltUFoSu1Z1mGJ3pVxVRaf7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139779; c=relaxed/simple;
	bh=8Jjd56jEtGXtBKfGu+jM18XnCZwOYP3vVYoIuLH6rK0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d5DU9F+ew88xs6Kl7/ATmV4+P6Ad7VVAUJxvRAlDRj5LuR/atcmQqm1iviGnYc8dDyg2xGOl4Utv3S8wR6Hc9rDQq0l4fWH1rnFy1fwqzoDTJN2Vv7I7RoIHmLmK2RvwMIt3HIn2pEdxVN0i8tJzriAnaJ6YKVZ0qov7MsM4kSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=M8BYNE20; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="M8BYNE20"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2544ff970dso168693166b.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789139774; x=1789744574; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c8Q0AIdSNybOkF3ME9hchoB4tDUvQhx14DDferN7ztc=;
        b=M8BYNE20OOAXsnKlI6Nw/SyvauyrxAgGyZFZmzIWFr4n/EZvCrwnLTFJ2Oc1IqXHQj
         Mf+5oLeNo+P7QtjA14SCjTKrRwsmlw/w6UA0O0rCRzkMbjrY2nYQ5Kv9xrr0J8cLDL++
         j3Wy1cvuMR3MRfK/azbuBLiP0cJWJMzzmrUHUVKv/oZrlhgMWQicSgdL2KPpBYy30wV0
         sXLetel/YjMM9rC8r/usLGHjV9GFxSSNB7RKajUJvDPzbVxVj1DlwnAL6sW9OQP0M2az
         cGxKuLyF+IphOsLXIuwV06Tltp/m97mt7PJ0X5BLsUXNNsILtI8iU0B6R3K8i0gLbKsN
         26jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139774; x=1789744574;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c8Q0AIdSNybOkF3ME9hchoB4tDUvQhx14DDferN7ztc=;
        b=PRkuOCvjxv0P0kGcbrDBNxymJJGlXKxE/ZGTj+ZFVfCZmaz8ltGZ+nGhNsaTD9OPq3
         6bMtVLJRTtjBwOLxVVBBc3iAZWOgXwDAQ/w9XqSGozT694+fkWrPmxVOHUeyQFkcZ1V4
         Oxx1at+lQQr/9CMpYq3XYFF/bLEzZC9z13aXvRMHoSylLK0K1tmF6o0a1bmG7ie4aZc0
         1E//UgSASDh/lCrI7KokKiMdAxpTf8HUWaInddNQ2kEjCfnc6u3Wvb9J1e0Ty4xWliEF
         KQX/l/scYvT52S3EZ+f8FI4MFcB8Zc+bb8CaSFJJe7VqAtiRXtLKZXqcWRIiTpJ/Tn2s
         /AmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQSLCPOntX7gqG3I/lGyDAAEk/8zG+2cYq7TaWupUCkiCD+iD+VJTPashleRFSYClSqWkJDd23f9oD@vger.kernel.org
X-Gm-Message-State: AFuF++mNrw9a6ysKk7zl/lzBIjQ4NnYeUqaQ3GWaQDtrsgfIGkU0X9Sv
	5/mrCIFfQpMR341g34u/uT3AcyoP3UUtI+kyQ6lx8rsKsDF4mKU2PaoQdYqUKbkV/CQ=
X-Gm-Gg: AYBFou3s/AhUOHeVBd+EnEWlw+dnR6Vu8sFAAAufWAgV8e4jBZXRNgYC9OhpHc9dQor
	BCeRFzyXGw4LFKjO1CWqFYuGrz6aC+k0Xc6SFCrhz5L61k5KmA2jurHCVNCElG3fS64+/31CaPs
	PDMZHriQAgU/KSkSBrDDUHkL4ddLw1B7IPpFbX7V7bcuVLZCZ0bLetL7Qv0e0nxJldcEnnXIoD0
	po1QtShKe3kMofLl2S/YgXVfLPcivBHrmXgG0oOa5JUtd8goWnLGgEUxePb1NFw98zHshY6BJ+n
	drf/chRrLGihovNfN8Wkzt72fDW9EsJBsQD+H8PSZLIXQIAWm89Kp76k88a65a7F2UPu2dDubLz
	BrR78BWo30hGTQufdg4u7pNgqarrDWQjacWj+9BwSgNi0v8M0sX6LP1u7wvXmLPKj+ARuG9UbQ0
	vWHDm6mYdlgFq6/kOU8KQgW/vrkEF2vn/vD3els4bsmRYQv+wMJgjT1yHPUJ2lNyHNoWGp2/Cmn
	Ctc0GSWHu/9nLohhJOXziWkzg1w0Vb3gf8UzBU7Xij5AYWcM6N+/lY=
X-Received: by 2002:a17:907:874f:b0:c24:6390:decf with SMTP id a640c23a62f3a-c29665b7776mr196074966b.16.1789139774073;
        Fri, 11 Sep 2026 08:16:14 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ba623sm94656766b.45.2026.09.11.08.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:16:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] ESWIN EPH8621 touchscreen support for Fairphone (Gen.
 6)
Date: Fri, 11 Sep 2026 17:16:08 +0200
Message-Id: <20260911-eswin-eph8621-v1-0-db447ff9e445@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr9LM2pq2xKJcxbCg7ShjQsFOQRPC3
 a3i8iXvv78CYyJkaMQKCRdiGmMBfRDg+y7eUVIoDEYZqy5aS+QXRYlTf7ZGy1OoQm0tGqc8lM2
 U8EbvX+/a7syze6DP38jfSPicy1HeNXAdo/TjMFBuxFIfK5m8gXbbPlcQiAadAAAA
X-Change-ID: 20260911-eswin-eph8621-5d3d766e2b0c
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789139772; l=910;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=8Jjd56jEtGXtBKfGu+jM18XnCZwOYP3vVYoIuLH6rK0=;
 b=LBlZtbUcP/9iDsemprine9FuVLBDbXoLQ8FVQTemqwD1QmkOBkWKe4avZExPlWlxauSZ52esU
 UMUgHUohHgiColjyFoZDgNFLRL9bOlHOZD8clZfF19JSysm2ZIylwTb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add dt-bindings, driver and dts additions to support the touchscreen on
Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: input: touchscreen: document ESWIN EPH8621
      Input: Add driver for ESWIN EPH8621 touchscreen IC
      arm64: dts: qcom: milos-fairphone-fp6: Add touchscreen

 .../bindings/input/touchscreen/eswin,eph8621.yaml  |  79 ++++++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  29 +-
 drivers/input/touchscreen/Kconfig                  |  12 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/eswin_eph8621.c          | 310 +++++++++++++++++++++
 5 files changed, 430 insertions(+), 1 deletion(-)
---
base-commit: 5e036ce12de91c6fd674dad33b169c6150be2a7a
change-id: 20260911-eswin-eph8621-5d3d766e2b0c

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

