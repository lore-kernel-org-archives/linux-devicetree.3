Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505AC3D76;
	Thu, 11 Jun 2026 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168096; cv=none; b=QJsv+BZHga4fxg4zs423zaPCMeTnqA4KviTCsgcgllvnYz+IiM3u5INZpU5bxD++IZpGHSmCUBepjlDKuYEaDhJOt5SHlE8UiR7J+DEXBWF90y3VFQy5cKZJ2Cf8keM1YgMR7+e7tuIyn0x0i5QrqeBbUfX+rSsYm2WlbUzalfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168096; c=relaxed/simple;
	bh=6w9MnzCGFqrtWRHwFGQup1YeKLb0cilGhfbWJN0xMhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mgk5gz9oVXzeudQ732fNlkz4Di92cel6b8uoUTgRhUVLRwMrhiY3MBEhkLJEtow+pw5XImWHPVK5/uuLweYAwkrW33CJEVzrpruKWeM4hWueYvogqYQjCC5C039qsSkddL/Jyf5C0oiM2PXI9eADnWSLecGHcYk26/k5kTtyt4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEj5Wo1A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEj5Wo1A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556871F00893;
	Thu, 11 Jun 2026 08:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781168094;
	bh=vChsQuyGXptOD9Jz1hBzB/1DtpzP+am9X5pxIjCqs/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VEj5Wo1A8iafC7Lue40eyIw1FxfycbW9v7d2VlIRwB7KyQi7OYORR0EIcTWKb1qm+
	 6VWDGnhBRIRe+scSBEYKQr2sTWoaHlrAkgIhwrZulwN8rs5JZpn5u/wxCFjNeGB0/i
	 p0W309troOsqMi9qcDGwhUski7m7JEDDQu5thKr2lRlXvkgL5rJkKry5MVrjvDYW/I
	 +OVCsyjJMQ5o2K4++bc7EU9QGxgxcjt7S4WIl3cNN1OwY7i7F23lWWpLeRoTw8hGAf
	 DFw5FU+fFNTwtVcIzcIXacvdwZcdDL32zeCqo6rypmeOj1jL4iD3C60sFbQIsLiY7O
	 2C0sQxuiim7bA==
Date: Thu, 11 Jun 2026 10:54:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	kernel@oss.qualcomm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMG1110
Message-ID: <20260611-rugged-significant-fennec-12aa9c@quoll>
References: <20260609-pmg1110-v1-1-6604d0adc907@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-pmg1110-v1-1-6604d0adc907@oss.qualcomm.com>

On Tue, Jun 09, 2026 at 11:49:59PM -0700, Fenglin Wu wrote:
> Add compatible string for PMG1110 which is used on Maili platform.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

