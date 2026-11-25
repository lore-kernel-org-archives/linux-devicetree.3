Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606000;
	b=DL18AmQDoOn2PiB25br8xAYq27kCEJlVZyxxEz8jXbNfuuj+suBH4U+6ZtYVwmjAuIuZ
	 95ge7/0b6BWe0cydm+6Ce+k585YbsuqSn27pbIAKhWJdan0UmgBDyvTj/xwosWo9341hi
	 GJTekPQqhW5P8lP+HJUPUH/zL7F3rYtx/5ogY3X0TQg4WUWAix11CMvg6qqeFib/91k7p
	 ARqAbgebR96WMfYfkdn913S0X21RepKOqHSAZykGcSfpoazTsrQ6dNsGWhTv/YPT+C9Vz
	 s9w/rtT/QQTYeyMzuNlYFD8Ctca9SqqW9RVMRy5U8sruvJ1zMpBs0DN+whjnOMu65rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
	b=KnUj1UHysc9xD5TIHgA4dvJmc4Mi6OM0x28ZqnanWhZ4n+LACmxTHrcx1b7jVKL6a1ZH
	 T9QRr2b2+AJ/Q2a4VxirvrUUwqONR9DGvgzJkuuay7mZBTdnQaSdRon1RK0yrTrCJevQO
	 7hNR5kAVDzNgbm9iWaYlT8RwsedZWsV6oWr5FovXZQNgJOt5IIyWdDifFa0id5LtnZvH7
	 p0uGKm9jiWRlKIWnPM0aaYOF8AS3sXA/2vHELsizwMvslyS1TV6JgoKkvyTqwkYaL/0Q8
	 o0bVYcxqkIvDUW+Y4voal9F5rFcK3TPMFBOXY+z/1ldVwxPjIk9byoFRrtvBzvh/n7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlDfi6Fz;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF9F60A3835
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FF9F60A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlDfi6Fz
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso7907224a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605999; x=1796210799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=TlDfi6FzLVQEOp+ixHcB5vNlbsGUZwa4mcaeOkjd0jh97u/dAQPOd+fuIXap9g6xTE
         AwLzQC2AQVty73GXcw/9igtE6XHnnlMq9jJ4lgp+wwa99Tl5lQn/dXuLJ84uHaT/PFST
         Egd2SPXKhqhF7vOSWOPQ+XEVOyF7I9XoxILp+628qqpwvs1XkoL/LGvq+wQbbkVdtOVt
         38te5+rV7/JDiIkqpzLnigVcVLJsMttZn858RdW7lL2aBk9ZtNMwRkW3WNUdKbwaF1Lm
         +tOC+jz/q1dgHHIfaPAr4ZUYHn7ha59kQ3smCkNx7N0u1KROSCXcFhJ6IJsGV3QxTAlj
         CXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605999; x=1796210799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=twlaJVtjD5r6zgtfv/2LuW5cf5qRe0fEWxP6oj+IeB992DCN87iB7YvVpZ1AIVl5m9
         E29ygVwfP2XfoEWGrcrydLkhoVgDRlicLox4S6Q0U2xUXnXw/gICkELWMQKbRwagUVR0
         cujj3Io35EmpR8+lEmfO+/ebT9N37yGgd7MSqFe+VKc0zoTc4i7BoIxlIKI3CUF4LN2V
         imVujlYE9JA2case56BHv5lQxG73X1naa0LAwxR2Muz9TlEH5svSgjPsRVXb/Z7mfSOJ
         8sL4WcE750K0sPjX8PyJpmfuDE7+OkRTBx+FqRsl15vpzb9nGlsxMMvUu9Y4v2EpEAAv
         y59g==
X-Forwarded-Encrypted: i=1; AL+hErFiQ+mkrsYeJHCajLs6g6Wqqykyse5Mfvb64UbVyz8QMdk4gkrObURU7oaN3FRATPPe11kC0kyV6zJR@vger.kernel.org
X-Gm-Message-State: APuU4Z/OSwrvqgdI9Dvtn9tco2MfaKd88w80DSTTANTlBQTWitNM0TNL
	Ad6XqEfeRHujpOfbxVmbfU3JbuVaGHqXsnMH+lTTFndqs5kRvqlY1s+S
X-Gm-Gg: AZFdTZfr+8iCJuSPURkog6fwuXmTFjpmEtBxWMJUdtBoSXEwHWZ9u+zQrz2T04wKXuA
	NwXG6l1lnOqSgucNM0Pm/Fd64Lt8j/FP/BOHatvUf3FX/H3rdEpo9JsahMhvv1KuUnSQuJM4hah
	678gAALyvHkNIU/qpqpsp5UvT6zV1C6HslbnFvguPni0FiQ9XxY9i1RKtdpJrW29Rv/iBS0m+oT
	vPAMsGAwYniFVQdqvh6uIxdsrKEjETQAIMh0UJGKisfioocoR2UKq+mnctyJTMoC6J+K+jmYGOm
	7HmwWM/r7PBGoLESfgWZ/EDVHw+f6nTYruukoL1U6PAjUb0X0mbTFrLNx8AqAkHNAvHtycTYgwZ
	2II4NRv2UuVrjhRCMdC79+CvgGTYB/jrHafEi3yfm+w5UqAiprOIlpbsEa1V2pKjO/EXqdc0/Nt
	Yg+rbglhSWwtCxlqxMMPGg1+V908itmCFp7mZxxh6ktac19UZpecrxiA/7Zl/MX6gBNL0CKzKPG
	H7Wr72n9e3a86p6TC6KsLU3VmeH8sVhCJgOBSpWOhyr5lQ8gPoZMpVDYy+K8A+erBc9ii0j9GV2
	nysO7j8DcMPTZW3ddxLOzIq3REj0uJVuyQfj/maySY8xZCl2JqPPkKm4dOIMEzTvIBqi3ePwlN5
	K18r909UU+w==
X-Received: by 2002:a05:6402:4009:b0:6b9:c43e:19df with SMTP id 4fb4d7f45d1cf-6ba37ed9a8bmr12269161a12.41.1795605998897;
        Wed, 25 Nov 2026 03:26:38 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:38 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 7/7] ARM: tegra: Add CSI node for Tegra114
Date: Wed, 25 Nov 2026 13:26:13 +0200
Message-ID: <20261125112613.237333-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

Add CSI node to Tegra114 device tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 34 +++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index f2766c11ee6c3..61120658f0687 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -53,7 +53,7 @@ host1x@50000000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra114-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -64,6 +64,38 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra114-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA114_CLK_CSI>,
+					 <&tegra_car TEGRA114_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA114_CLK_CSIB_PAD>,
+					 <&tegra_car TEGRA114_CLK_CILAB>,
+					 <&tegra_car TEGRA114_CLK_CILCD>,
+					 <&tegra_car TEGRA114_CLK_CILE>;
+				clock-names = "csi", "csia-pad", "csib-pad",
+					      "cilab", "cilcd", "cile";
+				power-domains = <&pd_venc>;
+
+				assigned-clocks = <&tegra_car TEGRA114_CLK_CILAB>,
+						  <&tegra_car TEGRA114_CLK_CILCD>,
+						  <&tegra_car TEGRA114_CLK_CILE>;
+				assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>, <102000000>, <102000000>;
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.53.0

