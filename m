Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EBA411667
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544275; cv=none; b=JtU5ZqyFavJXB9b3y04E3J4BXJ8JMv/Ok3QUWCdKg4gc/HTtmlqF+bufbXSYj03EfAXPEMcABdzpR7yCRvTptorcjfL7ijfKbyaweuXFP6Ejg4OITs4ZCRI0L01ydPKsAYUsveOF9vdSNIqkx+3wVrEJA7EfhZs2UgO7gHwHwO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544275; c=relaxed/simple;
	bh=lfqTbh62VPA+qxPJcuNFmKye2khZv4QuZQHCqHBoOPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TTNCpsc1EIser22udXL08NUVx0W+6c1I5SSpuvn5nHG4C9DTz+UW2QA8ye2WqO8yM1T10QK3YsaXUSR2W6EuBLZx+LOLi9IOf+EjchIHeWBisDTBPjgOQmTSJKDwtnIXMz9mWHlqd51zEP/pfWCdsLnKHidaIdqcwTCcW+W6pl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E9GuwE6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fH0adAbr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E9GuwE6y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fH0adAbr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFiJeJ784398
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZnhPtk8mMnWcFWmXtG86F3o6LgtBZSk/BNsIu+3Vawk=; b=E9GuwE6yUeSLsh1X
	u1cN1kGIy+DikF9fWXbHBLHJ2MzhAZHXBxKfGwXvBZeXSiScR8PSFfwIg0dzJOxA
	8TMzCFhCn5W2w441rAlY+IYWMi2EnUQCXR2sNC/2ayJb9/2pO3vTROkzaZwFryBx
	WYIA5Zfq4TFQKLeko6Xt/xfz6UfRHp62Rbh6/rXDuhEUx98ocIj/QNqlSKyYl8f7
	mHNVhicwwOFV47qLtX1B1VnGxcBtnZZ2WVGo09SNTLltY8U0zvIOpPUiCQtOw2PP
	9FjJUYqYL34XDqlq5ZzqokCsACyXJSLPNnm3rE3zX5y+SGwWPD16F2thYh9JsrG1
	mkI2uA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx1y4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:24:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842211d6e48so4381897b3a.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781544273; x=1782149073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZnhPtk8mMnWcFWmXtG86F3o6LgtBZSk/BNsIu+3Vawk=;
        b=fH0adAbrxkUKT6VPNrIAuKYSff9hSNC4yBaj5Yw/hCxp0tnEEXUcgG3k375BmwR5EW
         0yJqLzXU8k+n0d3c3j5ZXVjCNNELq36+tdgwrT/LCmaH3AUYo0PTod4ddlW01TLxUcOk
         VTW5a1o3XNloeCK8dxzXOdlXoaBDNrV3W6NnnDZ0WJcP4rKFDGQLM3NIvwxe2qoDEBxM
         jEhwIADClpaDGtd1//7xbByAQp9Ly3iJ2K3KP9j9Yjh0XH72xqLuyBml4YmF0hciOuXw
         xZGy5VU3oasjEsFaTyiXLSNnsgqrVrRTooGO2BoouIHq86bR/GgXALuZD2mxANNXtQB7
         cu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544273; x=1782149073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnhPtk8mMnWcFWmXtG86F3o6LgtBZSk/BNsIu+3Vawk=;
        b=JVb8pkQ0ltitE1TpqMW6M5UP26AWiu6rqWm1q04PzLxzozD+lIXjVKLxcq5FfNtBRs
         JGdZ1jBw+Is/JwFh5UDuffmqAsFSS9FaQm//vEI7VthMqxKnTxzPK/0hOt8JBD3h+4rV
         bO0jMFYc6tUJRf8B1AuhuvW86WLgY0igP+2IICCAJSiICSIdAIbHu82DyRrKqsTp7d8i
         V2e73WMwdwFR2o2FW9XNAN8cFZ4/BbPqN0rExrbHvWEnVmDazSkwrV5nWK5fdIJ4qZqU
         t4h9HDImMEmnB2u6GIeaj1MiEq+owhXyzagIb64M9LWZze6ZdKk6c6o5WjEkWr+2Qxhu
         LLOg==
X-Forwarded-Encrypted: i=1; AFNElJ81P0Kkq+9Yu/pVK1ALm0M7U+q3xQtBYxnQDzGLh6ZmGkp7CI97dHc3CfnePt2UQuNJoHfJxF/qEh1F@vger.kernel.org
X-Gm-Message-State: AOJu0YzfKdp9wzLV8YcHfryrVPtMVYKUVDFpI9zjxTucWVpi4ZAniEML
	E3AfsI4fIQkGIsTtuC+j8JAwY0vU/gqVUkxy/rUIMv5/ah7heTA7leWODmLgkdAccJbrpl3tmlM
	LO8Fq84Yyp5ep3CCsdb8MWG0fKVaVne2shD+dufeEAorIx1y0hrUJS21wIbWCgGWR
X-Gm-Gg: Acq92OGIJ/a5HL0HpDF5Dna9n67QnOEEPgoP2xZB2Qh9Syvh05I0M+0CjXld7Awr16N
	bwLH72qYfk2FRDaCidmjabSm3A+YfPubh4f2e3ZCaoiidwmzPkcZKbkgvdDxgJtwNntUB9Q7jkQ
	bfb8BIwnF15yotUCnd7f57myN3nxRs/VbFmjhVlg6UJ8xNIEtt6sauRYRFxsQPDipI/xURUehmq
	c8bK2l/KhGp02Mn6swoBl+gb44DB2/zw48mowpiFzJttwShDFHAE4ekpIaTid1MW3I9k7zr8kGv
	shXVzzTdru1P9cjw5Q8pfKN8Yr75sLNagm43cFl0r7S5zHg9hp5swngIr4ACwBWGFobEVz98dgg
	BXcE2In5Lr20gKpCZkz0vgphRj6R5t6KJW1zmnFSmlI3fZUtfn7UpEu0GdAm75BDJng==
X-Received: by 2002:a05:6a00:2308:b0:842:5931:7b88 with SMTP id d2e1a72fcca58-8434caec171mr16906424b3a.1.1781544272668;
        Mon, 15 Jun 2026 10:24:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:2308:b0:842:5931:7b88 with SMTP id d2e1a72fcca58-8434caec171mr16906404b3a.1.1781544272268;
        Mon, 15 Jun 2026 10:24:32 -0700 (PDT)
Received: from [192.168.1.48] ([122.164.85.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accdca8sm13328459b3a.18.2026.06.15.10.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 10:24:31 -0700 (PDT)
Message-ID: <c649bd80-4bb0-4a92-bacc-949ca40a1fe9@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 22:54:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
 <20260615-ipq9650_refgen-v3-3-5f611623629c@oss.qualcomm.com>
 <737655dd-2059-421d-a9ca-91ebd1b1209b@sirena.org.uk>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <737655dd-2059-421d-a9ca-91ebd1b1209b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pxXLOXF1FuTjLMW_dQhAI93-AOtuSNcM
X-Proofpoint-GUID: pxXLOXF1FuTjLMW_dQhAI93-AOtuSNcM
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a303551 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=BchUXt3FRQcObq55vMoYrw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7WPBTj7QaewYWrzPdxoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE4NCBTYWx0ZWRfX2S/qGR0658Nt
 pgFc1R33IJu3tC29pOI6pieZrtz11fD3D+tINrLVCfNGlftb55NWBQC2MzoifXJBD32N86ZYGH8
 tMMUoWRQrtaECRtK0a9wkQIOKd90BpM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE4NCBTYWx0ZWRfX3oYrJCJByL2H
 Zlqw9XYXWxNCaxIR+t2024djpIpuBQb8NITSR0xbQJSV3sjMBG0WtpwiCncYAQAv/yn/Zc5u+V/
 7ucgzsEZbf7NsSdYBySpPkiQf5KbIQG0mOTIv0IDKl2BE80gPglGd5hQ6wjeTYLckXcJN3DI26M
 iXbfXZiTVoL5Jxa+hzhapceFfylX9mUR2X5DEhqvobBW41/yE/oNLGgeZML5lHOeKLpFAl4nvA6
 e0NMqZyAUw/5mQ3kKTdiKcnl4r+0HqUjyIlGI6MXm3gfczn7oFu5uktlQE5WGRaI3oqtemt6tzb
 iyZxbPe03Q7P2naTnKexVBPi52R9NIZ5kJZB707B0L9bJuGaN7uUxrXhXXFLePLfpl+ktctUHnB
 vwUwU1jBwcFEPhjKwkVqWeH4d4iaZQgUKcFk/EPiTmMQ8GAScFvIRZWl7mS0bV+9wf3wHU9l+nq
 8A04DdrYlNdP7pgbShA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150184


On 6/15/2026 9:28 PM, Mark Brown wrote:
> On Mon, Jun 15, 2026 at 02:05:49PM +0530, Kathiravan Thirumoorthy wrote:
>> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
>> PCIe and USB, UNIPHY PHYs. For the other SoCs, clock for this block is
>> enabled on power up but that's not the case for IPQ9650 and we have to
>> enable those clocks explicitly to bring up the PHYs properly.
>> +static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
>> +{
>> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
>> +	int ret;
>> +
>> +	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
>> +{
>> +	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
>> +
>> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
>> +
>> +	return 0;
>> +}
>> +static const struct regulator_desc ipq9650_refgen_desc = {
>> +	.enable_reg = REFGEN_REG_REFGEN_STATUS,
>> +	.enable_mask = REFGEN_STATUS_OUT_MASK,
>> +	.enable_val = REFGEN_STATUS_OUT_ENABLE,
>> +	.ops = &(const struct regulator_ops) {
>> +		.enable		= qcom_ipq9650_refgen_enable,
>> +		.disable	= qcom_ipq9650_refgen_disable,
>> +		.is_enabled	= regulator_is_enabled_regmap,
>> +	},
> This looks like a get_status() operation, not an enable operation?  The
> enables and disables are pure clock operations.

Thanks, Mark for the review. If I understand correctly, I should track 
the clock enable/disable operations and return that state in the 
is_enabled() callback (as I did in v1). Please let me know if my 
understanding does not align with your expectations.

