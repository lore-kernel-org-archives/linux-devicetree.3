Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B433E3175
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 19:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034449; cv=none; b=g0SkhRChrBp4pJgSgHruCgRYVGOpagCPG2NWpEMSVXYEEzKZVdbacnsB+YCWftlWH6GRzph0b4ZREZiu9KgWs1SQ1AjLLpl/DhxP6NAs+gCS0DtIaWCQHk1piZjm+WxdLXkMpxavXqdIvdXBeWU9nhedh35VWykB9DHMsyZLyuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034449; c=relaxed/simple;
	bh=+Pdfi70LkinVFTovJkzCSbIOzEBbKyNKWMr5FgCeZf0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B5PCYpRj4eCBzede8QH23CXyyYMMKioAiJJezxqvQwS2zR0k1plNRN7vMKWy22ZVDxxc6rF7FCzSapekBx8iB/xl+3xr9nIfaTsj2YV7XsgHwiR4NqgE15GbNwPEtbH2ha9kGTzrQqg/fRrwaxVJXxBN/9I0jEazwhzXeUNhYB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beXv5qU4; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beXv5qU4"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c857fba35cfso2926179a12.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 12:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781034443; x=1781639243; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=epRH3P+p1WTs0Qf73mC3lJ/lEpqA5BdU7cFqo7ivRaM=;
        b=beXv5qU4LCe6B6rTdzOSgY1VfjzFSawZ7cGiLDnnxqI90T9Ctq1dxLA7BE7bhG9lBO
         arviP8iLneTa6aGeaZ6rWZpP81kpiVLTE5vKUnNfA4CeppSn3/0zZYVGooS9hyNGwpnt
         UZtClFZKPo1vQexn2W3rLB4TGLfkatlup79hnEyug7ZGQa+nOWPNYhpTKEoK0O7FORor
         sNpPD3FMb9Zw9uLUXJl59c0315T58Ezh9gX0O2JIAuTqq/CUYkI/gLgonu6uqwjFtzFD
         7cF7H8NJm1tvQGYXF4gpEou2REpnQddmWzmaCqem/k0t5YZ3wS+1ysOaWyb4IHzgnVH+
         53VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781034443; x=1781639243;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epRH3P+p1WTs0Qf73mC3lJ/lEpqA5BdU7cFqo7ivRaM=;
        b=k4/Ome3mzeazO8jEYlk3YikPKft0AbyCaz+y6rUc4LZrI4UP8sim8p1Hhy6YD7bQrD
         S4NsBNuV4bQbAaekI3lx4I1iYYOf/p6Vz09J9UXc/Ceg6jXQNTuPXUJTXucAjpm4TGxd
         8o0V/DxsZYXMNGjVNbYOdvyb0gb8BGiZInrlD5pGN6rqRjFIxMTHhIcOC6Bm5GY8NSO6
         FAYabC8lMMjjBaqCFZMKE6QPo0AoH8yFxVr/qzut+zLhgIYbirPO5uoSejOFXCQN8BvK
         OGQJ/Qdkt8Z+pTz8dVtwj+FFfOXy0NwyQWz2CUgGK5J2b6z57wCLqiCXhDW6L284wUG9
         jeEg==
X-Forwarded-Encrypted: i=1; AFNElJ+33Y3HAzsasoT46G77QZnEXWNZapQak9PkUrNjiFohwWabSTCpgXvKCbOXSoVLYCBM0KoYmFC42y6y@vger.kernel.org
X-Gm-Message-State: AOJu0YwNv8qXk8YHRCpdPTjgnvIWKUO9VA/yb3ZIqcpAGfgI2QKfLpGm
	pY8NXQAI49cv2jycG5OQPlovX6snXjoOAjLRnSNJgfyUEDDQyRF1WiJ3
X-Gm-Gg: Acq92OFDU3hTwa7cZTpR4XjoDWsrMfhImP6FAziPsAVFVtWhwfBnluuIZf80EdGwDtI
	CE5SaW0x4GcIV7Vx1hp7vUpcb0RZY7vXTJdFp8FlNwB4iKPCtFDy+YyLprPiDqYsfIVDOHP1mlI
	OLtPAEvCkynKmQjtEK1lqQ/CA5wza9BwGNK1J+66wcRuSI6N9TBgvWPB2opw2uJyELI+4xZz9Hc
	ZDvceRxhd+CWcIxbVDyPlqv0FX/1Ph6El9W73wQ/h++C75E9uBbBmSwXSr9KqGJ7ShkfaplY7p4
	TFcKM4MkomfHpQoJP6gCmjubaqC5crjw0N9nfGyVGyqH+tbzL/KacRr6ugI2Rr/CvzVtr2Pc2fb
	UnKrCzgFFzPDi/zr6OEIkduBHukjjmbyGO1eeQl4z04glYE6CFY576IaKKGHheDVosGh/T0d5cr
	sfh2Gdmshi
X-Received: by 2002:a05:6a21:3949:b0:3b4:6026:6c5d with SMTP id adf61e73a8af0-3b4cccfde39mr26226941637.5.1781034442949;
        Tue, 09 Jun 2026 12:47:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19517121a12.14.2026.06.09.12.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:47:22 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: Add SpacemiT K1 PDMA request-number
 header and use it in DT
Date: Tue, 09 Jun 2026 15:46:37 -0400
Message-Id: <20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ1tKGoC/4WNQQ6CMBBFr2K6dsy0SlFX3sOwKO0Ao5Zii0RDu
 LuAB3D5kvffH0WiyJTEeTOKSAMnDu0MarsRtjFtTcBuZqFQadSYQ3mAu4TOeQORnuCNjSHB0al
 cO5RKu0rM2y5Sxe+1ey1+nF7ljWy/xBaj4dSH+FmPB7l4/z4GCQhZqcz+lGWIub3U3vBjZ4MXx
 TRNX5UPZW/MAAAA
X-Change-ID: 20260607-b4-k1-pdma-req-macros-8d276d0126df
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=+Pdfi70LkinVFTovJkzCSbIOzEBbKyNKWMr5FgCeZf0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiyN3J0ap2uYnpxhcd+dxnzdfc6yC21LvXott9jc57uh8
 GCWkHhiRykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAEzk30VGhrkzE6YfOzR7l5tW
 xJPnr3+V1+iWFc9dtzx9/et51/skT4oy/GT8+HZOVUWLybYvGa+5Tme+6Et9eufM0tpDvUn7xM1
 dG7kB
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Currently, K1 device trees specify PDMA peripheral requests as raw numbers.
Add a dt-bindings header naming those request lines and convert the current
user (the K1 SPI3 node) to the new K1_PDMA_* macros.

Patch 1 adds include/dt-bindings/dma/spacemit,k1-pdma.h with the
  K1_PDMA_* request-number macros.
Patch 2 updates the current pdma user (currently spi3) in k1.dtsi to
  use these request number macros.

This patchset is based on dt-for-next of spacemit linux tree. The
request number defined in Patch 1 comes from SpacemiT K1 User Manual
[1], Chapter 9.4.3 DMA Connectivity & Assignments.

[1]: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md

Changes in v2:
- Drop the #dma-cells description change in spacemit,k1-pdma.yaml; the request
  numbers are hardware-fixed and unused by the driver (Conor)
- Link to v1: https://patch.msgid.link/20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com

BR,
Guodong Xu

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
Guodong Xu (2):
      dt-bindings: dmaengine: Add SpacemiT K1 PDMA request numbers
      riscv: dts: spacemit: Use symbolic PDMA request numbers on K1

 arch/riscv/boot/dts/spacemit/k1.dtsi       |  3 +-
 include/dt-bindings/dma/spacemit,k1-pdma.h | 56 ++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)
---
base-commit: 793cc54475b49b5b558902b5c13e4bfe66530a50
change-id: 20260607-b4-k1-pdma-req-macros-8d276d0126df

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>

