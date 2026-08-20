Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01F5419FA6
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223849; cv=none; b=Naq0vX17llJhu2CNVAvE1EIi1m/R+oKAl1sZeV4mMLk7qrvWvYVLAxft/OBkeAWDSpoulPzQxDJB+Y7O4ib4BWmaij+hyPz1MmPwuMLmovZ+hA8Du2yNJjRxpazhsgRMnVKKjN33Ju9inPxv9WhrusDK17HtsM1t2gLIFX3I984=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223849; c=relaxed/simple;
	bh=pWoMjTkbFL8fsd9FdyFU+AP43bbp+tOHOCvu0aAZBrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDTi2RGkZUs12t6+Muvrn2XbAkSEMZVz00F5f0BvHaLUkADYXnpe098+SeQMoPQbIKlGMvUPfY0dqQ0ijbi3Lp6MXR+x7cRGBYDThtIvuWH5UAxT8VjqiBNjrcqIBS1dSFHo1JUOoAZU2ouTE/Nzoqvb4SpGPynBg2qsC5eF7ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWb4q5SF; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWb4q5SF"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc147d86bebso650706a12.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 04:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787223847; x=1787828647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0hsPh6rJ9k7khbV1rxI1LTREfXN7mQXDJAbaQI7N/w4=;
        b=DWb4q5SFsUWbQKuYi2MNvuq6IbYaTCP6DGgW2Jz+GsbGwK0LDTojDPpFXgivyGaLgL
         dRjEJIqN/0TpmoxSqedUKZO9PC90s+P8yLG873fjjn6TgQJIrykW0faEg/8KPiiSuGfm
         N3yrqQjJmY3sVRZEmAhv+7ia49AlRhYJ+/P3wxv2CiA6lBvuCpPhYMSwP2aDTKsoa+1X
         hGlNLzFrrnldPcArsetEEltw1r3WU7mhDZSct9fa226tXl33iyAgXZSfHuvuVBPlLqcl
         A2p2t+vQPU+3KCTgSUeL/0tgrT325dxjl0WtWRD99S7TWX9AuxnBHHbEzkvekSGpTdcD
         PSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223847; x=1787828647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0hsPh6rJ9k7khbV1rxI1LTREfXN7mQXDJAbaQI7N/w4=;
        b=G1j9yJ9JGwyXCQzMjGkq8gWbrJV4roaLxOL5Mxoxclc0Dyl07qto85wYHsQUUHsBVl
         yKtS/cIqdSl0Pw2F4ogalh4+9vcsNzh7aeg70DGyk0aB29oBbw7dgbUwBAoFBd1j2tMF
         tTS+jLGm4L+xDPYp/fYKV2ObHhGbdsixHv1tgtXs7e2717xnup8LCjbXUmMPxU3u9nrS
         LsorlcLIq6ePbgmtXwphFuC3kCkPJ5Co86W9PxL+LYdk9YUwCJ2OFMyoj98Oo1PV4dY2
         6ZSaSUe4ot9adnQw7HVhR4I8+MGaxcEiwoG29c8pfq1lxC1e4Poq5ocX2Hy3up2J2bPp
         X18w==
X-Forwarded-Encrypted: i=1; AHgh+Rp3mdP+hC78ce9C1WA10JYAGgHnV5c0zQt8utnbD1CFtfPRA4TLT1dfIZU35ySFScuOp78r5X2eBsOd@vger.kernel.org
X-Gm-Message-State: AFuF++n8eYyWXFZHmoHQWgW+drKQMxhOFab5axsytKprP+0njR+Rz4WN
	Va+F8ppobGSobMZdaG2QV8kfakKQ294fywIM5THTkYtUN85r4s3ipDF5
X-Gm-Gg: AR+sD11BhP6Z1emL+3sjYkmNZr1/jxyrGC+NTeqQyCUHi7Jec44ghDP976GQrAMjetD
	lc7+FtNdZz8TM9w3SOyOvInQPbKlQVI5hxczEXHj+cwvviLE6A7HbScMIy1dhTHCAV8F1YUT0aO
	RfHp2IYhwcqD2h1gIZ6yibJyBp2V7Z/rjrAQt8sHRNNUS5Zxjb+wzHHTC1WAcsufnncE+HGHBsm
	2K5fOVjufHNKXN2Di6bj6gcj4FXiuMvBXvgRJqumZi9Kz8znJpnP31neKrlXakhVGhyEtuRYe6c
	jRZiL+tL6jdImykNnpB+m2ee2uzKRI+PtT5UluNVwihDo9iH39uKEZdPq3ByfxGCnmb1W+y+0Un
	JXOpkmWzlxhaTV8oblVXjDeSA4cMeMAZ2f6dNkSzZC3mTE/3G6GLsplvbuElIE+/5bhTEsQbJic
	D0Z4VtGJm+HgmKCUd+wts7swpu1SBficqVg/Pnj6VkVzD4HQeFrt8=
X-Received: by 2002:a17:90b:2584:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-395a074aab8mr6078776a91.10.1787223846856;
        Thu, 20 Aug 2026 04:04:06 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7015:a156:d857:47e6:8c8a:886f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb12145sm6200668a91.4.2026.08.20.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:04:06 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v4 1/3] arm64: dts: qcom: msm8917-xiaomi-riva: Enable debug UART console
Date: Thu, 20 Aug 2026 18:03:45 +0700
Message-ID: <20260820110347.98068-2-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820110347.98068-1-imkyufie@gmail.com>
References: <20260820110347.98068-1-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xiaomi Redmi 5A has accessible UART test points on its PCB, they are
routed to the BLSP1 UART2 port.

Enable the blsp1_uart2 node and configure stdout-path under the chosen
node to allow outputting kernel logs and facilitate early debugging.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
v4:
- Simplify commit title
- Add commit description

 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index 4ea4fbdb5..abfaae502 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -13,6 +13,10 @@ / {
 
 	qcom,board-id = <0x1000b 1>, <0x1000b 2>;
 
+	chosen {
+		stdout-path = &blsp1_uart2;
+	};
+
 	battery: battery {
 		compatible = "simple-battery";
 		charge-full-design-microamp-hours = <3000000>;
@@ -25,6 +29,10 @@ battery: battery {
 	};
 };
 
+&blsp1_uart2 {
+	status = "okay";
+};
+
 &blsp2_i2c1 {
 	status = "okay";
 
-- 
2.55.0

