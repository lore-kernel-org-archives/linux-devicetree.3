Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840771;
	b=BLY+TR5PzimDyxxkFy+bXePIY9Zz7dmK35GjMK9Af+ltTd2intdPVqrSH647Z1m89gbg
	 JM0UuFXnb+qXJp7lm9N5jgsn4eX1ydv8LN7exogz5KWgr8r8UxyF8CjWDAxuDEL6Qotrd
	 Kz4M+jakax7ge/L/SdXDwaWVx7tgwItKUSUq3//ZldntiGfGuEnTwRnBDINSMrTbc6ssM
	 GX7O4hi+25vdO4syFi7GXiAjMa8khZRpXk1ziJr7d4DTKaffG2YpqgUb/GG7avxfqKmPl
	 aAWz98PkTkBOM724e+9yTPTFRw+IIHOo+XeLJEfK/cWwkn2KemPlyb5lqZjozhlKs3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=You1mkFXga/vHh9B3JqFjojHJL5bf7S7RuEKx8WEhTk=;
	b=W3+mwiGynr2Ged6ImlXcOlitsb6vwl2CCduOp71olWrUTdtqo2u6DS+sg1f86rtc3jhf
	 MvUBY+9yV++3KAS16jlZ0wfdaxEEuV8jIHBzcdN6tvSlXKe1yNsrhCFP/OVxDQ4NnAbTk
	 h52YBmUQoG5NnUnYY26zN6q6xua1sKP3HrpSpVGfNuMtAyNEaQsgyikTMZ8+141KNwJ3R
	 BTaroi80pczLArcCXCpRilUOcD5iDdpEoieAhN0qsSF8o2EqOTiGMxKTyG6g3dOV0g57u
	 SU4YPlGeGkZZ7cXjtV29NrnfY92b/wE4RUSSF0vE8R96mKQi7k/Z+R42Dt9DoKFYBZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRAVzwhy;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2722E606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2722E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRAVzwhy
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3321706c88.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794840770; x=1795445570; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=You1mkFXga/vHh9B3JqFjojHJL5bf7S7RuEKx8WEhTk=;
        b=tRAVzwhyktdqOvWHpQdxG5sbdIMyaBiNIGxVgNZFrga7aNRFMoNXwde9T2fxsiB/mw
         Z4fwtUpZixvFTeBoA6N18nQ9t9T0OBAbUPklo1N97D9JWaSkSNIfUH7t/9MigK8cG+oq
         a+UYpYW0C567CI0dCPwzU3J0p15EqCETaTNxw16bMMcnzXjOQqNdY0EYTssU04UGLeBI
         y/tm18FdC0bvXJTXbT69cEc7Na7NO4bH4PcYsxF8hkiyTuF2LfACQS51xAFZqtA+yxI7
         v1ReBP8u5oDreaiLPSUh2bEjSWOy2piRrBMBXBC/PJupTcZ+skhvoIQsCUN930VFyXPH
         3I6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840770; x=1795445570;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=You1mkFXga/vHh9B3JqFjojHJL5bf7S7RuEKx8WEhTk=;
        b=zuzwlTbD5hs2yKaHXLhYgqMvXosWMkU1ge+pqwq5rQSrr2Soc/BJDvtuCPMVR9v1U3
         6GSXRXjh2j8vKTb2Q4Dww20v4dcIp+f2H/bO3Vw+h/Fvq7ebz84yNTvLVq22cAOaLlYB
         KlLFbVF8EiSH3rAhmNv1CdlgDtENiScuCBRmberJewTTvjq5su5wn+74HC2ezvxnwChR
         kjmyMIxRO1DtUgBj/+s8QVE4xoORz7mcUcv7QW+bxGIQ1JW0p/1TzK4QEWMM4GFyh1y1
         2bHEbHBfap37f+t9S7NNh/45W16R/lzAhQA067SCryww2c+53TQnfk0XbzmQnzpr59PT
         wajA==
X-Forwarded-Encrypted: i=1; AL+hErGpOVMhchpYjBfq3EqKfX8BeWQMk3BQzV+jU6h8X19rMYJKp2WY4hFg1KwCJ2WPXHpOnS36uucU+Dxz@vger.kernel.org
X-Gm-Message-State: APuU4Z/e7EXmEpVBoeRMBtlYInaYZ/ZBMpdAp2IpIe8i7zJRmIS5K6AS
	d5Haaegy/CGb+33BYreS8YsTjZ9CMcze5Q0BHqoQN7p+zANhGqFv5G6d
X-Gm-Gg: AYBFou1URv0ejVyDqMDFHvIxelJAEmHuie8yg/1ufDWN8j+b92gXomqqbU+VjshqJEt
	QhPRszz0oF7fIUj7XZv92DWCOBOL0HeWiUYxfSEPisD/NVwisP6fp7kv9DcDC+G57Nv0qg9BKs2
	ltIMUVLjpyZFijDRSaq1AJL+FQvxmC8PYgQfGDI6sPK0cdYJyGqAa4xlY3blLjgQJ2FbOZdFfjd
	WYWEC2URaLlvFSzkv4DGf/xK7jR/4+MAnvCoa4HDtysBJFadV+XA6EAHMjzaQeSTHAQ6G8unydQ
	s/HmV72Lpi74y89p9+D3ujSzBT7P7qknjiUaCjMzv7PgzMBlcAqJoZTKQpPGUIcWcfzD30yErla
	F8CqlR/XHnKHmny2ZXfaick97dBOA9lIuD/pgpaISUMbaH1SqRMTiEUF1Jaw1w9Xnno+md1Uq2B
	l2lF+1mQhbaFWIGk5MspUsPx7HuwR4ba/e0nXCcP53hrdGw/2G1UuYVRTXi9/ncPgVzaWXPW9wj
	iyZ9f4SQ3Yt7o6LgS+9cuj2x8gMIKxstNm/2fhdNszKdULnJie629Ov/tI1V5MzAWX8ApkmMgvR
	8O/d6Yty2mpMg8lyA2Kh8aNKM5cAMzDUMQQ0W0gzKxAjQv0=
X-Received: by 2002:a05:7022:7f14:b0:1b5:1c22:6fea with SMTP id a92af1059eb24-1b53275f63dmr2698971c88.0.1794840770041;
        Mon, 16 Nov 2026 06:52:50 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm69003540eec.20.2026.11.16.06.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:52:48 -0800 (PST)
From: nhansp <nhan.094.vn@gmail.com>
Subject: [PATCH 0/2] Add support for Samsung Galaxy Note8 (SM-N950N)
Date: Mon, 16 Nov 2026 21:50:32 +0700
Message-Id: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIADgY+2oC/yXMMQ6DMAyF4asgz7VUZwikV0EdAjHgqgUUm6oS4
 u6k7fKkb3j/DspZWOFW7ZD5LSrLXECXCvopziOjpGJwV+eJyOO2qmWOLxzL2tMYkykOLtTBJfJ
 NiFC+a+ZBPr9ue/9bt+7BvX1jcBwnMK+8tXkAAAA=
X-Change-ID: 20261116-upstream-greatlte-dts-f29792d1689a
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 nhansp <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Hi,

This series adds initial support for the Samsung Galaxy Note8
(SM-N950N), codenamed greatlte. It uses the same Exynos 8895 SoC as the
Galaxy S8 (dreamlte), which is already supported.

The device tree enables:
 * simple-framebuffer
 * 6GB RAM
 * pstore/ramoops
 * gpio-keys

This is enough to boot to a shell in an initramfs. More support will
follow.

The keys, framebuffer and ramoops region match dreamlte, but the board
gets its own file instead of a dtsi shared with it. I only have this
device, so I can't fully check how the bootloader lays out memory on
the other 8895 phones.

Like dreamlte, it boots through uniLoader [1], which sets the DECON
trigger control so that the framebuffer keeps refreshing.

dt_binding_check, dtbs_check W=1 and dt-check-style in strict and
stricter mode report nothing. On the device I booted next/dt64 with the
arm64 defconfig, plus ramoops, simpledrm and fbcon built in. All eight
CPUs come up and the kernel sees all 6GB. The console runs on the
framebuffer and all four keys report events. A panic triggered through
sysrq was still in pstore after the reboot.

The test image was flashed to the RECOVERY partition and booted from
there, with this kernel command line:

  console=tty0 fbcon=font:TER16x32 clk_ignore_unused pd_ignore_unused panic=15 rdinit=/init

[1] https://github.com/ivoszbg/uniLoader

---
nhansp (2):
      dt-bindings: arm: samsung: Document greatlte board binding
      arm64: dts: exynos: Add initial support for Samsung Galaxy Note8

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts | 124 +++++++++++++++++++++
 3 files changed, 126 insertions(+)
---
base-commit: 65ffdae53a6d522519fbd66d3cabbb4622e3e5bc
change-id: 20261116-upstream-greatlte-dts-f29792d1689a

Best regards,
--  
nhansp <nhan.094.vn@gmail.com>

