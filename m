Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604185;
	b=l45BWeRsxGQl1Zq7zspISo2cwaZwRGPt0F8oL2HgwWlXdc795YgqnbqqhAyK8vTKM9EP
	 YazuzbuFBezdeDAWAWDeMtyK/ObVLKt+c/08R8PfcyLMg89REp6YXHj3iUqQoMy9F5Vso
	 4WcUDul/vjWdTbMmr6W4641j6HUElUdRxbDKt4f6HxdQ1SJRymSYFlhWOGgFg2P3tW5Lc
	 DRdssdgHy1rqWiw0Duk7ECOeoYnHfE/YafY3w7XuPn+0LeJuqGMY0aD7FYTIboFV/8KqL
	 VU19T+0oCMV6SUnUdPUsOdo1ml3aRlnKA26B9VB5FpRHqz6T+NiPq2wLOBFK9PLxBKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QBdgOJlsLt8Qt2YLb95EyOEaypO8pVHtrEH3jnavKt0=;
	b=DMb2F8BHXFAxPVVzJgMSfdu6YiW7xEYgvvbTQLFb8+XMaUvPB170nVlNs6hv05x4Xhm/
	 FnE+gtOUjnOfp7rtuYBhBLbruCDQtYKzDH4q4opr1LJOk2RczMDApB9H/WuYeB89Nm0xO
	 0C1htrMM1NxjKjJ/YChsahRFDQzHXmbpd54y5vvgFH+CUo00FVzJT5L/s9solxYjdkPZD
	 br8aGhOInWfW08HpIa8eLhYl3ew5aWYWH56LbLeZqtpPgBurIc3jPmWKF74moQnY4zHQH
	 Tuz1/axkKCc543F0iag70YvHdl9tupbik9l6C2wM3yuVhaZ6MCkNuUVH9f6ztKQIpnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f5G+K8mu;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2F660A6F44
	for <Devicetree@vger.kernel.org>; Fri, 13 Nov 2026 21:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A2F660A6F44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f5G+K8mu
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b244fb7fffso1583600c88.1
        for <Devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604184; x=1795208984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBdgOJlsLt8Qt2YLb95EyOEaypO8pVHtrEH3jnavKt0=;
        b=f5G+K8muPvFutbfJr6R332HD1ROW1xYUUgwMqGlJG5sdS8n521EAX9bb7/fEpuROB8
         eNUbtmskhwKN9TVqqp2dJSUilyYGIHhpsJxhJDNg8bjAH888Nnj8sTfSQWKWG+KtwyCH
         5yt/NdJ8FyoTKKXpWUSAhC/Q3ZjHTzz8lquGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604184; x=1795208984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QBdgOJlsLt8Qt2YLb95EyOEaypO8pVHtrEH3jnavKt0=;
        b=THbCD330FgR8T0f24YUL/rdf72TmMpjsD0ptXN5AEQd/KnxG5rKhyZCDWB9ulQq4Pd
         eWwwBSCr/NuTq0be/447DAaOf3Xx777dnUGMdSFLe+yHrC78o7LzZ2H6q/TmShxeh8W5
         0IPLbiJk6Re6YwWkVVi7OeZga10DVALGERs5C7UlGwFxKAq2NdmY4ZU/oO9IS/JQXJYW
         xwlc5kJ6NNOaPluw7owOwBuWBjGGf7wXaJzpv0jE64dz+2Mz0atEIBNpJXn+brIa8fW5
         hxKVsdzW7tyGKRnA2+8H8Qh7I5V4okH3wFF1fTjN50jgvnxNkvBDOKCxXiU/OPSqL4cp
         TSWA==
X-Forwarded-Encrypted: i=1; AL+hErE5b7Gp1obCCjVJUCfXqngdDO36m2vH7ppI7hgpqmrRTPfZdZVfvyxobUlogPs3wvUR0twK+Nh1PcOu@vger.kernel.org
X-Gm-Message-State: APuU4Z+CDln/jDBO8CxZFKGx9pxkQbW3ZJhrHHpcUXzxM7uVT7Em4LqT
	Y1Rb4em+EzEX2EvKdOt+Pt/93LHJnJ/Ol/Fz8D0x8n+FrStfZ1SD5j2FdCuSRehIjA==
X-Gm-Gg: AYBFou0jY70qgLl2w2gZRr3tPyLbxE5PZmvRLyz6Wp5PVSXIaUnArK70Jgc6FJXOtvU
	oQWAz2iJiBUpBpXDJ4n6kjWQX6VcjPV1p3LvlsHafRejqY+/38GJi1NWtT7iR2IWlJ1Ce7Mv9dr
	I2y6TsG1lSfUJiA5nqQPwRLT76xIETqwOK48ztS0AWHKftxTxzciXzoWvfx7/naJ+u7uXqKDZcW
	6Gp9xjZYUhELVnRGV+DhhtApcwefCawC3xGLycKGI9rllIB/Eted/6Rvk1ebV/4iYOJP8nA5v/K
	q10xkDtqFFLjzFF2H4LYOKtJfik3KrNqMoEx+fjH4nYL31ZVthZP3KCF5zoqMf6hisKJRXPydfM
	T97MI+tzz1eFjnNT4OGaYATRj/6yK5WgOGWbT87rthR7oVfm7h0zl+8QSNk0hdacv9/hiv97Kik
	fM599tipqoSc9kecMhvLK1qBXEFEY5gUrhWO7wEVFYI0meNegLueK2BMmPVMaeF0MqYVBM1M7QS
	OffMVboeHuT4Gqg7MnV2MQebaRnuKNrlA2S7Wa7abgzAIJPGQZlQOCc+MLaXsU0xp3pFFNEnhZz
	AhwdM6s6zj1UBHNMbW3TRXIpJOLcYAb5HZO0IPeWOf1CIcWNLahHRMehu6bkmvbMZQRoQnc0UCy
	RSFpTPxOMa+xUOxTPzAmFlrXX0mCM7xx3ug==
X-Received: by 2002:a05:7022:408d:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b50310591dmr3354209c88.23.1794604184477;
        Fri, 13 Nov 2026 13:09:44 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:42 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH v2 5/5] arm64: dts: qcom: sc7180: Add sc7180-trogdor.fitconfig FIT config file
Date: Fri, 13 Nov 2026 13:09:14 -0800
Message-ID: <20261113130858.RFC.v2.5.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
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

Add a FIT configuration file (`sc7180-trogdor.fitconfig`) listing the
SC7180 Trogdor family board DTBs, allowing the LZ4-compressed Trogdor
FIT image to be built with:

  make \
    FIT_CONFIG=qcom/sc7180-trogdor.fitconfig \
    FIT_COMPRESSION=lz4 \
    FIT_FACTOR_DTBS=1 \
    image.fit

Having an in-tree `.fitconfig` configuration file for Trogdor produces a
FIT image matching what downstream ChromeOS build scripts
programmatically generate, makes it easy to use `fdtfactor` on the
Trogdor kernel image, serves as a template for future Chromebooks (which
could encode board/SKU matching metadata in configuration match subnodes
rather than combinatorial `compatible` strings), and helps community
users building upstream kernels for `sc7180-trogdor` devices.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
As mentioned in the cover letter, there is no desperate need to land
this. If it's controversial or people hate it then it's fine not to
land it.

Changes in v2:
- Replace 728-line sc7180-trogdor.its with a 49-line
  sc7180-trogdor.fitconfig sidecar file consumed by scripts/make_fit.py
  (Simon Glass)
- Move motivation for sc7180-trogdor from commit notes into the commit
  message body (Simon Glass)

 .../boot/dts/qcom/sc7180-trogdor.fitconfig    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig b/arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig
new file mode 100644
index 000000000000..5a7be0035001
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+
+[sc7180-trogdor-coachz-r1-lte.dtb]
+[sc7180-trogdor-coachz-r1.dtb]
+[sc7180-trogdor-coachz-r3-lte.dtb]
+[sc7180-trogdor-coachz-r3.dtb]
+[sc7180-trogdor-homestar-r2.dtb]
+[sc7180-trogdor-homestar-r3.dtb]
+[sc7180-trogdor-homestar-r4.dtb]
+[sc7180-trogdor-kingoftown.dtb]
+[sc7180-trogdor-lazor-limozeen-nots-r10.dtb]
+[sc7180-trogdor-lazor-limozeen-nots-r4.dtb]
+[sc7180-trogdor-lazor-limozeen-nots-r5.dtb]
+[sc7180-trogdor-lazor-limozeen-nots-r9.dtb]
+[sc7180-trogdor-lazor-limozeen-r10.dtb]
+[sc7180-trogdor-lazor-limozeen-r4.dtb]
+[sc7180-trogdor-lazor-limozeen-r9.dtb]
+[sc7180-trogdor-lazor-r1-kb.dtb]
+[sc7180-trogdor-lazor-r1-lte.dtb]
+[sc7180-trogdor-lazor-r1.dtb]
+[sc7180-trogdor-lazor-r10-kb.dtb]
+[sc7180-trogdor-lazor-r10-lte.dtb]
+[sc7180-trogdor-lazor-r10.dtb]
+[sc7180-trogdor-lazor-r3-kb.dtb]
+[sc7180-trogdor-lazor-r3-lte.dtb]
+[sc7180-trogdor-lazor-r3.dtb]
+[sc7180-trogdor-lazor-r9-kb.dtb]
+[sc7180-trogdor-lazor-r9-lte.dtb]
+[sc7180-trogdor-lazor-r9.dtb]
+[sc7180-trogdor-pazquel-lte-parade.dtb]
+[sc7180-trogdor-pazquel-lte-ti.dtb]
+[sc7180-trogdor-pazquel-parade.dtb]
+[sc7180-trogdor-pazquel-ti.dtb]
+[sc7180-trogdor-pazquel360-lte.dtb]
+[sc7180-trogdor-pazquel360-wifi.dtb]
+[sc7180-trogdor-pompom-r1-lte.dtb]
+[sc7180-trogdor-pompom-r1.dtb]
+[sc7180-trogdor-pompom-r2-lte.dtb]
+[sc7180-trogdor-pompom-r2.dtb]
+[sc7180-trogdor-pompom-r3-lte.dtb]
+[sc7180-trogdor-pompom-r3.dtb]
+[sc7180-trogdor-quackingstick-r0-lte.dtb]
+[sc7180-trogdor-quackingstick-r0.dtb]
+[sc7180-trogdor-r1-lte.dtb]
+[sc7180-trogdor-r1.dtb]
+[sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb]
+[sc7180-trogdor-wormdingler-rev1-boe.dtb]
+[sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb]
+[sc7180-trogdor-wormdingler-rev1-inx.dtb]
-- 
2.56.0.611.g1030f0b940-goog

