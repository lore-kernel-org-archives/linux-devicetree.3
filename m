Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4C352036
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499559; cv=none; b=Btb0XfiTqHQcrmi1JmBX2gJdWZ5nDSB4kzz1jCa3aiKKKgLumXuQ4DNAZWH/ocy0tFgI+3t5AHdEfiVl9c9wun11hGHF5VMhyKZMzVaxTBHDzN9wb0osU5m9YdO9UqZmIwpWBI9O4mS49i6RDdSv5jy/Lvns3VSyLnQXwVvgPfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499559; c=relaxed/simple;
	bh=mEDPuxMpSUeuNsblkztjGAYI3C/ClwPU0CmZM6UQbDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M/s6CJdtBvfkSekQIgA9WPrFFZ9SLgWWDor0krf+Dv0qlZFq83tS5jT+7cYuKH9mokzHswUgiS3k1IwIC4BELbK0YaRprsg6+slINzwNJP0b6tAtF9a0Qz8qfwOCL9K1WDJWBwhZhKfL/i+a0tYl2b/g1SfcKhzNvyJgaGo6fz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Azmlu0kA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Azmlu0kA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455621F00893;
	Wed,  3 Jun 2026 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499558;
	bh=lLu+UnTtPhJV4GYDiwJGg8aoMwozwh4lLKh8s+EGGBw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Azmlu0kAkct4YVUhtGap3kGLf3juf2/peuA9HEIGW5Jscc4FMmd1nLO5UHzXgQPYK
	 /bgx22peR2PmMrdgMCUBIjw5Hh0R/yDqn5GaS9B/JSNzLHPr61iI0XUjkkPa/J7pQl
	 6NUL8YStFU/TiGBeL8KO4mAtwUNL8+/g2kuXe07evNf0uAe2DRwkKhjJqKPrFsR/pO
	 ZPqiR7+n6S6P5H/zclkf/ECODcUQnp+j0YCvK5Oae/dxVMIFdfFIHgz3+d6Okw95z3
	 tNGgyEweISrKd4jtKUYkzBfjJeC3Kd18OIAUGz2sKy3dq7hw/GhJmwTtGNqCedFt76
	 zUuAjL4YqogTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603-shikra-display-v1-1-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-1-aeac1b94faa7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 15:12:37 +0000
Message-Id: <20260603151238.455621F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing 'allOf' conditional block update for new compatible stri=
ng `qcom,shikra-dsi-ctrl`.
--

commit b5545b2692efb6a451931fc9c3057819063bbe07
Author: Nabige Aala <nabige.aala@oss.qualcomm.com>

dt-bindings: display: msm: qcm2290: Add Shikra MDSS

This commit introduces the Shikra MDSS and DSI hardware device tree binding=
s.
It adds the qcom,shikra-mdss, qcom,shikra-dpu, and qcom,shikra-dsi-ctrl
compatible strings to existing binding files, sharing the hardware definiti=
ons
used by the QCM2290 and related displays.

> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller=
-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-m=
ain.yaml
> index dbc0613e427ed..a2f3e91104af3 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.y=
aml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.y=
aml
> @@ -33,6 +33,7 @@ properties:
>                - qcom,sdm660-dsi-ctrl
>                - qcom,sdm670-dsi-ctrl
>                - qcom,sdm845-dsi-ctrl
> +              - qcom,shikra-dsi-ctrl

[Severity: Medium]
Is it a regression that qcom,shikra-dsi-ctrl was omitted from the allOf
if-then conditional block further down in this file?

Since Shikra shares the 6-clock requirement ('byte', 'byte_intf', 'pixel',
'core', 'iface', 'bus') with related platforms like SM6115, it seems it
should be included in the allOf block that enforces this:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,milos-dsi-ctrl
              - qcom,msm8998-dsi-ctrl
              ...
              - qcom,sm6115-dsi-ctrl

Without updating that block, won't dt_binding_check fall back to loose
top-level constraints and silently permit invalid Shikra device trees to pa=
ss
validation?

>                - qcom,sm6115-dsi-ctrl
>                - qcom,sm6125-dsi-ctrl
>                - qcom,sm6150-dsi-ctrl

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-shikra-dis=
play-v1-0-aeac1b94faa7@oss.qualcomm.com?part=3D1
