Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733759;
	b=YlzWJw1Y9ixt/yIDWoWho4HDy5Gxo9lgsLIxcmbQwzkCMEz4owZ9BfAOcEMUIaQM8gzm
	 8Q7aSB+ENO0h7pyuiCjTz47IQLML+R+wRDdqge5pmrlbUvG8xNyzWmPIPSFcv4Mt5hNmk
	 Wyu5lGlBic2s6/MP6lYdhapVD+D6fMna0rtQ0TP8QSESIeyMuf3Pz7b2aMHRE//UJ2Je+
	 DNaxJYSGZ/faicjcZC+hJguc6hb5VKo5tZh8IUIv3c1ggzz1/3WtiCkh/6Pk5fVLu5/h+
	 fKKuvE6/nY2gqaalOF/s1/hnnl5dEStn4EV+oLn+HLsHMCJtEMYt6zud/1yQBOioZ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YFwipSmzwQ403tXXCr3sam0ZTKk4Mily0d72SzJOBxA=;
	b=k3tjOOXBUBpD5o7GZaonGy3+33/c5eYU7NER6azbdvvrjvga+T/aTKu5Jz+y+5jnSUUb
	 tWBiERKr500NPY0+zwJZtjaI3wbuH7zf4P4spqADLfOmtCWUuAIv8KTYUi5NXoYQHp55N
	 aAJiAUsxhTi65EAC9fMPFdGLF/mSqGCdhw3DRg64AbfmtMU9Jy/P5hu58GzGcmuHcguFu
	 obqo8dJwuUkYJmbl3XXx2Ee83PbwAyYXclEAIr7vXS60JoKKzm4Gd4IV9qB2TkHnAzs9Q
	 +Dh4dAzPZooXIgQQxxI9SWhnzw50BN/yWq4QuTQDNp4ulGi1TNkQjZaWKIXADBxi/fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=koyExOo+;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66851606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66851606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=koyExOo+
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36758ba1f01so235430eec.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 22:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792733757; x=1793338557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YFwipSmzwQ403tXXCr3sam0ZTKk4Mily0d72SzJOBxA=;
        b=koyExOo+EC80xPLZgohMiOyJWiBupWAA4SHtclr7JhHHq+JzxCnLKqn4q0VYN6QA7t
         cBF08WtZ/X/PBsdjNmmXX0PWDf3FPGZUcJ1xDu8oMKbkJbL70rWHNNmlNBvegxGzcqiD
         n95bp7wgRDo6jBZXPn8eaUwEUkUWkiidUmIfMb8NKvy94dVPWAlKyCNkK1o4NjaEgfKS
         qn3nkpeS8DMHx6MvYeGc4RQbTvJwIwQ8C5FH9jpXm1s/visdGU/3Y8DH0TTDKWdxf3c1
         6hmfeX1ene4ScU3LDAPOqYTK3ZO1yGh/AiQGkux1OB7DNgswHuz84JizYvtrBKlaYtjA
         Td1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733757; x=1793338557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YFwipSmzwQ403tXXCr3sam0ZTKk4Mily0d72SzJOBxA=;
        b=eIzykdrHj+vNAz/wQJzGmS1gTkIWRIAid/YyoXoDakzpD2JqSS4xp5xXeD7Nkx+7s1
         rHwT+52Glo27L7/148gXVpNZv6IIZqp8WLhfG5dJI83qtkQhUtWla02+Fkf3mGox9EFU
         M2Lngn8XbobwL7ainQV23GcjBcS7Ad7RdrUGMoTfA1/0RgI2J4Y3Ioh7T9K406E2ZOzK
         rnRTLdcaxceErjZxFrDzu2MuVqxK6DaCT5fn0eFwefa3N2Swkh8E3XcGl/pkCIdwzTMz
         JmhLk0WJ3AEZ0WTEFC38s9v1ukJ/xBQjSU4tANDOve+0vk3kW4OhOBeRBG+Y5LI79IuX
         Gqnw==
X-Forwarded-Encrypted: i=1; AKwUvByQUdaPlZoKL5QXxZX5px/O94U02q/k+nM09O2co9kPXsVfzr2bRX2o1PoWUKUpyvbTH/u+vr/eqU3x@vger.kernel.org
X-Gm-Message-State: AFq9FYLsykQ1Y5zSPidqUFnL1+DmeJQmlaA/dST5lhhVXkV6sVMXrzGY
	3a6dgcMsw/hsiGJR5sWSyE3MzsQn0oMSJaNhHtdELBNKKqHbFax4nBDW
X-Gm-Gg: AYBFou2gJa9pj8eMRqDvDUocMDI26QC0edwwaFTG9HHbxvk2b3M9XdVWDcpWOSeR2Bs
	0PHDMe9Z0OO9Cm7ZSpzCvWSkVa53ynWfx2L1vcValioyik4kK9btaAQtf+dQbZfgDoUcDzMmvrH
	U5cYPqshO4vumN3kdku97IDSWSsx6CF6SuSHd53dUmZemoJgO+mLs6LefecBQcMVa3fYwuEz8Qc
	wb9qUzg7boeMRAL+5TlsktwJ0P19U9WkOk6EvmsYtwg6swMhVt0fiKQ7pdFxpzTojTbmU21fOeM
	pn5riGqsi8EDBX1COmyU1KRriTLB/n7a7jpQ+9SJG8yfw6KTnet47Rs+h2qO36+Eb23f2cqbrJ0
	E+lAORZVEgosS1RrD9bWBGc7NHP+XDEHDNRhJ/+cV6mBC4FLKr6iwg2Uzj2iZjYeLNOMF85++CR
	j3kVKG3TASA9QlUybw11LFYuFhr9yK4hLnynHoYrUiOm+7df/zy6Q5uRxV5ThH2agYeKWnGx8Gj
	t22Hnbn9s4sMYNxiQkA8CsZJwCp78rbhBPuROR1ZDVNVqKBo8q+HA==
X-Received: by 2002:a05:7300:c3a4:b0:34e:e7f4:cc78 with SMTP id 5a478bee46e88-369d954ad83mr1482862eec.5.1792733757137;
        Thu, 22 Oct 2026 22:35:57 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm3542480eec.3.2026.10.22.22.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:35:56 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v12 0/3] arm64: dts: rockchip: add RK3568 XPCS nodes and enable SGMII on Photonicat
Date: Fri, 23 Oct 2026 13:35:45 +0800
Message-ID: <20261023053548.1595033-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the RK3568 XPCS and fixed-clock nodes, describes the
RGMII PHY LEDs on the Ariaboard Photonicat, and enables the SGMII LAN
port on the same board.

Changes since v11:

- Drop max-speed = <1000> from the SGMII PHY node. SGMII is
  1000Mbps-only, so the limit is redundant (Andrew).
  
Dependencies:
- XPCS binding and driver (rockchip,rk3568-xpcs, XPCS glue, dwmac-rk
  SGMII, pcs-handle binding): merged in net-next and present in
  linux-next.
  https://git.kernel.org/netdev/net-next/c/5e91edfb0e45

- PHY binding+driver (rockchip,sgmii-mac-sel): still in review on
  linux-phy. Not required for this version to compile or pass
  dtbs_check; only needed for the follow-up that sets the property
  explicitly.

- Generic PM domain (genpd) changes: runtime-only, not a DTS
  dependency.

The XPCS node is disabled by default and only enabled on boards that
use SGMII. The fixed-clock nodes are always present, as they are
static clock sources.

dtbs_check passes with the current linux-next, since the XPCS binding
is already merged.
---
Coia Prant (3):
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

 .../boot/dts/rockchip/rk3568-photonicat.dts   | 67 ++++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 23 +++++++
 2 files changed, 88 insertions(+), 2 deletions(-)

-- 
2.47.3

