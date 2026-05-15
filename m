Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D7C3FA5C2;
	Fri, 15 May 2026 08:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833353; cv=none; b=L6p8O4Uwa/JzevGWiUgXNSGiRDcHC7MwdC+oz4NPJFSQDj7JzfxOYxYqqIVvc9v+qm38xXyKO74tWEnY/a4IT/jIXJoFkWDFyNELIoEKiJJM3OdbHD8YapovaxBh88VEs5B1k8ivBQN23lit3inh9BD6rApSXg5ow1V6tpH79M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833353; c=relaxed/simple;
	bh=PWLpYmkZQKvLg5eHKoPsig10udV2ltm5dbRXSSmqIKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLmiSHp65EF65Fmgigh63X5XIo+WrrTSzk0qiuNdLglJKDPWj0ETcVONvtnOewqZsrche3bGUIk67aDs7HW/cVMpQKaniLepoZvBQjkLKhqCU0iPfnxXEuLathVMsE9b8ClAMos4puse5imOW7Qwu29mSv5TUVhDwC5Tp5xvWMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0sum3tP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0sum3tP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96DCC2BCB0;
	Fri, 15 May 2026 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778833353;
	bh=PWLpYmkZQKvLg5eHKoPsig10udV2ltm5dbRXSSmqIKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q0sum3tPGcjRCxrACE7YjnyVeZA1qAP567X7iTVccaLyqCA0PDP1SQBYiBron9V4K
	 xWQeP+O5OXDLWsq/oM4bWJD1dtrQJ78VHEa2J1n0IECZjBM7hukWME6ugWjdZKRw1x
	 z/cJZVWF9b1b3jkmcfIchMtEjcz8WzWQgMPH5nS5F7/Lj9uwSjjve0IcxgmHZmhTJA
	 R45aozgT/rqpvFjmx6Zk8qnkMpxQewHOtQIyY7IqeQXZ6RrIH20w4+v8PG2DJAygMu
	 0wS4yLVWyR6uDxlywqoY9AbzcDvaSotjTB8TvkBNQakbFW2i3eD/b13fCDmm88I1xC
	 J5jOMwOsqb40w==
Date: Fri, 15 May 2026 10:22:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Document the IPQ9650 TCSR
 block
Message-ID: <20260515-flawless-space-groundhog-0fcfaf@quoll>
References: <20260511-ipq9650_tcsr_binding-v1-1-a41f612da54a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-ipq9650_tcsr_binding-v1-1-a41f612da54a@oss.qualcomm.com>

On Mon, May 11, 2026 at 10:28:04PM +0530, Kathiravan Thirumoorthy wrote:
> Document the TCSR block found on the Qualcomm's IPQ9650 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)
>

NAK, I said it way too many times. You just sent COMPLETELY separately
IPQ5210 and on the same day, completely separately this patch.

I gave this feedback publicly and internally to Qualcomm already
multiple times.

NAK

Best regards,
Krzysztof

