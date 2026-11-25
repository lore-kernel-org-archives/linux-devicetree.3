Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616455;
	b=c6HdpgSquRx9e/75uf+tMAFPMUMk/p0FTa5k2jZOFi1Nc6dLXhFjEUjBFCmksBnic0iP
	 jgJAhndJ+/pda8r1zjhHaq/FsAeBoHlb8c0mOwC/m8aCJ1NSuDkG4oP4m52a6Yb61NWC5
	 WhJNsXJQxx22zfw2jQX2ejCGjH9EfZVyAc0YRgu/i8FCiYTYKgXMuA8ZT/AG5N8+7ySo+
	 jUfvl2SRmFVJjAFAdmMt0uMwY4IHv6uDkVveMtn0xdFcDPbC6oxINt9zsY+3Rha/kR7AV
	 sOjXJENpQ7gLvnuWhNQI31BjBzxzFP42YbbNd8rvr1n4y3o0bBj0vMkxTnvHkEIidgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=w6I+ryhKUHBU8/ypdPULznpg2ekJDRBrE8QNL0EUam4=;
	b=fVOHgS+xebO8cwB3koRaUhWHXFvA4g20DowsIKw2MXoT8IB8/poJpyqI6g1gcqwhLTHJ
	 153C6fUmhkiqVyBu4CA/sYGwbOiUQNYRiRcXVVayIdA32BVH+PjFPAqNE/6Sq2vKkeAhs
	 3JObBde+Fa4pbfmUrTViEThuVwlhgcD3Qxx9a3k+Q8NKf4wLdFj6Rc9kf/ZoxacuD08j5
	 pX7hRFTfJ596WIlautGjJLkBrRs9ihaHg6QtJ3ZX07Ufmv1UIiH+HRa5dF3O77mlK/Bzs
	 arLZKyIEvpOpYMJ2pOdBFPPaMe4RvhNdEUWe4nK7iT0wIo7mRrwXzTwJbsumvGbekdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uGl8+q2+;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D88606A329
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47D88606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uGl8+q2+
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adef2bf7acso4809401fa.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616453; x=1796221253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w6I+ryhKUHBU8/ypdPULznpg2ekJDRBrE8QNL0EUam4=;
        b=uGl8+q2+W4FLFqzK94rJ0xx8KjdkJPZX2a/BebrK8El6t7BmHdxAKcVXgxwcW1nRdt
         QaDP5T7P3uqBgih6parY7BRxsPbdJVw802NP7Gemiraa/Np6gnLKQF05xoUOx1QO5MTd
         iXoyIX/MAsm4dgMdBxlD8orfF15XV8WYNeU7zRmZg1vABFE+6eCqXZPgxaPE0TxHJHwN
         e96tkwkdFYRSOzX0hVuRIdJRorRZALa/qkpg3x3l/kbrdH4UiWuxpGgy16ZbHfEv1bUd
         KnO1yO8xY7OVPSOlafW9vxu96xbVdpSfm+8lwp/NfkBrKZvX+fUIC3TE3oAeApXuh/Bg
         Ef0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616453; x=1796221253;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6I+ryhKUHBU8/ypdPULznpg2ekJDRBrE8QNL0EUam4=;
        b=djhsI3tEG5GrwJdNC8zZ1EoRCiv35F/mHXHLF41hkyLS+j4e40HmfXCwZrJo9UBdHx
         +YHuucEzHRW4ENgMDT1fo0eyLLrnM/m4+QHeYqKBOYPvl5LlB0gUt1RMlTs+l/p4XWpX
         ll/t3XrvEdkjeumebeHIw10irSOilWOmkMDj1CjNLUx2CpqC1A0fAKIJL1bVQ16vpZhz
         HAVs/vY88ydohL+r/7jzL2OokL0CwFYOo+HQgR2WlFXwcRPhLZkWXyFXu2aoxnhoqoFc
         TM20nyIlyaweHxWHhC96uOSEJDFCY4ADH0Gr1R6iBFpuAp7uFMRhUiKB/18iieDfPDhw
         NOmw==
X-Forwarded-Encrypted: i=1; AL+hErH29qv13lVcrZ7+nK9d3clhSOn7fE8G+JKX3AGxBOee/kFZmVuZ33B50YAft5sfkWP8DOtlpJrlnYx2@vger.kernel.org
X-Gm-Message-State: APuU4Z8vh6octsaorIl8AvLJOie8hITDCHbiJj5SblPeuWodRWnKwtE5
	x4KHHsv6vUP7tRPjaGUX0+5XLlDQpH5XCqGw2rY7NlUqQnJuBGw/IyMyzM4J4LPyQ17/QeKW37E
	1Fj3uzmY=
X-Gm-Gg: AZFdTZcadzxX9n6eBQSBCkPCnPaFZyzhY1YHNFyougbAh6fypYsLWwkdlNslw9DQHph
	nApG6E6egtrWKSZw3o7YHoVRyIafZbXIDsRjfWQzNNBFlhdaBhyDK2gdGGNEhpXXyKGcmri452M
	ZCiuvBvimawke0KzeT3twx/NqubLDeK4UMslrwLByE3C3/GtugAAhRelx+LIXZZW0ecBd/6aeci
	xTtTNYNPGGHBTq8s/CikAslZqZCFEGB5D9UtX+BOWZHHCk0Z0n8M1xyrFwwhy8SRUObi+w7Hv0O
	guYnZ2WgiDJA/wHHQUPRMwUiNBi33wNJ04KbAJ89d2346yBfU+EMlgz9uYz2aNlUQMNyXHCpVdI
	Hp0ZGEDfwIK/2kC36XwXGhjwjTn4d5i6UfOmybvMQp4oDgxEu13pgzUabj1Nf2Wuz6sw7zq6kO8
	CNkjRKQ24N7XjMFRSCIEhZhUnLiyuaTDhypA5FKYkXYapwxQPMM0laf4raugQGYdzBJDTaHvGUI
	44IISSmjS+UxqdyJiK4g2kp6PJq1kLUjDCHIORZIKLXNLuC+Ox9O+0o0N4UQzFzMO0k+2tiBq+g
	H+J5n0c96ekFAydr8RdgLvKG81HbyPD2MklOxfOgchCWQX7LjzKyWXjAiMFs1EFQCXcp2PYRj3H
	s/5Jyo0g=
X-Received: by 2002:a05:651c:a110:20b0:3ac:e540:987a with SMTP id 38308e7fff4ca-3ae7f7ccbccmr42593531fa.0.1795616453477;
        Wed, 25 Nov 2026 06:20:53 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80537021sm43974421fa.28.2026.11.25.06.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:20:53 -0800 (PST)
Message-ID: <8510bd96-fbb1-4d40-ab90-6e337ed501a8@linaro.org>
Date: Wed, 25 Nov 2026 16:20:52 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur's camera subsystem hardware is a functional subset of X1E80100.
> TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
> three CSIPHY instances versus X1E80100's four.
> 
> qcom,x1e80100-camss is not used as a fallback compatible since it is
> already claimed by its own binding schema, causing a duplicate
> compatible warning in the DT schema checker.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> +	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>   	{ }
>   };
>   
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
