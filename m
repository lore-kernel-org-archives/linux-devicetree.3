Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472703264F1;
	Sat, 21 Mar 2026 17:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774112440; cv=none; b=b/SQWdz0cIf1tkwFMMtE2gSl9/ncgWERTgjJcjk/ipB65mcbUJCuaNkUTb5DFeQtPxj7rIkCFe3jAZRO1oy4KEMS9zSX+3bxE8dEk0bCWp5DelXqFfRRnm4pD4SPDFUR2G6vkIi0VqxmvpmKuUFLNowps8Qeb5IB7q+cQY5+UME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774112440; c=relaxed/simple;
	bh=16WT+dWlu48Do9AHQpanNt3jkbXXPxdo9v00mO3bebk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AAT583f3CY758GuqYNynPjQpXNnsJ+qOjBPeuB1FwIOqwszNBk9xr/ThNKGZgHtjpYboSagvm6UwAzaSs1Q6ix0eXMBHcLECXrV+xPv4rz7BmPxJgQ5AYV44VHl2bkk1byq4COs44VAlwnIjZsiuYWdctLAZNe8LiTHof7eHoIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=AL1xUTN5; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="AL1xUTN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774112436; x=1774371636;
	bh=bwALxwerlNLw3tnoBJemo1zGo2hLr2iyPXbmgtW0Buc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AL1xUTN5nq7crEX4wrFY7X7lC5hQoo901Xnan9oceskp8WNN474Y/ue9KetWuJChz
	 r7enjn7V4WuzlC2jbofVp/ck/ABJaFTKpcXx+sz8XuQeV2cXwih519TTZZZb3++cl1
	 rHsu9tByMML83DsFOZ3RJTWDJ/1UIo8hJ32n7VxAzvmwZQyH1e+V0z1tIP2+gvuEMN
	 mAiutyIsZCZLE+BnC3XQ2TktbqgaCtQOXZ5l5hx5y4BlfErH2c54VSA6Qb1lR+ftxi
	 f/6sl8Tcq9pgFu8bqTq3Np0JHy0xDqViNOTNDvSTBRZTCXaLny4JZVDVhg6C9gyaZw
	 mMwG/SU5RQyxw==
Date: Sat, 21 Mar 2026 17:00:31 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/3] arm64: dts: qcom: milos: Reduce rmtfs_mem size to 2.5MiB
Message-ID: <20260321-asteroids-v1-1-4b902901cb49@pm.me>
In-Reply-To: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: fddc6c2422d85dd0433e49d77794fd86dd620a2e
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The rmtfs_mem region is currently sized at 6MiB but the default for
milos downstream is 2.5MiB. This causes remoteproc crashes on devices
that expect the smaller size:

modem_ac.c:281:Access Control Error: Could not protect the region specified=
:Start:e1f00000 End:e2180000, PID:1

Reduce the default to 2.5MiB to match the QCOM downstream config, and
override the size for FP6.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 4 ++++
 arch/arm64/boot/dts/qcom/milos.dtsi              | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/=
boot/dts/qcom/milos-fairphone-fp6.dts
index 52895dd9e4fa..c0981ab731c4 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -724,6 +724,10 @@ &remoteproc_wpss {
 =09status =3D "okay";
 };
=20
+&rmtfs_mem {
+=09reg =3D <0x0 0xe1f00000 0x0 0x600000>;
+};
+
 &sdhc_2 {
 =09cd-gpios =3D <&tlmm 65 GPIO_ACTIVE_HIGH>;
=20
diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom=
/milos.dtsi
index e1a51d43943f..915642498516 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -640,7 +640,7 @@ cpusys_vm_mem: cpusys-vm-region@e0600000 {
=20
 =09=09rmtfs_mem: rmtfs@e1f00000 {
 =09=09=09compatible =3D "qcom,rmtfs-mem";
-=09=09=09reg =3D <0x0 0xe1f00000 0x0 0x600000>;
+=09=09=09reg =3D <0x0 0xe1f00000 0x0 0x280000>;
 =09=09=09no-map;
=20
 =09=09=09qcom,client-id =3D <1>;

--=20
2.53.0


