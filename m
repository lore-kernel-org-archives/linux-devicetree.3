Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569495;
	b=DVToyiwo2bxfl5g9h72PpuYqYmBPk4rcWLPvCIc+9pa1amRzbCd+vg8wEmZsHwDpmZ3J
	 tyWQ79R6sL1U9wYp3Dhkcturw+/9+E3vu9BE6Mq1pZCu8YM8qDAYWWek4CBUP37xx6BmO
	 Df+JnipBBy76QsMm6aYt1VdHcThJU2KL9Xn/s81aA1ts483GNOe/A2oFq7a50yyLdlDzA
	 6Hga1fwBGVxAi2P1KM7QooMjxEUY4iQu0/Di5mGpciMNM91nJWIAwPxVhERcbIwpihJob
	 cqWa553ze46rZBsgJNexYcld+mKpFKAoFYqBq/sSEAl3ICq+IZhx3K8nL8UpoJe3+YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569495;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/2FCOFkahv02WUb8MJdjoJ0kcL6KdukKsXu/EI6/Sz8=;
	b=J8x4an2ny9mADfuzRvDwEH77oAs4+rF2Yxnc1ul8PvI1bQ1upJQ3XUtwigyLkdyqe89S
	 uCTcuMWj3zr5EFrNnQ9kH6cAWeQ78lzrEkcduJ7FyS0iDBahAjeSIHluNQOtpwaT53OCv
	 5lAhakEWhWqScwcot6nmT7J8NRIwjLxjnEdifO+OU4SdymsC2vx6jISsEl78Acb7zwXvb
	 KYlcr0RRkdMPX7FlXQSPgTkAkZf1wKymiQ/o0YzFHIk/LL4l4aLCCKmH6L9n8IV9TqdhP
	 nNbd4rQIfwoQ1NfJvfFOw12KV9ZgUUwu1k+crfAsAoEHpSUVfKE+gzG4xoHgdh7yFUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JyRg4Okw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3uxpkYD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2B3606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E2B3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JyRg4Okw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3uxpkYD
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L63gLV290748
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2FCOFkahv02WUb8MJdjoJ0kcL6KdukKsXu/EI6/Sz8=; b=JyRg4Okw2lzPun4T
	8MHA1mbvUB8lV51dPNLX6y8pn/PiWSA+2gtprbCZ4ZsY0hcPF9WdrIylI4CEjBQj
	D4a1erK+AX3S7vXeO+F9ogocVkMcKTVoReurMORgQY2bqMPRfnmGRjIb7r8nxL+0
	odkMimf7OXlLfXTtYjJ4pFg8JRObXLwVToiY447omvbw9FIjjWuGFKruwNOMY4PA
	Gsyt7ORqCGGaSa6bjH2Fma04fxolydR7ZA3etRiPB3LjzAdbuTSSTykcPyjRtlRa
	t4yWUF+1YE9prsDrdzMPGVeODP1X9GAkyqezqzTX0dCIbZLxZmcXrt9SlwpEZpmi
	SA9TwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajjph2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:58:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso7719285a.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569493; x=1793174293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2FCOFkahv02WUb8MJdjoJ0kcL6KdukKsXu/EI6/Sz8=;
        b=D3uxpkYDAXpfUt2sshatG3/Al7P3389pCq6BNlVPmooJtnj3Xy2ncMMQy80krtq6x4
         RZ2LWKnSQmmZhhNV4xtAqyBXm3TpxuDSBbhLImm+p2Mm6WVLghJE3I9m6N/0hH9yyHWs
         MHC77wzOk7fWzvm7QiB2hpUJYZZbamU+6jJNiA7UYUjvd918XWupDjkBwjA4NWbXtxpG
         ykZl9B2MXtprCcS1n+O0B21Wu6DsxpMPgCpX7hFe8CyHonXu5SxlFjwtNjxw0Oh7S5QQ
         IthXjhssFTjQrA6HwxXLdUhg175rWkv5sX3xyZIKN7QMjBPr+OtUyHLFL7u/AVCf9TY2
         HVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569493; x=1793174293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2FCOFkahv02WUb8MJdjoJ0kcL6KdukKsXu/EI6/Sz8=;
        b=SZPI4NTxpmUky6xMIJg5cmwUluz+jfGZhQhFXgFc2hNJkaSZMcNNQ+qEJBYKolt6qw
         yOIUhVPLcyRYp1xbbbAWzhGNJ6pHMAY6fYVJ1FQvc2Ik7NgECi/2CB6qB5miIPgXa3Tl
         5AS9r/5VWtDnfHALcmdBD9Vba+tm33Ny1HSAglZA0K5/z0eLjNsLnGobLv/w9CLjF2Iz
         Lm1qnyQof18Lb9yiRXwDyLGxAwaRpWp2n8m78vs3YMMSJ5QdnoYoDRk71ZxCn1r9MNGY
         yCTyl/yoe+27Tkn40p9IrmHLtjpg7gPs6DVGZqqH3Ac+Lk3ZZuQUVvmzEiwyhzUZCJA2
         /zpg==
X-Forwarded-Encrypted: i=1; AKwUvBzFE74DV0jW31bgTcDIhAi9bTblOP61JzwDSenUlGnZU9uNRQTH+yg+oCt3bvk4vU1cxBrndTWuIg2+@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0FhvjjqAm9EOLq2LWHywTAe9WU5nDBirlDtzigtk0jq6OVKCc
	V/5tjYW2qPGyhPwSoEER5RUR+dAJO2FKC0P+VskRlt0s1caPUOApnXiGuMbh0UlXlBRSvn8xjQ8
	4h+EyfQGKai4TEGgEYrNWFdLpsE7wfiWAdaXLlDx0MQTfVkx9OAd/yUzXy2M8k5Q8
X-Gm-Gg: AYBFou043U853jr2/lsyFfGMS3RgYuBnf/B160lDASGTtS/wZzmsQV6vTGf8QMeVLaC
	ZC6CWLUh/KIrXUh11lkjTuI6nQ4403fduPsLVFL26T5Q1Kix4++6zx7V3TkGyYMWUAogwal4s18
	nAl+tPLuMVybiyuE1gh0Tsuwc8FZ+T+k10YyZXEFCxYB7p8HgYTnvZycWFUn49l4q48Sg5LNGGp
	FqB+fdNck9Z7xOfLwLF60RGr80kMhviefSkzfoU4skAl/8SqaRei+XUoo7zEF5hzqgAU3KnUuXG
	jxGMKWGrQBHyGuFnZcLpnF/JuYvKlkS8Gvri1cgwSh8Chpx7njcNdzYI96zVe9RUqS1sJVQF0sf
	rtbM7c5hGbVlfr9UG47bWig==
X-Received: by 2002:a05:622a:4c7:b0:536:79aa:de1b with SMTP id d75a77b69052e-5369ba1a2d2mr23732231cf.4.1792569492687;
        Wed, 21 Oct 2026 00:58:12 -0700 (PDT)
X-Received: by 2002:a05:622a:4c7:b0:536:79aa:de1b with SMTP id d75a77b69052e-5369ba1a2d2mr23731911cf.4.1792569492191;
        Wed, 21 Oct 2026 00:58:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fe5479sm49671566b.64.2026.10.21.00.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:58:11 -0700 (PDT)
Message-ID: <fedd4398-e652-421d-8c85-b5afed0379c7@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:58:09 +0200
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
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-samsung-j5: Add
 proximity sensor
To: Christoph Rudorff <chris@rudorff.com>, Linus Walleij <linusw@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261020-iio-light-gp2ap002-v3-0-b7e0946c9e79@rudorff.com>
 <20261020-iio-light-gp2ap002-v3-3-b7e0946c9e79@rudorff.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-iio-light-gp2ap002-v3-3-b7e0946c9e79@rudorff.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfXypIwz22PBIIS
 3T7wmCmffNiEhQe3XztE9ciadkjepaHRiBSz3Rngs/TumAJK/ygf+idmPCXibETFwuH0EkLH8sy
 LEWqfjSsYmrR4nf35Foa+HLwfCF4MmbfWyc65C4q78rc0vfUmxUziknmrfjOH3J9V4h4C4ngJy3
 OlGkK+b6R0nEClcPiOcF2sty0kxSmOLO7t44H3mGf3gKscG5C4XoMpNjR3sMf1bO1XUbzv/Jc8K
 ppOiaIvmh1fY8akUJyfxnF4f7WyeXU689XTIXq4BtaP+v/sWw4z7DbZjf0SntZOjHmmjtxbv9L6
 +m90M7EmjCbF9zH1ZOfh5VgRHBgnwfpianA8bNz5R1iBlaRXRebsBGONwBnlAqpkb2zgT8czjys
 +lo/jGD0gtpvj+IXSYiQleAjN0iYRvBWaqkKFufkZXOUshH3R9P6PncsZCgq5i5aThAwGtrb3yx
 bHgvPo0qTd/4tMb+IqA==
X-Proofpoint-GUID: OjHxCnLPVkPFSccnvD2p9ycw0yIHD_WB
X-Proofpoint-ORIG-GUID: OjHxCnLPVkPFSccnvD2p9ycw0yIHD_WB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfXw6OtCQ3omf9a
 gUBIedwAYxiYfghrLNILYQJm72MD6iyMIa04I0VqdvhNnz4sn6X0ne4RIHgXsENr68pDJboU36K
 m1DRYLJ1AW8+9PRrRHz1rXlHNXfMDAU=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad87095 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qfT2Yf8mAAAA:8 a=QUAR2sPic8ULKe_pPicA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=nKa2voRIl820JbUdVH2x:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031

On 10/20/26 1:35 PM, Christoph Rudorff wrote:
> J5 got a gp2ap002 sensor, add it and it's supplies to the device tree
> 
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>
> ---

I'd like for you to comment on my past reply:

https://lore.kernel.org/linux-arm-msm/5531e454-0d84-48f2-af0d-1ab34c149760@oss.qualcomm.com/

Konrad
