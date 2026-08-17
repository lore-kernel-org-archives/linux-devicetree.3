Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E563E49EA
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961820; cv=none; b=Y2r+1lLfY/xX9u+7DfUgzU+yvCHoI3zR6b6v2b7eWNWH+lKbalwX8KwksZEgXM27D5qrNUBPYW2soGvbd6duPAaNK5KQgV4aCwMgO9zM8+u2gRQu341+lsaBAQYTWEYMesKW5y7h+cKK8ui5/shiMD2slfpeg1aGgczMvhIIs3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961820; c=relaxed/simple;
	bh=n5RwzXImVqCXrmF39olJE4DBBaOOg/lyePmNQMLZDi4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tQSHLJUCPInlqJLZYpmnwTYuEwmpTgX9oVvMj/xWkJGiZXwPRjDACRYgkDBS9n3dzjE3AI97Exe3t/wABQAFkycQ+pA0Yxnsjz36w4m4RMjHGMxbLC9VtCtDJX/f9q0AODilxcS8GjdNw0w+aq/YOuvLohOM9njRPEW7Vw6+BOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwbsdTE9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwbsdTE9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BE71F000E9;
	Mon, 17 Aug 2026 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786961818;
	bh=cWPfn1LeEdyOE8egTwM82m0r8n/K74UsxiF+2DK1lXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iwbsdTE9Z1dlRr5eT8uNDc+XuhyKGhsM6TAgMAZx4aBoPQSc872EySHoGpXakUxRK
	 zBYfjQ+34FxkwLnIi808halpGQlz1DVy8rKIKmTgBymxHDLutWPJozsTOUMn37NbWk
	 YWXCdGdHcAhSkXD6oTadYn7P8kr/Zh68649OomDd5mEDU88vE22luNopd3vxKvSY8u
	 dvnKfJ4YLTREBLgPo/phM6IuHGLIJGBrS0uJNm8gEo/3j96qiXfzdYCGoRlHPXnj/T
	 W1FBBWCmOzwf0iybxMTJl+iQdbWCtLV2TPhT5ZtBYQ4l8v6LvydSZHXg8DG05QwiVb
	 RskQu81fx1K3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: Add
 exynos5515 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aiden Isik" <aidenisik@member.fsf.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817-for-next-lucky7-chipid-v1-1-eb2908705c0d@member.fsf.org>
References: <20260817-for-next-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org>
 <20260817-for-next-lucky7-chipid-v1-1-eb2908705c0d@member.fsf.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:16:57 +0000
Message-Id: <20260817101658.75BE71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete support for Exynos 5515 causes driver probe failure
--

--- Patch [1]: [PATCH 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: Add =
exynos5515 compatible ---
commit 5ce6d6fa94d63e1a87277e33f24686ff951995c4
Author: Aiden Isik <aidenisik@member.fsf.org>

dt-bindings: hwinfo: samsung,exynos-chipid: Add exynos5515 compatible

This commit adds the samsung,exynos5515-chipid compatible string to the
exynos-chipid device tree binding. It specifies that it should use the
samsung,exynos850-chipid compatible string as a fallback.

> diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chip=
id.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.ya=
ml
> index b9cdfe52b62ff..619faf33214bd 100644
> --- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
> +++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
> @@ -25,6 +25,7 @@ properties:
>        - items:
>            - enum:
>                - samsung,exynos2200-chipid
> +              - samsung,exynos5515-chipid

[Severity: Medium]
Will this compatible string cause a probe failure on Exynos 5515 hardware?

Because this binding uses the samsung,exynos850-chipid fallback, the
exynos-chipid driver will attempt to probe on Exynos 5515 hardware.
However, if the Exynos 5515 product ID is not added to the soc_ids array
in drivers/soc/samsung/exynos-chipid.c, exynos_product_id_to_name() will
return NULL:

drivers/soc/samsung/exynos-chipid.c:exynos_chipid_probe() {
    ...
    soc_dev_attr->soc_id =3D exynos_product_id_to_name(soc_info.product_id);
    if (!soc_dev_attr->soc_id)
        return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
    ...
}

Does the driver need a companion patch to add the Exynos 5515 product ID
so that it can successfully probe rather than returning -ENODEV?

>                - samsung,exynos7885-chipid
>                - samsung,exynos8895-chipid
>                - samsung,exynos9610-chipid

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-for-next-l=
ucky7-chipid-v1-0-eb2908705c0d@member.fsf.org?part=3D1
