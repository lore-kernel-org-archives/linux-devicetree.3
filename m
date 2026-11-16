Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854799;
	b=TCHK0HPdVYzbQjC34FPHn+mEnIyH2y9R5C7ameVjkzI7brg/xc25mmzDqtodKHNiMmiT
	 CYNTaoAHFMHz/Z6dIwCj9iUUjRXlpv3HtA4DfZbvwq/Puh0AEm8mAQiFno59eJ4wp8Syy
	 tGNMW7LuaR4+56rairZBokOlzL5ns6sJ5hgSPqbKVoFsSgd89JTAWym9xgtm63bA1okEJ
	 1mEANV2nFv7CD/vOHH3KJIUqmf1vzHLGIMX2XKJ57KibNylROu161Pmbz1vhq+WLs0Sth
	 5h8wcqIfrTKZ1VtEKgma8g5Z78bjDOQh5jUoImnFYIxUtIMktPRTWSRk6mwmm77llXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=P78VDpsJpTz+1/Uu6wAD6OIZCd9bSuoX6Podaf0tODg=;
	b=kTcUS58iaoYROFI7wVIsuKT8pRjCwh6oN1B+uTooGEgTU5T0rm0mrWWjUvq9Hc7TN9wt
	 iqz/VRYwJLUVN58x1Cb5iDOLGUYOeJW+tpwfGqPmonT9F5IpcHQ+ZTuM7FOPYffPMwh4Y
	 WGEm0o9QgEcQ6pW9/ME6Vd+PHRZDx+AOS71gJRDzeFDUVFfDTtQtTgc4NEps+SJ724goj
	 lTXyMovRZxq/oZ7XBHBNt6yNxZwEwGXpS3VA5ZJzV7tliL5VsPSbCFA9arHC2pTboKyND
	 FbpB1c4+LsHLsBXhMnxHHsvdmjprGXiyDOOzaRGXLllXxRibJI5302DO+mmtxNhP2Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mc0qHYFT;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8029D606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 18:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8029D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mc0qHYFT
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-849c2965b9eso1167226a34.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854797; x=1795459597; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P78VDpsJpTz+1/Uu6wAD6OIZCd9bSuoX6Podaf0tODg=;
        b=mc0qHYFT/6qwRjTi3Dtv+++yFZW2fqcMUAcIKPmQF2uTfb48OKPIH1SeI2qe5vtsXR
         q5Le9wFFEJZAdvcimDV5B7gmwCUaOlsGHATwTfxRRirTW4XEjRlvL/UVFoMZg1lPfx+I
         Xy3vSdrq/orlPickEvoGy144vofdRuguz1AJ0mEJXfBjOSCMQk9df6lBHQ/e0JUbpxUz
         q6HFcq+0wmiKJighYZt5EC/3Suu8GosBiUb+GAvlCqhIOMPQWUqoD8MlTlyAzW+eTI1O
         jhXfpB8+n6zRe6rEMlzy11XjSTDJfbj8oeaiiLK9LHFqtwfLyNhT6A1rp3I63IsJZ504
         U2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854797; x=1795459597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P78VDpsJpTz+1/Uu6wAD6OIZCd9bSuoX6Podaf0tODg=;
        b=xTI6SJKfvGUlLLGybn2LoL2J7c2csMf11rOxMgJXXZ2l1weBfkkYk9cRR7WO7BBzSp
         yknocUhQ7fo5p40pozDoduI53L1EFf+J7G4ISauAjO0HNDBrrZgQpVcfRqcGz0zDsohP
         Oqh/WoO4zVAokuW6Dn/l0Gcafi8cj2fbnIKA8bIObRpcLDALGkDOaO1VOQtJ90vqSNqF
         gYnqFZPbxG2iRHGdX9L9SL0llV9xn+nzDNCJ4TldYJuDfCn+QI8d5O2lJcvCsYKuEnIk
         I4W99vSKQe/DDUTaaQ0ePu36zdMc4NARsf2dO79cBxmgVi5MvU5eTcsyB4aYMSxqMJTE
         K5lQ==
X-Forwarded-Encrypted: i=1; AL+hErEonCpt3l1W2L8nMhx3dKAxsTk6zuQFotuA4iSiRCTQgC6Yzi6EaUvWrSjKonP2rIN6CfuoyAX6l1Af@vger.kernel.org
X-Gm-Message-State: APuU4Z/2Jh19bw3RTK9dst9oWEBxWILPmFI2CB7fFYd35CIvEDjLYWve
	1lcM7IeWuhb5Jb5t33dus24m442S4oShKAh/u10rQIpI9uKDTfjYfW8u
X-Gm-Gg: AYBFou2vLnfgidKibfcLgJHe3gJ2jHM6SCM33Q1uz67xrgVP2oUaky6rrP4iLNzsg5Y
	s2GjnI5wj8QKJuOAsLjZj/3O02mcsq9zeCVsSnlFC7lWDE0Ol4fZs8wJLlV64vK8cMMNJTynghU
	WCs6P1NJDxcmdTDI2Dsvp0PVR5RSBUw60T1JAVOrPBbP5AFulk80ZwIqBqZs1BxE9LG5CYtdcup
	1z7jS7NNqyTPmPWXGVV8GpUPCarMO39iGvK/OWiRgB2SPgL1ITvkcKOjK2NN6/l1Um8XaFNi0Uv
	7JvXSEw4uA39SuH8LhVWGyZn5z7cmgIF6mOzjkOBxPGsJR7TSlnYhNM+o+CvBQ+lFRhejKx8R1J
	5ematAl1bxLE9vltcphdh7xk/U7z2FPNoWLONyvRhFy7b/5nUzOuK7HSguuuvB77L8yMklRyOZH
	jZJoRwoYgO/Ic/IwfCKnm3WRYTHrckltyPjdWsxkzO8bPvoIbFAzHB+oaoLDMpCd4Ggo+W00yuK
	1FVTOgLPcPG1mu1v9lWjpuBPLXl3ttk/Tnk8GFhkv6eM86RQZ/e0fFTK3nCVFSWKDRbofSZPujU
	2eY/yqHnpJWIb1CiCzGMb87ZuODKPjhKozZKd7TWZ5pS1hgK2REVYVGxWKSqMM8GThQaLB081KS
	xQzqQU1BzIl+WFsMQ1pxpQ5AZv/Mx2LFxe2PCx7JX
X-Received: by 2002:a05:6808:3186:b0:53c:7298:3591 with SMTP id 5614622812f47-56e5fd4852bmr9836229b6e.1.1794854797281;
        Mon, 16 Nov 2026 10:46:37 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe242b670sm7210735fac.17.2026.11.16.10.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:46:36 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v3 0/2] rtc: mt6397: provide the RTC's 32 kHz output as a
 clock
Date: Mon, 16 Nov 2026 12:46:32 -0600
Message-Id: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43Nyw6CMBBA0V9pZs2YTkcosPI/jItaCjbKIy0QH
 +HfDbhh6fYu7vlAdMG7CKX4QHCzj77voBScCLA30zUOfQWlACVVRlIdMVzD5DBO7o3TEMfgTOu
 7Btsx40JjGC2yuqM0ZCmrM+acIREwBFf75+acL4mAm49jH14bO9NafwJJ+lOYCSUWOs1rzistU
 z41rfGPg+1bWIVZ7a/q36tCiVRYo1VOKevj/rosyxeEFL37MAEAAA==
X-Change-ID: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854794; l=2739;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=edI0U8BJ05vm1zYUWZKlM1TrWGXlJBUbcmpWbDIqGNc=;
 b=NLQ9/9ifb2vqQe0on9JdNLDbVdTMhveUDIstOj4nsP4FUeFFlZdrmwfVC4+mYhCjsUQssYltO
 y+PtxNWp0vnACO+TbUGWxj431pgV6oe5TK+FwOAtVekLyd9sDVCpExb
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT6397 RTC drives a 32 kHz clock out of the PMIC, which boards use as
the sleep clock of a Wi-Fi/Bluetooth combo chip. RTC_CON.F32KOB gates it,
and mainline never touches that bit, so the chip only works if the
bootloader happened to turn the output on.

On the Amazon Fire HD 10 (2017), which can boot through U-Boot instead of
the vendor's LK, nothing sets it in the former - LK sets the bit at every
boot, and the MT6630 combo chip's Wi-Fi and Bluetooth never come up.
Letting the RTC provide the output as a clock lets the chip's
mmc-pwrseq-simple enable it. With the clock wired up both came up on that
board in two boots out of two, and in none of three without it.

The driver registers the clock only when the RTC node has #clock-cells,
so no existing board changes. The MT6323 shares the MT6397's driver data
and gets it too; every MediaTek PMIC RTC whose registers I could read has
F32KOB at bit 5 of RTC_CON, but for the MT6323 that is inferred from the
shared driver data rather than read from a datasheet.

Lee has applied the binding to mfd [1], so v3 is the driver part only:
patch 1 gives the existing write trigger member a name that says what it
is, as Lee asked for the new one, and patch 2 adds the clock. Both are
for rtc.

The board's devicetree that uses the clock is not upstream yet and follows
separately.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/179459615032.87488.12726056214378307165.b4-ty@b4/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v3:
- rtc: name the new struct mtk_rtc_data member control_reg, rename wrtgr
  to write_trigger_reg in a patch of its own, and the local con to
  control (Lee)
- dt-bindings: dropped, applied by Lee
- rebased onto v7.4-rc2
- Link to v2: https://lore.kernel.org/r/20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com

Changes in v2:
- rtc: check for #clock-cells before reading the driver data, which is
  NULL when the PMIC has no RTC node, as on mt8173-evb (Sashiko)
- dt-bindings: add Krzysztof's Reviewed-by
- Link to v1: https://lore.kernel.org/r/20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com

---
Ryan Brue (2):
      rtc: mt6397: rename the write trigger register offset
      rtc: mt6397: provide the 32 kHz output as a clock

 drivers/rtc/rtc-mt6397.c       | 95 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/mfd/mt6397/rtc.h |  8 +++-
 2 files changed, 99 insertions(+), 4 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

