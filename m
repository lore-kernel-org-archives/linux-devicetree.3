Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E6437BE75;
	Fri, 26 Jun 2026 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486496; cv=none; b=amTqH9MDdO3QvS9zvgN3o3S7NbCGM4HMgYrzBvSZED0d36c691kVAPyl8W1Qp1XqNedXWKl9ZiTLWBYeRYN5Vh3WYVxtqJj3O1iznZlZkxckfgc4CVGqlzJN6IpfcqWEt7Twyy+42woAQgmvpNVvmVC9c9biip5d/DmHJBmajmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486496; c=relaxed/simple;
	bh=oZ2ipTt5slb1AoUB2bJ8LzEXXOAuXu+rODC9ZqClg5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kSPxgJiPV7YJe/zPa5xhgVyemHPNcYxF7i718HFudiA7Gea918q1OhC1oqeCPAD7xIYIobqgmuLmKUL2ZWj6DYOk7/1Fhhfklka+C57h4t8zgvSty7f1HqlQhSjXIz7OpXyPvYViq/2+OP28/fhEJbta3aSOhjORXACYVxL4FwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz10t1782486463tcf80c42d
X-QQ-Originating-IP: XGbe/E/kD0BLuFvNEizjzePgIMr6sFBBH8jL35vBlk4=
Received: from [192.168.30.32] ( [116.234.26.110])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Jun 2026 23:07:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2305747257967665330
EX-QQ-RecipientCnt: 13
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 26 Jun 2026 23:07:32 +0800
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Fix DWC3 core register size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-sc8280xp-fix-dwc3-reg-size-v1-1-ddcba897b19d@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwrCQBCE4auEXtswTqCZeBVxEWfK2C5imPYRD
 Ll7Wt0UfFD8CxmqwujQLFTxUtP76NjvGsrXfhzAWtwUQ5QgUdhyiinME1905vLOLVcMbPoBp65
 H6UTEhzwwVfjpFz+e/rbn+Yb8+BZpXTfH69ZMfgAAAA==
X-Change-ID: 20260626-sc8280xp-fix-dwc3-reg-size-89aed9666d96
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
 Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255; i=sophon@radxa.com;
 h=from:subject:message-id; bh=oZ2ipTt5slb1AoUB2bJ8LzEXXOAuXu+rODC9ZqClg5E=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFl2U3dyKv27fqORkeFL/8bO3+XZTye5zt0hsq1jS9muv
 Z+e/H51saOUhUGMi0FWTJFFIZ5hLntl7rWnYqV6MHNYmUCGMHBxCsBEDgszMmx7v3be56xZAZXT
 1BM5VM7w6Z/btu+BmIFopY20EP+iCClGhhOu4s7SyYLfopP8FtZnXjxmpHmAITRsk6Dl3IAzve/
 z2QE=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MRY6qckr/MVJ+kK2INdi9MNLI6iaV7EwGQ9aTrw/wrvsp5SttcyIwP+h
	/PvBBf+CXWZGRcJRde8Xtn0ljVviJWEWjEzCvcZcg6pQSjnxHEJZs6eo7c/PbTUXrRS3S5I
	SK2lmvzKahlOQjfpNCYcflT/b6DIkq2ppIBGqffrglh16u5ygKg/G6f9vCc3IDbkEaiIVV0
	dVHnzF2cGGd6YMZ9iAMd0C9ay3sYKtUMjAWUMn/jQHodTQJnjvVKNUN6FbF9v4sQEQ/AizM
	k5wCPx8rcCGH8mj8ywes5zoAPyqRWnhMaBk6mWZEYEVR0hV4NSMBv8RaKu8/BdLTbNj9c4u
	n32DgyQ2S01g5kul2wSl1+xudFfClHnTcVBR0Fiy6mcCm9zH9cszvbN6rSbCDdKWGHXubjB
	ozxzvJE9hOB8B41WPqf2tjKWGbnAtqz1LDZJQ0hw4Pij5Mq96+l0HklG1g6zHFA4VdXxCOE
	TZrYKtOzj9d3BxES1kbfa/hQ2pvQRgF3bBRhQOqbJ+XcA8mS85b5SQnMpljo0vOYgBISSNB
	ro9HXBlWIafiv08GGZjy4P8ZhjGKdGZVbaupyUKMoiOSPE7yKqzqrBhTIkdaamaLo21X//f
	EvT8vWQvm/3FlrZZaC5X44hefYptXEfiOGgsYuP8otob2Tq3yHEAyu4/eG4iuiJCES0BzWe
	Md3FRz3FAt4IVzLLWZiZAinmfz+selQ4nuRjxpEH2OV2SEsawdsf5kIsL5rp5l8E3zgf4/z
	wiZkUGb4fkXDJ4gcsPHHary20TUJK4Gs2p0lGceVrvUC9JecbVDWW0zN0VEYKfikNQqBniX
	iJs6mWqfeB8XGvBC4YYF6Vch087e9OLAR0ihr+gCCiXlR2QC34YOJzkG0F3EFRCs3qjWfBq
	TeoNV9oiRJuuX/WkmktxqBoggB1draWld4/XHX3b0iabDlF3hXkGr/ljFqFVrA/ZdsYpp01
	Xkr5XsoPndRSpmKxigYDejTi4FuvzQSvzOuL0Sh0AX+4qkycTtkC1MYSBOZwb8Ds9BpEFNG
	ssKhFuW4fIqF881BYL
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The SC8280XP DWC3 core register regions are currently described as 0xcd00
bytes, but the hardware register block extends further. In particular, the
DWC_usb31 LLUCTL registers start at 0xd024 and are accessed by the DWC3
driver when a controller is limited to SuperSpeed using
maximum-speed = "super-speed".

With the shorter resource, probing such a controller can fault when the
driver programs LLUCTL.FORCE_GEN1. Use the correct 0xd950-byte register
size for all SC8280XP DWC3 core instances.

Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Fixes: 3170a2c906c6 ("arm64: dts: qcom: sc8280xp: Add USB DWC3 Multiport controller")
Cc: stable@vger.kernel.org
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index a2bd6b10e475..d06f79b7680c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4034,7 +4034,7 @@ usb_2: usb@a4f8800 {
 
 			usb_2_dwc3: usb@a400000 {
 				compatible = "snps,dwc3";
-				reg = <0 0x0a400000 0 0xcd00>;
+				reg = <0 0x0a400000 0 0xd950>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0x800 0x0>;
 				phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>,
@@ -4100,7 +4100,7 @@ usb_0: usb@a6f8800 {
 
 			usb_0_dwc3: usb@a600000 {
 				compatible = "snps,dwc3";
-				reg = <0 0x0a600000 0 0xcd00>;
+				reg = <0 0x0a600000 0 0xd950>;
 				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0x820 0x0>;
 				phys = <&usb_0_hsphy>, <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
@@ -4179,7 +4179,7 @@ usb_1: usb@a8f8800 {
 
 			usb_1_dwc3: usb@a800000 {
 				compatible = "snps,dwc3";
-				reg = <0 0x0a800000 0 0xcd00>;
+				reg = <0 0x0a800000 0 0xd950>;
 				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
 				iommus = <&apps_smmu 0x860 0x0>;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;

---
base-commit: 30ffa8de54e5cc80d93fd211ca134d1764a7011f
change-id: 20260626-sc8280xp-fix-dwc3-reg-size-89aed9666d96

Best regards,
--  
Xilin Wu <sophon@radxa.com>

