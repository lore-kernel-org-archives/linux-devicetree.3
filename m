Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449112;
	b=uRqPtYqoBa0oGadrqBSuXHVZZxEqkZzdFbBVQ4G5jkvWDZb0oXtYlXR6evaVDNnnbG2F
	 VHe6oPtoOioh4u8LbuDRMP7CeyyEFeQ45Z0n/ZJ0MLIPxDgGBY+cZBcs+nyJdQWFHbUFT
	 sK14TG1EJNmhQI0JgE/MmdNFaRxGzTMv/htyddepM//dEx3GdxJ9K6QLA/t7xBjwooCUH
	 3lmBDJcM7UDMMs5/x45e0D5OSpM237ZMbCSjsdv5tHkr8iqQY2U4GOOZMHIoPeEBJnclG
	 2gHVNhKLtJa6QJIHTJeCWb7+fSBVVQQ/Zo/dR+KurPpETSm8Oft4x6HBVVPQddFYYZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449112;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+Hf2zFs+/T1dKk1/ZG7LQ3QtEmT4X4UKn9rks4rbgJM=;
	b=D3tpJeMofIoqCxI83GkAZ8r/J4am7p3Kzcx6cKrleathqKNxAw+kxc0ieJ+PN2kYnHgZ
	 1yg1PGxKZslsoLobll5/ErKJJpGcKgI3zLWjcctg381dIGOhef9q3XRd7GrpZjkav9H3L
	 SYY2vTuUhWHYmPptjwxOPTOpxtac2BryP9mRtq5WSSvcgn3nHDdrysWm42BUQdntBP5wi
	 PhiZ4Z+5RFBsSxzcqZ2fz/RW98l8KoTEMfx7XgTaFaYIoUBKHlc5jZhbZDsx4rcq2oMPP
	 1OQ+hpZwFw3CrgX5/a1WMRVCp/8XUFtcPrR6+SAbD2/pF5fBXRJVkqbNxD/TioDuSow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=o+QhaTF3;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=yxN0a95n;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B74606A31E;
	Mon, 23 Nov 2026 15:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95B74606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=o+QhaTF3;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=yxN0a95n
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1795449064; bh=+Hf2zFs+/T1dKk1/ZG7LQ3Q
	tEmT4X4UKn9rks4rbgJM=; b=o+QhaTF3ErXUxRuuMQkDWvznGrUvWCfxZktStxSTO+WFMJxe1T
	2bh0h++D2aQYyE7WNXGOxr09edOXzCmh0P8dhb8cATTtK6pdltWjSgX3YfvirmFcPaepg6tKwhT
	o0FhPL+Z1EW/+Gfol+WY7eOgDy/Vy2qDSbnCUJYKty/uejBG2iB62Y1pYIoJkdrydcUnuPxioum
	DL664Jx45FqjrDVU4S7RsNYHUh6ZutcY8kpA59MHjRMzVeKVyilyqdXVo7hc5ugZ89MssLVbQr5
	dQPuG1zpNQUpVGYS6JUtBi+fGlZajOck8dcapuzqCPLgSkVqfRX1sMZAQtlqa++/RGA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1795449064; bh=+Hf2zFs+/T1dKk1/ZG7LQ3Q
	tEmT4X4UKn9rks4rbgJM=; b=yxN0a95nywxaYbCWfINK7yb+m526JUdwrhweOyaBUTGBZYBMel
	8q0wxCxfW4FzOSw7SiNTbGHDCS/8CHE4pwBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v2 0/3] MSM8917/MSM8937/MSM8953 fix prng
Date: Mon, 23 Nov 2026 16:50:52 +0100
Message-Id: <20261123-prng-fix-v2-0-042100ff94f3@mainlining.org>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ7CIBREr9L8tRjAAqkr72G6wJbSbxQaqETTc
 Hehbl2+yZuZDaIJaCKcmw2CSRjRuwL80MAwa2cNwbEwcMolo5SRJThLJnwTcZJSUzHqTlEo+hJ
 Mifepa//j+LrdzbDWfjVmjKsPn/0rser9mU2MUKL41PFWcNVKcXlqdA906OzRBwt9zvkLdUC8c
 bcAAAA=
X-Change-ID: 20261001-prng-fix-5366a05da970
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dang Huynh <danct12@riseup.net>, Vladimir Lypak <vladimir.lypak@gmail.com>, 
 Luca Weiss <luca@lucaweiss.eu>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795449063; l=2138;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=+j9YSuScX+M7ActXUeT4Pj/BBJh86NzdVpbrPUStAgw=;
 b=8DWLdYbU4+DlW2OsawMiGGznE/g7wev/NM6igbyTgbvKU6QVXzvzrFJQnZcOQHs8ccd/hZxhs
 o4a0diE/rJQAPFnr/zjSzmRz9bJQci9BCGAwLS1/LHCu0Q1RpKiKTPM
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

On MSM8917/MSM8937/MSM8953 HW QRNG is configured by TZ.
qcom-rng driver will not have access to the configuration registers.
Change the compatible to qcom,prng-ee for skip the initialization sequence.

Compatbile changes are fixing this issue:
Call trace:
 qcom_rng_init+0x6c/0xe8 [qcom_rng] (P)
 crypto_create_tfm_node+0x154/0x198
 crypto_alloc_tfm_node+0xa4/0x1b4
 crypto_alloc_rng+0x34/0x48
 rng_bind+0x60/0xa8 [algif_rng]
 alg_bind+0x15c/0x1f4 [af_alg]
 __arm64_sys_bind+0xb8/0x120
 invoke_syscall+0x6c/0x11c
 el0_svc_common+0x98/0xe8
 do_el0_svc+0x2c/0x3c
 el0_svc+0x40/0x9c
 el0t_64_sync_handler+0x88/0x134
 el0t_64_sync+0x1a0/0x1a4

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Rebase on latest next
- Link to v1: https://patch.msgid.link/20261001-prng-fix-v1-0-72f924527465@mainlining.org

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Barnabás Czémán <barnabas.czeman@mainlining.org>
To: Otto Pflüger <otto.pflueger@abscue.de>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dang Huynh <danct12@riseup.net>
To: Luca Weiss <luca@lucaweiss.eu>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Barnabás Czémán (3):
      arm64: dts: qcom: msm8917: change prng compatible
      arm64: dts: qcom: msm8937: change prng compatible
      arm64: dts: qcom: msm8953: change prng compatible

 arch/arm64/boot/dts/qcom/msm8917.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261001-prng-fix-5366a05da970

Best regards,
--  
Barnabás Czémán <barnabas.czeman@mainlining.org>
