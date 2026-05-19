Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618C2481255
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185371; cv=none; b=RnbCasj/2noYfn+DfiWwncHqKkhiMTdyF5FEsi7RqeUATvd6SGnCsx0bYO+vjF12E/kXP/MjQl35CfPKUEwIcqOaIZhidF0HvWjXSRLFhB+HiEwj91vCsH0ZwXmywJLUdRyw3DTvrw/6foGXODDw5MbGbSwvxUS0IXeWV10v3TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185371; c=relaxed/simple;
	bh=rGddbMkYF5rwW4MOlCg0+32IJ9Az8I1L3D/0Y72t3r4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ytej/Afw8iifIsB/CrZgmKjJLUdY7I4Rwk3Tm/RXUkiE361e6fQpEOTS2FAmug2F2IdQr+/MBKGA/2zIYEIbO4KLmB7jgPhYWsMWsjWTLytra+4i4yaN3eumOAG6XqIAqkYUk6QnOjhncFinMsmPeLYDQ6BNRdxRXpc77I78TQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8SZFCO5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8SZFCO5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C54C2BCB3;
	Tue, 19 May 2026 10:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779185370;
	bh=rGddbMkYF5rwW4MOlCg0+32IJ9Az8I1L3D/0Y72t3r4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=I8SZFCO5RW0jN7YIaa76SBjwtTpgC4Xb2fd4Xb5TwQPOZKVHcNfBgEI+b6cqHvIYN
	 cyJIp/BvuySw89flc2DxTO7HdTFtVc2ib9VPetVWKKYZfKzXYyXYIC8DkvgmgEfnS6
	 bRghILJXFEWDOJiTx/rV+3pjXv+g6vKeMQkaK05T5NV1cRSo6CnrEtHY478nFT2yUD
	 QqODw/sGnOPUTeyJpvKMJz0oHodwyIZCA/aTOkm1APk0bEkrFy8pOYAFLsVZQNI/IL
	 WmHHJatvexT7WDL2kyUER5/SH54yWr3GWq5+GHepvboD0aR0BuaMquWfL80tyhf+I+
	 S7gypKl/b6u7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: Convert rtc-cmos binding to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: "Teja Sai Charan B" <tejaasaye@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260519095929.76011-1-tejaasaye@gmail.com>
References: <20260519095929.76011-1-tejaasaye@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 10:09:30 +0000
Message-Id: <20260519100930.91C54C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema restricts the `compatible` property to strictly `"mot=
orola,mc146818"`, causing `dtbs_check` validation failures for existing in-=
tree device trees.
--

commit 2e9837eab33637d478720ff763bc9b81afee1cf3
Author: Teja Sai Charan Bellamkonda <tejaasaye@gmail.com>

dt-bindings: rtc: Convert rtc-cmos binding to YAML

This commit converts the rtc-cmos devicetree bindings from plain text to the
dt schema format.

> diff --git a/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml b/Docume=
ntation/devicetree/bindings/rtc/rtc-cmos.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-cmos.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: motorola,mc146818
> +
> +  reg:

Will this strict constraint cause dtbs_check validation failures for existi=
ng
in-tree device trees?

Looking at arch/x86/platform/ce4100/falconfalls.dts, the RTC node defines a
fallback compatible array:

	rtc@70 {
		compatible =3D "intel,ce4100-rtc", "motorola,mc146818";
		...
	};

Since the schema uses const instead of allowing an array, it appears this
might reject configurations containing the intel,ce4100-rtc variant. Should
the compatible property use a oneOf block to permit both the exact string
and the fallback array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519095929.7601=
1-1-tejaasaye@gmail.com?part=3D1
