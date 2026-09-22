Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECFE569F1A
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 17:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790097593; cv=none; b=VhhAMsdSqVb+BghBZ3BiVcQ0HZJHD1wLNNzf1pUHTEBKj9L+CfoCIiD8hQzFDcCVICOwDC0WK8UfRhgS2oobNRLmjFWFu1xeSZaHhdZCBkKsAAlxIFdF4fB0a9LQ4w3l5Zg39fDRPYT7DQODYp6MgXRe8hHOwIxbrGBE9ZBJdrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790097593; c=relaxed/simple;
	bh=a3sPdyHcHprVQwZOqHIoUiv5J6nmHku9niqJCOzNbB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZdnUHzxtIPWVs7EO/tWp/sP09yd2larHmuBgaZWhpUhH2GMha3e+G9zRa8d10XoG+0jaskWPSJxhdq9Tk2uofzKss6R9s5B3krNCW06f470mzVkrncD6t8cOa14IZ/bEkQ5swunMcIFXSbZYUfxBRiSYYgYkAxA/5s9Jyr/tlfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YP1F/gx1; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YP1F/gx1"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so123607a91.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790097591; x=1790702391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXAQgXk9WXyXBlox7Yojnplh6D8AEqEL+5pp8xq9FJA=;
        b=YP1F/gx1S8rJjeGWtdAUBC01pMp0cZlcRBwPjY0dwSEH4gBg3U2Sl8sj/88ZZp8y+t
         ep7LhCjj9UJOD+zqwj0YS+SWDVJjM1cqwOZWKXBy1nVLbdX2OC5+mYsocyK+lA4Pv6qp
         KAcYGPPKW3yI4s+NlHeWVHTmTQ0J8T0zFa6OQf8CWkscgcvMRWD7M/RaupRXapUwkpeG
         /8zpypvs+gdYzoNdbqYeP++7nalIfstJUJL/l3FggclVbGMzAXPG1NlSO0cjX0lkiWmH
         vNsW4HDzaW0sNq/lGGeDYU9P7i/8oscWum3/klzUZzRI79lXh41HrBvzOTCa++amRx+0
         3pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097591; x=1790702391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXAQgXk9WXyXBlox7Yojnplh6D8AEqEL+5pp8xq9FJA=;
        b=R5fsFyLIIgpDl2WX85aD3WpQe/N0GahDQ7ILW00DRiXvLNwnduwk1ucjhL1vKujked
         E0Qen+bwdUDoEaRYvy4RR5KOUccxgWCnzS2b4l+fOrKMDzbFhwNwwSC37c5XKfVtE3ja
         mE9sfh9c9yNpiUsNhGY4bLvkXO7fET0c+ruFW3ODbd7QnZ2Cot2EgnQQyu7RXjYXL8WB
         M2XO7V/6ykvadPaCU/3jGX8c3bdLZ6m7X93gU4oFkljqW9iSGSkpkBz5B+PDz+oHSq+7
         Pyl5GVJN1+VQQ4oNSX1kH6p8OvsMtj8aANpRny9MLPykBI/x9Dx/JZ7UVkL1vk1WViVF
         14Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwsiYWRLmAV+XecdMja1V0Rt/F0T4uCm+L2yYdQdPr3M3CNWJriLUXLjg/5nLgRqZioUfP8O+O3kT4F@vger.kernel.org
X-Gm-Message-State: AFuF++kLfKvYpUFK+0WOMRkpo0K+UN8s90ZYeqcMuC37sU7bbB6qZ7xa
	jYH+OxEevTaINjSPG4tbm0JGszGeaISBPdcDDBkScZoliSm5RHMN8J4Z
X-Gm-Gg: AYBFou0lUzEiWB/bxbkwiTZMIr2h3aOlSu4XB5OQzzen0rA+z4KjleGmUuDIqfaTRdO
	yr/NUkHiKyIMFU/N7f72k3GnjS7BR13Qld0ey6vFQfGSezNvh8xchFt6NCvgD5g8EbpUcA88hL/
	YpH35gacuq97sQR7bY+wc8/ZTzUTOGw6luOGrq22GfDx8vLSOld1qv4sh3xBBCyRwtSqCtoV29I
	4HnwV17UDc9T42wG8bnlNbroN7m2GMGTUoR0s1ylCawjeTw27YIHlPTl/MgJZpkG3jUbYZqb8sg
	AnWomck+FO9q+q2z+bqU3fH+bkl1E13JXtL3fmNBkMP26svFmA725IqHelkL3ZxFKlegpFR97IT
	oY66H76nDZSMIEn2RwPAl6c7bpn9JdYS6cNvJmnkt7EMZMWclLf+rO1JtVAFI0CGEC6v/T1L/us
	wLs5iz094thGzezHodYViDHfKq11Bi/KiRQONtlAi9qbisYfUy3/i/W/d6o4pNx9CmZIF79XP/
X-Received: by 2002:a17:90a:e704:b0:39e:6a81:c923 with SMTP id 98e67ed59e1d1-3a07e642712mr129398a91.22.1790097591215;
        Tue, 22 Sep 2026 10:19:51 -0700 (PDT)
Received: from nevers1dd ([118.95.161.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db88298sm438333a91.4.2026.09.22.10.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:19:50 -0700 (PDT)
From: Siddharth Karanam <sid9.karanam@gmail.com>
To: nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Karanam <sid9.karanam@gmail.com>
Subject: [PATCH] arm64: dts: ti: k3-am62-mcu: Add power-domains property for M4FSS
Date: Tue, 22 Sep 2026 22:49:42 +0530
Message-ID: <20260922171942.201947-1-sid9.karanam@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assign the power domain to the MCU M4FSS (Cortex-M4F) node by following
the device ids info published in TI-SCI public documentation.

This will be useful in future patches that will attempt at abstracting
ti_sci_dev_ops's calls such as get_device and put_device via pm_runtime
calls.

Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
---
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
index 68e906796aefe..1ae0870893c16 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
@@ -181,6 +181,7 @@ mcu_m4fss: m4fss@5000000 {
 		      <0x00 0x5040000 0x00 0x10000>;
 		reg-names = "iram", "dram";
 		resets = <&k3_reset 9 1>;
+		power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
 		firmware-name = "am62-mcu-m4f0_0-fw";
 		ti,sci = <&dmsc>;
 		ti,sci-dev-id = <9>;
-- 
2.34.1

