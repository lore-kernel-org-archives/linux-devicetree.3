Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457513C345F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240671; cv=none; b=fZVoZAqPLeGzwaHjuGe74B5Lk+ODWTgsVBgkky0ftJMzOh+9uMtB7huMIWZIlwCpb5pUWffLdZ04ZTnXo1/l8JeyskZ3341sF0yj+JPHpgiUjU5Fk+WBu0QljHjoug2AN7P0vH03PW7edEreyYHPbIqzRM7rgBa7AIb2vuULJ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240671; c=relaxed/simple;
	bh=SCLLrkorLj0vGFc6opEZEGHA6wkQeLMcKA6Xr1wZ480=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z3cyaDIUWbQ5mmRaY68Ph4I5ZvfgylxecwuXwm0z+9ypJC5DkFedd0qBLw6lz7UrO9oCJF7sUIMjxEs6zWaQtqB8ClB9+kGkFXmgtBS9A6mOpKMrCiFti3lClhYJZzRSQSQKkGsXW4g6bFCbGj3pEjfc8FairMOYpQ71uMAWxDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=leak.moe; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=leak.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so5137384eec.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240669; x=1778845469;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Gm3u44MZ1t+I4yxSOsrnRUe2YNmAHLINx2yuXfD5eg=;
        b=s3q1Llr4/EsqCLA5D8sYFv+vGPIpcyy0EZFRleUS1WuVCYkm7H554ZmCRTyFxUSE2Z
         TxQwxBihLFVQ33Sunqr/i4TUkW5LfIHNVt0xyerDh5Kw0NSyKWA1pkCUspANNEfjlYVN
         ZkRawL82d1v6U1VXgvIEhZL7+p8nqlOmyf4Pz7PLn1QFLpSH9kjQdxGrOQFKY7+PLAo5
         Aykxn1Bp+C5BJWJqh+nmNQ9Y2IZaBhxOCnehZE9mT7yLP8YEfIfHg8BrQ21SAXu1AIyY
         1Ly7fYdzSyLaQ3vI8kNLYUpCdP3jJCUVatnLOfQW3SWYXjkTV3fVss9z3n/oN/pO+MUS
         Fnsg==
X-Forwarded-Encrypted: i=1; AFNElJ+sQMpjOOiyEWNPkVU5JieNdVwfQjL7AohnQUWoe9SH4oX1mH5royORQ2KTALmRxEXDaLXku/hXlqOF@vger.kernel.org
X-Gm-Message-State: AOJu0YzGFogfvQuUCtM+sipJIXXoBcidP3HyQWN6EXKLWNnrzr7LYa7k
	mRz99dpVaF9l2IKxfUERYpXELhZtXKlUHYLop53txbud2kZ6oSBumsE3
X-Gm-Gg: AeBDiesx2aOi8aas00ktE6ieomQNu9mcqoUKEQZZQHApyLOS1UIeSGZvRXxwcDI8N9n
	BHmDCOcmiL5cscfG1+lNJt6DlChsVGt6reVU01R8fAeekr9RflHa8nuBz/SLEDo/E2o0DxsGtdK
	im5somEmdrBJ0laZatJuPXmHCrbVZCkR3cRzhjs0kl5uKwaJR1iCvqvZtHxTm3KfPQZec6L/WXZ
	0yE3gB4Rs16vOsKDyGZrG4FARwyp/1vM3poMiyFeXaCJHDN1bXtEW5KuhlfwSr4tidyradDuttA
	AhYYkTU0zzlEqAYYzq9yilcLOsouVib7ndIZ7VEnnBq9x8ikpvVUdw2MtLIdkisoo2JiQb+esMl
	q2RBqlLHcrn7Fz3cPCBkfOQVS/dxo9mdxoGHCEW3a+95ESyGh6igxiUdvx2A28AkRheaKn4AVIT
	5RsOEL7tXCng==
X-Received: by 2002:a05:7022:eac1:b0:130:9b78:b190 with SMTP id a92af1059eb24-1319cd26b97mr6301441c88.23.1778240669031;
        Fri, 08 May 2026 04:44:29 -0700 (PDT)
Received: from [127.0.0.2] ([154.17.237.246])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210f55sm1979131c88.5.2026.05.08.04.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:44:28 -0700 (PDT)
From: MoeLeak <i@leak.moe>
Subject: [PATCH v2 0/2] riscv: dts: thead: Enable Lichee Pi 4A WiFi
Date: Fri, 08 May 2026 19:44:12 +0800
Message-Id: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzM/WkC/yXMyw6CMBBG4Vchs3aSOiASX8W4KGUKvyFIWrkkh
 HenyvJbnLNR1ACN9Mg2Cjoj4jMkyCUj19mhVUaTTGKkNDdTcQ/XqfIILiwv8GAp67uILRp/zSl
 1Y1CP9f98vk7HqX6r+/5GtO8H5FddCHUAAAA=
X-Change-ID: 20260508-lichee-pi-4a-wifi-26b722a4df13
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 MoeLeak <i@leak.moe>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=i@leak.moe;
 h=from:subject:message-id; bh=SCLLrkorLj0vGFc6opEZEGHA6wkQeLMcKA6Xr1wZ480=;
 b=owEBbQGS/pANAwAKAdIQkqz3TgiQAcsmYgBp/cyUNduj7iKs8ES/4/be5jrj9w3/pwU927i+u
 xAnG+o29qKJATMEAAEKAB0WIQR9GaDYhgIayZrpu/3SEJKs904IkAUCaf3MlAAKCRDSEJKs904I
 kMFrB/9DZzTYD1AsCKexVB4ihA8uFVf3G40IGxYeQ+nnTPtZ6Q8Jf9pL0RFQedabovoxE3PaTTr
 zpziu3utgAOOISnpEAJnxC9xtwa+vtazFq3BixNqQHFHhOmoDgOG8izrPgvGcdxXOqWfED6zYb6
 Z7c1WCBhZwFMC6AbSypUayyGd1JWBFNREOcOKdbbJkwx4jPlaKYvUjhIPrjB0QdlZf9xocuUATj
 AjiPTfMGz2ZqkzWOYaXnDwhctuXSXJxawPC0SRjqVShybvQn5S+LFMnu1N3hScQHHc16h8y/MQL
 Pph7GKoo3nStT6Gia5THUNOHeNUUAj1K3ydp/ALKwl9U/7NC
X-Developer-Key: i=i@leak.moe; a=openpgp;
 fpr=7D19A0D886021AC99AE9BBFDD21092ACF74E0890

Enable the RTL8723DS WiFi module on the Sipeed Lichee Pi 4A.

The module is connected to the TH1520 SDIO1 controller, while its reset
line is controlled through a PCA9557 GPIO expander on I2C1. Add the I2C1
controller to the TH1520 SoC description first, then enable the board
specific I2C1, GPIO expander, MMC power sequencing, and SDIO1 wiring.

Thanks to Drew for the detailed review and for pointing out the missing
commit message, recipient list, revision notes, and patch split. This v2
series follows that feedback.

Changes in v2:
- Split the TH1520 I2C1 controller addition into a separate patch.
- Add commit messages describing why the changes are needed.
- Add revision number to the patch subjects.
- Add MAINTAINERS-derived To/Cc recipients from get_maintainer.pl.

Signed-off-by: MoeLeak <i@leak.moe>
---
MoeLeak (2):
      riscv: dts: thead: Add TH1520 I2C1 controller
      riscv: dts: thead: Enable WiFi on Lichee Pi 4A

 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 47 +++++++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi             | 11 ++++++
 2 files changed, 58 insertions(+)
---
base-commit: 897d54018cc9aa97fd1529ca08a53b429d05a566
change-id: 20260508-lichee-pi-4a-wifi-26b722a4df13

Best regards,
--  
MoeLeak <i@leak.moe>

