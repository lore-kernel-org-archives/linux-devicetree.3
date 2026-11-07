Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059798;
	b=lKG2BtCL7Q7HkVDSY8cqMJvImC7fhQW3iZTL2VHtc+HECvE9T7FwJhF6tuFBdJzh0IvS
	 fjL8+DCzA3afTpytd86b2xmymQdoaR9SlvkqesFHCxvGGB8IsH6gFTueK4KqMHYrlFxKt
	 9MFVLyP0yaYbciER8BVX62S/uUgijaE4knk8q+cRsdHvqWYLzkiOl4ODmhO36SDwE2lUq
	 DtAc5/6L7FoKz5jhtn7fSWqvj2bTvv7Y52r/b71+O3um41O2xgTLIta1CO3mqQsFh+VJY
	 e1XzDBQDX5rz9cG/4u5Y/9xHl26six5/EV62q83sQa/X2ls/zxECOBd6Qksih9+M0fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059798;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NluSbbTalwIbvB6NIGPHdxneLB7wvGTjXYRtcAPwnC8=;
	b=oNtRNw/Ll5rrsOFsUxjN8Mi6bIS5CkotpqPJszLo7KoJ0u1PTtIS1bei+kTmLAeNHP26
	 kWMZnR7CeFNx3besX34qJqnN099exbODozo4SXetbWvUmsLTxd58hQ533N6PPNSrcO6YD
	 FWa1lmwBRo7joZL73+yZ7gguhNxKVVIWbrKu51JfK+OASPPt+g9Dgh5Jz0pWZOe899C62
	 K4mjt+IJ3Ue4XMOMjgCKqfSi+Ls5ZSuFUwXU0tpqULyModi6ibOY8oOefU4Gluc1Nzf7o
	 LG8Cm7PLUh0kesFNG8tVydhVCMYl8KBHqppX/FDf75GrXZtmhD912P3jbUTdTKrk2nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHLbody4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0EF606A326
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHLbody4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1EA1F008A2;
	Sat,  7 Nov 2026 13:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794059797;
	bh=NluSbbTalwIbvB6NIGPHdxneLB7wvGTjXYRtcAPwnC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UHLbody4SviDfjxb8cW8TeVKNG3plRhXkkF3/UhG8/FXsCdF9gRe0j9UD8u1hJY4Y
	 9OObj2OZ9UwqyuqL4vebU9jL09E1DE9DNglRj1XMxtLRfdruUXalFbunq+SP89I59V
	 U50/MISyFEBdr4AgR/n7vr03vy8OyUbaFCu0IgFGtRcvGwIgm9jHYcWMyrBSqBAgT5
	 C5TQS3rtBaZ3yz27/wMkI2uxEIWnWzxiTDL6mlQOIGrD0OLDOTE+orMwwM4+aRrx+R
	 g4+i2QA7RiYh1gbrnAK2a+sFv5xGms1w5CNU7pO3Bvz8LAa8s+LYOkrWem7ohNcI6v
	 Ts8ZTLNJz/coA==
Message-ID: <sashiko-outbox-202934@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] dt-bindings: iio: adc: Convert xilinx-xadc bindings
 to YAML schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dileep Kumar Nagavarapu" <dileepkumar.nagavarapu@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107134955.1423727-1-dileepkumar.nagavarapu@amd.com>
References: <20261107134955.1423727-1-dileepkumar.nagavarapu@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 13:56:36 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: iio: adc: xlnx,xadc: commit log describes
  inter-revision changes
--

commit d68c424577a43ba2a1a0878e11b74b4e72fd8ee2
Author: Pramod Maurya <pramod.nexgen@gmail.com>

dt-bindings: iio: adc: Convert xilinx-xadc bindings to YAML schema

This commit converts the Xilinx XADC and UltraScale System Monitor device
tree binding from plain text to a YAML schema and adds a MAINTAINERS entry
for the driver.

> Move xlnx,channels under properties, as dt-schema now allows node names
> containing a comma for long-established bindings.Constrain the reg
> property of the channel subnodes to the valid channel range of 0 to
> 16 with minimum and maximum.
>
> Drop the redundant "type: boolean" from xlnx,bipolar, since its $ref to
> the flag type already implies it.

[Severity: Low]
This isn't a bug, but these two paragraphs describe changes between earlier
versions of this patch rather than changes against the repository, where no
prior YAML schema existed. They belong in the revision changelog below the
"---" line rather than the permanent commit message (and there is a missing
space before "Constrain").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107134955.1423=
727-1-dileepkumar.nagavarapu@amd.com?part=3D1
