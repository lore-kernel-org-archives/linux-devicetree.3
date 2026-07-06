Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F9938B7D9
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322318; cv=none; b=U6fidrIyqQeNjhkTJ4un8RheGs+HpM6z+67KlrXqUeSuFevbgipkG9/WiMB/IU7b31EbgmXT3nYywPYwR3t+CQRw5xIJPNm6grEmUOCPLj/+MVlYouKYeL3PZ89eO4ZweA6Nl5Ww6GMvs2E6ot75lWGCmmal/UEdTffx2IzboI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322318; c=relaxed/simple;
	bh=jRNpMW8CrhlRhfmjhjpxVZ6RQSMdInfKDYA3M4v4oFQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=irGcfzoKaLG9CXf6JvN4nA77BZPWZKfnPSdQlUGcDOJwDW4byX9x7RXxFYE5k6XNECL8MsWSRbOGxqkNbi2xJWvGjgWGSDzOSag2Z3yeKnqCLbRBlzDWAMcd+lFYjBGMQfVdT48oWNwD2HWrT/sXO+OVo5bMbIuZYQYjc0QaLpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4oosB5M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4oosB5M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4091F000E9;
	Mon,  6 Jul 2026 07:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783322310;
	bh=TE7JL1r3kee2eQLh9GIgE3X/tn8qDzxd84zk5ehgZrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L4oosB5M1zQE4C9sDGQRX80vvGpsJxJTOpwsEq4cIlxFbyCnNzRY8m0rK75LuAKVt
	 fyEFFr88C9s7sQrtk/lg+vzaHH1sqPr1tw1uS1BxMvbYLdRVHZdF+4KXAW0RdDV9wi
	 +CgRQQDn/5BAcY1T4CkccYSd7L4KYRlQLXzzbwt5bc4Rj9uv1HzoX/G0IqeoM76y1n
	 /jgZgktm6pRjK9EB7f454xEGTCld4FZwWj5pe7GKYeVNsrzo7Sv1zSbirR/foStb4X
	 uAkVXexoBqrdAArtoLnIWSzuphelrOGWJIXbuIIF64FWNZIxb6QZIrF4P7JSwfaOJW
	 qVu8w+CQ1auXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] dt-bindings: media: qcom: Add JPEG encoder
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Atanas Filipov" <atanas.filipov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706071113.383215-4-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-4-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 07:18:29 +0000
Message-Id: <20260706071829.BB4091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `power-domains` property is missing from the binding's propert=
ies list and the example, despite being a hardware requirement and function=
ally necessary for OPP scaling.
--

commit a2cb92d2a69d2918ed65e723421db5b5ac1f0d1f
Author: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

dt-bindings: media: qcom: Add JPEG encoder binding

Adds a device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.ya=
ml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> new file mode 100644
> index 0000000000000..e4c16388ef079
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -0,0 +1,151 @@
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8250-jenc

[Severity: High]
The commit message states the hardware has its own power domain, but the
power-domains property is missing from this properties block.

Since additionalProperties is set to false, any device tree attempting to
specify the power-domains property will fail schema validation. Should
power-domains be added to the properties list?

[ ... ]
> +        iommus =3D <&apps_smmu 0x2040 0x400>;
> +
> +        operating-points-v2 =3D <&jpeg_opp_table>;
> +
> +        jpeg_opp_table: opp-table {
> +            compatible =3D "operating-points-v2";
> +
> +            opp-100000000 {
> +                opp-hz =3D /bits/ 64 <400000000>,
> +                         /bits/ 64 <100000000>;
> +                opp-peak-kBps =3D <76800 104166 104166>;
> +                opp-avg-kBps =3D <38400 33569 33569>;
> +                required-opps =3D <&rpmhpd_opp_min_svs>;
> +            };

[Severity: High]
Does this example node need to include the power-domains property?

The example defines required-opps for performance states, but omits the
power-domains property that links the device to the power domain provider.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706071113.3832=
15-1-atanas.filipov@oss.qualcomm.com?part=3D3
