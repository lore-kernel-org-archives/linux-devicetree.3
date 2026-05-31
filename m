Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4AB33AD99
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219778; cv=none; b=JxWZHQ/7StWtQUrqqZRn43OlPbGcTDvFXAZpQzGvNymZITtywhjGpvBGrIbXvtq+KoYHjlGJSq/LQmqJsBiL+QkIGzI2d38vzWpeNlKHyMIYiMYzHZICGmamwtS1CQyvraOOLyvgBK2loctxMFPeNZfLbVhynOvycIcinDzePWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219778; c=relaxed/simple;
	bh=NSsCLxA9XIus0FBPdWSRkAf9rfESaDpSLkuqckRIxMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZVGMju8UxFQFya9Qer9Bj5rmvWVbuaJkpWT4YOEOeB2Hr/cCT78M6NFLfHs3tl7ZJxP7CbnfsMQs1+NejRygYntDIcNRM0Sqlb24pyBDs+V+b7s99wOY/lepeoisaOk7dyw6Lq87BpvmwYTgGwiE3cSs5iPt/CMEkWryLppUcp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUOvIf2T; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUOvIf2T"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ee1a56328so3527072f8f.3
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780219776; x=1780824576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Grrz7Uwuag8ALYv5V52HPJq45H3NjslcBVbddawkh3Y=;
        b=nUOvIf2TrZPqq7bkvrEoVUtx+8FLtTGEa5ySbCCwBL0u71Jmi7OpaUkCGhpwovp2q8
         hMh0M0p0Sr58sCEPR8gL4c1UujCuJ9cqcg39XpGj2lwn3P6wyJztiqCW3bP3Rzl644RP
         hdHfw1+/3RLnW5Fp89C14tvjNLOyUeQOMNLrI5dkF6bFl9Ks4DgvlWv8QwvDhWmXtXCY
         yZrs51GripPcmMOOkWWiAEPIsidnUD9pYPsLzxgDJgL1LFTRBdvc1iJ4FUrnRtX/7Gt9
         DhJOCBEn86h9Y3CkS7km60YFBAWbF8rsgr5/1hzjJ5l2uOkmn/UojuXQsdTiOMyOBqHV
         8yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780219776; x=1780824576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Grrz7Uwuag8ALYv5V52HPJq45H3NjslcBVbddawkh3Y=;
        b=NAXwk3ZsM+ZOWIP7eO0FHnteEjGjspy/K8frxrIP6vHEulirRwjO/W67GU59jSmQNv
         G6x8l2u9MhSy4zkir2tRO7wLUBztwvmiLXmY6IAsffq5QUqTzuluenFZNrjcAUexiqtH
         p0bNR2tOwLU8S3Mz2E+0W/Om60aH+CIRaYB4Z+NIKYGqBhX5P7FpCJMi+KMNlAVQ76P8
         +64SIe46InBWOGcxSXJ+SnkUTWI+Ok0nCWynTM0MbS+/ZZ/dbe7n4hzjevgbA+50AE/0
         E44GWJQqxQFk7v8UrpITS91t+K8n/o4uwVdoo2OjuIf/BiqphR1Vs3yxKsjvR/TE1xW3
         xe0w==
X-Forwarded-Encrypted: i=1; AFNElJ85aCc0LzCLGil0YokJ5dNZvIm2d1rIZ3eJDnPcS1K4iMwGK6Dcdow6fZTGAlQCz+2RlkhH8mDdSHgk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/JehfVLctdD3uAA9JKdAcGlijn/motbdwID/IoAeyoIKSScHJ
	mvUA8LqGVmbpUKULUrb4x73v6w+Rjv3wOZOol8dYdVBN48Xb3tNqju0t
X-Gm-Gg: Acq92OHGttVv2FldEt8PKcIbKDRo2eJtiVhxeEZJFt9oyvH4/rzKzzCPpzdoc20Bs2A
	9LCUXVdxXrC/+d2+VIbDLIZ6Hc2GNHC/JXWiNLZBJhZKyjlV60gAnA8qFHzQLNZCHHlGeJd+ytf
	AGjCPcLuYpIp2kXGRSHYH4gzqXk31AaeASXgheo+MsyyF13TDd272tw8qH9lkxjEyKD/Ecc2vXk
	+X2s26lv+fR45jxbutfjQWMr7R8PbAoVvzBgXqJCcvSk/nxQhLh5ezL38MUenp6m0mj/+K7sJnq
	549Y22DMxt8HkXhseLiPvYiX2ZPEoequADd0KEXO/g0erNg0oIokv/aEaFduruBi1msO832gKx5
	iu3kBC/oBsQQlmWqjTPYETGCk6t8sqslxX0UWQ0mYcaBo2IvDSXwXeatkP5OWkzD9M320D9iYts
	/AtPFBkBuvet5pcZEnHmp8dqQ=
X-Received: by 2002:a05:6000:4a1a:b0:45e:f381:cd8c with SMTP id ffacd0b85a97d-45ef6b72910mr11175999f8f.30.1780219775622;
        Sun, 31 May 2026 02:29:35 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a03f8sm17671313f8f.7.2026.05.31.02.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 02:29:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1 RESEND] dt-bindings: media: mt9m114: document common video device properties
Date: Sun, 31 May 2026 12:29:22 +0300
Message-ID: <20260531092924.12929-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document common video interface device properties, such as rotation and
orientation.

Svyatoslav Ryhel (1):
  dt-bindings: media: mt9m114: document common video device properties

 .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.51.0

