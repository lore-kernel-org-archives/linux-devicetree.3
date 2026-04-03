Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0327E35A3B9
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 07:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775201148; cv=none; b=mHrtTbb63PSdQaimvFStMZkDXcexoau6dCFbr1GYNFqxKkGXDI78gqn/6kAbIewjAMnS1Xxp2lBm1aOh75oTPHCxFn6glhQ46kVsnYVoT57wzrlOZy3XR29OlK2GImzwx6LtuGQ0AbBS3XXQToKfZLTk5MWQVTBe6ySaXeen+vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775201148; c=relaxed/simple;
	bh=neyVNCqfeY5aAbMqkc6Hoj+noHvEzztoGcjYBB2EZ0I=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tCxaWRK5cNXo9fYs/MwRuutJ6iI76fuwDFuZP5PI2oF07EUYOsvI+mLM7CGONfoqlaPIdE+0RdvPnAbXGjkeyfG/ENEHx23CDJblwnUh/095v6g8bSYyy5Wkwz/61VgvdZ+Yw/Bd/2h0KUXII9T5EqIuk3S/CF9fCnbgOwSB0jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=HFHWonGp; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="HFHWonGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1775201139; x=1775460339;
	bh=5pCTJfDYr/r1hxWMxjtsdEhq89JT5cAfvqasjnMXAVQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=HFHWonGpk9aE8W+tG0jj7FT5gRxUI96AMoxWku5LuYlA4y8ck0kEzGzEZ4DXRseQP
	 krLDNeRJOE7LSYPbWZEHj7c6u4ht6vl3c0FslsHAwqwwy5j1W53p76r0Vx2ORjf+y9
	 P+4MvDHnRGC6uiCWN/tuXGz+HPrlBOsbtYECiEfxK9e9O/Gtp0crxSB5x37C5jktYv
	 gNftONlJt12wd0tuPmjswECZgxuLgTB8NhV6ZwrFeQWhns2S/kyciGJwCa6OgT4+H9
	 qvtaKfknhnLUfsVpxrbUyf3b0/no4llk5p+K4h99hF62spJxYQpRVYJixXNTiFjj6V
	 7H/ZJhIYfDO+A==
Date: Fri, 03 Apr 2026 07:25:35 +0000
To: heiko@sntech.de
From: Clemens Malten <c.malten@proton.me>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Clemens Malten <c.malten@proton.me>
Subject: [PATCH] arm64: dts: rockchip: odroid-m2: Enable DisplayPort Alt Mode over USB-C
Message-ID: <20260403072408.44926-1-c.malten@proton.me>
Feedback-ID: 133261535:user:proton
X-Pm-Message-ID: 6e10c726fc4a3142f19f64eaf5dae528a9ac80d9
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Enable USB-C DisplayPort Alt Mode on the ODROID-M2 board (RK3588S) by
adding the necessary DTS changes:

- Enable dp0 controller (dw-dp driver)
- Add VOP2 video pipeline endpoints: vp2 -> dp0 -> usbdp_phy0
- Fix try-power-role from 'source' to 'sink' to allow the board to
  receive power and trigger correct PD negotiation
- Add altmodes block to the USB-C connector with DP SVID (0xff01) and
  VDO. Note: svid must be declared as a 16-bit value (/bits/ 16) as
  required by the typec class driver (fwnode_property_read_u16)

Tested on ODROID-M2 (RK3588S) with a UGreen CM654 USB-C DP adapter
under mainline Linux 6.19-rc.

This patch depends on Andy Yan's RK3588 DisplayPort Controller series:
Link: https://lore.kernel.org/all/20250822063959.692098-1-andyshrk@163.com/

Signed-off-by: Clemens Malten <c.malten@proton.me>
---
 .../boot/dts/rockchip/rk3588s-odroid-m2.dts   | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts b/arch/arm6=
4/boot/dts/rockchip/rk3588s-odroid-m2.dts
index a72063c55..dbc62f032 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts
@@ -352,7 +352,17 @@ connector {
 =09=09=09power-role =3D "dual";
 =09=09=09sink-pdos =3D <PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
 =09=09=09source-pdos =3D <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-=09=09=09try-power-role =3D "source";
+=09=09=09try-power-role =3D "sink";
+
+=09=09=09altmodes {
+=09=09=09=09#address-cells =3D <1>;
+=09=09=09=09#size-cells =3D <0>;
+=09=09=09=09altmode@0 {
+=09=09=09=09=09reg =3D <0>;
+=09=09=09=09=09svid =3D /bits/ 16 <0xff01>;
+=09=09=09=09=09vdo =3D <0xffffffff>;
+=09=09=09=09};
+=09=09=09};
=20
 =09=09=09ports {
 =09=09=09=09#address-cells =3D <1>;
@@ -952,3 +962,20 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 =09=09remote-endpoint =3D <&hdmi0_in_vp0>;
 =09};
 };
+
+&dp0 {
+=09status =3D "okay";
+};
+
+&dp0_in {
+=09dp0_in_vp2: endpoint {
+=09=09remote-endpoint =3D <&vp2_out_dp0>;
+=09};
+};
+
+&vp2 {
+=09vp2_out_dp0: endpoint@a {
+=09=09reg =3D <ROCKCHIP_VOP2_EP_DP0>;
+=09=09remote-endpoint =3D <&dp0_in_vp2>;
+=09};
+};
--=20
2.53.0


