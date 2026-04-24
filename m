Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333EC3624C1;
	Fri, 24 Apr 2026 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025426; cv=none; b=dF+cvJKkymE1LmVkm0krPurNJC85gLNzr4Z4bhvrZ2kslqRy/vvjtY9EnhpZqxJ56yYnhWL3GiSERXzL8Mz5p/hvKcTLLGsR71AMykty+F9Ae3jnsKvRTBl6j9CnWofYLa1abu3k2kOhUxkXheO0CqUY7P137m8czax4+sso3WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025426; c=relaxed/simple;
	bh=xrHLf5eNpGYCZJw6uXjVC8/WzVIrBBKC5TwvXGATU7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XtZKBqhY504uITS3AbyWwhzzvjPA8NrijAy5v9guRgpAbhK2R/SMvwGPPZmX88MiO5sxNIKZ8wOSh3beSCcjextZVyFFAtOqFt6zE4ODSMdSroq38vU302KYHs86pRuZ5REmPxaBtrc9REGAtKpTcnrIBmyZDeZWAKjRi4qVf0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnX7JgX0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnX7JgX0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7D0AC2BCB5;
	Fri, 24 Apr 2026 10:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025425;
	bh=xrHLf5eNpGYCZJw6uXjVC8/WzVIrBBKC5TwvXGATU7k=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=lnX7JgX0aV9XrVrCk0f/EJbKoYmvaUsDoaQMrvRKiJL7IuzB5krcmuOKFva7KbEHq
	 PsnryT+vI8uQ2ALelOoi5YbbYSPZIb/+wze/3+SUqQ2jG0gEU+CHPamnntVy4SCbp5
	 6ZqoJlgDxuSL6phCAunVw5oU58/KJR9lwXRxQe3ESabvzVD9zofjuRDu+J2aIU3CtJ
	 YsHCgeXCMwH8ZavGf03EazV1h7TUaUtskFihr4mIK6KX7Xmymssjaii4dEICtkbgRQ
	 44U+oQqfJ7zbJrENi8HJBo/274DDvoCLkOSuRenPRbzAiD5Bwl2uDGwHuPVfbqnW5o
	 U8oKCPf/wKXDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45C9FE51FF;
	Fri, 24 Apr 2026 10:10:25 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Fri, 24 Apr 2026 15:40:22 +0530
Subject: [PATCH v3] arm64: dts: qcom: talos: Add memory-region for audio PD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI5B62kC/23MQQ6DIBCF4auYWRcjoBa76j2aLgaBSqLSgpI2x
 rsXXbWJm0n+Sd63QNDe6gCXbAGvow3WjSn4KYO2w/GhiVWpgRWsLkoqyIS9Czgr64gUujVCNkg
 lhzR4em3se8du99SdDZPzn92OdPseMpESSipRoWTMIJry6kLIXzP2rRuGPB3YtMh+heZPYEngy
 GWlVH1W6khY1/ULhq2KtO0AAAA=
X-Change-ID: 20260418-talosaudio-b8ecf8b9a1b3
To: konrad.dybcio@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, quic_bkumar@quicinc.com, 
 quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777025424; l=2086;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=BMQhN87MOW3Bin4ZVjUzWQxUOWRhdvvp1i+NLcdrruM=;
 b=AZSk/nnoNK1O+zaH16pGtagQAZwKk0vhXw+p0ekjNHu6e5j9UK9UM1bQTzBZEP1WF31mtDx2f
 z754EqRI2xlBOMYhrWaV+hAfPDlB+kOOPR+Gg2S+qurnJEdSh7cuAbD
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
Changes in v3:
- Use shared-dma-pool representation for adsp_rpc_remote_heap_mem.
- Link to v2: https://lore.kernel.org/r/20260419-talosaudio-v2-1-3a3b5dd67dd4@oss.qualcomm.com

Changes in v2:
- Fixed VMID list alignment.
- Link to v1: https://lore.kernel.org/r/20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4..c230d46616ea 100644
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
@@ -657,6 +658,14 @@ pil_gpu_mem: pil-gpu@97715000 {
 			reg = <0x0 0x97715000 0x0 0x2000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	soc: soc@0 {
@@ -5100,6 +5109,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260418-talosaudio-b8ecf8b9a1b3

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>


