Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB9F34E745
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 07:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902808; cv=none; b=vBJBCvEsLrJS+yn9TRjYPoO57UXnv4uurBTEhfCxNEnmoC48DELIDLb1cCaX0mFT96yOYBO3OkQj0aq2c2T0e9nwRQWkqc2aNgvaumc1xTWYjTAC1V3gnuQp4pdRNOgg1rI7dP5xMM7WWc6+HUh1tfk5zigXZvcZ/5CFAV6o0G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902808; c=relaxed/simple;
	bh=Ak1owQ5BX9MsCAeXdFVtSY0W68Ac8UBPiqbMXgXanr8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BhIo3yBc/3wCR/6Rk+QJ+SxVj6cCnjri7FJOw5NnHuPuv/6qPV5dOOfi8egxigFeM85tbykes7XgcEtNkqomx1bXt1iqaCuoY2UjD03oRle59QkIHfkk1sBv4WZ9FhmzRN6/MVjq2+MSXGwvsXrHADCtMj0qzes/GNne+TrIcUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvtSB+ND; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvtSB+ND"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A2E1F00893;
	Mon,  8 Jun 2026 07:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780902806;
	bh=Vet+Yt7W8IpTw3HV2qBEOyNlQqmzaMdonxzrFHRYbdA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kvtSB+NDkTd2a5IsCyMZk0z9OdMYP4rzW5P7bXQUNeI0CxTQAtGVZKuWoJA6m/8v/
	 hzyHMWyTEuxHckBPAdTWR02u2ruG35A+sIEYkPiRV4IVe4Bo0oNuAbNyke9Mk9Q5Sb
	 HPhLeT2mBJF6VV/ehE5Z/XwmMERzOSbKODtFf6NBgMr6X5hn0zdbEIXGPW+Eh1DEym
	 FpDC6srFtqMN2CFnwDFXhpVoqGHl0vqzajvdPZnd2SaL6cYNq20cF+NO77IzJN55rh
	 ZpNDBVTPJKClQTaibNHYk/SA6BDXzPigNnAk+gjMACcCAKfiYLmQssnark9J/h+HcC
	 q7MWIZBsN/ZwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: msm: qcm2290: Add Shikra
 MDSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
References: <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 07:13:26 +0000
Message-Id: <20260608071326.70A2E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The compatible string `qcom,qcm2290-dsi-ctrl` (and the newly add=
ed `qcom,shikra-dsi-ctrl` fallback) is missing from the conditional `if-the=
n` constraint blocks in `dsi-controller-main.yaml`, preventing strict valid=
ation.
--

commit 605ca9e1f594a8d64bb53c70c6ef6319fc95eeed
Author: Nabige Aala <nabige.aala@oss.qualcomm.com>

dt-bindings: display: msm: qcm2290: Add Shikra MDSS

Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
the existing qcm2290 bindings to cover Shikra by adding fallback
compatible chains for MDSS, DPU and DSI controller nodes rather
than introducing a separate binding file.

> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-m=
ain.yaml
> index a24fcb9144181..08a6668d3ca78 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.y=
aml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.y=
aml
> @@ -46,6 +46,10 @@ properties:
>                - qcom,sm8650-dsi-ctrl
>                - qcom,sm8750-dsi-ctrl
>            - const: qcom,mdss-dsi-ctrl
> +      - items:
> +          - const: qcom,shikra-dsi-ctrl
> +          - const: qcom,qcm2290-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl

[Severity: Medium]
Should qcom,shikra-dsi-ctrl and qcom,qcm2290-dsi-ctrl be added to the
conditional constraint blocks lower down in this file?

Because they are omitted from the conditional blocks governing 6-clock setu=
ps,
the schema falls back to permissive defaults (3 to 12 clocks). This allows
incomplete or invalid device tree nodes for Shikra to silently pass validat=
ion.

While the missing qcom,qcm2290-dsi-ctrl constraint was a pre-existing issue,
adding the new qcom,shikra-dsi-ctrl compatible without ensuring it has stri=
ct
validation introduces this permissive validation bug for the new platform.

The block enforcing these strict limits starts like this:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,msm8998-dsi-ctrl
              - qcom,sa8775p-dsi-ctrl
              - qcom,sar2130p-dsi-ctrl

>        - items:
>            - enum:
>                - qcom,qcs8300-dsi-ctrl

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-shikra-dis=
play-v4-0-88a846afdd5d@oss.qualcomm.com?part=3D1
