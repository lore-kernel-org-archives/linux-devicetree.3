Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C242DFE6
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 07:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643401; cv=none; b=nVh9C1NM+C0EffAHhKrWXbwyHcWs2wvuT/TELMobxEKFcNV/zYyCu/zTmw2IGPZruYmGw4tdWlEFa17CvrR6pSV3AxB1OEzpjt9Dwe3stv3+SxUvClTRUS4N5zi3J8T75BBP/jjNfrZkGNsKINclbPzmr10btMEGin1Oeg698Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643401; c=relaxed/simple;
	bh=cli46i4g+ZWhHfmQnyctvXCYw7h17mfnw626tvQL2Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPH/QAN7cRpCc8m0j+KIpxqbVDKJbWXBjX0JxrNEmu+ZrPTclfWurD0z4Z9iuxGpXXvSkT5OewJt6fyq7kU64AElMIAtKOut/M62Xlh8wDl4zYW7jV3g8ramfezjGzcdy51SRW+K4a8LCoY2+x7mX0oopMxevJ+rI8BUWtnVLeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOQSVOA+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOQSVOA+"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1689898f8f.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 00:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643398; x=1781248198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWQkWARQy+nWOamGOOMfZhOPV4ti0QdK7fq4o+3I26Y=;
        b=AOQSVOA+0VS2n82UCRIZq99iRTn/IhIt+I8e+EQn1dO0oldKe0uUSJYDczg4UkGEQA
         VEqBUCzKM6rmlqxW+SBN5v9L6GmtwH8NR5+SQWINfwCTb211duRtMBeAtf7CT37bK0/h
         rAHFSy8gJUmrv+d0b/Uq/Qp3jltKX7sQX1ZYDGK7yLRJ0cOl91A6Zn15sPtOo0fcC+yl
         Tlu6tpPSlY/EaEfowef9ROe+g9xyaT/amyl+CAYnI23zRZxsBLccDWHns7c79kekRq8L
         9ZzlreWgXwPda8iHp/1eBGsFZIGacqqt8X9ZYO1Rw2hNh4B9CCdssPvAiC95on0lrbms
         jo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643398; x=1781248198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cWQkWARQy+nWOamGOOMfZhOPV4ti0QdK7fq4o+3I26Y=;
        b=Ue55R1J6EA/Dl17vcpPbL9lVIfgEOLbQ7/Z6k0UPjMmMPUGSxUKm1YXdsZ3KPyE7aG
         XznsHPOmH59uG5Oqz9pgTnVbbbSGCxPmAHmzg0/EXuosnPE4XOtTuUy9sydrHCoKEUMY
         gl2FwZynP6YIvkWaTlWFfopcM8dn3eB4u49js9B4YSJ9En8ZW4PhWQmMbbTLJgugn9/f
         RMO/cZdl5lPZNmVwEotnpYxY+i9JGaff3zOfbWgH23Kn8REoXY4ayyi6kYYP1IgFya40
         jGc2iui44O2k90HNm3sk86ekzlZ3CTenC3Pa5gy5FFKtXbTUUhpR5bSOsZOEvh19eQ5a
         1nvw==
X-Forwarded-Encrypted: i=1; AFNElJ9PhiwpzyjAz5DL2CU5yLiBbBFZb2rO5vndIi78omt6YyWlxSighzyoQoJxY5OIfmsYQdhSXF/7bnuf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/tGu7sNZzOtAIGNpustTpfGMdYjCiIZTvbA6/qj09RRAIM4C1
	evinbt3uT+nAjgJF1+/QM6DlTtxhEBxYfXUmduMhvUr5o0T+6OXn7LBu
X-Gm-Gg: Acq92OF2Zc/cTszoXvhM10MI3S7VIiRqizVJ5B5V/1HMylNf76CIG52nfJygp2Attey
	tsnxe7+bp7XrTTRK2IyT+3fQX8M6DTfGHj2F6vpJpMsVwK6ND351KPlnrjI7IW7yQlZcWCXRbIB
	REFKnxjSB8gF2AjtS/4w/btlMLz0W+ksINfkGZZH79FJAi8SFtIIibiDdUXjB7nzdw56MoVrE0a
	uHpainUzNE5APovL6pJaME268jJnnm228/Dp6v89AiT+/BJQhce8q8pMASvGR8K+aP6HvKsiZ15
	4KzJvKlgx3upIFOucZE6X5WQbl1D70fV2OREORoSg4HSCOS4t6+EjO7ycqqIXSkPQddt7Jzb+ax
	azHv9eKLgtwwPaIpaMWUM7/tKqH4+hYVuVKDG3whmb51xw0oqYe+F35UXkef62qdLhNPbwwXigl
	5DG0sLxWwOfFlp+pbN0WuTOZzD7WGfiJNCpeqf+hHYZAn8AIUFm8fZNTwlQ9dDfp9flINEpaJqc
	uQVNY9iwy2OrwTLekPmgw==
X-Received: by 2002:a05:6000:4802:b0:45e:f3b2:1228 with SMTP id ffacd0b85a97d-46032b611d3mr2196291f8f.3.1780643398206;
        Fri, 05 Jun 2026 00:09:58 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:09:57 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 1/7] arm64: defconfig: Enable Allwinner LRADC input driver
Date: Fri,  5 Jun 2026 09:09:15 +0200
Message-ID: <20260605070923.3045073-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Allwinner LRADC input driver as module to support buttons on Baijie
HelperBoard A133.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- no changes
v3:
- new patch

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 96ce783f24e7..faf6d86d0555 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -479,6 +479,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_GPIO_POLLED=m
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
+CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
-- 
2.54.0

