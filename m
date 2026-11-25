Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591234;
	b=28TfMsRzNDSw10+YqcaRT4oOLky3xtszi2bY/QHKVwBH8rUZsidHgnUxDuy0eutBYxVA
	 jTA2sO/WfzUBMzh8env1QlSWHediU50qhmJdexNj6MtL32dg9q7ZZ/TRcSkNk92ei7hFB
	 2PedaxHiX8QzefIDrtTWw2pERJRE6QSt0quKfrnQ2jnyq0sJts5Pm3uvDj09FafvTNywa
	 d8rlkitD9pqoJ1uboAYZS4bWN3TSDMAoakaCiMDHyPb7l5higBKjuoIqPa2LdsotAIBni
	 Ba2ZU47qwGhTGGAANTard5PA87mS6tyHnGz1VkYM8cB/M+PrRQao9Slnuqujp0Saoow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591234;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zR+ZS3RFnMXyWgWm4jgzl2ojfk5jm0nYYCR8YIToedw=;
	b=kXwErvtJTEcKWBh7qQpbEn/3M0dcYDorlDRMpcMzQwV4F2OwPmEkqRhtjJWSHnirDR/6
	 A51Fr/4AV6GqL9bceKpNcsuiwK5R0CeCEQ2wMx+B0+0LJzimPmnmdkT3Hvl0DK2+dOdzG
	 ZFB26CnSG+3gfncO/bGfswQ6JMmPaeD45DLqEQShSBKmR/I2sRA0NNHBjXR34+cyaz7QY
	 IeCk/efq/Vht9Idm49Uvy7zM41itAIsijPnME17+qM9dss6vlUGGyQh7qtitPVCHapJJL
	 OTEX+GIx7oP/1kL1Z5EOFHfGEBKhmNQXOrLQP22zlK8J9IzVJbjr7+YbzfEmtCpVKbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eaeOMGEp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE71606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eaeOMGEp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C301F000CA;
	Wed, 25 Nov 2026 07:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795591234;
	bh=zR+ZS3RFnMXyWgWm4jgzl2ojfk5jm0nYYCR8YIToedw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eaeOMGEpDpUIaYcN52wcgb4RHYlNJPU206eYgQ1ztjtCly4d9c02OX50xt+gB/WNX
	 AbnDIgvDhJseEPnBHiGRLuvRsjPiywH9YbVoLAYS/PgT3yBH2JX1R1diVS57Dbzua5
	 HYF7jtoVok1U9UJni9aFH9VNNIP4k1zNyhJvhL78v7IklFRbT2joWZ7yvyOjc/k24X
	 YLiffoQfLoGjptEJRKBkb19nAJFhjvNk+UauKVolvZ4ggcVTNxOV+wdVNgtH9ec0t2
	 RwZL8U3hLioDF+Kn2rPNLsyZx4ueXLmHmXyJmEQOwohjpXkv07seFXpjLcHspqCD+F
	 jMUvX6l5GikCQ==
Message-ID: <sashiko-outbox-232771@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ruchira Revdekar" <ruchira.revdekar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-talos-lyra-evk-v2-v4-1-73d768714a5a@oss.qualcomm.com>
References: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
 <20261125-talos-lyra-evk-v2-v4-1-73d768714a5a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 07:20:33 +0000
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
- [Medium] dt-bindings: arm: qcom: missing SoM compatible and
  unaddressed v3 feedback
--

commit 953678badeae0044d4d7bb640f965fa1383fc4ea
Author: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

dt-bindings: arm: qcom: Add Talos Lyra EVK board

This commit adds the qcom,talos-lyra-evk compatible string to the
qcom,qcs615 and qcom,sm6150 board enum in qcom.yaml.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index 121ca557ce1ef..d0e30d6c1d4cd 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1089,6 +1089,7 @@ properties:
>            - enum:
>                - qcom,qcs615-ride
>                - qcom,talos-evk
> +              - qcom,talos-lyra-evk
>            - const: qcom,qcs615
>            - const: qcom,sm6150

[Severity: Medium]
As reported by Krzysztof Kozlowski on v3 [1], should the Talos Lyra SoM
have its own compatible string between qcom,talos-lyra-evk and the SoC
compatibles?

The series models the Talos Lyra SoM as a modular compute module
(talos-lyra-evk-som.dtsi) mounted on a carrier board (talos-lyra-evk.dts),
and sharing the QCS615/SM6150 SoC with Talos EVK does not remove the need
for a SoM compatible when the SoM can be paired with other carrier boards
(similar to qcom,eliza-cqs-som or qcom,purwa-iot-som in this file).

[1] https://lore.kernel.org/r/20261027-whimsical-russet-marmoset-f248ba@quo=
ll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-talos-lyra=
-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com?part=3D1
