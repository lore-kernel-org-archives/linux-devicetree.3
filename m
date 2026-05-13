Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2383F3D666F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656814; cv=none; b=m1uyeFK88bhLslJwjamgHisQyceu07mvFueCSmjaYDIKV99uxCFCvQ8YISFqY3lq8nrWqCSlUy/qL41/AZTIeOxWubx2yLOxLHR0agGsITAavKYny+xaJkW3gFRkiRzho3YEo5oIevtwvQ01zYDJH5vK87Qp3rY0V4gQKdZwSQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656814; c=relaxed/simple;
	bh=E/3dwCOlGKS3Bh+L2ukpwWaK36HqCEJ6UVHUKxK4foM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C9kFoW4VmhJt4xHwskMwCUhwBdx5ocUSNBIrTZCYyMl3PbnhG7w2g4UNU8XNKiZGSrXm5DccHrmveG1hOwUk877tW8sJeCTkECiUXVgej3ThpCMor7VeRFfhhUIG94dYDVGKbsol9YiOigeqhtpp2+EULAmFcUUUjft0yGTsxwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNa3coOw; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNa3coOw"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso38576255e9.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656809; x=1779261609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syWeBTQoOGeqJPlWDI1VXqDojdsh0COwwri+Bm1MZY4=;
        b=jNa3coOwlUUVN+5MvOvoDQct7w76Wf/P8FecCNDyOZp2zETjJz/IOwt6ISMs7tP167
         2376jKog7dL2rPszFiA5gCKtR3JqwaGPm+spX1k71lSqtdZyryQFlUx4U1r6Gwcr+WSE
         cYZAdEvPuqhOqc+0k5DFg0QOvI/czeIjK/TvkogTJOn7jDimY8uteuF9lIwBiorzPilW
         aUYGcq4THODdn1D6vguKm2UdL7FMwuhHO2zpBXeyhe+VpEnxCSKsmi4rg3tMGM7fLq79
         JKfCX7H2eiC2/IH9pH4uRSCXacQNLyoZ0AiHobxin6MSNYBj2JS/BAQ2QZvMaQUGpjHJ
         XPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656809; x=1779261609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=syWeBTQoOGeqJPlWDI1VXqDojdsh0COwwri+Bm1MZY4=;
        b=QXidgmt4pzVAwHpxB89SdLRkza6rTSk3WNiBUj+H3Yb4foTFWeknDzzGoKy8iCM/56
         puUATf6gsTap3HJf/XheMQr/HA9qeIuzblVjrHZcZuPIcbEhkGj6wiSVSdtI99zMJcFD
         1F7trfa686jXxxH+/oVylJCzTyjwmyAfUoqqFDZwq03VcqP1dXP+GAVIZPrMNRYhY2Ev
         huqooDZR+aAsC09JPVZrnZ0Wqa4bypTNGD1IntyGZfMEO/giX4i7jbLFGM+xlmF648gp
         3CumuCWb0WgLO8M83GIZkGBG3OmseH1wk4FAExrlRFFsvUe9p+XFwHxV/ItB1XWtBmYB
         ZS9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/4V4v3Avo+LNwrR/qGmYGQnj9yYGcNmehm2ICflgOUH9eSWwk1U5OwEzXBKluGwuH3YDTv1wnjlSUU@vger.kernel.org
X-Gm-Message-State: AOJu0YxXtLF9fQZN0RCvLJ51Nw6W7wNeRDwvpYfi8yywr6TW0h3HHyCS
	LHkB0uhjfX46Ye9g5m1GPtJgNUcWQCnlirNcRKWEosWyGFR2TrwfAlIh
X-Gm-Gg: Acq92OHMBHlJQ/IOyC/eoE5hjzdY4j+vhXS64kdmMdMu0tpI1abcBuhR2RluDpPPhaw
	d/Xbv1j/lX96xkigic/00BSSpMsvM+7G4HliD4AeK5xaYCusihOAY9Y2mkLiHYoLtCdnVfd+/vj
	QFkTh8SWeIkR7JrQzyxP0u5Z01YhmXc0Lxm1X2f26Lv0fxVEHjMu4fIZiLs07wz5zOAIdVHt7CO
	Buy3iRYq9xtmWrdKLBF27+BdTPX5kep+ZiqU/TU0iIxAZ2bd4+ZXtuXYS+xhrTV2X2f8X9EoMMf
	BSEseqqehhlG4vyozwAiRWH4IXpI5Xz5zx9ys+JhqqG5yQJWv+ncCjgA4AgkPRaAjV7ZQYYzveY
	2cnVw7vM+u2CKahZ+wmwD1cEGatKYy2z/fNiOoNQDq2+Sc9N3hZdPni3cs7W1sU11vndmOC+yBE
	1DGF8nuS5VGCVpNyYtqNMrWJBlxJ1a+q7qr07+cAaYpPLNhVFOm2kOBx6tsQFWHDfXtQ==
X-Received: by 2002:a05:600c:3013:b0:48f:d1c0:5cd3 with SMTP id 5b1f17b1804b1-48fd1c05f08mr5439785e9.13.1778656809169;
        Wed, 13 May 2026 00:20:09 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:08 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
Date: Wed, 13 May 2026 09:19:54 +0200
Message-ID: <20260513071958.29574-7-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow serial output with the same uboot/opensbi settings so the
console works without providing a cmdline.

Signed-off-by: Andre Heider <a.heider@gmail.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 953c0ff6a0d34..ce7caf6950dc0 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -22,7 +22,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
-- 
2.53.0

