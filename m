Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373951;
	b=gTWibfEZr9zAs2/ofHD26RZbp5tV9qLKMt3faPZUqF0/g45CICWT4jtg0A86olRLkWvm
	 bAT/v2tCreXtnsARTi10nePPmzQJkRXWqL6bW0JQF+11Xf7y+TkE7iwcTsle41hg25M6t
	 b0/RedeFhj5v/Ut3dM4gSx4lSphlXq8+Z4WlP86MoKNUGUT6l4wJLI+rasW7Ga72/Ouvs
	 kvgPFXLZWIilK/bTrNQiVUeNhsJUmLfcxtiR1ojJk0a3GXVjfELevpZzi4nC1CrlbY69E
	 TRVisa78N04TyNiWLYrOh2hxX5OPollULRSY6xnbvd7MOwppzBxewyZfpnZDT8ZM1XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=;
	b=DiIpig4fSaWGe/QV7aSV1IqdMYznLEcUD9NE9ryxdW2XbPah0Zhu/z4zVJbYwuquSQuY
	 otU0Fx+L3dDXYEl/Y2nbyth9LvMBx+0mH41rTFrJ9r4VkzdCP6SbmD1Ieab+wtZ7/jg7X
	 2/36ZW9Ci1UFkE4eCmalgvmNdsEqKmw1i2fjTpbIitwkopJfyF7NygMdX93O2fs8JJceH
	 lkpGhFRvXQZhYtJYZx6mHyg7eMQ/FrP8qDVecQp2dKbr8qkLRO5BlUFQfN03iK6mdEd+f
	 9BexfGTr0MwzoqsdxoNDfwqLvKCE8Fmovu0Cy41gqwoHErgZWbdhg9981E5uBR6Nu5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LtUJw8K/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxKyyf5m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A495606A322
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 15:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A495606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LtUJw8K/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxKyyf5m
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERAkK3552301
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 15:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=; b=LtUJw8K/jVPibXL7
	Nm6X6MfGfw+jsqw0QHvh2SPqp7FITBDyU6dhveHHRWv4sDrLCiMXu7elwTdgxcv6
	Q3v8AS060Pha/MLTvN/d27jg8OzlGalrMTvDiPa6nz7k1ay8ai2sTBgzM4gQT5Ln
	P58OwN8NvpRQjWM4defAPMQ4BkxF/aWafIxZTjLzBXw21cqPCfsl4dNYSyun1uCg
	FcsITEjBEJGGtVM4bH4yu56IqmfgJB7U4LNJ2aO5u52hh6bPk1YqAP6/UTf06yWr
	aZWscMPIY5o0ShNuCabk/YQkhXFls5MXy89QqX4jA8/yoUx3lfFZFSjl9nYoT27x
	xp6Smw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkp5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 15:25:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89ff475a0deso804474b3a.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373949; x=1793978749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=;
        b=YxKyyf5mwMosBl9MsKEIUJrBY/Lys6qbKF32l6aV6L2rInMpSLYYvLIauDL7z3tfIJ
         vc66hK5TS6Z2m69HUNfr/t3hmJg+PRVFWH7WBg7U7J5Muf/qvUWdeRtob2dz98N8VPKI
         C8MmW1I9VKP6JQ5BjQRHsy/dqiFPmWIbYBqBzA+N+PMs0jsM93cLUJbyvVcN1XCIRA82
         DM9W+P99WFUgAlkw7tC/O5wSB5K45/Wx56YgZOeND7952LvlYW0Da53a0r5k2d01o6k2
         516tsdFxfXgYvwgMdOSKhZSW8nOZsKDNMF7qNilFdRDmq+WKhJndJuXZX+5GHRbcPs0G
         UkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373949; x=1793978749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=;
        b=VviMCg4q8Qhas+mHN5Rt7bSgrjhMLxe2b01jTX2iifOJ2H0cDyaR833tvZ5RXForpW
         gObkdIS1nEBTAwZs3wGBhzCalrA3CcqVocKQboX8fnwDMOG0OCjlmzdwLBoyPin+YT5d
         tRXBo3paOzGZr8VBLtfKmZF4SbC1TWrDKxo4AYzKJJW8XWoDfxgMWZpA+s26hEqXp6fp
         xB7JzzS+/UD7abvRidntlucSCLKOl18yj3DnJrjL0s1nTP/gEu7tlOyeNfhq1PjZicP1
         A1MKQLg1OhfzGdSpPgzV/vUdaxvF5rjE/LgDXeTqtrhMy+FiFb7w+ietaGcTX5pXM25j
         6ISQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5SwJjZ+nfAWbmUzqAu7b+u2GAGlNPh0ZiIqsxaQMR8TSFaFZ7rSmePVIVggSCFuW9KT5WB9kn0qvL@vger.kernel.org
X-Gm-Message-State: AFq9FYKwlbcXQC55LmU7RLlEQ53zse9EGv0agTz7Znh27YuMlA2c8/Ns
	7/LWMQVZColX9Pd7jkSpNWlwMtn3tQDH+YRGjXRQpypyH8aXJaldoeVjjC8Kf/sTpGVVGWe56N4
	tb8pn2XSHkxzdXfo4j+UrBTa8hzj9KwB3GbxTLsHxrL/fVMbzL/tDQqux3f6poOZM
X-Gm-Gg: AYBFou0RaDzK04m9ojqCHUOSk+/m22WW2mwY7xOpvNK1wESHPfvBMIlcbsRspkEgOyy
	JsyORE+sbQSKpz8HsxU1Yj+gRc3kk3wPMw9KAHOE7IvJvLxmcr5IYp3ydFDc3gSP6+Zjmy4ksfs
	mO+7NAPoV25D5DKzrh0a3HTqhd9FYWtTXTnrQfJg63lVjw3dzzGTFanAfCXUCVApEp6HhnF4sTf
	Ft162KrNnfurOnu/wPV2Y/H20EAUJh/tG8Sj2y25ak4pDxOcokmAqyTdr4GuLJ2GPa4o9vzj7uy
	Lbjazdfx/CMWxHvDj4A4oyYRNWMKQQgpzcXPHMdXp/nU71NsfW+HVZw+L4i7DFMilSWC0dJwzmI
	nJtjPeMcD7DI6UTlSjNSxdZotBpcqmRlHGOf9LgPuT213kOK1jpBrp1jrIasU9lKDRpCBIn3syD
	LhDJBDjsIjzGXIf0fgzM5Qf+k2z+rwP54s9xu1
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr2301177b3a.59.1793373948962;
        Fri, 30 Oct 2026 08:25:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr2301134b3a.59.1793373948472;
        Fri, 30 Oct 2026 08:25:48 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.160.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada2dec47sm141926b3a.36.2026.10.30.08.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:25:47 -0700 (PDT)
Message-ID: <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 23:25:41 +0800
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Bryan O'Donoghue <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aQWcF5P4wqcowlmeEycpOcnXY_7EG3jT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfXyiHD02BAcBqN
 e6IQoquDHp1T5iUqkM+4pfu07nL65eShJp8LFE0AS3KT5BkTvrnGoPhC2vIwq6j9pQfDkWeoIPb
 i+vPrv8p0+GmtJS8PWAVLkFul081B/A=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae4b6fe cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=6d0oVIyUxUng7TJeo7N4IA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=oDwHtdCdAfthrX0yCOUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: aQWcF5P4wqcowlmeEycpOcnXY_7EG3jT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX5/dnyBRhpm1I
 3X1p1IFs9MSSf721dFxYlMTpIvcYY0PKdkXBuJpFlqSkfp2TIGkahwOyjAg3rAio9O7jQ/ZAwSa
 2gUAXOZDXIl5SIeYkFHEVP3zjdLPQYcnyrpvaqAY1w9BkOQRfrJ6on4/qm4V9arz36NhoyYcOCT
 ltupH+GvRO1XBMCkQihBtbW8pqb2YrDKyzSgviuQdttRvZ/u4fPWqTKNPpZNg1M44lDfjvBjn/y
 cLi++S4Lo212HWxlfKKbz6lz141z0IENmp8/DQz6iUJ1ZdpdavD8ra2H0BKaGUDj0OENMvwryKs
 /XJvkICbPlHl8iTUrSbjvjDt857hZKAt5t8rXWMBBR6MwoECz+BUe8graZrNqotQ+tEPdxObCrc
 6STVoWUBVSY7LtTEcZM6jba+CjdDkgJKHo5+rHkE9d0OIG8/dTMnT1GAyOM3DchiziJqwgnFiTy
 bNff3x05ZHIS4z3siTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300061

On 10/30/2026 11:04 PM, Bryan O'Donoghue wrote:
> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>> +static const struct camss_subdev_resources csid_res_hawi[] = {
>> +    /* CSID0 */
>> +    {
>> +        .clock = { "csid", "csid_csiphy_rx" },
>> +        .clock_rate = { { 480000000 },
>> +                { 480000000 } },
>> +        .reg = { "csid0" },
>> +        .interrupt = { "csid0" },
>> +        .csid = {
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1190,
>> +            .formats = &csid_formats_gen2
>> +        }
> 
> This looks strange, why is there only one clock rate ?
> 
> ---
> bod
Hi Bryan, the current CAMSS CSID code always selects the first frequency 
listed for each clock in the CAMSS resource table.

In camss-csid.c:

[...]
} else if (clock->nfreqs) {
         clk_set_rate(clock->clk, clock->freq[0]);
}
[...]

For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three 
clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly, 
200MHz and 300 MHz is not sufficient for the sensor's output pixel rate, 
so we need to use the highest rate, 480 MHz, to meet the bandwidth 
requirement. Thanks a lot.

---
Best Regards,
Hangxiang
