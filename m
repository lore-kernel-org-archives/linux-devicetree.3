Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779130;
	b=RxF981/LBYmXD2oyixXbMQ+P9PjjoWmGpzfejFXbsz2R+RNmfCnU0rvBcxfcPiE1QJGk
	 rxWTzyv6adupAPuuu0EXOoYVtwIDOc1+AX5MfqIRaceHI6nchelYr3im8lGROlWxfQGbt
	 wgpoxgJJwMHn55n40AAA//wqf10txMH7OVZ3lI4sZ/KTPRXFn9fONst4xqWrxH2v5LPDk
	 WhBI71D4gyzNX2YPZcJFhqzEabdvL7EnnELUNEQ33bQVWgF5RdLMm9DFojKRfkV7V8Shg
	 4PgvJ23/W2EtHRnRPblOAqu0ZjO4l3AX0z36JOxY0F3Y3x50EVjzNAZL7o22J76fH1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779130;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=js+/czBSgfSoFW4/nGltSvMHKmlzHMuNfaQlfYnJbT8=;
	b=dhPyqznpVCXA8nrbohYW+W8LM0bDZETJv7ndb5gRs6gxDvk+WScAGt1L6e9ZNFQEyCbe
	 t8T0pcS9TOvF8zgZJnp8qIjIrlaN0fBoKx2SVQRum6gnbyiiqcXi4xOTNip65b78hnXe0
	 E+1R4RnUoRKfHg8DZYhxrDRRYyQiQEUB2JslCF//gtKSn3QGGNu+D9d1S28QDEuKMiAmJ
	 nwYQWJ1hWu5g6Gxvo73KlwMftCa0+3ESTh3epGOYGxTwA/ULJgiW9z4IHmDzwuYUWQ8J/
	 dYm05XeJgKmhry6Rjimt4CDQxuwljIPvxUQASVJHt8FrwsnCVQZUhmMfAGLmhDzWyUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=XLrcYG1O;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C43D606A31E;
	Fri, 27 Nov 2026 11:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C43D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=XLrcYG1O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=js+/czBSgfSoFW4/nGltSvMHKmlzHMuNfa
	QlfYnJbT8=; b=XLrcYG1O6rFaDOr74H48U7TWcTxoSDucZBmwe/xNPtA2Oad38H
	aDie3TAJuvdhKAtSII2Le+hnQAZkJxx8T8zWPhls5bsvVhZ1khvKSzKtpd6KWBBv
	nVK70sLtaNWaZ2Fr7uEYgakXwHMgaKNv+RyHkuYLjEiQFNmd0xW+By4ZY=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgD3cDUvaglr7nICAQ--.938S4;
	Fri, 27 Nov 2026 19:32:01 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8750: describe the TNOC AMBA periphid
Date: Fri, 27 Nov 2026 19:31:58 +0800
Message-ID: <20261127113158.932414-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127113158.932414-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261127113158.932414-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgD3cDUvaglr7nICAQ--.938S4
X-Coremail-Antispam: 1UD129KBjvJXoW7CF48CF1rZry5Xr1ruFyrXrb_yoW8JF4Dp3
	9I9rZrGrZ2gr10v342qrWxKr4FvanYqFW5Crn0gryjv3Z8XFZ5Kr4ftrZ3GF47AF4I9w1Y
	9F4kXr97tF1UuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBab7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jF_M3UUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggATsm

The trace NOC at 109ab000 is an AMBA device, but without
"arm,primecell-periphid" the AMBA core reads its ID as 0x00000000 on
this platform, so coresight-tnoc (which matches 0x000f0c00/0x001f0c00
with mask 0x00ffff00) never probes and the node is reported as
"deferred probe pending: (reason unknown)".

The value is the one the driver expects for this integration and the
same way sm8250 describes its funnel.  Add it so the TNOC binds.

*** AI-assistance disclosure ***
This patch was prepared with the help of an LLM coding assistant.  The
author reviewed every line and verified the binding on hardware.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 01eee5c2adcce..585a22eccb303 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5366,6 +5366,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		tn@109ab000 {
 			compatible = "qcom,coresight-tnoc", "arm,primecell";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
+			arm,primecell-periphid = <0x000f0c00>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
-- 
2.53.0

