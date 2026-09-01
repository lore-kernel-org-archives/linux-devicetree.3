Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41D43AF65A
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226623; cv=none; b=JwY/j81AL52oV4uESBBfNvzBcxAPgwW1vcTtVxyV73FBP24swkDNnsWRbZeZFFBKcqDfM0Y1eUgLodNZQNAHczji0d/CxrFYItuXs/8n4K+t5EnOo1WZwCRf3abSl8gVcwpcfW9NBxb7e+EXeoDuONm8QDAfOo1dFsMsbCn6K44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226623; c=relaxed/simple;
	bh=A3ITwJ3sR+qec2WwQGQ5KPp1IsFncmE7QnQCzTPVg14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dpU9CZ/wRBUcpCzkHFrKaWAwDhzIe3oAS7STHrBhtt7/4m1obIl3lPnpY5MXoFTolptYAWy1ZRsRDvzy3ov7ZyX+86xEFbRgTK0AN8IYYnAbn4KfjH14HpNoxLKc45Fqbl6yWm+mEaQZC6lfZC3qToY9F2pCAlECiXYEs8pxN50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=alk1BL3k; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="alk1BL3k"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9391e3b21fbso244474085a.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788226619; x=1788831419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4YT7BT93vHyyYCSd9nX5alb6pkdBUuB5YMQu5Bqr7w=;
        b=alk1BL3kjlHyFTFO4J2mUUNDV/1XhjZOcXccJSBnUytM/uZppsPZHUAS0Ayi62OKi4
         F3XsJQe8SN3c/DKPtTFkmPbLNlDj4mgteLmMXy58e8ho48FUc36NxohHL7mXyRMrxoxx
         HSZc/pNYytWQ/ZmJvkD+j80izU6VWuWvpgYcffL7TpF+HyshbTdG8zQ0QuQBgRGYd3eV
         4+SE0PlafZ693c44s7h7u2FEHrtSFSEPM98PxBS0R8JySATOAT6xLwlVrbJ/UDPoYUYV
         wUKTtuRufbUupw8Li98SRrwbkL5syh0Y4EKQo8rEuLrkBQRSWUBUZA3Un2xHzU7WdlVF
         hLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226619; x=1788831419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4YT7BT93vHyyYCSd9nX5alb6pkdBUuB5YMQu5Bqr7w=;
        b=k94QBL2cSta0AIA903UNJpiJ/EHDuwlHs20XHi7UslXJD9MlCYDBmJS7l0F2sqQpoL
         +3rvWXKEU3y4F7d/hA1Dxwks+mAXvJZVwbQ45gWrC2IUVFFasfWb7fNXn0l5RzuCn+XM
         ghnJj3LKZb+45SGqC+vBpgKubAXP5UYiLPgQV1tjxsWBl3fLN7IFtMfAYH1Zgrzc74HX
         DKu6/6Fvxml0vEgyv+0MRMuzFuOAgl0P1AyzQ/dV4rT1mfxQst+E4chDUqQ0TMoKdBIa
         rGXN54HqRkRkw/sZaPf9i1m1w5mojJF0IJb/UwJqGZuXMMROU29zZXbK4PaGJdR/gWCA
         XwLg==
X-Forwarded-Encrypted: i=1; AHgh+RoyKaM9jkPtfj7X5/1yVZqsVEm5t4neVs6FoYHwvsvO+XaYIozYMUGiIV7Yx5h6VIZVMCyiVwpCPJEu@vger.kernel.org
X-Gm-Message-State: AFuF++nERues9sF62zGl+8LNTYTseFtYPwYXSQb2AseIx3n+MDattb4w
	E1qo7uhfAXUsy/C9BXKltIuSoRtdtwVNZG+eMhCeEynq+03VN8cOfDJtHpnEqJfdCVk=
X-Gm-Gg: AR+sD13fJVBfYztKNcqnElM87Qmc7a8gpjR3hq6tkT9AsEcmy4Uzyo78FH9VZ/NiSwe
	L9UwTxSoYG5uiKdl+P8aF+2BmYLttjmYrpMom9BLUP3uFjyzTRdiIvkMuDkAs/9q3nUpXxxXP/T
	Q9U0/CCX58kwsDFvKLdzFSrahc0P6O8FrmzFZHY9nl8RAjmLr5TIC9u5ekum1/2OD9sVpvwm9Os
	8oZ/Fh9QSoN4T4Qf9EkYL3ymN42f3Y4jaYSy7GjP76stsjF3/K1uB/RQ8BKcBtjc2AqUlSbDW3c
	88fXbEKQ0XUGzMnbqEeQfDDrxiozFdYHEvik3P08LDSNb1lvkMV5cRN4zlBRAshAADVYNF0NTTR
	KwzP3w5s1y5KJvBzSzf0PoEZiNSdSMzVCZHt/+Ipp3Tv35iEQ38ilsbSvPXcJueKAAbd3BqvLEw
	U8/Y/aUAFm2hPq1dm0njlgFrnMwN+nqaVp9EsOi16d8rlRI0/SFA43xlDNyeTZbLNl/g==
X-Received: by 2002:a05:620a:f04:b0:92e:6a33:7118 with SMTP id af79cd13be357-939138df202mr3269359785a.30.1788226618911;
        Mon, 31 Aug 2026 18:36:58 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391703a918sm919265485a.12.2026.08.31.18.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:36:58 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mani@kernel.org,
	krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	jsandom@axon.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] arm64: dts: qcom: clean up PCI function nodes
Date: Mon, 31 Aug 2026 20:36:47 -0500
Message-ID: <20260901013654.1343537-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on upstream support for the Toshiba TC9564 SoC I
learned that its PCIe endpoint function nodes included the
device_type property, indicating each is a "pci" device.  Herve
Codina pointed out that this is not correct; only a PCI device
"that implements a PCI bus" should define that property.

I looked at other upstream devicetree files and I found four other
places with this same mistake.  (All are for Qualcomm platforms,
and all are for platforms using a TC956x SoC.)

This series removes the device_type property where it is defined
for a PCI endpoint function.

It also removes the #address-cells, #size-cells, and ranges
properties in these cases, with a plan to restore them only when
they are known to be needed (to implement pci-ep-bus sub-nodes).

					-Alex

Between version 1 and version 2:
- Added Reviewed-by from Mani and Konrad
- Added a patch that updates "qcs8550-rb5gen2.dts" as well

Version 1 is available here:
  https://lore.kernel.org/lkml/20260807195846.456079-1-elder@riscstar.com/

Alex Elder (6):
  arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI function nodes
  arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI
    function nodes
  arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function
    nodes
  arm64: dts: qcom: monaco-evk-ifp-mezzanine: clean up PCI function
    nodes
  arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI
    function nodes
  arm64: dts: qcom: qcs8550-rb5gen2: clean up PCI function nodes

 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso  |  8 --------
 .../boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso  |  8 --------
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso    | 16 ----------------
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts     |  8 --------
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts    |  8 --------
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts     |  8 --------
 6 files changed, 56 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

