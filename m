Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752123603E4
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574688; cv=none; b=IhK9seKovwTaPkM8pMi7yeRo5nsURhhy4mzD7yzUQ0+JFCtNRO91gm4ywIw8JTX1nsmEGzTll7bmKDucsnOZyN0RMBHf4SjzLMgTl0qxIhCkNPpDthlP6CnIJeF2ZLmsmwDSTPZuOgI8RjB+iWUowi2aeST5YjpVJlA5AAQoOBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574688; c=relaxed/simple;
	bh=XnHGDE7VPDkthZ+NJoEGvNwIAX/8Td+XCz0h8UYR6uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NSSj+EEjmQKnxV1bhMzdM287Cc+d1l74ZCHobYXhNKuup4Xl8mv5cqMgIWui4DVLvetGNegZCoMJKKLU7QwUwg21OTiuWpHlG8KiqZtRpPzMt2hv5YQvaA7LVSTdq28f4uzWtdHXfsGOCqIeikBk7DY+iU5z7Ti32Ma8akVI0JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CfESMLXs; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CfESMLXs"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so6932146a12.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 08:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775574685; x=1776179485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DW9/t5H928zsdNymoXJFEIFtWYYaTCLmqIgH1LiUfqs=;
        b=CfESMLXsXkMaNCVZucuJ8QEB0IAoYiWEuBwxZ5Vaf7PGSqNua3DX6TH6buyo4P8Z7K
         EakEugpOO/uin7WQx7Cf0fe5YloTb1LcqtVLX2oAihEv0zZlVaTkctdWtWi6FfTe1wGw
         DynzZDwMp5YnJ5QfZJV6T0ezaByXR0IdUFKhHxQg0wszTtWF51tgWp/b3sWcsOfwhi9p
         8B+ZaHcvxwGXjsEcSxzvSUrAVCyZf74/+LiX4K9BUzisxVAwDd/RYoATtsSVdSEhX5hX
         E2FuqT7uYlm4V+yoBQhWSIn3GYPjYsE6Y9nPsKAO3jbOeNvUMW3T7hVEChIP4eyLwS6t
         7j0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574685; x=1776179485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DW9/t5H928zsdNymoXJFEIFtWYYaTCLmqIgH1LiUfqs=;
        b=Ys9IJT6iRUFaX1c8Cm5j4akqG02wb1q/8bfZ8QvegKd6647YU2niPyiaEoqi0k9u83
         cQ75TRiQfLicd/cDOydeBwvlIP0iVjjCWzMqtMprH9cZetkuF7T3MLnwUF+PNsxG2AHH
         CLeJh2wuPDS/ybdUYE9piWEmv+FhBjn4OzEPoLbknqiPEaFI47NKUY4nz104H9WySOI7
         BulB+ZbDrrMg49H3oSbeEQjUc+eUZg0LUxdx0jCo58AXEEpKstLg++ieU9Szyyp3vRXN
         Y6oJI5JYs8uvXROcPcS+eErGQubBp3WURqPE4SsA/QBuWqPUPwKBvgwY/rYdzHuUaZ6F
         z5FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIUcqvEEcSvvNpwOG4Wa25HhB982KwkFh0fSTjn0qhUDV4vj8Gk/uiO9jKdgc4WDU5bLBQZAZrPQyw@vger.kernel.org
X-Gm-Message-State: AOJu0YxnU1fdl25dFDIlWMaSZyPYjiACcwE3Q55gaKdlO9digc3/hP5E
	hqbPEL2zeC8FVOAjjfWB0qBXqMixwsmqfttCQV0slY1PwVcd1kt3parmg/9xhOEPv0Y=
X-Gm-Gg: AeBDietgzlxaoZO01ljc6exLOw82vkZqXsk2awfg3lpwKqyq/Bqhng3ViKfNK5C+PBI
	KWL4+JwEpSyuoiGLwXjNH7Vs+LbAL8aQoJxMYXfNIla+5sTcFvtyjrrPZT2QPKx2J4IcNyfN6+x
	Sz0qK37NPgygBh5Z5DBhjcy6j7MBvaSi1fWbcIjWyBmEZTVTK3OSBfeW9UI2se8mfuly1H67jGN
	3o2/OeFlJMgoEqG7I0smoqGo98HxBgx1ZIZK4w9YkHfj1J1TSi133iOBxdltJZmbXBGPEu7pZgH
	dXdHhfQfg3YxzXMGwA3xPz0lKbJkwaEEtpliZY7PGdYkPvdKAbakSaIZH7nJ5Ga8fPQav3cs4Ni
	Z9WOUGBkR9fJ7SA63JCMy693hBAZtiLOR9EWreZmcRhilfSmZ4Milzhp7bCv2ge1iXN9efaHwMo
	W0urclV4uINZBKuE9QGGnQeE+rMOfry8uSqTjmLLD7zS0jJks2kBw4D4sOxWIzGX5O5mqN7gY9Q
	x0H4g==
X-Received: by 2002:a05:6402:50ce:b0:66c:17d5:c18f with SMTP id 4fb4d7f45d1cf-66e3f86ed59mr8156709a12.21.1775574684793;
        Tue, 07 Apr 2026 08:11:24 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e6f10834asm2753326a12.15.2026.04.07.08.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:11:24 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 07 Apr 2026 17:11:11 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: milos: Add IMEM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-milos-imem-v2-2-5084a490340c@fairphone.com>
References: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
In-Reply-To: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775574682; l=1301;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=XnHGDE7VPDkthZ+NJoEGvNwIAX/8Td+XCz0h8UYR6uA=;
 b=4r4wSsKQia86L9Pquz3QkVW7rgmralJ7ILdiFqwdAPoJfUtb8NjluAJ4VxxVoj21GuYBjqkuX
 MerAUeEaflbAWWUUM1tue7CrAZtjHeqexC7bumYG4A3YKRbNpv1VpVH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the IMEM found on Milos, which contains pil-reloc-info
and the modem tables for IPA, among others.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Not happy about the names of the subnodes. pil-reloc-sram is not allowed
it seems. Glymur calls it "pil-sram@94c", not sure this is wanted?

Please advice.
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..0c69d5810f5e 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2289,6 +2289,26 @@ scl-pins {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,milos-imem", "mmio-sram";
+			reg = <0x0 0x14680000 0x0 0x2c000>;
+			ranges = <0 0 0x14680000 0x2c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pilreloc-sram@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+
+			ipa_modem_tables: modemtables-sram@3000 {
+				reg = <0x3000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,milos-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.53.0

