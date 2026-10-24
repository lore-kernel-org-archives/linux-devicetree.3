Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792852130;
	b=2qRX2fS7jJSs6lnfgMnGgH9kaBv6/g7QjlIMJtVr2m+DfLuE2lTqdNCQKsUXBSg9ruYu
	 /pUXsikm1AgXlCfecX492YHGG11FwRo7T0PUXZoITi1vOxyz+cjdaeeFSZh91FOe+wXek
	 IFnJYBk5DOFcP3mZ8YSflyww/x2s+f1XDCCKF64CJ2hPN3Mrt5iF/+HgSZjp80iIM5/lO
	 FaDp7nku0fh3InTfRRN1JsCCnTFReT7ZgU+lm6BNklEMuqbXLkgdVSlYsMDaVufreNT3M
	 eXi8ei4y8cIiSvA1Tdnqri6K9tlJisSZ95rK9FKWxbnqdA4tD8yWZyCJMYGqcMIWh0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792852130;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=eeV3+U5/yrctaUKSJ/PKpGOtHdLYEHHC9dwLeVDP3lg=;
	b=fpjJh7iXAkUWwQsyc/wZxkyKUF9yY3ijba+tlDWPe6O7Ll8dPdvlzap5bw0kFJXdGh0F
	 9gOz1YrmDyBPSxybo+BWoGWLpDyLU4xmm1OgrRTXnIhwo1Hv47EUpz8z/dciu8ovrW0o+
	 79GkrNwxlvLTZvvlvyJYbiQqLNUa19dTCTe+QNrnx9CABSa2GmPH6UmsVaPAabxn3Fu8v
	 hjc7vTVn7wJ7ItBS+RG5GDxypy3+5IY4l1cHMv66JeQRT4COc05D50o26kSE88kgjFiMu
	 lZf+VLAFCCA/e1UqN2oL/XdyfyRHTsWxehFjEyEiHMh7GeRzt7AYDQWGLm4oQyg6jCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Poz2aMRi;
	arc=none smtp.remote-ip=79.135.106.113
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D456C606A324;
	Sat, 24 Oct 2026 14:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D456C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Poz2aMRi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792852127; x=1793111327;
	bh=eeV3+U5/yrctaUKSJ/PKpGOtHdLYEHHC9dwLeVDP3lg=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Poz2aMRiybGqje6dJX61E0vcxeWB4RF/bD6ruBGZuGc/6/PrXUfIejQfTT+M4CxIO
	 wfbgs21HnYhwgpnS2rTLDXWay7xXop0WiV4FAbunpoUnHPj/V4uwnBytOGOpw1kbmQ
	 c6M3AaaO2I/W2/+xrXQHxTsfHxYWhOxrdUi4yyqaNLYJgIpLazzSTwPCPHNYQ9l1RL
	 gIdALN8BSHcSYT8pXr/Jb+lz/NbgCPWn/JYmqts5VONNdXlD9sn6HGK++YFXtY1EH3
	 TZrofNj0ux1YiQrxceOKFlcZPybyqNm/vj+3k7HBPS5fNxsCrX0VGknOdQtVEc2RMe
	 cpVf1JmY3qctQ==
X-Pm-Submission-Id: 4jBj1T284sz1DDnW
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 15:27:59 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sm6115: Add missing MDSS AHB clock
Message-ID: <7f99fda6f99d6053db240f2f1ba4d7b71da72261.1792852079.git.me@michaelmcallister.org>
In-Reply-To: <cover.1792852079.git.me@michaelmcallister.org>
References: <cover.1792852079.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The MDSS node is missing DISP_CC_MDSS_AHB_CLK. Although the DPU child
already requests this clock, MDSS resumes before the child enables it.
The MDSS hardware-version register can then read as zero, causing
msm_mdss_enable() to skip UBWC configuration.

On the Motorola Moto G10 (SM4250), this results in garbled compressed
scanout after display power cycling. Adding the clock restores the
UBWC configuration and makes compressed and linear scanout agree.

Include the DISPCC AHB clock in the MDSS clock list so that its existing
bulk clock handling enables it before accessing the MDSS registers.

Fixes: 705e50427d81 ("arm64: dts: qcom: sm6115: Add mdss/dpu node")
Cc: stable@vger.kernel.org

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 0f2af8aba..f7002b9eb 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1927,7 +1927,8 @@ mdss: display-subsystem@5e00000 {
 
 			clocks = <&gcc GCC_DISP_AHB_CLK>,
 				 <&gcc GCC_DISP_HF_AXI_CLK>,
-				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
 
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 
