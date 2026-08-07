Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C11367B7B
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 19:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132732; cv=none; b=UYv9OPahO24uuE0ZiITv492aZilc9Bq/Rw1YrY1X4hP0Lxc86Lg8swYwdLZxrtRhXb4P8BbF9bclnVbfb9GDynXSnpppLd33MguAc2z9T3wGNulLJv2WuOQCl10viqsw0CdEi0a+Md2MGj0OFHGC+LPSKPcLFL1zKurGxtSrJ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132732; c=relaxed/simple;
	bh=4S/lt/HkO1931UfN2Kg4poTFG5L0GtVxFxROTKf6rhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uXjFdD9NPyz+zBTJsnUCFR6Q3pJwk+A+bh2o1xPiXyYuWw3sIsfMV5AerBVnwV+knENlzQpl+EbsklIkNQJEhP/wU6DRvumXnWHR42yeP7ZVtKlLgkstBiqglFW0GY4QEHHZDGbmg+xrBkj2kFUOUpQFaOGxrXjabyjneiDPjJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=fIDoXQwI; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="fIDoXQwI"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c0ecfaee7so24251471cf.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 12:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786132729; x=1786737529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fLAj0swShmZIf0hJThyPujxzQ99VpzSptgNAwh7h5VE=;
        b=fIDoXQwIHe6LgIV5IqxtBwP57TgeFvBnCIBAg0wvO5Dr1/gxkMFqw7vz7WwbKArTPm
         7txvhlQtTb+YlhOALEe7842rACim12Oy0gluPMPVWrEbYhyz+ufPo4F5IN2bQmK/SGSq
         vCwLfeufvZl9mCbpPsI3pDTdyKkaDsfmLckbPwemCKNFRc/+7QIOaLdPxCifypf6Xdmp
         qoALrzWphOOgDYyiKJD+FemoFBmnYtSGKTKq06pydO0F41lunzbQXLxehz+UIAhJ4gMB
         wfI4u9nP9GzyIkQnDVo2hu165J6pcd/IQ6JOJo3pzJTbzRRY7YjCpM+Wbmknwqgq/LNH
         MEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132729; x=1786737529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLAj0swShmZIf0hJThyPujxzQ99VpzSptgNAwh7h5VE=;
        b=H2gVSb/FrHbtAYC2jWTxBa17/K1W5Fg2gZ/2X60ztJtgBf8+2MluSqouHF80udtmHr
         QBULUtoV7H0ZoNbUQw80IMR/VNyXTw4BjNaJC+HL1kE3nVaYOXuT0QZVRZh0q2c7cva3
         boWZO8ws/dZgEC4RNMB5FXiCpfKCGfwgOOpB7l63I59v/Vsqoxk5cKNS6fwWJzfV+q5W
         QvuM3dQJioMxBFYQLNaQ4u63yBY59ca9YoMvCfoK5rYHeOsRpcxUvg0JCOv45Te3FTY1
         ZhFDmIo+xtL57jpGhdwkeFYWKhjNBPaR0FnGtiPAgT2yCi+0nKA4JC8bXbfwv4Sd66Uc
         bz9Q==
X-Forwarded-Encrypted: i=1; AHgh+RojQ2jc4hcnrvS66L8JUuNlFsYCiFCXoaOFtB1kz5xClZ31DcQlYY6Xx3rsgtt+SaogycPLqlRMuvPE@vger.kernel.org
X-Gm-Message-State: AOJu0YzDFby7mzJqhbYTmrzWhKMwuW82dgos8S/sRCfgSGJg749Jo77J
	zh8t+tiRNJaWIUELnpYeYhxTwS7mBIKN6aCgHhGlEmn353GeWh14D1YVFYrQFTy/bc0=
X-Gm-Gg: AR+sD13IRURU1GbPY254f6K3c6cEl345e/Dadd8/vXr8K+yJ9HxhOYlNOMM4sBcE4ic
	mDXApq3Oc3+G0ODeVt6zo5H8TOrXsy1LzQquDOCDySw5csB5Mf4aMUXUFgD9+LhG3+2WLzn7K31
	CeD+4OCwO9GxXXFg6Z+bBGZeBWd4u4GYgeeYsH1lMgKEiJMf40kbSEHvWHddQ5f51ZJddi3gM6g
	mwy3vV8wlbOvbc6Y7dX5prKB1pEc6gc+ckKwUDMmBd/LT89H2feEzD5czBd+fDxWbMnBkbaV4FL
	l8P+aBohSE+Nh9lE0EdQEo4FjLJBniBHlrTtfTgebjTVF7srbXftCdIvqcqlh0AZUoOdlUYg+VX
	5uKw4f51RibrWKk/vtP5roj1VOz7w5b7FUHWHUko3BzoDUkvd7sJocjTOSFduB+UeaWy53+ElSM
	if7dIVQnb+QX+bryDpq27ELMMf0C0+eRk1DkIeKtGLgu0xe4jrY/S/AbpqRlLYob14j2uBqjer6
	N8=
X-Received: by 2002:a05:622a:428c:b0:51c:9193:fd9e with SMTP id d75a77b69052e-52ce5ff10e7mr301001841cf.15.1786132729475;
        Fri, 07 Aug 2026 12:58:49 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff366sm15824226d6.32.2026.08.07.12.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 12:58:49 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	mani@kernel.org,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: qcom: clean up PCI function nodes
Date: Fri,  7 Aug 2026 14:58:39 -0500
Message-ID: <20260807195846.456079-1-elder@riscstar.com>
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

Alex Elder (5):
  arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI function nodes
  arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: clean up PCI
    function nodes
  arm64: dts: qcom: lemans-evk-ifp-mezzanine: clean up PCI function
    nodes
  arm64: dts: qcom: monaco-evk: clean up PCI function nodes
  arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI
    function nodes

 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso  |  8 --------
 .../boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso  |  8 --------
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso    | 16 ----------------
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts     |  8 --------
 .../qcom/qcs6490-thundercomm-minipc-g1iot.dts    |  8 --------
 5 files changed, 48 deletions(-)


base-commit: 064935ef6be39d086f4c40766d2b76181b70b3e1
-- 
2.53.0

