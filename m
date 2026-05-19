Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3A43D34AB
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177942; cv=none; b=bRPu2/4btLOQE6B5OQ1TNafMO9i0AX0tKSVfa0mA2E4geQ1BhjBg5RVi2eCOFvm9U3CXy1ws+bpOSKC/5zJGJlW4uvt4BUewfpK5poTXwG5b48TSOq9YY637KpwMS5/ekWiGMCJCYHTwAA5hbfnjfHiJNHDELjP0KAKsxZytJv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177942; c=relaxed/simple;
	bh=ig3QEDpIdg/F+KqGHkhtMI54kRnCo5NK+n44OJWojMQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eUH42kKyfAS5rIC/BjftVjz2Iv/6O7uUoDDVjAFWpxXjzBQdekU0SEwwdTgAfrXPkSFU78WxH6PPRx1glAz6UtWeGK/tsMQOXrRFb0eILbi1NVjaF9I4Wk8t1OnB4C+c1t4Z2e8iHfJcXcf4stb2fqQnV/VbQhFOnC15gFl1DXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rrB1bi1U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rrB1bi1U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8641C2BCB3;
	Tue, 19 May 2026 08:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779177942;
	bh=ig3QEDpIdg/F+KqGHkhtMI54kRnCo5NK+n44OJWojMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rrB1bi1UozphqkYwgWPp2BwpeF6zs5djM6UiRr8FWyQS8EvSvJMEJQtSs6dYtqY1m
	 PlVJk1ZhOqAnvEJ8n7gI9neBqfHw2dn0M4ZCGgC+CMXPPknJkB9IqXfu/c55cfmyWy
	 UaCS3VtmFQnXZevM52PBnOAryXv7Km/h+wWBTiRVo41BFCl24+fw/Gu4wgNEPAbeKM
	 iBkH///4z13JQU3tFjSE8N/xOOFsdDOYmm1ukvmVahsfQkNvCQi68oVe/mWHaBPsxv
	 ZSmT0pKWG2W5WlwuCqLFtulKvHo0kkaZWpb1co23U1biWfEL9xPdMzzGjh1n6uFt2k
	 DWdLmNwi9c+UA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519-knp-soccp-v6-3-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-3-cf5d0e194b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:05:41 +0000
Message-Id: <20260519080541.E8641C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `IPCC_MPROC_SOCCP` macro in the device tree example is defined =
without a value, resulting in missing cells after preprocessor expansion.
--

commit c89000efc2f275ab2ba31c246a7d1434f0474696
Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

dt-bindings: remoteproc: qcom: Document pas for SoCCP on Kaanapali and Glym=
ur platforms

Document the component used to boot SoCCP on Kaanapali SoC and add
compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
the "qcom,smem-states", "qcom,smem-state-names" in the pas-common
and add maxItems constraints for SMEM properties in the documents
that reference to pas-common.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-=
soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapal=
i-soccp-pas.yaml
> new file mode 100644
> index 0000000000000..ce18460a949fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-p=
as.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +    #define IPCC_MPROC_SOCCP

Does this macro need a dummy integer value assigned to it, such as
#define IPCC_MPROC_SOCCP 19?

Since it is defined without a value, the C preprocessor will replace it
with an empty string when expanding the cells below.

> +
> +    remoteproc@d00000 {
> +        compatible =3D "qcom,kaanapali-soccp-pas";

[ ... ]

> +        glink-edge {
> +            interrupts-extended =3D <&ipcc IPCC_MPROC_SOCCP
> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            mboxes =3D <&ipcc IPCC_MPROC_SOCCP
> +                            IPCC_MPROC_SIGNAL_GLINK_QMP>;

Because IPCC_MPROC_SOCCP is replaced with an empty string, will this
result in a missing cell for the client ID?

This would cause the properties to expand with a missing cell. A real device
tree using this structure might fail dtc compilation with a cell size
mismatch warning, as the ipcc hardware requires 3 interrupt cells and 2
mailbox cells. The generated DTB might also be functionally incorrect since
the required client ID is omitted.

> +
> +            label =3D "soccp";
> +            qcom,remote-pid =3D <19>;
> +
> +            /* ... */
> +        };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-knp-soccp-=
v6-0-cf5d0e194b5f@oss.qualcomm.com?part=3D3
