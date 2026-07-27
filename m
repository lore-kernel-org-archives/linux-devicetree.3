Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693AF373BF2
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162294; cv=none; b=M5daMJDd9WFVS7S7OsGlrhFRWwox5Of9RzdC/VFLteKzFAVm5LBhL0lDrhfFBqZ4SlNboPY+TqEjge88Az2thl3z++ioPm0DCVx+6q6mEfSLRZGRc+4hHvkgnmarnsKieOQTeMhuLEnkRty877Ifd4okWiaS2uEq5ZTE5OIk938=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162294; c=relaxed/simple;
	bh=+HCUnzkmUFDEKdFx9tRzr7ez2sjim8l8L4zdUFNKrdw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RZJSgVO2FMppxD0gVbMWBeo2Pb7xjSrEvqSwbsAQmsf11Q6ec1uegHV04kmO/zjI7gLCY50SfdNHqzO7Y0+nvB/X/KImdoOebdrFkdOjexLUSIgE0tITkkZr0UKIrmj8FaTU+hfn4bUsww4XxECtGGql9+ER8acA8Kja4ivMHnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKGhRGgi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKGhRGgi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7ABA1F000E9;
	Mon, 27 Jul 2026 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785162293;
	bh=7pb0Ch1SOw+EENHhlreRR+j3WqsT1y+15h40voJ5AzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TKGhRGgihTI0Lmfl4D1ALGX5EUl0yAzcIVdHC8kcy0NBEj+Nh2nwOm0CU0cGHkNfL
	 Xba7yeeMOYTzGHwnRkNAF6NGmotnNyT66HML7WNHhE7eJedIdwMO6/qycGGTiWb6pp
	 wO7g/INNm/NhAl84nGACbv95zt83Xsyb8bJkbdoOx6PCNM5ddq4QsMXHq5HEwpFTR3
	 TLDcfpysogiulsL/4CU2AXkrSx2BXxRlZjIWqyomZv6ED3PrulybDWyH2Zah/kvg9a
	 vgvxIlyh1c41DMkTgjErxGK1BfyKKT33lgWW1or9GfWdtLgXQ/39t4I6wlGhv6HqI9
	 +Da5XOW+iM6kA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Santhosh" <vishnu.santhosh@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com>
References: <20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 14:24:52 +0000
Message-Id: <20260727142452.A7ABA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added `bam-dmux` child node property is globally permi=
tted for all devices in `qcom,shikra-pas.yaml` instead of being strictly re=
stricted to the modem (`mpss`) variant.
--

--- Patch [1]: [PATCH] dt-bindings: remoteproc: qcom,shikra-pas: Allow bam-=
dmux subnode ---
commit 89fb4e8f474d6e08262116fc71b1347a3aaf92fa
Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: dt-bindings: remoteproc: qcom,shikra-pas: Allow bam-dmux subnode

The BAM-DMUX node lives as a direct child of the modem PAS remoteproc
node, but qcom,shikra-pas.yaml has unevaluatedProperties: false and
does not list bam-dmux, so any DT adding this subnode fails schema
validation. This patch adds an optional bam-dmux property referencing
qcom,bam-dmux.yaml to fix this.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> index 253b14eb2b598..17461d92165b2 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> @@ -44,6 +44,11 @@ properties:
>        - description: Firmware name of the Hexagon core
>        - description: Firmware name of the Hexagon Devicetree
> =20
> +  bam-dmux:
> +    $ref: /schemas/net/qcom,bam-dmux.yaml#
> +    description:
> +      Qualcomm BAM Data Multiplexer (provides network interface to the m=
odem)
> +

[Severity: Medium]
Since this property is added to the top-level properties block, does it
allow the bam-dmux subnode for all compatible variants in this schema?

The commit message specifically states that BAM-DMUX lives as a direct child
of the modem PAS remoteproc node. However, this schema is shared with other
variants:

properties:
  compatible:
    enum:
      - qcom,shikra-cdsp-pas
      - qcom,shikra-lpaicp-pas
      - qcom,shikra-mpss-pas

Could this permit device trees to mistakenly include bam-dmux under the
cdsp or lpaicp nodes and still silently pass validation?

Should bam-dmux: false be added to the allOf conditional blocks for the
non-modem variants to explicitly reject it?

>    glink-edge:
>      $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>      description:
>        Qualcomm G-Link subnode which represents communication edge, chann=
els

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-shikra-pas=
-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com?part=3D1
