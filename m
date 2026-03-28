Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com [203.205.221.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F86E126BF7;
	Sat, 28 Mar 2026 13:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774703188; cv=none; b=bXVSMP96us18ryIh0WDeb69cswizRhO6KA8tW0OcvAjyV64kAecMtC57yeL/oPOIC8APIFENh58MaTYzsZdKUpULLeNmVIY+WNw0SPuwSs1WyS7PEVBn0D2jJFQieN1MoRNOXR1wTJxOdd8wl0xr+Eqf15k1VdPshNIoWyqnuhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774703188; c=relaxed/simple;
	bh=Nt7QPoc4oVQrmXPfoxK0yc7fDDj1Uhj7ACzVxPwMO1w=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=rU6zqEwAU3tBpaILJCOFoCQ0Dn7POu4Gk5shlbkAJ021qJ/Y0SKITx+u/EdfihuBzIGQUFmQZZq/pC5l/v7RMBv9Mlu06T0UT+A3gl2FBpPa9IE8atoJ5IajHGgG4OoHq1/uXkhfmERjFEYxHMuqEM8oceWe3uRlP2Qvq0/+f18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=qwlgQLbE; arc=none smtp.client-ip=203.205.221.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="qwlgQLbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774703174; bh=gXMYbAq/58x0snbnrzU6L6DOJ89RXswb5+dhZJU1I+g=;
	h=From:To:Cc:Subject:Date;
	b=qwlgQLbEDkLize0QMzS+3V66ttCmBtcwhM9Xo8gM/gIGdap5VKQpatCvF/yJjcshY
	 6rQNDX8ymeYvrTIZc2sYfJpLVnCNR9cLtgu6q/FQDZkWd0OVp6KVj8ej3IqDtWm8f3
	 hg+zniiq7ebHeUh5eNPuz4GZ0ky4T5+UGZVSRx5s=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 1780141A; Sat, 28 Mar 2026 21:05:56 +0800
X-QQ-mid: xmsmtpt1774703156tms1s7szr
Message-ID: <tencent_4BED6C3FFB8102B4BB3D08D6F47F2CCFC908@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25G6qBVx5CHfggfaD9zux2Mmv9fE5m2oyrKQJFAT0D4wC6vLh9cUT
	 Lo2mGsU4szHgVLAiRRiW3ngzpSJD+to20cSAmoNzEfIh0Sl5JyhttFwMh+5Fg0of7t88nmp7T/5M
	 qVcZEHelcLFOSL1nqA0YTkCe2zr3gVNyt2v5MyaFM1tNCW8ENHmHU3ibYwF8d4Nvj6FdeUMHMMuy
	 pgfOJgWcEsuA9sD5BDlg0Jz3FMnITsmbqeOzZSPw3bht1Cq2VpBsyHcvLXTD7TEeenmN3C6aibGG
	 wcNo1nE4MybtOZFk0YjQ5hyLOD4n1+YSXR93sP4tq47n65YoCW34mWDwJWDeMUWte2Az5N0KhLkO
	 7/bOiND3r/H3k6bjXULt+bfj/SHQ7arhmD9yr9+K5CMFQABcPVYhHGc8MyyTyD7Q9xLqKVJU8gRT
	 NcCUqzG2LqyTS7qdlwLbxTWexkSuckaJM/S5aMx32bITMULXN8P6fci4ovkgwjNat3dWqB0+ME3G
	 Z150fiw+n6IgXbPXxtQgASkMKt5Mncxes8RH3uMt043mDh/RNsvg2TrYhLn1TEEGX4oPipm2CFcQ
	 GDYmZ8Mmr2R2/qWfVrq8TKwNr+JIniZpMeXVNf5c0ATVav3JIc6t0V4kXE8upHjTBkRBuEPIrk+W
	 xHn8SduWoZ+kbXHs7vYMx4pB37dG7fEPMJNGeI72wC/vGwhCyrxMsCdtpQpfS2lVv5P7bTGoj4ig
	 dHfJ9Ph/gajp/sAsVb5eHUyXsQwQBKzFK2HWw0B28CCXkFFFOMOb5S061NuEQ8F/8ZmaLOvZXMbJ
	 BaNICwylneaN/VyKzsR8+/0BC8zyvBQwAHIrCfuPlx9IDzeXQLx6R134MblAujJ+111CVbhLFmNp
	 9oj59zpoWFFM0re9M+kw0OEPqNKTuTScwYMiMkCBJ3ZPakbGLg+UBCMEBMJRouTrARmiMLjRZqn9
	 hMrKvbXgk5YcZbV2afUUwbjCiaXnWsU3aYwbH/N/pQoIvcj/lugikq9zJ6bh6Q9DLI1edscFKUGh
	 +X6t5lQXgxVDSsd073ntbxv2tizjE3cHgVuHb3YS2eCwDT31CBnK2GNNF8UrHsQoBvC+5A2XOmPn
	 LObiuAx6gcV0+8HSae8Jf9VqBgTQ==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
Sender: yeking@red54.com
From: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>
To: linux-rockchip@lists.infradead.org
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Add RK3562 serial aliases
Date: Sat, 28 Mar 2026 13:05:46 +0000
X-OQ-MSGID: <20260328130546.25381-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes the stdout-path in rk3562-evb2-v10.dts.

Fixes: ceb6ef1ea900 ("arm64: dts: rockchip: Add RK3562 evb2 devicetree")
Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 arch/arm64/boot/dts/rockchip/rk3562.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3562.dtsi b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
index e4816aa3dae0..14e74e8ac7df 100644
--- a/arch/arm64/boot/dts/rockchip/rk3562.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
@@ -26,6 +26,16 @@ aliases {
 		gpio2 = &gpio2;
 		gpio3 = &gpio3;
 		gpio4 = &gpio4;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
+		serial6 = &uart6;
+		serial7 = &uart7;
+		serial8 = &uart8;
+		serial9 = &uart9;
 	};
 
 	xin32k: clock-xin32k {
-- 
2.43.0

