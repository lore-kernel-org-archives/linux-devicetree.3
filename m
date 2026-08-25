Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF5B3E7BCC
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656669; cv=none; b=OmmtTRmZ9pXF1qBcuX+vJNN8vLW1DtlZ2HEKREiwHRAuHZB8+o5kIs+0E46vDherD34E/pIqwa/QQAunFOj6VV6arm88KcgQd8tSfTVt3GymZQP6kQ7HPV1sVrSQdRYosx+LYEBcaJYO31QC1KRRa4WhN1uap/Kukq4RHQjRZZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656669; c=relaxed/simple;
	bh=IPozr/DAmozhkEpoIvQznxdbu8IqrMGvjhYXWNL7VDY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XfPYRdyuVji4i5sqxIopvbQA2Vxgjhqoq/7aRt/mXzi+qUp4HzTwWcPAIaZ9NFeqFNeNTm+/qUg2TfX9b8sfMEzorNCQMwKm1sR5tNmx2wFhYTzQVH/pFwAvswuf3Tkm1zPFl5Rw5NfasIpcpx3jmreutPoG/gBIfjjqMa34GAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESeStfni; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESeStfni"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEE11F000E9;
	Tue, 25 Aug 2026 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787656668;
	bh=RlGqGSrlshna4xavX0l2U2naGDqGI8dH0VU9pAI2tng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ESeStfniEd6s4MaZQe6x9v64BHrF8sqAlYatyRV/N4rtm3rB7vPHUZeavLUQF6Xxe
	 8QKSBg3ua4VHdgzbu2p9izGo8sz3v7Xb1QyUSXHAH7Bb9bQoJIsx3i6kNU/MtVjS8Z
	 MHFVIKAbawPqk2EAXf4QWIfBwcviTVYOfNl/S+Y76eNmjdXg21APuGxpLlb3RO2C2O
	 7KTzh6VG993pGCZ4noUmvFIEgvuk15VUVOiFP3SLF/cipBoQf3zDQPCTrg4aRpUc3i
	 NY/PQgUqw5lDc9tinwIIIPQDo7OtXOmSgGj2CgyqtsSXJADnYib7NoCzKM7KJSU/yH
	 v3WBomI4Qidhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: mmc: cdns,sdhci: Add CQE support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rohan Joshi" <rohan1sj@cadence.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825-cdns_sdhci_cqe-support-v4-1-e9f72e338373@cadence.com>
References: <20260825-cdns_sdhci_cqe-support-v4-0-e9f72e338373@cadence.com>
 <20260825-cdns_sdhci_cqe-support-v4-1-e9f72e338373@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 11:17:47 +0000
Message-Id: <20260825111748.1FEE11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `else` block for non-Elba platforms lacks explicit `maxItems: 2=
` constraints for `reg` and `reg-names`, creating a validation loophole tha=
t allows non-Elba platforms to define an invalid third register.
--

--- Patch [1]: [PATCH v4 1/2] dt-bindings: mmc: cdns,sdhci: Add CQE support=
 ---
commit 48a4d35cce2e12157d9c52de4ba805fd4e404597
Author: Rohan Joshi <rohan1sj@cadence.com>

dt-bindings: mmc: cdns,sdhci: Add CQE support

This commit adds an optional cqhci named resource to map the CQE register
space. It updates the amd,pensando-elba platform to include this resource
while maintaining compatibility for platforms without the CQE block.

> diff --git a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml b/Docu=
mentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> --- a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml

[ ... ]

> @@ -131,13 +138,27 @@ allOf:
>      then:
>        properties:
>          reg:
> +          minItems: 2
>            items:
>              - description: Host controller registers
>              - description: Elba byte-lane enable register for writes
> +            - description: CQE (Command Queuing Engine) registers (optio=
nal)
> +        reg-names:
> +          minItems: 2
> +          items:
> +            - const: hc
> +            - const: bctl
> +            - const: cqhci
>      else:
>        properties:
>          reg:
> -          maxItems: 1
> +          items:
> +            - description: Host Controller registers
> +            - description: CQE (Command Queuing Engine) registers (optio=
nal)
> +        reg-names:
> +          items:
> +            - const: hc
> +            - const: cqhci

[Severity: Low]
Since the top-level schema was updated to permit up to 3 items for reg, does
omitting an explicit maxItems limit in this else block allow non-Elba
platforms to define an invalid third register and silently pass validation?

In dt-schema, an items list inside an if/then/else block does not restrict
the overall length unless maxItems is explicitly defined.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-cdns_sdhci=
_cqe-support-v4-0-e9f72e338373@cadence.com?part=3D1
