Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692C4480DC9
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777993727; cv=none; b=XL4mi60NDMYuWuXsminAJ7SUn6HBWTLk56f4/EEzH328qt4rIhgW5dlS1sK0lyNGqynikb8RTTVBSpUPRSoecOpJXtafTNRg0wY7bt8y8SHNUW0DPX3cZTz3F4hxP1keKmeaYYMqsgc5gJ6D0HxsjmbrE9UfafKSB629pjFw+JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777993727; c=relaxed/simple;
	bh=rQUCYnfbXyXEqu7Tx4LFLNr91pjKCEeeqx3H4w2eCqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=POhonXW88aSPCevE45atKiongLTA7Xo40SqNGLi9hLfaYhcUn4IZB6XQGbmOsFR9Mtjr5hUAFu9mg8wYMdBb70D1sEPWu9nYxiM6QrPbzm+EUw0KONAVOCGWKj1x5GLucq8vyiralNK0WF7XRkEYAUiXaAdKaE26wvLZeyZ/4i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VRr/ObNr; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VRr/ObNr"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ba699316b42so760802066b.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 08:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777993723; x=1778598523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJo6VLFR01nTvu+1qx2IZwoaGOrF2oyQXcIC32vljIw=;
        b=VRr/ObNrmPUg/U4G1Y6xRjlH2X5vEHppQpIhvJA8muhHsg6hjS08jxsNEwLhwgzmoT
         9uofSTajEBjaH8ePA76zCw6/VIfeehGf4n68utCsEPU22lhIQR8ASL5qVSkYLCp2pAt8
         45UemJANBb+cx8G1x9HdbBzGhVsawsMOpqP9DQRYiUpDW46W6CYsaQ8RfpmFrcyY7V+q
         WVuymwiGlE6wM4fpgf4/Ym6oiUEqSm6zehyytIBNNZIbd3Re2gVomH3RgyrtgwfIIg6b
         5vGNMzSJwIaWci+yvSYDbKHB9QPvPtvvLvM7HpmXNz1yA2PA7HCO8A9IXoJsbkt/E14M
         u3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777993723; x=1778598523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cJo6VLFR01nTvu+1qx2IZwoaGOrF2oyQXcIC32vljIw=;
        b=MFifrDhx3yfyf1o7w8mIVhhn+pdWDRc3Z8WqouAMyXhXp+w0tyxmUSTKyaTa6RjGHQ
         0Q4Es+wOucuaxzCcmtf6Rtcy7+l/V7XIdI4d0Vhkghu1PKdBRDu2yGumQ3MbSgPDj3Dp
         ztskS8z3fge6gDIUfAJRPF0bTjLXn9NDPkNhq8N+WBZvcio6BV0ud/LSp74NmjNGgdBk
         IujrBDX7ejMaOnEkyqOG9OqAHXhhxYsILomJq2hL1ry8iTJq8Z1Rn721qLKF/UfJa+5G
         dQyh24g6KhS7wmhFPLcHy03BRb4OX0hKwjl12ON0a+zz3ZOzToGI9jQpIX1UuSs+6TmX
         /I5g==
X-Forwarded-Encrypted: i=1; AFNElJ+VSoBJ1WAbzSlTg/BQhg3ybq1wHZhL7VEpTJnkJHMqIrsffBrIWWQphyTRh+PPlr56Vq4lN0JXMsqL@vger.kernel.org
X-Gm-Message-State: AOJu0YzK4MxiSZu0gYjxLjMBGQprQEpNYI1T2QN06vb2ca2ImEWfxrSx
	hLHPc7ofDUYwakZtnFLjWOOrYlJ96A/o5CqM2lkoTTqzz+hfur9pUjnWl7/fIkTZQZCm6ggfehO
	75nhM+iwPUw==
X-Gm-Gg: AeBDiesMdFvcDPCgNiQxzsQZXjGljbkycwgJW3n0fRKEP52FcCOBx51IPQzQploFE6w
	Zq4WsCULN1qZX0pzizjOhQg0iXY4x8JlheMOrzR4Bz4uXJsWGa4KwqtvqlnztCwykg8eTU3y/ED
	9KFMhVChWospkHVjsqWUil8TOFWBdDuFqtCPKVMYQYz5Ttm0HMgMzKYH6rA+d1XeUt2z1RaskWR
	tszizRJSNu/+pxiVeOUmAgfkv5B36qDkNBW6OVTUFwzP4BC816hViUFwoS/np4hG3ZpQV6WLH8+
	IgdtXGHMt4j9qJh+Wp1dApeBoLZWKkQQpnMkG+ZadO1PEOS/8Gua7s/eVsi5qL9epbKchf3M3dk
	9LmQ2KTBDALtfTQ2a7+Ekj4OopI5tFpE9d/FJg3IvWoMroKIq0rQ0t04hs5AoHx1MfvGxEjeHB6
	6+jjBqrpNL9JTk984FbkPo4YKc5Jk5uvm7POlkYSTNWK+JyOvbunC6gN4QxGN9UciojxmIY5ipM
	3kXn3bW/F0VlnMbADEQBbobV7HyymGlTU1S7RBjeap9I0JF
X-Received: by 2002:a17:907:e8f:b0:ba5:a3a0:4a5f with SMTP id a640c23a62f3a-bbff8dc79c9mr816717966b.8.1777993723405;
        Tue, 05 May 2026 08:08:43 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc28c4ea2casm196662266b.53.2026.05.05.08.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:08:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 05 May 2026 17:08:33 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: sm6350: Add interconnects for GPU,
 MPSS & CDSP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-sm6350-misc-v1-1-0b9efc22690c@fairphone.com>
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
In-Reply-To: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777993721; l=1491;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=rQUCYnfbXyXEqu7Tx4LFLNr91pjKCEeeqx3H4w2eCqs=;
 b=01bXAry7oAV8NzHQLxyLoFHCvP/azPCD9Q6oe/wQBm/AiJqZv+ee+3Jq44SMZ1prIsQmTmRk0
 X/NfVlMsSumBS2OCwcRhADdisYTqNarCiBoRPIzp+avNKAZAewrTPD6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add some interconnect paths for the GPU, the MPSS (modem) and CDSP.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 034545d2af2d..f37096cf11d6 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1461,6 +1461,9 @@ gpu: gpu@3d00000 {
 			iommus = <&adreno_smmu 0>;
 			operating-points-v2 = <&gpu_opp_table>;
 			qcom,gmu = <&gmu>;
+			interconnects = <&gem_noc MASTER_GRAPHICS_3D QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
 			#cooling-cells = <2>;
@@ -1622,6 +1625,9 @@ mpss: remoteproc@4080000 {
 					<&rpmhpd SM6350_MSS>;
 			power-domain-names = "cx", "mss";
 
+			interconnects = <&clk_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+
 			memory-region = <&pil_modem_mem>;
 
 			qcom,qmp = <&aoss_qmp>;
@@ -1661,6 +1667,9 @@ cdsp: remoteproc@8300000 {
 					<&rpmhpd SM6350_MX>;
 			power-domain-names = "cx", "mx";
 
+			interconnects = <&compute_noc MASTER_NPU QCOM_ICC_TAG_ALWAYS
+					 &compute_noc SLAVE_CDSP_GEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			memory-region = <&pil_cdsp_mem>;
 
 			qcom,qmp = <&aoss_qmp>;

-- 
2.54.0

