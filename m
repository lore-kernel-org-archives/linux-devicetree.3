Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E50A35C190;
	Thu, 11 Jun 2026 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168015; cv=none; b=ZA+Gk/OOEHc2qNXArD1fAIC+ZOWswfRnIXzfDcFwX03LXJxYrHT9eXFKk7km/hHK8v8KAZQHtPhcH1RO8Q3y8jXkAWZqycPKEDMz/AHZIT16mn2m1BhO7LSSqISLwVglg1SzQpuq8B2inaW9TUDWDBtzg/PleYEQ9g5R8jp4xOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168015; c=relaxed/simple;
	bh=eqH7ANavCevHLiMAPvzsb1H7Ap650s5wyNUr10SOOgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWtLnRBJFUQrg1b4AFwXFlGfbXH7Lf+fMkiaylC5LOwJ0SyggHBrfRSv5yLK7w/ahoP3YySMhCby9GctXNxbVnuhNPQrhXAkJSIntriCz04WSGK2yH77SaLo6eyOyqCnVa/iYZ93SjwCGNzOvdH6A1TJzseunU8TPFIaG/KBOTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eR4PW+t4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eR4PW+t4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801291F00893;
	Thu, 11 Jun 2026 08:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781168014;
	bh=RkaMDJv2k3WR+KxoPtZX4VuY7kdj3G9qSMG6ex+5q5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eR4PW+t4dG2N2gll2evKsNnHjmj/qGrL5hi0MIXaqBqZUGppb7v2gIKAMpjD122aM
	 pxvS19hSjIo5oagLCqQ2VR7EVI5+IW21Oc5r2aY1I5/GjtiQJg/zamVGVVQKja+erb
	 MCDlbe7Xp+kyMSKum3sCs7WjtiRL47EU9WYy5+QXcpsq/nYWJDJmdTYtlLUPDvtJw9
	 g6ePt7ySApnqDmJjoE0wU6/NnoO2D6PETXfbYtfNTrFyZ8U6d1Bw8+k4vPygxMmlCK
	 hRJOYVoeapN8jsNRvpUdBWIhcKfy2nfz5Rb1OEMjYPYMXJE/t7kNJZNLE2UsOs/FAv
	 BqcdWL2Mzm7Ng==
Date: Thu, 11 Jun 2026 10:53:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	kernel@oss.qualcomm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible
 for Qualcomm Maili SoC
Message-ID: <20260611-happy-bullfrog-from-lemuria-3fd5df@quoll>
References: <20260609-maili-spmi-binding-v1-1-80fc4b6bb80f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-maili-spmi-binding-v1-1-80fc4b6bb80f@oss.qualcomm.com>

On Tue, Jun 09, 2026 at 11:29:24PM -0700, Fenglin Wu wrote:
> The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
> is the same with Hawi and compatible with Glymur. Hence, add a string
> for "qcom,maili-spmi-pmic-arb" as a compatible entry for
> "qcom,glymur-spmi-pmic-arb".
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

