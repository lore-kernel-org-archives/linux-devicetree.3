Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548A836AB6B
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948217; cv=none; b=DWy4PW7FUJoAVnaCvSHEMeROo30QWzMEUxSGkxp+2rLzuC3u9RZQuDXetjhBbLXIsou1dylPfWgO5TYslWPSEXS0u+gN9ZJd5y9PaOeEiYJDAv0sypXfLd37ymKR258NPvyaW2pJm8Q0ClxKQ3xoBUonET/GO/oouRxNYo/YwA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948217; c=relaxed/simple;
	bh=W6f2/brHu57FxwFBNFjV6ofetOPfVwCRNfQoK+jYaKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q0tLeW3h35/Vd1JyXHuBVg1euTg/42iQegpjFkYDmiF5/vMK+x9dOmc1ZYE5zMtCpPSLowDC9+bB/kBAj6WNv90G652Bw+Sq1VxBfLjwHwgAz3UGzA88EcflVYOe4bPpYrvE7uiFQzXDhNzODo7krjrvWDo9HnKUlSCQX6cpvHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbxAnk8Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCO3aVdx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbxAnk8Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCO3aVdx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6TZXY1090309
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4SE2VJGw0Sj6G7Ihm7UUx/mCU5Skr+1IWCE4i3UPs8=; b=FbxAnk8ZLojmMEd4
	S420RzF2f7meVR3I/frxA0WMsAehVUoEHNsp+q9LzmbLCYYk+askcP/t8WeXds/k
	pKsWqa5FxoiVYle4DnIb+MbAtjyYNPU6gP4UQyK3/G7FEoj/1XwkYJQYOuQXeIy2
	KIzSMidCVISXdgTd6RkN2l83mQu6vjgTyQfD0r6aP5Bi3sT7x4kJPSs4fCM7na42
	Iz0rTLX9p9fme4oqx79JEuC5a7hy0IMh71WVgxCYc8MQok5l+NQcnrfDrhjtVFlG
	/W515ns7wtqDlYQHZbdbsbf9wjybi+jxyBW1tlsvbp5yf1wSD0LWkP02l6gebLPb
	pM7mFQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd3xjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:10:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35c0cbe0f64so15914550a91.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948214; x=1775553014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z4SE2VJGw0Sj6G7Ihm7UUx/mCU5Skr+1IWCE4i3UPs8=;
        b=UCO3aVdxHLqROXThGBm/6RH29r0efRlwZJb/Y2F3uG8pVtFqeEXnpEjF1K+urfHrfD
         +DCm66Y5C0W3uppfhxu/Ohy1WUtPzwwEITlebe5ahszFe+5GzPkCXS65aCOeMpKXvb44
         Bx3guw2DgklEC8IXrC4oC5G5s99ubBY4+6K/v+S8y6FeRWYA3E3LZqWpwdagbqMao+Fe
         GST7HBD3WqQ+mOzowE1YvNOb6LgLQNu/8tzLwEQYVnT2xWuEQhfm7eQY9h2bKrpeHV2V
         gdlsa+GAhJb81sWsFw96MS2BbkbSUHoJvkVC3VwQyPYfXuojPjNnI819GhMmGG6gY2hc
         zjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948214; x=1775553014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4SE2VJGw0Sj6G7Ihm7UUx/mCU5Skr+1IWCE4i3UPs8=;
        b=ODxeuPD+7fZzwjO0y22KXR4kr1861pn/NjRiUqVd/mlSCgDqJ1SjLZ6tR4iy5lMhl1
         cK0XdcLD3Edqd0KteOL/7juxJBNVs/E6p1XoHc0UO9NiL1ipfsjrYuk+YiH+o8bYg9GL
         QC05RcFhJDqdbyWtYCduw/M2MNzADHXw60tQuPbU/17Yak1Fv3EAKtUdbnQ8Il/c0EwR
         /EIqlpGQb6dK1CL6Su2WZljbL+oVDAfZPrC1CzRm1G+03QiEb70yUMC0v7ixZE9zma3S
         qOhYylPgC8vjXYIbI+vg3H21xP/CbM/J6HWyb1F1PDFgZLbk9D6mK2nrpWlJxWRWfax4
         MqpA==
X-Forwarded-Encrypted: i=1; AJvYcCUuVNZsYAsinbi9I0WAephFa9Igac6HvLhg/eZtMxXWr2yCB9GB1Uno1yGZIaPVhJ/kOkA5MEcll6Pk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz24QbqnnaShXg8hl5ZgB1irvQtZhlZ0OdEfYoRSU88u32lkZ4C
	neETkXz94Vq1A/iBd2fyWyab971AKg2pCufulrcjMJSCE8PFZc/mntvGWZTA8877685rQHAQvSe
	ispxDT1trpyiNLcuX1fY3fjg0DI1tqNz7N6WQjwUG09GcNt6ae6TlEkcGE9dZee2c
X-Gm-Gg: ATEYQzzb5A8QdCfK9s32aAdN9KrFB9I8SCHHN+l6LG6ZcE9WBAyWCe97wL/fAsq/dy/
	rgHDFbXe1vjXRjH9fA4aBvoDxBEb7kSXb3Q3V6j4goolGHn6gJcisdsuF7KcyecEYRXFiYpWThY
	5BLKsfYo9jDqRMmhB1u75U5puH/hWqAfWJfpxbmvS8//3dVwuuxBFmDxy8N/ed426trw/8oxX5V
	LHRdJqmihFV3lteICo3Ytwpxbm2vf5KoQLVMFxx0/qP+LPaJY2t4I7Oll474ZvEJ2T9rQwr7u4L
	18ETOc7W3ahSzt4TfBwNsRLUHzalkhb72sUU+ou8PcfSQUWB5pkn7DuFw8fGnO7VE0Jr+RbgBcl
	ktomanrmqhdeHLeNXtTcKYdGVowFiAqj2MXOCdUQoFSzOlJIceA==
X-Received: by 2002:a17:90b:558d:b0:35b:9720:98d0 with SMTP id 98e67ed59e1d1-35c2ffa8265mr14652344a91.5.1774948214116;
        Tue, 31 Mar 2026 02:10:14 -0700 (PDT)
X-Received: by 2002:a17:90b:558d:b0:35b:9720:98d0 with SMTP id 98e67ed59e1d1-35c2ffa8265mr14652306a91.5.1774948213675;
        Tue, 31 Mar 2026 02:10:13 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2426896edsm105916705ad.34.2026.03.31.02.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:10:13 -0700 (PDT)
Message-ID: <d16efa5d-2213-4875-9351-de08adf903e3@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:40:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-6-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-6-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FmmcYdB5ZoEaV3Ha5-TejT-eNaA5HYaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX3KFfVm+goSra
 upt36sgtFLa3K9yA1tk8Dk2FFwm/zPOqXoH2oGyV68KdLiwWYA3ZXywZI8Bw286Oghjz4jslEsc
 7LSnU6BK6d7abYNOFtIYwdhskX/8b42b4XmEop6YDD3w6icvlWKX5xARYtIrbGEigpPvPbap4sf
 0kjbV4Pt+f6W9+4t31FQcVnLzY8l2s8+IpkA33thrUJdRYHGkjsXwwOfg02/s9sbGltGuv1tZCj
 u6WqXShLk+jLrUXYyA00sV2yV+5LjO8SvVydA6/b9/ZUcV0tRWRJmiArtVbp8E/C5oezl+VhQ4c
 V8/Vq8dF16UGjC6HQ96iQYQ6/LrnMiq20PgXoK6CWHz56NRRRzAB8mpSD3aXTbJgtoFZUqSsaW+
 KY5ZaOxrBomvehJCA1Jd92DZiPlG2Lx+e121+B5mWvXwBubClyrsXU7sC0CaEulFsick3eLdHI6
 ZNQIiwJdyNH2YxEZjJA==
X-Proofpoint-ORIG-GUID: FmmcYdB5ZoEaV3Ha5-TejT-eNaA5HYaC
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb8f76 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ejiLYX5kVw-NK1-vaKUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086



On 3/31/2026 6:05 AM, Vivek Aknurwar wrote:
> Add clock operations and register offsets to enable control of the Taycan
> EHA_T PLL, allowing for proper configuration and management of the PLL.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

