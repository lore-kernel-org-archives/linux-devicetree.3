Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33C92EB878;
	Thu, 26 Mar 2026 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517029; cv=none; b=EE7a4Ww7cMS78IwQdA/P+PK8LrPrGclwOlbKs1kZXidzm5aAXDiJuDIyIB/RNONHJUHA9hk64MzOSbsHNkiUxp92c8IwYCRofLctrsLpttQK87dBHfHbrTzBC5e9ZVdPFwT3X/oAgTZmwnytOc/K8ImaWu/Es2w3C1rKElaN+o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517029; c=relaxed/simple;
	bh=UnKS8P0etbl45a6/GNYP/c4S/PCbp8bRMhjJWXXcVpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WA5GPOPcbIgEMKHaaqs5VdZR5Jz4GiAJu6cz/mT9aVJv4VVlgekJmLXwfvXcgZlFLTs8SwpCYl74FG7+7PL2JEhQ9oOoCMV1mpL8JHVB2jwA+zuI+xrIiWpuLmU/xlk2Y52oY1tMgUflqNmkozbYjRkBZ3LgEbHTjUvDCO6xpMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQgNHEC0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQgNHEC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F9FC116C6;
	Thu, 26 Mar 2026 09:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774517028;
	bh=UnKS8P0etbl45a6/GNYP/c4S/PCbp8bRMhjJWXXcVpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQgNHEC0Nm56p9QrZpDJg92dRGLVoFgl7ZSl6VTKvRPN/rCCwn9Zuc4DwItPNC3CC
	 k8UHvuijHrrc2XPMSezebaKt7B2DbPVf0CoNVGz8ybTJKSsVAY6zBoeGBqUc9Cmcb2
	 VExvTth2EvNiqFdJp+g7d32VDma1CrQTVSHt7joKw6aUvIo8H7fUBdC8Cg3AbeVB7J
	 ZXf4vQtYvSvkXxCkYF2TPj/2AUSRPulSOmHNnQ8bK1YcDa7DzcMA9L2ViE+WLDqB6G
	 cxhOojhwxsuzkP157DLHEdyBr8yUCuNYgz80R1HpBz7ktZVYc+S3sdwON5O4luzKIx
	 vOJNQUZbl7Tpg==
Date: Thu, 26 Mar 2026 10:23:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bhargav Joshi <rougueprince47@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, reichl@t-online.de, sravanhome@gmail.com, broonie@kernel.org, 
	lgirdwood@gmail.com, daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, 
	m-chawdhry@ti.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] regulator: dt-bindings: mps,mp8859: convert to DT
 schema
Message-ID: <20260326-conscious-polar-earthworm-4a1cbb@quoll>
References: <20260325230559.73527-1-rougueprince47@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325230559.73527-1-rougueprince47@gmail.com>

On Thu, Mar 26, 2026 at 04:35:59AM +0530, Bhargav Joshi wrote:
> Convert the Monolithic Power Systems MP8859 voltage regulator binding
> from legacy text format to DT schema. This patch does not change any
> functionality, the bindings remain the same.
> 
> Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
> ---
> Changes in v2:
> -changed markus email in maintainer as requested by him
> -changed subject line to match standard style

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

