Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3670257452
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217855; cv=none; b=f4eq62YaJNimAKJsAz+0bkW9S9SQfB9S+ga4uRAnva8v3tFene4vkpX9WbSByx0S/5NA3wdnID2bLxL9fj/eWEjdF7L+QAEfi2hzMaCN1q7GeKZKSwFIU/4NSLODughfQ+usBm4UWYZyUSuWR6pG2WNwVZU/QQxcDqQa0ccuGwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217855; c=relaxed/simple;
	bh=y0Ba2DL0Mm1AYioDzm+l6IeVu5Qc3RCVFN+Tk1snlKg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SWNrVfJCaLQuEpU7eU/0wqHzt3DtFdePniCPcV5Sqhfzw/gYDO2FRYRMVeoZmpvwivP9w1tExIFKznhqY/eLxWPHBL/5LYqdqw3M6uSwmY60xtkLAdA33xnp3ZZIMJ5RdoPrBN+hg6u8gvI3clBpdME0JPCJ7mmiBRuNJ3wNIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uYWO3uu9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uYWO3uu9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so16777205e9.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775217852; x=1775822652; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ll+iZV9FtI82+3K2qodQMK9DQkidaSv7WLnG7gA2vsw=;
        b=uYWO3uu99fVf/MquaAni0L3966Fsu9UK2im6FODXPuNaNy1VDapOA2PKud+4wQAn+9
         HhKxPmyD1r7soVnD988dUHHytQqB39Z+fy+qgtgxir1wmwH2diXjxzQ5pn4TVS12GflO
         jiekTfdp5xLMfeO9B6aM899hQXTymRkE0RIjzQh+L4mHE74IxGmB2PnQPG98hkY+pVY/
         xDbKfedF5OpxKpwrZ2hkULORFl+rTwtZnKh7dc8aFU+NnlY3olmPKBqhLeVhlmwkT8L+
         V4C8LXpuGHQ3DYT/5SfPOsqmpC4XYQX/DvBCngSw71BQ7ANec7zdL/7eKKknHpKFjY56
         DT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217852; x=1775822652;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll+iZV9FtI82+3K2qodQMK9DQkidaSv7WLnG7gA2vsw=;
        b=WYirjq91Sq/3N6kqMKDKZdT7a38pISlxY4qkRYBC3+j6jHev8a7ZxGTSVYCWjOwv7m
         M6LapLmxw7UzjN8tc/achyTblV9MTx/D3hXEbNp6YJDpp0duwQWuzaS+670lw8b6SIaW
         90UN4w4odF9M3z8ZlCbX6FzaulKu3RXbjCLdhbQQzQWDPQlBMrBrIttHv7/ynOOKpH9t
         C7F2qrnZPOCNgvI4ssnYv1NNdLMdC6xT9h2zibK8hncwhPYSZHWDAVVC7pv3EaY9zS7A
         xc9ywqog9scPYImNAiJOij+RmgSe4+UPOcFkBBAv/3CPfJ7QQdk164Wu3I7M2Ar7DuJg
         7plg==
X-Forwarded-Encrypted: i=1; AJvYcCUYS1DwozS2byVz86xLY/4xCTGEyR97Yd3FWhGiWFA+Ghnk8Y7T0Fref1C0wSxVOXI0iHKkoDJsnTpv@vger.kernel.org
X-Gm-Message-State: AOJu0YxPE2/hblL7YM8jCZvvFGBmiOyzKQIfHJgldD56azTkqJBkygSt
	cl55brCbdy7ozjdJ4TLO5s0SQ+O7sJdGYdPWpPJwuRYTvnY3FfsbXojD/vNMllXZwFw=
X-Gm-Gg: ATEYQzwfusxq2NWvNjSEsQMuv2gjBTY9ac7Jipy6ChIT0eLT0NNYNZUdgOfWRiZj+kv
	GHEDYcQqU4xA8vKvsjdIXczyxzJtnNMcZI+QVe4SzdfzgoyL2NUK52kgqLyrvAkwL5vJ7pvVPHn
	iPxgsWDnv42rQTXbUr8IHDv/xiVvtCnJALDl0EjfnREO1OL2qpJ4LBrgvKg+NsTuf3CQv9n3aZ0
	B11GumBmV8/54WynR8wtYvtLHzdjxTloPnq8+ce16u5Sz9hHA8L8gIy1yhD3sve2zyu1rYnxFS/
	oKE5z/7J6ve/MmbDcYSoTTKQjbxupPBi8obeERz8Cyo8eahHb/dXKS35rflFlJxIHD+y4zix1G+
	x4NERrUoImoI71ND7ddJhhTkgGwuaNY/Oq6FRfDU1MuFpkhu8SG+0gFPOhr8j9SYetsJZQPtTfj
	rr1iA6eOkdZjkQMF+DAevJGvJMsmuryITdFw==
X-Received: by 2002:a05:600c:4356:b0:488:9ed3:148f with SMTP id 5b1f17b1804b1-4889ed32786mr12200445e9.21.1775217852087;
        Fri, 03 Apr 2026 05:04:12 -0700 (PDT)
Received: from [10.157.142.139] ([41.66.99.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm300193995e9.0.2026.04.03.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:04:11 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Add support for GXCLK for Milos
Date: Fri, 03 Apr 2026 14:03:45 +0200
Message-Id: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6CMBBFr0Jmbc1QFJCV9zAsCgwwEVpsK8EQ7
 m6Ftcs3yXt/VnBkmRwU0QqWZnZsdAB5iqDule5IcBMYJMoUE0zFyINxolvq4Vn7QeQqTzLZpCo
 mhCBNllpe9uCjPNjS6x26/jhCpRyJ2owj+yLStHixty8o4Sf07Lyxn/2hOd6Nf9tzLFAgVngji
 q83ld1bxXbqjaZzGIBy27YvwgCf4OEAAAA=
X-Change-ID: 20260306-milos-gxclkctl-8a8372d6a1e0
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217850; l=1101;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=y0Ba2DL0Mm1AYioDzm+l6IeVu5Qc3RCVFN+Tk1snlKg=;
 b=kLWENhEQXSsTrvRcJkXn8V9hEnXhS0ktYUIqgUKUN81tHFzclgf1ExciJnbmk08N1g06dNZT6
 DUdTWbDeOIxACcU2zbtkdSv3gUyn88rIHQgbzO9tjkFv/XIr/B8bCzL
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Similar to other new SoCs, Milos also contains the GXCLKCTL block that
we need to control for GPU. Add support for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Update casing of binding title, reg goes as second property (Krzysztof)
- Rebase on linux-next
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com

---
Luca Weiss (3):
      dt-bindings: clock: qcom: document the Milos GX clock controller
      clk: qcom: Add support for GXCLK for Milos
      arm64: dts: qcom: milos: Add GX clock controller

 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 10 ++++
 drivers/clk/qcom/Makefile                          |  2 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c              |  1 +
 4 files changed, 73 insertions(+), 1 deletion(-)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260306-milos-gxclkctl-8a8372d6a1e0

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

