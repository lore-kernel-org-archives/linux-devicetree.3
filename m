Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5770D48CD49
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334362; cv=none; b=nWYXJgZUrpQRlymKMIixkP5WkFBDqBQKaA1jJSaw7q+R7J7ZeamygLYSPx3XUMAVwFV4hVFMBXqXMbK2CTzpNCjhQdgHxOSKpWkUVDSI37egQUj2wjjb/Lx5EeMZe6SKHSha21UV9okuOF1pZz+8AOVyAwvnqGq7t+NzQtbS/68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334362; c=relaxed/simple;
	bh=wgexWtwmMHg3QgOF1f3ejIjDcJWILEkmHrksZyC89b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LfuNQsqRsSUhBRTz4MW7r0lm/3OSYgPlSC8Q25sDWdR0HJZVo8hT5wRG6jJ6MZeV1z45NLkfp/+h0lX3ubahQDa3m0L39l55wtljNteFSI+5rtV+erJxn/qeo/uad3xqPiQVb32QCThOFfW/Gpxw9Vc5oWB3KrWCiND26is3muU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxSX3msh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxSX3msh"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f707e5d75so721879f8f.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334359; x=1785939159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xKo0PbduxVqaCMeHxby+gQYFixdrgfyKcUIaMfXcM0Q=;
        b=QxSX3mshC2nNUNGQYl3/8OIVmRHhfWkAUqVJ6i0n0qKcMiLqwT7MdSB/tWbszvtsNO
         cVYkBqy+qtDOz9/BjG4cm09FwGbFCW4TD6YQ9EXl4kPcDomOB6qmt+d56/sLF4psNl+N
         mcZmJbksXx9xNJBC4W31TvMsxpzh2rhZBMMKQLDen81aKabWmZbDEYc9Tm5n56moHhrd
         FxR/UX2CkBnD7bOdfKp8FzGYV7MrMTpLQbL06Tq6iv4p3N0tiV1/ES/Zm6tS8UBxQdLo
         yNNFPjO4aXzV3Rhl3zE8eSXejr8tPnQEGLuSWGZdfOeLoZJ3MIcRm4XLpPnGrTOR9k0t
         ulTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334359; x=1785939159;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKo0PbduxVqaCMeHxby+gQYFixdrgfyKcUIaMfXcM0Q=;
        b=IZeY2FyslG6UZvse0qw0r4d6M81hso/Ek/eSv2v9WflYadCpWst9PdrZ5HbqyzHV3K
         EtE27uFhKrsKP4lH7T+As5+gEYrnESM0FZcQ0U1TfaoLiKcUObGwWlTWM71kwo2ASVEY
         og9vOmyHzYudrMWmnUhIAag20o/JRzuuvUkvy+4JSbV9Gperw+DJKHXjFg5f/Qh7qxEs
         wv41IU4ndY7f+O/Rn5plMFf6HHwDRm7kABD+V3lY53FtMYWcCz24qkC3dAFEkBa1Uzzf
         hoq0tvr8/WPLdSUQhJLi0/qk/FEdpjKdmTg21VZTFJQBa4Tf7xMWc8hujpZnO3DSzJQT
         ywHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqe/k2dgIliSFWnQJ9pJzgeDYqM0cpBq9qMP9w1iLqidNn0Bo95r1t8h/nSRc/kFUYN8uiPZlJiBrIX@vger.kernel.org
X-Gm-Message-State: AOJu0YzVHP9QCGI3oJnlYjON+jGJEUNv15S/X9OL3Pp/OPMwXjWl2E2t
	cSF6GdRjyeBOLfgMikSaRnTEO7GBKKnWdD2vhPx+34TMq56s71vhKCiB
X-Gm-Gg: AR+sD13pYdT7gkJ7TjwgRgq7gumW+UMzVIyMxmG+VtpAOzkSpaWgmoIimTts2Vy5ekj
	HQE7vH4ZQhMuOaT3kc2wLNwLuoPyJTTdmQ8GIdJdFF3dKgjvsB9+yGiYiseOH18BSU6MUo+dkp0
	lS8VFrJ4ghxNiY2tKewMCJ7b8HqhJO83CzIrF73DLeYCb4ZvPS43p1+HxzWpc8HCPuF6IM4+akC
	tHqz9SaGjUt/B9cbK1BnFlr6MAWd/Tx5UDhZOM5/6LYi1zzLTmUIJ5NyVKhLhf93P1xZImlXgqi
	6LVbaei5RvxzSz9RS2MaOffG65zeLbfeAA60g8gK4Kvh8UGoPs79Y8hn0mkt5h5JC7i/pyyDgT1
	AGwkQFtbIteDn4d3QF05cvvk8/w1AKNIl8mQB/eARAmel0FYtWhRoapfxw9n0oXO4MkcrD+9OBr
	+abB+VzBBu41gp0BnxPQxLEP0DUeBsSkwkSP8BPf5TodXJVffU+YW8a2KFq9Cj/kAHj08wR/799
	wBKXXxJJjlofVhcXdNfVg5XUPaPFaME
X-Received: by 2002:a05:6000:4918:b0:47f:5a97:2a5d with SMTP id ffacd0b85a97d-47fb1e5cd25mr8567174f8f.11.1785334359421;
        Wed, 29 Jul 2026 07:12:39 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ad01b6sm8955482f8f.16.2026.07.29.07.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:12:39 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Wed, 29 Jul 2026 16:12:33 +0200
Message-ID: <20260729141234.65037-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729141234.65037-1-robazzalberto@gmail.com>
References: <20260729141234.65037-1-robazzalberto@gmail.com>
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC.

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0

