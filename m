Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910B93C455C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194159; cv=none; b=rkj4A+a8C3lbqkdaApMUVKmSm9hYmEYRLSbwJbOWSMngd5tplyNz+avOzF13LDfBDU1d0G7XBeHDNxXO/TcJvrFBR5eDXeePkHwoXyEmGq5cIarWNJME2GmB03ialMYCtpgYSwy1bmt0lzSV4q1I8mQCMF6bM+hnLzsVL9otSIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194159; c=relaxed/simple;
	bh=WedjYbcczku9Hlx5GDR7luh0MaQCn71vs14QpiIEXY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mqXETaJn06Cr9esmIjcttvJEiLd8y8aHAMg9CXLnscancRhe2bZ/QHN3iPvADUrdzIqclpUU/gtbEi1V3iC9cWUplZr7XSsaLXr7/kk9U9i2lC8VaF9xHhzM6kTulMWOcuKL89DHOOtW3OtagqaKYE+76dA9q12j/zLI9Fq8tY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y02goKX7; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y02goKX7"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6682b598e77so281361d50.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784194157; x=1784798957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7bEKQGHUgc4QA8xdZ13jzbjLw4qQ92cli3uju/L+EgQ=;
        b=Y02goKX78QoPxHhyq2lMGNAesKsDXdrpHIly5NlnfnBaYgvENZkZ04hVb+QXwEugcJ
         +eiijOhqbtYQinBDIpAd8tZLsg7IluhUV2k/sz/CrSZf4mpgWDwMGqHkKlCIihUUb61m
         4/2mKvflyyEqpzZy3jRUQ5D/AJqHUULW7wmMguQSu6qpVSj8XFZ6WTciNdApDtGnC80G
         XUy2AWFGRFsq4j86NylnnCGQ94m2hrfmhh86DhXiXu1/Dumv+zcNn0dBreeX+zY1fB5g
         ykUJKmzHgofaCVwJtC7a+CQd4NCyzSGsqZaPirWfXU5JllijAP9mSwUY+B/MoHZCsl5a
         GM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194157; x=1784798957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7bEKQGHUgc4QA8xdZ13jzbjLw4qQ92cli3uju/L+EgQ=;
        b=cXMh8/XMeO9IdVJXHoaUpb1BKY9EfL/7VJSOm6DhglAQZiqT0u1VgM4sxQhtHCa5B5
         lOgcX+6ydxYodQvp2zoamyeQnnlKwcSmiWpqs2PAQ2wkgZTZOpG9AbtDXxyEsY01wXLr
         WOEfDNn7vNcDZkW94XOV0UYiH1r/9js1DCDdyklqAaakKBWMWHgscB29orjSmBytsM4D
         EbP50FiDN6G8PqiWpcdUGgf+Tw1aWMhFkW2mS7L9g22hzyiuPYJ0wFZaJCcBIOxMoGN9
         bfKRB7eERZmhwXy2pZp23hjauFxV6/v1sVlR6Ro5uLc2ijDOifuNUqWaRXXbcoivrNM+
         EscA==
X-Gm-Message-State: AOJu0Yxh7J7q+nSkzpoIf5ajiQqxHD7WoJeGDNdM8GOqoMxQESqbzNlz
	8eHjDCQNevy1HMakCjkEDEGMrA/yQjx74c6Dr5FCyyFpTbuz+PDj9GOg
X-Gm-Gg: AfdE7ckGgH3XlE0JDzTmwc39k0AcZtS98VLmZbenegsPP2sGoEgrsgyZrLKKKqh9Sra
	7pEEecXoaBBrWPX+607yQogPAn02gXJ9PLYp9c6Rq74pmfPA2BqwkLw3NCn395oE7a/EBnMy5Sa
	6VqqrnMFUv0HWQfNaF/cSkAr91zAXf/VTU4d6NKPDhuka6LvlA/mgMWIV2FQBxK7DMCuMNoHEp9
	bLqJuK53H+aaqbtpGaSQmbcZTmEBxjoYRi5FkvSgvAq6XqX1EuZ3X2Mry/AdWW9A0QRNi7IV8Ch
	DZ+MSjCuaOibwczd+I4l0kSUFfEwp2RqUDCXzrXjrgLtSBL/2aOw2rVpMQKcRv56ZanyvDCqY3f
	cYYd+gGCjsVYvWtRnngsHZnOHpzZ+8lisquhJP1ZrOUBfT9MxsAJF1Cl86T0pmXi6P6rU33vm9n
	vvBEb7NeVSXQ==
X-Received: by 2002:a53:c053:0:20b0:667:8b90:2eb8 with SMTP id 956f58d0204a3-667d7f48184mr12002616d50.87.1784194157327;
        Thu, 16 Jul 2026 02:29:17 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e950567eesm130241807b3.13.2026.07.16.02.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:29:16 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 0/2] Add support for Vicharak Vaaman board 
Date: Thu, 16 Jul 2026 14:58:57 +0530
Message-ID: <20260716092859.512306-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Vicharak Vaaman, an
RK3399-based single-board computer.

Patch 1 documents the "vicharak,vaaman" compatible string in the
Rockchip arm bindings.

Patch 2 adds the board devicetree, enabling the RK808 PMIC with
SYR827/SYR828 CPU-big/GPU regulators, Mali GPU, Gigabit Ethernet,
eMMC, microSD, SARADC/TSADC, and UART2 console.

Tested by booting to a userspace shell over serial and verifying
eMMC/microSD storage and Ethernet.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman board
  arm64: dts: rockchip: Add Vicharak Vaaman board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3399-vicharak-vaaman.dts   | 438 ++++++++++++++++++
 3 files changed, 444 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts

-- 
2.47.3

