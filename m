Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96903B4EA2
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740233; cv=none; b=g/qkg/SlWORZaMpwgY5cZpi1XsTwR8sMraZw9VcNWPxd4lRV0dYreS23XavV9RxnrE3cuEu8KsSqVehd55WQoMeWAtDJzVT4iztY0v+2SIlzAeEJ6CLz86NNCEboUqcmI6vo88WzSm6kKf/LkYhV8e9LufE0MxsQn+cJI7s3RFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740233; c=relaxed/simple;
	bh=4XA0RfVzkd09iMip4Tkqxsp0TmfE0yJgyEs9cb3lWgs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g0ZlD5NPbwsZPWQevCp/txhOg54HF3N5IwdRZzfxZl3T0IgSFdzFQw0cpBGsmfmFA/IwmEDSMDK7Hak98z+lk9+FnR+2bsyxJSfPT7ZWRK6DwQ9/IAwNeNt1gUJLlOeZIS0fkrACTITG/TfTorBrDgHJDzJlLVCVZkieAezN47o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtmjmMbh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtmjmMbh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BD01F000E9;
	Wed, 26 Aug 2026 10:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787740232;
	bh=xpZjTV7UWMBXweGTK7d7jOYsLX8v/Wm/xH+rSSzF/fk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZtmjmMbhRcp/qXgoVRaNHjx3427s8/Anr1uBKtqTjnMpApG2Cn/NzAX1mWGqIyTO5
	 y8Sqq1ibIHHQwcD7E869sXrv+PSvgzmWW+au0asrNI6CcRDmS2KSoF6tqax8D3lETm
	 8cb7f9M7V8axAkHxN0IfBkUwO/fdJNhlw/poV0YGpBn7tEI2sULGQVqXF3f6DbJzKs
	 jWmh1C1NFYqHbvgKU30EB17vKW8yhoYIq8YosFCgBH6s1reZIPueIeU6ah0RQZP6e4
	 jhg/+Y3Fm28qDCEdc/9eHBXtG+iEuk5lqtn95GjbvoVyn1/l3KPvTsR+Y7U+aZHYR1
	 mxl+XARhWB7Lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/10] dtc: dt-check-style: Handle sorting of
 top-level nodes and properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-1-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v5-1-fdd16ca6e771@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:30:31 +0000
Message-Id: <20260826103032.56BD01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Strict string equality check for root node overlays fails on var=
iable whitespace.
--

commit f8f70e68a9d636c397e92564f4d820f3585db82c
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dtc: dt-check-style: Handle sorting of top-level nodes and properties

Top-level DTS has two nodes with unit-addresses (memory@ and soc@) where
sorting typically prefers node name over unit address. This patch updates
the style checker to apply special sorting rules for the root node,
including placing the model property before compatible.

> diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
> index 96deffc0d8a7c..e5f26d3e2792b 100755
> --- a/scripts/dtc/dt-check-style
> +++ b/scripts/dtc/dt-check-style
[ ... ]
> @@ -228,7 +230,10 @@ def classify_lines(text):
>              continue
> =20
>          if code.endswith('{'):
> -            dl =3D DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str=
, code)
> +            is_root =3D False
> +            if code =3D=3D '&{/} {' or re.search(r'^/\s*\{$', code):

[Severity: Medium]
Will this strict string equality check fail to identify root node overlays =
if
there is any variation in whitespace before the opening brace, such as
&{/}{ or &{/}  {?

If this fails to identify them as root nodes, does the script fall back to
standard node rules and incorrectly produce false positive style warnings
for root node overlays?

> +                is_root =3D True
> +            dl =3D DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str=
, code, is_root=3Dis_root)
>              parse_node_header(dl)
>              out.append(dl)
>              depth +=3D 1
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-n-dts-styl=
e-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com?part=3D1
