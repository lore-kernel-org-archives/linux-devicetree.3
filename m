Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638112;
	b=SOnC+NakoJ4SueJSSrycbA2JB6+up3LSrGaMQ62HhKnFhOPAEDZ9kchT69jh2JsIcEQp
	 BJ6XkyQKfFoEJz2X4plcaFhTd56gn+Tnak/Q8ehOuzA9c2eCzE8QDc3SC+1z69OM4095z
	 FBQcNVXtOpz8z20NCrb4pNmAeP1NTd4Y8DKxVBEGQCAhWs2ftqLwFNWMIpPgtr9HhBGRb
	 fkbsCRFJGsDuS42iA3Q+AtbfQ90mtvWbgCCyC7BHn6OLOkZekBgz9Z40DCBkjrTAK+0uX
	 oPoWLXAJWRqyb7A1dY0hjAfaDq+nfpG2AI+gIU7s/T6H+Ys2HQQrNvqgViKBwLpExxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gqs0+CN3yF+wOfy/6rjdwNO/hSKMqBqFCGEsSFH546E=;
	b=XK32RGcpJkOVORurlrZcc0Y08QRG+pUS0pRjwSR4fxgCEo4VaquekRUgnnzeFifUHnCz
	 pkIBXBg5zGIqr7sNWV6N0nA7luYLk39tpSFXXfv8ykpl33RnuN1c9iiVa8OOV+OYHVy0D
	 AMocsJVSG1z/g1WNKt7R1+1h2rjMMqK34Sdbf+yS6w2sr14R78bi+y6rwBzWrhcxf/mXq
	 F6W1ooS1r55mn9Zu+tc00x4met5F7TWOq/Jr2ytTOOF0yXMWmq0b9298it1Vxgw4sRSC4
	 Kv7CL2TLBlLvnRTE+HTSajNbMOsvNNIGKRmzrGSCLFEYkvGWooPraqpOQBaBwzleiBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b="ThAuWt/q";
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743F1606A699
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 743F1606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=ThAuWt/q
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4ad4072943dso2099064fac.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795638110; x=1796242910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gqs0+CN3yF+wOfy/6rjdwNO/hSKMqBqFCGEsSFH546E=;
        b=ThAuWt/q3303JtmtGz5/JedklN/MTvEYgYp7PbmfHBsm/uUWPVrFZkzFEE5xCwSVUu
         8p8snvQokctzHJJdaz+nYbjgfQF8Z2EUi4sD5Shs/5PTRJy5X9n6HeJ+4UPE6XVhOIJA
         FysZ6Ik8nASn0+G/AX2uqPZXa9/jxdhvsjEcqhH5IY2XC0TTL6NFPuSFk9w14aJeeA+t
         EaXAQVLwlLiE8NuiAQR4tC8tKaLE6+LRecReFDvWOB2Ggp3NreDim0vpoVNNwMb06llO
         XQgNkfNxmTPLikkLTNsR0RTFnjhnthipY/jMlxpiV8EesX4h/Um8iLcpc3Gswu6yxwuM
         FlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638110; x=1796242910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gqs0+CN3yF+wOfy/6rjdwNO/hSKMqBqFCGEsSFH546E=;
        b=EqIwxIs03cfQ5rU8U+tXN3wok0Kq1KyNGYUR6ATxvOzVNcHE1T3Aj/qV7+rqmCCDvj
         IAkxYeZXyFPZ4YUdyk17C2aPajpKG/liqwg4QQGhx/Xn5PQ6emEMfgyqazO24umampmU
         2lsoDmQQWgQl24wBKODwoO/L53Yzvr54FnMLZKi58S3mhxTsMsuUqntokctzhi9WxUz6
         9nw30pfbJ0L7jC1OA5zyEYU3irFVqRSMD9ysjlRsBplE8HwH5xLkquNsmQBId4Zlcsbm
         11jaP4MSCxidGyerEoRiKoQlDqcHqOcxr+kdo4LDAZbqmArzpimwzGj0WT9FPSnn43Jy
         3uIw==
X-Forwarded-Encrypted: i=1; AL+hErEVdALN0p/gL08qrccujxxLpPlZ6xk1YFK0VJeRw3kERA+iIhSNkC/Q96rK5Sdg0gQHI7yOpivaeF1a@vger.kernel.org
X-Gm-Message-State: APuU4Z8BuXUkbMWQGFh1dAF4qAnveeXLWeiuZtu2MUqR+sx0EpsEUTQv
	LO/L9rIQcJnnN+fgz+p1KtqA4aBaqsGqNKbNLUx7OPJYO5oeVr1wrRCLLjMz8NIaads=
X-Gm-Gg: AZFdTZeOtkp7vuZhd7TP0UOdISWycAoMday5tuXZs7N/awBbdtADltlxEw3mQQR1OIr
	NAwtEHzPI306zU6CKuYUQwX4zYFXg37zPyv4qPJiotOZz8Cp489b9ASj9SsDpdqqmVUZj1q42M8
	1HqRpHbQeShfmaTsqhkJmy9d80vy8ZbHsLZ0vvS/THHJ2KsM41mbZecIhU6K532ASqMp7+ILN84
	7fe5TK6XA6f686hbCsC6H/Z7fzzvVh/R2kQyHBcmpj0j11uXdz6Dy1FblaoQUAr8cksx27Yk9Tu
	X2sYfzQh8pzUV3wgHPJXEqS5PxGvRKdZyaq1KgsOEVXyRlJ2nurcH6iDIs2SpjxXFvN9NhWEtvz
	oImJVvEHRAqsnAw9BZwuCNEMEyypkLddAOZ0mBtOf4pwKrtP84+3arY4pS3SejNgUu3O3lhXTMd
	u8FJlUPpz1whPZqDgZIQ9nQMKLkrxT0Uc2IClHwgA/inz9VRKgb3HCQTy6GVkrNrjngf1ms3/5G
	5jWfrLCTVOd0lcjG4jE8Vjpah7j3jq/L/GuYqxGpLfI9Jk0qh6jl0usOD08WHiJnjGx2Y9ijjYq
	UkfJOGXg1+p0ZUStBg8qQKauXh4zGmgxH3n0x1pYtZkyj+eQqjDedoQ4Fg==
X-Received: by 2002:a05:6871:e3f0:b0:4a7:df5e:d6ee with SMTP id 586e51a60fabf-4bd07c9aa0fmr14107050fac.45.1795638110360;
        Wed, 25 Nov 2026 12:21:50 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm18900550fac.4.2026.11.25.12.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:21:50 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add TC9564 clock node
Date: Wed, 25 Nov 2026 14:21:41 -0600
Message-ID: <20261125202141.1288493-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125202141.1288493-1-elder@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
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

Add a node for the clock and reset controller found within the
Toshiba TC9564 SoC.  Also add a node representing the fixed
rate 25 MHz crystal that supplies the chip.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - This patch was previously not included in the series

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 682bcbc0b466b..b327f64885ef2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -890,6 +890,13 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		tc9564_xo_board: clock-25000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <25000000>;
+			clock-output-names = "tc9564_xo_board";
+		};
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
@@ -969,6 +976,14 @@ pci-ep-bus@4 {
 					#size-cells = <1>;
 					/* Map 0x0-0x1fffff to BAR 4 */
 					ranges = <0x0  0x4 0x0 0x0  0x200000>;
+
+					clock-controller@1004 {
+						compatible = "toshiba,tc9564-clock";
+						reg = <0x1004 0x10>;
+						clocks = <&tc9564_xo_board>;
+						#clock-cells = <1>;
+						#reset-cells = <1>;
+					};
 				};
 			};
 
-- 
2.53.0

