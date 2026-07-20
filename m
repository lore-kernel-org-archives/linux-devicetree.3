Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DBA44838D
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 17:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784569331; cv=none; b=eL+UXmJeZorenSpBq5o4E5J3gwzCoVqtZKjGSQY2WyJIMPB9p7WuYK9GLB7ojESpSsESq2XSwpyz5RP4+2w5/jb/rtNzOqvVvSbk/po8LD0+mE3D4wQxk80DKwu/IIVY1slZu/FD0Y2suDN7qNTWrfmIdvRAb6GZcNmP9juvAkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784569331; c=relaxed/simple;
	bh=r0EXFHqmbTvRSvMdhk7XlxzEpyPDHY1MoIiSCXfKRwo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pQhzqdsN40sbXUvZg72OyGoeF+GYUAAHvGJB0ak3jyIzXSSxfW8jQvaUNvo0lKUR9heAjWz8iL9XbwLCowFE43KsXUxktOytRyDIL+cMFrac+j/3nMvZOy2qJZuvZoYvxPBSkf+gWaZRIoBDUuJFKMERMwVVgXjT/Dsxoq1Wq2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Dg7GAzMG; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Dg7GAzMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1784569317; x=1784828517;
	bh=r0EXFHqmbTvRSvMdhk7XlxzEpyPDHY1MoIiSCXfKRwo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Dg7GAzMGMHzSetAHeV7tw/B1Xm2fsBKFnVB9r0IUy/y1lomPbSOJwNSkkUo0wwsXr
	 gBEk3mR8KgPVnhQIsYLWMebN7HmONrmlA1IGzhgQNXAhO8VV//5CPgCiLQjqMW7RiS
	 oJS3KU/wb6T8fInIbuxDheqnSJWXKDwNv3CP5GINzjLnrm43Km8pyTqJBOHzO/UDyF
	 s9fjgeFaETpKUNpx+ktBU0xCJpZaT9mHQFq8dFlDBwQWORZEIuPITG491kh4ypCgLF
	 7qxidrebhzckT9IxhGJW9UriS0MKHjedcTdJbxXNQ8MzihK+VHBCh5BniGFD4Y1ecb
	 fcg4FhpL56hrg==
Date: Mon, 20 Jul 2026 17:41:49 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Alex Elder <elder@riscstar.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 0/3] SM8450 IPA support
Message-ID: <8adb4eb6-1cae-4741-b1c2-7d1385bd7bd4@proton.me>
In-Reply-To: <9fc68256-6790-4889-b1d3-1802de852d96@oss.qualcomm.com>
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me> <959db395-ae71-4a50-bd46-ac5add545a52@riscstar.com> <48c624c3-5408-4862-b4ec-9321ad279bf9@proton.me> <8309e9c7-a110-478b-8cd4-c002070d2b4c@riscstar.com> <3e70d77e-6bec-4e16-ae88-a4f5161f182e@proton.me> <9fc68256-6790-4889-b1d3-1802de852d96@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 83262120b5b8ab439cc01b388b6b16b5709a540c
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/20/26 10:21 AM, Konrad Dybcio wrote:
> OK you meant the qcom,ipa-q6-smem-size property. I can't find what
> it corresponds to, the name of the associated IOMMU stream
> unfortunately doesn't hint at anything useful either..
Perhaps this can help:

https://github.com/LineageOS/android_kernel_qcom_sm8450-modules/blob/lineag=
e-20/qcom/opensource/dataipa/drivers/platform/msm/ipa/ipa_v3/ipa.c#L10950-L=
11010

Regards,
Esteban

