Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3259A443C0E
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240804; cv=none; b=LEj61lGlvt6SZuPkLovh8EdREC/C+CvMd4Joeqawevg/x1Ldk3W0TwS6ySffDRlYz9p5h2kV/oiL7ZWCPrS/8bcUUwfTryukhqRhLz8/d+bcXjwq+tB/M23LxzZU9iXc2spMIlCDjZID4loe/D1sy5fU3dFwB3PJrqK0onFl7XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240804; c=relaxed/simple;
	bh=pHKuLppcHfDuAK2M2cO6egQfNx6bD98n/HcfLOmdFLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtW7EaUO7f43QqbtsJd/wZRi86MQz7N9u40nh+VCzF2SqimIh77Q0XM0PK9Xq3lDSZFMAyJunXtsT4b+N9NuVkRVbJFBdt8xiL71RmK9NlaKgaO2Z4NLz9HJnw1cJeuHlkbWlq8BVwFXUSvvYnBEgmSnPGP+Ywb9rRZhxv0hIe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r8wviNvw; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8wviNvw"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so1047720f8f.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 02:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790240800; x=1790845600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6iC9+L/tjpXDsD8YIdygEJ0lQkMMFcHXbDyMth7/EM0=;
        b=r8wviNvwsyxD8TGeSy7mMWicq1l+M1oK4MHlbIQ5j1Q1ittQlu/3DcxwhyMcYXmkL1
         KhjDO9MdFo7nESZYwrvkVk0zIRmS9syU5Ak+XADCem/olJMeH0AeLC1GzFrAFrP/s7y2
         EtGDuFTo8mDX1paPLjxKG176A3ihSl2EWDXNrxQYOds9pMxgd8nXi1t+RLf6RngAXpZT
         M8Bf4ib4Ba51Vg/3ZJBwLbI9TSBAQE0qLD4U9CiLKlmh72kyopI7+6TUe5pMPcUig1TH
         HGWZLoAfRFqeAv2e8EEIjCZm0B2Bj6UdmSKZ50cFyMwHzk8bOFE/206DLGRSO7nAn/AK
         jejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240800; x=1790845600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6iC9+L/tjpXDsD8YIdygEJ0lQkMMFcHXbDyMth7/EM0=;
        b=W88Eck2avggPEMeUoWQgoZpTImqszsBeWN3ZH2MgatCrUN+bXiSmA2R5IhI3CKQ/PT
         SUN0g/SPHU9Twix9mbBYKbHhv2sZAfdhjzHt+cPtm0MhySnvYYnrn0USvBmMT2ZxMGyL
         F14dIqas4y1uJ8RsttslMy/U+6grPfx34h1dYeQP5Xc82VxHQ7mCvMOcpPr581uMpoCn
         DX7ByiLWWJyC0CpGENDTC7oA8zQrnHWav+NMCXBqc5k5R4Dca6abgZvIolRGPq10E5m5
         ZATwPwBmu1ph6AJFNDmuG9ZCUj22rT0p5pBac8Rm1pb07iN5+ETPSLoP8UK9SKDREAwm
         MqJQ==
X-Gm-Message-State: AFuF++lMbphn3Xusjv6s6Zyr2ntluxgKOqHsi7Y1VBV6AqHp7R04jjuc
	sA7ixmlRNLbcGLazEdY3jd2ZkHWMMUmVlI+JIPuQDYAwNh2OzDa0dG0k
X-Gm-Gg: AYBFou2+23jMiqlGYKytfvEFrbb75elkEYtvh2zbCdhXH8WzZvqntf9KR/V7LNXboOn
	5PN0wXcA8lrM9vVLAczdYjb9iZwDGq25te/yGQLGS+66pDs1toODOk/PP/zSSutn6zeQLHyR1Ut
	kY0I/khsVMnJ1vEo/+oD7ofv/XdBbrGmSQZy33pX7Ur8glaNfc7mDkqQE+M5k29E0HgVfYOuZF0
	90Ko/JgLqJxqYfMsU3YzbPCQz5vPB5t0K1WyzC8eask+zDi2/wHDilyiJpTMyVkS2DBIyE1xD7n
	kpiuRF+dFHwEnZnfUZhkEcBsydc3k6KqebK8lluvagDfwMxy16DKWQF60Ambp4EqJRN6UnGvCVf
	KtkTxCoyY8nejrneI/lx+MOGSGafffpMBJsFkQF642IPFCSR8VOKInKsWlIyK7IdnnQOiVg+8dK
	JlOjG/5hurhlCNuNQWrs38Qr7QdMdXrBqBfpYn+HhomqQHhKXMyFPfXmO3Gx4HMRYId3BdvzqKg
	wQZilG2dmyEgR/VnmPB1vnvYexPBw==
X-Received: by 2002:a5d:64e6:0:b0:487:35f:f0f0 with SMTP id ffacd0b85a97d-488716bf1dbmr3547155f8f.14.1790240799678;
        Thu, 24 Sep 2026 02:06:39 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm12875561f8f.29.2026.09.24.02.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:06:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/7] ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
Date: Thu, 24 Sep 2026 12:06:03 +0300
Message-ID: <20260924090608.28734-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924090608.28734-1-clamor95@gmail.com>
References: <20260924090608.28734-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pinctrl-names and pinctrl-0 are defined in the common device tree,
having them in the individual trees is redundant. Remove them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts | 3 ---
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index d4a3513a3fd42..d76f9f465ddc6 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -13,9 +13,6 @@ aliases {
 	};
 
 	pinmux@70000868 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&state_default>;
-
 		state_default: pinmux {
 			/* WLAN SDIO pinmux */
 			host-wlan-wake {
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index 7a62707f9f7fa..4ee84f4bd1878 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -8,9 +8,6 @@ / {
 	compatible = "lg,p895", "nvidia,tegra30";
 
 	pinmux@70000868 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&state_default>;
-
 		state_default: pinmux {
 			/* GNSS UART-B pinmux */
 			uartb-cts-rxd {
-- 
2.53.0

