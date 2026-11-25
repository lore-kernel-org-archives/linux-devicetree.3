Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608040;
	b=Hozjcv9dcKaMTcauLwA0oygVuqsuUCOX6LopGRHMtxae3wlCUJYXo9K8GmOATyPu7G0Q
	 yQx+pBF7hs79lkQZBLNLxE9lPm3Du+16qvFNnjrabO40uTlpCE0hiDdE/nn6S8YgmhNfp
	 XnrP9OUSj8eb2aCi2o6gfhwtj2DutZlELkAvNOy/Klr8jaR6tqYcIjJ7ugZIGCWUQYOTA
	 HIxmFxvRE6haGRrFv4eWimsugy2zF+Ki23lXjDIxOLPq2K/8KXCHRxZMRpqg25gOsYyPA
	 C+t/vovdEKdXtebqjizBpNirq/zuqAtpefjHaJwJhi8zTE5GdMlvUdIGHNbrRpy93Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZGmtiss+37jmH+iF3YqbwmD4+9FY1uTsN9kR+qeAjgg=;
	b=hu/f1+CDMQPQHndt7haTt3JbzHGLy0mnIH2i7GXnSAiC3i7ybkpWzJscmQr+KOFr6ZQg
	 p8SMGuq5V8YufW5eu0Fj+Td5ItfXSsyJ2l8nxkQCDz0odV8hOi2BOWjGtdFPwDEincr4O
	 GgY0GS0UMguGfdLi6Z/Z1Gdhu+bfwCgJqtg+0Mrbs7Mn2waWuKCYAGIUK3GonqTeVcO6z
	 OMyB93wYDVI/uxVU7yRFO1gLdIYZHsNecCgZ9Gj6BPpY5cilPDsgHDukhIwrfJrOOWbYf
	 +sB7A3tTKiR9q2XmpW0C4E2idZ00RAM8rL8xzuiHeNe+w7XpUnxNpRPqNoPxv+Xhy1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="c33gkj/k";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PyuD9xnY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A79606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A79606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c33gkj/k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PyuD9xnY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mPVI2121252
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGmtiss+37jmH+iF3YqbwmD4+9FY1uTsN9kR+qeAjgg=; b=c33gkj/k+xAEBid9
	cfhgRNxHmvmdPnEq4qHSgM9+ksQzj4QTwJXo5Gb3+tuH2AdvABDNf2ReNSrx11BX
	ZvdpJpMdIzJO/r0xRfzYNai16w1ncvLhqanYSJYKEXfleFCzeGyryHkliEifQP+f
	4lXToPQZTfaCwwXbABBr+FvRKF2407zO8Mes+dOLOYb0xY3FJZqTHIwrHpeR6mef
	uX8v6iOwM6zb5T2brTgYzdwdvF9Qh92De+cm2Azq+yPaXKRz/1own6DQ+R9Nno+u
	PSn6w27GkD+e1tWGjtgBcEJMvIHgmKGgwWh3u816mACC7tKBbUwCLZ1hwz3ZBjbU
	oyU99A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukrpwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:00:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b7cc3f8a4aso4124070b3a.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795608036; x=1796212836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGmtiss+37jmH+iF3YqbwmD4+9FY1uTsN9kR+qeAjgg=;
        b=PyuD9xnYA03aU+y6IUDbB6VjSOb8CHSZwpV/29wnY35vunbCTgADsby5VfpUhBr86F
         9iW+wpKyIBG33lPNxOGQcBb489vF0y31YvfLe/+w+M/XCZDPTFyBFtcvLs5sUpJsYSRa
         Hsa5ynezOyqdLeNkE6sveIS1//EUNENkDMcwlPI1rbPU9hNOIxgD0rL3yR9DhETD002W
         c+M2ksR7iuR8a8rqsdBU6JbSsUZiprRePDjhJoMwBJg3AtnOT0DdUg6YONdwW16nUDlI
         chuadpcBBgxOsyK3zFV3xzOb7Zf3DmzbHaCL7xEz2QH2IbWdg31K4ycBkbt1zvYGelOO
         b9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608036; x=1796212836;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGmtiss+37jmH+iF3YqbwmD4+9FY1uTsN9kR+qeAjgg=;
        b=Dyy6AGK5LYUnFVOWSfv3i3xcS+0rVHsaZHraf5jjeX0Ab2exppPuWzfhtgf7ZO5LF2
         8ZX3gt6DttHX+g0UleegMud5wrbxLsw8Z1ucfLW+fFlwiB+T2GASpurPI/R82EgBAgW8
         JMvluSz8/jn5ZBUz0pxyu91upUtq10SiJqSLPq2422+m3WZsYu+d+OsOTUcd3e8uUrBE
         tgQfXsmASbFQ+KoQ4GjncB6Hd31Lqw2VEdiXjy29/fmOKzA1ntKGGF7kfOQrMZ9QowIo
         HqPhlWWqJ0X2K79caCPsDaBQRklIfVHaFgaGg3L2FA/hSTHkRuBH6SYBTaB1Tlcuiq6G
         uZ2Q==
X-Forwarded-Encrypted: i=1; AL+hErHzDSm2CFpo1IFRlIn+LbZuagG+EFS6JIQ/XqXWNcaMryNgGJVEKcEI4IHuC0upPF52SyhinHvUn6lR@vger.kernel.org
X-Gm-Message-State: APuU4Z8CVTxakhoOLx4EfgOW9NHaC4Xwmk+jCABRhfxqOoPvuLZVIzpu
	3ZkdDzZTrAY2pjqOjQFmnR9X6RGnLzZdE213pRhuw7joKr8PsVE+6P0IofMgK3wwHmUAcdIxTZR
	xAjvtUgqmpo5o/YUgS9y7DUxYU5uDa1CCHfS8u91fwu1zNr797ChQRxmGbCZEdTPw
X-Gm-Gg: AZFdTZeWqXtSAoQAzaWu5Xem7dPKKDz5SARgAxMm18L8Dv8VjeL56TYQu90/NBMfvZx
	A5rEMgq9txtRWbb4bb8K2klAvnanyVyOW5GEUgtSwOMuR563+kF4NDoSskvkViYAOCw+mJc168i
	vnhaXF0Wt0KLWaPuKB+jg3d22GmMQ4Q3QdwOR7Fq0fUl6XIqcpFhCmJhp7On7MTkHV65ieU9wW7
	aS9Swb0t7jnKLQFLbEGDUATCtXvuccE9LtXa055F8gnGMjOJ+Avt5Pfas2EBPyj893PqKxijqzQ
	/UKoy+YDu07L/BAkk3cBbR/GnSO7LNKekNOSETH1xqRW+/V/qZ3FGKEWq+4K5v3gOPH8GhAKVlS
	yM+lnDEL9W3UULsCR3VmqXy1kg7QTkM8Vz8yIAsyRBHTQSju0GqZtzKmFPAst/8MkGyx1+1jQXG
	AVIw==
X-Received: by 2002:a05:6a00:1817:b0:8a0:5f63:5521 with SMTP id d2e1a72fcca58-8c8792bef60mr15376411b3a.8.1795608034930;
        Wed, 25 Nov 2026 04:00:34 -0800 (PST)
X-Received: by 2002:a05:6a00:1817:b0:8a0:5f63:5521 with SMTP id d2e1a72fcca58-8c8792bef60mr15376338b3a.8.1795608034103;
        Wed, 25 Nov 2026 04:00:34 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm9045190b3a.7.2026.11.25.04.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 04:00:33 -0800 (PST)
Message-ID: <e93eee16-df8d-4d49-ae56-3e6ba9c31167@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:30:26 +0530
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
Subject: Re: [PATCH v5 3/3] phy: qcom-mipi-csi2: Add Hawi support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
References: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
 <20261125-hawi-maili-camss-v5-3-1483b7f68dce@oss.qualcomm.com>
 <15cde6af-0b9f-4a0f-9d21-4e5ca9107a67@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <15cde6af-0b9f-4a0f-9d21-4e5ca9107a67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06cde5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=zU3wpra9rdAe81a_7icA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: XATN7w72UsHPrr3BJrZGGjDyZNd-mzyP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX9UkUGRUW/niZ
 ZJGo2JudDYul+wEiE23N33ZQ9zrSMkiDW1r78ZRYgPXRRvh4Fmb7hSsdlDBOYOfA4HljIZvA0uC
 mHQI/8PyI2rOUi29qXbciG5CPMD9QWs=
X-Proofpoint-GUID: XATN7w72UsHPrr3BJrZGGjDyZNd-mzyP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX0vm4JUMN/k68
 EoDUUYMZVJTxLOEEQxz6ySwncGuLG7qkK0NkY8gkbCnAaUidg//1gOtQNx+YzoKe3KZT/nB7s19
 lH63QUf0tVlYhzYOsM5fqWYviCuGAiYFpS4IH8EJByYH5iy+OYB0ZHmbkn/JD2OcfrT7HA90zjv
 VpMJ1FrZXYa6Snto4tTJIxkTsT0PhXIa8xh959uY8bmdX4NNyJ7gx0fjrwE2BSYj8ZDpKMTmyhK
 gQF3saHlnvxmq+woA+rEJT6IF8cJcQeSMt9L8DInpMqQkpl5/tBDsNqpEmtiB05fq09iMjHMLZn
 auyRiBIDIjN6xQo2KJZ4/pzUmCbk8trwethHtrEaCMKwmuT2zdWnFyMw3ZV8G3ECF9ch5+aUPue
 kaLNxO2PgTB04kfCv1pv7q154gfvBsFWODSO1PGa2kABH8vRzSCqoECvfpyXNNrt9zo2N5H509T
 k/usuCS0U41QLJZATzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250047

Hi Konrad,

On 25-11-2026 16:23, Konrad Dybcio wrote:
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index ed40934d67eaeba0c6ac7ac75324ac6292fe7d9e..5d91303e0df2e8c5bca3ea8fa2bb831429a8f1ff 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -162,6 +162,126 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
>>  	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
>>  };
>>  
>> +/* 2nm 2PH 2p5Gbps 4 lane DPHY mode, Kaanapali table with data-lane CTRL0 0x8c */
> nit: 2ph and DPHY are synonymous, if you rename the struct to something
> like lane_regs_hawi_dphy, we no longer need this comment.
ACK

> 
> As for the override, if its meaning is well-known (the difference is bit1
> being set or not), we can add some sort of a booelan override instead of
> duplicating the table, maybe
This is not a boolean difference. Bit 7 enables PGM delay in both
values. The difference is the programmed delay value:
X1E uses 0x0e, Hawi uses 0x0c.

Since this may vary with other PHY tuning values, I would keep the
SoC-specific table.

-- 
Regards,
Nihal Kumar Gupta

