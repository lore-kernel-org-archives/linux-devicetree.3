Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5152FFF9D;
	Sun, 23 Aug 2026 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787500130; cv=none; b=bgzTO1lnx9uIBztfcYZgND7n045oEjhrs67Se3807uoDfZBd7wdKNjlCcdflCyRgFFI66l3xUav/IF9gP4Q7dpJISq+I3yvmviyOg9yGMDG96vOwcUmWR3qZpUAcBkQOOxUA68Sqg0fw5ak8xY3Tr1KShO9dWM6xUs+QpsFTY9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787500130; c=relaxed/simple;
	bh=MNu+Mner4AxinV2PwT802Bn3h/RumtGzXAjErXRyj98=;
	h=Message-ID:From:Subject:Date:MIME-Version:Content-Type:To:Cc; b=VRBGwx1GquTDCeJLE7IH8tKXwmrRUYOxqrUfsRJ+D+xHvHq8QCuy2NCjjbWMAlE+KNpkVnC2SrJ2GM0ZERWtwmTD4iDuptcGDMrPdl6ZtCCu7ElmaOFKluaYnoSbIKwEUGkNFiFWbIrQpKvtVLgR45xeiWhRXEnRtyHR/odHZB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mjKE8H8h; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mjKE8H8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787500117; bh=7a5/dX47J5QKh3B16JurxcwsSOf53xn+McRrB8Lj/oY=;
	h=From:Subject:Date:To:Cc;
	b=mjKE8H8hMDj8jAcixJI1Gv/TR0RcuycicCn2Wn/rojpHan3jXeNIku314BWAZAl5G
	 +ZdHUrECu2TJva7uCLoelrtY/iYl3/uvQv+8TWpBKhqHN9cK6x1+L8xR/m6ZrXWhMl
	 ffpb53ESwpkBaZJaEF4TmVvau17ighSeRanF9IKA=
Received: from ubuntu2204.localdomain ([2409:8d20:2b:671:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id BD29E410; Sun, 23 Aug 2026 23:47:18 +0800
X-QQ-mid: xmsmtpt1787500038thq5dia1r
Message-ID: <tencent_16321809632326015A886B7E7C4D91347808@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5U7YrK567bc0VsgX46AB58XJqzNRRiGHHOYsO//d3+gf9qelMDo
	 b0PZwEZWi44wjg+wvrs8KQdekQ9mtVYNYM+07BzBzBsxF2DR42aGug/RIk+mHfRsB26zodzDmyrd
	 9O2ye7ldd67O4w464hEGpDtpb907FLjAF0O86beyv+QnoRN0QBdHMQ9pGmpzYQW1ae7QmHM8xe2i
	 aiqx/OIWA/Xq+7jniKc26rxz8qqOlDSuBI/1hGwhndynqAySM76wxQ3GPBYiW3mCmBYSPFYewgMo
	 CYukYBDXb236WoDhwNa2cQCVTXsD6Y/nxmPuhJGo/ChxH8pLxbeKrEldXE4pjn4zO0sVt6TTKwp0
	 9IIiYwx5kYWg3LyHn6IhXlVS/Gp2TiurXzNmjXylGsELDbWf75v315s2dWF+RV1Oalf29xU1G6fL
	 M0hvaE9mlzPFWCS9X3OB7+Mxc1T23RkebTqecAI7ckKvkGhGObb89jFrwMOnqdh9cj9kIf+GfODM
	 7yrGVpdnQFIe20vJdS7OIHDfPwvkKpl7Cl8ZIuQpUDcC1uhw5+H5ZM/X4N+P/+K4usng5ajVgahS
	 3aAiDZMrSOu/BjcrSbYPPw6hyE8LVdE5M690FutP+bNrThAw+wxzK3wpIZcqKa3DgaaRxa7ZSBmL
	 g5Ml3lR32DUHLyXwJic+0kUGY6VFszICAvlX4mN7YH2SkQe1bp3nEFVtyfTA8Vx4/H1+tjp+OtPG
	 +SodLFqv5aYtt7rKqPIVkVh+4ZvfN7MNMB4oUircCpiET2HOLA3i/i59b27wCYc606sp7UkstYDr
	 4GrNZa1tRRwJ4sdjZ1RptQtXit7dEi0N5AVyAUXQLZyL5u3oYtpzNYfW0Y12EzrPvRX0PrqZv6pt
	 /DkqUwJdmHWqBLfwNfYtayJYrKXGsK6Q4BTokituNhdcnqvSM6GQLkn+hvm1UCMX6hqLzWe5e45O
	 L9aYV6qDVrolHYuclMpk9ZzT0xvyFyr0mm3RwxBVDiD55PiFbZ71kbk8CuChIRN8zFa9csLuNXW1
	 DMTvAH3M0Ki8NwmtPKyhqF8jlciZEjcEPh/UVxdWnNJz6W9GeMbNTZhYQT3W6a1p+ixmfnjDXp7I
	 be8mJLBaf6hg4VfLkburysUTgDOhUy9WJ/vrEIxYWhJp/QW+duFMJPuFe1EGZIwxV2499GJgVKVW
	 KSRctDZA/GveMaqB8Cz5Ax3u/l
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Cunhao Lu <1579567540@qq.com>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add LubanCat 5IO board
Date: Sun, 23 Aug 2026 23:46:52 +0800
X-OQ-MSGID: <20260823-add-lubancat-5io-v1-0-e6b7894e8c60@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwVi2oC/yXMQQqDMBBA0avIrDsQU0yDV5EuJsmoUyRKoqUg3
 r1Rl2/x/w6Zk3CGttoh8VeyzLGgflTgR4oDo4Ri0EobZfUTKQScNkfR04qNzKhU7xvD1jG9oGR
 L4l5+17J7386b+7Bfzw8cxx/VZcg0dAAAAA==
X-Change-ID: 20260823-add-lubancat-5io-00fc56e8bea7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2

This series adds dt-bindings and initial device tree for the LubanCat 5IO.

The EmbedFire LubanCat 5 is an RK3588-based BTB core board. The LubanCat
5IO is its carrier board.

The following features were tested:
- eMMC and microSD storage
- 2x RTL8211F Gigabit Ethernet
- 2x HDMI output and 1x HDMI input
- 1x M.2 M-Key slot with Intel 760P
- 1x M.2 E-Key slot with Intel AX210
- 1x Mini PCIe slot with Quectel EC200A (4G modem via USB2.0)
- 2x CAN-FD interfaces (CAN1 and CAN2)
- 2x UARTs (UART4 and UART7)
- 4x USB Type-A ports
- 1x USB 3.0 Type-C port with DisplayPort Alt Mode
- HYM8563 RTC
- PWM-controlled fan

This series requires the following patch to provide the RK3588 CAN-FD
controller nodes:
  [PATCH v6 3/4] arm64: dts: rockchip: add CAN-FD nodes for RK3588
  https://lore.kernel.org/linux-can/tencent_95532630016C2421000111DBAFADA99A8605@qq.com/

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
Cunhao Lu (2):
      dt-bindings: arm: rockchip: Add LubanCat 5IO board
      arm64: dts: rockchip: Add LubanCat 5IO board

 .../devicetree/bindings/arm/rockchip.yaml          |    7 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588-lubancat-5-btb.dtsi   |  548 ++++++++++
 .../boot/dts/rockchip/rk3588-lubancat-5io.dts      | 1062 ++++++++++++++++++++
 4 files changed, 1618 insertions(+)
---
base-commit: 2709dd5ae32f0828f386327c76bba9f39f63a1c6
change-id: 20260823-add-lubancat-5io-00fc56e8bea7

Best regards,
--  
Cunhao Lu <1579567540@qq.com>

