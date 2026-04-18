Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2712628D;
	Sat, 18 Apr 2026 05:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776491283; cv=none; b=S6n0v83S31iKTASraLYFyGNZ56dvmn/K+QPRwCzFt5axvHJmYq8HRwoW0/D2iSugdcMJKCFeDiskGjP3t/N5W41IQj9M78ZWjBNAy9hh589FuYJ7lhTVTo0hiKZisj8/60BAGRJMZCm15nrIuXX8X203Zz36HjAxrl1BUGN38+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776491283; c=relaxed/simple;
	bh=FFr0kkWeKJ3tSMCVYhgeHbHXcHTAH76UkQ1rl2TonGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bgQQqc2ZH4wPxwQrWTFIu3S0ITZXsVjFuEkmlK9Sw1BKSZz6UXSpEeZxs4a9rbnc6Nx+bWhbMyh9pwz7ScHfYx9qihLWDIKsIlsdVf3JhA51f/eoV/oTS2vOpq/UV6fgTCcr22atRc+UtEjSKFqntWyXUsZygnIBFWBwiHo8iDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dStCvFr/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dStCvFr/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BDA4C19424;
	Sat, 18 Apr 2026 05:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776491283;
	bh=FFr0kkWeKJ3tSMCVYhgeHbHXcHTAH76UkQ1rl2TonGQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=dStCvFr/SpM1WyKb9kODlAJ/wBBxi+nLApytZT9LhiWx1vP1xekABKMfVD9LgHDke
	 kZjyYTlJpgjoJ+yjjJrTtfqHYnCXyuXr6+7nD5ER0B28f3sxXMjRyyrexdkreSbyzX
	 L5VenHB+FjzRWixmyQFucwAdaKmCuHAL4C7sQtpiaajOFZSCcc3utHOxQDJQTvBHc5
	 2n0boCbovbj930+tSzg+CoV/A/8I/y01ONaGmeZfeMIPWfcSSMZWw1kbpuTUskcOSt
	 GlY9RbbTQbXla8Gbq5MnKntsX3dJBuwa2QcGOEKJ9DRA+aGRbsbHUAI8ihqCUFTWJK
	 0utTZ6t3mrFBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19351F8D75C;
	Sat, 18 Apr 2026 05:48:03 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Sat, 18 Apr 2026 11:18:01 +0530
Subject: [PATCH] arm64: dts: qcom: talos: Add memory-region for audio PD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABAb42kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0ML3ZLEnPzixNKUzHzdJIvU5DSLJMtEwyRjJaCGgqLUtMwKsGHRsbW
 1AHnUJtpcAAAA
X-Change-ID: 20260418-talosaudio-b8ecf8b9a1b3
To: konrad.dybcio@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, quic_bkumar@quicinc.com, 
 quic_chennak@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776491281; l=1647;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=xyhz++sJzQ3Z0d/MSUt2gZmlgBl2KeY1Pv4pkaPQIEQ=;
 b=5fD/H11F6rcHeCvqYI8Koal0dmpCgF7FKttknim5HYxqAGfloT1iYUsCJSict+ghK6GJlkJSy
 IaSpnEgPUV9DWFsIfCXH0Z1FQZIC/wOuJYbwKoI7wNlxBM/K/5Ef2e8
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Endpoint-Received: by B4 Relay for ekansh.gupta@oss.qualcomm.com/20260223
 with auth_id=647
X-Original-From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reply-To: ekansh.gupta@oss.qualcomm.com

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4..c36917d6e0a9 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,qcs615-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
@@ -657,6 +658,11 @@ pil_gpu_mem: pil-gpu@97715000 {
 			reg = <0x0 0x97715000 0x0 0x2000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@97717000 {
+			reg = <0x0 0x97717000 0x0 0x800000>;
+			no-map;
+		};
 	};
 
 	soc: soc@0 {
@@ -5100,6 +5106,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+							  QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260418-talosaudio-b8ecf8b9a1b3

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>


