Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8818840A94A
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 17:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520081; cv=none; b=cM9TW/4ul2x8Ai3pKvF0RBLTtrTU9pXS9DV0aKI6z7B+RQ8yYO7LWJgRXPCPJcRcjKRsVKiTp7ia8RSiI7JwNjAI6y3zB/MqOSPCSAlqhF03IEkcxw4OKp7J0ANC0p4Qvu9ECKr1ysSDLZbV+v4cCfIX58SQynjOtbnMearIrdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520081; c=relaxed/simple;
	bh=0yNn6UCEpfxiasWFtsI4EcNwcryZJo4lBKG5Svutmh8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jknN22dyaVvc3lFZhhuN6GdJ71vcYhOFLyDzuh91p+OXY9bhTt8u2jLAtUohumsBBP755nTR3/Fr5qscYBhhDOmnnFpW4HeDAeKHdpHhbNkoYBLDx7d/BPoe1DHGD7pROVNuigdrZeSZFBn8EWB9+KJHxqal8HJoijEvgv3II3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtmjwvRR; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtmjwvRR"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-455ca262ccbso880789fac.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785520078; x=1786124878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+XQUCg6wdOzJjQ9gmJVOhDWO1BvviUjv32Kg81AE2k=;
        b=UtmjwvRR8LdBz7N0kMvgX+0sCkqj/LASGn/vSjM4zLcpLwz8fC98Ox6oTFfaqKTZyd
         WqLqg6tqukuLU+ESQIGllfW75q67A9gHd667yHAgCp20n196FCFHieuXudJ9gXSKIsTj
         x4ZGwnBsMu4QBgprdxgninsxTbulmhOkMm9Z8MtUs/vINQVT5D9jYt1BqUbF+zR1wg5R
         eCoiBqhxS27cidcnTwNF7vywkO3MvL6XU9nbF7QBhbNEahulhXWOy5VVhVUM3b54jt4x
         ANHM3wrvEP5ZFdxDxOto0jVOLRDxqqGuefsNPTwTF3FErcmV30exfTR8EuXwDU6ToFZB
         UnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520078; x=1786124878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+XQUCg6wdOzJjQ9gmJVOhDWO1BvviUjv32Kg81AE2k=;
        b=JbzqBNTTiNYQ0DviqNHi9bBf3/LG17RJAmctFNl05/MsQu7BAsEFTrcFow2P/pLJoD
         MFkDyAbhWTR9MTzLnkK+x52b1S1Y4GawJOfbaiv3uyCfCABGWmh1NPhrUieC+xZlhWTo
         HPFeILrAVVVT2ie+3y0luk/AW2NdaefIrhHZ/kNg9nBlzHjG9hAn8QKb1Ghj6GAALXOO
         bIY8aOWrUwI0KE18IKaRMH1taImkZO79Td0TtuTMl/nJrC3vcZWY1j+GIiazIMOVZurD
         ckAnAtwr5KLEBV2TaAQZv29BU1A7XLi8HR4NahPisfP8nUNNKJBi3ZeHKS5DlEPYAY5z
         RILQ==
X-Forwarded-Encrypted: i=1; AHgh+RpuaJpi2OCjV2/p52pRyryYbeVv8ZYajlLv/yqmzjFkmscdNSpaAx4v4rGjAGWoxFrngSThX0TYIGkI@vger.kernel.org
X-Gm-Message-State: AOJu0YwnL9vUMY/ytXp2Z3zBKwdc4fxYdbjLyQOj/Jl06mINzCz5PLVn
	eFgwV61M6G0Qsk3sxiyAbb2DOlFsJjOXlcYfJcksIxryHX6A3V1ejQfL
X-Gm-Gg: AR+sD13H6IqZY+aLZ6tqflHYtDkBCw8SW4dDnuuGt9qkuSMnZFRN5FNk+2j18/buVks
	KhxYqSnGedIgL+ld0Aa36gvqO+4b7g1D8vPN+E4edzqJY6GjjVepdCwf3iRJdNKscAWMOd6csC6
	kaMggAGQmvxZWUdr3U292whKhSTF0gSFVcRutZTu10xLONSpAQXyCQwo8ACFPdvIaiU9rR2eUWN
	MqhbxV/ucuou5+LqzjFvcr0XoO4wN7dhpV4EuFWlOylukLTp8K3EAjxOKMLxKojI8A8NapkaznY
	r2rRCfQ/w+PQX5ChZUi5pBcK0evMd6Ifbb0PlfBnPw/sQHqKjopfPbwopvSUo6h2v6fh530/lAK
	eRVumX4IvPoMBMURjLTSeRJ1aE2a/bH2z31JJ+EY9lqvBpO1baXEtGc58vXsjyhS1GsKEkcLhuu
	FAsMLbX5K1D/yGIC8DIpvVV7Cqm9en+FhtIYsbFPPlFW2q8D8knoEPGp2tIlP5DQsrf8nm1x3tN
	Yt+CZpGZAnSHNcxbw==
X-Received: by 2002:a05:6870:c228:b0:448:a3d6:c2d2 with SMTP id 586e51a60fabf-459059caa56mr2000761fac.10.1785520078354;
        Fri, 31 Jul 2026 10:47:58 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([49.204.164.242])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f664d812sm1845122fac.9.2026.07.31.10.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 10:47:58 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v5 2/2] mips: dts: pic32: pic32mzda: Remove unused address-cells, size-cells property
Date: Fri, 31 Jul 2026 23:17:51 +0530
Message-Id: <20260731174751.86819-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The #address-cells and #size-cells properties are not strictly
needed since the child nodes don't have reg properties

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 arch/mips/boot/dts/pic32/pic32mzda.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/boot/dts/pic32/pic32mzda.dtsi b/arch/mips/boot/dts/pic32/pic32mzda.dtsi
index feca35ba56a4..433dff3cf14f 100644
--- a/arch/mips/boot/dts/pic32/pic32mzda.dtsi
+++ b/arch/mips/boot/dts/pic32/pic32mzda.dtsi
@@ -76,8 +76,6 @@ evic: interrupt-controller@1f810000 {
 	};
 
 	pic32_pinctrl: pinctrl@1f801400 {
-		#address-cells = <1>;
-		#size-cells = <1>;
 		compatible = "microchip,pic32mzda-pinctrl";
 		reg = <0x1f801400 0x400>;
 		clocks = <&rootclk PB1CLK>;
-- 
2.34.1

