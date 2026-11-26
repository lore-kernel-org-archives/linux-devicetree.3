Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700744;
	b=IGPdGyabof+bGkxbPnZFH/zGz4fsIsdYjKAM8+8ycmvLuaKkLRgij1PEzkg3VxbmhfgO
	 vxhL6G4KxxJBE4n1v35UGKgJYqkrSGPq9yTfXApZLv9ZkmJe8c9Lc/DRA89Nemli4VuRz
	 xQXsuaBzGzvVEZD35QXfWtik3BoeJsQulJ2HQYdcWusb2yJ6HXBc+RHV3DVyjxMoRHIaJ
	 U+oRzm5S1z9BL4XwSJZAHBar/rakz3aHot/0L8oVVLxRGVgO/+34oF6aPlrPlC4JT+u/U
	 lsSWFLTDg8eBPq9smC3wVbA9FdwZ+JGrugKqujbw6euJQMR+lNM7n6jtDXVpkjhfZSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700744;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GYvtdup1iOkPumPiryt8h5FINLGh7OImHJxS3+ykLCs=;
	b=C+JUMNmtFRxng6IN/eUuVpJSGedLSZk18NCU1Za1DrIoonoo8KmjAWXi/gkai4xMMCxs
	 WReEopjkQvW8htxWNaTlp2KbuW7t3x7hpDe0nnZQi2/FlZTPQEBQlNJihYoDwh0Pq+dwc
	 Bxl7y7enOft7SV/p+rTG6UP9FkdMTuKwXsPTjsAA9Bp491Zj52s7duiWslYx0D1vvrS7d
	 04Wro1EpltoHDNy9DkhOWde+HtuxgZUetKQauJWmvsj/TtYiB1Pq4/FuhV+xdUCsTuLM6
	 ifHo9Lh5lnnPBat8YutWgGq9zABgZM+zWDl0ddcqWPMIw3MmwWAS6iMY/jDibI6nDCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=koSN8y0s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DB8606A31C;
	Thu, 26 Nov 2026 13:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=koSN8y0s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCAE1F000C0;
	Thu, 26 Nov 2026 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700744;
	bh=GYvtdup1iOkPumPiryt8h5FINLGh7OImHJxS3+ykLCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=koSN8y0syq7Wbizj4EKfZl0lNS5/5tam0qAcLbQazXBmEOYDd+qaWxGQgDrvLBV11
	 JIqxxfJNONL5KB29nOOVHE7IHVe6iQ7j2AfalIscuFJo+djeF7MWXHeVME4icg09mu
	 6n7kgQZJrDBqX5Q/Zv1L+1BQ3a6H3gmyLNUF2Tiidth995lj8kOXHri+9BucFaBI4B
	 801Da7BOytZULKDQ39GT4HWj9C02xL4Y7m5t1B06I2E4j/Bd3kK/BQkqgboSr5B0ok
	 zus0d0PatCHGAepdZpTLsFVfe/gpjzXIEPB0HP9B+O3FiOxeho4C8ygSneBWdq/Avn
	 3p/HMGXABp9lQ==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Ritesh Kumar <quic_riteshk@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 01/10] dt-bindings: display: panel: novatek,nt36672e: Describe the reset GPIO as active low
Date: Thu, 26 Nov 2026 15:44:59 +0200
Message-ID: <20261126134508.320700-2-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261126134508.320700-1-vz@kernel.org>
References: <20261126134508.320700-1-vz@kernel.org>
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

The RESET_N pin of Novatec NT36672E panels is an active low signal, and
panel-common.yaml expects active low reset GPIOs to be described as such,
however the example in the binding describes the reset GPIO as active
high, which does not match the panel hardware, but matches the inverted
reset signal polarity overlooked in the panel device driver.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 .../devicetree/bindings/display/panel/novatek,nt36672e.yaml     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
index bb10d62ac2e4..dabee16bee22 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
@@ -47,7 +47,7 @@ examples:
             compatible = "novatek,nt36672e";
             reg = <0>;
 
-            reset-gpios = <&tlmm 44 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
 
             vddi-supply = <&vreg_l8c_1p8>;
             avdd-supply = <&disp_avdd>;
-- 
2.51.0

