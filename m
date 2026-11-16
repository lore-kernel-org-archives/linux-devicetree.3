Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835899;
	b=5l0EENo4nxNPTFxkzhrCw+IOKYp4jYvIzW1cxAWub7wlT4ojKjKsVOYo6I7SpXFal1O8
	 4l2N+mvrEbcXQkWfoqINBbG6Wbpeo4WTOjAIVgSYLxgxiTFK3jq0H1yx9L7CPOwAX/AD2
	 CdouV7wK/KcZexUkerjEWqpzQ01Zt1jMt81ITmDMgsWovwsLSEcCaonu1h8J2BEEYlSHU
	 6cq68ngSUdWHD3l8tW9ZXml4qAyEc3Yg4oBcxjxelAIIz51kYfi7PwgEkUFgNTw0joAks
	 WbPgrexhigh/z9ZvRZ8QVZkExYRfM3pJvKOiCXAXwqbNWO0fYBCCv16Nvjr8C8lPd4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835899;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bjnLIEDd3fA8ZoSUDOtXlRcDA4ewkoBbdcAwv0SMyqU=;
	b=4+zv+dFT4sINvIEPQhwezgR+ZbizKcVHmXQyWpV1efMecE8EL61RNZNezXSNcw7QRVjs
	 e+hjDyLCOgY+X6xuRJmxBk5OJ2pGzeDESPTe+zckRp3jqmyLtzrXxFUiUFlE48KmRcmPc
	 qKkM/oh4kjne7Yc96NyuJDC0HY35xLWVZD5dtHtLfizc6CGbACdasxO+T+N3mt8U9c1V1
	 Ju1Q+RkSvbfaAJ20U1s9AZ+00Jj9J4hwpbTUPeMR2/VLbreZa7i39zSQKtoggL1VOMVt1
	 sH0R9kzUSI5YVeaAQzzdGJhFKwwbrwTI0V2uC9WclV7NEHm6F3rWcDSucXwlNdFNGsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="U/GVgjhZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BED606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U/GVgjhZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDC81F000C4;
	Mon, 16 Nov 2026 13:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794835898;
	bh=bjnLIEDd3fA8ZoSUDOtXlRcDA4ewkoBbdcAwv0SMyqU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/GVgjhZiOBJ+vyURcnofxYLjP5GaNk8a3Mbozn16PBrzfMDMCmFBwKLqno4An5Ut
	 8Y7zF/7TQtk41A8AohkeHlhwgj+xAUX1YYALIZADPahpvo7Wz97l8y+JyzPSX7rmNS
	 EQ1getkclLaN6V0220WHhJBImHQ9B71gJOF2t3Fo5sh2YteULPOPruM2SfNyEZY05w
	 6cEBsYAF8o80vLxEYb5h6+Mhi7K7z6X7L3SxxVZ1JZY2b/E4NGi0rvH7r/oylBUQt1
	 Al03+8zgbqpIBdYEJEhpJ76Me701My53lEPB2kaRBgx924Fjx00o4tyjm4u9+9pJHS
	 rc957NOulFzeQ==
Message-ID: <sashiko-outbox-217082@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/11] dt-bindings: display: msm: dp-controller:
 Document Nord DisplayPort Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261116-nord-drv-dt-v3-2-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
 <20261116-nord-drv-dt-v3-2-e3d3bf0e2c49@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 13:31:37 +0000
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
- [Low] dt-bindings: display: msm: dp-controller: qcom,nord-dp not in
  alphabetical order
--

commit 0ec7842c5ba3651d6f0a3de03165ad9984fb8e75
Author: Mahadevan P <mahadevan.p@oss.qualcomm.com>

dt-bindings: display: msm: dp-controller: Document Nord DisplayPort Control=
ler

This commit adds the qcom,nord-dp compatible string to the qcom,sa8775p-dp
fallback group in the MSM DisplayPort controller binding.

> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.=
yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 094a6383bb779..9be0288261e72 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -35,6 +35,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,qcs8300-dp
> +              - qcom,nord-dp
>            - const: qcom,sa8775p-dp

[Severity: Low]
This isn't a bug, but qcom,nord-dp should be placed before qcom,qcs8300-dp
to keep the compatible enum list sorted alphabetically like the rest of
the binding.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-nord-drv-d=
t-v3-0-e3d3bf0e2c49@oss.qualcomm.com?part=3D2
