Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CE5411695
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544119; cv=none; b=lLazHCCzyVOXYaxn76qwZaM8Wch6QuyJqxaOGY9zwufvcUMX5UiGRgOvd+yAtdD/mxM5qZrVwZv5I7wB6XE7afGb7iNWRGP+dIcTR9kEWB997wnMzN4wvaE7p9GPNKafYjDasq4PHd8wZPPj1K+TTZOGz/6cGm5q4vh646sn9UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544119; c=relaxed/simple;
	bh=pcTuceXkLPiNJunnasmYBJ7z03ce6UUYLfZNYmOqSBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pXLrbWkLj+dedteC1o6QgTXeNFVRiKRF9nS2QTKhEK0aGB29EKRqzEAv+HNmaCcOe/hBYN3ak44ebpcfMPivAXallbiH1VL57NzXBQnvXxMV6YpTubAn01DABKNV6+BxUz6ULqZSPWmeoMys17qq1yN8fjTwV1g+mKup9WMfGUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUHHONph; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUHHONph"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso1702233f8f.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781544116; x=1782148916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RkM1BDS2/x2+bcSsEU1uZb+8F4JXoPxZ4spGf76bhh8=;
        b=PUHHONphZMvD6geN6aUT55kgSpbbhla06XHOFy8HcTorNjf82PJ3QYHXFWfg31oPqb
         KCb8FySVmkAgVB6MYbKYHlSmPbZIqYwQmMtePqucQUnSmfDNVP0B/h8ARLbEesRMaqn5
         AHIFX5qSS7GqeTHIi/jfRJGfhwy6CXz6KlzzvfJ+ZWyCD6NdK0Y/PICkWRugf2tlq57n
         qfWhtnpSBzpVSVYEXo+qSDIPNZhn/GKo0I4P3B2vvzfz0IoCzP2NGWALSxk9mtWonSXb
         utqKna0SPCm37oJyUxtHBdRTMU0H2tZ4hs2/HQFT1b4VA/WsRZEuzU9UsVQ8/nx9CQEb
         umOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544116; x=1782148916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkM1BDS2/x2+bcSsEU1uZb+8F4JXoPxZ4spGf76bhh8=;
        b=CLVUXxmfkTPY6NBmyS8W9msiuRhZkFQqAqYlaM5I5HEemKNQDj5ps0SAdM2qHL9whk
         ow1cnd0YgKIyWBReYltmfrjJ/Vs5Lfnlf+usUsPt65glwe+tsAUK5OiuDnPsGrosvHYb
         U3ZHB2knUjTnznZ4zqDYjW/AE7pe3Z4PeQdUzxbMtkwrDNOpQG9Ooq3euLw68qGgv98p
         h3phWpVTyyYBsvh+CtYRWT5RvHRyMBfoEtjLq6NHE6jiPdKceebmGI0c5FeUGOvmX0w7
         2LFZTMd4Zg8qhkn6zHgnliUeXlN+HN2UmTDrKsM3AAoA8OIC8b03LIabp33P68AfokEt
         64RQ==
X-Forwarded-Encrypted: i=1; AFNElJ961EFA1Fls/ekG1nl0O3hOAfSe2U67Y29BfMdLBDD9tv3gZoExumONQ4+fcah4jOjDcUmotdQbYsBR@vger.kernel.org
X-Gm-Message-State: AOJu0Yws5pgtEE5H8w7RilBbt6SqyO9h1Ktwqx8s6iNd4C2we0/vOInY
	bOFkLDCcD0xN4+NtfURbcqjSWZCwXR+61mkCvNMOX1RFMP0pv+WVv5enBHlpYMzV
X-Gm-Gg: Acq92OEbrrG+4cvYo8TqGwNa9Xc6B2KUD9gQ4Er2v4cnoO8iLksm/4BZQIXuAIW+YYt
	BAnAy3FQIE6JEy3dEYiXEaJD4CkZ8Mn8MlSIxoXoJ/HNM8VCW8xwBjsHsW8ydIlnNB1rOCy5qri
	6N5JdlG3Gu41Iyo6DMOs7cnoDPU25Ee6hL+HAr5gBID5grFuUlGCIfom8KKT9pZ5PPXJ4Udw5Kp
	mK71/fvwB4PPs3/7hMHNCVGjYeGkxTnOCcuThIuo7XDNb1ZJcNF5C90ozA0o+32fhTNUjD9U7Kq
	UJcGFU9iUmCVfb0vCs9//hZjXfcRTNgaEV+b7cGeZFKul+gcQ8OM10H01F+ns5U4Dh709JBKVC3
	6GHEMJpeqMrvywtOv6VCEHwtWJ9IlHO1mPnB73bkkk02B+CukzsFB7YPpHPP83Qnlk7kcwr6snY
	qBcwCmn5ES9GVzDYRh
X-Received: by 2002:a05:600d:8496:20b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-4922ffaedfbmr1209555e9.22.1781544116287;
        Mon, 15 Jun 2026 10:21:56 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm6870805e9.15.2026.06.15.10.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:21:55 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND] arm64: dts: mediatek: mt8516: remove cpu3 armpll clock-name
Date: Mon, 15 Jun 2026 19:21:00 +0200
Message-ID: <20260615172105.3758-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The armpll clock in cpu3 clock-names property comes from MediaTek sources,
but it's unused in the kernel and not populated in the clocks property.
Let's remove it and align the node with other cpu nodes of the same SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..596f673a0d88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -95,7 +95,7 @@ cpu3: cpu@3 {
 				<&CPU_SLEEP_0_0 &CPU_SLEEP_0_0 &CPU_SLEEP_0_0>;
 			clocks = <&infracfg CLK_IFR_MUX1_SEL>,
 				 <&topckgen CLK_TOP_MAINPLL_D2>;
-			clock-names = "cpu", "intermediate", "armpll";
+			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
-- 
2.43.0

