Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11723C0608;
	Tue,  7 Apr 2026 15:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576194; cv=none; b=J9iGX7T/GuqKo5KhL+wknw8VmFXjGsH02c+4laYRzsPXU7bkubr19eb1wZ64jel+y07KpsY0b3mr34Z+0LBuEPdNNvnO69gHHiXZoDfY1XCAL+GHJ6/cGPVDLCiQWzcEwwuhSc4chFKvzKrW2Vvn3jnSLNxwO5dBs+FuPRGAKOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576194; c=relaxed/simple;
	bh=ABxAA5KZ/KapiXOpjczLnUMUzIzNvPjTLK6gf04IbsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gEd/KTvpAoDlkCveF+rnDzz+a5bqTYj4LqJg/loDSb4j4ZgQLgTZnAvVuoEct1i2NveeTE/LxjEtA345K+ksgyJy7F+wTCec32P0zQ5Cr923sfhKWBGoPUlehgo/8xuJ6O4HdcjDKdccMxG5Di8ZQ/Xj6ox+6wewQ8Hsg4o7yeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQUsOU3U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQUsOU3U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558DBC2BC9E;
	Tue,  7 Apr 2026 15:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576193;
	bh=ABxAA5KZ/KapiXOpjczLnUMUzIzNvPjTLK6gf04IbsE=;
	h=From:To:Cc:Subject:Date:From;
	b=hQUsOU3Uzl+VJPQp1QH/hgCeLbC0eX/7fvknsVJUlhO2+/t5aSgA/jlRYeX2kU7X3
	 Ht7kXF9ZvQtq3aBbYEc3a3OrWr2oivkyMD7ec2ouKstm6Dk60gJMv3LT+v+OasIP6X
	 c3kyH+UmVMKwYtOvy/OgxNQ0N2BOTnkttN7Hd+ITmJxML6WXlrDfvBoocB8cZFlPGb
	 aVObMlthpE08esKZxa83X7lg+CeWA1huSXKXRB2J2iKajV0XYTD4DKVIaCdUv8F9cj
	 GmGt0BYtifHJkkT7mudyZvwkjm8kdUMUJ2R3XZIcZfvgdyhfFm88gurpw1Vx2PFFV4
	 9iz38NYkjN2lQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] pic64gx semantic conflict "fixes"
Date: Tue,  7 Apr 2026 16:36:22 +0100
Message-ID: <20260407-rely-speculate-dae3a81ea1fc@spud>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=876; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ZvQZVBPK2T2jYfJjkn4XV7btTIb5sUPd6RKn8R0yH5o=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlXVcqDtTOklpm03lDYcUPNXO315Fb1CVrlczlfKJ40W se5xGl5RykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZid46R4c3l9hm5uS1hylf/ Ln6lqu7EI/l+B6uR6rqLr1qVn2xcfZXhn+m9l4/ubA4JqK2YUJnaLLJVfZHgE1bBm+rR+u9Fdwi wswAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Paul Walmsley <pjw@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Alexandre Ghiti <alex@ghiti.fr>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (3):
  riscv: dts: microchip: add tsu clock to macb on pic64gx
  riscv: dts: microchip: update pic64gx gpio interrupts to better match
    the SoC
  riscv: dts: microchip: sort pic64gx i2c nodes alphanumerically

 .../dts/microchip/pic64gx-curiosity-kit.dts   | 63 +++++++++++--------
 arch/riscv/boot/dts/microchip/pic64gx.dtsi    | 40 +++++++++---
 2 files changed, 70 insertions(+), 33 deletions(-)

-- 
2.53.0

