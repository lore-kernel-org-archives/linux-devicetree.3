Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C9B35DA4C
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426168; cv=none; b=kCErsSp0Cj+ohcCQtXmFLEK00BqksAzHEPKO9efi/hkLno1I4OKhmMfx2IEULhuDiw+4eoaz0duu1ZmGJOtYpMPTKKDOZDCpcB80VL6CL6Mi59zLDS7OVf01HKwp3143wTyx42a5iniBFUONBaC9/p2j9Uk+Etjn1zcOiDf5Ytc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426168; c=relaxed/simple;
	bh=m6BsFNYPJXLrBc7M3UqW63oYvoO7GXOCslzkSLEcFco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S3heMQllerw8d+avPt5ssMYbWwvw3v4Ig345fwALDK7C8xmPvhTjXo54JSH0TA81btt4xAUGp6X01YK1exMllMyjgwfhId+yXRp4V8QvDagkZ1c2wXuhu8kEgt7kzyP25kdq7zN1SmO1XBhsKbx03ex3C4VJYZNUDZ9kjcDRlIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyGwe4Sw; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyGwe4Sw"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so655792e87.2
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 04:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426165; x=1777030965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLdo2H6NxgwWwn5lBU5hwxF/LxLv45z/NMU53uF3AMw=;
        b=EyGwe4Sw4bBq+wMZYeu/VWXhlarSvOzzDwAYF5IPsCAyZ7rB+YR1Z8p6KRoeVDEQec
         8Z5ak0MKUgqVtHuLx5Ke8Kj75e72qgTl4mJwvsvIvC0BfQTzkvkQVGtwCTyC4j+OdNkB
         kT7bxH0fji7uSjvXE7xfDnpnBjIorYpHwQ+UzdPsUfClHFrQDySt5tOhtnd0YHQ8/FoR
         9NMjBK3hDz/DbqEx1fBkEqJqGpy+i02L+W3NQZN/2QG1K7J69POjQ5M4mr+11C7AXoEg
         0BgyV6C9XVm9bt3Qxw+kOkyrjemx+5lJSdulLhJ9X3SSX3jDXSOWMeDtlzt3hDpw+WGv
         XBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426165; x=1777030965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLdo2H6NxgwWwn5lBU5hwxF/LxLv45z/NMU53uF3AMw=;
        b=fier70QH9Q3ywZtnLE0niM6MyY/nNj55Mb+e6iaMuP0/ycFdP0QBRU05nLuCKmS1kU
         b9FL0kMgsqWnksf+6tdANxmVA1i6oMmBW1kJtaM2BwxgSZUTeoG4JwarrUK6Mbzpi7Uk
         PoNKB5mVT9L5a7nRrQw0q/t40OlppmR3pA+1VYCvOyqSZP9oUt+1YLeCorGEYURpCH48
         dWT+SEjXWJRQQ5f7jZQtiITXDNYznMTjVsS8Fo4RM4VtcWO7lZ+mmeh1tlWtXpt5IUJu
         QsFLYz+7HU/stP1Z8pP9zLReYFJc0VWLQwE9z9s80+pU9oX+sDEJJ7bQ80lXGlLPLNVw
         +G8A==
X-Forwarded-Encrypted: i=1; AFNElJ/Xm62OEiMGxtw/U07kNgIZAu0tdg3KDejQmWAdWBJUOFVdOnlAAeiPFzaTA7v7AZssnNrYiu6DYts6@vger.kernel.org
X-Gm-Message-State: AOJu0YzoMQtFf1ppDkgKrmPN/rxR6jzjhwfttKo4KWyTtv2afXQ/I1jA
	B4BTjKmmuc7YVAw7F8tG7g28X2DH6JGApPoPyNm+WVpsH/nIwWLBy3Ry
X-Gm-Gg: AeBDieucdNB3mBIKeiMZm5QGW1dz3ASHtagEFd5iZW/0qiBoAQnB8lpDfht2QW/7Rwl
	x5pRMvGQKgM0EwYg5Hr8EQyzUlGvPmNunyOBMiMlZoMNaHhnwAdE3WEgPGdAdfGKjcA6Q5vpUxo
	zT+dKpqEyvUokGKBlzbNBPkBxFZTyD7BPiKFjeVifJLk3tmr23GKJiuPPnI07+3Q9Zgko/ypMCh
	O6OejqxjGN3mXSHIDBNluOIVdKLkLdJQilkIaS95jNX20ZiNnWDxB8wzOfilHjpTEMCb6kQrwWE
	MhRg59pPtkPsclm29npEt0cUdefVCkyFoz/MjqVQbqbH5vplL/hEB8sICsDzeHLvCA9ixqtl/jx
	aQUQuKoQbR8pJHyDersm62T/vzT80G+KlH3qVkUzMltAOrZALGlgOWDiPCiZF2pv29aMVNez3iY
	9R7frxH6Hp+gUzINJLMLPbGlU=
X-Received: by 2002:a05:6512:31d6:b0:5a3:f309:47e4 with SMTP id 2adb3069b0e04-5a4172eeb12mr744644e87.32.1776426164792;
        Fri, 17 Apr 2026 04:42:44 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 0/5] media: lm3560: convert to use OF bindings
Date: Fri, 17 Apr 2026 14:42:21 +0300
Message-ID: <20260417114226.100033-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
Remove platform data and switch to OF device tree bindings.

Svyatoslav Ryhel (5):
  media: lm3560: Add HWEN pin support
  media: lm3560: Add IN supply support
  media: lm3560: Fix v4l2 subdev registration
  media: lm3560: convert to use OF bindings
  dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 134 +++++++++++++++++
 drivers/media/i2c/lm3560.c                    | 139 ++++++++++++++----
 include/media/i2c/lm3560.h                    |  15 --
 3 files changed, 243 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

-- 
2.51.0

