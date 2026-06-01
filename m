Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90F72E0901
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355766; cv=none; b=pIdmFhCyENo6qL+49EYW/eOU6CNkRnHKZMi+CNK7s8/DDAIOyCOHlXKXcGA9eo2YGTloVFnenpaBOGtNLaaS2VXTM+SE11lkKCUVrlNjZwy8UxPwPdHZHUDh1VeBrwMiu6EmUD+i01Pgt4nuu4IDhaNwupzBJxdBaVv6Zq9ilVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355766; c=relaxed/simple;
	bh=qVUeQWS/7OtGofvve8QyxJxwmCBOhgxcSSPO4Frh6Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sa1sqRaRGGbNT7tYOu2E3W3GLhb1wP5QZJnGBI6TIWYei8fhyOLuEuxvGqMsXZQaNgKpqmUiPmGvOZGQRNTkoD4FTfd+uP85OHq/vY8itWRhOoteaEMoyQ+e34J9stj79E4G1X+x8i/LEHF2fglXhSLat/nXo5e8rDzL521SV6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXlGpQhx; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXlGpQhx"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf20f6be6bso20867245ad.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 16:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780355765; x=1780960565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ozxx9tq3sAfLk06YmZpKiSWd0rtmuUYU/mrvthF8nNs=;
        b=hXlGpQhxNQdWiCaI8N1fRglEohxieF4dhummgfPtcbcUTQ6dxhjCz2aPb9W5D0FjyU
         vGB7yWsvlNZ+Jirq6I8huFjHrYBWJTU2X1zkt+koK8WWVpDBdvkozcKz0xUQ1pr/tt8C
         MvwZR8xwkmKxNDHmSwVQ9T5DZ+CtG/lojl0N6BxKa4YEW0Aqxt2zc75ULVkR9DdMgQXH
         BBqloJ4F3/nn7x1nCOcTgmI+ppn/zA+SS3Ssb/AHi1Iz3S3EqQK6qnr6FNySKCAZN50n
         96xGIlxSRveE1oGimfVI5ikF7RmLk1ltUf6rX4lmtiKrtQP+63U0DTJvWN/CKEl4V1Nt
         dDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780355765; x=1780960565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ozxx9tq3sAfLk06YmZpKiSWd0rtmuUYU/mrvthF8nNs=;
        b=IPXlCJysAQcbB8GHMiOjZkK6QlznDPSjgLdoRw74DY1eHIVK++w7xQLZyf22GqL5wF
         Yl99eATQKYz6Ggop/raJ/iQUzfB5nnSgMcuQ0roRPrRqNagltBpD/bXzste5wj1Z8Ghp
         nvuWphDltT5bBqszt802KThI0mdB5CWRltG4RhaCmCmAPFaUGVTGEYNrBv9nWv5JwjWt
         t/uSTUXQj/ogZRgkrhCyYsdKmGi2DSYwYxprRhy+yM8c1LP9yauN++sF4DCl3EhGg2s4
         hm5mwYXA3jvxDQpMc08Y8kjJ7NZ4iHr2xxh+ATm0ML5PQ2fEU+1xuLmytYHpyk3yidzf
         E3jA==
X-Forwarded-Encrypted: i=1; AFNElJ+faY6Rq9qbhDl+mnKhc0iDPGm0J13+J+lH3d4yZF5o0i9f6ogiierD60hbWaGZhoKrOh4aJBOA7D2/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2J0H2TksVbIqHdwYIb54KhVk29D1LLXsCY6ZWZwBZWgZYyYER
	EwvrTgtmJ2PKFIocbQjpF7/Uy6+CJTd5SqwnW+7aH/z6/QcBFb2e8VyJ
X-Gm-Gg: Acq92OFmU/GOzf3pHxmRIS1D94eYj4IOc371JvSQYi/cb1TtQKPLlm9J34zZ76JHFuV
	FAdXxqFkI9IzsfVuhNSVUFwLyRmgqua42VGyGS6nKvoIRQVsSkKiTCuHUURcMN3MFnuUgPj/fGv
	jV2nyBW0DBoUiDtXBovSm0eMzksO3RsRNnlK9ww9Zx6hDX3kJ8oh1AqikDMaq/0zcCMjDmmv/pb
	QPkaB4OoyEReN34w4Rcl3YWX/RbYXOYhc4dQ8IaeCeZ+3GNmrXp1VSkRvgxVTMIfJG6jETA/tUz
	EXri4lEVbgd+/3OQM/Bk+sBz+/XK3XueDOybNiY6D16Ooh0w40zegWLnN56C15+lDoKG/eGg0MR
	VhkjAbhgKMV1B4N5JJ9FWxKnA0hj0px0NDQr0CfIUooVdSbu1Y4ssFhl1tAdK2YUSUTuUO9TnUi
	NY88wUjDpNBPtOu2pWDz0a4irtsyNLE/uWe56pRGXpr1+YZyDMjDAFET8lfPLZMUBA+B6COK+bP
	inc1kcwMsR0CxUmLj0t
X-Received: by 2002:a17:903:1b68:b0:2c0:bcff:e18c with SMTP id d9443c01a7336-2c0bcffe26dmr93746255ad.37.1780355764824;
        Mon, 01 Jun 2026 16:16:04 -0700 (PDT)
Received: from tomriddle.canterbury.ac.nz ([202.36.179.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm143815355ad.20.2026.06.01.16.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 16:16:04 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>,
	Oliver White <oliverjwhite07@gmail.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-microsoft-romulus: add phy-reinit-on-resume
Date: Tue,  2 Jun 2026 11:12:36 +1200
Message-ID: <20260601231236.20402-4-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601231236.20402-1-oliverjwhite07@gmail.com>
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Surface Laptop 7 gates the USB2 PHY power domain during deep sleep, causing the PHY register state to be lost. When the DWC3 multi-port controller resumes via the fast path (device_may_wakeup), the PHY is not re-initialized and USB2 devices (such as the wired keyboard on the USB-A port) may exhibit corrupted signalling, e.g. stuck modifier key reports.

Enable the 'snps,reinit-phy-on-resume' quirk to force a full PHY re-initialization cycle on resume.
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 4356cb88e2bd..2de244ffb54d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1731,6 +1731,10 @@ &usb_mp {
 	status = "okay";
 };
 
+&usb_mp_dwc3 {
+	snps,reinit-phy-on-resume;
+};
+
 &usb_mp_hsphy0 {
 	vdd-supply = <&vreg_l2e>;
 	vdda12-supply = <&vreg_l2j>;
-- 
2.53.0

