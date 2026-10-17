Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFF83D6CA4
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 16:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255378; cv=none; b=mhl3DjRMX/oZwbKvX8EpRea0fNrOprc6g4d9CUzIxHLkK7GRgWSpLPu7P7iwN+ULSXVSwUYDU3pQVHV65Fi0wjPabhwQ9yBhKbChiY+anp+slALTn532Wl9x7IYdBma6CngYgLhAcdWT2scflZHWu1Khd1P9iqm3dxIPRHW28oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255378; c=relaxed/simple;
	bh=BGOJLVXVccbwwnFWY84JCzL1yNcyYfyrD1jQgZCkXjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H05mj3irUKPTfFf4hApQo7QgW1FyDCogNVdhdOfUsX4+AduriHiMBCIIR+pPUfdsM62Lce7eHTTnvN9KywAoGJFIPn/97zCi30zNRBdlGYAwfAwtXUxNr4sMsrwa0xkxrskgdBsbD8NWs4C6l91kDk7g5w1GKTEiDXTxzcI8zjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atob6bsV; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atob6bsV"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd632f7a4a1so373892a12.3
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255376; x=1792860176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=;
        b=atob6bsVJ1rIh2QWg23PqJPvd4vJ2U21qsAJQBBZd8RLkEGaW1YaWR9nP06unqEJ7P
         EDxqnAw+P5HBuQmEVCO3sMsMM2GSWAVRNgZe7GiIyIVaSFmoATFqPbWYq2N/euFDGWB+
         atUC/FLh5Pfx9VNvlvrxR3ti8Xbrl7vRvJKufAOF/S/b5xYlLgY87L6T1h5gjGhPAwFI
         Mg+OX5KYUHuTq+AB1vu6SszAWKeESxGwpi3KPgUSbqVTh/O2PAR4il2oLMf3jaK2ufQ8
         aJg2a3lYgrz/Uld/j03oV808sw9xzmn8oY7Mb1ZW+ALN2QZ4tflTKBrd408Jyhvq/kTn
         v8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255376; x=1792860176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=;
        b=xmYJLz7MtLlSIwMCVGRnd0j4pizLtKb+caLO46e8uf/Ph76dOQg+G7icN3UlzYcXI+
         zCfy6TKFTSqx5oQ7USz29xw6XOx02jFjdROc9qmtmtmgidQiED6Wzv4MuY0IhZZZz2uY
         KJqaOduN+YzUgrWFbx6SOXBTR6M0zQLuGf0x6xmmbeBbfDp4K1vaRSgAuKVsZAvLvtew
         O0liGLz5HoZ+n05PaghKe4D7CKZRtXDylsVXjs1nMHIonMNbaUfxRSxbsap09FAycfsB
         jGiv5NlTdwKhnEfsWYrQrFDvrAr0PaxFLjn5gRuosmh+gZRBhvmc+XA5OhkASnwLs+lK
         PXSA==
X-Forwarded-Encrypted: i=1; AKwUvBwpfRslAND/yOleIY3JZiuJG15dtSsMQc8JXz74pZ1HI89rR83yukAijH6dgawlxfZ37jxPt9ieeg0i@vger.kernel.org
X-Gm-Message-State: AFq9FYLzhBxieoy+bvxkonX1D2VqP6J9u/ZZ+Tv6f+xcAFdddVW7GiDr
	Qz97ZokQeYjanujbekUxiPmH+nEq4LffZJ3Bkmvro+z1e4miDwUy2epQ
X-Gm-Gg: AYBFou2POVwknpS9L+pMXc5wAIDKRXD5nm7kTuOZgGd3STFQUJ0vsb4J0uc5GhuPtPo
	s7DfpFxyyhwB8XzHakR1KTBWhMl+psFioImCM38TF6JqLM88ktchimwV3jOYTbQi1ABkroPU9fY
	d2ydTVzcZ2icagzwu21UGURjES92gv9KufKdNTRludMfQ0PhIgYJ3aESITefOELDqGL7Xkih9Pf
	7ycAfLN10tIEjVgI5202DxhPRqUjSBk98Liql5V7pFlxiujPmZtsthmhHjvZ4TiYCT0izbK1W+R
	vGwTC3zqQ3MpJy9IPluPzZmSSNUu0YXN7RHe+nlPVos3B/3BdHZERzeCJncvAAyMCkILzNEtlcV
	PHKAiOPdmMTx85Q9c8m8sYIVZefmNlPL7rWC4kBDUQJVfzYnasPzXdjYIwVXO7yfohW8uagW0LL
	nENpHXnYWkWCG+L1S8rT+frfxs2DS/7OBOmbVWy26clFUoGuY40+K+5qgu4MPtDA==
X-Received: by 2002:a17:90a:fc48:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3acef14544bmr3161802a91.26.1792255376492;
        Sat, 17 Oct 2026 09:42:56 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:55 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 17 Oct 2026 23:41:25 +0700
Subject: [PATCH 3/4] arm64: dts: qcom: Skip suspend mode switch on MSM8917
 and MSM8937
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-psci-fix-v1-3-dedae27e4a31@gmail.com>
References: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
In-Reply-To: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

The PSCI firmware on Qualcomm MSM8917 and MSM8937 reports to support
OS-initiated suspend mode but rejects call to PSCI_SET_SUSPEND_MODE with
NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and
probe of psci-cpuidle-domain is aborted:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

Skip the mode switch on these platforms and continue with the topology
that was already built.

This is expected to be safe since it matches the downstream kernel
behavior, which manages the cluster power level in addition to the CPU
power level, just like Linux does when OSI is supported.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index a2907f8a63..f0771187d0 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -182,6 +182,7 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		skip-suspend-mode-switch;
 
 		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index 7de6447de4..a66a544f30 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -311,6 +311,7 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		skip-suspend-mode-switch;
 	};
 
 	rpm: remoteproc {

-- 
2.55.0

