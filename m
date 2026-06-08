Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9963CE083
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 17:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938802; cv=none; b=rWONX5WiuKzinGT8+D2CsNMRKrQqx5DREMghXmtdKWn05073YMUH96uX8j3uzpqSiOoY7TV6EfWeMMsAPHcCmr3zzqEZvQXTuEu1LtN2efRuCnAAfPxFr0grUnhBEU+TlmyL7SVQoukO14UsBEs47VomZj9ThrUrOpB1KXAJiVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938802; c=relaxed/simple;
	bh=w9UPeMCzmKP4cwJBV6uY79TkRH4e1LLUkbhEgEb565E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PT7zZ7iF7vVe6rGhmxfeD/Y44Bc2fcy/F9gEV+9eQPXSSxn2ipubKUEkwvK5P1KzsDeMlmFNo/hHVb092Yso4lS+I+AMiLp5yp3jg+cIPRg5tA6uHqLm1/J0rluBhSnT317q3kxZCctkWg9g+LmIccJi1gCLeKUDAKssYGQPNAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSWRzWv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHQofpty; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSWRzWv5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHQofpty"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFlok3552984
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 17:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6sR6VFzoNr94h9hx4YsrKB9qsr3ZjM5UBWPXF5PAwIA=; b=NSWRzWv5MxkOuENJ
	7GKDq9ZjFYsprTHdOqaLNkJbaMXBgAhHhPhqGpSS+O0sNG9ZP0WJ/nuSZcz5/ylH
	ESd4k6edwWVfwwm0FBxN5fWHy+/RgtshG25YDpIhdQh+hPMArieiazVTZGyXW+Rw
	AIgq86A80JMyfc9cKpLgM7z+WHipIw3Y+SsXuY9Rq17HkqO/ULK09GdIq5mnYrJg
	H3rSZbA4sYuBkU/sDL7v3keb5hDa1HScKcpqzJh3IbDEZa/LFyTRs25xoPvtm4JT
	aNkWg63HwXwEinCY+H93FbsC3dXL0mamqziz7eGSY6ZFs2BU319ImmEizQe3tAyX
	0b120w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enunaa0nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 17:13:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a2bf5388so2523284a12.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780938800; x=1781543600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6sR6VFzoNr94h9hx4YsrKB9qsr3ZjM5UBWPXF5PAwIA=;
        b=GHQofptyCT3r3QI2knkXrJXJkyyFWSr3NJi3o7Is7OHt6I8KwRgqphiK7LHsbjvUlz
         RIUNM7kNRGJovOzbZgGvvXnl5URSltisawSqoGSx4fz3AJaiJtfcZBd2bYjGxPr+krNr
         lwh05Hbf+WOMWtO8IW2u5sNQPINuSbD19EootQiGb8KL0Y2IJKqMdpUwirUisv5RQaUG
         Tad6BYY6nu5VQtRjkUZGqbJ4ych84amOrBq/ww4KX9n0ebEEdzznWPzUVjN9m6UZZOck
         culKzlr1jLgj8W0eTyPOTX+Pg5+QupJcfp5EQEAoYvK3R4NwJX6+FO8WMU40kx46fhb3
         zigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938800; x=1781543600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sR6VFzoNr94h9hx4YsrKB9qsr3ZjM5UBWPXF5PAwIA=;
        b=Cfz2jCzef+M3jv7IHLQ7UzNJeuRP5rwKEej7NwJoGB9NA5d0FkfC5JYOrAAFP+4Zz2
         rJhidvyPPu6ZDhTtWL2W8kWrUTwNd/YzLjIzon6zmBbG1FEeZ3XXtnznavrwSl5wMwYy
         tojXpqe/w1M0C07KaLQuIS8rx+GNion35RtrEu9vJEkFyrBZ/ogSUhRknlGm5U2aZvnb
         yFf4rAumC35Dk6YNq1daJDhXwxIlX53Utf1CTKaS7kNPcmnHW7+Alwt7IxZ7mlQIbPoF
         U9pneXPdw+mEpfpazEZ9FQBvMis8QgHAjVJufw3iYYudvBOi9KJPqxepvkWA9HqLF7oX
         nAJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CsxdSwshgs7MYWiLoJfuQToS5DBmKNHnAKAmPHN+VWcLmtFRA3jiKvIYCRWD5G0h7OoSnf1kaYnW9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzep/wo+iBgVItmIrHTouU8bcti6GVDGAHqSnr7XD/goI7fi1LM
	aDYCQYtfhUGkzNU/BoeoXCO0B1tBy0gmB0DvBAKgxGB2YzCEn0LKglKsphnpvaRxs509xzJzhRx
	InYBAOLmZCMuzw8+7fp8kC62HdvcWUUoSQ2FYPWTLsD75AQ3uvukUp6VGFXtFLjSi
X-Gm-Gg: Acq92OHJAjrdpE3WJUGXgg2TshLXo3TjGBkJ5I3+1799R+DCQCcHY2FwAJA6B5vCDrx
	DA+BD3ZDxoWX8z8iuAc8TyZdmmfQ+EdXizxLIuSVPNSE4oc4nLjf0ZpG5pF+hjRWLjCH2WFyLlT
	Ly3VwmQy2BRMJyyC1A/6c0o6zqvP6Q2RAl/EytE2mIaJT50CDwnNRnRR8nLK2tdFvc+Fy6N0sde
	RhjoB6n54PyibelsBJALO9Q0DFyqJuNo/6skAT4wSK5o/S+XOasFBz3Lyu0h5gmkmntUGLCUEtU
	YXqb+eoDhTGbQ8QC+0mNO9y/nvbEVHU6BaxbpjM0LFA7l8ZVxVe3pLCkrIaekFU6IeRL1n5j5Nm
	XNkr4edJ87jr5XbP/ARCAou+UUMULVh1gJHb+LCpsxTUxz4l8GL/8rsB9vkQ=
X-Received: by 2002:a05:6a00:2d85:b0:842:74e3:48a5 with SMTP id d2e1a72fcca58-842b0f8febamr16529210b3a.16.1780938800181;
        Mon, 08 Jun 2026 10:13:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d85:b0:842:74e3:48a5 with SMTP id d2e1a72fcca58-842b0f8febamr16529154b3a.16.1780938799688;
        Mon, 08 Jun 2026 10:13:19 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm19056739b3a.42.2026.06.08.10.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 10:13:19 -0700 (PDT)
Message-ID: <13855a40-0159-4fe7-a886-a8d18c081e12@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 22:43:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2MyBTYWx0ZWRfX9AqUxj8G3TKJ
 8k2yH6PdulF/VrFi9gSXf85u3IgD49YLn0TLIuzlrKlwVO7eYZifNrhjZGDW2ofRCGPYk72x9Ug
 AfZexSIIpakmBzHTFd5gxM4uHtE935HH+CCz7OvQsAnbzpxqzck7pHbCzOe8PCGJROD7HrwRy4k
 qpzKr78xRaFoOFCJkXPZxsGS8r97mK1DRudJbC1aqZOjf0y3f3MheuYxBWU0zovO1Te+Tejr0qw
 ffVbwexlmKH/ZLZP8Wn7HQWwUMuTIJRthB4ot61F7YQJaD0MriTnT8io75nqQEObwBhrSZo7JVb
 +svu2RsVFN67/PKwWWC+Wlljwwt7ldxzcqaTJ/OISrSHahNmHrraKPfZuEDqzD3Nuuf/VUr6p2r
 bWH0StcPY6/J1+W5m23rofq4A8JlYyCIHkel1SbCivqx+zREMWKHihHPsk3zqbUBjAse3dpxyVG
 2JCKk5RdHbFjeyHX8uw==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26f830 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fk8PawD9j+7+MWV0iRjLZQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-eDLaE2-C-4KfPfq9Y8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: KW7ClzY7pPGDNpUPvQ8wGz8NBWEJKF7-
X-Proofpoint-GUID: KW7ClzY7pPGDNpUPvQ8wGz8NBWEJKF7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080163



On 6/8/2026 5:51 PM, Imran Shaik wrote:
>  
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk2, 5, 38400000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk3, 6, 38400000);
>  
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d0, 1, 19200000);
> @@ -1262,6 +1263,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>  	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
>  	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
>  	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
> +	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
> +	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
> +	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_38m4_rf_clk2,
> +	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_38m4_rf_clk2_a,
>  	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_38m4_rf_clk3,

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

