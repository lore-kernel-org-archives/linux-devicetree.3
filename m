Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B802335A398
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 23:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628590; cv=none; b=nWdhJgFsyd+T7NYxkFtw5HehArWht32CavnAlAI4WjlPklaXDo1dsYqiVbOCRSCKJazYjBUHZhs4DMk0Hi1AU2Y4+VKgF7RRd862/0ch4wNhSv4+ohvSNQvz8Qm/+HLpdLI2zB1/0eq5QVunSSdnxjRt4I/gCWe7Dm7Q9+V+sRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628590; c=relaxed/simple;
	bh=tbdbnpKBFdRVXxwZQA659UUZOUHos10eSLDIQ8ijjiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=myGPkPbYKQpcM5DGbERATNxTeG3zilVMS0l6pEsykPHRIBifDlG6p81bcXspZlN7MT/NooAI0fnEz2RpbJ88myHltDkGGMcHTWGlfkuWlPR7TIUKi+fhYCdYmwFqzqFp1zd9N7v4rnJLenKhhf9pfbj8y5qLbHQXbVCeYpi2GZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwHVTet1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwHVTet1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4E0C2BCB0;
	Tue, 12 May 2026 23:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778628590;
	bh=tbdbnpKBFdRVXxwZQA659UUZOUHos10eSLDIQ8ijjiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=NwHVTet1YCa0dfCvbxU5vFzShOxi9njKsNFrmRlHoG8z7kScptzmvvtjpXONs1ejb
	 ipzH5WGNVX/Q/szjoG96oPsUa8hz9FRzzhlS11WTN/zn+Bo0NROlyIhpwMjNtc+aUV
	 nvQvlNqljLdf2d9VvM9lR6dr/vOkOebqki186JUkpEo9NwWjwPn2+riXh/+10NAelD
	 fv1TXx8zhWU0QjXBsg1Zm1OMKQiVShzr67fD3KDXoKTNs/cwYiU+DNfhe/2YbzbJHa
	 /Y8P/Dd2eSiMQasWXFdpCRlzsPh70cJXUF62COHiBG5INUXc0w0GvUUOGa5zYcJTHP
	 Q0jGgR53r+HwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/6] dt-bindings: net: Document Infineon/Intel
 XMM6260 modem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511135703.62470-4-clamor95@gmail.com>
References: <20260511135703.62470-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 23:29:49 +0000
Message-Id: <20260512232950.1D4E0C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The description field in the YAML binding ends abruptly and appears=
 truncated.
--

commit 8f6f0b35b760957b403f0e3021bc11d578bdef55
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: net: Document Infineon/Intel XMM6260 modem

This commit adds the device tree binding documentation for the Infineon/Int=
el
XMM6260 3G embedded USB modem.

> diff --git a/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml =
b/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
[ ... ]
> +title: Infineon/Intel XMM6260 embedded USB modem
> +
> +description:
> +  The Infineon/Intel XMM6260 is a 3G-focused, slim modem platform design=
ed
> +  for smartphones, data cards, and Machine-to-Machine (M2M) applications.
> +  The modem is usually connected via the application processor's USB line
> +  in HSIC mode; however, to work properly, the modem must control this l=
ine

This isn't a bug, but the description text ends abruptly without punctuatio=
n.
Was some text accidentally truncated here regarding how the modem controls
this line?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511135703.6247=
0-1-clamor95@gmail.com?part=3D3
