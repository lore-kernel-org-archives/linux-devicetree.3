Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD3F4AF169
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646253; cv=none; b=kGtHfnzlYv2ONVpNneb3vqAP4ynOgMWZSRxdj7HbsshscUKn5VWFoLGy4IkMTLN10lppASVNG/ExuJ3olCEVWgFdZyxFA05TBLIudhx4zjeipEwEDkEQA2985mU55XqEjc/QVoax1tfhzOuRbyuxqNbBgFdpqGT5fGrmI6v1gpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646253; c=relaxed/simple;
	bh=mi9H+W+qrSlxVzindDh96iqcwT1yYtL6+bZvU/dd4dc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aCpZGD5w8vE3fxP5WdDQk1F7hkyyNmcm8OEFgEHlqpRB6GvFUh6HJqrRDobIAV0FkYcQXnFYmjZUkj7+2GyDoN7rJokX4gSEmjyEblVRH7e8X2yzRg3j0QTg8q505nbj0npgBNTGV5+QGT9pjFGEV1q3zCxrIwinXIB9PzbfAQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3igOID6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3igOID6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6241C1F000FF;
	Thu, 17 Sep 2026 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789646240;
	bh=mi9H+W+qrSlxVzindDh96iqcwT1yYtL6+bZvU/dd4dc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M3igOID6y3ax6Q/Jozw+ogmQtofNwma/Rmm5Nqzt0cIoYMJBbmISxxPnCutdk8dTE
	 /hsJv9Jxxb16jFvzMW7Ealy/UVWKOXwQgqAvTf677ZfMgVsRphaNJfZImYOQYiusyz
	 zT1fWWolxXgKSQmy3O8qo7phLgaUL0DlvvUdX9q+cje8FJ87AVjctxp0mKfS3lRkzM
	 ZxaMQVjXkc1D6no/hyyIR9EI0sH3ngO1Z5sXxh6DTkpLKhKZVU/hp6FlCMpeCj1SRe
	 fchW6w5sUm32LVlevZ2Ld7vZQJ6FDYbXJUrpop9tTiE0bQ8XVBbmFVWHxu9+s421/9
	 2c2ZbuTREt7MA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: axis-fifo: Added missing binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Matyas" <matyasdaniel006@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917115023.292302-1-matyasdaniel006@gmail.com>
References: <20260917115023.292302-1-matyasdaniel006@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 11:57:19 +0000
Message-Id: <20260917115720.6241C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: incomplete conversion leaves duplicate axis-fifo.txt b=
inding
--

commit bd0783167655dd6947a5e11b72d707f5aebf50b9
Author: Daniel Matyas <matyasdaniel005@gmail.com>

dt-bindings: axis-fifo: Added missing binding

The commit converts the drivers/staging/axis-fifo/axis-fifo.txt binding
to a YAML schema file. The new YAML schema is created, but the original
text binding file is not deleted.

> diff --git a/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm=
-s.yaml b/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.ya=
ml
> new file mode 100644
> index 0000000000000..e1b46a2a4b4b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/axis-fifo/xlnx,axi-fifo-mm-s.yaml

[Severity: Low]
Does this conversion patch miss the removal of the original text file?

The commit message states the intent to convert the
drivers/staging/axis-fifo/axis-fifo.txt file to a .yaml file.

However, the patch only adds the new YAML file without removing the old
.txt file.

Should the original axis-fifo.txt file be removed to complete the
conversion and avoid duplicate documentation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917115023.2923=
02-1-matyasdaniel006@gmail.com?part=3D1
