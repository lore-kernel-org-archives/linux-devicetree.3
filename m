Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837D5339875
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472373; cv=none; b=DtBACUn7EbPAor3mZVTvZ7senUwp8twXcjb0L9e4xs3J3yE+RieYBq81eFXb8SU1klMjpOA52S10eorqa/g/EMROF7iLWQtzxESgeDA9h3msPoNUVAqyPVcWgzacp0uzk5S+51jEKMsUxc3MA15ya/1EIYTsv/I1WXL1qTbu47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472373; c=relaxed/simple;
	bh=fuQbPf096+6djzJq3aMlhIKDtvCLij8MBFXnwoi6iGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K1lPNe52Yz+82EpnW73Z2RkWl9OzhgyZt/QnoSMOC5b5s7xRMMPZl+CE/5GwXotQCs7hqzUevjobbOcdbcrrFk5UJ3Pw1KWqyuPjpfX6m4/4oa6Z1o/7r0YD5IM5Z/LD9/Poy/br688wCpk07j4pzmTvJ1x1HnojiD2ly1Iw27Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rz8oB+p/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KP6VQSUZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rz8oB+p/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KP6VQSUZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHFOuS3947594
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zbg0kWEXrs+ZYBKl75N5Deqt/tJu5PqNcCWKzhnv1qI=; b=Rz8oB+p/ujoyaLyh
	OU+27j3ddWAeWui3DqjmyaFj/P9xm0aNEM78BwH64msZow4QKlfRB/0YeWvnr19o
	Rm6DISycfCqD6ykArlbZs5awk9Ye6n37PBzE92t3tvpRm4Op1LMEoRzuSYPjU7Eq
	0TJB2zT+mP4zUXj52ECdp5srU2cK4KlGDX2EXY4VSByW9/7gJIQxath2I5cGvM8w
	PJurS60qFkT+GQYbWulp/sIsZ/Ad8ypgBxAqfyKjyL/oje/bXEbo75lNjyH+1Lgz
	kCycBfDxMfKRxQ74EkXP5e9u9puaacLB3JgyTGVQ6W1CreD1aqLBlWNpUYe7VwS8
	jNXddQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2nhumm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:52:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c827bda2e60so4481412a12.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779472371; x=1780077171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zbg0kWEXrs+ZYBKl75N5Deqt/tJu5PqNcCWKzhnv1qI=;
        b=KP6VQSUZKeuyMYB/DX/gdM1lx6Lh2Dl+lhnWTb11oygw8UfZYKxK/Xb9gnCGGIP4cY
         9TK6/UNKJIwQeSPVjcq1DedaeNYxZigrVofJzotFMy9GeRjCJCPMS8Swyh95cHsEe8Kf
         R85IOw1Ft1nZN28ZRuXYhq49/TSKLX0f0sPsoOjKTpde+Ptl+lPi07YsBM/M9eZuez/Q
         MQK4wPVUxJBBJAupPE7Trdls9odTKBz6v5T2kzuuqs9a2RZAKhk1v7ZZvBPkAsYqW54+
         YgmCVqlQRMubRNRGAFZ4U0q41nXgbgce+z6IlgHAz/sTkBKteFc4KOyVTyEhi4Qx54+i
         GR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472371; x=1780077171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zbg0kWEXrs+ZYBKl75N5Deqt/tJu5PqNcCWKzhnv1qI=;
        b=gnVNEe/m4ZirvZ6WINPj0HNnhj+KoOBZ2raPx7kF/kxqcsZal1no4CK5ESiBugmnkj
         NpugH3srlJ6vWorKqAmGAZsyIrGR5ZTfJwIsyntsoTvkdOjpr5vi0EnWLy+/Iy7Sj06E
         gPeYawzabRgNeFqQYm2282x6P6P7ppgK0VSkSx2HFv+itb6GyNZVgwJDbT3wBxxvDeSx
         M7m7Gir0N1quENELXUb+V65kmQcecwj8vpJXp0sqaa/m4alE7VFXh9yvi6ggdV0v2Whw
         bWEPphbvOJTiVwxQSQsn9kVdxANgKPWtLTG/wSdC+NohNl6yrjTfPwwc8wJHvTQdPGLD
         JPgA==
X-Forwarded-Encrypted: i=1; AFNElJ9PkMbVvRJbZUqAmPLahoPrbPhrnY77P0/nBrQb4DcVcSOk0DqX5WfaZyofoBrGDczgpJw4XKxloCgJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3kdYC/SzIPSIrkqCRduN55F9QhOwVMy5odW0C74shA7WI8BnF
	/HF4ZG1SOW1UatD3zGVw8L01AAYTqQsnd+IAH3ifa4ofLnH/Bd0J82L+37ylQx7ovbvxVaiSMiZ
	Xe49ff/Ife8n7VEBMHE9G+zajydDpOKXbGRxzaucTwHqduti2TuNniv7RQZqroAyqMzHg3NBm
X-Gm-Gg: Acq92OEnNsv80PVtNYFjIsxhrEVSAhovvrvI8XKAIrdDHqBaGzPlN0ddqhz+omcO5kR
	A/FojVn06x4LOsXepucA/cuw6f5e5FxhWnnd7ZM4XWcaJkzo5qOHosl6QoQn8JXS5mxsXCw5u8u
	P76S6Buq+9PBfNXpjy537z5f77TO7OTRd2fog1/HAy/AXJ0RjX4R3NT5dbhkDT1Ci5sPN7KS986
	5lfZ9sVJzHqIR/asv50aN6SVqw6Jy90laZZGcONhbQEg5tgq3VcP++Zx5WlemAiIJqeoZGmsBo0
	5JhPxL4FAL9LdKRFjhDt1bGZ6fKhjdQaSEsjVTAk8IGMK5dYe8JrDz4oR+TePCH+ZjMlsnUX3rs
	oMpj+oYBpEZfOIQuY8U7PTOFIVy/vn/EqHFqaUseGUzS9wgMCTIc=
X-Received: by 2002:a05:6a00:8c04:b0:827:2ee0:411f with SMTP id d2e1a72fcca58-8415f3ab22emr5037806b3a.4.1779472371035;
        Fri, 22 May 2026 10:52:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c04:b0:827:2ee0:411f with SMTP id d2e1a72fcca58-8415f3ab22emr5037770b3a.4.1779472370572;
        Fri, 22 May 2026 10:52:50 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.234.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165010d60sm3022799b3a.61.2026.05.22.10.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 10:52:50 -0700 (PDT)
Message-ID: <4787d5f9-601a-4d27-91d3-33216ee6f64d@oss.qualcomm.com>
Date: Fri, 22 May 2026 23:22:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: Add Shikra EVK boards
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org,
        neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
        conor+dt@kernel.org, olteanv@gmail.com
References: <20260519-shikra-dt-v2-5-c01b90fb4395@oss.qualcomm.com>
 <20260519123738.BD9C3C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260519123738.BD9C3C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a1097f3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=enBp33lU/LGHKDsbTNpoHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vBFCELq6SH9PKkL908QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: U4lIX99ie9MybJFIwEBzQ9wkCP93OdgA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3OCBTYWx0ZWRfX6EAtjYbXzxKw
 fTFyH+H9Zi+RZYpse0LMvjhFG7QqNwCA+q3eI+Qf74kA8JlmxcbVJBCGXLw+C72cc4qQUkX+d0A
 Ip01vtP9rycLR7Ilbee8CNHYYzMNKFN4k1xOvZo1TpXS/WV1Lwmsm7IM4GUfa8FffhKezTWmoO9
 pk4AEhAD18uCNhh5Gk6BS7lDxnUoE0Z9gyzsTAGEI2KlPzshcBGgSWztCcPHuRJlVUftIb/oTjn
 DPd3aJheUM2XFo3tlq2LjPvctpZ1eZirqcX7kNLizhNNsESzVb8HgfWw/yNbxe24XEtBRYU51sb
 l/aY3IT4sgZWOdI4kQeS+8rfCqbJX41ZQ7LPEG5sbUbK+O738PTpqp4H083K7Q9Dw4/xKoIM/3W
 cou0iPxOUgOBT4sHKZ4Ds2nH3PpHjPrvNTqjrJgl/mgBdPzycJSdeUbkpXdYK9EECzk5j8Eb5ge
 Fql2IfNtargCCDnWlXQ==
X-Proofpoint-ORIG-GUID: U4lIX99ie9MybJFIwEBzQ9wkCP93OdgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220178

On 5/19/2026 6:07 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] shikra-cqs-evk.dts incorrectly includes the modem-enabled SoM dtsi file (shikra-cqm-som.dtsi) instead of its corresponding CQS dtsi file.
> --
>
> commit f25002d6be7ef75f4f5e2dd5f32e45a22f06fc01
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: Add Shikra EVK boards
>
> This commit adds device trees for the Shikra EVK platform, combining different
> Shikra SoM variants with a common carrier board. It introduces three specific
> EVK board configurations: CQM (with modem), CQS (no modem), and IQS (no
> modem), along with a shared common include file.
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> new file mode 100644
>> index 0000000000000..ee460d8c6a877
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -0,0 +1,61 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "shikra-cqm-som.dtsi"
> The commit message states that shikra-cqs-evk.dts pairs with the CQ2390S SoM
> which has no modem support. Does this incorrectly include the modem-enabled
> SoM file instead of its corresponding CQS dtsi file?
>
> Inheriting the hardware description of the CQM board might lead to incorrect
> behavior, such as wasted reserved-memory allocations, or potential probe
> failures when the kernel attempts to initialize the non-existent modem.

  #include "shikra-cqm-som.dtsi" is intentional and correct. CQ2390S SoM 
shares the same PMIC configuration and the same reserved-memory layout 
as the CQM variant because the modem processor would still brought up on 
the CQS to run auxiliary services, it just lacks the RF/modem-peripheral 
hardware.

Thanks
Komal

>
>> +#include "shikra-evk.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
>> +	compatible = "qcom,shikra-cqs-evk", "qcom,shikra-cqs-som", "qcom,shikra";
> [ ... ]
>

