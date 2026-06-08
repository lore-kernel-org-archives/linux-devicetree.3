Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1863E51DB
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 20:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949497; cv=none; b=BRswhXyVIU+p2yDgJpG5HV/3hPBcPWc2oiHDoYCO7x9mK/VZGhLeIGQ4pjW8nXeQkdlbw6t82gEuJyFKTafJRSfmeI5l43+RYU6vzv/Bx6dfHNM+UBs5p89cJb4a/AVUvlatCL2QazChWSXStiVB6A8688dMfBfgIT3b+QRZnXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949497; c=relaxed/simple;
	bh=b/EPSsa1PBcaKht/9Md5GI6F6iwDsRcNHJwOGBef6dA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KKXOR1tTtQKtMr8WmEi68TA8PpN9/1M5jZtwpqvi1WYF0mf9tS4l9OezqHCGJkiOMJ9bgmu1jpV8AEtKkjZQlrA1RHSRDGyClScddamQxv7chWTlb9s0sQlEgPwHEtCvbCgxnGpYcnjUg/APe6H3RhVmV40U0Own7EGTg5SgkAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3mUJex2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3mUJex2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b613a17bso46824445e9.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 13:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780949493; x=1781554293; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ael+QkcjDUvWdYhINrpLTeBHHZaOT8ZvBuy2R2ndfpg=;
        b=D3mUJex2RlPGaOtxz7lerHX9Z4TD0wXtHn5nNFe38jB8XdGOTaANMdH00wSH77GYg2
         k7hEt8ixJ3AAnIWo2zdVENtCvpdErV0802lavO1K5PunT5kMcSexskr74Lil333kDTGl
         Uc1q2EMqkvbh4goQtnns2t8fIPfAR70n2gBTp3eJTltT9uR2MOvCNaxsVh2ebbGBCw0O
         EwE1/bQwoUitdfR9T4Vg4d7Euzw5uX0MdbIRLCM3Dh3oZzaCjUAdErXP2KAArHmTRKkb
         DW9TNlddqrW10vAsqM4AlSZAai1dIu8CM6ER7T/orDPpY8A0qQMQwMb+rextcBDZuDjF
         L5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780949493; x=1781554293;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ael+QkcjDUvWdYhINrpLTeBHHZaOT8ZvBuy2R2ndfpg=;
        b=I8Kp05h/txda/VEmsaLLlJxInOk2YZi4T1GGSWuYCiOte6WdszTBe7KkPSHbX7dzMM
         mhx1ivMj+UvBoiqID16GJRz/T+g4mEyIQSwGh+zI67TDFHi7sY3eUDkUrbkdUwAanwBb
         D7q77t9nzPdreC5uIsh8VapgmhtRZVL/Iff9MBNhnaDxJM5r4BujowVJHbo4+CClFgLR
         vihhiResnk6XogyQ9PzixUZr/XQdOdR97S1pLzlhAkGpGiDrauzE08Lo+nvjmKLE6gzm
         HonqN6op+EDp66nm78ffbN+EgyVY0AV7NB899NhUcTVbYIsm0SrRgGmb7xBJzB92L3Dv
         s4uA==
X-Forwarded-Encrypted: i=1; AFNElJ+jwSQS1Nhol4OKGRd5I99OkCwtgNTZ4AH3eB1ACH4gan7pJmklUYOtfnv+n9Boy3mB0uZKZfntJGv0@vger.kernel.org
X-Gm-Message-State: AOJu0YwNVBlHR53uVVxupAVztAUb9DXBdD+25Av4D04BkCOL3de4l/y/
	XJ/OqgUaph9uYN3einLFwlNz0vpcE8eFE47gAwbKpk7izHlcZsB8ayjJ
X-Gm-Gg: Acq92OFIIWR9rLVOfyV1fXDTjnFDgZgSG15JiPne/anHYsjK7beM5m0XZI2qhYW4aL7
	uxLW3PKbGmHcBZrSq9TIDcrW4/4gxqwahvkX8Qnke/X7DgkH4zsB0zppgw//21p0tvol89oxAH0
	sMhuk+HqfNUPaxYpzMaMS1sYjeB7WUxH11BUIACVGQq7QU0djrlr48NjOG++pNezX6T1aI/TtXP
	PQ4RNbE++6AtulPJm7FadeY8PJgrF5sPvYzAGXz7msXA5LzqBuj1nzVMtoZYv/Hg00lRvEhCQaD
	Pf8cpjWJCLC/BDSlNfZOl9HRazLW8bOQIZS09DNKQkMqba54QfYU/kjp8LNiZ4t2zy39yDnanGa
	l4iDJDDLjv5F6c7adoi66zB8PhXRhg2+FWb2AVRxvzFmzwUhYkv9oJAcpWD+ps4CLLaa3X5o67a
	HJ9ey89B7DNO6ska9E5PzqfTlQdRp1Kv3J2aXK9HkyL/itmOCybwqIu+5gLQLidcciopd4n5vPP
	mZ8HpBdpxntQjA=
X-Received: by 2002:a05:600d:6447:10b0:490:53d3:47a9 with SMTP id 5b1f17b1804b1-490c25ada18mr199206795e9.3.1780949493179;
        Mon, 08 Jun 2026 13:11:33 -0700 (PDT)
Received: from [10.100.102.82] (46-116-185-113.bb.netvision.net.il. [46.116.185.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd502sm421219095e9.11.2026.06.08.13.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:11:32 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Mon, 08 Jun 2026 23:10:23 +0300
Subject: [PATCH v2] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup
 panel compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-b4-compatible-s6e8fc0-fixup-v2-1-d23f373603a3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ6CMBBGr0Jm7Zi2QIOuvIdh0ZYBxvCXFoiGc
 HcLXsDly7x53waBPFOAe7KBp5UDj0MEdUnAtWZoCLmKDEooLbQo0Gboxn4yM9uOMGgqaiew5vc
 yoZbK6Erl5iYziIXJUzyc9Wf547DYF7n5SB5Gy2Ee/eecX+Xh/be0SpSYijSaNk+dNI+mN9xd4
 wOU+75/AYNdeNbYAAAA
X-Change-ID: 20260608-b4-compatible-s6e8fc0-fixup-612a6d25a914
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780949491; l=1331;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=b/EPSsa1PBcaKht/9Md5GI6F6iwDsRcNHJwOGBef6dA=;
 b=fIYAh+giMPCxco4FH5yUxrSyW03LnRG09S8YCBJkkdqKGr9ufhEZfK45ZML/4ivoVMeROFajR
 QUIKfxOejdqD9YrVaCt1Y1HhK6k2kiY9jtFWIVYs3PiwwaebXN54oyD
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

The change to the panel compatible was missed, fix it. This compatible is
already in the driver.

Fixes: 493cb869874c ("arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel")
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Link: https://lore.kernel.org/all/CAHuF_ZpTvYmARzx2_be1foM6XUVCdE0bNmb+YcHkH7tFhrYF8w@mail.gmail.com/
---
Changes in v2:
- Add Fixes: tag
- Link to v1: https://patch.msgid.link/20260608-b4-compatible-s6e8fc0-fixup-v1-1-303606b53c1a@gmail.com
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index b9d9439e230b..139f2b401af5 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -198,7 +198,7 @@ &mdss_dsi0 {
 	status = "okay";
 
 	panel@0 {
-		compatible = "samsung,s6e8fco-m1906f9";
+		compatible = "samsung,s6e8fc0-m1906f9";
 		reg = <0>;
 
 		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;

---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260608-b4-compatible-s6e8fc0-fixup-612a6d25a914

Best regards,
--  
Yedaya Katsman <yedaya.ka@gmail.com>

