Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691649;
	b=Nfmug1kqjWDLN+PMOhydfQ2V9r+D9NduvZJI2UVvs3ICUD460j99YibXK2i/qjX8uItF
	 pqUyJtdudjiV/FpUKEwXjOsaQOc/0jxZdx4a335uAxW/XQeK/ihzNMU/qyriNtsH/Ri05
	 ++7oAZHM+cOO9gfhMXQW8BC7HQOArWP0DyNgwUhaNRPCf90v8rTKAQs13SwnVek1nCvxp
	 DHillVI1EXWox17IkV+88rDg2wGvhIeSumCkRIViR0k5mSMy+ShXHAkYzB9XgJY5u5wL5
	 ozmatobya2lQTrbiyNLyRwZgmvQaum5R30duEF91l48MpvfTkwuYu0QXGHxmGFPy9NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691649;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xhc2nJSV1hkMUyv54hignhDjR+Iw5x/3Z9F39M9ejTk=;
	b=tJZLnl3kbQ0KCwjgwTzoPNHLKk2+r+eYdzyz56jSMhc38KiL+IRkvbwDqYmJDjax2vqf
	 TX1CPPTJA0n/izMeScFMGUVqYQ+3Zo/dx4RKNiwxiyvE3l9Oqnn5gIGzVJjze5Ek3/3n6
	 SS+xHGsS9x5g5iz9QTUY75qY7u8b1ZJoWOms/SvYXNcq3yUkJL4WJgX3oK6/XsCgRDgm5
	 WvSbhrGL3ivvSG8e2A2NzX+SGui/5wizDy5uaJ42QFzOzSWKzEClbMQf4QHQPUTOLdBne
	 G8S6EHxrQ8uNSSbKLRLrkqUvZ1/gC6Us7lOarl9ufvfsomxTGf/ymSGtMdSNes6Hq+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eFT6MkMA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591CF606A332
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eFT6MkMA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D671F000D1;
	Thu, 26 Nov 2026 11:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691648;
	bh=xhc2nJSV1hkMUyv54hignhDjR+Iw5x/3Z9F39M9ejTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eFT6MkMAkVC/1VWz23oHbBVpAgF5VXbCY1Lq3yXtrROOZBfWQrCFc+K3LiuSm9++a
	 XIiWa/CTHlExbzD/TJgbFp/Z/z9enAZn9d+DHxuYQ9JMgahOBurn3ml+XiFi9D+vBF
	 0Wq+Fjf70vSot6dxPuB2wiUVtYaFKsM47FPCoiSaW1toV+KlQrj7nMeVUKAdik5IXI
	 uOykYXSdILgZij9Tmo2uTpqt8/a3YWJsP9ewzAJrws4SyAdn9HbVUxCRcVlBbao/VD
	 gTeiufPfrHdf5AMvHybJ2ToSeYGxRv44q/b6AC7gTsU4xudsehN1/hNFN3V8mhbsyY
	 ejjrMp7E7r8qw==
Message-ID: <sashiko-outbox-235352@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Add PM4125 charger node and shikra HS
 phy bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raj Aryan" <raj.aryan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-smblite-dt-v1-1-0f4f4401db3b@oss.qualcomm.com>
References: <20261126-smblite-dt-v1-1-0f4f4401db3b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 11:14:08 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: missing usb-role-switch on usb_1_hsphy in
  shikra-cqs-evk
--

commit d3868dd4e124d44a8cb64cb0971aab3bdb89598c
Author: Raj Aryan <raj.aryan@oss.qualcomm.com>

arm64: dts: qcom: Add PM4125 charger node and shikra HS phy bridge

This commit adds the PM4125 SMBLite charger node, enables it on Shikra CQM
SOM, and routes Shikra's primary HS PHY endpoint through an intermediate
connector/controller port pair for runtime USB role switching.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-cqs-evk.dts
> index 2ded25c4304e6..808f07218841c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -26,7 +26,7 @@ chosen {
>  };
> =20
>  &pm4125_hs_in {
> -	remote-endpoint =3D <&usb_1_dwc3_hs>;
> +	remote-endpoint =3D <&usb_1_hsphy_connector>;
>  };
> =20
>  &pm4125_ss_in {
> @@ -77,10 +77,8 @@ &sdhc_2 {
> =20
>  &usb_1 {
>  	dr_mode =3D "otg";
> -};
> =20
> -&usb_1_dwc3_hs {
> -	remote-endpoint =3D <&pm4125_hs_in>;
> +	status =3D "okay";
>  };
> =20
>  &usb_1_hsphy {
> @@ -98,6 +96,10 @@ &usb_qmpphy {
>  	status =3D "okay";
>  };
> =20
> +&usb_1_hsphy_connector {
> +	remote-endpoint =3D <&pm4125_hs_in>;
> +};
> +
>  &usb_qmpphy_out {
>  	remote-endpoint =3D <&pm4125_ss_in>;
>  };

[Severity: High]
Is &usb_1_hsphy missing the usb-role-switch property here, as added in
shikra-cqm-evk.dts?

Routing &pm4125_hs_in to &usb_1_hsphy_connector makes usb_1_hsphy the
remote port parent inspected by fwnode_usb_role_switch_get(), where
usb_role_switch_match() requires the usb-role-switch property to match the
role switch on Shikra CQS EVK.  Also, &usb_1 already has status =3D "okay"
in shikra-evk.dtsi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-smblite-dt=
-v1-1-0f4f4401db3b@oss.qualcomm.com?part=3D1
