Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244D42DC32E;
	Wed,  1 Jul 2026 15:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782920603; cv=none; b=tFx0fcEwZm2S/Hr9HVLbfeAeFBUav0FjIISYhpqu5ksb9O7UkHvP4EyWBHs+OMOvthqDfknrSe2x+Skl/scNxmY+RBVhF/++6yU7tl2vgsKjNqavO4mCHGGJ2EHlFokTa/pL7pVPck1kK9R9f5Arb4gwv4jBK+FU9xcow1mC4qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782920603; c=relaxed/simple;
	bh=QAe1nra/iAbWdmHLyfAFM6ctgEvJ1BWxlBQgA91idIw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RTOPcUf0P06eA/SnKEyb8Kxvda7I3i5t6nbq5Hj2+Ma5Q6SdoB4Zwc8fd5gAaPCEyOgXSsqH/l4lHTshuAGIcqx/jbBETibiHBHIAbrW40KOd1pQzIpLVsMj6c2bfgG2X4zn4o98K03LYf/dznOuxxk7yPO06l+XtX4rCuJQeRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLEEx/JK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLEEx/JK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20DA1F000E9;
	Wed,  1 Jul 2026 15:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782920601;
	bh=d1dWIHp3Pv/qgM+eHZRHh17BMOlcnx9RcIKDV9KOUsM=;
	h=From:Subject:Date:To:Cc;
	b=hLEEx/JKsClkYiQkO/4UlLXOG9Z4BJvLWcmzE4p+pWD9zThGUD/EoRlPSIn+GN8Mt
	 FUK7QyLlI0TkeoUlWwD+Ov5F7xxq9DBQf7kgNZYom6tV3wVHUhsVBjKS3XUokCI648
	 7RgQbv9dc33PIYQ2O5IxsLtk6Xt+6PS4fBdxvGAQEEe0IDvWFEWectErtEEnImjLUb
	 LZY1GCHK/byTUXyUJwfcD2Cx8UegV4C6KdglplS9zzbu+V6z1wKQIxFx7NEKXNawqh
	 De4UNX/D8Uk75SGbZABKkKfgCpYRC/VtXNSguvVCwN5l+E4asqtyOuDjSJs4LfV0E4
	 HJo+ClhmpIjag==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/2] SC8280XP CRD touch-ups
Date: Wed, 01 Jul 2026 17:43:14 +0200
Message-Id: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrA2MwdjYq0iROk51XGjIaCmId
 zfW5cfj/TsoR2GFZ7ZD5K+oLHNCkWdA43se2EifDBZthQ8szLoEIeOtR4p9+5HfFtTUSL6zrnT
 oHaRriJyWf7Z53datm5jWqwXHcQLWeHQueAAAAA==
X-Change-ID: 20260701-topic-8280crd_fixups-90c8b2545085
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782920599; l=652;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=QAe1nra/iAbWdmHLyfAFM6ctgEvJ1BWxlBQgA91idIw=;
 b=Qxaq/GgyrueGdMkNYmTR6WLjJ0lWoP2xxylZEzRVRbsKMnfA8SGO9M9Zh7QqifVNtezY1s7u0
 Jffo+e/BS+BDHe+vO7z9o9uWa2DYbfD8Jn1LuFea67FbHn/G4T0+qru
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Add the missing orientation-gpio for Type-C orientation information and
fix the pin index for the MISC_3P3 regulator.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (2):
      arm64: dts: qcom: sc8280xp-crd: Add pmic-glink orientation GPIOs
      arm64: dts: qcom: sc8280xp-crd: Fix the pin index for misc_3p3_reg_en

 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260701-topic-8280crd_fixups-90c8b2545085

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

