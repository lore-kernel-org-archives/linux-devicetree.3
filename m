Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7953B8922
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789100741; cv=none; b=X9TOt+zc5mMrJzEJF68iYzwSJdNDoexeWV21FpgOxuxSanb8n0MchX/ebhP7oMXNOOylAT8TMYQ8hb0lkJlcOaUnPOZdh/xFWyl58X/Bh+ggypiEe62rbq+n0bju5/V28kCPyel2qdxNsV/RA9RPlDxLeKTPldYqgpYTMXtkP1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789100741; c=relaxed/simple;
	bh=Tt+268agdLGbBViTz+33MlSnJstp1KhOV18oFoixlbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mm+UzGBACSx3POyVHM+1PBNjeaEPoTs7Kjb5NT5vQt+gVDERjWc/Ru8JbvjYcOsd6u7+9CWFPyfg7Xw2w24Vo123WmKfZA2c/UxD4comKKdMalHCUr6Na5Sxqb5EosszD5s+RaqS8HrwH9ekAoRft+Cy9ITtvb4yjO5DlhDq5hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMzBswL4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEYb3jNb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMzBswL4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEYb3jNb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4MBBP3586832
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXNiHzXDwaRs2MPi2nltVM1qJwluQ7UvnEYAqxcDoJE=; b=EMzBswL4pT0gHZ3G
	yLsKCVrdyS5CuEACiZbnBgeqlpUWbYbL5Pq6UsWlpzYGF1yQRyeHwJ4n7Ts2+KUX
	H13ngIXcHJZ5ZahcNXKg/U5tbnkdtwZNb5u7Ve0+vd0zDpkSCsDzaECX81OWs0D9
	ILtUmUcNPtnMvXPmo1VGWEQMJ6lb3KlBw0/eyKBv5SvouOhpc+UqWMcMUuIu4wYB
	ERkMyTPDxxF+U/K/S3rSuE61NybMSDP8Nag9JjgsYj3dxjJL+myTeSUpp73Em52I
	DQkJD9Aye9YE2KkBvwUuRQaaDXwpSMSizc200V0xcZUmgwCBNhJEYlTeqVirjZOS
	Glnvrg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q11mjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:25:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8663802b58fso508462b3a.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 21:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789100738; x=1789705538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXNiHzXDwaRs2MPi2nltVM1qJwluQ7UvnEYAqxcDoJE=;
        b=iEYb3jNbg3sYl/p6n8thpMMviX5qeNa5FpNfal0d29c1qs265CMEghz2Rk0e4Rqs/D
         PX8wQELEIFy3e768DD4UgpliupuFFN2AjuMXMUEsvLjJSrRiVJPcznEynt11IHj/wcgO
         WoU0GS5pGGuNSSARsMgWOGQnuA6N8Lu2vf2fXZBn6IALcYyPGzMfaN8pi4J1NIJ/WvHe
         J1A/rPlFvJjJEkr5NxbWDAX6/8Ef3XzRJ8NeRv/MrIKLLNoCR/1jthgiBkqTEEQVBs9o
         c/ieOc2eyQyCDoRA/wUohD59VnoYueswnio3vORJYVfdT2DHkwyAEiso6AneNAAnSymR
         4lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789100738; x=1789705538;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXNiHzXDwaRs2MPi2nltVM1qJwluQ7UvnEYAqxcDoJE=;
        b=CRQgfropGE6d3HcCfw5lQhgydyoHphuhzTfLZcuh6zVsS8IhQE5DzIhe8ysDZuEOl1
         g+oPk5z3a4uNGv42+gbtm1I2RHYJbQB3d8jkkZQHXE0yJLgqvifz0UYiYdJK1K4RoB2h
         woeMe0sGj+iE6ryKgidBcWC8E3AijDiIRgkUT6X6K1OJLJslcwzYzvLb8/XB9Np/U7zP
         xMZOVfw1+jQj/tJ1gDNQjzhd3UZHSxkL4qzZ0va5Ztqz4n+CGJPwYU2q+xgLe4UZIVfo
         afymzS/rPEmkJ6n7cq3b4yG3MLPW2h8qw254lflX1eO7sxLlEyWJhnmpQ6wCXZulSpnF
         nCYw==
X-Forwarded-Encrypted: i=1; AKwUvByteNCPi8A501sEn1ItAK2/JXUev4byZT5Lh0enEIZHXdz2CX39ZGGIroFN/ieNyC5jVAM/W3Bo0dKT@vger.kernel.org
X-Gm-Message-State: AFuF++kCggsDCUeA9n+LE5rnWGvhHG8DYLCn0mZZt441sVyRf2M+/z+A
	VbKEaeTg/uH26TV04ANNKFlxBOp1zH67O6ro1J4vno3AvU9iyHMHJ7YW4w5+WyAep2mvj212HeE
	Sz2k3G2E99Vcbdrnb88ooqWfDNw8iMf9oL6SP+JBjIp744xov3KRAHu7EKqqVfCi5
X-Gm-Gg: AYBFou1fRqDRhwlsd9RCy1HzmnZwJ9QkfiE89EoggiSN6rD3WYvh4yngXlO6TzYAVjP
	AmF8Yi5duQ+w9F2OQ+20+pctr9P5D+IBWtMxRtH5su5qReRNqUn6bkEBV4tWcpEyLOnnyIa9CYm
	urgvP5X+cpLadZmPizpx3v9tVT78JTA9ISBQ0tdu4cimAy7xVNvNK4lMujRxisdSXTeXoTXBsLH
	Ou7nlqNt44fYVWCJi9AKhIIW3tHbdEPkT2ERjhKpC0sJ6ww5YEgH/IvF9glVN5LBPdh/QI7InaC
	agjQdQlouY1ab/YmLgapoOmLxPWVchCmAwgPFIhU4AVHZ85WUDswGSbOoAdW0CiuKle4MbyKnx8
	t4/cjRfR919Pv7vK1wZdd9Rnuy4w=
X-Received: by 2002:a05:6a21:684:b0:3da:7154:2ebc with SMTP id adf61e73a8af0-3daed28db48mr4941934637.7.1789100737680;
        Thu, 10 Sep 2026 21:25:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:684:b0:3da:7154:2ebc with SMTP id adf61e73a8af0-3daed28db48mr4941858637.7.1789100737020;
        Thu, 10 Sep 2026 21:25:37 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf31c1sm2689172eec.1.2026.09.10.21.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 21:25:36 -0700 (PDT)
Message-ID: <3d8a5b6a-7393-4d9c-bff3-559e5c870011@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 09:55:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: Add support for the camera clock
 controller (CAMCC) on Hawi
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
 <20260908-camcc-hawi-v2-2-f892ba1d118e@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260908-camcc-hawi-v2-2-f892ba1d118e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa382c2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=B4ecjq2AI764zdm5JScA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA1NyBTYWx0ZWRfX/oeduOUD2hPn
 NXiW75jaxv/BhPkv83QHzh6CvUpwdt9Sy1d7JgwSFhDC+PLzVaOIJSngvx+JMf2AaNjFJIcdnNc
 /4/b4n+2rjk/FaHL5J3M0dZ/TVOuttmijqHCAk+hdWvGB/KdP7eDUJ58nEBc4WZFyML+WgM/smQ
 v+1eWJDq60CvR9wXOTYbfh4P1dCKuxE3hHsjPVNfZh4HUFwZhxAtCHsBZrDhAMsefoP7vlwWeyl
 gbM+OdZ/10K054/IpZLML2HCb8JjilLP2FWK9HQfImyo99k6hgS9brY10HcZ2TvbVycudXisexB
 Wci5NiazL69xRs7EY64M+6+xkLl2Lcn3s05zJ+M2IPnSAIRYhHfsR1xwf5JdBJRBj1jfobk8WGH
 zJ6/vbRFiBBz3FcqaIOm9iVlD7skjfSRsPHR54ImlfNugcWhuE6bFoAKwRp/6/LvfrabqspP1xB
 tjtWtcJNyd8N/xnpUtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA1NyBTYWx0ZWRfX7x7bnV6VdRcW
 V01NDHY6XhDjkYpiWL+ROr84KJCB/oULFrGFIXJ8rTR+sEiGj+RHePgkvu4qhUe4t1FmPJHHU8o
 ClpRR7IkdWmbC6bK69SGCtkjGX3f770=
X-Proofpoint-GUID: 94Epqg3HIMkJoxy_wheJ3AIu7Ny-Ke6P
X-Proofpoint-ORIG-GUID: 94Epqg3HIMkJoxy_wheJ3AIu7Ny-Ke6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110057



On 9/9/2026 11:31 AM, Vivek Aknurwar wrote:
> +static struct gdsc cam_cc_titan_top_cx_gdsc = {
> +	.gdscr = 0x21388,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_titan_top_cx_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +

I think we need to add, similar to downstream requirements.
Please check 'drivers/clk/qcom/camcc-milos.c' for example.

        .needs_icc = true,
        .icc_path_index = DT_ICC_TOP_GDSC,

> +static struct gdsc cam_cc_titan_top_gdsc = {
> +	.gdscr = 0x21330,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_titan_top_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +	.parent = &cam_cc_titan_top_cx_gdsc.pd,
> +};

Here too.

-- 
Thanks,
Taniya Das

