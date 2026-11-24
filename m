Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540463;
	b=tpjAyLTEmgatHJ9l5FJGkegH9cLcTLlGYhthufJy5N7O55JNkgsgW7rZKu9n6YuL7fWO
	 jE1qLvljh+o5wXQ5BfCT5EQQ3yeAez1a2YleCRZzI8iMPBJlAbRunyjYs4zt/Yi24s/dk
	 ldbUqUafyUwpQC4uwYTsUUWzjvbi+cThBQDSp5+gk9NyrLF6UM7j+m7TtmSlqb7mLpsXT
	 8IZ6R987Bts6V4Ufx0u4vz2WP5cdUKSnn7Q+Aoflsnq3j0LP33sXD1/hhfhZinQzODP8K
	 UiFk77EuL+XjCfJKF/ooXkR/cPaowQTMs0xOaAoz4LqKp6sRrQjLJYgJJhvTuYWmtOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540463;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Bz1TOGQk9OrEAL8dqA13Na4ogVtzNLDckzVpSqCxF5o=;
	b=Gc2a27NWJEo7IsI80wECPZZrY9YMFr9M/6wWJWLjZ2lvUQ7JZLmw/XAi1jlo0ycQoZYz
	 p24Lk27X59SQkgbS1rVT4InHRZeNkyH9euJIFmDjs4LxI3q+rnmCHDYdE2efND5YRCVtb
	 3QpZsg4IPufr/Bf+7DZS9WUWMZxQ2u++RYfoY2xE/NRymuE8Rdx46dVUoyrfvqnk9PggP
	 9JDAk5eBN/7eUjdBCiuHAYh87sN7eEjabIFpHouTUhQjeX3Vnh5Bxlk0m+K9c9BEGxgJP
	 chVqeFXjhn/0es3BlCAu/UOz1JbQ83b81PpRMNo4xFQbrQxZSljfMB+WIH4yH0jzVoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MSR7bf+i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FC5606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MSR7bf+i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0941F000CA;
	Tue, 24 Nov 2026 17:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540463;
	bh=Bz1TOGQk9OrEAL8dqA13Na4ogVtzNLDckzVpSqCxF5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MSR7bf+ikM+G0rbaJOzigyhj2LyUcseLdMW7D+o+wsDWdB9Nb5l3v1jZGTcd6f17i
	 WLVMCfXrrxI6FlzMR8/MxZDMaI65AkzdCnxh32M1SDZNPV0oKm7FpL0H8WdXM6jGUV
	 kB85nsrFJHzF5I5GYy4AuYbrt64XhcGFb0w5Q6fk00yk7mXz2N1CfmKzD5WHNWPUhh
	 eU/dbVueFVltXUA8Q/nYI9GJ/9OgpG4PQpd+3oTV9mZUvd7Yq4rypA18AOvEgvup8O
	 WIRXCuS+mO80WuJ6tPAE1NzVxp5Nquwt+iGH1cyRhFV3QnAcgB1S18mf9t2MOjUiNf
	 idBIgxqGr30Aw==
Date: Tue, 24 Nov 2026 11:14:21 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] of: property: Create devlink between PCI Host bridge
 and Root Port supplies
Message-ID: <20261124171421.GD3404231-robh@kernel.org>
References: <20261123-topic-pcie_hb_rp_link-v3-1-f90191217c74@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-topic-pcie_hb_rp_link-v3-1-f90191217c74@oss.qualcomm.com>

On Mon, Nov 23, 2026 at 07:59:16PM +0100, Konrad Dybcio wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Recently, devicetree started to represent the PCI Host bridge supplies like
> PHY in the Root Port nodes as seen in commit 38fcbfbd4207
> ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
> the Host bridge drivers still control the Root Port supplies as a part of
> their controller initialization/deinitialization sequence.
> 
> So the Host bridge drivers end up parsing the Root Port supplies in their
> probe() and control them. A downside to this approach is that the devlink
> dependency between the suppliers and Host bridge is completely broken. Due
> to this, the driver core probes the Host bridge drivers even if the
> supplies are not ready, causing probe deferrals and setup teardowns in
> Host bridge probe().
> 
> These probe deferrals sometime happen over 1000 times (as reported in Qcom
> Glymur platform) leading to a waste of CPU resources and increase in boot
> time. So to fix these unnecessary deferrals, create devlink between the
> Host bridge and Root Port supplies in of_fwnode_add_links(). This will
> allow the driver core to probe the Host bridge drivers only when all Root
> Port supplies are available.
> 
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v3:
> - Resubmit as-is (bump the version as I added my sob at the end since
>   the submitter is different) - there was no activity and no response
>   to a bump for quite a while, but this patch is still useful.
>   I dropped the tags I left at v2, as it would look a bit silly.
> 
> Link to v2: https://lore.kernel.org/linux-arm-msm/20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com/
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/of/property.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)

Applied, thanks.

Rob
