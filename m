Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E6247887B
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843626; cv=none; b=R6hNgaRNYOtMpfZJVr4XdGJtlI3Z/RZvuNVrB0jHFB+uQzHiBMF/YFHIgNBSMNeyQ5DmkuQD5q9tz7kr8oAFme6nFhljbVINelXZj53zCBO0EsLIhrSBV3sopaylFKvPD4YK0+3mTipu+RQ1cg3T2VKmpRaQh/6n7lE6ZAqYEEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843626; c=relaxed/simple;
	bh=l3OiUHNTGh0X5jbyDuvo/GS8MM8Dm9XJclFXUIRGDMQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G1GmshDYaWugwT5i4q6mqaAZ1PVF+hy8kxUfHt6RskN7JaojjpCPCsTB/rZx0CRo6BH/N7q1weJUTbu7/j+nPTaXmGtdKTxLRZpxZEN9667QdlypXmw2UxEIRaZN2y6i5py4ZfqB/TBgIRsshYAbwk5OqKKd++ZVZWaV7INTuMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loy/iqtQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loy/iqtQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13041C2BCB0;
	Fri, 15 May 2026 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778843625;
	bh=l3OiUHNTGh0X5jbyDuvo/GS8MM8Dm9XJclFXUIRGDMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=loy/iqtQpfFDu8cDmXqNdFNpjfSRoqWFDn0PtF4tBuVkMvRvt0AkR+z6grQrHHD4Z
	 SK/A63JYp9DFcRl63jQv+9Xt9/IK4Lb+rqoH8NZR7/fcClh4UjAwaIZDbhidC110n2
	 4dcjnUT7ux8WYJTT1juWxH2MlClZ4bdZ30osFprZhGmMKs2yjhs1u9SRuY5YjXoX+6
	 dOUWFnvQT1rvu4fMQHT058lwBvAORb5/fXG0bU5J20R+/YvIAFeHRtKhcY2fE2KvHV
	 x0x/Gex5NcwJcBviBrhCNfF++wqBw465LrPYLa0rEduNECJF1LhgRXS3RcxffUZwOK
	 UBwP2QST2xAXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3
 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, krzk+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org
In-Reply-To: <20260515-usb2phy-v1-2-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-2-5f8338d466bf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 11:13:44 +0000
Message-Id: <20260515111345.13041C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new compatible string `qcom,ipq5210-qmp-usb3-phy` was added =
to the top-level `compatible` list but omitted from the `allOf` conditional=
 block that enforces clock constraints for IPQ variants.
--

commit edd84912abfa4d10414e59ffbc64829f54fe7871
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

dt-bindings: phy: qcom,qmp-usb: Add ipq5210 USB3 PHY

Add dt-bindings for USB3 PHY found on Qualcomm ipq5210.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3=
-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb=
3-uni-phy.yaml
> index 623c2f8c7d220..bdb80371ea685 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-ph=
y.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-ph=
y.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,glymur-qmp-usb3-uni-phy
> +      - qcom,ipq5210-qmp-usb3-phy
>        - qcom,ipq5424-qmp-usb3-phy
>        - qcom,ipq6018-qmp-usb3-phy
>        - qcom,ipq8074-qmp-usb3-phy

Looking at the rest of this file, the other IPQ variants have specific
clock constraints defined:

allOf:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,ipq5424-qmp-usb3-phy
              - qcom,ipq6018-qmp-usb3-phy
              - qcom,ipq8074-qmp-usb3-phy
              - qcom,ipq9574-qmp-usb3-phy
[ ... ]
    then:
      properties:
        clocks:
          maxItems: 4
        clock-names:
          items:
            - const: aux
            - const: ref
            - const: cfg_ahb
            - const: pipe

If qcom,ipq5210-qmp-usb3-phy is omitted from this enum array, it bypasses
these specific clock constraints and invalid device tree configurations mig=
ht
silently pass schema validation.

Should this new compatible string also be added to the allOf conditional
block that enforces the clock constraints for the other IPQ variants?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-usb2phy-v1=
-0-5f8338d466bf@oss.qualcomm.com?part=3D2
