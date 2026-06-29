Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D7C3DDDC9;
	Mon, 29 Jun 2026 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748027; cv=none; b=H8Ea5JwuDT0WJglJ8xNrpD+Dn2dHTXPldBlPqPJVZq7PWv2yooyTStBuTykykE23b1nQomXkHM9YNhUTYTEJfrN9PB4SIhPSHRV4G0Aa/I90KoqoRqlPpiSgIQBsoJZ/abxHhV/ijahzZfoEc+Y+5hjxm/larsl/fgsQFlCI/iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748027; c=relaxed/simple;
	bh=QsnmsrfvMFfrNo2Ii8bGmMNMDhphCh1nj5cZluIQVYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyKXq6ks3sYIiNwXF7x7S4sSsSZTpb0GJJJvLXxs5Qcjj0jmmEoMfbhkRNBzSpLmEpBCA4RW7y2X/J8fJztBnZVSVu0jvE1slb46lPrishsz1ixwbCAbv6feh+/SfrFI0BCBYj1Jb6fZnlUDkbqbdTSHxo+cehmC0liXeKc4cl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K30e3ASX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K30e3ASX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61431F000E9;
	Mon, 29 Jun 2026 15:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782748026;
	bh=Zwf2F0ty3yV6emjhTjpwsHP7jJr8cgRnPZK3E9IHM8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K30e3ASXk3Uqd8wptw5/q4d3OfVyGIaifmMIO0sZx4XzC0nRXsLZyvov1vUNo0l7O
	 fqPB5kA+GuR3/IYyPUFwwCuqdgfPeDx8auQNBbolikD1bNFCC4UGFq78nE+/h9zyPo
	 FTqbEacmru9UWhrRJF0K5q25jNDHlJH0V+RGpLuH+w9bQ25mjjtnmdQ4rFG4M04ilS
	 0exPBjE2JdqYREtuvCtYPe7FOwer93BEBrFVJabP+jsZmfS3GJij0Z1wSf0Jq+lrBw
	 WRAUgeNd+AZJDHcWZzNbh4Lm6VeRSfFHsHJamRB8fdSYTpAOceEMCMq9wAIn9Ojk7J
	 5lxTuTPo9WbRw==
Date: Mon, 29 Jun 2026 17:46:57 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
Message-ID: <4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>

On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
> MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
> is missing the rest of the hardware changes in QPIC v2. There is also only
> a single clock that can be controlled using the RPM firmware. Document and
> add the new qcom,mdm9607-nand compatible for this setup.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

You could ammend patch 1's commit message with the information I shared in the
reply. But nevertheless:

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
