Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481428;
	b=vFQiKvzMbqp8TyfK1exf1gOrmGBGk27jYGSH24eoVXj2Lzs9K96yFhBrcYspr8HHtmiK
	 Ry2KLcdN9a4t1rT5VmdOd3QqsUK2O8JHYTKaHAEjCtymwkJlx1PIG5vR6vBmJn+CR8d5T
	 x44xE9jXntAosngKlCDi18lKnevi99ktjnhVsT1nFiAnvkOlenZIsYeLrNlZZeiCG7ZdV
	 /8pm5xPmsykXnMijKOQtKGgzPWt41XHT6cwXuuqAWlgkq2/F7c1Rm12LfWo+Ao/9Sg9iM
	 9OD/zTXy6vs8H0IWNurCro2hVu0rtzp0MfaaQHRIrBE7v96aXS3GqAVVt2ttfySsGVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bBqxEusXiRhPWLDC7mjlDTqytugjoLWLWe2UT0oEOns=;
	b=v0igVR6OADs4sGz62SvJkKNofUyiZAirhPD839rE56zvsrrsCOIfnNbbqzAEs7urms0Y
	 fyEji2WOpnFuYDal8/ci75wU1VFdl9saiBJUCqU8EVpA3B92OieTZ8vgJ9YT1x0mVHMlT
	 W2DkAY7q+Vf7OG33nKPH7dHygEvKXsq6oNQLs5rgg26D+ZEKS7u2kP5fXClRfzi9R/mwj
	 YSgbrUa38VN3d5ioqfx41Ax/cbTtXiAEpUqJgfXzwW2VBDWp0eawIVTb4Psa5d6Tscww5
	 sl+coJEV9lWZS2XJjt5FTQoprTXOvacJU2tIX4xpbXq6mV2QrkKu9hD2pb61sORsDsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XWnIhHFy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ekGL/KBh";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7F5606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C7F5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XWnIhHFy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ekGL/KBh
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tXeq4032354
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBqxEusXiRhPWLDC7mjlDTqytugjoLWLWe2UT0oEOns=; b=XWnIhHFyxb7aEpiq
	xeGv4niNxM+L/QgL27aVfxAgYAY/CEE1QzmhjLa6+jGoiaW84KWmSZe0lDskvWhd
	0x/3T1vXqVk+/JqHvYTP6r/Hmq24EYMTOcQmOdSJpb8c8+QtaFQMIoSOw3N27nid
	aVBWUsTpBvNGoSS4UcjicM/Pn4uNxq8p0RIVWUzFWVdw8t3Eyzs4isbEtLa/SF/i
	d+PTTBTAbf0fzupF6P5cqKu22u1SyS/h8UY947kRTzsuHqg0OBrpEyJ26w/C2P7c
	AAiz0mxqPta+zbVcilSFtVz0yw8GzFgSXARsNTAuwMEG4PWMz7yZMGQOxVGCkowS
	cTXqRw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q9bsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:30:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536540909e5so4792561cf.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481426; x=1793086226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBqxEusXiRhPWLDC7mjlDTqytugjoLWLWe2UT0oEOns=;
        b=ekGL/KBhwBuCWvobH6CJxvJRB1zvFfHMpe3ENQwtpt1PBPHEvLZfNlQcqgUT4W+vSR
         9QMpfHguajXMaBq+tI9HYMiaiYzT2cX+1YCcwMALTgM0JmY3i0SxSvc2B51+C7apk8E3
         m6+qth13sYDOs48O2MM2Bk0r03TnorbpunKG3QkEf4apjIm3dYQR3e3qgyIVM7ZXc3JT
         VY+kq/Jl8FFgO/aalCIq7DWe/jaBhR4kbIfoMrrLdv1hOw+so8qErVi1LkeIrW5pCRaH
         kXF2/ff7ca8zIaGHdL1Xvmy7plyDUtYpcRRAhiHCzfCm/LuC/tXD/77YOM9coXTYMP8G
         xGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481426; x=1793086226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBqxEusXiRhPWLDC7mjlDTqytugjoLWLWe2UT0oEOns=;
        b=rj3n+0FKHWPdNEnMJMJwj2eYJL14vNec4lHVa60Tc9TjvnUO+NK4k1IK+a2NGroaYb
         QFoBNHhWYSCfp4bVGatkxYYAzKcZ21WDw2jQVwA7+2zoMseH4EAMJI3gshhx1DjR9gKP
         Eh2M/plcky1njf513b89mBKJMLchSiUFL56ul4MIiNvCdOdQ9Y38DAOS/80JRdyC7Grh
         GKWoi/POJeBCI0Pi7UbO4PbPJABroVO55aSPqUxlC+7WYi3zpkDEHwjT2c3E5NuqTXe2
         KfVVtl5U36iNm54AxuAGt+4lME7VeqL32dtPOnejvLy5BWuuQE60R6//Eq95Cp7YkWdk
         CVag==
X-Forwarded-Encrypted: i=1; AKwUvByKwalslSuF1uYzfVKWJyNyjghu9S3+GOPreY4Jl42FnHti2Nm55x+FMc87xjIzxvZ76ZHj0Mt9mURq@vger.kernel.org
X-Gm-Message-State: AFq9FYLF/Vo2nEQkarvr7/M0U/vIdLhLRGK75ngb6l8lry7BhH/mJ9KS
	T/GoiTdCzcQyArkr9LqoqD9GDBQTeDv1ZJ+BK2VVSfJ9v/q4CgyyyNfpXywl4sKPvwM9dzht+8j
	9UWcQCDmHnHQoG39WLuyj7W0Jwnfgnmef60cBGFDTMWR1hosXu+uVJK0EVqON2Ffn
X-Gm-Gg: AYBFou3V8u8v1rNo58HRwq5cnLoX+InFCTvELfot5Hi2ivZkVP9VNTVOsdz8IKBnP5v
	m6FVzCX6WSmsaJCNl02+Wpq9pnLSI+VvVJedrTkDr5bTrg/OElDqzHAAFOt8fpeQYu7YWM3WhoT
	YM3W9hOeiHq/V/2pO3bQpjpdUX+7C7j+eFYozVCBaEWxM9Hm66CdriPuB0zLUFb6D5QLK8PX1Ld
	15cgNJumnFjLOjwXMBtTkI0+HJyBOpkev3Qj1CnIi2sxuivqI0RmLHT1M1qtvndx2r8h8uA63P8
	25exWpuQ43cZa2rjqB/TSJYCcx1YAoYLc9sc7Ouxdb9i4w5HYTgkPFleupOAr61jdV2wkQMF6XT
	2tIXHnwM=
X-Received: by 2002:a05:622a:110c:b0:535:1e4b:53ed with SMTP id d75a77b69052e-536460b5145mr176739191cf.5.1792481426040;
        Tue, 20 Oct 2026 00:30:26 -0700 (PDT)
X-Received: by 2002:a05:622a:110c:b0:535:1e4b:53ed with SMTP id d75a77b69052e-536460b5145mr176738631cf.5.1792481425434;
        Tue, 20 Oct 2026 00:30:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf72asm463264466b.18.2026.10.20.00.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:30:24 -0700 (PDT)
Message-ID: <c59ce48e-05ea-4632-aef5-78b9c6a4b21a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:30:19 +0200
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
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
 <bc3cdd77-9e67-4e72-9144-af854076b74c@oss.qualcomm.com>
 <f25e31fc-4767-4c1b-9c34-2b2f78444967@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f25e31fc-4767-4c1b-9c34-2b2f78444967@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gYTuEIMT5_oCGd-Wt5oNSopV3b9ScRv7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfXyeqJdemdgNbP
 ZC9LjAuvuF/enRTxtLHBjHy66Lz6uiihnxme8RYMm9cP8Pqo5oN9/LLMO9b+tASqCbN8Q3IeDl7
 LvGiP+8EC+s3CIn2I2BqRtZLq46RyBYywsYTgUe4wBFLhRr1Dqv4a4WAOGe4VBOv0LQffGbFA1l
 chjXYWI/NKk8Yk1XrLAdcJFWIIPotw25Eyt64b2lUcLv7ePRwJmW9fa3e2m0ABjFoGc9S6zsOx0
 Lpj1UJwwIeuGUKac5oc8S213NSzKW8lP9vVp6N9DTkBFdG+NCU2sGb1zps4gxOKTvBLkrW1muwB
 REs/5xRzdbUHIWCGxg4DNPTqnv5BRoF7aACLigNJSxUUlT6kIUQkFUvUrCH34HCIbXxk8nWHd5J
 ovPCj3xBuKvmy8pJE6/eUSNE19BgRmcm2de0lMqC4vjQgFL9M6EeViMY81xH+dA6+FO+ZuMn+7/
 Kz5yvIDyD1Uso+w75Lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfXxyfjpO/ODk23
 Wup8YQYBgwXMfCDOTuAeXC6KL8aG3cgPMzNhKGqRB+g+6skQw0O+FX4IA5ZmtS8evDAIR0GkJYj
 ppAeaIglHRpRjOcrsWZ6lZF2PWxc4DA=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad71892 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SJAiqMQSjMSsh2023uEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: gYTuEIMT5_oCGd-Wt5oNSopV3b9ScRv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200029

On 10/15/26 9:15 AM, Taniya Das wrote:
> 
> 
> On 6/9/2026 6:54 PM, Konrad Dybcio wrote:
>> On 6/2/26 5:21 PM, Taniya Das wrote:
>>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>>> clock divider. The hardware generates a fractional output frequency
>>> from a fixed input clock (typically TCXO4) using the relation
>>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>>> register. The clock output is routed over a gpio controlled pin.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>>> +    gp_mn: clock-controller@88d3000 {
>>> +        compatible = "qcom,clk-gp-mnd";
>>
>> The compatible must be SoC-specific, looking at the table, we could
>> use these example socs for the versions of this block:
>>
>> 8960 (v1.0.0)
>> 8974 (v1.1.1)
>> 8994 (v2.1.0)
>> 8996 (v2.2.0)
>>
> 
> Apologies for the late response.
> The GP_MND block does not have any functional differences across the
> supported SoCs. To reflect this, the DT binding will use a SoC-specific
> compatible followed by a generic fallback compatible that represents the
> common GP_MND implementation.
> 
> compatible = "qcom,sc7280-gp-mnd",
>              "qcom,gp-mnd";

I think the dt maintainers may be a little grumpy about the non-SoC-bound
fallback

> 
>>> +        reg = <0x88d3000 0xc>;
>>
>> Let's map the entire 0x4000 that this block spans
>>
> 
> This region support 2 or 3 different blocks of HW and they have
> different functionalities and for which I am going to add the driver
> support. What I can do is map 0x88d3000 size - 0x1000. Please let me
> know your comments.

Sounds good

Konrad
