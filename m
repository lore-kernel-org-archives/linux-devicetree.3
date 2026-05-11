Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD1A3FE356
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510507; cv=none; b=Lf3bnpRk/1Nj4hKjrsvqoCk3h1bXfYUOHIGW5N6vOWgVgpRTtfs50Yo7EfQ6oLqSg6O+4wlDdlvWXjVjOv8w2m2aINF4jtxCpjwHnlnw18S4jSEs9h9/THmR9StRV9Oya4GLzXNq4sTYhtDEmTgUJSlxUnZqRwV2eoRth3ZWBD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510507; c=relaxed/simple;
	bh=aVdFf5OymMVSZ4KFTnooyC2hd0qHH4hvBzmghV4dLpk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAlTSgRvngi2+puvzOPn44BPLudj3v7VKwFuBjB9emn6fUmjmUxpOpPidQMLlAw2BtKrml/M3zirb263RjfBbwvbfvjGP5GTLvVBZK9GcYnCv1flOCYgtfgeNP8uvRwXVoxpzz97HPRpVSkmukjNQR2iOtvoXgSaIYLCmWsNugY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGxH4adg; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGxH4adg"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-836ebdeb969so2005585b3a.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778510506; x=1779115306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uA3KbxtyArVx1TPayII+4ue5MWymrrbmptjetuH5M+E=;
        b=KGxH4adg83MZuJq/arI8rz62bNPUScyI1LOefuM1ijs5aohdnzF2jUUlB0LaHT6kvV
         i7qINxjniLspDwaNxMqKpq8n4WZLw4V3Y7IzahB4b9Bfo1PkLRICNG+Ts1t9Y3nn8nLW
         hLJfYJnDXFsY+Awe5qe7HJIWWuxSgPbKLfU6L6FJjrpXf1odQ4X7zxXkMqPbb+h6XhWA
         VZmhL+bNa4QrQE5yokRdb7A6N9r3sFrUOSrCdolKW/aJby0JqwCvGeWNut+/3TnVu9RC
         jJLXTX6BfeSyDh7w15TcVMI6qnE1OZohtekzE5VWyMZ/0bUlAQp/dtfvMdc7luIZmBuv
         2eNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510506; x=1779115306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uA3KbxtyArVx1TPayII+4ue5MWymrrbmptjetuH5M+E=;
        b=kecGb+QDlU9iXLAWIhGDL2xDETAzNDPgqJgOdPGAS5FK4WIEoto4qdEMMDpaOnffWl
         p47rDndaZn9k/fG4MpAqh2YYu5lDAbiPJiaC7+gpXSK2ysOG+sN2tmVriTLaQ9By1ryb
         wrpWwiunuIGmUI+hY3inMgke8wYJPkcoVPBbbDHk4cOGX9PolKSQ/ayzZT+oAkDIKtAb
         0d7hetYZuN1ONoMHCGB03ZYPs0R0YQeDixt2EpwL0mmpKtcI0TpMoYWUdRm358iaSVQV
         BGLNFkffbEcy3o71q+pBgNqzAsnjnzWs7Ifsv8AXxeTn+YDVg6D6YzzGk+znI4YnDQqn
         eppQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Z0Zzjng8T4WotEcQiKb0Xn32rggWZeKmuClu0m2fiTc4EbIRLduKaDIVf9S68cumNm3q0FrnpvZ44@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0fQPhpMnqcNHh7Z9S2jt1pzLF9avvU0PxGboY6BZUVl5aT4U
	9xjsLcwqvEWykVY3Iz24LMra7X3KG8jrZzAktVnxUxng4iQ9kszwPNL+
X-Gm-Gg: Acq92OGRWm8eDHnJFYyRlcWBBbRXEsGvHOCmOxmUgtHvZozS5RRetgj4cmUw8LlSpY+
	3uP18hkvBbpTan0OZRtPWsx8jTjgB2+Dhan2fDdCDWcCtsNBzbjofi2WWBOgDWAGNyDfVMLQI/q
	Qzn3z/UFB0gatEVCH6oxBPm8o0QioJxDkmxlcnXxDkQwst5OWC7NCGcfXnHHpeoFeBUebtRQw07
	N1Bb813TnFaNq6kHi7zkpPjXwMWuwF7aVqGgsSIO67ECjDCm2juzbOiL2U9AncLE13qXeuO0pOw
	6xHlSmTZq1RwOvKfICA4lwyeXFwPWTMJUrkxB3x2EURM0gDe3CqEhRa/ht6Gx1pbIZNI+DiiwVv
	aYR5mYZSKR2U191KQvWOkiHqOhpy4qZ/g0OPdNLv28Ie9kW+2M4nDZT9C67uOmaE4WaefIwhmHf
	ToNvIMO4znf5Aj5E7LkAz81AZCm3RvWe0owGp6jXcIYJTUz6yrt/pjwv3zZnX2ICHdrw8XC/jnx
	/0U8AC3JA7FYExn33P98VFk
X-Received: by 2002:a05:6a00:10d5:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-83a5b9d79fdmr22094560b3a.15.1778510505535;
        Mon, 11 May 2026 07:41:45 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm26012405b3a.3.2026.05.11.07.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:41:45 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/8] dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in
Date: Tue, 12 May 2026 00:40:50 +1000
Message-ID: <627a1e2506fbed99e971250dbba64902af54232c.1778498477.git.harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
References: <cover.1778498477.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible string for the Microsoft Surface Pro
12-inch, 1st Edition with Snapdragon, based on the Qualcomm X1P42100
SoC.

Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..aaa9a129908a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1168,6 +1168,10 @@ properties:
           - const: microsoft,denali
           - const: qcom,x1e80100
 
+      - items:
+          - const: microsoft,surface-pro-12in
+          - const: qcom,x1p42100
+
       - items:
           - enum:
               - qcom,purwa-iot-evk
-- 
2.53.0

