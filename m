Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262373;
	b=MC0lb3tkPm6V1l0K4HOgcFK2/cKVyu1Pj2Xwv7J2VSTFZiTv7ghJiMrXoePYv6Fr68fn
	 ErmZ0CY7m3csvL0HkIcD8BJBoAEeRESvd20F+ahLZDEao1LRMT9XKCY8kJLaD2SIx+R6R
	 4WskYRldaSCLy3Vwmih61c0zZ+86i+gvrdrTtlUWOH5ybYc/1unert6qbXLm1sf1FugoS
	 syW7p0Yn/Pr+THEYAnIK0gRdlaPAcog8rbZoCwAiju2nJ+1SxPYej+0vLdQAj32NXpRcR
	 q33tR4jRC25v79yhTF+NZYznoAQyaNxmrabk7lpNpo+pgWctwDkwkT+lR20gEzL8EBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UNWkw8vYb7JpYpnCN3rPDxXzy3LWTgIRTpE3bVdVYK4=;
	b=xPAgtBSNHU8qOA/wfWZiHehMDJAlywot+I+tcdnIuBxXe8d+VZankLbyOnV74AA1HJux
	 zdtlLKyTQ+KAJ5pFFj/Sn8NjGl6HFA8TmHKUqhSFW3a45GUUzLjDmlX2JMuKACQf2a1pU
	 ZUcZKFSmw/Q5alJERijyJbUUis3s/V8tOEvF4KFUAz/rIAyJMGECCsWQ6x6L9DMY9qadu
	 PD0Hm3/m8LEzp8wbwFm7wYCesGVsmtP7BtbgyOF6NTK6NkKz1MBdxhPqY4tCFZxKC4C4Q
	 M48C/mADdbl+B58CmizgfmelKij629dz3obIZgq4voh9lbEQoAcQlM2t0wkm96qJewA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYC+QuJl;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EAD606A32C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19EAD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYC+QuJl
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d01548ac96so3749085ad.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262372; x=1793867172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNWkw8vYb7JpYpnCN3rPDxXzy3LWTgIRTpE3bVdVYK4=;
        b=nYC+QuJlGPWv7gHT2s17wBR0beq6hdlI3uFQngjhSzA4kUtXpyQH3H1w1LU1fjtAnd
         a7EnMLlvtgdTbH32vry4E/b1A/TjMXaV9Auxw1E/CI5SxiGYt7PW+FsvWMZ+wpnSYbXH
         sCwIFZzB0N1wOxlhcdIMCWiyHWX+hjNxql5uYxr8Tg3O+/J7wiOUsLXUdMHHMXLDiWuc
         XClWbpT3IaiUD/5WwB7xaR+Lsvcqh+NkQlkWOTO5cyFd8VuZWeylC8T6C3oV3jxs6fvK
         P5aKzPO80GvF7W+dPBVq3P15hDb4slKQQw3DPisF72vTyN6CphiRZaKN8Jo3En4kYvpf
         eRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262372; x=1793867172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNWkw8vYb7JpYpnCN3rPDxXzy3LWTgIRTpE3bVdVYK4=;
        b=qR6B9hyBRbjZLKKn9l/I/zB2JuRMxwT2N007pWvJY6fvWJjp5BLz2GoIKIT01PwV4a
         ka3bNod2iQ1Dv8/BrNX6QBb+pMvlt2tsb0ZRgFGgmMDFjE8BdWHQth6tIhJ2IGaNVDe2
         bLQcb96Pz9Cisz9c6gAbd9dQMNHYvc0nADKPJRXYwaWd+RfxtTyVIyrXpFkYjg99P6nN
         keRqhWFtTi2qDfBjFScLE3dCCR+lMCFVvKE5m6pv3kgfvd+cRr8Fk/g6YrHN5jZS0MkE
         nj/tpIoFzwBefxf8E2bOkwgRqvBcNiMAd07A2JmHIcRn6zfO2x9cpqroSbpsXlopOIgn
         0gnw==
X-Forwarded-Encrypted: i=1; AKwUvBwgjcQp4/gBImE4/KlB5GOdrlVnjN2XpL4Eg+hiprXRHxuX5gxJObGexI4ugr8/Mgl4VzUyfA6LIJ1u@vger.kernel.org
X-Gm-Message-State: AFq9FYIdOUsXi1YQ6/5HcpcSwJIvi/2qu2nyrUmRv9+b+DyCHfSe7Pr/
	SCcI4jneHJkXH+qGuSMv22Jt69cXLLJtGVebmo7pH77C6n64HGZHKhtbVupX8pJKoy0=
X-Gm-Gg: AYBFou3/XHoNO9w5hPazzdniLjmE41KcE6/UfE/tVn3J2y1rf80n5oQxgyTtp3kCGIk
	4lrGU9HuuwtPuHr1nYc0cu0wcpx3hMR1DNLIrKnHlS1TdPFPl27whVZ7A/+/I/g9MV3abGhqyIX
	pq32wvjwbxW8D/DOZ10J7AB/iB11uaZu7XEBw2/fQhqi3tlKW+s2h+iaFhCJzOiL3N4wkr4AAVu
	G0CtEI+iYUH/8ywfEMrBMgpd2o1BbNEnWUI4fgNp8iKcKnEqGfjZ9EKa4XaRG+ix+5FUW5N/1Un
	HD3Wjkd3ObDUCY6qwGzl58FElt1r1Syb4UjhHm/cdVGPbWiX1ZMLaOdZP0/5ms0aEKy4xA81lOt
	4dqWopbB4KRGhT9qMt2SvF6NMTeWJuw/1ev3Bwx2F36sAubKakENsoZu4RHtPsiRiSKx/5Htuwp
	ceC7paKh1oxIvB1qktUzZy+BX2bTBRWhf2/RuZgIY+rkZ90cY6h7y9N9qVFK/9yAK+EFJCa9oFw
	zznsnoPqDIfGCJOQigTBVslj1Ttdb9qa8my0e45m8fzGhDi2Xn3gTcePZwk+YUBoc6SrtcKccTz
	eYFjhD+hGIST6eXYHcppDCDxpzwom5Zw
X-Received: by 2002:a17:902:f545:b0:2e9:53b1:a3c8 with SMTP id d9443c01a7336-2eaffe75f83mr68645205ad.0.1793262372227;
        Thu, 29 Oct 2026 01:26:12 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a216sm30031585ad.16.2026.10.29.01.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:26:11 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Amin Gattout <amin.gattout@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Add ArmSoM Sige7s board
Date: Thu, 29 Oct 2026 16:25:21 +0800
Message-ID: <20261029082541.469999-3-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029082541.469999-1-liujianfeng1994@gmail.com>
References: <20261029082541.469999-1-liujianfeng1994@gmail.com>
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

The ArmSoM Sige7s is a rebranded CoolPi 4B. ArmSoM purchased the original
hardware design from CoolPi and confirmed that no hardware modifications
were made for the Sige7s.

Include the CoolPi 4B DTS directly and override only model and compatible.
This preserves the Sige7s board identity without duplicating the hardware
description or changing the existing CoolPi DTS. It also preserves that
identity when a firmware-provided DTB is replaced by one shipped with the
kernel.

Add a comment explaining the relationship between the boards and register
the new DTB in the Makefile.

Link: https://docs.armsom.org/armsom-sige7s
Link: https://lore.kernel.org/r/2a1c33c9-8971-4054-a463-60f3ceddd627@cherry.de/

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

Changes in v2:
- Include the CoolPi DTS directly instead of extracting a common DTSI.
- Explain the board identity requirement in the commit message and DTS comment.

 arch/arm64/boot/dts/rockchip/Makefile            |  1 +
 .../boot/dts/rockchip/rk3588s-armsom-sige7s.dts  | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 442d322a20cf7..c8a5a88a0e46a 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -231,6 +231,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-vicharak-axon.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-vicharak-vaaman2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-youyeetoo-yy3588.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-armsom-sige7s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-coolpi-4b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-gameforce-ace.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts b/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
new file mode 100644
index 0000000000000..c3282581b42d2
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * The ArmSoM Sige7s is a rebranded CoolPi 4B. ArmSoM acquired the original
+ * hardware design and confirmed that it was not modified. Reuse the CoolPi
+ * 4B description while keeping the Sige7s model and compatible to identify
+ * the board under its marketed name.
+ */
+
+/dts-v1/;
+
+#include "rk3588s-coolpi-4b.dts"
+
+/ {
+	model = "ArmSoM Sige7s";
+	compatible = "armsom,sige7s", "coolpi,pi-4b", "rockchip,rk3588s";
+};
-- 
2.47.3

