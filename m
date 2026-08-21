Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C735C3FFFA5
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 07:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296353; cv=none; b=mg4rDYUbXtqwCEEZUBG1Jd9TlRz3W26qxppD3K6Jb37qFjkxnNZCq0leninajEVMh7uvhxjrKKgrZQSx5jtB/E9c39u9OdHOYu1Xijhzoqsg9unNMk53i0CT8EThQpDgSN6MMwpbKxS38pMdZMGyfEzmpba0XnpXAZVjT4B5lVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296353; c=relaxed/simple;
	bh=Ce71U+Lyj7zFttVA4Kn65SW6c32KT53zyzKRPu/mOUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7T1MhPuC67c4esXC3tHS6DB/BG5PX+8Z0b4RPi2H0S29halCBHhvBnir0EnlMKjIFLKNOFx7BVWqBCtwBXrk+SJ02zoIQCqF0UBE13SNdf5/fb6dQvmWdIT8pMzNrCm3YKKIvpCBUnEFzq05urEcuB7iL+5ZfbOH7rlnXitHZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ZlrxrRH8; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZlrxrRH8"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a3e145e1bfso982047a12.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 00:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787296349; x=1787901149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09WuqDumRufpTv9AnStx+lDfstjiG5sO30YMgz+/VHI=;
        b=ZlrxrRH8PG+Mlvy+JTBJBJivgUoAFSsWHVsINndOu9KbgDMFIbvLP3cHnzX7sOrJLK
         pEd8ANlcwS8/IediH5tNt61QgzcHTHkNXDpfSOBxW05yy8AN2KQTFK5EZb0C60soGrhd
         cvwHbuHwB+y+QCw0Ips0UivRRe6Y1xAoHfqzCeFRtkE+Px2VNDPAsuw1jYDKx0gHZf3z
         MDgcQ55zyVt9yvntPqKsTtbkkN253+nx33B84UrXPq6TjtvmaRJHrIfmN0/f8YthDpFw
         GSpJCwUSrw2wnh+e/yAvLFlXzVfstlaOlVB0wTBODmYBbYh+2IRqIWOZALoyb7+5zdN1
         zPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296349; x=1787901149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09WuqDumRufpTv9AnStx+lDfstjiG5sO30YMgz+/VHI=;
        b=VBko2KJ3OxwNc9+PWCmmBanGM7ODmXLWizu7Hu+78f5tKsAV5mRz5QJGCO2fn4ueYC
         hTNaZcWAfJG8z8gfq9+PEYfKHpu0wd3gLDQDTSTzwoKyZCNdxjDEQOdORKDlaJ9EgTvw
         jzfjIW0+0RssVG9prKxnwq8/AEACLyy0PdOdjnZQf19/WOhLoClxKnjVH8nHgIDlQjA4
         XgwMuWqgWUh4dYWvgQHYyHpiEKJRqaK2Shre5ho7lYwRRli6qqi0ggMiOTO0o1jEMKzd
         jWKLbWtzoYR070dpXpeWL0aFTN/FO5r6t284O4lLLN4o4T1OLG/c0m5hALR6zIDkV+kE
         DkXw==
X-Forwarded-Encrypted: i=1; AHgh+RqE0vUnWIrd/9d2p8BgAHMWK8Dv24mHWr/nIpjYO5mI07AGZEU8osstxeHRhXB3hbL3TOiUpF0EcxpJ@vger.kernel.org
X-Gm-Message-State: AFuF++lEFiiwt7s9Zxdx9jNt/WeXJEibkbxtjLaDxBpQgE7+zJqgjNlf
	GGpbBaBHzuztRJEx1d9+o6Yw7pm0Wlrsj8aENNbfQcNS1ECVR3cKPKS6Y2XdNOE+KVo=
X-Gm-Gg: AR+sD123mOgaIds60aPMJptIZBbK4QqSZqfES6UkuMUnG32diTZZKMQ3nM/tT+zqf8e
	QwD97PKa46VltMb5fjLuw4RGEUTUsZ2Dol22OUcBBMc9j5R4fllhQUMrgDWlu1f7GdzA2vHh1Jz
	QQ4T1iMVcLFNgvpugmjv5rakNmBHYf8re3+8kGC2tblDOV5HXwyhYxBAM4ZwJuHkBNJ9MuuPhGa
	BrtJmQ7DitL9R5nLVaJTL1zZNZq3AbFtdzft9wN/ad2wYrf4ZvPx4AlY2csSBsfaR2pDe1YfuNi
	DiWwoTTf84e+i+gdVPlJ/QWSG1PBkJXSGWkOVpIElQRZXTpN6yKdiw2sUgbgDJ8SjgaR5bALP7u
	WSutqmLlFoIN/hWe1kRPAp71xCcWH9RLpplIwLJJRN1+ATzpgYz5nk1R0rjSk19r6GtCYZP0Op9
	bRAOtVrBw1PSkPpqdf+xeUtHrs3tEA4VaYdVBY9i7NJiofhUQzNlMt3mmN/eoNY+7/kPLDJxATX
	HStE7IcjTTpVh31X7uNEnwlGev/2xf6H5QcwB8JD+Q=
X-Received: by 2002:a17:907:1c1f:b0:c20:31d1:a899 with SMTP id a640c23a62f3a-c246a4ad97emr419311366b.4.1787296349036;
        Fri, 21 Aug 2026 00:12:29 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e04b5sm339431866b.5.2026.08.21.00.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:12:28 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 21 Aug 2026 09:12:20 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 touchscreen
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-fp4-hx83112a-v1-3-474941bd8860@fairphone.com>
References: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
In-Reply-To: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
To: Job Noorman <job@noorman.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787296346; l=1373;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Ce71U+Lyj7zFttVA4Kn65SW6c32KT53zyzKRPu/mOUM=;
 b=ShyNO9D6xW1RkbEp+BIy/OyUkLlvVM5Iu6qL4MNIYii4HOCsU2rcM5jSRafguIYleAndUwYIb
 6x1KlT8oc9IDDcP2ggi9i9ShfFSfvXnSmYe+2q/vzChlv/IVtJKv9Da
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node and pinctrl for the Himax HX83112A touchscreen found on this
phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 23f950067a08..ff609f7e1796 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -626,7 +626,19 @@ &i2c8 {
 	clock-frequency = <400000>;
 	status = "okay";
 
-	/* HX83112A touchscreen @ 48 */
+	touchscreen@48 {
+		compatible = "himax,hx83112a";
+		reg = <0x48>;
+
+		interrupts-extended = <&tlmm 22 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2340>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c10 {
@@ -1117,6 +1129,13 @@ platform {
 &tlmm {
 	gpio-reserved-ranges = <13 4>, <56 2>;
 
+	touchscreen_default: touchscreen-default-state {
+		pins = "gpio21", "gpio22";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
 	qup_uart1_sleep_cts: qup-uart1-sleep-cts-state {
 		pins = "gpio61";
 		function = "gpio";

-- 
2.55.0

