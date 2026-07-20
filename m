Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E704738E8CA
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 05:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784525843; cv=none; b=nzBcCxpLKoqXf5PI7N1DJ11ZM/sLIicdkAhsAAvKi/MsdD8C9fLiTfWr71vFliwDiRboY4ImBxz5m+6/Zti9VSQQsep2qsdo8rNmYVO23yXuYmkrFBPMKWTwytFLpxFtuXa4T/umQ7Cn8AmbNTRdZPf3XspxHbiDH7mLuiH7rZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784525843; c=relaxed/simple;
	bh=0aJDId9vo3SAfdsSfHDD0XI9HKsmUImAI1ehztnPxG8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ltCPYP+u+UW+p2IuYC6QutQBx6M1JM8XDKAhy9/ufPNS3TR7UFOJYlg7ANYz0cgd7wGuhwetmgL/PwDlkNC/qUEuOsiP/4NnXw8xW0fnZokzYBKvaBHjqaam9CcjBb+CcQXp/dq3pSASDF1lrbKSqBhRGc5lgCnFqfxplmJFiK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rgH6FCVC; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rgH6FCVC"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so4072202a12.1
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 22:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784525841; x=1785130641; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R8dZOeWZ4QzXx1G8tKCpK6OKK6m4eWHKLk5KGtNIMNU=;
        b=rgH6FCVCa8vXkskoY/B8a0//Vh+BLqsgA3Qbu5dm600Dp1CtUOeBl5rNOcCupNehsO
         N7BW9jdJtrhiZWVhLNKQbJ2xBwKPn2ZeNh6ix1ZR2KivcsthZPvaRYMtyBgGmXOoyL+V
         UMv9NHKeReCDKDt+NHLPjW0Ij40+hwPB+hplJDPEFvF9UDeq+AflVw8FGjcEr1G679QG
         uIZKsSHham1Oaan+xg0j8LtP3syu6o9tzLpEozZX6DK8jMKh8iTiuDk2GrZf64jVjn6o
         D8gdSnVvH8Dmk/MCUb4DGzXaYvJKGV9rJVWUmcROUELgC946aSum/yp4p4yn3wf4Hi1T
         ExqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784525841; x=1785130641;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R8dZOeWZ4QzXx1G8tKCpK6OKK6m4eWHKLk5KGtNIMNU=;
        b=i4VdhZAnayPHQEadgiYTV8DhVQ1XLSF7/lJww0tmETmk+ajvueQ2Q+WB82dKBBapbZ
         16o49HgDl5v+G2LBDtWeSEDnu3VRNNTXdRij0Fe/yz0P+IAc+FFQzkTyrcc45qdrOwnU
         Xdol4DNOGhsVk+9DtrrjWRDz4JtSlikTwUXJ8qfalJioXexw0MrlYm74N84YYPs7u29d
         IFomG/1XjlNKoFTEc+SNexNYY/5R7zgVD/Fec7gEknUgYq0cAiGMTRFyvDABWki6jmQ+
         YeVjCUUIRP7wIaVp0KlXTo378D8Oxka5EnQQTvRZADq7zeKVQYxWx8AeZwyqV7JGCKb7
         F7nQ==
X-Gm-Message-State: AOJu0YwCNP9rxRfqErBbYcxoe4Bb3Usv+SmryltD7lFWNgfdcFSs/Vo+
	dJkwiHiI2o/TGw96ChIa0TUwU6MTtK1jFPR61WdRRf/EfDJTqGP+lS8S
X-Gm-Gg: AfdE7ck4/quosT0zSeygx3fjwLIpjkW7AukAEy6YyRQBoz8BBI2zJ5f+97/BCPWVerv
	g/A+gjKT2Z8enboFCD0p1KsyZufnzVmNTCqQL2l9dNTtWet8lZO6MMSJNmfpCu6S3tL/gNmA2AR
	T05h/2djaH9l+RC+bVhgofIlzu+f6UhmgKFOA+EX2j35xMJAynVc9yozlpnOuOeMFV9W1aHgT27
	FYypsTG8Er904wh3q1uhD/zaR0cXR5K96wBQINDBZMxUyx31yMXcjEwcdpMOG89XsBpBNd8JDPc
	YQVsgkxYcNRoniwlN5Q/0XtJa2kJZj641kgSN5Y4Evq+onQaJFrxWRamcFYbwy2gbzUmisxUgVv
	Hv7kEcM7jY+qaelJZLTKkwXUzus45Eu5oBWo1U3d386GSUNzqnKiMcPP7Fc5vNw23M88CN8LUd/
	MWoWo0lA8+NsuRQggYAmKte74pqo1BRhb57uHwfErT5GkLZZNWpjT6gKlu1Kh2lFfJMQ==
X-Received: by 2002:a05:6a21:7a46:b0:3bf:6237:4d49 with SMTP id adf61e73a8af0-3c3ad7aa051mr14685620637.23.1784525841254;
        Sun, 19 Jul 2026 22:37:21 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:345f:e51b:3d0c:4546])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20cfe3sm34224663eec.30.2026.07.19.22.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 22:37:19 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/3] powerpc: 512x: Convert ADS7845 touchscreen on
 PDM360NG to device tree
Date: Sun, 19 Jul 2026 22:37:15 -0700
Message-Id: <20260719-ads7846-pdm360ng-v2-0-1198bd108502@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAu0XWoC/2WNwQ6CMBAFf4Xs2Zq2CK2c/A/DobZbWCOFtEg0h
 H8XMJ48TjJv3gwJI2GCKpsh4kSJ+rCCPGRgWxMaZORWBsllyZVQzLik9Klkg+vykoeGoVXozl5
 JryWssyGip9eevNZfTs/bHe24dTajpTT28b1/TmLzfnn9n58E48znQntdWGcKdWk6Q4+j7Tuol
 2X5AAvNLP3CAAAA
X-Change-ID: 20260717-ads7846-pdm360ng-ec7ed9f72f82
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

The reason for this series is to remove support for platform data in the
ads7846 touchscreen driver, as pdm360ng is the last user of legacy
platform data in the kernel for this driver.

This series converts the ADS7845 touchscreen on the PDM360NG board to use
Device Tree bindings instead of legacy platform data callbacks:

- Move GPIO controller capabilities into mpc5121.dtsi so all MPC5121
  boards inherit proper controller definitions, and remove redundant
  local declarations from ac14xx.dts

- Update pdm360ng.dts to use "ti,ads7845" with pendown-gpio and
  interrupt-parent referencing gpio_pic

- Add "ifm,pdm360ng" to mpc512x_generic.c and delete obsolete
  pdm360ng.c.

This change has been discussed in '24 but I just got around to
implementing this:

https://lore.kernel.org/r/ZoNHLjmSvCN12vU5@google.com/

Note that this should compile but I have not tried this on real
hardware.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes in v2:
- Set pendown-gpio to GPIO_ACTIVE_LOW in pdm360ng.dts to match the
  active-low hardware pen-down signal
- Expanded commit description of patch 2 explaining why early boot setup
  in pdm360ng_penirq_init() is harmless prior to patch 3
- Removed Anatolij Gustschin since I got a bounce telling he's no longer
  with DENX
- Link to v1: https://lore.kernel.org/r/20260718-ads7846-pdm360ng-v1-0-f318f85cda57@gmail.com

---
Dmitry Torokhov (3):
      powerpc/dts: mpc5121: Move GPIO controller properties to SoC dtsi
      powerpc/dts: pdm360ng: Convert ADS7845 touchscreen to DT bindings
      powerpc/512x: Remove pdm360ng platform setup in favor of mpc512x_generic

 arch/powerpc/boot/dts/ac14xx.dts              |  13 ---
 arch/powerpc/boot/dts/mpc5121.dtsi            |   6 +-
 arch/powerpc/boot/dts/pdm360ng.dts            |   8 +-
 arch/powerpc/platforms/512x/Kconfig           |   3 +-
 arch/powerpc/platforms/512x/Makefile          |   1 -
 arch/powerpc/platforms/512x/mpc512x_generic.c |   1 +
 arch/powerpc/platforms/512x/pdm360ng.c        | 126 --------------------------
 7 files changed, 13 insertions(+), 145 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260717-ads7846-pdm360ng-ec7ed9f72f82

Thanks.

-- 
Dmitry

