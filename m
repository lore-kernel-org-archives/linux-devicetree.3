Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0FD38E5CA
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 08:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327157; cv=none; b=L+6yRUG/qTRjuXUnwj9JGgmq1DYS2DRw2Mn5ZVd3s0R6GgIpHFcwmakBaP8hbSBddEYFjn9HXp4l1Coi4V4LPDDZv7Si/q5xAvfrD9EydUk22Afuaj87SB5p1agD3u2E8SvF1Zl8bNf8zZgCdj2fqIfT0aTDKkhLUA8xFUIVM9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327157; c=relaxed/simple;
	bh=54Of3e7Yggkod3PjCfn/5W/zJIFVeZdEAbZM5/C3/+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djktE5JJ+m0+8SvOjB6SwCYTeFRYRKNoTq4w+2PwM3MpPOIEsgPcGEjl1NpPaMjx/3W8MPJaXOpC55pTsez1SyY2mH2snWr+oj9RTfF/OV4WDeS8gOpEpysZDOc3Gz32DIp1yU+LInPdUlZmFf/DYQa941Zy5kGQ0ZXa++2/zVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pbiAhWaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFklRcqf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pbiAhWaG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NFklRcqf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G81XH73734339
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 08:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r953mGgqk4U50pCn5KsX+q3XQCCrTox6RKzou9EmIJc=; b=pbiAhWaGS8hwFtEE
	Xe3Y2bZdz3eWJo61Iu64eIgRsN0NrzhsEYR0N+796pVivo53QZ2jJVT5Vu4xgzEx
	h3axH6SGDaMebFQNCgfbQWdV76w8j4JXQ+A2MrxZaqUsu/MDviVhAU9h4Y2g4t9s
	rrvkoIUYr5hDB/thA4JScXRJfSDv1A5LEPB5UrjWRgdBUn5NxKlu7KLuRKsLAiLG
	7HZs821DhUnI+J3f4AtgyuGRwAdLQU5AI2xiR+SSI+8bUumbM/5CiWQcVZd90DqM
	ktqMIacxk9eHtHQmFtU+rnEC+bE0Uwyv+CuqpC6ipxVyNQCKYsS0cpw1wNqUDGSE
	azri1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcqwk2ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 08:12:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adc527eaf5so55798465ad.0
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 01:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776327155; x=1776931955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r953mGgqk4U50pCn5KsX+q3XQCCrTox6RKzou9EmIJc=;
        b=NFklRcqfDan5wmd5ZGe2JtlutWUKHHGW42ypG2rVa4N9OrgwbipUUFolviX8ha9qip
         j5py9bgtZwoDDOXYcl4EznDnFPgbIb+S7A7RctXxgpNRPYMMI4gwIs8rE5p1wrguuVjA
         MZWj1+Tj3hxnnOPquLSRmrCjwGEw51fH2rpVYGYfHhzP4p/sfnwHiYIdNodHQPzXabDM
         5Nl3aZh/OAYd/rdtUK8Y5kGi0qWfqRRUrw0ZIt/uGopzDGsdOXXv0GWbsAj5xAXWNwO5
         R352rb4gBS+vNPQofg0B8rg9rdOedwjAw3VU1SpqJFX5MJwjr6Jt0rVXouhjqdCbkO7Y
         cmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327155; x=1776931955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r953mGgqk4U50pCn5KsX+q3XQCCrTox6RKzou9EmIJc=;
        b=Ua7ljOvnfVXODDx2krrHWAxbAp/qCjldbWl2KkXUOag1PJzUsZJ6CJc2kDJ0KZ1YBr
         FXC56dxkzfsMef6L/vQT88IwzniS57SspXSg3UfYCj9RZqMc5jLrUFQVFWIupnnYYHm7
         svMBgjIzyiIcLrtLYj6TWwtZ5gxTlJIHi9agV3GuP07345LEgOVVknAiNCRfHMVZjM+N
         9mmUw7N+Yp0dEd+1mroQiesyBZ9xWGQR4FiEVmrO8RtNJsbjk8hot4ZBMI7q3Gxoy8S4
         Zp527BK7FhdZ1g7OXtoa2veEVyNzMUJYIw/fj9cWA6PBq4eSue5R1dbjd2UYLyvrFO12
         A/PQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EnNnmBn6zuDzphUqD+bqQ/xLPfb4XDXaC3OyNvOySf9hpUXl3o8cEvlhPRlVmGUR5QwY1qLr0Wbf5@vger.kernel.org
X-Gm-Message-State: AOJu0YxeCIAGtqzG8eL/Wy3pB+af6Jpwnqwr7A8Z86Px8eVxa4rL50gS
	9oFK0DDr0D/TVPtvIhCAu/rZYA2nvJFAbamNa6N0nVZ3RRDGRzolr96hYpo8vCtzFoS4x/+BRfh
	4OO/fMWqd5kV7foNDrhof0XXXLZt+F7K5FUzM3wtx2SrUy2JFnUblHQP5qU16lZQJhl+PxRX8
X-Gm-Gg: AeBDieulGUfRUPnoFsVSDVE96guM0XPsK+4IQk1z1w09inkdXok4wr62GEyDlxEvFev
	A0oz2WilGkP93tfaABYBFulGbBsvQcSnsSE8y3VGdBQVH3xVtk+NbltJYWvqEf6tHNloOyw3mNr
	ep2TcM4AO4QRnCThTfPud5/1eN1u7eIviJL6bAVjM2LKtTgOE4ETNQOucWJHTlpyoLiSfK8e1rO
	SDcvBGHlkgme2hECmLIs08BneXO1xM0lzLeEGGQj3LoSrHgnO6s4N2egTOj2Q2MnD3Idl486kbr
	DgU3J8MmzNpxZ2ShriDlSZWypTM1L39RDwItct/ThTMf8aoI8kJxiuSTcp/WVwnh+6CjlCqxmig
	A/dBecQ6AXIUg93NY9EqYCHjwzy80Hn4lkzCrHNtmupV2aNbglc0xQ99zLrKv6L2BrQ==
X-Received: by 2002:a05:6a21:1b8a:b0:39f:27ab:2438 with SMTP id adf61e73a8af0-39fe400280amr30057458637.48.1776327154860;
        Thu, 16 Apr 2026 01:12:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b8a:b0:39f:27ab:2438 with SMTP id adf61e73a8af0-39fe400280amr30057414637.48.1776327154405;
        Thu, 16 Apr 2026 01:12:34 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957eeacdcsm3808209a12.11.2026.04.16.01.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:12:34 -0700 (PDT)
Message-ID: <3cb86208-9536-4153-85a3-32548d66dea5@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 13:42:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ9650 SoC
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m1C6tFokdVz1swaWRdjc9hdQfHs-n8Gk
X-Proofpoint-GUID: m1C6tFokdVz1swaWRdjc9hdQfHs-n8Gk
X-Authority-Analysis: v=2.4 cv=XOIAjwhE c=1 sm=1 tr=0 ts=69e099f3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uiKLQp9ku8skNrCTpKwA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NiBTYWx0ZWRfXyqUlP7QPMVb/
 0uH97ulYsvuQ9o2RsVAiDOj+TEEXZnb3loTJkBghjgBvz1FkQz73JKdm7U/cuh4YvfcPY1O5XT2
 58TpozbOvAr2qB936qu9Xu+NaZ/TtXf3//y1W1EMF9D2n3sOZdsXZCdM2kJEJ/tnWcVa8PlwhRq
 gzw6z1sViM/c1tFZa7TlR/nfXFH2yqQwhCNwbp9DMNi6LBHHDR5+j+GEMEUEIH73eR6X7cVMIOp
 E3VdvKH69a68UgQbkG/UWosFDWevUwV5K3rSoZLC7bsGgzbjp/8E8398GPfLzqu29j+WocI0WUD
 QwrjyaiyEzds1gRYcns4UcF1mPFPSMr4AG9GAE057I4cRScgrK/lwsuKpbotVuuM7OFS6BgYqo4
 /E5VA9ol5tonMzKljHnnuAKne0oaxPdeTSP2dffpp7VGORY6RWo+lK6nVzVWgtTZVb/1iaQDlOn
 iU7X99MJZuMYig7KFSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160076


On 4/15/2026 7:03 PM, Kathiravan Thirumoorthy wrote:
> Add support for the global clock controller found on IPQ9650 SoC.
>
> Signed-off-by: Kathiravan Thirumoorthy<kathiravan.thirumoorthy@oss.qualcomm.com>

I missed to cleanup the CLK_IGNORE_UNUSED flags. Sorry for that, will 
take care of that in V2.

