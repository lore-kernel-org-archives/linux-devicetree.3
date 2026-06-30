Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8B3A7F5D;
	Tue, 30 Jun 2026 17:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782841952; cv=none; b=c46q8uibLAvoCSpPWlY9HVEEGgnwuZsu3e7WuVpMweHG8eHS5/bVCmwv4x3WS11Qv2C8V7iSKcYxMhkXKOFAacItKTDxKxfnVmFJRCGLziXCNfCcOOZ6vii88DxWLuKuN0h4z+TYIgVXqqUMQQwcLzRqulbvlTlvM2aizKwtBxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782841952; c=relaxed/simple;
	bh=UXAQp+lzfpjcNQcOpVmCfflmm2lZu9Lgr59CXQm/n4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tevp12Dj9NRcy8bug9Glf6Cb9AjeVwLYuq/slT/BPWi1qwHbxf+rJeNZ7xcgZL4GDUMjdDGZjY2gBRqBXa48+kA2ylkKmOZ+0GH9ux5bDQAijqfz8JkuTRmaRYRZjTfW6WPi4Pvo6hj1NtE4EfV5GQN1dpS96vMDCv3BuRbZN9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uo3/6GR2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uo3/6GR2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627CF1F000E9;
	Tue, 30 Jun 2026 17:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782841951;
	bh=X24rq8Dtyy3VVS1hghx9qxF4VDAnbjudmPkDMObmyAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uo3/6GR2RJVyHBeI3lzrdVzfuDefc7hjxJFH7ux26Ap19RMISnH02zWwiM2pwRIbA
	 wzQ/9mjtnW9JYukqfpKOCZFct0uP7J26+Q+6Zwv/6lbMOTDaKuJUcqTol6v8T8lwZM
	 YQt3cAxHWmYhUtZx+1aGfmSDdkeJerP84xjSMWr6ti8hPg3/9/P+gZsH9YOEVFHWxf
	 s8kj9pTha6tSxtcmepb33rnpnoDyEUIFnfBsU7cQe7lilLIPOIKV5Xdl9/Wn5YD4mn
	 jeouN5jbJM1sT57F02WKF5i+P3Eu27IF3PohWq+GCczGEE0HN9ji5+4XqQncE7t2vI
	 SmWg3f3Sf8jgA==
Date: Tue, 30 Jun 2026 12:52:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	yijie.yang@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, linux-kernel@vger.kernel.org,
	aiqun.yu@oss.qualcomm.com, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add compatible for Qualcomm
 Maili
Message-ID: <178284195032.4135377.6767177506227722552.robh@kernel.org>
References: <20260628-maili-qfprom-v1-1-9c097e2edfcd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-maili-qfprom-v1-1-9c097e2edfcd@oss.qualcomm.com>


On Sun, 28 Jun 2026 23:48:09 -0700, Jingyi Wang wrote:
> Document compatible string for the QFPROM on Qualcomm Maili platform.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

