Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145E54052A2
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409036; cv=none; b=TDULnLMaO6Mys0sWAH3hYUkfK4cm5f+ZD5kP8cH/hHemgZIxqx8VLCKSo+XPliR55GyTOZcNCPY0Ojv7flIzbIFeeygpfoJHYgo68TZfMYPktTqzZ0Wx1sOGMIagz9CPf46ZOjs3mUwgwBfXJjD1moTxet/LZhI8sknP8/kx8FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409036; c=relaxed/simple;
	bh=ZPQPB3xBi/xKVbwZEUGRrv5xu6tvh+vX5h1M0oUIEzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLOWtYqRDEGUF5ZKf41k4YqVqba1NYlr8MoNxDlandz9Yx0Nb3adlvT0tNcxl1z/+Dm3AKB/+GKZvtQodcobgt4XboBcfsHoANlXGOfNFToEzwYnUmJ0JbqcvLHZcJ9jwzdbG00E5R5RgUCpUTDpLtLfpTqUZ6PQ/KVqrMmqi/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UuPMJMvp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cq66/Ozi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UuPMJMvp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cq66/Ozi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2Mh0941361
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSSgAkjVtZ/wW0D5KMiicODP9+dJfRMr/iPao2SGoG8=; b=UuPMJMvp/ZppRuvT
	IsBHIveztVxJwq5EzE4y03lTRjd5FmO1OzvDIdu+8v9Uhhk84G1buwwxfylzlNjN
	dWOUKnGYj6N92eAMoP8kqXUlcB0YcUHxqW/WZbK06hnQMLkF5OvAV6fcvSKDKt+C
	xF21myvTm9fxJy85+AbIjdkSRS0T9El8kIuo6gSDDRbj+bj2SXmph2UceSv2LuTw
	+r1BRmtLZdvuXkb2SAnB1BRK/SuUcaB2KxzqELYGStvqX/IqUcY6SBqnj3vSBN0i
	R3Ci4R8vAA0uOD1GxKbqWoMNUOukqbAmNwsSehkSnlqEaFa0jXBuFElPAtpL7t6t
	1PLtdA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3uqre64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:57:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cceabd70f5so59627645ad.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 03:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785409034; x=1786013834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSSgAkjVtZ/wW0D5KMiicODP9+dJfRMr/iPao2SGoG8=;
        b=cq66/Ozi4msPRhbV1YC4AYckKS3/HDRhBM+YdqGjgTpjLPrpkKa+VqhZgcbiXPaakC
         y/+uwjQukwqi1V1MlaannBd3TlI5AeFIlUEEcCv3bezjP74QWYgLr0ogBUwzVqH0lSxk
         CcF1MFS7s5KskndpaGdwwaFE2bJ3ieRXQ1sQ8vmfmsY6YDjXQyq1BYFnKTX9QpEYiwm5
         +/kY9D2W8yM4hxlzjLR8FTKU7Pij0ad+mrViNUodt/8Xcye8iICEa9jtd2sg7TUY20vC
         LeIuaY4RTco89YHkyOFol1QEJ1zcjlcApWcNPo+iYrmiQJBF0dXZtEn7/NkvkvSlGtEQ
         e44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785409034; x=1786013834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSSgAkjVtZ/wW0D5KMiicODP9+dJfRMr/iPao2SGoG8=;
        b=HU+4McOejfPnBWJwMns9VHU8ODVYpSkn/yGy+OqLX+bzGuX8ysbKBYvhLaju8KsGGC
         cixOb9ERali6rJba/yf8UZusp1FreCM1J/eqB/SuHzhDg9Vly9/isS/rxs0gHtzs+sCz
         OAYHYv+Nealy1UvLn2eVygjckInDv2n+HUlrAScwFRJtKPqLmNzlqf6eOVNv1qNt/SkR
         FJ45JYtYtjiRdph/WjKa7OgZ08zj0fYR/uhpSqpynztKGWJ8COzlCD9Uqwsc5pefpLVA
         g1osVqMmbeZjraXk/55d+iXIUjEWEYnkLJoNpeQlBhrzabBWOJiC4lUgwZqJmqefl7yd
         7WOA==
X-Forwarded-Encrypted: i=1; AHgh+RpgxdqgzScFv0sUN/XyZPPDf3Jaz/mbyhY6+8NXFVp50YJqgAV+s1zxi2p71lXmJPFlmLvV5Z3mzlik@vger.kernel.org
X-Gm-Message-State: AOJu0YxScVls9GGxFnfhviwm2OagHg0SpXv01c/1cYN+sYhUGj7EAuh6
	BJX+H0dP44ggDNNhcTaa1C9u+RX+E5r4y8uuxZOLsDSCADDdGq4FW8YZMJIeINm8cOWzC9x7RPQ
	MUHAPxx3L++/cZiQCji4PXS7yzLk1oh9Gz9/P76pjgZ0j8S/7dIJFFLANhTpBTY1n
X-Gm-Gg: AR+sD118EaEVYDHwgXGezcVVyeKbohdv/DVBafdK+P8jvxAOxfFREsMVj2Vnfln/Do2
	XwWDE76KVvm7qxrHlvicIwS45Rh3RE3ljvkx1Yx/wGSRRcoRAwkjdzQua/NLcXYVFFZMI4GnWdj
	wRUSebxgsCrM32lvAoDTLh5E+PIqXzs8PCwsDOlnCcxgyaDOy9npXzn/a3Y9kniXZE4Nax4/8ox
	uJuby0bRqwtaIi6YpsCFsZeiJKHduSPw/aGhyIbaMK7rKjd2aa5y/Bo3kjgaqyKygsF1C28NFyS
	JDvWSD2sUpWDtDKQl1+Y4hNp3VbyZe4SuCSFBMcvFOvEq+ItJ/0ZNVUJ2n44m3vsaK6K86fn/5V
	NPktiMJmwmObkJt3J0BOTvSI0ssQ=
X-Received: by 2002:a17:902:c40c:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2d035be39b9mr23128655ad.16.1785409033789;
        Thu, 30 Jul 2026 03:57:13 -0700 (PDT)
X-Received: by 2002:a17:902:c40c:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2d035be39b9mr23128285ad.16.1785409033257;
        Thu, 30 Jul 2026 03:57:13 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc8310sm25005455ad.44.2026.07.30.03.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 03:57:12 -0700 (PDT)
Message-ID: <6b52355a-796c-41cf-b604-ea866edd80bf@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:26:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ptp: qcom: Add PTP driver for the Qualcomm TSC
 hardware
To: Jakub Kicinski <kuba@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-3-beed14e72510@oss.qualcomm.com>
 <20260727162008.2b93959d@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260727162008.2b93959d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4MSBTYWx0ZWRfX5Fb6S4FIq6PG
 1gQR5+Eoy+24w5gtTeqpo8ia9aDC88f1dtpO0dVAUc/931rcdFRN5nwK0cXYT/YPSbOWE1e3vmu
 ghQU7F/XNtIzIIpt6Ibw1668HguTjo4=
X-Proofpoint-GUID: wbcuEyp7ylHlqO05uoVf4dep-7_Q3zlg
X-Authority-Analysis: v=2.4 cv=Do9mPm/+ c=1 sm=1 tr=0 ts=6a6b2e0a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=-goOgsFvLHZ0uZs3yIIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: wbcuEyp7ylHlqO05uoVf4dep-7_Q3zlg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4MSBTYWx0ZWRfX+rZSmlw0o+O+
 2jHFJ/MXjL4w5ElWt2vp9rO/xcQdkO7aenR7RS9zwTO/S7PlaVFWQ7NPKIIWO+5gvvXxCg9aoyY
 95ucgO0E0TL27ciDyT1rZTqz59H7uTK5uK2F/fXsTBLKdl16FTg5a/ZPNKzaZgdPjxDyuHkJSUM
 gkq9ENZLuXDmqUs4jorrNXaYC4BD5Kkwl98raw07SxlXBBf53SNXW9CTDu/scBjMErklU3CkyBA
 x2fvFJbPtCl7gce/0gLiwHXm8jKEEfPlcCii0ar/kTxm67+7E1+oUWsCuUAeSarCLLuSMEufC9+
 /aM4E27lZqhnljAg2x/bvtwXRddyBs4WBDG6kg/VPLXxXl47/ZjtvcK6wcseemyLbzywI1ZyfS/
 lgUgB1+5hbxWUt5G+7hLBkaR6SwXjPN8MvpMEeVyaBSQhDrtCRIeGQpnH9bak9tEmXVoUjBF0f4
 k/nl2uUNKC2hFkx1uDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300081



On 28-07-2026 04:50 am, Jakub Kicinski wrote:
> On Mon, 27 Jul 2026 19:40:59 +0530 Imran Shaik wrote:
>> +static inline void qcom_tsc_split_ts(struct qcom_tsc *tsc, struct timespec64 ts, u32 *hi, u32 *lo)
>> +{
>> +	if (tsc->soc->rollover) {
>> +		*hi = ts.tv_sec;
>> +		*lo = ts.tv_nsec;
>> +	} else {
>> +		u64 ns = timespec64_to_ns(&ts);
>> +
>> +		*lo = lower_32_bits(ns);
>> +		*hi = upper_32_bits(ns);
>> +	}
>> +}
> 
> Are you sure the compiler doesn't inline this trivial function with 2
> callers even without the inline keyword. Compilers seem to inline as
> much as possible these days.

Sure, will drop the inline keyword in the next series.

Thanks,
Imran
