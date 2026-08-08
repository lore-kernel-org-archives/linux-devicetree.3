Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B564B04B0
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 17:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786209737; cv=none; b=ekjK1HTHwfqTf3mcwWUXdnwTxfByUfxVK0+BxHPSgiCDkRgC+A9VJSUBTB+yx1zG/EmqjHhhcMy6iIQCTJPAhmNZWGNT+Y/g18hBhy9onRUQFii9LbR7GI+ehABGmCY8R18P7fUWuCuUbDTpOaHZttbBcRkkNCoP56QMdkiOf6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786209737; c=relaxed/simple;
	bh=9+v/GpCfHKFKhArOfLO6Guy7SvGHgmzyrCi7dlabPqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YvJ/8jjI7RCa26zNYnnBcuBVHnl0TWbzRfsF1MJUlDVsFeXQzJYCmU+dF3fuCRhBh3eRUjpFe8eTwAJL59pYgW7OR7Nwny6qeWF10mkvwC0+WdNX11yZiQhW8W9y9RErRNMMepv1fAn0eBMPzXVfXdiXFQpeYb/GPwFaXj+tp/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=is7DN8Q5; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="is7DN8Q5"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e65e18969so37904285a.1
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 10:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786209735; x=1786814535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nU5U7pC0ggAhLEGRD5uoCl677Th+WwF8riKutdXhP5k=;
        b=is7DN8Q50xaAizOJmpE3tY5E70TPo7/GD+kHWsiLEL5VeAV5M+u8/4F4gIthnJZDBy
         nC+XV1IaH/PDNMXY7kbdGcqcmv75XUY50Id7S6yquaFXz6FBXKIqMfSlC4ieP/GD2mea
         MPwtyoDEYouUM0U/tvkq3tezcWsIYFb3yuzJhdXTIiEXDsT4E607swU97ZNxt5wjVqKi
         vWg+/t2eA97KW1nqeEP6Au5Q1n3MvLLLcD/VxnAY/8eKPWEndcGV0lCxtywg3tuFcils
         J92fjVsnmiaUEkF1SMMiqUjsSYhOfnASUNfWhS1JiC/HYosb+18MNg6Q4HKWU9d0ECsi
         Iopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786209735; x=1786814535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nU5U7pC0ggAhLEGRD5uoCl677Th+WwF8riKutdXhP5k=;
        b=HHLfdSbT6ZUR/2IGDOQNslMOtpO9WTjTKxBLM0USWT0TPlQ5mBaOTDtjKIMbI/2uRc
         +tmlNZb/K7PjKW/YQuz7xgz2OwuQuh9DfRGUrK7dABU3J3t1eWqgg8EGi3JA1xkQBx2x
         vURtIPMgWh9lFmKVsasT1Q9l4fyi4akL+v9kqtcz5XUAawQy2mFxjqFSxTHZhpm9pI3m
         e0u7i+Gq4DE1bVNSS30d7X6B+x9dCBlM0uYuZ5jiLbeMKJFeSZdcSd/fb8c4kbQrnsxD
         W8/CQ1xAPBzEgOjSKzgrIHCUE9FnJA9TurLon0lPe5GFveWcs/DqBGFm2OHQ0OIIUsOi
         dTYg==
X-Forwarded-Encrypted: i=1; AHgh+RpfD896RHf0LptLeQkClk6Xk2EsiZYyKFs7lHmyslKix23rn0jedpSM2vXGLG8jsQNGe6XZiMWxYE8l@vger.kernel.org
X-Gm-Message-State: AOJu0YykA3XNA31snHnFGn3M6k79hZ6bQuVUVc7+rfnkYKg6Dci7t6/M
	VG3Hi7yIVkDAdhHEx2hxHe4gai42wOLqMqXEx3qh4H7bqdVd9Q+sl7dL
X-Gm-Gg: AR+sD12y9Yb6/eg73KcBOEn6Mvsd37kesDMOa8ZRQOtzKXdGO0R696Ol+4K8VTUsWJm
	Hy9uJETMvzfyciTsEgNyrUxvLKAOxPsKqLdRemRGdseFwMaa1O0/iSXGTwUrrMjsl6uBL0sFcqu
	u2u6ipbmji7C8Xe6TldZX9I/0aFtAgTVLUntHeYlTfXFGC6nqkBWLduzCotY917cM3ZgMtaXoLd
	796XCBBBaMOKKA35BmnGPMZggObN/y/lz7G0kGNSi/9wtOue6mhoMRNPQpoUayyn2oexWzSxEGg
	8Uxjy0sy/53q7LAajo/xQSN2M71fub3gaZ/F0Gv1tB8jLEbga47IE1wdvwpHgf+t4slhsVKjsr8
	rTdm9UY5A3lanyGXZU7lmidLQv3+XDn32XF2XGmfwIVFvdRyC7xcCUFIoqIef4OhAVdtII09/uh
	sD/82Tsli+DSpRfSOomBaD7vIaUuVpCtJ0bEP7ryOuLblJeZySrYzATZHZylJM2bHaRYxvIePHh
	GJ11j2aUrW77e1bCiC8LQpk5tkSlvD+AK+AMHjz7pmabIOailjRA5jVz+O6PF3jlKFyzaxg5Ag+
	tz298IhHfQ==
X-Received: by 2002:a05:620a:468f:b0:930:9cbc:7121 with SMTP id af79cd13be357-9367b44f92dmr691793885a.3.1786209735436;
        Sat, 08 Aug 2026 10:22:15 -0700 (PDT)
Received: from JesseofTheNorth.internal ([2600:4041:502b:ea00::1408])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e229787sm408462285a.22.2026.08.08.10.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 10:22:14 -0700 (PDT)
From: Jesse Casco <jesse.casco@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: glymur: use polling mode for SCMI transfers
Date: Sat,  8 Aug 2026 13:22:11 -0400
Message-ID: <20260808172211.137577-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On glymur the CPUCP firmware writes correct SCMI replies into the shared
memory but never rings the mailbox doorbell for them. Every transfer that
waits for the completion interrupt therefore times out, scmi-cpufreq
fails to probe with -110, and the machine ends up with no cpufreq at all
-- all CPUs pinned at their boot OPP.

Measured on an ASUS Zenbook A16 (UX3607OA) through the SCMI RAW debugfs
interface: a Performance protocol (0x13) PROTOCOL_ATTRIBUTES request
returns status 0 and reports three performance domains when the transport
polls for completion, and never completes when it waits for the doorbell.
The mailbox interrupt count stays at zero throughout, so the reply is
being produced but never signalled.

Mark the transport arm,no-completion-irq so it polls. With this applied
scmi-cpufreq probes, three performance domains appear, and
cpu0/cpufreq/scaling_driver reads "scmi".

The property is documented in
Documentation/devicetree/bindings/firmware/arm,scmi.yaml, is consumed by
drivers/firmware/arm_scmi/driver.c, and is already used in-tree by
renesas/r8a78000-ironhide.

Assisted-by: Anthropic:Claude-Opus-5
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e..b9db81a19 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -412,6 +412,12 @@ scmi {
 			mbox-names = "tx", "rx";
 			shmem = <&cpu_scp_lpri1>, <&cpu_scp_lpri0>;

+			/*
+			 * The CPUCP writes SCMI replies into the shmem but
+			 * never rings the completion doorbell, so poll.
+			 */
+			arm,no-completion-irq;
+
 			#address-cells = <1>;
 			#size-cells = <0>;


base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
--
2.55.0
