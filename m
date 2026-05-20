Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171093DA7E0
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275575; cv=none; b=pHGmMeiRlk2OA66Si2ui8tIQ8i9kJRVK+XY8s7cZMNXQ8k3QHDchXHEC+uQrWfm4yY9eTSBpF+T+k7foDSxnLdRzNOCe4RIi6BL2DJdqbKaHtb9c1hynYwD/156NHscrnhAaTVfFfFlYp+W/ZKTVNTQ2M8kde7nFy2X37WfS9yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275575; c=relaxed/simple;
	bh=/5mZ4vEYwygrUeR+eebBg7UtHWLg/gMI2VfnFbye610=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lypqiXAwmbOrYjQa/3O3/Cm6RUOBFxPrj3J9NYBm4YB7YMR0UsdvP5c8W0890wL1c5wFd1YarUXCKvsJcYIRogfRYQUern2QJYr/IWqSRheagGXdWYX4eoFoeywdRz8E/e4LxNGzpMPvA/pHx4OlLbEAbAyO6uPd1hyKPpAwBWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TT+3S/0C; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BvMOqBxt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TT+3S/0C";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BvMOqBxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779275572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PqGQtbCak1DjkDn83NNdBzK9LLbqEMF51G2q8Su3L7g=;
	b=TT+3S/0CRaSAdZyVwJOZni3tAUCNkqhu/orzmhmKbl2IumiG4U1p7GwWxQqeNjQxpaXFzj
	82qOeVc4WJYOSb8cn3LY2+9wXo9GHG4v+O2uS1CGxehthsA5d6f1HKa15lgoQTKyUyTNHT
	1Kzof/4710LzuBAHL5hHCTSd1n23p+g=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-zNGl0Ck2OF6nHTpKFVuA3Q-1; Wed, 20 May 2026 07:12:50 -0400
X-MC-Unique: zNGl0Ck2OF6nHTpKFVuA3Q-1
X-Mimecast-MFC-AGG-ID: zNGl0Ck2OF6nHTpKFVuA3Q_1779275570
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5104b861649so194865661cf.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779275570; x=1779880370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PqGQtbCak1DjkDn83NNdBzK9LLbqEMF51G2q8Su3L7g=;
        b=BvMOqBxtf+l/AzXLS9rbjvyeB+DT+bcEIapRBAnSECW00LjqTRhh/usj696FIQ7W2t
         GjFx437q6upbq/NbxDcKuzUfYgW3Vk9wvn5zuaB40DPEd1w+QL+DHTkOkBt3WYV6Biyp
         iXYqgbgy1Tv/3anfIxvRCLlpHPOKiiv+0yDHlEfyqydmVnNNvmCWupT4OiFW2RjIfXJo
         6W+DEDBo1FOlZF2AaoC81rJ7W6rwUX3zSzMjwqXHZZOVdWuK8Z306TYXbgFMgkpaeeqr
         a1zaBxZ+uOUHUpf5cxGL6JXSJPuIGpa+mT8Fy31l0//TnGbd0MzHNdtxkkzK5WEtqMO1
         kicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779275570; x=1779880370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqGQtbCak1DjkDn83NNdBzK9LLbqEMF51G2q8Su3L7g=;
        b=ofI5aJ5ZfCmK2mo3Acnu+defKNQyMCHZxomOR7lM8TqzZ7I49IjVXHx0KY++cP1h1q
         nXidULsNvNegWPvc6z3EaQ6KoeXvhnr5Zp+kHEzunhblPxe+LX+uzLGPvuu3G5AKdQWh
         PF2XPgXOR0edW6k1nsxuRMt4ZDd10slA+GL2K/PE12/a7NpbZZpbMm9reCFw6Z+rM/71
         f4Cb0k2Xex4WqOxYiwQIHEvpbgKatz0TkWjCAUh8nuq/Y8Abg7dcjGf8dWA6FNKb1rHg
         DolXLSlOb3XO/y85y6p/x1aiI4jfcp/v51Z+L9o93DywvnPmkZjit5+4mp8Slnyu8kWK
         g+Mg==
X-Forwarded-Encrypted: i=1; AFNElJ9zE0hWcQnWZpCjhuYbW5rcWGg0P7yo35n5d63SzmtnntI2YCcVgX7KZezU7NA6/49mzWfkDRx1TicO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd1ONd5BjUFzB+lx+VO7yz0ZnhdjjG7g5hJNsupHixm64ijZTJ
	aGgUX4xMD19hB57VdAw9wHoy4TAnKSSWCz/UgZhlBjAacQMeRu7z9ORznK0P+0vBcEHUltNMVbp
	gDdiu96E3PRohFsjlOtSMYqbm3BZY6Uq//z3Y/vr4+864bvYeUZFOLbv+kcdsXz0=
X-Gm-Gg: Acq92OH18MmnSREblby0u584bfJuqB6alO6pcia5BJk4QV6VKfBfPtk+x139bSxJrKH
	WnfIdM0RnPpW0ge/eksuNxeMGBFQG1x9nZl2sIJLOuzGsZk67aMOUKbpIqhd/RE1Z6gCSsaF8Ay
	yx0otyTSaRK0RhLC6HXKlNvfDPQ7Xl5BGzozDOk/OzIA+F/ZQkxfOTKKgBtT3UkOXkDpTIBzpVH
	H2C32DFqs6BLwxboxIbedSwEKXvO5Wu9oNW3gZ1eRnQMcz+PLMlR2odaQBz6mjKMftTs3FR/CJi
	HimZ4sMUjpL95WTW+qaDWLkFjCym/nM7eT5G3msJP1TDMkjPZdxP+iAujb8huQay122LiVbkZd9
	du+h/rDGpe0P8
X-Received: by 2002:a05:622a:489b:b0:50f:bdc1:3bbc with SMTP id d75a77b69052e-5165a1e3c7cmr308794361cf.45.1779275570360;
        Wed, 20 May 2026 04:12:50 -0700 (PDT)
X-Received: by 2002:a05:622a:489b:b0:50f:bdc1:3bbc with SMTP id d75a77b69052e-5165a1e3c7cmr308793991cf.45.1779275569917;
        Wed, 20 May 2026 04:12:49 -0700 (PDT)
Received: from rhdev.redhat.com ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca360979c2sm119479176d6.18.2026.05.20.04.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:12:49 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH] riscv: dts: spacemit: set console baud rate on OrangePi RV2
Date: Wed, 20 May 2026 07:11:50 -0400
Message-ID: <20260520111150.3300707-1-jberring@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the baud rate to 115200, matching what is used by U-Boot on this
platform so that the console is usable even when console options are not
specified in cmdline.

Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board device tree")
Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7c49bce427f30..07dbd292eee33 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -22,7 +22,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	pcie_vcc3v3: regulator-pcie-vcc3v3 {

base-commit: e2518e8cb1dde64af2d1bb246639bb7ef7523f7a
-- 
2.53.0

