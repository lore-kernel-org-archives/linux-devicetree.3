Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030987;
	b=RNv0EPc+oZ3l1TbfcB90LvCc1tJ09BXwZRGdg4xZD2hCuka4Mdw8OtIHoJ/SucbEkpdG
	 HABZvNu9oDF3bMU1x+RmFsg3hje90r7FI5MDoxotT9dUddQsvDSe4NcpiwVvxUcNA4W2l
	 iGXoR+z0mPwAYNiY+ZYOrH6XwUfV1+djOhJY3XoDDbYVG5eNspNxOOTAysKMqcsRrdnDP
	 hhJ3VJUGdILQ/EwvNMlwF64TZnukRvu39L9qt3XbVE+Xy6Z7aq34RS+lZu4lsGaAeS7HA
	 2bLcs5AszE98vMlGGe0BlQXbHMrm/vgEmxuC9R8+bDAzIt/7AlhGDsUa1+4l6PNat9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=yg3SAu7bcjA+P3cd0pQQnqKAc/f2yjYRUKnerwKE1Pk=;
	b=hm8+qizP2VF9O7aun3Y0B/IDT/uxaIvRsXO0ScQqKh6smJ3xmII4enL+wLg6NK6+Py/p
	 vB/DAfswJYEopPDLh5iZnhV+1Bn8b9J+9T0B2rzi9O6P0ClJxJq5FXB9YY9mnIWvv6K1i
	 1i88rFKumD302PAoisu6SHV79F2uz1BRvR1h1S4mrc4oRHw4qqvkzyMQ3ZWr+gyzTDBwU
	 A8HfTj4WrjMQU/Entn7kCSjTYWKl05rvSv03tR+RGAdK/89pTCFfC3JRcUiZEwcRCbcLk
	 Cyemu++yQL//5nZDzpsSnXAUvcOkme8QRt8TS+D6rnQHEkKNQKguszciDZggWBLEphw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VanedlGZ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3AF606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 16:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B3AF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VanedlGZ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so672455e9.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793030985; x=1793635785; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yg3SAu7bcjA+P3cd0pQQnqKAc/f2yjYRUKnerwKE1Pk=;
        b=VanedlGZOu5ndUlScCLSxlKNzB5QUBvJHOy7xAvY+y80EAJmk/V9xxksuf8NQwaU8P
         CE9ZNZ5I4maGFZZBUtr12or2LPxp/2FL8+VneSbVf5rkar8wljOEfTGIs8TO1HH/r4LR
         az6MJXoQYmFFLWv4hMzLFxDhabjVMSfzwN7Qa9+LMqNUhNI8xC4lzBoManTpVANSlari
         bBjs9b+DDHRzGGulw9/AIgtEixrr6DS4UqLJXmlGSO+GGs75pLqAvk0DyQI/Wg8KMGRG
         PJw7oflt3vrLO05Gsgx5K4XRgx222bHpxgjMJjEQoYksQNS1QMXHMq2Fvea5H/udQ/AO
         hCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030985; x=1793635785;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yg3SAu7bcjA+P3cd0pQQnqKAc/f2yjYRUKnerwKE1Pk=;
        b=SOjcIW53o/kBw81hlXBw9XGt6TD1ZYlpT01CKR/J/8775XCcCx+tDyy4y3QQItREnr
         02qLMN0/DpfRH3eY5UG3b0wjSTam93Jwd02jlC2EaSgASHz/Kqc/2ORBubFrGVe8b+ai
         tDTEB82dwdtDmckeZZmTzGbDD9eXAGC5OYnUCh9rn1XvkQb2jDksl4H1ldS5pzAtMZJ3
         IkJBjAI59OBEDdefbty7TN7rHnoHpWuHQ7uCq5f7iab3CLynCtZBtlHiJXe/KJZn0Rjn
         Mue+Jxo6wYObfWEy3XrZHudmyNmN/zC0X96uoWgZnXNx4IHN/fjeVv7cnmAUOCtzbM4D
         7C0g==
X-Forwarded-Encrypted: i=1; AKwUvByk6ZHe0wecOcMxaf16EskEnMMAaIeTxHDB45Fl405dGY/1Izg11Yhqdv2N757ktTBov8Yp9GkFQK7L@vger.kernel.org
X-Gm-Message-State: AFq9FYIvFUQHpHb2YK4kaNekagP1LTFpEya/3Bd/pHZ/m2ibSHaWHKyV
	5thyu9heTOlDQa42XwW1cZHnda8Rl90lUtJaTphWGXXu1fTjXUi4kgeQ
X-Gm-Gg: AYBFou3Mtz60JDikmHuANUzytN3T6IWbA+kwAK1o6qFjGqlBxfy9zE+IaUb8SrjKHdp
	G098bHWFxK5DmtRLeJ8mWO8uhMNL12Fh7XXF8WdJ7n3wKK/EYmt/RYNrZzljeLwgct8dZh3gTBR
	YmiV19L/0Q6irFigqBQRMUGf466DRw7YuPvxvX1S4Ybo09V3NER+SoCMmIIxe5oobCtitTmQjj7
	sNpF7porsh5aGM348ZbBImBAJJeERIZRMVAaccVQx50GkZxpSMZaeMH19scZlwJPS8GZlfGRtYQ
	qCD3HDuHD7so8P739ZjbZUgmuTy1CWvDAX3I9zRnIQQOOxdxvnMPXmNrEXABwtamabGEsa+ItMf
	TRfcoiQHAsS1ZhoXgx30MmsZ2EflGh+uB8aUvJWz7OYZ0GFYTH3dQqjGquayUFqlUZaQbEjY9Yq
	Pc3dr0IffhjgGyQFNEg8vckuCsqxKBgpNBTK445nL/ZKobyuboGi6lvykaguSPvilzefLzUpSEx
	48+Ly2s2wxJoYAlpbfHXC01ie5z6rOorVmTzaUX/Xog0zQ+ljS/DS2RM9q4dwddz9QHtWyyytHz
	yUCFrIADh/8Ehwmt0+Y8cFlcThN9WA==
X-Received: by 2002:a05:600c:3115:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4a7c16c5294mr2538075e9.13.1793030984491;
        Mon, 26 Oct 2026 09:09:44 -0700 (PDT)
Received: from theSameSurfase.localdomain ([89.216.103.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa097sm224923225e9.3.2026.10.26.09.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:09:43 -0700 (PDT)
From: Artem Utkin <thesame.personal@gmail.com>
Date: Mon, 26 Oct 2026 17:09:14 +0100
Subject: [PATCH v2] ARM: dts: samsung: exynos4412-p4note: allow powering
 off the wifi card
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
Message-Id: <20261026-exynos4412-p4note-brcmfmac-v2-1-14b372972163@gmail.com>
X-B4-Tracking: v=1; b=H4sIACl732oC/43NQQ6CMBCF4auQWTuGlgrqynsYFjAMMIltSUsIh
 HB3Kydw+b3F/3aIHIQjPLMdAi8SxbsEfcmAxsYNjNIlg851qXJtkNfN+WiM0jgZ52fGNpDtbUN
 Y3rkiVRQ30/aQAlPgXtYz/q6TR4mzD9v5tajf+ld2Uaiw6PIHm0dJmqrXYBv5XMlbqI/j+AKcD
 dU7xAAAAA==
X-Change-ID: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: stable@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Artem Utkin <thesame.personal@gmail.com>
X-Mailer: b4 0.16.0

sdhci_3 serving BCM4334 was missing cap-power-off-card.
On my N8000 this resulted in the following messages after sleeping:
[305.759883] PM: suspend entry (deep)
[306.514698] brcmfmac: brcmf_ops_sdio_suspend: Failed to set pm_flags 1
[306.671504] brcmfmac: brcmf_sdio_htclk: HT Avail request error: -110
[307.127267] PM: suspend exit

The regression was triggered by commit 8c3170628a9c
("wifi: brcmfmac: keep power during suspend if board requires it").
Midas already has a fix in commit 2ff147fdfa99
("ARM: dts: samsung: exynos4412-midas:
turn off SDIO WLAN chip during system suspend").
exynos4412-p4note.dtsi does not include exynos4412-midas.dtsi,
so p4note did not automatically inherit the Midas fix.

Fixes: 8c3170628a9c ("wifi: brcmfmac: keep power during suspend if board requires it")
Cc: stable@vger.kernel.org
Signed-off-by: Artem Utkin <thesame.personal@gmail.com>
---
Changes in v2:
- Drop the paragraph about exynos4210-i9100.
- Add Fixes and Cc stable trailers.
- Correct the author name to match Signed-off-by.
- Link to v1: https://patch.msgid.link/20261024-exynos4412-p4note-brcmfmac-v1-1-3d09e496c2c7@gmail.com
---
 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
index 8d52aa13b8..03b514a82b 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi
@@ -1232,6 +1232,7 @@ &sdhci_3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	non-removable;
+	cap-power-off-card;
 	bus-width = <4>;
 	mmc-pwrseq = <&wlan_pwrseq>;
 

---
base-commit: b47faa6004d86ade16b90d24fa1e1f179e6f7230
change-id: 20261024-exynos4412-p4note-brcmfmac-68e7c13354bf

Best regards,
--  
Artem Utkin <thesame.personal@gmail.com>

