Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073EA2931CC
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465548; cv=none; b=ko2YEi6ECuFJimgM5//fvMv/JzknyoHPr1Q7r9ojvvWQ1vZNfXwZ+M7tIlTfhyi3wsWduAgy6WNVekWsvcEiJ6Xt138aGmbRHKCLqxlNLLgI3gMVBKgAFjoLYog7Q1hzSFy+lBtg8u1YWmrlOdNdbWWKJuJ0hgLCgGYEkvOmwTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465548; c=relaxed/simple;
	bh=scT6f7bDgKh5dNEsMDVrzq3jZ1OdNr7S6p2nb8P2Cxg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o4VQ0hxt6xYzAXqTo7J2G7nXJg6CvC9ym27FGcShgbtewl5GNSlCOTA5Qo/rB6V76L6uYxAeC0X+G5Pzisszb1guFdDLcxe13+yuExznFPYP7+jRw8jNWbuwt/J3l1zJ12valim17AlbK6Sm8tyjKhfiaL1yvqRiYN9Jxh8PeQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ita/KmvY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ita/KmvY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404FD1F000FF;
	Tue, 15 Sep 2026 09:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789465546;
	bh=q/pFt56ExTpwWGzu64CkeimH82BXk/yya3wXMiIHc3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ita/KmvYobcQA4qObaZn0nxmSVWmwi8Hs7HeNXoABfWXIq5OrRDiZNVpahqc+2yJJ
	 5u4ndDoFQPsicgmLK2ZgOAWjlS7Fg/PqPNaKZuxCGJjSdpnk8EjNKtKj4R68wGydK3
	 WC8SBHIOFmi7cNjYRLBjqPEkTmbXGWtQ0W6hu/Gzocp3pb74OIFzqZal7y+PSUuOZc
	 khzzDo/ZHEyO4fNAS/+ZeTjTBSxacMq7vNSDy/CZKLBSK/+N5rLS4/koIx9a1Yba3W
	 Pv0IfjADqnz02+MaJpPisI8p+ZGa/MxonEOr6dmmgQOF6keIgYQzkm/RjPoeRa758n
	 LNSXyWJ66RORA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for
 qcom,nord-camss
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915-nord-v1-1-20db41a7f1ff@oss.qualcomm.com>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-1-20db41a7f1ff@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 09:45:45 +0000
Message-Id: <20260915094546.404FD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: media: Artificial limit of 5 CSI input ports in reg=
ex
--

commit ba64c074737d8584213f4eaf83a7f188c30698a0
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

dt-bindings: media: Add bindings for qcom,nord-camss

This commit adds bindings for the camera subsystem (CAMSS) on the Qualcomm
Nord platform. The hardware introduces a significant number of blocks,
including 3 CSID and 10 CSID Lite receivers.

> diff --git a/Documentation/devicetree/bindings/media/qcom,nord-camss.yaml=
 b/Documentation/devicetree/bindings/media/qcom,nord-camss.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,nord-camss.yaml

[ ... ]

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-4]$":

[Severity: Medium]
Does this regex artificially limit the allowed CSI input ports?

The commit message notes that the Nord CAMSS hardware exposes 13 CSID
receivers (3 CSID and 10 CSID Lite). However, restricting the ports block to
"^port@[0-4]$" limits the allowed ports to 5, preventing configuration of t=
he
remaining 8 hardware receivers.

If a device tree attempts to map external PHYs to CSID ports 5 through 12,
won't it fail schema validation and drop the nodes from the parsed
configuration?

> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-nord-v1-0-=
20db41a7f1ff@oss.qualcomm.com?part=3D1
