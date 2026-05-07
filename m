Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAB3366542
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142833; cv=none; b=eI/ofr61aDq39AqsR6ZrxXwB/yBtL0fh5fp+bdG+/BheQkSULGSShuDhcUYtHcxmhe/zpf7DHJ9afvcuSwSsjh4bRxIyh6aKpy1loE81YWR3T2SXKUwirC2uYBbUdX9mE3M1TJ4stUBa1/gkicVXCqnOn1B9FDUv0DIdqBuPD1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142833; c=relaxed/simple;
	bh=lEdP/gLqj9JlLEHbjI0fI3boaFBdOzlJrficJFhY4hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c6OLpAglsTBBDbyIBAKMsOp/UJ5JVTKc2fGPti0gzKeBWwuFC0n9TQg/vvt+UX6Yz5LCFsMOWM4WTIJzEneN4O72/16zZa7cDL7x7+g7WgJzu/BeOUC5bv6/C5w8BJuUzJRsAz36AmJp7IGsbZWId2xHmtODpzWXAUveZT3uHE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBqjBGGO; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBqjBGGO"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7bd4c61765dso5637197b3.3
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142828; x=1778747628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zxu6jfb8KQTr4q0ip95qIz9W/TDOwx+LsiVMhFYa06k=;
        b=cBqjBGGO6W5rgXKaRMmJV26oGDFrVsbVIffDclAXGQKRzf/zQP+AZm1Xg6xbm6eb6N
         nGtDrhc3hlZSw3o8k3yspUaz8wLJ/RIEMmZo4JBgMVXyCqPZd0Jkk+twoCAej50EH/6G
         vLR8Ly262PRKAYJHgnVoy4La7kJ30XE9QnoVsuJw/Ihv+boEwfD51q+uNOrVw9Bcas2U
         qBG7F8ZIHStyTBECem7Qcqq4fv/RBj+7u2/NeMBIWBnNdpeOaRDzD4lfNN40ZGHu863u
         vgHpzHeeGncq+ZciTs8R3PoZVyLYreFyJrENZEPFUIRjP1zhusT1jzHGif7I+tQCxnCN
         vEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142828; x=1778747628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zxu6jfb8KQTr4q0ip95qIz9W/TDOwx+LsiVMhFYa06k=;
        b=q+pN7vIsJlSNnsO8AaRVNJJpLC9kdp5v38hLBx8FXoDaz7NOgklAS+3L+jATeW8+xt
         uuSfD247Z4Z3MYtOOnGL4RquV7W9/MdwXdpBRDIrpsywSfKCaEEBBG8Ykk6ShXD2tUXu
         OlY92quyeQILjmIKH6luijAHU8StV/ckgeIMTGlOy+LirtlK9VCLLOesYqO41+KCrrLR
         8463OnUSkql/ZJ1rtEMSrC1EZrPZJoMGm+YFinPNr18NMzvIgP5DTgm00MtxlPbm3yZK
         qmMMvRWgjQz2vOklQugeU7HSYWGussj5pJHENqUanjRjMZXnV+VcEblfWzklJZ4YvnEr
         ZJVw==
X-Forwarded-Encrypted: i=1; AFNElJ9P2+o3z2s6amp4R4GoFBODS3q+xP2EM3/r64FrG+ZgMv1yX0Bpiy4BJGhFn3n0PO54eM4A/GV05QLm@vger.kernel.org
X-Gm-Message-State: AOJu0YwYOjKNh4qwFfzfsGyvXulIk1hEiYjlVgq/b+9jQV9DwTeNDBsF
	THfiCaPDHe6yofud8F7T40mIcRZOdAocEtktxd+8/20Hav+/UNn91UDq
X-Gm-Gg: AeBDiesU4ChXTlMWYihtJjlgHbcmTe9wnlGr9PLWC2doTPNSU2Gna5gVnicYxQ3okNp
	CxIr2sEjtkSIMv3hdVv2Djd2YFlGIv+7aaMqUx98UCdeQVYFrNQsKOropTjoqHAu1prasq4QzVV
	iQV66KVvOuhlKWyKSRdRS7GiY3fG7TjQbj+ltoSyIlModv2J6OPEID0+fMIUIdzDWgExIJ1yhSr
	XFAWuCsi3XIUlLuBOJ4s37Hhi/FCJv2WrWnPcJpfdhpJlUE5giKs8qsP+M6r9g8pcLZcsn4OPRC
	wrGW7nFbbh5TkLvRVWmHHnGgFawGNWtKqa8IOZB8WpCVBXZieiyIe0BYAv7eV6BI4b8Lo1+VdGZ
	aw58/zsu9u7w9zbROInUAYwZvYUizF6fG0/qFBe8puRIIqVfIQKkPKNLt7unFZx6ekpEmdUkj7B
	G/aWwVe/ip1bzuk8+u4RIPRfI56oeIZHFRT0Qzqhpq9d8Xx9o=
X-Received: by 2002:a05:690c:5c0f:b0:7bd:9391:b5ca with SMTP id 00721157ae682-7bdf5e7c904mr68027307b3.30.1778142827969;
        Thu, 07 May 2026 01:33:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:46 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:17 +0300
Subject: [PATCH v5 2/8] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-msm8939-venus-rfc-v5-2-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..71e22584a46b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,29 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0

