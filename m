Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABDF3A3E66
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764337; cv=none; b=GUfbj9KlAO0mQt4QNNkci6/ZSq6+QkqZweC/RWXm4cFxeU6nZBfu3MonpmDIXp3e2DEoInCkw2hCEbcz0jA8fTbit0LsQRjggoeXOmM9BJ75vPJYzroCp3ubzO3LQb3vr1WDjke/QUYAZPzL0nfGlOuv6aFRDYAlv02+3O5fOxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764337; c=relaxed/simple;
	bh=u8DbJynolgW2SvOQbI/uVBWstmdlEgoOwuda/rhYsak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZkI/sK11dKpCYqCyD8CehKV63s19Me41hzmwEavBKdJ9mxEokJ/MxOt35EHCii6AksAJ4H77vKkfoCe8n+S2Sx99ueXnhKRTnU+CSj82wEQs7QUnlE+nOmV+OnN98Cfuvo0ejvioTi31LjD4tRfZDHRdRrMCuWyxc/UITjEfeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nUAcNvzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gr9wc/O4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nUAcNvzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gr9wc/O4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L3PY0d4167765
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kuKADIxglKVMIrQFwjDtiXbSvLedvlz6B84TW8OPMsc=; b=nUAcNvzEpKTjV782
	cEUuOOhtE2u5bJayd978sNcQNtB12tl0+IjyDHVZ9XxpYaBaD70/NHBc5xvo/nmt
	G8NaVwywC81Zhu+CE7U0WoJPhtz+RF+1hXYDgMh6eM24JP4P3FVXr0yR77PjDrH8
	DDihjoakKxpSfdBoVDfEzC6j4J5b2+0LJADkkJUNzPARjtimi807YDgCCs68K1fn
	kNyL2LiDEfSkWCss+j6Yor4PfJn3mMUPSf+BVw/7GczvhSnMXqQozCmKRDc2JZR9
	MvKJh0vHjxFgnjhvcC0hb3Nn+wnhZeFWaKnA2s1tfXQnYkKQpuz7JD7ozrZOoQMG
	nLO86Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au1c29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:38:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f9429f49cso4608853b3a.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 02:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776764335; x=1777369135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kuKADIxglKVMIrQFwjDtiXbSvLedvlz6B84TW8OPMsc=;
        b=Gr9wc/O4nOxGeSMuwBs8M4zTVfwN56jKYcY/gz3tY+SuBsYB2N0yJuTx7jYSjwtog5
         8lfMUnmyQr0ZJ0mPQyn7o2mRjFs+EJna3DcdnIXLlOG0w1J8eMSQxEmTURy8wzgIvXEU
         vqSonwn9Vj8IS2rh7Mu0hdt5rU1l/HBuZSir71DoiMqkkkWXk6KCCIfSPwA+HUMFCSE9
         TpW8P5LP/0tgILERJJWuEMrclQ+N81cqfD2QJq99loBdFux22lL78Wgbgo+xTdxM+Gk4
         pH+Z2geDK+Gsrtx8oMhp9WMmMDeVLF004OjBO1V6mb26ECy5vwvy6FHjKYgaBpMfqBXe
         3IAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764335; x=1777369135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuKADIxglKVMIrQFwjDtiXbSvLedvlz6B84TW8OPMsc=;
        b=AMWJqrKaX0rjm3oIDyuU7YnPunX7ZUAv41qnbU9UbeiUn7yu401Xl6zK294oay7t6I
         QkHvjSTOEkHpUXHeTE8IirQ49TZWdzrNGPXxRAQ1VU4vKY6VmLEY0E9j0PC7+1CtQK2z
         YbZXJ4urF4KYRKa+8rcsYcAEjOpsKKmAu5LlM7HshPHv/RMa9zzo4GBotRHM7FhFHaMS
         bN7rChCb8zysNv+gwiDKoyqqpB5GDply+5OAKSbvp660YRMQki+evPF1jWthpxFm2Xoq
         LBD+x871tbLUVPfQpXqsfruUwG/9o0Xg9aqKri38T7ntulHsSJLW3/PbiBF1lHrlrJff
         j1iw==
X-Forwarded-Encrypted: i=1; AFNElJ8qDbio55SUUoaPTigGGPSiKthyQPtnH7FuntykePiUTCw3aOZ3Z0E5y7AyC5jtZCs6fhev9vumpb2x@vger.kernel.org
X-Gm-Message-State: AOJu0YwJNtU5vjt+ZZD7u678rNfxrVyFlzJ7DEDHS8HuKO6yao+1h1tu
	uaSu/mu7rM0A1vZYgu9La4UrvcUqTr7sMReld/qBmLE5tkVOTNuA98rQB0WiEemkYT0AQ36TJJP
	n+9sCyep7PGzE7UfI9l8Azmi7KR9R3tJqgUFWri3a0INI2mWo9JCbRYmikvmccRno
X-Gm-Gg: AeBDiesyQKfW5jMrTUDz+A72xwPnfS7rF++yuQCc/gy5wYaJzBYlpy7G809xntiKQne
	5F2wxNyNM3lIpmE6Msp/8ntp+9WDAZnyscG1tVd5EoMCcwGSp8ea2ZY4j5fh3JhvXfMBqLEiINf
	iyEr9BM2tLQTeapd1nAmb2K3wE6eMOipTiZqtnvAoPxftSFXXO6z2K/V+xYul/BfWjYwxZynRKj
	w2VCjBnDoFIv2pZuvUalIQwfeosLYOGHLSEB6cvSCDKrTWbDIxhqb/2tph8/+NEBoTckBvX39V9
	F30vTNLqvPduKgan4yzNGdHmpE1mfli2PSpDkzIMTUZnZ2WUjkvytjYUKbN6aLeUMHsqaLIOOkJ
	q4dZjiRH85hTaXUofwlGDQEDE5HSBHCqLPxZQwzcvTrq+TPNeBFtujqIkR7ELn5Q=
X-Received: by 2002:a05:6a00:e1a:b0:82f:2a78:6302 with SMTP id d2e1a72fcca58-82f8c9027b0mr19301360b3a.26.1776764334985;
        Tue, 21 Apr 2026 02:38:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:e1a:b0:82f:2a78:6302 with SMTP id d2e1a72fcca58-82f8c9027b0mr19301319b3a.26.1776764334499;
        Tue, 21 Apr 2026 02:38:54 -0700 (PDT)
Received: from [10.218.21.127] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebcc9easm17161300b3a.39.2026.04.21.02.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 02:38:54 -0700 (PDT)
Message-ID: <e9068e98-1d6e-4cb8-8885-aa5831407b3a@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 15:08:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] arm64: dts: qcom: eliza: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5NCBTYWx0ZWRfX8lLHzDTG8jK/
 zJdxOikQouSXAQRbqXPC5b4DkIDlZWESMf2vUPb0tqdswOnJvU8IPgu3pZhNZpt5KLpjMjNr7GO
 YFo6kwfh4XYNKNrzAZOWv4NCmru1s3kcK/uvo9zAHjJDxBI1qkmSezq/wc5Z1u7jRR6vKyNfLhA
 u0xsBfp7H+mndQeuz/OI1/vBwiZf5c8f7pZ6ml/yOroTNQxlELadMjV5HZm8eT2d9c8wzBXdtDa
 d14xUDKgWCezzM+WJKMuUPcTRL8qqtlMB/IbhoYP1kx6Bcbu7y70xwTEgZv9jT/VEEPP00khmPu
 aMJ0ncQMy8vSskvAcS60A9W+He/w11i/TPWsBtdb4lzXMQ6NUbNUgWaMsrv1amysy5edFfe7aoj
 8L5Do4MlQ2+mSvdqwlCofMqi5VNVwhKFE5ESoSgUidRexgW9AyZNQpHPP4oKlohWSaHn636LJ2E
 7Q4XXcs6tQm7TC4bPbw==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e745af cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oL6z003X9diVxq0giesA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: FxICybW6zCgl68_AfQ3Z6QG2uy83n3nG
X-Proofpoint-ORIG-GUID: FxICybW6zCgl68_AfQ3Z6QG2uy83n3nG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210094

On 16-04-2026 17:29, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> eliza.
> 
> Fixes: af20af39fc09b ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")

On thing I noticed in entire patchseries,
https://docs.kernel.org/process/submitting-patches.html
"""
If your patch fixes a bug in a specific commit, e.g. you found an issue 
using git bisect, please use the ‘Fixes:’ tag with at least the first 12 
characters of the SHA-1 ID, and the one line summary. Do not split the 
tag across multiple lines, tags are exempt from the “wrap at 75 columns” 
rule in order to simplify parsing scripts. For example:

Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the 
number of pages it actually freed")
"""

Fixes tag need atleast 12 chars and I see other submissions specifying 
12 chars whereas this series specify 13 chars.
Not sure if there's some hard rule on this.

Other than that,
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

