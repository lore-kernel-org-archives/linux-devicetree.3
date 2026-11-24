Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539188;
	b=CaN2srHq8afEliPChpHvQ9ZmpICPQ3xTXpLNcWDbdSx1mIT/XBZ1gJxtEsJ9dOJXj71T
	 QPLewCSCtW8fvTlyVZ905QbJV4wzrbDFaX+URI6qJKjUi6caTgGfvItw0nfCk22Xzz5ew
	 8YMsp2VX1LXrBBMam+2rfbtiE+0RQZTiHFiRaIAsgaQZzZvLfx8jBatBaTOntFKK/7j4a
	 t3pHMxU52qUCieocnM7y5hv0oQNkP7qrjL43IFBBWWUtrXfGd7758TFXNgequs8AeDG0f
	 7MvFGHM91gAwXQZyqVi+hJn90NQPSzM7JauglBCjl2g9ngaLjF/SuxToIbAnd+Fnl6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539188;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=kem9mVlEwtXFG8dJC6ZDH8KZIVi+tfpwVsWHY4dYU4Y=;
	b=IOCQFMTiQlUpMH3WtwR+BqPEyrmpSiJ669SbglkC73CMefr9DmPvxaUwEJ1qdz3iRSYt
	 EGj5YWj5WBqlyfS+0vO0k8OgZ39mjqsF4l1e+R7XuCxKDICKFa6EjJjUoncCfgyigfqJ0
	 RSeyAdR9s63bZIyPbYVHWCXYKGiH0hrDhWEMcmnluM0g5lkdKNGGJHErXGNOtdXFg9zvB
	 mO2v556PGtJveKgsbrEVrd4ajN0UJ5TtHFo1XX/Ve1QOGPuGEcO6hV2UFxgMr9DL2vtdD
	 xeErTbKNd44HcWh0gPM5S8ePOAlTQOAI0PmszUy+szKlYU8qWscVv8FrIv1CkoPZeGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=cs+hByjz;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=M9iXtSG9;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DF9606A33A;
	Tue, 24 Nov 2026 16:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5DF9606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=cs+hByjz;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=M9iXtSG9
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1795539160; bh=kem9mVlEwtXFG8dJC6ZDH8K
	ZIVi+tfpwVsWHY4dYU4Y=; b=cs+hByjz4ouWPjDpH3P+fSsqMdkhR/AsOfzbkbxeAMxhOeeqPL
	33tLkEjUTisIOnehNXHExpnJCVBBOeniXJseJVLDu5X0Wj9868o2BwypPFL1G0/tm1FVyQ/lRf0
	cXAH8rJEYX7AZoRC1CbeM9UFUxxP2Atb1q+KjnKm8WEtR2ceErxssyzWi+XDgnp1qmGANcj4PPV
	Pfg33z6OS0nSQ+vyK9wXkYenGDnMBSwNSxQ0xpk5o4A8E+Em0Vz3ppGwb3fZNu5sCcJ6wE4Ku2q
	0+QPx7xVqP1siVeZ7yqbGlhTXAuIpSFnwJ0JJ2NFuzZnEtVinzy8k4LLA8FfUdisT8w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1795539160; bh=kem9mVlEwtXFG8dJC6ZDH8K
	ZIVi+tfpwVsWHY4dYU4Y=; b=M9iXtSG9wC16B7J+yeo8l3G9g54VsTKrzsizPVKYCdRQh31hVs
	VZc+xHQg6aia33Y8OZqDuaivRaMXCHKLeUDw==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH 0/2] qcom: scm: fix cp_adsp_shared vmid and assignment on
 sdm660
Date: Tue, 24 Nov 2026 19:52:36 +0300
Message-Id: <20261124-qcom-adsp-shared-vmid-fixes-v1-0-f1a808dc41a5@mainlining.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDQAxA0V+RrA04o/j6ldLFmIkawUcnrRTEf
 +9Yl4cL9wDlIKzQJgcE3kVlXSJMmgCNbhkYxUeDzWxpjC3wReuMzuuGOrrAHvdZPPbyZcWmo7w
 2VOSVdRAPW+B/iIPH87Z+uonpfS3hPH/R/CB7fwAAAA==
X-Change-ID: 20261124-qcom-adsp-shared-vmid-fixes-9bc381c4372a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795539159; l=817;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=ANgw4V28a6PEMLu1KWKDCJGLgIR7Cm7DXQ01nvGRUr0=;
 b=UJu1LORno6wtk0PsNtNExsuklp6z1jTynsfYymYDK8qHsO5fGL14m928B/ket9lj2kK9loUmK
 Amuov9weULMBqozeHXwo8793O3MzDTQq/j9aSA89WQhYc1924AGvMRX
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

In previous commit adding CP_ADSP_SHARED vmid the mistake has been made
in interpretation of vmid value, downstream sets it in decimal, but 
upstream sets it in hex, so fix this mistake by changing vmid value.
Also fix vmid assignment on sdm660 adsp.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Gianluca Boiano (2):
      dt-bindings: firmware: qcom: scm: fix CP_ADSP_SHARED VMID value
      arm64: dts: qcom: sdm630: fix ADSP FastRPC heap assignment

 arch/arm64/boot/dts/qcom/sdm630.dtsi    | 3 +--
 include/dt-bindings/firmware/qcom,scm.h | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261124-qcom-adsp-shared-vmid-fixes-9bc381c4372a

Best regards,
--  
Nickolay Goppen <setotau@mainlining.org>
