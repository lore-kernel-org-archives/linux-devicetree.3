Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315724266B9
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 13:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555308; cv=none; b=BTHPrFppreXwA0ku3eFXqUqV17Ar8lo/ypFw1emCNuq+w7GVbMFKYJWBfV2NhxNFMnqSv4TlDskO6MW6lt4Uvw7RxEN21H/VJc8WGW1VgXmDdclebLK5Q870WZVoe89UCL8yGMjwnf1n2WbDCKWH+RfeEmBT4swDkBkizI/P0jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555308; c=relaxed/simple;
	bh=NwNLBanCJfWdivsHH3TQq4KhfsrK1t6xAmGPuWJEvUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeeLQX3GiRThHVG6HBR5oOKkRmyOJch/crUOnO0LjObVeUV8UdiItCBsDlGLiJOJrDTR0ufokix1MBGpLfYTofrzynz9pckDR+9dL2C2LWq3gkfGMBLKlLI75UyjYXBv3ZauWxPm+CwMVZW99+VCasGzDhthpNMxuK16tiU5F3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=AdiMxbQt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="AdiMxbQt"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ba840146so7379005e9.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777555305; x=1778160105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KQEi+9Iq6a0oI1284HueD/sDdeYdOgMZIf6VRafu5Y=;
        b=AdiMxbQtTVKPqjedLo5C44dnYcofaKZ3yVblzp8blOAw1nS8+sl7BghLj0ewBuplAN
         prGZkW2NG+hDl/Gus+nfwcVDyAdRL28efdknX/tG6lwXiNFnj53pktdlLL7m84hr8OIP
         BmcS9D/iZ66Pt91s9Q9g7slp2a9s1o+YnYATk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555305; x=1778160105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7KQEi+9Iq6a0oI1284HueD/sDdeYdOgMZIf6VRafu5Y=;
        b=Qh48lutiZA2a+QnpTQMcsjZDaiAMmUAdZ/WvnrWpESC34Ly5g/8nd4yaP3Qv+vqDek
         bulG3XMi4J15Dl9v/t9bQ0eGd0oFOPRSN3SRzvFmJP3eKNHBI4gByO7PCwuzbwR38SDR
         hdLo7tr5FP8vEB7w4TF4ySvYstlBObpYm8QMp/lU+ii0htIlh9Jkb9/LHG+8+fYLKjlK
         DTK0e2mQLWvbptlkFZk93w7t9oEjMdv4PFbYan+LF9Ipuh1BNg/l8diymTodMuNK48pW
         zdJcC9iUJdV8mafIdN6gE6Zctid7HZgqiIPMThew3lCQb9CIQrjP7IsBJGMjbM/nH8CI
         ayag==
X-Forwarded-Encrypted: i=1; AFNElJ8eqIgujOYq2hutL4cRkCXlZ+zAdWvQRr18unAgJBhzQ7OO4toNH484O6L7gQc3xJkZuQ/nuWe0DzEO@vger.kernel.org
X-Gm-Message-State: AOJu0YyrlllcmKbO+6ELybAhPzYOZEmvdwQgj5ruPzJvG3ezkcLH+Znz
	dD9kHGIExfAEdy3O1MxOF+3EWUhyjHAT9EzoH6HOcTuxXj8yA1XttkW85VCTOdpUvvg=
X-Gm-Gg: AeBDievwbBYwtcAXkSGES+0DSUjkRchetj/Hb5h1M4nlbRhbDTttzYiLBwYm8PPzXIE
	UzL6aMfWD0IADC3O04ImhYm8xvrldnBM1T+Bcu+nT1aUI+VEir4EFIBNBxtjPySE0wyv3QNHOwn
	tOkP8QEwfJXLblITHg9pvjJePeoWcMYXjKCibl+T7FvtxH1nJLeLxnenCiW4aE36d1t40tPRZWr
	vWpB1Sprd7AHLllE1bai5s7BNd6SOWuxUn5B+XLErYrqpfqzm72Di2efFTUctBnGbTIGBdEujtg
	dWBAyqQoPfh1KDRz1rjmzYTPW9sh8197z5hOs5AEbsTuxKxqaA5wAowZgH01zzTKrSqWzHiSsvz
	iPP6OtQ7XuVt+S1vqNj6m3vsAXxHKePNU3nQamWUDUmA+tNXEpRGCMRIzyJdxNVOstcjDtXzWr3
	4OVZOmfHTacAhxUzWFQEGh1JDlF/ZmLMOdqhx90bAgnHO8b+TzSFvGc7Syi6EnWmazFMw=
X-Received: by 2002:a05:600c:8b04:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-48a8445fc28mr51917765e9.26.1777555305440;
        Thu, 30 Apr 2026 06:21:45 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm106210325e9.13.2026.04.30.06.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:21:44 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	m.facchin@arduino.cc,
	dmitry.baryshkov@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 1/3] arm64: qcom: agatti: Add dai@3
Date: Thu, 30 Apr 2026 15:21:38 +0200
Message-ID: <20260430132140.30369-2-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Riccardo Mereu <r.mereu@arduino.cc>

This will be used for audio over USB-C in Arduino UNO Q board.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8a7337239b1e..01e98ef52271 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2275,6 +2275,10 @@ dai@1 {
 							dai@2 {
 								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 							};
+
+							dai@3 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
+							};
 						};
 					};
 
-- 
2.53.0

