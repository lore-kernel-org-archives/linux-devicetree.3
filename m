Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795700393;
	b=vWZRfD4vfPi0nPT5fz6Pe3P8bEvtwTnarJC8ZbAu4d56M4+O0f13Uq1ijCpM3GFd1IFM
	 7AQmcJ4Bi2GfOjgNFjGoOgiEFm8lntPfytF6LlcEqhp/0RTtP8lrLJQEDfw/VTTgowAp2
	 Wlk02waczKrVUeryv88YYzvAbS9vm5xaGXj8jNIrKyCAYi7W9kzhmfiJfcnwUBexupQmZ
	 LEQH+1Xyh3FVq2xQy9uNI0OoNFrrsSBE63DswfpXKe86MQKPUgeRmjSjLl7xBXUn4BDzd
	 /xolncgkGghpDX8/KJ3EytDI3ttjIPOgOkIkZglnvr4zYr3lPqD+sd9sXMlQKZoSZ0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700393;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=3mEzW61aNdoeGVGoXi6aBFf8PwLAKsbu1WYxRqmceiA=;
	b=kUQByho0dAqNYp6VQgUAOD0yxNuMvbSvPx9iYq3MPYg+LgBvplBshHLzuWEaI6hEh9r4
	 9oxHX2p2K+V2cLi5x+LFNdsWAXeMRuuKfTYPQj1AR/ZRo2J9dwS6r8bknyy9jlJDQG41v
	 NJ6leh4ivz7+DxnLet1B1yHp7vp3J+jQp4GYqsnqcA2GRLldyqZfqxlGWfKmllaqf0HuI
	 kDQYoLajd4j5u2K0QOS27D4GmSRKVbuuLQaAaWeI0B6UCudd25zsrLZGb0BdCfUzha+pL
	 3v+gSdMOrJSwyFlMVl8yr828v2qWLMVv1U8GPaANy6VsbJuV7eaJXAUYggBargOoywg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5RCRlkp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF64A606A31C;
	Thu, 26 Nov 2026 13:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5RCRlkp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795700392;
	b=Bh/vVQaLRSG5vlvhbyn5F8lZvsx5cLJq2JdqBke4MVi3ap/KlAmknyjIRPZfcKgnZSl8
	 aY8KNyZfZ4jqnEvTCy9wBJXnGvmxgnkMBLjp7TmmLjAeH/RKsHGpDid292B1jMhGi0wuC
	 ddHh7Mw1h56FLA1wEgiO4VLIapMHF4V2A8YLuy4/nHnWkhL9RtmbUo/rucUIkLEJ+/3bf
	 v7KW/Df5bbS3ngyGteEMc9PEaJB/9vg/7IPT9RNMxED/ncF7WemGhn5qiANX6VytlZ0Nd
	 41hYIp8FDx2PlT0+u0lLpP+FiAAGbqKp17QBYC9vQ/3ZZqmj1lhjJfE6v+rnVUB1CFg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795700392;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=3mEzW61aNdoeGVGoXi6aBFf8PwLAKsbu1WYxRqmceiA=;
	b=nD2zlVP74mvqpbmfnvMBgeRXDADdJPAInX79+rYdLtlwGf7vl3+2o0KSB37EbmH03vhi
	 E4v24bVcfuFh9CKlO5xpjBfxfeVt43+YtyY+r1wCmk5Vg8uZUH8qUc8Q0zB/bCLx09Cr0
	 heeENq9DWUTE5bR9ytvI/JHtSv4jffH84J1nQA/Y3RYQyhdXXDKsRVCXKnsAXrfykQzkG
	 KW2TJeB/IVGry2HSvjLaBnic8CQ88ep6Ar7HFMNwNNswpqrcAUnNGhecoSo3DGHp478J8
	 ++aYEQhMznRv66sh8rwTZPTlrMNNKkDNtwVP96W20Ri20FD+JVoQeeP+MWQchAKsIuQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F4DD1F000C0;
	Thu, 26 Nov 2026 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700392;
	bh=3mEzW61aNdoeGVGoXi6aBFf8PwLAKsbu1WYxRqmceiA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=T5RCRlkpcKMgfMy4f3rX/veMRK8X3PcU1dQiZmpv87zaT8gT5+iFBsLirQklVSTHU
	 K7jiWyQvmsQBCIcYVrGPB0NxXF6tqKoaGe4525ROsH21yamBkGbb5tllqCxv+CqvTa
	 oamGr5iFlVA4eZHrbGz1ZOqg09BWC6J0jNPNhdiDRxVq11oEghadwL7orkvXRAuaR4
	 qh5THgRtDfop74B10sNUasAEdEFyrMNJFq5/WL9ntALP4xM9em7vk9Mj39JlzHddNm
	 3LtTgmqm3cZgXWJKESe7HEfSuKr8mv+shQYMnirQx+CrpNVNn1R1J94d1aRmgbdcxR
	 0kF8kQdUHL0qQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7A4994D535;
	Thu, 26 Nov 2026 13:39:45 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sc8180x: add IMEM and IPA nodes
Date: Thu, 26 Nov 2026 14:39:42 +0100
Message-Id: <20261126-sc8180x-dts-ipa-v2-0-ad57b1be7c70@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2Zq2WgVO/ofhAO0Ka4SSLhIM6
 b9b8Gzm9JKZNyswBkKGMlsh4ExMfkigDxnYrh5aFOQSg5b6opQ2gm2ucrkIN7GgsRZS5ligMbZ
 oHKTVGPBBy268Vz/md/NEO22ardERTz589stZbb3/9lmJFI3mbK+oTo25tX1Nr6P1PVQxxi9vn
 v2IwAAAAA==
X-Change-ID: 20261125-sc8180x-dts-ipa-008e9e55c9bd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Robert Ijtsma <robertijtsma@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795700384; l=1808;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=QyOTC2IVuu3v71bzMrVHNN/OT7Tq0DSK2eLPad57qH4=;
 b=GFfbt++1Ni77TnAhvAXmQ8Q3AuDx+CSh8if6Z0fYCNDyBOhnVtTskZ+Ekk/Wryahoof3saZAC
 8jGHoXYFaXyDpsMFyQqWlmJWjBC/P/V5to0e62AcFZL4m9V8I3FmNDn
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com

Document the SC8180X on-chip SRAM (IMEM) compatible string under the
generic mmio-sram binding and add the IMEM (sram@14680000) and disabled
IPA v4.1 (ipa@1e40000) nodes to sc8180x.dtsi so board devicetrees can
enable IPA with their board-specific firmware and reserved memory region.

Note: Patch 2/2 references the "qcom,sc8180x-ipa" compatible string
documented in the companion net-next IPA v4.1 series [1].

[1] https://lore.kernel.org/r/20261126-qcom-ipa-sc8180x-v2-0-89eba621da95@gmail.com

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
Changes in v2:
- Document qcom,sc8180x-imem in Documentation/devicetree/bindings/sram/sram.yaml
  as generic mmio-sram.
- Add sram@14680000 with modem-tables-sram@3d000 to sc8180x.dtsi and
  reference it via sram = <&ipa_modem_tables> from ipa@1e40000 so the
  IPA driver obtains the IMEM slice from Devicetree (Konrad Dybcio).
- Link to v1: https://patch.msgid.link/20261125-sc8180x-dts-ipa-v1-1-12e54c7e13b5@gmail.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Robert Ijtsma (2):
      dt-bindings: sram: document qcom,sc8180x-imem compatible
      arm64: dts: qcom: sc8180x: add IMEM and IPA nodes

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/sc8180x.dtsi            | 60 ++++++++++++++++++++++++
 2 files changed, 61 insertions(+)
---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261125-sc8180x-dts-ipa-008e9e55c9bd

Best regards,
--  
Robert Ijtsma <robertijtsma@gmail.com>


