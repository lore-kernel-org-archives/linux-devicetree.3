Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D4E3A4513
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865845; cv=none; b=hfQEtfZAoinIpL94ukS/+hjFpYUOYKKGVsHc+CNnmm8KYMgJVKs2NKS5yDzf4sEGVhmk4nuC2ft9C/l3CDZVvJE8v+cT7KfMI5G765n6g11HXHTziWejJFtsZ3d9D5a7+52O7dMjHa4jjQnz6kDEFTJvqLcY/YrJGlNijAQjPys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865845; c=relaxed/simple;
	bh=G1LWI6Qq1H+qHogUt3gk5wCMqS2iy3Mb2MY41Q1aUbY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+HC3ptdnfg2b2MblHxFae9HqHpjYkl2bWbnIHRYMtjYicsjBb6TwygMV9Dnh/dkpsYwCWLSL38k80Amgv9p01F4KFNPuw/rc9gjokE0ZQ+ebNd/QTR4ROu/sGWi8ZtyX+M/z+ZXI0k+e4NN3ws6ycU6JgaI2VsCwwz/qrtJlzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8h/c1zd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8h/c1zd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190661F0089A
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865843;
	bh=G1LWI6Qq1H+qHogUt3gk5wCMqS2iy3Mb2MY41Q1aUbY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=D8h/c1zddriDA9jbfvBjOtEp3HzeNxSfacVXrfmVMeljK4lrE7cq/b/mKBvv/+Co/
	 2fvkElxZCxnrCWL/99UZ9o65i/GhS6NYDLQS2NGHpiWcbhdK536UkjKcsI+yqbLGBg
	 DmLJsNfvH4bZaNCjw8mqrgIpTlJqqK02XbQoWp++FJsmihIq1Q4PqQiVHd9IwyV+iN
	 CIDmEwY0Mvjv5Hlj0j/oLjLKL/MKtdbAM+FliMuroTvjGV5g3el9hsWw0xgz/rHUaa
	 w0Rbw0r0pydRyw91IvvJ4J+oWjDnzaX79l7n59Ck0ObjAENBbtNhmnWQt08GcRWI11
	 NOUaZSMC020VQ==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a612404718so63027851fa.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 07:44:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz0TzlxQDiznT50huQrTZrBQBjaiQ+LybAM9bBf8pbFVrtdiWsFaLqJj1GLy5oyLK8vCNSBj/7wanqV@vger.kernel.org
X-Gm-Message-State: AFq9FYJFQb6H1U7dXWWDdUXeiJ/nDNofSMSRkpVwQqZSUdHanKj9DHmM
	g9FTscSmysbp6Jf2OnzAbX0jH1cS6HpmStaDFVXxNAgCKMfbA/AKOxpDkzrUL7WpMA76JcRctYh
	VcuDzKJtsB/L8K1KtcH4jz7LEIzD/icKrHNtbcrSsmA==
X-Received: by 2002:a2e:ae07:0:b0:3a1:30c4:d95 with SMTP id
 38308e7fff4ca-3a7791d315cmr16368271fa.5.1790865841748; Thu, 01 Oct 2026
 07:44:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 17:44:00 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 17:44:00 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260929155152.1898666-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com> <20260929155152.1898666-4-shengchao.guo@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 17:44:00 +0300
X-Gmail-Original-Message-ID: <CAMRc=MdAhJdS=xJoZDPs-t=eKU8USgTAOmEC08B9cMif-brZ-w@mail.gmail.com>
X-Gm-Features: AclHuK8EmlGm0-PhOTdmY9-xKVHcQxx9AbDOH7XrpelZRUI2VnNZHIwKknQ__dE
Message-ID: <CAMRc=MdAhJdS=xJoZDPs-t=eKU8USgTAOmEC08B9cMif-brZ-w@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>, 
	Anandu Krishnan E <anandu.e@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sep 2026 17:51:48 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
