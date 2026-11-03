Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719911;
	b=bV5v6rCQIkpFQU78N+BFkoV43GrjTDpEQXf+jZiOXRnFLSTIV6hfSXtjEeLyZK9MhGwJ
	 Z7osiPjfc0kL91zoIP9osKbX4DNvYTTr+5HyKPQI9He4spV5pk/kpxmyktJ4Fr3jfk6tf
	 2TMNQW9aULh56lXM9v56otT79YfZuQT8cLWt6it/2qFpl2vVAAOaKrJYafqll5q3jNU9Q
	 ewdeYIxhIoU9PgBEf0RRi295iuw2rKDTHjI+1ANdV+aQNbcmoSZL0zWA00gPoxyRxvJek
	 bxLHR+R/qpuVbJHu3dM2hKGitYlUQgOf05F/G8iTtDkK9ks6D1yJRD8qR7A6f3kF5wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VTVjbTeG+iIcoknSp2y3rgvXBTLyVqZrj1BvDpiUQFE=;
	b=MrKK9yAbjDSLyiTb8b9RoBmpkaj3t60oFRKVm8vw0a/ZlErsprGKnZD1y3OCLTE1Iv3T
	 o2yP5mDDUWylqwjPpILC8TksSv9IM+3v1ns0GNR80ibF/jIFVCMI87q71MTAJF3IUdOtz
	 Ez+DvJxEAqWufV4Qv4/kOLRh1Dv8hS78Y/FvVKaRqs0blT2+UJXuS82sJCI2Mi20uZH8G
	 ExZAe8CSBGziprB3Yu7LpwIpfRob/ZGcSLflUR/rVO6bQ/mT+lIlexL2LiDCH+dZeyh9+
	 sIF6s/xcSu8mq27LQVqXloe7Eu4IXgRNm2E8gJ2RfXomfttBg2U0DUZk8Nsi1J3mcNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vS0QXdwG;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D219A606A32C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D219A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vS0QXdwG
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8451a619da7so3055871a34.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793719910; x=1794324710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTVjbTeG+iIcoknSp2y3rgvXBTLyVqZrj1BvDpiUQFE=;
        b=vS0QXdwGh0kjR+TkiYgkJdmF5KyYlGzQ46sODLfkrcqkUC7Hp9sVeYOczMfIQaB0jp
         QM8F4nAiaZvOP/GfKyh5ukgSrcwjoOSrgAR5T+KjNrfEq+9TiXM91TmLLhDVCjsi4Jc8
         cE+AKMymMWysRAJr2+jEJW8uuioSdvt/vwHfz9nZ9MHug1d0NO0TLFpNClBwp1lBI8Jy
         AgGGsPgIgWuKcW0kElU5zjEliHh77qIlP6H2QMkyq/RHnfpKp9dBREz8kcmWCyc0mDgG
         +Gjly0XWhgFOga54AqDdr3oVDlT1/9dMCT3QZ90CQXDGtlphwDxRxH1y7No3GAuu9oou
         t8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719910; x=1794324710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTVjbTeG+iIcoknSp2y3rgvXBTLyVqZrj1BvDpiUQFE=;
        b=2K+/XV/E5+uRYDrFCzuUhYa6V8AcoMMic29IzZEdvC4lH7DpIYdXCX7e0C51Yws41v
         s62I6U3YiRDxOQv3segRLKW5UBoYQKQ/xI7p7UFCbM0AF/QfY3oy792CIohipglYls/+
         PrmRchwrqD4yq9LPtTF3bxRJCgTtzX8CBB9dbHIGRG9TrqlctKnvP4/bDnBfYJCj7zJ4
         xZUeuHO2diyf72tpwUrBIFhnH3sX+amMyVOhW1Wo9+omZiNhURsGu1JCnHR6tEs4SR3C
         DMgkuzeq7x25K6qUmq+nxJa0BL/A5xdI5dhDdOxxlmAhnKa9vkeN33weFyRKKHZpH1dL
         ySGQ==
X-Gm-Message-State: APuU4Z8gaZ1y9W1PJIfb11rBEiw0GuzPABfNO57xj+PDC4UVUucvqQYL
	3i404X20B1ElChk8M2TIx3iaBx2wH4Fx2B3L8ZV1bbdaEm3J7Qp8cchx
X-Gm-Gg: AYBFou1qmuEFQpRMcu5ZYuxnUifrU+Xv5UHBy26/GVYWtYbzzOrzyqH+E6e2cW3sHzf
	sGbPA6JOExx5Nds9LKUTttXc0ItR7LkS1AzYcjmJ3oFR1gbZylRmqoKy9FCumNo+QpH/Q3r9ggo
	evxWdnou4tmL6u79ymwlwTkp9yBp9ttzXDVM1p7qSH4SY+Lxa7Ddf8DovWz1DtNqphQduB+HzuQ
	FvJwQc4e755jKDljJuUYdv+2+A68vZU84cnAkIx6gsEBmTHedIH6maCSlV/S2xL148H6i/VLwVr
	coQLgfnp3J0ZlJL19WyS4Y1dW/jI4J6L2NFOe0s520y64RX9HEqWHDQJYXRCLAjX1IumcJLSQBe
	40XlpjArPV8CJM4Zyr8KG9AlYuTlJsK6qAKoXx8SOyGVSm+dKH3t+d6hj1bze+E1vxWyc4wb3s5
	a7S9xMud50hoOlFPTBTovuBOvelDDBHnuglUOClejLAfAQgueK6RHn6JYxk7G/qiC4dNyzM9dIq
	yylBkapDLIpaPppaybR0Gjv4VmI2qScou0tRF+WtVZbHtnJt1//6G9zIosZ+iJ1oarcgpAPWZge
	Gbm3bHd0NATxJb5FuqYipFahQ9zYSFd35/mAPSrKpxisVoAWm9Y=
X-Received: by 2002:a05:6808:8896:b0:4bb:ac05:9ebf with SMTP id 5614622812f47-5640ddb2da3mr5827706b6e.14.1793719909728;
        Tue, 03 Nov 2026 07:31:49 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11599188b6e.6.2026.11.03.07.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:31:49 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	diederik@cknow-tech.com,
	michael.riesch@collabora.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add timer node for rk356x
Date: Tue,  3 Nov 2026 09:31:44 -0600
Message-ID: <20261103153144.343764-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103153144.343764-1-macroalpha82@gmail.com>
References: <20261103153144.343764-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the timer node for the rk356x. The timer is present at the SoC
level and is register compatible with the rk3288 timer.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 1a4562df20ee..cc3faeb9a86d 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -1373,6 +1373,14 @@ i2c5: i2c@fe5e0000 {
 		status = "disabled";
 	};
 
+	timer0: timer@fe5f0000 {
+		compatible = "rockchip,rk3568-timer", "rockchip,rk3288-timer";
+		reg = <0x0 0xfe5f0000 0x0 0x1000>;
+		interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru PCLK_TIMER>, <&cru CLK_TIMER0>;
+		clock-names = "pclk", "timer";
+	};
+
 	wdt: watchdog@fe600000 {
 		compatible = "rockchip,rk3568-wdt", "snps,dw-wdt";
 		reg = <0x0 0xfe600000 0x0 0x100>;
-- 
2.53.0

