Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6DE3ACEFB
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779238; cv=none; b=eSbczfzMxU/mdKNyXmbSNK3ftOfo3dNLng8+Hj8DHfT8tH0uy8JNiF59XiJuKH1tZj0hWJi7IWZ7v3Cprz0ZTikhoJ+ZGG0LglmfOVdyHoFje352aEu32tq75kMd1U4aQRoyypV0W9mHtjkzGS0yFOa/zqvE/KdjA7XL5m+JZqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779238; c=relaxed/simple;
	bh=hA9nsEvPFqbMIaleKcdvo8RJFFOUhGhAUa/aGYy974U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g3emMoBCpHqlIpiLDEtPqM/psJsBqgPeTfvJSuSyjbaIYqxAYiFVm62uPyziAFz+N+UvaRUJVyX32crkdXHV8DwYx0JWVUA5m+CO76sh+fF1tDwExPa4xYnpsO5K2GpylMp1GJsHjtxNs/bedypu7Gcp0o8FcfVghIBQixG9hyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjTjcTFr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jwq3WY4G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QjTjcTFr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jwq3WY4G"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6UnQU3263552
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YcCxTBhI40zNt5pIvZxjXe5DAlPoAygl+nUjTjWRGtw=; b=QjTjcTFrs3rK3har
	rh9Grnfg5Esuvrc8gj/V2izwjrXwLKdhCgEv6uLlIcjRLXfT7rhXq0c2soLN+9AE
	RmTnIrSYgiDcz1giUHtfbe9sBw0B30hP5IYNi4YHMgFLVdXYNQlKp7CPTWvI+2JI
	/oo4c4t3NlVVRM0+f8MQIkwHS6sjftIHhw+IgzqIPwrZ1OABXfjIQ9Fofjgoi+uI
	TiaWOTRtf73AlSZk5TBkFvAWHdWLcU/70y8fzw2qYcYEVza1TRyvotYjEOYbuFbH
	0pe9nx12LoojX6LiHIcTdl8e8TJ+gmxiIwC4OpoTylB9sOprySF6rSdNW8W1VfZt
	O187qA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs33vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:07:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8279604464so13142291a12.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779779233; x=1780384033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcCxTBhI40zNt5pIvZxjXe5DAlPoAygl+nUjTjWRGtw=;
        b=jwq3WY4Gza9aVed+GaKhtxMKkl4deZoZQH7p+KTohijNYxQckKmUagJCLiWFZUwUTV
         Nm54XsKwTPp2+hA5npof70D20zafXfg15D+laYPYEOB4IX5tJXB4Zhp1XMNMj+9C0ENf
         /Fs/4wWyJwnqJ5HOQic05kkaCFqhr68MQuaCE4vg1t/5mYWpSu8j1HCxRLB1w5Oa9adJ
         dx7iULWfN+HRXWGyRCrPLiK9BdbVP4+YM5paiSV7p0L/rQ0Va89lufArje0RsTaI8mTe
         HhJ/u32SohLplKkU5BWDfatRZWnymp3S3S97Mfv8cYd8Eg1LIHFV6cdIOgI9+IgOYsnZ
         noCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779233; x=1780384033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcCxTBhI40zNt5pIvZxjXe5DAlPoAygl+nUjTjWRGtw=;
        b=U4o1FF4mKGmDKo547rxZdJtDrNmuNIjbbSZ5BjSZM9izgfwK2Q8+NdWTn26sOlEiYM
         m+cuvfUP33gintxl+yp3Jl1iwSy2W4Ja+Cyrj042E7s4D6uO9x9eqNZAfn9RsTfZeSLm
         kFfvxydAY1eD/BiCWv8E2UC1dx8VmcUgLihzWIwFjySJlNvFnZpocdBMpo/wmCrx6YQN
         AckOkclgO7S16nmWymkrXLh8CmPadqx7tQzXwfTD0j4MEARP4mGAKHdv0zmRDzqv6f4j
         5kS4g/iYUV34/Dw6SWRdY9o4mGqI5skFqIeyt8tvSt7kW39Pd0bvq17csNoHgwIZxTvS
         Wz4w==
X-Forwarded-Encrypted: i=1; AFNElJ9LsYIpp3C1X6NjE/nTcL+VQuHwK31ozOzSvDc14FCYRrOySAiuN+ytUwRaxlLSpiD7Cl50h8OeZs1p@vger.kernel.org
X-Gm-Message-State: AOJu0YzXiBQSa3b9n5Qo+2xyynBEsFQ06qBbIx9/Y/llF5s5u6Kpdd3x
	fVZIqb82IqO65ElWJ0PMob4/7QudKkZyUuF0N5iDeukhzVSga9pXIT2E3tl2lDnRSFydYIekrao
	tVuZ4L3Oi8nv/lY6RPwig68FayGC1Rdj+Db3Rw5BDoGLwZWYk5/u/+PF292Q8zrwe
X-Gm-Gg: Acq92OFO5FjtpulaeN7CqeryuoC4j3/8MPqxlfiKbNzIM2K4jOoUcvyBHXhhMl3Fiky
	pzF/foDCCc0Y7j1/ZWAWAtQGxEsvxXFoVGiaUxGX0PlzEvzMv+CBldXR68+294oiQ2YGhmCbatW
	0t2eqsff9YpFUx67/lCx+DH8O0FgmGHrqBwN5E0sC3g7fOgu/oy6VlwNQEDntkjULzmgQVk3fHU
	S3meTzDg1gr7lNelD7GyEu6e36+qm8XRyOJfYB94bNu6jyKWNayS9tYRHTphahqNp9kLi3UA18v
	zljbUo+PI2GjYb8YljO85iXv7VewVE/rzVQPmdWcI6DHUotzFcYA6m4j/K7k5doVA+CG88G2USA
	PUxI0zDQ/QeoI7BqMUcLsxu0/tImhszRf4Ej4YEfFcMNoLIBW
X-Received: by 2002:a05:6a21:3285:b0:3a0:adc5:52c1 with SMTP id adf61e73a8af0-3b328c4cbf0mr18666824637.11.1779779233242;
        Tue, 26 May 2026 00:07:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:3285:b0:3a0:adc5:52c1 with SMTP id adf61e73a8af0-3b328c4cbf0mr18666773637.11.1779779232727;
        Tue, 26 May 2026 00:07:12 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb3083sm11332846b3a.43.2026.05.26.00.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:07:12 -0700 (PDT)
Message-ID: <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
Date: Tue, 26 May 2026 12:37:05 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
 <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a1546a2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=wZGdkmvsolkkRd8yDogA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 9X0HIxc69hdfnH5EPJiv0ctLXK3JQYbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2MCBTYWx0ZWRfX44e8W7o6XTl5
 CZfE+Oz5lWzQl0HHfG9mJ1juj18y0kHPD5eNfuGfEK0JMOs/CuaNiVW2kp4hWWf82WZhOfBfpN0
 SEEL5sv90ggCQwWvXLBH2YW0HeT9qs8CBRxXyvQqfbvHn1dso3VRjB+Bxd3g679TCAXxm/CXoZD
 omw2OT49vW2szee4ce4kOfNiPlqdGco0bZHTYzPe/sb/EhDZrAgGYjYCS/6Y/HQj0pkG8zVThia
 O4FnxVvxyCXPZAgKCXtN5OvbeSS2MwKqgnVDv06JdwOTpz+k72vQAzuxgQToikS4uIgx+TRVjaG
 vgCluD2kElBEP+VDG9D9oqhlvZc2FDwTfrGbPN/yEH0fX0jn6Ce3VcSgebVnJ1dzrIZNLR4pc0W
 uYD+inlWLugWJSEJftw6yD3NQrgKfGMDEDrP5C3n36PhegF8/hMj4+OOH+u0y3DS4ZjRVLFseiD
 CsWPLZpgCcyPKfske8g==
X-Proofpoint-ORIG-GUID: 9X0HIxc69hdfnH5EPJiv0ctLXK3JQYbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260060



On 5/26/2026 11:16 AM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 10:59:44AM +0530, Taniya Das wrote:
>> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
>> registered as standalone GCC branch clocks.
> 
> , otherwise .... what?

If registered as normal branch clocks, they may be gated, which
breaks access to the EVA clock controller during clock controller probe.

-- 
Thanks,
Taniya Das

