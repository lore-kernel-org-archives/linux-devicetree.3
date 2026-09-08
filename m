Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3973A9624
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855124; cv=none; b=DLFrvzFFHzB7a+X4W9+NqspBLxWHnVcqMQX1KtrNwmO/3rsjzTRjS6pS9QSXYiuUlk7aX/tNE9JRNj3bUQvosgf+LGS66Y0kRoMbQx4TvD49GlUnUGZLBreyvlDcmmf2JR5YJMcVfV2X13kYmHtzC5cZYRvR6kBl2kJ+Gbkv0vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855124; c=relaxed/simple;
	bh=Ob8WeoXxpLEJOGu3oc5akP43eFgM38Bg5bmqR1LkHEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pdPtSS6v2bOZGusPdelrrW6LNvsZQNyNAWyq98K8pnMdkZKZme4LwnbOS5CpPEh9q6HJpziEihNa0NxyJgVaZvAHlgPNiDrtaOgLyuzdxLPzzAAlL2BS9EotZkeN2I5A1ityhct+bHr2nyg+pYaeU3da1mExbKVOA9njFx3zh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cy8iBNSr; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cy8iBNSr"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c20e70a0962so540687066b.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788855120; x=1789459920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tc3w/tswhYMPPzbx1rKOX62Vnkfmu3CgvOLefEoDV8o=;
        b=cy8iBNSrktXaSI1ITftqan858dQSCsj5a/cA97C696Jxe/BJOYbKBb896pblayp7hF
         raYQuoXuORLM0HjSL89Ox/ikKBB+XNUY6yS1xNLxti1KLKGEJrCNREkpsk0aKeCJf87y
         41nCVN/yH0WTGSa/C2oPrmUOFXCvfAyxaGKl++7Y9xYiEmR5nlPpfne2rOuky7Y/QbgL
         oQMIvcVZztSZMGmO5QTL9yVhn0Zd2aS42nev5sNl0d/lKRWU3WVG1UOmfS7WwsMXtFY/
         qytrOw62T4vScQG2SJbAnzR+3Ah/nSvDWEmF6rEob5SPv068sQbRoXLaXALtcQKArppd
         La/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788855120; x=1789459920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tc3w/tswhYMPPzbx1rKOX62Vnkfmu3CgvOLefEoDV8o=;
        b=mXmMP5ABvdInsP82DDqWDWlcPybkmLw1c8aya/4of5hfYMro4UdruwVQz7hplPV6jV
         SuNKCSZNQbzKLu5N8XgJxhiSCL3IZEk9hlh7zDkcQHUTxfC4FL8rn9a/sDiYmz/x78UG
         35DZuOOIGrfPxXxxrCHbqEw1K5LXZT4vGqQ7dbdtJbalxKmzq/ot5iyg/u0dsn9dLikR
         z/fjtXQ1CoWbrR9K1jpcbBhMLMK47yOU0n77PgE0pPotcDKXmgOMEUt7zpk13gkAa9Wr
         FMnlqXs3zbvDCjizTksSpTB/8hsHE/GmkopgGQ8OsnaVvciV923vapdnZwXBijo4o4tC
         Rk1w==
X-Forwarded-Encrypted: i=1; AKwUvBywEjwLtNH8DY7gWWOVr0If2qbHBlye0SD6i4RAY0opgxs2TxKxjiYuhHGssX6lJhAPkL3zwfROldQ+@vger.kernel.org
X-Gm-Message-State: AFuF++mWliVPaPvxHJd8gMT2Pf8kzx9L0qsHD6gEQ+vp0aZfp7TBOyAe
	qsHGOktVPLOLAx59+kZvho9g4hoxU9RHtm2LnVpIRwQLmsi6RjtdJLu+
X-Gm-Gg: AYBFou01cLpwWNYliOpNCYtZbM3t+RxZit4xepXFVf0mUhvpPzkL/M8JZ+bFLvtQJC8
	DQZbdpEJfqUGsiP/AP0D1AbMlHNEo/e9WiYfX2k9eRvNHzA8AwiKS99Pz7N2mWNfvV8/8QdVOgR
	MjYLsBefpq2bQb/7WPnWhWPhW36sKEdl0B95oGggEATVShw2V6k947C5cACfnPO6YS/bL3mECZI
	ziRhnR8s28HbfPClzg+YT4QOdKvZuP7MWHmOYmuVOKDCorN8YhFpj1bBorpdyOnTW6UATWAbLEr
	6O7j4lp8oBOB0Kt2haD+ESdSuc3NhZALq2vIjQgEHIm2KypTqHE8tPUT/x9bfH8hYZ8TDKRUE1B
	EtLMVAhvZxW5HnUDQGDY3SgMn6JMULpPmXDlk8aNo37U8J1pzG2N90rbM21h9iCkguBo9TRVkJv
	7TIRbPLRdikTNi/sQgAvtZfGJjnresDlsSRj8EGiDWfxxsgaYk80tnskic15G9VjRq9P7Hqj40h
	lAo1mY7jw==
X-Received: by 2002:a17:906:7308:b0:c20:9447:bd5e with SMTP id a640c23a62f3a-c260c8e77fcmr2227127366b.9.1788855120150;
        Tue, 08 Sep 2026 01:12:00 -0700 (PDT)
Received: from localhost (78-3-21-163.adsl.net.t-com.hr. [78.3.21.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261f673000sm490389566b.24.2026.09.08.01.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:11:59 -0700 (PDT)
From: Dmitry Sinyavin <sinyavin@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: qcom: Add MDM9607 APCS IPC
Date: Tue,  8 Sep 2026 10:11:58 +0200
Message-ID: <20260908081158.2399852-1-sinyavin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MDM9607 APCS IPC register is at offset 0x8 in the KPSS global block.
Its CPU clock controller is in a separate block, so the existing MSM8994
APCS match data can be used without registering a clock device.

Document the MDM9607 compatible with the MSM8994 fallback so the existing
driver match data can be reused.

Signed-off-by: Dmitry Sinyavin <sinyavin@gmail.com>
---
Validated with dt_binding_check, including yamllint, and positive and
negative DTB tests for the compatible string combination. Existing
MSM8974, MSM8976 and MSM8994 APCS nodes also pass schema validation.

Built the APCS IPC driver for ARM (multi_v7_defconfig) and arm64 (defconfig)
with Clang and W=1.

 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 39bc374300c3..e87373054d76 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -33,6 +33,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - qcom,mdm9607-apcs-kpss-global
               - qcom,msm8974-apcs-kpss-global
               - qcom,msm8976-apcs-kpss-global
           - const: qcom,msm8994-apcs-kpss-global

base-commit: 14af7a96afa39f4f3c1972705489b9ba15c01857
