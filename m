Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092CC3939B1
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 17:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259551; cv=none; b=dRc803Ot8uOku72JpHXxdCOVVgVCEgdr0XIpHK75mQMrl2w5YxeuiI9xuXjKqLL7gIbkq+cEQwP2vubkU7GSDZSDz2bvtX4s3Dv0H73lmA/9suflqHBkuVQ5cdyyQrCj+Ks0HSTEYKJnsomkmCNfiH2PzOtChpTiNZsdMUY97j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259551; c=relaxed/simple;
	bh=RvyyXJVT6NTkKHJtv9luXFIdJPR6X9pRfsnAcFViff0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XSm5QvscPJcb3xsLx9/8bxhUnkhhsR1A7fNc555lTpYnHoVs4hNPqXI7HrjeeprRG+RYHa03VVVFhmBgQ4zyWFaFbWbxWsdLDO3Qge5BYtOxf1wnDDm6XRHUDtCEJEwtqj8CVMrmpC1GBr8pm4c1BrvzELOpNOGKKaNhJq6oBZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=es647pKA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="es647pKA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so625737f8f.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 10:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792259548; x=1792864348; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KCsJp0MHB9uPiSNtf+Qp5XQzhNWphBRW5nGkjAoSi2s=;
        b=es647pKARD2ocvS6U9LSOg5V6B6SYPDghpGj98XZn07GcNR7F6STCiW55K9GAjYibH
         bBOSUwOcaz8G8GOQXmJgEN2ElYB68TP+MY9chZPoZsiNF25toKw6u28cXDhetLb5Tp5/
         kdSqW+4OKxfwdsKSeEv80+7XtAr58Siui581Rjbd4cp+1+1/OTmj0naK5VO+SQhDfqV+
         inlGHgAHHj34AT6LdjT1iJRKQhds8t6XV9LvwWvxMh6+5kPTevznK4r7ipfir6KmRGbE
         uDQXqCQWldGRhBLfbrzpeVPdKQ1BRztjC/DqWmcAXS26x8/eThKdI+lmIUWxfgZcXzTV
         zoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259548; x=1792864348;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KCsJp0MHB9uPiSNtf+Qp5XQzhNWphBRW5nGkjAoSi2s=;
        b=VPcN9u4UEG0qd9MIJwkdYlMXSfSyR5UA1lcMgOTcHDLTPGSrLC52MUftI4efZ7Ny0E
         bZY6/k9wpVv8P/iAyPFgJW0DMacMY/QYpaPNsfWUqGtUwdWLigJZDGZNODqAD0ECETiR
         01kH4zYwg5VdxBLFJ2WO5jaPbovF4QJI3/9rIqdHyinC5LxIcLr02EEbRvAr3MJH89zv
         Y/1kLsRud4UTv2N2tYUWI/LYCG3X7+8Qvu/N90tKnNUpBqZaPUdosA4Nqcp5dp/y7plR
         GDCXCZD9cXqqgWBQxU1bXt/imMw9rSEhtZl6mIG8xsqJHnRyZ4E2g0fvJEgqX3eVWFB2
         IRow==
X-Forwarded-Encrypted: i=1; AKwUvBxW8uEd2weVXi1CkZ+oAGPntHKF+v7CF0zMy8bWdFu7T+948CrktovJsPzdWibJ9vEz52916mrOpQAx@vger.kernel.org
X-Gm-Message-State: AFq9FYJp/UVGhqhRozEVlJnR1QMv2HWUXU4wS3nWiXr+Iv6Gac/TeCMT
	a17lLigJnHKJaCIlNbE63JD6bGpGlLk94NtyNuCULdHulPecVKDdaHaF
X-Gm-Gg: AYBFou3aWJO3oiCWLAtmag2SOlc5y17zy9jSrkL0Q4TicBEcTEjRiHUvOCkELUU/s/b
	kBW3rwKP+xQXwlD5JauQv9x0+R4WQYY4ipaWGjArIqqeHrHu9Quuk2w4/aaYidR+KbxmDgAqKjQ
	X400rYdltk3xomKZQenXvjN1bDRBVn+GmxjyexKrgD6ndm/k23IqCJN/IhIYEz9TngfTdUBA8R7
	b9hWxNZTf2dUgmfKF+2+8ebkaus+QrvYCjykmiZEcIP5Cg6W5Qtp1J37vL3vL4E2Vv/MBugnbFF
	kfqgaGkg21PYTIxXbEmK/8xM2tEQbwnP8e84LdQ+F7VqNBKQxU56ep2VVJo12PBgf/F/rpPw//c
	/MqPzhOiwlLLqGCn/a1r4Tsp4nxdn8DJS+xSbo+KSyZurkxdugBHjKY7bv64f3pPE7v78gFtUPy
	naVBq4lzFpY2imyMI4tbcpAU6eLFcHZVJdBgXbO6H+AeP2TIOvZipQyIIfZ4rbyxg56Aoz5DTvh
	0Bcg1B997Mw4RknPRu2OY75DcF+TA==
X-Received: by 2002:a05:6000:4a0c:b0:48d:db77:d119 with SMTP id ffacd0b85a97d-48e07975a78mr6303403f8f.2.1792259547901;
        Sat, 17 Oct 2026 10:52:27 -0700 (PDT)
Received: from [192.168.1.3] ([148.252.146.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm18263626f8f.16.2026.10.17.10.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:52:27 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Subject: [PATCH 0/2] Backlight fixes for X1-based Surface Pro 11
Date: Sat, 17 Oct 2026 18:52:24 +0100
Message-Id: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAyF4atI1g2YkYnQq4gLHaNGxMqkiiDe3
 bFdfjz+d4JJVDF4ZydE2dX0syTQK4MwNssgqF0yuNwx5VSirUQ4hw57PcTQN46ZC/aeCVK0Rvk
 Nqanqv21rJwnf5wWu6wbo9k6pcgAAAA==
X-Change-ID: 20261017-sp11-lcd-fixes-5a2666365561
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Haipeng Lin <jimmie.lin@gmail.com>, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792259546; l=1468;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=RvyyXJVT6NTkKHJtv9luXFIdJPR6X9pRfsnAcFViff0=;
 b=Lf+tmZ/tKY+2VhA4g7bV2nLyZfEMVHO/BXOXlCEPoZzWEJp5RaWPdCOobZeVPmlmkzDNwQer8
 TKhCn7sZHIUCWWxUlSDF5xvn1/oJZY/vR8SFJ85S60vcqFdGGkiR8Rl
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

The LCD variant of the Surface Pro 11 has had no working backlight
control since the device was added. Its DT took the panel description
from the OLED model, where pmc8380_3 gpio4 is the panel enable line.
On the LCD model, gpio4 enables the backlight instead, and brightness
is a PWM output from the PMK8550 LPG on gpio5. The supply is enabled
by pmc8380_3 gpio10. This is the same arrangement as the ThinkPad T14s
LCD and the Surface Laptop 7.

Patch 1 describes the eDP HPD pinmux (gpio119 -> edp0_hot), which the
Windows ACPI configures for both panel variants. At the moment we rely
on UEFI to set it up.

Patch 2 moves the OLED-specific panel enable and compatible out of the
common dtsi, and adds a pwm-backlight node for the LCD variant.

Tested on the OLED variant by myself and on the LCD variant by Haipeng
Lin.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
Dale Whinham (2):
      arm64: dts: qcom: x1-denali: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1-denali: Add PWM backlight for LCD

 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  8 ++--
 .../dts/qcom/x1e80100-microsoft-denali-oled.dts    |  4 ++
 .../boot/dts/qcom/x1p64100-microsoft-denali.dts    | 47 ++++++++++++++++++++++
 3 files changed, 54 insertions(+), 5 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261017-sp11-lcd-fixes-5a2666365561

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

