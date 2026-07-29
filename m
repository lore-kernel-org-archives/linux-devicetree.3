Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A214052C8
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785342687; cv=none; b=eTnWLhSsa1BhQAjqLn7+XK47mLVFA597R4n9PSaTtM5tgUk3c9Zk63u80T/xbq2achn7bbtvJK5xYKHsFFhTAB86WITFI7GdbrrFGrT6S0Mf/J7HiiELsFCqzCjRyd+YmXWoAVzwE27OYms5roxhoM1rAR32k2q5AV1A7z2QDgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785342687; c=relaxed/simple;
	bh=0oDXRC+Rvna+8p7jpLxlKei3kZFTAr3bo/bQUBYC3Kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=fP94EtwYahMLaGy6mMdqTbiZOEFlx64ZR0mcnTlY0OoNhPgAnjb7i0SciLLcA3MCvjGkJBpZ41Nl+dp+wK0S/Mb3OYZHEFh/zAcZUuktEOPRJp7/y4hIm5GchjwogWmpcwGZhJ8ijBjTQG66RXNs4ekA+P05/qECmrs+Gz0D6h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=RlhoJ0IO; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="RlhoJ0IO"
Date: Wed, 29 Jul 2026 16:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1785342668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/CH1RQ51wDKB1nw1PqJ4AnZY65vJPiP0L6rpa3Xr34=;
	b=RlhoJ0IOQVoLpDQtytQO8MTjIYvJpV3c/0Zq3gYTRqDiCpNDZmC8ob6kOYX3z7VfxM3Ivs
	1is//wB95LM4LTyrvKkj4de4HjIwlR38130ajWnOSPkmPJhLTvXIv9nytRZgNcPDeshIs+
	uRMOpQ04SZPdTnp06C+fkrbKpBuMHMC+qIEDCRyC2uiYV0kWN77rCAOGPJsk9gZjRKZvbu
	r6QGk2IIcYtHhsmY0sUq2zxJ/hDf3wFAZK9IZHQnhq68dJgUXfR87uIoQ3qhTtVv6zXtnf
	7s7CjvtQ2qwu/S8l3/mfJkp4vTI/bH9ye7bPEL6GlhJ+fl9wqXnzCVN1It6o1Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, Alberto Robazza <robazza.alberto@proton.me>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Alberto Robazza <robazzalberto@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add Orbbec
References: <20260729141234.65037-1-robazzalberto@gmail.com> <20260729141234.65037-2-robazzalberto@gmail.com>
In-Reply-To: <20260729141234.65037-2-robazzalberto@gmail.com>
Message-ID: <tiy37g.1ypi45yn8qibx@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT

Hi Alberto,

On Wed, 29 Jul 2026 14:12, Alberto Robazza <robazzalberto@gmail.com> wrote:
>Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
>3D depth cameras and embedded vision boards.
>
>Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
>---
> Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> 1 file changed, 2 insertions(+)
>

You seem to have missed Krzysztof's Acked-by tag in this patch:
https://lore.kernel.org/all/20260729-unbreakable-observant-clam-ca4f6d@quoll/

Reviewers will typically give out Acked-by or Reviewed-by tags to your
patch to signal that the patch looks good to them (typically the former tag)
or that they have reviewed it in great detail and approve it (typically the
latter tag). These tags need to be picked up and added to your patch.

If you use b4 to send the patches, you can run `b4 trailers -u` each
time before sending a new patchset revision to the mailing list to get
all Acked-by and Reviewed-by tags reviewers will give to your patch.
If you don't use b4, you should be able to add them manually still with
git commands.

If you don't have them added to your patch, it may sound like you
ignored their review. Reviewing takes effort and is time-consuming,
so always make sure you have all of them added.

Also see: https://docs.kernel.org/process/submitting-patches.html

Best regards,
Ferass

>diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>index 396044f36..a42899bd2 100644
>--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>@@ -1251,6 +1251,8 @@ patternProperties:
>     description: Option NV
>   "^oranth,.*":
>     description: Shenzhen Oranth Technology Co., Ltd.
>+  "^orbbec,.*":
>+    description: Orbbec Inc.
>   "^ORCL,.*":
>     description: Oracle Corporation
>   "^orisetech,.*":
>-- 
>2.55.0
>
>
>_______________________________________________
>linux-amlogic mailing list
>linux-amlogic@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-amlogic
