Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2863B49C4B3
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818659; cv=none; b=IVHclOR5VC6h/aI2ojHv/WKh4GLVqGh3padOCmkOTc1YM5gyLeiG7If7nU8H105QFTNTBjJQrX5TnN9FdCK+ohUVi/pz1QbIX1tlCgDzEaW+l2fckFCKRxKjH0oebXF9tkF8azy8Yrt9t7tt3yhwrS35KirlCaDwCc/N44eATxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818659; c=relaxed/simple;
	bh=FAs8FARx+cxXshtT1G3eyaUwce94q6WtqlkaI/wD0F0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aECKor19QNpzDdQUSI0eQVR8yZB+TxpLjzw3dyazQSuDYWwUYP7Q+g9lwvNGRnZw/+TMO+3cY9zr9lEvvqCYH1E/MOILT3I9ReuHPS69Lw+EwBFBL9uy2s6ZkuDGJ0rbCdkz8x4KWbZcoM1/9dw+gl1H5G1rxJ/gG4VX9MK6lYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=aeWb2JZR; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="aeWb2JZR"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-535d60d850cso8247481cf.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791818657; x=1792423457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwS2JWiifJl/LCUFtVBsdg9yFnf1edVgUOPRPwnRtcg=;
        b=aeWb2JZRS5DP82WxLldA5kMJ/DXPL2AItlT/rStns8HJEeQhn4pBJfj4j1wEy8LfXP
         9ycYVBYjFlm/8XJCdXOhNSVrwTGTgFsJ2KLM9by0DV4lBcGFkU2i1VR6l6TyVvLJ/3hW
         CwdiuyKV8bntqnB16c7XR8dsdlBkoOLNZ2jCd+g0E+W1/BxPwoYD5XRNmxibjX7SOjtR
         +/uomhG6m1+rH52ZjK8ej+L3miYI3YRy0S57iFnG6Q53Ea6jVKvXqii1v56tJz0OwO/7
         /IsXOKNUMyTxZv5B/+NzblNAVS+9u/eXManW6VEpTpyCUJdqfkY1rhVNyYX3ksbFTvFd
         FcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818657; x=1792423457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PwS2JWiifJl/LCUFtVBsdg9yFnf1edVgUOPRPwnRtcg=;
        b=Mffm30B3/B4Q9KTGPoAka7N5JztpE5/+Cp4n0EpZyBRlnWwKp0CoLPFGITS4HD22xy
         +5iI5u51qZcScWS2TV4mQBu+h1Ur0h+YqtfvldRkWVBFCht/QHSoZjRiCpkHk9K9D2sh
         P6w5QsZHKW06FzSqBEBpGb3bhCfrNPZVhl9Lci6dcwcfCU2+cAnXkWgVvflj+e8/a9kM
         dBGjgIbVErH7MfON+okwudIadAnVnbK7T/YrWX2OR5g9dpf1EtfuSeHIXiTSKX3p+Umv
         /x6Oh3Hw59MzC3UBEIQRtFPqiUIWi1QMs8l29U7VLZAYGtpCRXb2MuGTQZU75epO3hnO
         WrHQ==
X-Forwarded-Encrypted: i=1; AKwUvByDZxoF0tT63jffqn3YV3ei7ZUT4jjouTLIgS40rS8U59fMb/9V8l9ksjdd372JQfeAJ6N5H7HpX35P@vger.kernel.org
X-Gm-Message-State: AFq9FYLTuH6PJtfOQQ/iG+/LNYoTisfsE3VXdowjqpIepF95PwmRuXXO
	yPtZWnGaVT5m2XuwrrmVGVL2kfG5TEu6Oye0xeWhXA5yYGrFPuQ0aUmOwGLTy32+/wM=
X-Gm-Gg: AYBFou3xDh1wRG4f/us4gHAYlKWBGusI2mcEWdNjLMEMpKtSWfLG2WfGBdGQP7wXWZR
	vTyqdrBemTBcQfOyoWTRaiU5PsVmw13jJj9+jUks8flfXB7vDr2nmHfyclOy5/Gx9Blfvirf1Sg
	vdMn2o5hcYIpnUKZqY5xNilarxvmmdhZSqVA6Cgs6HdrRR/Ak8dkkTZqjJtqAejyg5DEvpZuU0H
	XkoPwZbEh9I03g9fU1i8NQgH5smqsmNZXhCSwtbrz3GqTC4mXbBaT+yqsmRgF5tvjij3ifLYiWc
	3OcT2BCcyyXdwUNVF2WABKhV6L3CHsz2NKYVv4Z0GNAErTDgsJP/sumhRGkH/evN3WURxLwagzg
	UU3LAboz3/Vm6HaUYdreoTsijO6ajvVpRb2d6GCFSgSKiCf0UIHe+tNZhv65YMuqd4m1ddZTca6
	r7pu5Mt0V92CrGrw6bfc0ductgxqJ9kiv5G1OjRIDkrTyl3sduZrylRWhEP3+LzLgBZYRZw7UkX
	9uC
X-Received: by 2002:ac8:6103:0:b0:535:a5f7:d594 with SMTP id d75a77b69052e-535a5f7de61mr145608971cf.35.1791818656922;
        Mon, 12 Oct 2026 08:24:16 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97178de2sm659086d6.0.2026.10.12.08.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:24:16 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: define a fixed 25 MHz clock
Date: Mon, 12 Oct 2026 10:24:06 -0500
Message-ID: <20261012152408.3729237-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012152408.3729237-1-elder@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TC9564 SoC has a single 25 MHz fixed-rate input clock.  Add it
to the definition associated with the chip.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - New patch in this version of the series

 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 0e3bbdaf4661f..b8d290eed2f38 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -891,6 +891,12 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		clock-25000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <25000000>;
+		};
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;
-- 
2.53.0

