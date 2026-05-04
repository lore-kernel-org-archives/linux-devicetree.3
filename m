Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68F83D8120
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899796; cv=none; b=naPlzR6wTNjPol+44BUhKpBhCX6sh+aWWzaXb1QhbzA1NngO/32T/VKLfYvFsYEVye5VFnNN0I/sHJkUH0Mg8uMw2wfWMzs/ZZTchGwcJxxcHA1/QTMBI3bJWzbUVeeBad8DXq1gX+TaJEuK0VCaESFquL5+n7nNGXDvyZVAuRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899796; c=relaxed/simple;
	bh=wLV3QMhBysu5BU6gl2h7dYWY9fYB7rlEsLU9wG+Tm6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHZVBngB4/E13v56wTpiEs715dikhc05NV5ZOGA2MCgitDSrrGL5ajvVT7X7hgsDPZ27Zx/G4v22sKrx50LIDKKuYvN1KoDleeHxGUrNH2iw3qRuWSXkkXQXTWEanGJIo0axcKdxnpb1cC1imScwsxN3C3f9wTBsQtppCSLLWN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHl7vNZq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iU5uAcBL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHl7vNZq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iU5uAcBL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4TQO749800
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 13:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JEtCjXtga1JNt5qAIhY+RK9mEt1ejX7uidveVx9G9oI=; b=UHl7vNZqNP4lWzHT
	KGN47JRjFHhBNY4Yv4YRZAQNRgVVfujinGXupfaJzbiCkg5YG9iv9kSJ6qmaR7/8
	1HkmeZR9tGTRMNpzZTV3aG2nZtlrLLjmFfvfhdpPTBaXFazBbj0k7PE3ToeaFio4
	7fnf1VllbhqXWF+958Z3VaMDG6ad318rq66Zmn8fvkF55kMGkb1zEzvWNZHUvgGo
	wMF5/6qNLI/vvqtzPYMTSjQfvF/RLflh6+ROf8xT2pcSpZgKo/fO+wyXJjhl+qjK
	ReG4oJKI4GizmBN6eoGV/4q4V8rKv9/HmqqN4Bt+oortOBn4qaGkuYkYhx9pezw/
	9EQsQA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscf0fkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 13:03:13 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-463a0b2d197so400995b6e.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 06:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777899793; x=1778504593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JEtCjXtga1JNt5qAIhY+RK9mEt1ejX7uidveVx9G9oI=;
        b=iU5uAcBLqjENyO1XyKkSZ/1tghwhs60hI+M7xdNhAwuNTaSocG0514uitdxcf6w8+W
         IPcJ/ilmXWt4AxuSWBT9uUg/1Uf1CaiQAfpr7L1vwZkD6c4uieO4cTWhAwXY8LXLadDL
         C2HOtSvaqQDTa6WVkwLNCgfzn4FLaV4G/+T87s6Zpgd6M4E2Fi9GvQ0N3uE9QHpA3z+T
         WDCECNhV1U/iEyS1y/6DQs4Z5U8wSf1VMp9+A4FD4X3ibBjWxth4H5iEW3tgOat+hxq3
         cDiVqfm8PBK9l/XRXa4vjQudW7Oc0sQDa0hiBggbRHg42s/2jx41WHO4yE1ayJLEImJ4
         zbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899793; x=1778504593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEtCjXtga1JNt5qAIhY+RK9mEt1ejX7uidveVx9G9oI=;
        b=PzX7iYYitfR5bpBukX/6DBK1dtgsv8bYrNvBCjF64DMNJ9p8TZfjP796G2J270eFyz
         NSghwNf22uMTlRmcLiexPsPKkXrPuhENxnGCWgKGUyIjCSdBz3F5FGk/1C/I17QMsdt+
         uA7fpsTTJ2uGpvqSFAnYgYu192qJsxLkim9u5tCF4PEHqWscBTbC4Qbq050PC6Pasp1f
         rh5ykaK9TJ138mpcLYufUh3Obsf3yfpx9UzM9q5airH7rrlF7NfmU6K8/6Tbl8gWlvON
         KekdrWGox18ZdU8T63CGTqEEIHQUxWvE1RcknMWQTdAP3PpbTPWq3P0a6g7hwBU8UiM6
         FkUg==
X-Forwarded-Encrypted: i=1; AFNElJ/OKn+0XiJUrro3grsZh8ebm/+I4g4BpH8c7OM2H0Whb9RYUAVJfJbYzfVoU110Fj0UBw4Uu+D5SCvu@vger.kernel.org
X-Gm-Message-State: AOJu0YxQZYzfvlRrQyejv+2LC9bTmBS56aFxZ5MmBofQ8A58ylYw1XQK
	y7qOpYUxzxAiqWN9JSbXjgERoY68fJymM2dhumGuTz2gH1OgmEf3sti0NXC6TxbE5D1zvvm6kKZ
	qezhajwmoL/0EWQkR5DMEhZ8WRsNRzgU8kD0eCO0H8stW3vJh1FA9C2c3wH9UlFQD
X-Gm-Gg: AeBDiesxKX7s1cRODPgDn4V0FAjS4rqcG5Bka35oQCd4uj9a2RFIvwVnkf2xk2lA09e
	rRtMG30B6ptf9M4t+qxdqk2Z8hRsaB5BMQL3HXR89mUA/coc/hWjodzGRWKsyDQlR7KPAD3Hb0F
	pyjpxLALFU7TURCuHceaEpxLkrXcWfGdAhX7mfkz66pjhao2tRE02DNObTfNMzcv3SuGK+8pM/X
	6mh5OsfKQ82eVV7PtyFjxh67xHpSTKWOY+aaMzQFtz/dNrjDxT0hIus6OuHSxTdcCGaHcdcQ5cI
	oW1JGyOFQ15wWK/M3Mh+jdsRbTKzeeCXkYbOwyTK1468AIeMDUey9sqjckA9AOODQ5PgHUsHAHl
	Q1FSIR60xgmu1QjCLnPpPJ3NUnPwWhMQF47X77dMCswvVvqt4oGVAAIL6tLXrlDq92wEWQmOa6x
	l0BLr7ezLgby+xvw==
X-Received: by 2002:a05:6808:1454:b0:47b:c013:1519 with SMTP id 5614622812f47-47c892ab898mr3025070b6e.6.1777899792936;
        Mon, 04 May 2026 06:03:12 -0700 (PDT)
X-Received: by 2002:a05:6808:1454:b0:47b:c013:1519 with SMTP id 5614622812f47-47c892ab898mr3025007b6e.6.1777899792329;
        Mon, 04 May 2026 06:03:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e28ef8sm3353612a12.2.2026.05.04.06.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:03:10 -0700 (PDT)
Message-ID: <7ca11333-3c56-43a6-b62f-9e93b0f5df13@oss.qualcomm.com>
Date: Mon, 4 May 2026 15:03:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] arm64: dts: qcom: eliza: Add power-domain and
 iface clk for ice node
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com>
 <e9068e98-1d6e-4cb8-8885-aa5831407b3a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e9068e98-1d6e-4cb8-8885-aa5831407b3a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BcvoFLt2 c=1 sm=1 tr=0 ts=69f89911 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=YGhfrQ-tf-JdS713w1cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEzOCBTYWx0ZWRfX9yTEYZOSlcyr
 s+6o2dIgFTDJhEeBEBEdPvZkF/y5CkmPuybOdB31sq78ovpXZbRa5EQSlS7sPGWplABy6k51nng
 pkdz5S285XpJJ97jm6/e9LYYN3Dn8xkw7VJC3DIjvIklxU61FaSzF6NjXnDtOtjQndOZEXpR7sr
 7hu8sJetxb/AbPRabGhoOvd3H0+IO9J4MZOoECXx36hebwH8IR6/vctAP8e0Lldh18DZESby5fU
 KBUGVp2o9CfFeMSJZ/cqvbsHyE/Iq/sAKxgzXq3X6mgSnv3twyiGCp8zXX7xzUy0++ZwQl1flId
 /DAsv9N2FvwpZ6viAebEOY2wW9KAP2nazN4bkTRjFY66egn1FdWJs44Cm/1U6mMmmTPXfInOCVb
 xMrRn1dcLuoHs7vgNcca53zKk/tc0woNjXG7jW6F6V+Oq/WdZv9lavelNSu5PtVujsUdYDJQIew
 89PJYXbCgQ2gk4HWe0A==
X-Proofpoint-ORIG-GUID: KCj-9QCoVjAc6ZG80_Ula4JAyE5GdZ9Q
X-Proofpoint-GUID: KCj-9QCoVjAc6ZG80_Ula4JAyE5GdZ9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040138

On 4/21/26 11:38 AM, Kuldeep Singh wrote:
> On 16-04-2026 17:29, Harshal Dev wrote:
>> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
>> for its own resources. Before accessing ICE hardware during probe, to
>> avoid potential unclocked register access issues (when clk_ignore_unused
>> is not passed on the kernel command line), in addition to the 'core' clock
>> the 'iface' clock should also be turned on by the driver. This can only be
>> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
>> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
>> eliza.
>>
>> Fixes: af20af39fc09b ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> 
> On thing I noticed in entire patchseries,
> https://docs.kernel.org/process/submitting-patches.html
> """
> If your patch fixes a bug in a specific commit, e.g. you found an issue using git bisect, please use the ‘Fixes:’ tag with at least the first 12 characters of the SHA-1 ID, and the one line summary. Do not split the tag across multiple lines, tags are exempt from the “wrap at 75 columns” rule in order to simplify parsing scripts. For example:
> 
> Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
> """
> 
> Fixes tag need atleast 12 chars and I see other submissions specifying 12 chars whereas this series specify 13 chars.
> Not sure if there's some hard rule on this.

I think the general idea is "the more the merrier", although 12 has
been the standard for the longest time

see:

https://lore.kernel.org/lkml/cover.1733421037.git.geert+renesas@glider.be/
https://people.kernel.org/kees/colliding-with-the-sha-prefix-of-linuxs-initial-git-commit

Konrad
