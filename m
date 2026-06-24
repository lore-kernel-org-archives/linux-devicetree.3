Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DCE3AA1BD;
	Wed, 24 Jun 2026 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306375; cv=none; b=cx0rvQj0oOXuCuHICpdHymbvOzkbSP/Y+XUqXmPKehCKTBmaH5sPX1UFo9EMxg9D85fU4Wt/XXFt/Y2d+EQ3Uvzm3ej0BOOTpTUNPgW+VsTaT1xVPqjG5+WChWefhAZdR7jbFi2F5MGMgdwoWjjKcy7xYfQlpcuPzxeyhVd1lNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306375; c=relaxed/simple;
	bh=Hhank47ovUYI7MZRBGRz6apro8rD9yCcxqDNjhX43M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jt4rAeEyY2DsX6YuVEOENB2Dsq1zCgg260stUlGznYRuhqb/gUFZV1l4CjjTTObnWdqShrAuk2VqjMOj9OXGO3EESlI7rLaCAVl2NhMJNrzfaHuf/1cgyeE3j+mVFeeDc0d895xdXDvhblBlkbscDdt9L6MsjrrY/a94VVgu/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orDu5HC3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orDu5HC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CD71F000E9;
	Wed, 24 Jun 2026 13:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782306374;
	bh=n+NuqG/h+06sgb+HCWip0XP/OhMGA85txXcKyLOezUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=orDu5HC3bU9EZWCMHQgD321fIr6E42JtMvjmw1N1A6NmKImJcvQ8AjOmhXTH+kKC/
	 SstyHKwGhWcCxZyzisNJFKQfwxhLokdvdUEfPYFQNwq0c0ZoHPUEmbZNk+z/w2DRFy
	 ZY1iapMbqvJYPqXSlhYSstmhbjJiVuxepW69IDwT+hU3A3P2Htuy7PpAkP71mFfh9k
	 +n4HgtLO2+sietKLfwpUJlYP94VkPlHAUuDKkwdIvn4tUKwj9j4LpgCtpH1LG0lC/F
	 +LCVki8ANBR3YyBris84ik6rcLF+JVdVIIAc+SPu5HNCjz+ovI2gmPCSUb3wq2dy7+
	 K/9g98NrNiSIg==
Date: Wed, 24 Jun 2026 08:06:13 -0500
From: Rob Herring <robh@kernel.org>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/3] regulator: dt-bindings: Add Unisoc SC2730 PMIC
Message-ID: <20260624130613.GA4054894-robh@kernel.org>
References: <20260620-sc2730-regulators-v6-0-bbd2db395231@abscue.de>
 <20260620-sc2730-regulators-v6-1-bbd2db395231@abscue.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260620-sc2730-regulators-v6-1-bbd2db395231@abscue.de>

On Sat, Jun 20, 2026 at 10:54:00AM +0200, Otto Pflüger wrote:
> Add bindings for the regulators found in the Spreadtrum/Unisoc SC2730
> PMIC, used e.g. with the UMS512 and UMS9230 SoCs.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/regulator/sprd,sc2730-regulator.yaml  | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)

Applied for rc1 to fix the warnings.

Rob
