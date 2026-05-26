Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DC23DD521
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794524; cv=none; b=XPYgMs2ClB5P46drIOuIJ70mVqSnnpnBY+6Bi3C7nB1dgzS5JGUCp5VpjsfXHykdlAemiI75zs3PgG+kpHYZlFTYCNPJyvcL8cxYwR0Nn9FG32nvqhT+5lqfCS6w9flllcWRSQifdvDJGxIp11dswq8IZg21XgmG9F3WKVX5JYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794524; c=relaxed/simple;
	bh=XJ2u4rAlFKqf3bCwOxTrOirn6TiVORyvCT7JY+6a+I8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YtzlKgzVnH4Xu8LrknKgd18U6ElQWLzvHB8lwvAQCyhuko8O686aaPoA7E9+rgLgUv/0ZjoXONmUu3aap2SBzDkrcni3wpzJrO0G1epmzAJixTiDAiRffTGqp+gPY1udpdTzRhEoeyYBRLWM7pJRE+tjSGvecY831G/l8r5gUec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhvaZp1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEmo2QFi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhvaZp1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEmo2QFi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q60kb21763808
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqsxV/xGmwV1+pwo9CefvjlaBlQyBYs9ZVzmmhLZlaI=; b=ZhvaZp1oPmCOLsQv
	wXGFKPi1dhW8ElBOcdPs7ThevrfynYs898JSbA2082a5FJdxfPj46sJEWKlRKBlZ
	rcw9pnpTo13ZU2zklATcUV3BbSnk4FtdnXI6Xoa/F5UPLFGybmlIh4uLBJZjXTCp
	M0ITFUgjW4IHCKAYUrTDI9ODwZ+1hMywyPTLjsiPnaTCwiwRoe2aOx1qoHawsiKv
	Y4GeEmxpDHiGRpnX+WUjm5NOq7nGhjK1OrRDScnwCqEE+bb6Yv6jPV5LvADIf9+v
	+Ck/4PT/pDZ0sPwLG1JR0EMLF5n5zoP69kfknea3BZ1L/cTtRkV2SvvJrQBZvZI2
	QDEvAQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vgh8b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:22:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c850ff84ddfso7399459a12.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779794521; x=1780399321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kqsxV/xGmwV1+pwo9CefvjlaBlQyBYs9ZVzmmhLZlaI=;
        b=SEmo2QFimkzZYnByr7YiqUnmWtN2+KV/c/YyiVEUK1AmAVpcO8VIhiHfNoj64l3GV4
         KsNy6aXEXQ3To5Yyu73vHW9R1cjpBZUWXPr26h4Q0iZXIRvRRbm4/D8CpdEt3DXcbOx2
         4Eft9NELXTqpPZc8xIXYsJpOeqFhPFP3+4NuiTOl8UjDIpE4IEOswIg7PY1aPkkHupWH
         8hOrmPbZ3sx4JgGqJ+2IaoDBHoMaA1+yjZ4kuthRggQXOofGxXM8r1fqv2qQtlj3+zvS
         sh2K064mdgbvpuw8XK4ZcYS0UCAnt4DwKbDhd89oJm1iwijuccoUPrb7FFEkO/HNP+fo
         wBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794521; x=1780399321;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqsxV/xGmwV1+pwo9CefvjlaBlQyBYs9ZVzmmhLZlaI=;
        b=JJxlB/+SKvUjdfFK+pA23SEqJh+xjNxb5RuEOrHEBins8k3pEMgd+FOcEFlKhd8t0u
         wHzP5KvbiFPdLdfTYOnytDX++RL74SQE0el0zg1zL3roRbT16sHhAl6X1eK/92+LrxgZ
         DpF7k17K8fqL3XLioY3e14An1lizwcaq7YniuizuWDA/rQndeKyl2Tifm1RArdpG9QIg
         sTaKuOgwPsKANOXnC4hA9xkLTXU5kZTO4WsANoMwAga8JSaU7yxeVN96GNk7wnntnLQ/
         tnN05q+KT95isaFVrmnRf9Y6vXhNUh3GCcjKZzNE1lOOBVCss8sYIi50J7GD4iOXp8zm
         kLEA==
X-Forwarded-Encrypted: i=1; AFNElJ8ioHDB2k1/4IpBO/mKykpb1DInDEyPsX9DzdD5pZr1YQs6onbJlM3tSd63l4tu7iANwWFXC56iJ3aQ@vger.kernel.org
X-Gm-Message-State: AOJu0YynQf5OZpuoBoqX9/fGJLL0is+bu5I+F4LbQ6ik/jhoHqE4LJQJ
	98sFwrZq2N/aVeQmLvyUa2Bo5cziRoCR2oAmwKFqQGdNKxijUrY2nmTUftU+GlV4n/4UGN+1WOW
	jYf0mtRMpq5FVbKU9N2VVd+bKayANFGNzzbN7vzdBV7v9E2T+HwIOjwEgULWC3YvM
X-Gm-Gg: Acq92OHlZ5ZNZDhDmcv23sQtkIDqY+8TF2VyapG9bE0cLUNNgLivdqjcoWeDXBY3bLa
	f8/58S1FdLY0MN22odxfR1UY9S/KAIV11z9UM033MTSwJN5RAlGU+WwJqLibyj/FYvoAkYuXv+h
	7IkNjjgX1NADcCAFyxkk4p5ddeBjQ68YOlCEq+SiLrKo8tClLjWKRGWD5/NYvLYqkCE4MTVH1cS
	xyKoH51qmyIROmWZePp830IYLk+IjxFJdy/aYEBNoUngUyu1LuT3pmnS9JzgLGUxobQw4qRZe2J
	veYPGwBRcWR270HZa/rHUQiaExT3DXLlm7D3TFrybTvubfJGsg923i6o+ZZpVKuncJke0M+lZxp
	N559sscjGgEeiAacYcy/KDWRogzLY9jYZ1p3wDtJlAzQ0jfxC1en9NkH7M4psCmsP
X-Received: by 2002:a05:6a21:68f:b0:3b1:a9ce:5095 with SMTP id adf61e73a8af0-3b328d940ebmr18161106637.22.1779794521421;
        Tue, 26 May 2026 04:22:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:68f:b0:3b1:a9ce:5095 with SMTP id adf61e73a8af0-3b328d940ebmr18161060637.22.1779794520961;
        Tue, 26 May 2026 04:22:00 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852057f9cdsm10331123a12.32.2026.05.26.04.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:22:00 -0700 (PDT)
Message-ID: <b1888f5c-2613-99ca-ee12-fb4717a40731@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:51:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v6 06/14] media: iris: Add context bank hooks for platform
 specific initialization
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-6-f6a99cb43a24@oss.qualcomm.com>
 <sqjbcmcy3wohzdiftb36i7ztfyt2k7mnxkrzxk5yuocpe7kfy6@ev2ouxxnf6cc>
Content-Language: en-US
In-Reply-To: <sqjbcmcy3wohzdiftb36i7ztfyt2k7mnxkrzxk5yuocpe7kfy6@ev2ouxxnf6cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a15825a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=93t1r52Nw9wdlAKC5OAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: LB7iYoYVj_orqcKi1SUgP857bRndEhmm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5OSBTYWx0ZWRfX0lQ/sebDrBHp
 1DmY9hH9IuW9Y7tKFPM9GpNODcHA2R5I0QkoVnSs9IYGheSRuaevA7id6J23ASiyix+BrT978CF
 I/7xi2nckASsUAJuTtEgQiTqIQ7ZXFTyVWf9KaxTNhxYbvDxTNIAGfyZj4nZ/fZXnzwCmFoiCOP
 5xmND8ozi6nCR66LJo4/ya+tS7eDCNT3C8EYKKCL63L7kjZBj9bLWkq2G3Wuq3kNkrT9gJyQDZD
 cHglRpKitxq4Lla06NTPPbd8qA3slauMCIsI1aclc5jheNjQPcEgA9UeWSeaxpaCAwqep6NdD3a
 QsnZ4DMCmUYYOTFZGjCXDmz9tYtotgfrRP200CZXCr9wTP7uSsAa4cyRiUcSewqj+NiD7p0dQcj
 tIk5fpB3uBflNqgtnlWLlL3qEmRXP8Lk7sF4K9sl1ttHuf+SeakcZpBkUdW6dARRfgYPGACZGOL
 mMP4nL7lbzdIppUFMpQ==
X-Proofpoint-GUID: LB7iYoYVj_orqcKi1SUgP857bRndEhmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260099


On 5/17/2026 11:05 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 04:51:21PM +0530, Vishnu Reddy wrote:
>> The Glymur platform requires a dedicated firmware context bank device
>> which is mapped to the firmware stream ID to load the firmware.
> Why is it required on Glymur? Is it _only_ on Glymur?

It is required for firmware booting on platforms where Linux runs as the
hypervisor (KVM/EL2), where the driver needs to manually manage the firmware
IOMMU mapping via a dedicated context bank device. This is currently specific
to Glymur.

>> Add init and deinit hooks in the platform data for context bank setup.
>> These hooks allow platform specific code to initialize and tear down
>> context banks.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>>  drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
>>  2 files changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 6a108173be35..84fc68128c70 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -263,6 +263,8 @@ struct iris_platform_data {
>>  	 */
>>  	const struct iris_firmware_desc *firmware_desc;
>>  
>> +	int (*init_cb_devs)(struct iris_core *core);
>> +	void (*deinit_cb_devs)(struct iris_core *core);
> Why are they being added directly to iris_platform_data? Why not the
> vpu_ops?

Some vpu_ops are shared across more than one platform because of same
power sequence.

>>  	const struct vpu_ops *vpu_ops;
>>  	const struct icc_info *icc_tbl;
>>  	unsigned int icc_tbl_size;
