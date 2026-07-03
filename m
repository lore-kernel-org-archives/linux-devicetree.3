Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7836333F5BC
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062788; cv=none; b=V3ScE0xLvu7nhr68lvFrVlebINQ1ZatIy/9JfMXcomH4wAdrVHn711o76bkVl//ueXfW2psLVYQDLCiqJbybAT99cwKraVX4sMN7yekyeKB8XrfVJMcsLVMY0FA8IVAXBTaPTTt1brYnMa/KSCogXz1TRln+xA3HuyxeVSqyS1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062788; c=relaxed/simple;
	bh=YdVOiZD4Racla05BzVUSupDKdhPkOP8ZTmqWEqlqujU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cv63WcIz/j2qj36/F2QmfrWU0d7GNSoyv3SQooo18/v92nNdetjPXgd8C8A2q3uvQOAfZhvRJNZjbumFe4HMg74sHvS9vssR0AeoMzMC3M3gKmSPFAATCmy8mrB9zNuGHCLESYdZXstKWVgjPKJtBmxIdrNEqF18hv4Yil2d57c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifWtgt6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3IYKGxD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifWtgt6r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3IYKGxD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rvD12961866
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLKwhFb0WMpEquwWy5esvrbPpcQrhIM5KfgQygFmYEU=; b=ifWtgt6r6NV2Ftli
	LFbEJnMqHQTSysZ2+wBgd/ecJ6t52JmAAC8o3gJKYsPrWl7bkSLu/MjxlD4KIdQe
	+vadlaDIazm+x8mYdb/PdanSdT0Sc3AiFuPTV7cCFel6qbzY12U7aeQt59ZfwKDm
	IB1AL769zKJdvkvlnpXKBbcSaYZDAPbTj/dYj7jTtocIkbc4a+u5IdcPhOQWdHMK
	vEYJ72oB6/KPUKeJa17/ntTNoDdCZ0nLRV03G6SJa0BKxVqIo3pvcSgcrBoQv+kX
	SenxrQvA+FWpNsnqhAFEusx2YSY+LeEZV7LJpIEXMGpzRdtvmZEcBaCtZRE0Vb7Q
	R6kw5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5nprcs8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:13:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1fc94a11so978521cf.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062785; x=1783667585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLKwhFb0WMpEquwWy5esvrbPpcQrhIM5KfgQygFmYEU=;
        b=N3IYKGxDFWSjw4ka8+wdiXcYXidjJpfF9uNyoUiBRmeu1KVbe75tCS2xjzXjHX2YgA
         H+eIrSw/7b8lkZuk1ywU0L3YccUU3ZlySWBX+rnJHCkMljOmfZ0tZo6e1SJZzfpHwaRx
         lX6/lyXUYD/WvnpRQ2gnLZzLYA71B+z5uq1B44n8KsToggLUwbtdwaSdpp5q5dgJAhCH
         Fjb/BUVLH9pCd3GQRMG3sD5m5EMHIhr0aisWuPnOLZp0cQkJUS2dfT2u+9JE9wp0RHuS
         shjww2dMXDfXxnYYjb7rEYcunWhUK5KZnrA89Qn2DZGmwGDmJP7eOfowjqVne09cUgOY
         Sdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062785; x=1783667585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLKwhFb0WMpEquwWy5esvrbPpcQrhIM5KfgQygFmYEU=;
        b=UCMDFH4JW7WsQ64dPgtIeBRbN2CdV/+gDDUWrphXUylG4/Y3L5tHkM6edXKyS8FVud
         PSn7qnyfZ8Dbxuj11jOPB+yRboFc/Q2v/VPr+dv3iTQtpNjt/O0duQIUrXfzpmLL75SY
         oPIxcVWlKKE5eXAwNq/3VlwDZq1YJBbQT3IT6Dh5mLsqYvS+kCi3pOy7/Cn/hBp1rSd/
         0UdXqA1i4rPdozfu6j0agqMLsvTN4rmEkRrYU9v2nGEoCBaH0cl6oYLVGPkEhErhRnKq
         cZhZtzS/96c7vK96t0m7duoReYCkT4tFNapvAN7UQy4RMmWuPcyth+ABZDTAkBzIyVon
         qHlQ==
X-Forwarded-Encrypted: i=1; AFNElJ88iK+COEuqvV+/coUY8nwBgj8qTHU9wQj5sk8hAtK+9LWO5qjkSxZomRST3fEE76rWM5WwY9zlqjBH@vger.kernel.org
X-Gm-Message-State: AOJu0YxOWrEcnW49xxKJMlAUoHu+84Im15hlky/+NROlAgzmlEEhWJ0n
	9NDi/dK8VgWbgDhz5l2IlnvJFjHYIMVhQWqT21C6hcPxTaqY1s4SqEE9EqZBXp/o22Z1IvSU3j/
	N5q4ENLoB4zydF8ZJleE/arfIt0KX68ij8ZaudlGadKmTu8jk2h/RWRCjiuFVX0hg
X-Gm-Gg: AfdE7cmvZjPjqeDolTrbI5s0aTQrKWjnC3QLxZo9ZMSfAcN46MDLg93pze6GDFLENlB
	0dqGK8CFj9vxJo4DSgUztjjiAd56p0M1ccUweLgq5jr0zkAxWYjtARC4hzTcCP++qRfof2OQ9bp
	4nHaPB3/yidQNOmyE8Wdx3uDjWJ45wOqpsLUXLZEQ67kL0/qv/zbm9VSk/T6wxoHjC49WZiu9b3
	SrnnXA/OoXO2qg5GukSEYJ+b5c6ai1CJqyezub0x3TmO1eV8hisX3K4kF3N2chQALYN1Bzd939E
	FhlzgwvG/vHWmOj3S9M7GK4MOaPDec8JPuByK7WAwp7HAiE4k440TQ5hJspCD8scKWr8/i8DRyK
	L5mJNdeZBOFmAF+P0flTeRLGNKvrzLW4YAAs=
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr76116801cf.8.1783062785555;
        Fri, 03 Jul 2026 00:13:05 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c26b3920dmr76116391cf.8.1783062785065;
        Fri, 03 Jul 2026 00:13:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6099911sm233424366b.24.2026.07.03.00.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:13:04 -0700 (PDT)
Message-ID: <17a83e3b-cc47-47f3-a7bf-bc0c92f09f98@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:13:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/19] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-6-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-6-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZssuXX6E8GZCiArtKoU0HrR7bfGGKGI3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NyBTYWx0ZWRfX85TqmT9CneQy
 0IxwJnli1Ta0bCPcnpBIrx5CQDzdRNSG6KTjd6ysZZDmFJoXU4SS9BqfO7wyu94GMrpPQwVzu6p
 Jngk2c0UhmancYpvb9/HMjmGrki3/Vw=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a476102 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=McZegf4IZkULrlfIFoMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ZssuXX6E8GZCiArtKoU0HrR7bfGGKGI3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NyBTYWx0ZWRfX9DWV9gphuCG7
 CnjScbC5LhVf+w/tC3e1bouc69f4aAoOPeY/6Rsk0b3WPz12vB5hSUANT4jUzmgLDWT9EQJ3pHp
 QE5zI5s0wHGpJo6ENHYq96WAmxI7UmEx7A9qiteEzQtW1QjkwUsX6+ZM65fEBl6SVBSlEOkcFO6
 zcFMMzBR/9pRpHRYCpH3fMJPh+oGzGIxXThSbISrt22neZ4PlbPGI458GrOf0zJLWMTqXIvB8ZD
 wXX24ngiTcuAHLJof6rYynZxYeig+Yuk1f6f6/MwVBsaHtX2Nkhzk13ropzHLC5dkX8Ght7EUeY
 047D0vqqsCZ/wtV6O46acyO3OoKfaa1NjrjiqxY6/0+d5UcJXIg7vXrAuujvr9EvWLi/1EwS/cC
 FRD2aqHT1owXz710nZtjJpNWzAwb6yWfiDKOjdlOlNeodmi2xtMhg2b1nhVpqlPAHWWelRl8nJ2
 QUi6Yj7VAva1jCzjUWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030067

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

[...]

>  static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
>  	.config = &disp_cc_qcm2290_regmap_config,
>  	.clks = disp_cc_qcm2290_clocks,
> @@ -498,6 +515,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
>  	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
>  	.resets = disp_cc_qcm2290_resets,
>  	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
> +	.driver_data = &disp_cc_qcm2290_driver_data,
>  };

Now that this clock controller takes a power domain, this needs use_rpm
= true, or there will be a permanent 'enable' vote

Konrad
