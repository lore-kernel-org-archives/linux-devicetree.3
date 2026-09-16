Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC59409275
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789590043; cv=none; b=GsonupmTOTtf2zjw9KqeIdaTFngmZgt8aFeqEgFnE9pZD+j0SwcblNxgWtiIztua/QErFAr5Sy1t0Qh+vnBgH8ekPbx2Yc+qzjzqPOKe38rBevjeKHiOXghNsNKv+XExrtpPPPzzfIEeCRnNf0+MUAdskFUSbcoUgK2QjVzdfUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789590043; c=relaxed/simple;
	bh=/5aPPmzZcqO7daE9ZDR8dZpFB7Gpdur+nEBeNOPSsFw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FbRWO1kvnhz1StqmUmlpfEPRerZs+2wEOjTm9x4y1w4h6K/GJnQQppllWtaCvjsbMdL+wbUetP3Rs6hCp4kyYO2UL4HuYySPGwlSfmx7Qz7cQJxtp9bEgUfEMDepS0UvY1ZmkPtPnqGaAmS41esCBhQlThqsVK3JW4vRdBLB4qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hF5i5Ua5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hF5i5Ua5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB7F1F000FF;
	Wed, 16 Sep 2026 20:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789590039;
	bh=HwlXFQMUL8uqq+2NqtOpEncI/dQitj61X2ZFTb15hRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hF5i5Ua5ji6ZTs0G7JMb1FYvOmKxIyO2bfd5JFYBrKqahfkDBKDAr7sbzu6OUxx6Q
	 48WbYjXdLcOgsEoUIEDBPmuWpzl5E9jX+GarNh0qmxuhSQg904sgYfQEQJDuhCl/BI
	 zbPRWLpJNB+NHPvKcnCU/GjiQp3sEvCNipX/YBcT91nyEu2SlHbAsUaIS898qPg536
	 ZAkvIUY531DDaehzYNqymKhKeJWtNX7yAbqCWoCPzJQX4b0WBrrodKhBtOUR9VkArl
	 WxeXm0Xa3pUWb8TUQEdakWx8gfsPXsSUFHEE1BmSSTIayuthZ1mjsrNmnZp88JvFz4
	 /PmbwDal0Op4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: axis-fifo: Added missing binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Matyas" <matyasdaniel005@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916201253.483877-1-matyasdaniel005@gmail.com>
References: <20260916201253.483877-1-matyasdaniel005@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 20:20:38 +0000
Message-Id: <20260916202039.1AB7F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: axis-fifo: typo in compatible string causes schema val=
idation failure
- [Low] dt-bindings: axis-fifo: duplicate binding due to undeleted text file
--

commit 568433c34dce8d35f577a763a1632c2b7df8dc0b
Author: Daniel Matyas <matyasdaniel005@gmail.com>

dt-bindings: axis-fifo: Added missing binding
   =20
drivers/staging/axis-fifo/axis-fifo.txt file described how the
devicetree of the driver should look like. Convert it to .yaml file.
Issue found by checkpatch.

> drivers/staging/axis-fifo/axis-fifo.txt file described how the
> devicetree of the driver should look like. Convert it to .yaml file.

[Severity: Low]
Does this commit leave a duplicate binding in the tree?

The commit message mentions converting the axis-fifo.txt file to .yaml,
but the patch does not appear to delete drivers/staging/axis-fifo/axis-fifo=
.txt.

> diff --git a/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm=
-s.yaml b/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.ya=
ml
> new file mode 100644
> index 0000000000000..ef1e6bcf782d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - xlnx,axis-fifo-mm-s-4.1
> +      - xlnx,axis-fifo-mm-s-4.2
> +      - xlnx,axis-fifo-mm-s-4.3

[Severity: Low]
Are these compatible strings misspelled?

The enum defines xlnx,axis-fifo-mm-s-4.1 with an 's' in axis, but the
actual compatible string used by the driver, existing device trees, and the
provided YAML example is xlnx,axi-fifo-mm-s-4.1 without the 's'. This
could cause a schema validation regression.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916201253.4838=
77-1-matyasdaniel005@gmail.com?part=3D1
