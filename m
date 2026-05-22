Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434DE382F28
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430057; cv=none; b=CFGunEt4xJF3xnu08hGdt7EPs2sNwFie93XxfUth8/2EvNehGvdj891tmr1uCoSHcG295u29WFBKNdbvKddb+B1QuLb8IggIgbufZIxgDBjiYrsxDuQn0C97CNN34wmHGHt9xMBDIHgRNyr7hhUCkuzni8zysXGV/e8EZG3UbMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430057; c=relaxed/simple;
	bh=/I7WuYR6MH/DwUP9up6B//pZnATesBLUuziLXAJIHF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbpzU6Mtq8ULHiSoo+6w3fScpzcQhDQ1xwWQ+DQXXqNwZPL3Pvo83JKlN01Dx79kaXyT/Fc2BAQ2E1UrV92UBMcahKHPFriMEzqs6lqP5nxXPH43dt8GMvMIFPiseYnTl3/xAwkJvsfYbP92b6gvlzJSbtF4lvUKaQbTo8sWTOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IM0YKZhM; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IM0YKZhM"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36a7bbb9698so71909a91.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 23:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779430055; x=1780034855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GxXWPb5b7IE1WF73BuquobJeXJY1I1vTx7dwyLAryI=;
        b=IM0YKZhMO0xiZohYIxkgz5yMTixAWoG867iyXV30gkhhoakHUocUI98v9zKMWHUEUG
         CkSPn9OoCrag5WW0+gA2ley4knveFGmOwcU9o69C0nt+m/oA3zUiW8TVx1kzPFkycRfn
         PgU9hBDNI8i9QtpaVE1nUzCgQl2+Zf2XwovuJmrcgVHIw0My3jXl5sLIXLfAW+y2XaPR
         TysIS2UCWBXReFA1Q8WEw+Yg5Vlrk5WCr+Ua+Dbk7M7/YPKjq551ahDclH5IM2VZbQPd
         gn5qUjvszCjOX+myMMDN/05rVzRrFjrZ8T/GvWJAfUZFuwkwd2QZIPvwWBmvsz04KKvs
         i3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779430055; x=1780034855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0GxXWPb5b7IE1WF73BuquobJeXJY1I1vTx7dwyLAryI=;
        b=GTKKExDpAiLAWfcOUpem3oujMidZ/2Br4fb+kDy21230zLVhx4QB4tpWGwe5rwCuFA
         Jzzy6pcUdXCDzRlBga8AS2d5dg+dee9KYCT4XMiuAhmvjWQ1G9iARk5Z8dpaJNDBTdFw
         qu/heTsN6xKH5cLQGH5FyIQaQC2duDJHzXHHnmeojhVN4B6n4thSafI72IzLTbAkvzN6
         jGaDlygFxD+jhRnqyUXnpoFLSHVY8fZ8h4nvPAtkezgnQjF1WUWB4H1EprCSX/P2JyYs
         hWaILZyNyArBWAUwabNOQYNWp7M2efFG9M+Zd1YNfHpDVEIIin1H9+EuvdzBsgXc9Xr9
         kfYw==
X-Forwarded-Encrypted: i=1; AFNElJ9egc2s96M5FL7BjmqQ7b9pc1MzOcmfxNbysf1wuWVKpffNauyV/BF2x3+2XQmz8YL1eU2KUtN+HXbf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm71oBxcziryAtWU5FsqfCzoxgCYQ9TSWZUGIRMCjSVfp0EFYx
	KOqRUdxwSnYMTMijBZCdKwbXgmSCiYuzmBq5j8u646ZcoFC28Xwh+4+U
X-Gm-Gg: Acq92OHNM+PlSYbddqfecQc6mENdSvXNO2VcNkqp51stFLd4tIk3wxcKGoTsNia5C7w
	iOCRQ+YkLsDABILq3y9rjr+7k2ZCLcQtcXCPeaq7GFgrm3tWwZoeUe0JwyPDubvH//TfdpodlEk
	byikDRxBSbfaicDWReG7D11AzncecIjWr/JrOhuv/aca1WQykTDe3HETYl6k2MJ0eDuLax5rPdy
	LpC4Vop7zDzoF2yNsUnCbW72Rc8x0w+XSqKgQv/1cxnwYJdav1yClF7tEIBs+YtdC4uSfZGottw
	od/atbwaXWV0bo9rCpn79egitt1bMRi/xok1OMsy2yEzUloaXannEG34d7wdD8NnyHj/nybAU4e
	SpEIxeOmMrJumseg94WU7vRkHRXMby44M4tAWZT9/iLS2/7XaqXh58VrMl52h9gvLAOa33nb8BR
	3uTYLWHYwiMd4SuAa9nbui0+A43ZiIysP7uPc7mDSCDxfJHzIzP7+2bRpTOZSJ5033lg==
X-Received: by 2002:a17:90b:270e:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36a67697a77mr2327977a91.23.1779430055466;
        Thu, 21 May 2026 23:07:35 -0700 (PDT)
Received: from radxa (122-58-25-162-adsl.sparkbb.co.nz. [122.58.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7212aa06sm428572a91.3.2026.05.21.23.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:07:35 -0700 (PDT)
From: Graham O'Connor <graham.oconnor@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Graham O'Connor <graham.oconnor@gmail.com>
Subject: [PATCH 4/6] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Add regulator supplies and disable EUD
Date: Fri, 22 May 2026 18:06:43 +1200
Message-ID: <20260522060645.4399-5-graham.oconnor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522060645.4399-1-graham.oconnor@gmail.com>
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing regulator supplies for qfprom and the PCIe controllers.
The qfprom node requires vcc-supply for correct eFuse reading. The
PCIe controllers require vdda and vddpe-3v3 supplies for the PHY and
connector power rails.

Disable the Embedded USB Debugger (EUD) as it conflicts with normal
USB operation on this board.

Tested on Radxa Dragon Q6A (QCS6490)

Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
---
 .../dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b03..4003837ad 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -1093,3 +1093,23 @@ &sdc2_data {
 	bias-pull-up;
 	drive-strength = <10>;
 };
+
+/* Provide required regulator supplies for qfprom and PCIe controllers */
+&qfprom {
+	vcc-supply = <&vreg_l1c_1p8>;
+};
+
+&pcie0 {
+	vdda-supply = <&vreg_l1c_1p8>;
+	vddpe-3v3-supply = <&vreg_bob_3p296>;
+};
+
+&pcie1 {
+	vdda-supply = <&vreg_l1c_1p8>;
+	vddpe-3v3-supply = <&vreg_bob_3p296>;
+};
+
+/* Disable EUD as it conflicts with USB operation */
+&eud {
+	status = "disabled";
+};
-- 
2.53.0

