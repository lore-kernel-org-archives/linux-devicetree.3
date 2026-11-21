Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220827;
	b=BS40hQMn8S2zVzoylHipL9l9U/eJiTKTsIipAnqPKopxr2GG5Bq//E22Tmg2fEEHDjf3
	 Bn0N4q2+7BLghoEznLSF9Ts3ANLDCXyyA1Z0zg0WZYMwk0vqDUrdoMsj+gyvvUhYnMVeV
	 7KsTb105ke00GnJ6PLobPAv77irGsie0/1S5sI4WycKYczPtWKlMC9Zzn4LbjekB40aT9
	 ePjPbSIAUtY2CnWoj+daFAMulqKSHhcWyEYoxcgneoA2R1mhB9lWjKadxKNYw/IZKuVHt
	 sMsbXslrWlgIbD3nW3kmvbF8AXLHut0+uUcFu6jo9gavOCYWe+js0sEV17Re0tJoV5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
	b=CHVrTzD5BRAGtqnhr8SUHpAOJU/smq6vZfaBtwQCEh9HKivwnJhnTTvwJctipeYJI4f2
	 VuNFHCQ4F1GL9/YsAQ3zWw+RXNXXmnITpMtDWkq/I35dkbSCqCjOesBIQiAmj2hioz1ht
	 TgUwMP9YLecbtgmmIP3xupMEoqJcVEKTADRQPpgJ2Prnap3CI7BLtnk6kkvOkyicVCGgQ
	 B8MQUf6+ZdpvrgqOkNm3TH4FbRDuZ0nKbdHnfqtgCe0ryC9Ehem1cZaulg0hGTcgSQDk6
	 9JCo6ouxvv1MLyy/hiSeNhp29Y35KvHpwY/zLTpGESqPdcTzoPJN6l011ncvPmE10xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0z6v825;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E291606A698
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E291606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0z6v825
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a070781f63so792077b3a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220821; x=1795825621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
        b=s0z6v825X8aQHQqU27lbGoh6BH+qRGBFWug+Nmw3jCqSF03cA9/mR9BAjtyKpP5Sa1
         66dWGokqaDm4la2uu5dbNMfpKn2PyrFMy8Td8nkjTcmhDxqjExiZRpid9zf9T/Qm2mS8
         6VMuML+bUypLcTXNXUJV/T9TG9Rguh/GAgUEnG1Anloca+Gk10nJOWcE8D9agYt2VIET
         +1ySXEV1BxVGBTGg2aof3GygPjrIOWQgYTB9bpuY0pnqOYvuecvGRqhnWyTVj6oGf7By
         AbqQQ1vqSilu54FA20CEZhNz2p9at5Uwl1M9Q986DMBXPHa7pihMYl29ihWSW+z6Xxfv
         4dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220821; x=1795825621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
        b=0dlEKIzECMnSZJQOJ51VBZF+M+2m6qlNHK9ao11ImgYenYjKlTh/fQFYg901DOMEJt
         oYKjzMNsUHlYd5b3PL+drlP1pu2DXa6BguNO4/ain1E6gts35oH46F67enJ1Y8/hK3YX
         xUg9HKPY0c45TlnzIn/qBdBtbx+GdpyoKUCesCGa8yU1H/gz3XCxvzQycGV6nmCoh7Pm
         D34Ky+VzfT4yCZQAiTOMyogpiMCfTi54OZt56LZ8WqMumTI23m1pBs65+M+pD/Wedxl5
         aFCEJE1Mik/h+AFvwHsuambzI/HEq1juAIsnvjyO5jrhdhanleUTuYZHF/IeHy2fKI4s
         CMyw==
X-Forwarded-Encrypted: i=1; AL+hErENEwmTVR6GMiLe80st9MxRMckUCOerx+sPu3ZHM9ykDUhN4/Egmv21bnWFQC9YWKhLqdOEYlxfAMuK@vger.kernel.org
X-Gm-Message-State: APuU4Z8k2MNO+Jahl/d8iMF8iyBLTaiJci08hFKGhHfc1viazK99BhlT
	u5Jtafck2ljd7nuh0qpDfQe0SNPjXn0jn/QEalMiSDftNwpWUrU2cy6G
X-Gm-Gg: AYBFou1gX5fQifH3ua9woxauN8LEw5AN+d5pDqGJP1G9sxTDg2rwYh6ZTGkLqqW5vPq
	qiVrpEg/tfudfxU1uZUpKu6tLQwDzpAzItD79lXd08C2EoQZ7v112D4tiug3ziilKYUJDilLTH4
	qJmI736diA/Mr0uJ37N6hNNsSeVz//HegSuZt99Yj3XbfzOlSwDesiBeXp4QfUqtfRtH3e4/ScV
	FGh0koCRh1IAyvxeSyGY/fNZYwiu5dHIFv45tNbJE8scSJchUspJdE+VFJmFEqLdvdAcEXUmaIS
	jp/62cm5VcJxbJo4kwQHC1RDWTsra59SqzsJ+26R+FWhADCoiyLQ0HAmtwnCbs0Da6bYYD5cZLB
	TDqeaPz3/J6TV5K1ZzktKqVWhx1H0gMh3sPrSXJngNbDHrcX4IbdExcc0uhQqDb729gvcZfnPjj
	NGtl2HDCOUDox1rRZpee28ShuUHACAqZam6qbAWNTYwDl2GVnDGEUmbM0Ou+92b59mpJRwLU3Q0
	pnBqW74oD+QMRJQKWwmi6rcfmuBE2gY019t4+hL6e/qwRqv/TUp/pv9/+FqrPWjwOO/5maKMu0N
	5m+wPRBhA9udeqQRvTxsmmNXu2/AaNaMb4EqqomXThUTv2pF8/l3iv+7K2W/Wv3kFFCRSZcbRlV
	XZJsH98B+UX4vK6uUTSUkjm4gS8cA5H7kQjY2UsgM5eo3ntr6Ji4fbZbO67A59mJNZko+kFUfr4
	N7iw==
X-Received: by 2002:a05:6a20:5491:b0:3e5:396d:1f89 with SMTP id adf61e73a8af0-40148fc2d8bmr4947552637.6.1795220820835;
        Fri, 20 Nov 2026 16:27:00 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:59 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 20/22] ARM: dts: BCM5301X: DIR-885L: use gmac2
Date: Fri, 20 Nov 2026 16:26:00 -0800
Message-ID: <20261121002603.25254-21-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 473baeab9294 ("ARM: dts: BCM5301X: Explicitly disable unused
switch CPU ports") left port 8 as the only CPU port, and port 8 connects
to gmac2. The MAC address from nvram is still assigned to gmac0, which no
enabled CPU port uses. It is also the et2macaddr cell, which belongs to
gmac2 by name.

Assign it to gmac2 instead.

Fixes: 473baeab9294 ("ARM: dts: BCM5301X: Explicitly disable unused switch CPU ports")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
index c5099defe9f9..b64ba9afa736 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
@@ -121,7 +121,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et2macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
-- 
2.56.1

