Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940B213777E
	for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 17:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776620031; cv=none; b=adOSr0FOhgHWk8agdzGlZBcYQVzyCzbpW6sO5a4GhoZw/wX7JJFSpxAhHANiQFcv7lHkceOWNMHhTEkfo0sHEtlYqcijLo4Ux9ml3e2W4hoME4Pq8D8VkSibjozvjVideUBWt4HEBzqGsjCU19cypVUHyun0g+K8j3+GjQymUPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776620031; c=relaxed/simple;
	bh=+eXxsG5JJH2rHEDsoO56L1a9AQOL7NpuxldcjvNev9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=roqkviUXQHnMyZ2SWaFJNXb/EX+KQjQuhOjPnt4p51cbV3c6H7Lqd9qpITSmgaWSvgsvQFnDGFjK/7vZH+cWlQ0YhtfE9Y7jTJNldlk/3weHOSVao51ebVAxavfolVK5bsXdwfIp4pCFmdc1+GL8EIue8dqcgIx6yKnqdYTb8pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ2gcg12; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ2gcg12"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82fb2d0c5d1so161349b3a.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 10:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776620030; x=1777224830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtHVeBeDpsVTJES5iTqG87kNqD4MTezzYdcdk0SZrh0=;
        b=dQ2gcg12kbiMWEYPEv+BTJkS6Y1ew5QmWqDIjueJWD71AXeqG9kkAHSxxuX9qntb8i
         LEhuEys+JyVRMye+L26+8+LOJAch2gg9Q0k0vbTV0CRIpPBztQMS8YWoy5Gfr19xhc7w
         BjenKA8cz+pMeg9K4c4z51bj3g2mcqrodAj17bWNUUKjUOUL9C0SjbPmsDKet5Wswxun
         AnEeUEn7GTpNbVZKmSYYG8dKmas6/m8UH0IBL0wN82yisBo9Jlh1cHdf3395WxBtoCtv
         6ttIXqal4VzvzpEB3YvkE66kRqWzea2l9vrop/LpxKIKPTwPrdCeqp9NaEGWFzuQxfCl
         Vy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776620030; x=1777224830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xtHVeBeDpsVTJES5iTqG87kNqD4MTezzYdcdk0SZrh0=;
        b=oz0JL89/VnAXXpNnszYrVwB/Ui4Mq+v5pJT5h2nobuDlyc3K3qD3SoBnpb9J85F7Oy
         QdN0VXS7AKYuvTw09MHuoJllGK625yHweGeDDunFRRiofKO3FBhGcQlNbOgr8jac3OA9
         QqEM+FtTL6ZhcxlB6QTAi1UQB9Ocu7/XzOSNvdVGveB5XO9GMfDET96uiU0DnwWxOCy2
         j9uHDGeBypGBlunBqFKv327dgLA6SxYeJe+zLOvgA/N/utlM5Od55D6OwLDdSSpuqd1Y
         fA2JQZep5tjlvYJMo28nvaSMQs4DmkLbowUqJTfRKswxwpNCwCeXEiAHT0+wBEdPPuOw
         qJVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9THwESNnrx6AQVoXa27K+F7aQ77s9c28J0QMokZ2Du327bjrbO4VTW1py7PKen89hHIfKUUP4Bpn6s@vger.kernel.org
X-Gm-Message-State: AOJu0YxcLo2CI2nSlCZ73tDJ46IuzHHP7/tDHT7TTY+ELcBZb+phVchg
	wCLN7qLmLlZI1kVyPypglUVUPw44xYOZQ722YWSVL+Pc24wQraug8r1A
X-Gm-Gg: AeBDietyKpTdU4XyQddx+9ODVb/7Jzwxqr8huXK1SCiZTTnix5ds3sYMj8sJ/G0Co8g
	0ZSgM2avOvI6KKCcq9bBM4u/2x1ZCs3RxwIYq9LGdb485jM+EjkigGsVOVNroMgONutFg8JBjR6
	/lsY8bq6PftZ3WwCX+C+oWsXphHcGU8tYNt9dHdWi7JLxEHirxdQzK08s6AFAh7QQcDRbLwiZWs
	ggQhq0p3NYDNWBVmQpSLJ6/p3Sil8IUZKIPtEb0pXfYXibqA9D+AHUeoo+ApVhZdTJfgIh29jTz
	IFzwFVfNlwHeBORPF8hmG3+xrbYwNGIFuv/jH3qJsx2m7aEgv9SQ+rTLDLGzqpQxSdZRwT8fRUp
	BJ9j5OjX8trZkMjysGugs2SpUYFkkpS/uJs3IXZeYWs5vaWV2HNjt5r/vZ2sX1GXeom1uU7tCAW
	M4hbBQNNMqRN+PPQ==
X-Received: by 2002:a05:6a00:4507:b0:82f:6c51:a246 with SMTP id d2e1a72fcca58-82f8b323284mr8254694b3a.2.1776620029980;
        Sun, 19 Apr 2026 10:33:49 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::6c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe40dasm7954833b3a.40.2026.04.19.10.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 10:33:49 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sc8280xp: gaokun3: correct EC interrupt pin
Date: Mon, 20 Apr 2026 01:32:50 +0800
Message-ID: <20260419173251.1180026-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419173251.1180026-1-mitltlatltl@gmail.com>
References: <20260419173251.1180026-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike other sc8280xp platforms, on this platform, in dsdt, gpio 0x2c0
is not mapped to gpio107, it is gpio103, so fix it. I found this until
I did a trigger track, irq is regularly triggerd every several
millisecs. In the past, since here gpio107 was low forever, ec irq
would keep to be triggered and polling the event every several
millisecs.

About how to get the map, please check openbsd driver for it
https://github.com/openbsd/src/blob/master/sys/dev/acpi/qcgpio.c

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 9819454abe13..d9d55241336e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -637,7 +637,7 @@ embedded-controller@38 {
 		compatible = "huawei,gaokun3-ec";
 		reg = <0x38>;
 
-		interrupts-extended = <&tlmm 107 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&tlmm 103 IRQ_TYPE_LEVEL_LOW>;
 
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.53.0

