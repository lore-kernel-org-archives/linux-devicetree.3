Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB274718FA
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141684; cv=none; b=mZrnZUrEHQ8nO2nETyaZKLiAvIO4drndbfiKIGlWt94Lzw/0WWS0iuDKJEnIw/yoLsShgksXEeKz9Vtw8ZFG2X10Yy7GemzorPWyvKQg8j/+9rG7/1PE4pxFA4eMsmxEBOUyddew7UUETY4KR4ofsmP58m1qlW8IzHOn7BaBAQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141684; c=relaxed/simple;
	bh=uYdc3QlF+AdfeiDoc6H/72Z8/smu/8wRvVPjckdFz/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KfYTqX0hbmO07OSAebbGpqPjGuX2mQCIkn5GFxwINEndhMvyGih5cUu8zrGQA5WoJVTvlffZSm/1dDHgg/6noTwF5qtug59yfP96rE1Is4Z8zt5k//VgTeiUXwzNwd+Q0bBIrWgHvDgbfCG2lY45WmBHjIP0XfpFBOdQIdC+GRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuL64Pzy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuL64Pzy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5BC1F000FF;
	Fri, 11 Sep 2026 15:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789141682;
	bh=29OprxAPqi5wkQdmCwOPfHZCMWnAwiooD7Yj6cqzeLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kuL64PzyQOhfjeyezsUmcH6IbvRMFPwATuvG3P31zI/l3c0nPO4f59yuJ/2NwvU/W
	 OnwJY1mu/xY3ohQeoN/KHbQKe7Z+08uxQwmPB1icFTlyaS1VKJeTzalXlZ5XVnulDa
	 kUbe0utMqcVxlg2gUEzBsl0OINE5QFfbyP2793r/hGcCa1/5HzeQxoMKnAQTwwcOSZ
	 7xYaw2NmTlOo3xJNWgf/fOtd/oQpjIlv2sl7YalwpvMoVUu7e8Rq+i7paYSMsgmMc/
	 /ieOdOVDS5gnDZULosHgqAFC4VA7m18Hei41pZHDH0nt1r6gtNDKmycLN0ByMxBuZL
	 KOo0bXsrRCnxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/17] dt-bindings: phy: qcom,edp-phy: Document Nord eDP
 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nabige Aala" <nabige.aala@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, dri-devel@lists.freedesktop.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260911-nord-drv-dt-v1-1-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-1-e25c073cf1b6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 15:48:01 +0000
Message-Id: <20260911154801.7D5BC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new compatible string 'qcom,nord-dp-phy' is omitted from the=
 'allOf' conditional block that enforces the 3-clock constraint, causing it=
 to fall back to the incorrect 2-clock constraint.
--

commit 325c210ca82765c8807b8dc10d9ca6c4f986b06b
Author: Mahadevan P <mahadevan.p@oss.qualcomm.com>

dt-bindings: phy: qcom,edp-phy: Document Nord eDP PHY

This commit adds the compatible string for the eDP PHY found on the
Qualcomm Nord SoC.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Do=
cumentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index 0bf8bf4f66acf..91d7a5c8e19af 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -19,6 +19,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,glymur-dp-phy
> +          - qcom,nord-dp-phy

[Severity: Medium]
Will this compatible string incorrectly fall back to the 2-clock constraint?

Looking at the allOf block later in this file, recent hardware generations
requiring 3 clocks are explicitly enumerated:

allOf:
  - if:
      properties:
        compatible:
          enum:
            - qcom,glymur-dp-phy
            - qcom,sa8775p-edp-phy
            - qcom,x1e80100-dp-phy
    then:
      properties:
        clocks:
          minItems: 3
          maxItems: 3
    else:
      properties:
        clocks:
          minItems: 2
          maxItems: 2

Since the Nord PHY utilizes a 38.4 MHz CXO reference clock, should
qcom,nord-dp-phy be added to the enum in the allOf conditional block?

Without it, device trees providing the necessary 3 clocks (aux, cfg_ahb, re=
f)
might fail schema validation, while incomplete ones providing only 2 clocks
could silently pass via the else fallback.

>            - qcom,sa8775p-edp-phy
>            - qcom,sc7280-edp-phy
>            - qcom,sc8180x-edp-phy

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-nord-drv-d=
t-v1-0-e25c073cf1b6@oss.qualcomm.com?part=3D1
