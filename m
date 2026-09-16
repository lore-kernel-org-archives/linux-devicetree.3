Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0C74D9558
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583803; cv=none; b=dlfdxovVPDo20Dy12EePc/k71yohudnnd56iluc47dNn2siWln8t5ZCJnb9aFoi5D3Q7DJNXISvhp1yeleJYMiz8aDPb9jNwCZoqeB6Nzsy23rVsLWc57dUR/Tz3n5mPKPuP1NPw27arhqx9NIetwqsHAD51eErqYyRZqrYgpJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583803; c=relaxed/simple;
	bh=Q01pIlRpe9gz1SQywDsc+oNDy/M7+DUlgJsKOvIor7g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MboeXhP+hi0sXUfpzdcElERZxGQU9uvSPORqlem/jwEiAOjvanMcoodcgZ+SJPuHOwd1iilrmOh4dEazBf9f1ZWmsN6cmd228VNyaCKvO33XvoxksRoZn6AqDB7bvyWPdm4GFGZAumnx6uZ8hdyd3AaCOlzwulcrGmi5da0kf48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zfa4I/i7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zfa4I/i7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4AA1F000FF;
	Wed, 16 Sep 2026 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789583783;
	bh=tZol8Hpy5KiTOodSCq7FLSPvYtue/9pyvo0ofcl0duA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zfa4I/i7d609vjaNVsH1d4LSuaQ0el5yG3NB/iBdd0KdyTKHq9hihLUOTYvo0Ze+Q
	 WrSSMFJ/yJmawYoQj7bjjnQMhjw4fHCK9WhDY1EHICKM8ugc+QmTw1+IiHoB7BcAcK
	 NZEAn2ivV8niquc1So12IpGFZdri2Z1Vx+8ITN3c/m96C8zJeEooaGN1BDYQjVrfAt
	 5LwYrJ7RZBGtKi6c1iQVX+LCU/goosWIM46hRGKqOLjYtGBYw9I9kZnVTye0oscx38
	 mmf4LVIcA3vpj4quFIiv8LmCpVoi1krjvl+oh8iyeQpjUdjSeWusCyeGdX6LOCVGZ6
	 mgr9cdnURyRPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,snps-eusb2-phy: Document
 the Nord eUSB2 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260916-nord-usb-phy-v2-1-2c8461bb30e6@oss.qualcomm.com>
References: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
 <20260916-nord-usb-phy-v2-1-2c8461bb30e6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 18:36:22 +0000
Message-Id: <20260916183622.8B4AA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: snps-eusb2-phy weakens validation by dropping required=
 resets
--

commit 40f3e2fd7afd242254a8fb682a03903a7a5acc6d
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY

Add a compatible for the eUSB2 PHY found on the Qualcomm Nord SoC. This=20
commit removes the resets property from the globally required list, as the=
=20
Nord SoC does not have a dedicated PHY reset for the HS-only USB20 tile.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.ya=
ml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> index 096f6b546632e..7fe8c82db38d8 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
[ ... ]
> @@ -64,7 +65,6 @@ required:
>    - clock-names
>    - vdd-supply
>    - vdda12-supply
> -  - resets

[Severity: Low]
Does removing resets from the globally required list weaken validation for
the existing SoCs?

If a device tree for older SoCs like sm8550 or sm8650 erroneously omits the
resets property, it appears it will now silently pass schema validation.=20
Would it be better to add an allOf conditional block that keeps resets in
the required list for the older compatible strings that still mandate it?

>  additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-nord-usb-p=
hy-v2-0-2c8461bb30e6@oss.qualcomm.com?part=3D1
