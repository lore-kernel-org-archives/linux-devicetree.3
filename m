Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6649734753B
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 08:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303634; cv=none; b=MuB8d37DBKpTshuMP0aCMy1COAjEmA05ouh9UIrWxk3hRQY/4jAzpha8w8hK/mFq2N7FHZaNgsqPuMwdsiVpfQMl+OLHCbHuUPUcMKSNNX+hy09abShsth5RF9PZFiuoDDiknMx8BPBRujLWPn+3/tPnpRcjFNj/BOMth6PK1tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303634; c=relaxed/simple;
	bh=HDFTA2sdOoNmLu4sgK+uQjQ31zICDRsmsBxIHFqevCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6AX/DRLoWdPsF8KR7pMI2CfO2Gb6NwQLMt+2TFLUjkzTmfr2UCXdnwEHNdHvsXWMlrIL7H4Stq2hVuh24sESg+KQYckqdp3mj2ihxQPbhpxLYf9eL/bSEr97BeNdEkW/igaml0z9+bZzbcg6caP0wnmVnKwbrEpWKz6VBq841A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQPpez4c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AUlibXLC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQPpez4c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AUlibXLC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fT4x1258371
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 08:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jyWLJBHTJApg4SyZUuUBijx04Lc4pqCdUxZ57jJVAv0=; b=IQPpez4cwac0Uh0G
	k8Xr65k8pOkbk6VuIGD28mmHQ/OJpVWhp1LHIaopUv3037zNGB4lNMSDiEwCwPDu
	R3IYrah2c+jIaSn6UWKtFOx2/caHfe6ktec+2qBr28XjXd5UEKTTfWUQh8CRCVqQ
	zatckqXdvavnOBRw3+dHn/0t/eOTsBXZilOzTdW2Po1p8/hRD7VsBCHzMP9IXzDU
	qI6Zincgo05Nwn4c90xD/+uUydLCP9vpOl2ujGucuSiz5Ph6PoeGaNHAqIBzD6oq
	JUpDiOjLpU8wPXl8AA10+qxwHZB1DWhx2Hq4+C4cuw3VJY4kQIV034mGg/QBQ3yc
	70E8uQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6ssr0s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:47:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f3e4728so699396b3a.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 01:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780303632; x=1780908432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jyWLJBHTJApg4SyZUuUBijx04Lc4pqCdUxZ57jJVAv0=;
        b=AUlibXLCtEJZSxUIH4/SM+PSVmP1PJqq/JtFDywC8b0me3QQ7acfA6ud/A1ZuVN4EJ
         cgGnEOd2Xg6AsSFdfZ/8rYom7zDbIBkpq7VYGH/DZ/dQ0juehi7whzhtVGgbRjzjBEvC
         21UWiBEm6FZ3dS0mNuZQlqVj2KfPrvJ/ggZIu0ArLav1WMZoLpYnJPwmci6Uo2o+rY2g
         uIfD+1iV5JPR5MfMBDVhw9yHNDa5k2arquKWZyD6B+dKRV2X1+a6hLZbTgGa8NAmoHTi
         AxbDVsAwFOPJTxc9T+Rg8h2DW8WzkzvkPtuz7tYjfz3ZW3hcB6+ok+LiXREFcoM+kFyz
         7WJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303632; x=1780908432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyWLJBHTJApg4SyZUuUBijx04Lc4pqCdUxZ57jJVAv0=;
        b=Al2Hv3fQkPcFZebQfMt4OAYm42mM0EBJVo1s2GyWRkQZpoW4vsURsWgibfKbt2DVHT
         7AN1+3k1bdpaHmtfSfmgJBthR94KhVDX8/6XIWCVH7pRFwHIOnGAfVudCD3Jj2KMzS43
         Ks3CJfKW1IDa/qjmdwYB0jCpDt47VYAKW6GbjZjxCitA9rnaddcc75kbW12e7KfGHB99
         DY4gGO5/VS96llOXN+GfDvotyFSOyw67ZyF2kzI6yzaUoEab5/zPZv3shtWFJ7sGqmWf
         HIv1RbaHsjYAkeDaXJkqDV//NBR0Q1MWM4yzA2NWD+L7Z2aOFQDNgb26uUwFhZbWjHWx
         jdtQ==
X-Forwarded-Encrypted: i=1; AFNElJ/81DswyAgM2EjDkTwxhYX1+LN8iMLiVabre1HGGXTVnoEebe9AK57rIkJwOxJT0Sb5Ajdz8V5oIsGk@vger.kernel.org
X-Gm-Message-State: AOJu0YzG7AtsosjGQ3D2J9gv0rALmaMmF/mVJehBjngQK/LgzP6ZfZQI
	k901RZSa67A5EfVnBNAYbXKVIliujkQc8ldu/3Qki+vg01zm3ZaHzGndNd82YuxNGACPiSBUit4
	M65IMlKmffiZ5Eb7C5vFAugB4Q25Y00J2jFC1dek8XqDjx6r1isW9Xj2F3EkDPvUh
X-Gm-Gg: Acq92OE8dnwQVVpzVQeGt9BlT1h9I7mlzAirPRWXEp14EQagF/C+8CDCdR/BOjiejZg
	lTLEqSxLyLk16qe+BMPk63eu4taLgZySQYxE18s0YAY0JOVd3UXZ0nIcxTbQRnkynRfI1WneUC5
	ugWbeICpC8BUHWemIV0yWpWt2nmXNEMlfpG3m2hhS8o7SZ8yWE8a/NRL6Wm44OUkPgTzf6J2hYr
	ts2SEVZQtF17bjLE99B4AQPSqpUvpTp3KrWAxh1xHxca+U6FpwFWbaOWM12vYQOX1TUdvTVZRmV
	hx4q7/vz4bH9f+QiymicbiBhByBIAR8kQwy+t2ZrUT5UHJLhOng7PS+LyiZ75ZtM8M9yh4hQmYA
	HPPvZoKrb8RSubPxHx5YugqoU1aDmUapVmjf0z+2LTrAVoCicSWsXmPJltPeufHt1v6+2MZOoFF
	GcllbmC/TvxMojlasyHFyD1TzCMt4=
X-Received: by 2002:a05:6a00:390e:b0:842:5719:455c with SMTP id d2e1a72fcca58-84257194b18mr2357044b3a.25.1780303632026;
        Mon, 01 Jun 2026 01:47:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:390e:b0:842:5719:455c with SMTP id d2e1a72fcca58-84257194b18mr2357016b3a.25.1780303631556;
        Mon, 01 Jun 2026 01:47:11 -0700 (PDT)
Received: from [10.133.33.66] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423dc9f361sm4678171b3a.24.2026.06.01.01.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 01:47:11 -0700 (PDT)
Message-ID: <83de83e9-ad0e-4aa0-b48a-fa922c560f78@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 16:47:07 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/5] media: qcom: camss: csid: Add support for CSID
 gen4
To: bod@kernel.org, sashiko@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260508-kaanapali-camss-v13-4-2541d8e55651@oss.qualcomm.com>
 <20260508212213.ED319C2BCB0@smtp.kernel.org>
 <178018791720.17481.10983668954574740501.b4-reply@b4>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <178018791720.17481.10983668954574740501.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ss-fgdbBaxlNGXz59TW1zLLpBVnM14dX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA4NiBTYWx0ZWRfXyUJxvqQcLs9R
 hjaA15grgHsode9cWru6/o/UXTFprenPNNJ1vkCRiQPI4GMWfZF1v11s3LZD8G6zuCOsz4ddywS
 4lU2FmceM7xRryNWBVH2HlI6dCMHyuLkcgUGvAH5YXnFFr9KHp1CfJRdvKyKwDPpuU9M1SP5Qz3
 GRlJU7l9iYYCA/ef8Qt80FPl+OXf3tWoNkqt/9hGz/kb8iYw9mBI8EvO2SZco/lHftjrBTT06ef
 8S5zPhR8xIm36wo6hh7NjQMSDEE4EgC0I9o7xCPmlIopsP1SggBT4h/2qlEbTNl7iOWqgs8z5ku
 7+z21fXc2WX2KodMLw5IV5NfugcIaTkiWwP5LzMSSigmtvPHyl8CiM+Tb/2VmCtoSMQclYXPwri
 rrEcZFlpW+uk54GSsGEpvXBTMB9X5WT2tUUYqUv8JMk3bEU9aZLyI+Urf6c+zlG0fIt4B8mX3fp
 +SYyzyTWXivqLwYKTdQ==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1d4710 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=Wx8SgOCzfKFlTRplcBcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Ss-fgdbBaxlNGXz59TW1zLLpBVnM14dX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010086

On 5/31/2026 8:38 AM, bod@kernel.org wrote:
>>
>> [ ... ]
>>
>>> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
>>> +{
>>> +	u32 val;
>>> +	u8 lane_cnt = csid->phy.lane_cnt;
>>> +
>>> +	/* Source pads matching RDI channels on hardware.
>>> +	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
>>> +	 */
>>> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
>>
>> The macro MSM_CSID_MAX_SRC_STREAMS_GEN4 evaluates to 5 for non-lite CSID
>> hardware, meaning the loop index port can reach 4.
>>
>> Since MSM_CSID_PAD_FIRST_SRC is 1, MSM_CSID_PAD_FIRST_SRC + port evaluates
>> to 5.
> 
> That's worrying.
> 
> Would appreciate some follow-up from patch authors on this one "yes we
> looked no that can't happen" "yes we looked no it can't happen"
> 
> Either is acceptable.
It cannot happens as we have limited the vfe_line number to 3 due to 
camss framework limitation.

Best regards,
Hangxiang
