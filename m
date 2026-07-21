Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C301519B4;
	Tue, 21 Jul 2026 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629164; cv=none; b=rn3zVXsl7aSByH+R3NdW1LYnQYH0BgT+EI5FikWoCfZQIIgAvKHehEBbBLqDjBXiPHqrwKUne1QdErmviJCu6jdzyMxHgZJBQSN3tEazvQ1r1HhY0rJ/7PH8dMVh3pJ4klXYg4Sc09HGmcamztXZS+UuyZINuTmdzb1dd4JbC5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629164; c=relaxed/simple;
	bh=Wek5nVxo54aYU5HsY/gUAy9Q0AB9Az8Fny5uwmp+P1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6ia3kIevydDhjtrdpbvKUb1XKK3EvxVf7r/66LkVrgg2aZN42QSeT4P1cyopUns2RtHeOfhPAjiGCVhvzzOgl/rIVKQg6Ow24XAabx6oFgQVwvXl4lBiLYsb+8VBHyavFpM33QWhBt8m2chug3TNPDMaxyz4CQHDYfIrudmWvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HghfmA5Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HghfmA5Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF731F000E9;
	Tue, 21 Jul 2026 10:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784629162;
	bh=DxpXSEh3PQkdpDhMMoAcoCnqnsSouw1n6vzw1CVywaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HghfmA5QUD7wf90PtZkwJhhqh+HfQZlonayACMP0RTeX17BLlqWHwHefFgzs4Kgxm
	 bkmv+bFVh9eUJSgUYD9+IqfLT/4nggQtiPYnmihm96OWBX+Md2wbLGwuol1SSoUCfP
	 ZDexMfV3dn/+6i3wnsSs1dyDJ1ET1Vm2iGvYZWcz6+eDL8lkIhoHolF1qtHNs25p4b
	 zInGA6KDZXLD4b+hOYcAZvrEUwywyKOuYD3GFupc7S/KCZy5MI6EhNObtPUda3JI19
	 rODeCdrTQZWef87CpxVs2F+W80jaZ+SbzMAes8ll1AWJc/e6f66jjTvbYIKWXqyXmu
	 zMQR215gL9PAQ==
Date: Tue, 21 Jul 2026 12:19:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Add Glymur QCB
Message-ID: <20260721-warping-cobalt-malkoha-b46efa@quoll>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
 <20260717-glymur-qcb-v1-1-aaf1cff84aab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-glymur-qcb-v1-1-aaf1cff84aab@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 04:54:09AM -0700, Gopikrishna Garmidi wrote:
> Document the Glymur QCB (Qualcomm Compute Board) board id, an open
> form-factor Glymur board intended for compute bring-up and power/signal
> measurement.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

