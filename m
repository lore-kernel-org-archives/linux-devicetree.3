Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5143E15C14F;
	Tue, 30 Jun 2026 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804004; cv=none; b=Vq4PADaqu9U6td3pPMAbRdiDg7h/+rmPrjdu/h4R0Se29xDyEXFkiOOTbV/p4U15gS71dZqGzlG8x/XOvGWCYj68mPc2nu1elBcmRu234pmL4MNflfHCiZlzZi6Xg0vBpcr0WS7FYTfg9J3WFxClyY4nYpB92jbYgMcKcoQuY9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804004; c=relaxed/simple;
	bh=Icb4XoGB7vI72rZIiyKUM568WlOEx6b1q7mfyjb9zJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9HhstZHOh/Drm9/oifJEeVUblxTfhb3iVGXu8tmoJVHWMHgfNgOIHO3c4fQRzLaS4KSLJkd/Attu45WPrpOjHWqNHDhTwuwUq4VKpe+uwqS4KnLMjjc3UzOC7Aotge64r94jDzH73Gpf92vWmWWrstv6iqtbxPPM3Lx4DoaHsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuI42o3N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuI42o3N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D287A1F00AC4;
	Tue, 30 Jun 2026 07:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782804003;
	bh=Icb4XoGB7vI72rZIiyKUM568WlOEx6b1q7mfyjb9zJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CuI42o3NsL6WBwo9sx7QVaNS2n2+TI6iO6TYF/9HTMS/vvMhDN4STRtT4GQzAZ2Sp
	 OeWEiVTUvJNw18FrvGTNQ+OtM7y9zzbuJ3DlWa2Z3AicBlY0P+FJ6l5Ykm27uHdCdB
	 2YcoNhW+lMuglIXB4FpFrtbxfhbdh6TGcNRhSyXOkOgAcYexYNhApxfhrXbKT0R6Op
	 CAEu7MK3b6GA5RWFSKtcr/OYWeapkqFGFALoK0/U3IIpGrBkpdxLKzjTab8epw0Be1
	 BOYKot76jnIYrm17dQlPX0pkrr90/RRbgM0CK523QcZgOMun33UFozDMha4CGi1/Nl
	 LPwW3h6roILLQ==
Date: Tue, 30 Jun 2026 09:19:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add Purwa IOT EVK
Message-ID: <20260630-unstoppable-phoenix-of-dew-9f0bd5@quoll>
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
 <20260629-ec_support_for_purwa_evk-v1-1-e082b70138d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629-ec_support_for_purwa_evk-v1-1-e082b70138d6@oss.qualcomm.com>

On Mon, Jun 29, 2026 at 04:10:17PM +0530, Anvesh Jain P wrote:
> Document the qcom,purwa-iot-evk-ec compatible for the embedded controller
> found on Purwa IOT EVK boards. Like the other reference designs, it uses

EC on an IoT device? This needs some explanation of hardware.

Best regards,
Krzysztof

