Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3535C3321BF
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778140900; cv=none; b=I4QPPlhHiEaHpmcjq1sWRrrSTNdP1pC6UPrAA5+eWRSwx+d3muA/N0e+i+aEEIl6ULXqDAF59Gt0PDjryuX+KkUyKzBye46QYh/JQZF4FSevLHJNREcj1WICkMya4mqBVvUe4+fg6NSjaPt3dltBETJ2bYWABJ2zsL3c/VXX/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778140900; c=relaxed/simple;
	bh=5Rtl6v6NNbV1X+gpoGuS99EbUlh7f4FwWbPb3hKL8hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjnPZmn14gj/+EfYYSHoVSjE7ZckU70QoxizUYFFkfYKrSxPcJz2BFEZc7ftTjtXxCMwhmvLyb1GC2e8lYm8ub5m75i/7+CDXuKInhgvs4tPIOefpy03X3m6On7IgEdN19NTQvqRUncYNno087hIwahefxR2Pn4Btz7udgAneBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtAcGAxI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0hd9R8u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtAcGAxI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0hd9R8u"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475MSOJ3157880
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 08:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DJbvh6Ff3ErWjQAnyIhu4En/NyYHcsCrkXudwbrQfX0=; b=dtAcGAxI1vJxeRPX
	xdcs5EM7jPWFyZvW+Hr0iwmUJxqUNG9SNLnR0Ebsb2fVZ4R6AXcMa2x/Aet4yPgj
	irD88uGLXCIlWzvIm7SnCGwrdGrnXkOSL2LTkxalHlD+oGcqml5ejj2AX7QE63nn
	LDbrszYQeoSMY0JlEM1OgjRJGbmo1wmt/hqtj7/AypvRckjpUHGfiAsALQeUJzM6
	7Aw5ehk3+OSKjAy4eZn06Z6xlWEE0jfiCluuAxDGPDv1huzqh0Sh3mAJrCQAQf/D
	iiJ48JEyXd5TGWDIY/hXEmN7uL/RuWsK+i66tGG0DOYinHAiBCsSfIH7yER4XL+V
	Fri15A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf0jdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 08:01:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so67963e0c.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778140896; x=1778745696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJbvh6Ff3ErWjQAnyIhu4En/NyYHcsCrkXudwbrQfX0=;
        b=T0hd9R8uqmuMvEOKsC2bNuOa48YDg2+KcJYN1UFPerHpeY2ANgOv4ZlaqYJ7+ZxgyA
         uJQ6yq0dmKt6c3/6lkw+RqvA3VnRclTdpUcBEKuT1CCekSIHSWJS+Y0YJGRRxWa1IDYh
         DPMPTm0c42g86IWtsNfCeeIJhfH8C/zVplk54GJidNjftkHE5WrzwVIbeF7oaiYD4e85
         t9E24vx96cYVGsW+jtelQv6Ev7h6Sdqs59P6G5A4tXTdhD75Jz7tr0CTD9kMJbZcfUYA
         UBf86sqzWXoFA5WscMNMFwHSsDFA1FTeBkT8ruMwiDcQqICjMESxuIUsdt/TECdzLD6w
         yOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140896; x=1778745696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJbvh6Ff3ErWjQAnyIhu4En/NyYHcsCrkXudwbrQfX0=;
        b=KlXxUwIwh38W/FOfDi7PmnXLTj8EL0lao5aQqI/ZuqfMvr5GwLb1XX5y5U9LY9TPAn
         TpqIClHHch0KEt2HSEHxwMpmwVyrxNXtCTpBu/MDfnQcJTfoKznWy6MjJ6KqUrq5qZWi
         h3hfDO2/G8mAf9L7mp66Tu1f84/gEbWkUFHer36T4O5hfVkKNljFdf4oxOITVUIN/SGm
         UMqUcvLwQMpI7dc4MwwJFZTinr9loTbGr6wt942Y+vAJcAt26f+Ctl24TGmoLrNEe93O
         p5ZjqIBUyqDyI+4yNAuV8Vzu8ZweD2unp4FQ4CiUfbzmlP82Ou/Q0KYjQKqJsOaslHpt
         /4Yg==
X-Forwarded-Encrypted: i=1; AFNElJ9A7YxamYyAZYkEPybbYq2At8qD+8SCLarPkh6XNVHhabqRFkLB4Fs9ikFW8DIQDXh/4xAcH1t1qzcX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzssct708abqv0w4xoaNOYsTutOmKXj71oRz/2TzdbcCWRKReQn
	V/ilruS1QzJftc3rNmtS4Rz1vN9N0T8ud5EDh69mh6yvOPKYMW+8+miXE0OD45r191dxwCc+Ark
	yWggTMzuPb+kemoZiZqSHQ5zYGMFWwRlYSgsqsO34sEW9Nj8UVwagixya67+12INx
X-Gm-Gg: AeBDietCS3QWukxm0wgzNnIvdeI+uHTQrFI8KMYjNREJ2fhOL3sdSQIw+9atC6/bqbA
	7AkJST12oqrSK6vY+gNFnZT7nw77dPJn5A4K8VloANWeDDdkcYLILp5yVorQiWYSRB0yRNJGHhM
	BI9/AuN15chZ8xkNR5SlezrPXb59U5Oih5d0u4jXH2fXNE81Db8PMOD7CSfuTRr4Z39I/w6foy6
	YMeabjb7iQQ4T+qs4XoWzHsDyS1Z2XyrQV6OiDfO+xp12F7TX//SLhIVtzSgabS1hrG+RTAB/qG
	ilQEDf1aCcSpgHlrGsQl+x4CfCxRetV5uaZj9WxJA0agle/ghmGv5cZSe59lKEASSuszgvmurZE
	/WpdNfcgR2uwbRLe/yhZZp6WkxKTuICkMS7QMtGoNzMGeBqU8ScrfJf+Kbyg6SHm8iJzjJKXNae
	b/7LrXQbNR8Ro79Q==
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr1182883e0c.1.1778140896044;
        Thu, 07 May 2026 01:01:36 -0700 (PDT)
X-Received: by 2002:a05:6122:5017:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-5755b2b0d03mr1182854e0c.1.1778140895636;
        Thu, 07 May 2026 01:01:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc833742c49sm52804266b.30.2026.05.07.01.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:01:34 -0700 (PDT)
Message-ID: <9545da0b-d6b7-4298-b86b-f981908c80f2@oss.qualcomm.com>
Date: Thu, 7 May 2026 10:01:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for video
 GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
 <20260507-iris-sm6115-v1-1-0b082ad8eea8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-1-0b082ad8eea8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OCBTYWx0ZWRfX/rqvWwDtIXyt
 D4Fgy4CD2TlG8FmSUYIIFSpl/gMpM94MWCseCgyWgGDpvZJP/2mF26aD7qnesHXaAHxRlY52P0f
 17/56SFohoB9kC8eMnDGTWTVoOXpgc9Xn670Mw4MRnSmoVXuvFKz1upQtL8dbFjIV6TzSaQ/mu2
 w2qdSjhNzlLJZfubyv+F2c93x1VmAc1izaWuvaG6KGLvu1twtbaeXtS0hNg185DIBrszYdp87Ul
 Rn+Mp3GZQR5+5jXcKrCTbGGRm1D0WzlUSqB0+fcTjFPQkknzY6bobrFXmD2F+tthAEOTUqnDbqq
 QRZ9tIwAGqHNN0tSVES619/dlBo8vceL2s+o5uphc5KP+vQm6njBRUVGSC3iVig13qe5X8BeCDd
 GXb3gbl+HJZe1/5FiPe/uMIi5c6PlyK4nhGrtcw7LQrv3KozxB717m6hOBUCAtzpFfYc1vBe2/Z
 IJYIUrSvgvBpzic9Shw==
X-Proofpoint-ORIG-GUID: UsLkdDGVKLYAomnwO1EemSVCQYVVZWIB
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc46e0 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=V4j3QN97b3vMt8JjJHsA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: UsLkdDGVKLYAomnwO1EemSVCQYVVZWIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070078

On 5/7/26 9:08 AM, Dmitry Baryshkov wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
