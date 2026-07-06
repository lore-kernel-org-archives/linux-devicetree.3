Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFED732B9A1
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345017; cv=none; b=Nw1/yLYvPLkngK+P/k8KtfBGB0dNlQXc8yHwFRVRqAUedqu71/geOh5p+ETl0wiq3wrIIo0dEf9j3IK6aX+V940gaANB7nkaFCHgkVuzaMDwi9XNoio5vHgbHskdhXU5sjCwUo13KwQwfvqbp9UTtbM0+wh+ggJ7yZpa0u05Nbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345017; c=relaxed/simple;
	bh=22XxSqPTTinhdCsHhAhUyLD2I1GFB/vKsOtziG+TO6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSZFlqvagYrjmyals/6Li7JTXlXJjsox7cEvtrlqp8Mol/2gJxBK1eHPTQVkoBy+NQI5u1oknN7o/RUirJPcQOSh78KX0BrOyuNctcZJwXn45c1xROwY6jRM6OQsD4206gY0TCWnwDYFc8S7VvuPPF6yGkpIUoHiduyxegn9oqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXrOJrv0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SY6vc1Mx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXrOJrv0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SY6vc1Mx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxEXw366750
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l8ZZtBjQeAfeh4dvsZsxHmTUITCtRw12ZA7v79AMXFg=; b=QXrOJrv0zPOT/MlP
	9ohOFvqSSjjken0OjZ+nrrkpcrkYgY5Lx5HO2WOTE8yUzvfzBfsUuOv3cLmrnLgE
	4CHJDdh5pRQcjQwqWKF2xx/QkOktKpsDdsru7+QeQKAWVwy9p3WXojKanzJlAAP7
	iz4JCxDJMVuQO+VwRsWe8T/Pk2ds74QMCniRkgjdMq4ptKvuI/sYJPkLOhVUmga8
	9k+/2SWwpZeEECEXSVsDQqnYD+GN2QNNTd7FQ7CO7wIIOLmHzdJmOsKseviXKoks
	wPCjJFGS9wx+2zKtSUQSA0HHfTSpLJWw1c6pwsCwhuQLGeL9d+XQx7E2aYaaTyX7
	7xBKMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891us53k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:36:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91931144870so243216585a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783345014; x=1783949814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l8ZZtBjQeAfeh4dvsZsxHmTUITCtRw12ZA7v79AMXFg=;
        b=SY6vc1MxSBBdzQq48od4HggoLoXyCRKhQHZhUvKU6Qfcp9MDLohGrEoWBPtNlfi7v8
         I6i/9hLN7LzF5V7NPUDzUicRWQtSRq50e2STqog3+R6lU3PW2aeAk78bdPfgv3TPmEtN
         yFrQ/YFGiBN4z/ds5gLsnn9oy5GHHHLPqQPP/7xCmelb63L5/97blqR+lgTmsIffWioe
         8pV0rWPsa7lsGQtJyvIHdQVxsNx0omgmPp7UfV5LJ25KLvUhlxVJxJLlCldmSp40meDE
         0o/exxMl4jlU1xRVh09bnoHYyuG2xPHmCx/NP0C89q0+AXfwgemC1st6h7mDmpBnO+4e
         qB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345014; x=1783949814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8ZZtBjQeAfeh4dvsZsxHmTUITCtRw12ZA7v79AMXFg=;
        b=MJmTpB4Wq37eEk+f2LD4s52m11c5dhPmv3z45uogDhrMZtGRfiQwZFF450aLBVEEz7
         C27nmfmcmv7mtxNWtENEndlnn8hZz2COwOcZGrNH8xdxfBFgLIlXaXea4N26JJd/ko8e
         n6jOQS4hVYAdfrzdeahOsGzqKTm+lSKdrCtOiG3LtXv5HJ1oa2ZQ9hvzk2DgZZpjspbm
         Nb4qxtMQ9dCBq5wJq1F1aJCj1lWWmcpV1BySorhg2skjURbay7VlmsCpW8namSUpcnOu
         tzULa5eZPzzyvkeJdnZHMAHCq1TPeNkQbk1FBMIg5Be1ZhxMhqxxHq3qX+7romi7sI80
         mfpw==
X-Forwarded-Encrypted: i=1; AHgh+RoLxJLIWUNYWW1u0IQ/1KH5LqMoX5BTNyy5Uss/R3Q+D2Y+2YHFuBrBq1qVSWbj8SYW2ERYjWjGAMbN@vger.kernel.org
X-Gm-Message-State: AOJu0YzNGtDVeyCC21EnI1CvOcSS41UUviW/Di3i5RJ7AJ/MpzZw32DK
	Esedvb5kn+csxTPuM8vIXrdR2ourBbxS3Z/JdwiPx+HjacCO1ec8IJJ6MB2nb7/70aXEjnm5yPa
	3RP9PcNbU0fArhM9ZSBaoqNvbwAcJXMv5xPYaB5gr1Z7eb7aTnGSVXln3ya4TLrgn
X-Gm-Gg: AfdE7clJ8G7a3qdTpz4Q8vNsNj2ncW4ao4c6oXE++0huTJ4vAWC6w+IPo0WbyZvKPKC
	hAMogFfma8kfQUtNltODw4e36Y48ipFBh1pop+QpG+MXWr2uDpJzYZ7H1P6eMYMQHT67vqAxlbu
	jbcJZQBUTVQUpkJZdIUyUWsFxSt59YbtC7+eyTpDMJpZFKmMPoyUexpoNpAdMj4/7V383Rjjb7S
	XVjZPmylukudRSbu5Fp54vhEW/7N1gTHC4ZRsuksE8vCeehErJKe+cjr6IePIMyNwHIKvwarItF
	Spnfn8q71AF84tWeRHJBLob/Dxoe10AWs/Dd+YiVb1JVrHeucXNqTNls+W9wcGUA6sImy2XUdIF
	Klt6eBI+FtYQu53Z9KHR+WI1rs68BvrHI8xuO6MoPc2zlpI8q1OUZVhpZ631ViquKlzw8eemC
X-Received: by 2002:a05:620a:3195:b0:915:fb92:d599 with SMTP id af79cd13be357-92ebb4f9f70mr83960685a.25.1783345013462;
        Mon, 06 Jul 2026 06:36:53 -0700 (PDT)
X-Received: by 2002:a05:620a:3195:b0:915:fb92:d599 with SMTP id af79cd13be357-92ebb4f9f70mr83950785a.25.1783345012513;
        Mon, 06 Jul 2026 06:36:52 -0700 (PDT)
Received: from [10.38.242.66] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ccde4fsm944642685a.39.2026.07.06.06.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:36:51 -0700 (PDT)
Message-ID: <b518fb22-b4db-464b-9318-43cc9663ef4c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 21:36:46 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: i2c: og0ve1b: Introduce per-sensor data
 structure
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
 <ihkKqIy-tPImrDpB18hIeI3IQpv1F5GAZ2S7cNWB9n_LlHh3vVMT7G4bGeCBPJDT9GCPPtyA7s_raKqOiG69ng==@protonmail.internalid>
 <20260702-og0va1b-v2-2-0071442caa2a@oss.qualcomm.com>
 <5019684c-ace6-4202-97ca-98016df77d86@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <5019684c-ace6-4202-97ca-98016df77d86@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GnXEd6K-NwR2ukEfKOPSqB1Z8QGfmude
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzOCBTYWx0ZWRfX59PFQFgBwl8X
 NfccVol9P17LUqM5UTVRgVY9OBmaiZykhh9NJLeY2I8cBaDagT653R6Mtqbw5KPX0NMOUlGM/QF
 C4UyKkZpSBN2G/gpk61HmwjEmq9pfTw=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4baf77 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cBbTYWgxSLdpbU4s1esA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzOCBTYWx0ZWRfX7dc2dyzr5KCi
 oYp2J5FQNR11FszZw1Lm8X7ymeqU/Cor+9OIvbtHEomCu6eOPlE0x89d4iLA8jSU+1IN1C58RXV
 zFI5h4k0mpXhxHH2fl8YWma5X9d2RWL7BAreyefdeUMC7AEOfg/TY8i5OfNFEUQ+Pm5g2oj4Ku0
 Aw6Z1LjaokjgfNec1+OCKQKXVYHRRzkbb8ehU1q6cykuJ2YJ//xIF83ZGx7Lj4upKc1AUIgFSTc
 qhv7p3zn2Z05hUcgE1ETvb2yXQ7OHPmqHXm9dCV7WQamfFgWYsD1O0grXyXwa0gEJXi8XSwxbk1
 sD6yJdhdXWMwjhYYqrd7/E0vgcJRFatlV457Abb1nhkD31ptVQXduzJhclYY1z15xoddqi9zDH4
 1gRTAez8Md7tfnZ5Bkcm28zFQAegj6yj/FZahBAPP8JjSVI6kU/Z58RN4Ey+TfiVaeijW9151Yd
 4kPHZCkif27h7+OBw7Q==
X-Proofpoint-ORIG-GUID: GnXEd6K-NwR2ukEfKOPSqB1Z8QGfmude
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060138

Hi Bryan,

On 7/3/2026 12:31 AM, Bryan O'Donoghue wrote:
> On 02/07/2026 11:52, Wenmeng Liu wrote:
>> In preparation for supporting further OmniVision sensors that share most
>> of this driver, move the sensor-specific parameters (chip id, MCLK
>> frequency, test pattern register, link frequency menu and the list of
>> supported modes) into a new struct og0ve1b_sensor_data, selected through
>> i2c_get_match_data() at probe time.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/i2c/og0ve1b.c | 101 ++++++++++++++++++++++++++++ 
>> +---------------
>>   1 file changed, 67 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
>> index 
>> 84a28cdcade10f8fbcf945999e88f84641b9bc0d..acc06b10bf896f734926289099a70fbc2bb628d5 100644
>> --- a/drivers/media/i2c/og0ve1b.c
>> +++ b/drivers/media/i2c/og0ve1b.c
>> @@ -66,10 +66,21 @@ struct og0ve1b_mode {
>>       u32 hts;    /* Horizontal timing size */
>>       u32 vts;    /* Default vertical timing size */
>>       u32 bpp;    /* Bits per pixel */
>> +    u32 code;    /* MEDIA_BUS_FMT code */
>>
>>       const struct og0ve1b_reg_list reg_list;    /* Sensor register 
>> setting */
>>   };
>>
>> +struct og0ve1b_sensor_data {
>> +    u64 chip_id;
>> +    unsigned long mclk_freq;
>> +    u32 test_pattern_reg;
>> +    const s64 *link_freq_menu;
>> +    int num_link_freqs;
>> +    const struct og0ve1b_mode *modes;
>> +    int num_modes;
>> +};
>> +
>>   static const char * const og0ve1b_test_pattern_menu[] = {
>>       "Disabled",
>>       "Vertical Colour Bars",
>> @@ -97,8 +108,7 @@ struct og0ve1b {
>>       struct v4l2_ctrl *exposure;
>>       struct v4l2_ctrl_handler ctrl_handler;
>>
>> -    /* Saved register value */
>> -    u64 pre_isp;
>> +    const struct og0ve1b_sensor_data *sensor;
>>   };
>>
>>   static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
>> @@ -254,6 +264,7 @@ static const struct og0ve1b_mode supported_modes[] 
>> = {
>>           .hts = 792,
>>           .vts = 568,
>>           .bpp = 8,
>> +        .code = MEDIA_BUS_FMT_Y8_1X8,
>>           .reg_list = {
>>               .regs = og0ve1b_640x480_120fps_mode,
>>               .num_regs = ARRAY_SIZE(og0ve1b_640x480_120fps_mode),
>> @@ -261,23 +272,39 @@ static const struct og0ve1b_mode 
>> supported_modes[] = {
>>       },
>>   };
>>
>> +static const struct og0ve1b_sensor_data og0ve1b_data = {
>> +    .chip_id    = OG0VE1B_CHIP_ID,
>> +    .mclk_freq    = OG0VE1B_MCLK_FREQ_24MHZ,
>> +    .test_pattern_reg = OG0VE1B_REG_PRE_ISP,
>> +    .link_freq_menu    = og0ve1b_link_freq_menu,
>> +    .num_link_freqs    = ARRAY_SIZE(og0ve1b_link_freq_menu),
>> +    .modes        = supported_modes,
>> +    .num_modes    = ARRAY_SIZE(supported_modes),
>> +};
>> +
>>   static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 
>> pattern)
>>   {
>> -    u64 val = og0ve1b->pre_isp;
>> +    u32 reg = og0ve1b->sensor->test_pattern_reg;
>> +    u64 val;
>> +    int ret;
>> +
>> +    ret = cci_read(og0ve1b->regmap, reg, &val, NULL);
>> +    if (ret)
>> +        return ret;
>>
>>       if (pattern)
>>           val |= OG0VE1B_TEST_PATTERN_ENABLE;
>>       else
>>           val &= ~OG0VE1B_TEST_PATTERN_ENABLE;
>>
>> -    return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
>> +    return cci_write(og0ve1b->regmap, reg, val, NULL);
>>   }
>>
>>   static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>>   {
>>       struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct 
>> og0ve1b,
>>                              ctrl_handler);
>> -    const struct og0ve1b_mode *mode = &supported_modes[0];
>> +    const struct og0ve1b_mode *mode = &og0ve1b->sensor->modes[0];
>>       s64 exposure_max;
>>       int ret;
>>
>> @@ -333,7 +360,8 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops 
>> = {
>>   static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>>   {
>>       struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
>> -    const struct og0ve1b_mode *mode = &supported_modes[0];
>> +    const struct og0ve1b_mode *mode = &og0ve1b->sensor->modes[0];
>> +    const struct og0ve1b_sensor_data *sensor = og0ve1b->sensor;
>>       s64 exposure_max, pixel_rate, h_blank, v_blank;
>>       struct v4l2_fwnode_device_properties props;
>>       struct v4l2_ctrl *ctrl;
>> @@ -343,12 +371,12 @@ static int og0ve1b_init_controls(struct og0ve1b 
>> *og0ve1b)
>>
>>       ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &og0ve1b_ctrl_ops,
>>                         V4L2_CID_LINK_FREQ,
>> -                      ARRAY_SIZE(og0ve1b_link_freq_menu) - 1,
>> -                      0, og0ve1b_link_freq_menu);
>> +                      sensor->num_link_freqs - 1,
>> +                      0, sensor->link_freq_menu);
>>       if (ctrl)
>>           ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>
>> -    pixel_rate = og0ve1b_link_freq_menu[0] / mode->bpp;
>> +    pixel_rate = sensor->link_freq_menu[0] / mode->bpp;
>>       v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, 
>> V4L2_CID_PIXEL_RATE,
>>                 0, pixel_rate, 1, pixel_rate);
>>
>> @@ -407,7 +435,7 @@ static int og0ve1b_init_controls(struct og0ve1b 
>> *og0ve1b)
>>   static void og0ve1b_update_pad_format(const struct og0ve1b_mode *mode,
>>                         struct v4l2_mbus_framefmt *fmt)
>>   {
>> -    fmt->code = MEDIA_BUS_FMT_Y8_1X8;
>> +    fmt->code = mode->code;
>>       fmt->width = mode->width;
>>       fmt->height = mode->height;
>>       fmt->field = V4L2_FIELD_NONE;
>> @@ -421,8 +449,8 @@ static int og0ve1b_enable_streams(struct 
>> v4l2_subdev *sd,
>>                     struct v4l2_subdev_state *state, u32 pad,
>>                     u64 streams_mask)
>>   {
>> -    const struct og0ve1b_reg_list *reg_list = 
>> &supported_modes[0].reg_list;
>>       struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>> +    const struct og0ve1b_reg_list *reg_list = &og0ve1b->sensor- 
>> >modes[0].reg_list;
>>       int ret;
>>
>>       ret = pm_runtime_resume_and_get(og0ve1b->dev);
>> @@ -484,13 +512,14 @@ static int og0ve1b_set_pad_format(struct 
>> v4l2_subdev *sd,
>>                     struct v4l2_subdev_state *state,
>>                     struct v4l2_subdev_format *fmt)
>>   {
>> +    struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>>       struct v4l2_mbus_framefmt *format;
>>       const struct og0ve1b_mode *mode;
>>
>>       format = v4l2_subdev_state_get_format(state, 0);
>>
>> -    mode = v4l2_find_nearest_size(supported_modes,
>> -                      ARRAY_SIZE(supported_modes),
>> +    mode = v4l2_find_nearest_size(og0ve1b->sensor->modes,
>> +                      og0ve1b->sensor->num_modes,
>>                         width, height,
>>                         fmt->format.width,
>>                         fmt->format.height);
>> @@ -505,10 +534,12 @@ static int og0ve1b_enum_mbus_code(struct 
>> v4l2_subdev *sd,
>>                     struct v4l2_subdev_state *sd_state,
>>                     struct v4l2_subdev_mbus_code_enum *code)
>>   {
>> +    struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>> +
>>       if (code->index > 0)
>>           return -EINVAL;
>>
>> -    code->code = MEDIA_BUS_FMT_Y8_1X8;
>> +    code->code = og0ve1b->sensor->modes[0].code;
>>
>>       return 0;
>>   }
>> @@ -517,15 +548,18 @@ static int og0ve1b_enum_frame_size(struct 
>> v4l2_subdev *sd,
>>                      struct v4l2_subdev_state *sd_state,
>>                      struct v4l2_subdev_frame_size_enum *fse)
>>   {
>> -    if (fse->index >= ARRAY_SIZE(supported_modes))
>> +    struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>> +    const struct og0ve1b_sensor_data *sensor = og0ve1b->sensor;
>> +
>> +    if (fse->index >= sensor->num_modes)
>>           return -EINVAL;
>>
>> -    if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
>> +    if (fse->code != sensor->modes[fse->index].code)
>>           return -EINVAL;
>>
>> -    fse->min_width = supported_modes[fse->index].width;
>> +    fse->min_width = sensor->modes[fse->index].width;
>>       fse->max_width = fse->min_width;
>> -    fse->min_height = supported_modes[fse->index].height;
>> +    fse->min_height = sensor->modes[fse->index].height;
>>       fse->max_height = fse->min_height;
>>
>>       return 0;
>> @@ -534,13 +568,14 @@ static int og0ve1b_enum_frame_size(struct 
>> v4l2_subdev *sd,
>>   static int og0ve1b_init_state(struct v4l2_subdev *sd,
>>                     struct v4l2_subdev_state *state)
>>   {
>> +    struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>>       struct v4l2_subdev_format fmt = {
>>           .which = V4L2_SUBDEV_FORMAT_TRY,
>>           .pad = 0,
>>           .format = {
>> -            .code = MEDIA_BUS_FMT_Y8_1X8,
>> -            .width = supported_modes[0].width,
>> -            .height = supported_modes[0].height,
>> +            .code = og0ve1b->sensor->modes[0].code,
>> +            .width = og0ve1b->sensor->modes[0].width,
>> +            .height = og0ve1b->sensor->modes[0].height,
>>           },
>>       };
>>
>> @@ -586,18 +621,13 @@ static int og0ve1b_identify_sensor(struct 
>> og0ve1b *og0ve1b)
>>           return ret;
>>       }
>>
>> -    if (val != OG0VE1B_CHIP_ID) {
>> -        dev_err(og0ve1b->dev, "chip id mismatch: %x!=%llx\n",
>> -            OG0VE1B_CHIP_ID, val);
>> +    if (val != og0ve1b->sensor->chip_id) {
>> +        dev_err(og0ve1b->dev, "chip id mismatch: %llx!=%llx\n",
>> +            og0ve1b->sensor->chip_id, val);
>>           return -ENODEV;
>>       }
>>
>> -    ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
>> -               &og0ve1b->pre_isp, NULL);
>> -    if (ret)
>> -        dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
>> -
>> -    return ret;
>> +    return 0;
> 
> The one thing that is not immediately clear to me is if we get 
> equivalent logic WRT OG0VE1B_REG_PRE_ISP after this change.
> 

I will kill OG0VE1B_REG_PRE_ISP logic in next version.

> 
>>   }
>>
>>   static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
>> @@ -624,8 +654,8 @@ static int og0ve1b_check_hwcfg(struct og0ve1b 
>> *og0ve1b)
>>       ret = v4l2_link_freq_to_bitmap(og0ve1b->dev,
>>                          bus_cfg.link_frequencies,
>>                          bus_cfg.nr_of_link_frequencies,
>> -                       og0ve1b_link_freq_menu,
>> -                       ARRAY_SIZE(og0ve1b_link_freq_menu),
>> +                       og0ve1b->sensor->link_freq_menu,
>> +                       og0ve1b->sensor->num_link_freqs,
>>                          &freq_bitmap);
>>
>>       v4l2_fwnode_endpoint_free(&bus_cfg);
>> @@ -686,6 +716,9 @@ static int og0ve1b_probe(struct i2c_client *client)
>>           return -ENOMEM;
>>
>>       og0ve1b->dev = &client->dev;
>> +    og0ve1b->sensor = i2c_get_match_data(client);
>> +    if (!og0ve1b->sensor)
>> +        return -ENODEV;
>>
>>       v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
>>
>> @@ -700,7 +733,7 @@ static int og0ve1b_probe(struct i2c_client *client)
>>                        "failed to get XVCLK clock\n");
>>
>>       freq = clk_get_rate(og0ve1b->xvclk);
>> -    if (freq && freq != OG0VE1B_MCLK_FREQ_24MHZ)
>> +    if (freq && freq != og0ve1b->sensor->mclk_freq)
>>           return dev_err_probe(og0ve1b->dev, -EINVAL,
>>                        "XVCLK clock frequency %lu is not supported\n",
>>                        freq);
>> @@ -819,7 +852,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
>>   };
>>
>>   static const struct of_device_id og0ve1b_of_match[] = {
>> -    { .compatible = "ovti,og0ve1b" },
>> +    { .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
>>       { /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, og0ve1b_of_match);
>>
>> -- 
>> 2.34.1
>>
>>
> 
> Other than that LTGM.
> 
> ---
> bod

Thanks,
Wenmeng

