Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0A82D3220
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355735; cv=none; b=nxL5Y5Y5yWPI4ZW1y/oMQ/5AUz7HHzeDbv6uRLWOMIT386meDYBsUJp91dFyxa4TTVgoQJfVzyllq5mxRAFYL/7hLqehW+FIdJ5j6dfTGD7yinHTXXd8v7pNLAszjd7f4GpmfYeyxt2+TdMQn9yumT1d3Sgeie2+zptPzSdgqHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355735; c=relaxed/simple;
	bh=5C0NvkvoNVW1GzuiitG2zF83G0Py8AToQX3X0I6RQCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QOVGiDHKx7CJvaKwurPR6iiqBOxRyWxsNZ3oiRy+EoIH6q8OwGsFjVAYtzdCKqN0eIcsp8OBB2URMNNjdXdl7B4fLXz8VYeFDlvj8T0vLfHkoz1JWrDmtpXq4MWs5QFNs0hrLwiFlL/RsjopDbSOJxjAs+nYl3sotijlnIOD5Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+ljZqSw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+ljZqSw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c3543590so12546565ad.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 16:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780355732; x=1780960532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Qss5GDiUGvvZMzZ4WxtI6WP7Gai0GoYtE3oLWnkhZc=;
        b=Y+ljZqSw9sDHUZce/xTH9q9LSh3fNE4l3hvu0SZbMWkj6Q46tZTsYGIu39OBw82Gmk
         XJt24n2rhpyEDWIGsIbQ3XPe/lOD24AheQlZTQSMXs2pFAnh9oS6NclNY1KxMubXuokf
         FLCNLSlCEGLVSQr7S59ClOUtQt6L5tktWaFwkAlC4SG25c8hL3NzGCxu6mDGPskpuAVP
         GS85Z1RwBFENN3iGMVN+iQTsd2I6rFhsoBBlUD1d80S9Sj0TiGxvOPa7rka+KmnK7sTz
         alWD7mtZPMqJsxEtbmy01odXnjRlQIU+98ZHCcFnDsWWiU2aSHEbeqRB7MafZCbK69zY
         zM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780355732; x=1780960532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Qss5GDiUGvvZMzZ4WxtI6WP7Gai0GoYtE3oLWnkhZc=;
        b=Q8QTntB7gHyuXWLP1iwGGi/MmBFT7VhEh/Ei/cdQsvJ+c4hZ7K0ezfdUUTOm9PvSd+
         32nqdw3Fv0PVb3pDannbxozmKURwW/cl2WFeZo5iJwtTPAwBLKnPHIGrpi+XLoYMqpVN
         L3cFXM3jlO41X2vyn/qzSnbd4pumDM5KTn1TQFZia58imrRvx9sSXcrcvZxs28Q2YAMv
         sPxi+L/z1N27H0xTlBC2Dx5cMqWBdC/n+sFl9DHiWSXxfctG+IIsqqS+yG/3z1Qahl2t
         nOB/bIdN/XoSwxkVguVIfO3Xz6yDsX5YzHebuakrq/qu1ctRSE7IEe4pLMZY6a73yxVQ
         SWtw==
X-Forwarded-Encrypted: i=1; AFNElJ/y5qdh5EbjmYrAuPGcXU+aRjLYQRH6dxnXGBuzfAo5XNeUkROGOVDlVlcwXjKaDflU7XJEUBU10frs@vger.kernel.org
X-Gm-Message-State: AOJu0YwmVteddpDP5wf+rAWDtfacgJ2DYTHKHSB+Mjj1maYh5f+djj41
	BaEdmoUWBjPm8rCrJXgiwk+vyq/3mVW55SKe5ida7RSy8Z0H7XysZQmH
X-Gm-Gg: Acq92OHmEBuzlAxPE5NAhYZKE9hRYGyQo/d+L379gLVFOk+JdLmonV9JjswNpOCyUd5
	IC75p371KV3552h+fbV2jE9T15K/ZmUHH/VqeRTvn8xtAm+aCVwFbIJBYXVqXBeIOc1cyAxcub+
	UHiFg9rQ4Fc/R60g1bzCzuF+997Ve7e6/Jmgq3sGzT5yOUQrJ/sd/zuHzkltY7Ai5tLWss/Arou
	ZQ1Fk4z6EoCommzbOT2omf1ETJnAU9ao5ZAqlObwW30fjPw22yJIclOz0cf8dlI7+gM1xF6+L0q
	zRa9AZVl5UmBy6m/Bi/fzBtPx8/bESWmoh/vZVyu9fBA0e815YnUD/eGnixadM/5MXG4bqzkxdN
	+LhIIhhfpr+5yQeKEmvdBXJa/fD0zZEKeaw2LqS1VsSokdKnYRC1ZXRwZ02ImohAv9mOMvY+HOd
	MaaEV00LQo/eKb87COHQcsZjg7P2OlkTpea3DSKUFubkCzBOTnz7VGSF1GRfEOHvVXqv/gYlS0+
	YRVzlKK5+FIPn5tcwqq
X-Received: by 2002:a17:902:e88c:b0:2bd:9803:9308 with SMTP id d9443c01a7336-2bf36878d37mr136499995ad.36.1780355732165;
        Mon, 01 Jun 2026 16:15:32 -0700 (PDT)
Received: from tomriddle.canterbury.ac.nz ([202.36.179.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm143815355ad.20.2026.06.01.16.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 16:15:31 -0700 (PDT)
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
Subject: [PATCH 0/3] usb: dwc3: add snps,reinit-phy-on-resume quirk for USB2 PHY power loss during S3
Date: Tue,  2 Jun 2026 11:12:33 +1200
Message-ID: <20260601231236.20402-1-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Surface Laptop 7 (x1e80100-romulus) gates the USB2 PHY power domain
during S3 even when device_may_wakeup is set, causing PHY register
state to be lost. The DWC3 fast-resume path calls
phy_pm_runtime_get_sync() to restore the PHY, but this is a no-op for
PHY drivers that do not implement runtime PM (e.g. the Qualcomm eUSB2
driver), resulting in corrupted USB2 signalling on resume.

This series adds a new DT quirk flag that forces a full phy_exit() +
phy_init() cycle on each USB2 PHY during system resume, and enables it
for the Romulus board.

Patch 1 documents the new dt-binding property.
Patch 2 implements the quirk in the DWC3 core driver.
Patch 3 enables the quirk on x1e80100-microsoft-romulus.

Oliver White (3):
  dt-bindings: usb: dwc3: document snps,reinit-phy-on-resume
  usb: dwc3: add reinit-phy-on-resume quirk
  arm64: dts: qcom: x1e80100-microsoft-romulus: add phy-reinit-on-resume

 .../bindings/usb/snps,dwc3-common.yaml        | 10 ++++++++
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  |  4 +++
 drivers/usb/dwc3/core.c                       | 25 +++++++++++++++++++
 drivers/usb/dwc3/core.h                       |  1 +
 4 files changed, 40 insertions(+)

-- 
2.53.0

