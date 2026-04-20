Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9072D7D3A;
	Mon, 20 Apr 2026 08:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776673448; cv=none; b=hS8/K3pFNPBAEsTr/Nr5aBJ3x9ocxha/Hfr+ObZZnCgyd2Hit8CxntkLaf8pTSUE3d+dPAq64DlrDSu9LgtvxEvppD78m0RSex9I7Pb/ZrS1D7ArOXLWTn+PPm566XTQ427hv+Zk9eIjf9o6LewhF0viadTqEjxuHsUqrrtZpdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776673448; c=relaxed/simple;
	bh=st6sYGqx7haj4z9B2hE7obITg3kbpGT2TkgJ3K3PT4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWB3uKtR7FdyNcakFYpaS13grtDvmX2no8LL71XXM1EhixA/l/FJH4m+E+9L2H2GfcU+VlYKnMh3WUhurMgSfOGT9dpJiBDKWwZjGLRkS4hCeqVgYBAaJ1BnUHfFXE8VfIHz4DFsLztnwYwN48ryaeKMchnW1a6aD8M1LtSOlSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIiPeLzC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIiPeLzC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2AFC19425;
	Mon, 20 Apr 2026 08:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776673448;
	bh=st6sYGqx7haj4z9B2hE7obITg3kbpGT2TkgJ3K3PT4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIiPeLzC0DHn2I4KPOkJvE1gBixISrjiLawRVhO82lLUkEFw8t217CSbMpRnXsYMJ
	 1sQ2xoJ0m0eedNnoPXT7CtFKnTjHt81nHPS08qc84BudGHEOISpU86CA8bNZxkBIzJ
	 UM+zL83GB57yrd/gMcd1M8lJ79ASaRkK9yUO27Uzm5q/Uv1ltSk+dFBkVRFLUYAeQc
	 QXK1DeGNdf/1cYKOTPJWkfl1P6uLtQ/nw/WGpth3k3hFyNpg2TQkHrOu3VdsPw4qNI
	 uIWJXyafLtL8WyWBphxqLvPa8KIfCbgHHDMfMWVHKhzLzXXXFmvrCOkVIFSJzfpUad
	 2ovD8/J3SaCVw==
Date: Mon, 20 Apr 2026 13:53:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
Message-ID: <ccgi3kb2n7roln6etz6bihyuvcw3ffrn6w7vcnfhbe3mgzinhq@jbjlprymwosu>
References: <20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com>
 <rqjdh72kncyjfkpfo5ymd3uvyy5bzrqzpomdbggobk2spcfpwg@irlwojm3eme7>
 <1b40b1a0-983c-4eca-bdc8-6a64cf76197d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b40b1a0-983c-4eca-bdc8-6a64cf76197d@oss.qualcomm.com>

On Mon, Apr 20, 2026 at 10:18:52AM +0200, Konrad Dybcio wrote:
> On 4/20/26 10:16 AM, Manivannan Sadhasivam wrote:
> > On Mon, Apr 20, 2026 at 12:01:41PM +0800, Shawn Guo wrote:
> >> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> >>
> >> Document Inter-Processor Communication Controller on Qualcomm Nord SoC
> >> with a fallback on qcom,ipcc.
> >>
> >> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> >> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> >> ---
> >>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> >> index f5c584cf2146..0a86230a2b18 100644
> >> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> >> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> >> @@ -28,6 +28,7 @@ properties:
> >>            - qcom,glymur-ipcc
> >>            - qcom,kaanapali-ipcc
> >>            - qcom,milos-ipcc
> >> +          - qcom,nord-ipcc
> > 
> > What is the difference between this and the existing 'sa8775p' compatible? Are
> > they both representing the same SoC series?
> 
> Nord is a gen newer
> 

Okay. This should've been present in the commit message to make it clear.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
