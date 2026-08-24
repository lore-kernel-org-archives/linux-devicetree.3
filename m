Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF2C403E8E
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566169; cv=none; b=mEEyzc9s65eIXjHua+hCjW1LpWdCAUUWEzXu7KKpFCjUDZC0nPS4CaSJIbSnr+O8mTafTlapqkRY8Eb3zUPyynqAZYdBkPVDDWBroXMFb9v/Ta30Si/zvE0XX50b9J/6ytDOmQ9DfUTYoSqsWx3o/nD7xaUAfZDijifY7Ubl2y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566169; c=relaxed/simple;
	bh=4k9/WOTwCcXxhBlXiBwh/LpS8ZNvmnS/HSTi5J17PB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obHOjasVmIcZDRCDQMUoLROGSV7rlllxAMn6DPlwQozGMJMiJFSpS/FSMppqyR8HsR0rP6sEz4DQzFgAEymYL5TOAV4ZoVdMmD+WzyOxSLS8/vwqTJJkhDuO4kaA8zNlQg1IllXXHY3NHvoQwy/SE7rWtPgKqd3aPCQOVBJIvCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBHrLBor; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aOILMNny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBHrLBor";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aOILMNny"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99J9G3575594
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5tI22mJ30rv7Ei3QVlB85GQlgZBKmWx6lwfbgTaRKE=; b=XBHrLBor44cVg+nH
	zk7bnSuQyBItXhgYkWCprrd5gKz42WpYUyvxw69bvEvIUKfa1sO2V9RjUeh5kRN/
	Axm6jD9jCNdLAjLtbNQZOfy0c3xcWoQpO0sk/HyIe0TRhmGi+UW0kuE27FZzfxHw
	VKRhVFt362py0tFSn4UPURE3Ub0sEucAuTl73CXSTk53TRyYPzWqseSOZ2vVvG7L
	xflf3jzPzGxoxm9OF3UyRefisfK2lq09pzJGyFZc71CWIsQB60vrR5uRgBLDqe89
	s3roI4IahSJt8x62miJiNTrPutcpj7hwwZkdp6H/kK7PyjL0JDyGYWJX826g/XV1
	PmixUA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpj5hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:09:27 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-756fd28d906so81810137.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 03:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787566166; x=1788170966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5tI22mJ30rv7Ei3QVlB85GQlgZBKmWx6lwfbgTaRKE=;
        b=aOILMNnyhHKM+CEsPlCpAcNdbpGPi0tqaKHx47Efu8IVw3SAXUUrTFULSJymNQQ+FR
         ibTZ23J+QStmWJeIjeKPs9VvFUQTFMw5wIYsTuka+Yzx9FCaWoX7d5oU+322vj8Lk5LQ
         tRcwvj7l1mW0jR2CcnE1sHCkxmY7ExWkScwZRy08OIZK9QvzYd7GD77X0GG2TCvdTk0B
         B/DSEvdRruLECeb/StOPuHMCeRv9shMtZ5xq1S+o0Fd6LJAo5jEi9XDa58eAOk5k7xxT
         aglOwHhKpPvW2wayvLgAPwTfYJxRZKgRThNp/lcB8Cz7J8DhTvykyvKk/M+sF1t4MxZt
         CEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787566166; x=1788170966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5tI22mJ30rv7Ei3QVlB85GQlgZBKmWx6lwfbgTaRKE=;
        b=k5eCRhKU6/gZNpXoWW7I0V8JlI8qogitekM++QY/P52m2LFIvmp9XKLc06QCrG8WTb
         gH5KvRyO3hevXI3Qb+hIyJ4eJ6nkz2MrBF4cby4uv83W0JFzwQx3Suxk32tDGruKX1cs
         HmPYiwLS8zRtUVF/iDXQ+friwtMrYDnw4PtAWdMS023TXVCRfx8/woTYR1F/qLbbbNeT
         vtiZxdvAgpxUegNFR/P7XugtczO4suPyREW0pVH5D86gcWyhX9cHcaQ+cGXQpAwQnFVi
         m6q7Jgko10WUIPmPZ12goA8rIMxXtP3dn4X9L2RBm2Hwk9jnpDKqOJ9fEGtgWKXJyFLD
         qCMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpzm5PE30LH82hZC/+eAbzgwQ/AlaOvKIg1fCrIdEQ2/yrggi6PeLpQH/kWzCB5wRbxInDlllOjqpMC@vger.kernel.org
X-Gm-Message-State: AFuF++lBrRvTOASedVc18J3qff8ymTyd+a4ElYQpDrY4BYp5GrLPt2wh
	tPPf0ddpTTEW2CUoC5lzJ5OHkynGmp/cu8Qrofpp+a0m88pRQNcIX3T1RL+Wsl1Qj7WuUBL/zkt
	/U7wpYHhNiecl2J4S1soRe+utUkqZW9UTVEUew5FpK/KSkQ+QnXGdxyVo2i9oQnKH
X-Gm-Gg: AR+sD130MST9ttXknPAXz7geM4hOyHlPOLE37MmYeKlIJxRouc5O1FoDPO8gW6a5j7n
	/6yPggvyAaGzy4ly/d7iRIBEKzlarqrOr8QpX+hZwHt8FgKS34cf2e3KqWI3ju9Zd6F/LLyisQ9
	uJ5B+3fs1T0+H8V3ST5VZFJ6AfiHoqJ5+LXtPORLhzZG78CrXR0FNeq6uapKZO+wV0+bzNhCb3R
	G0dDiF3MM268e0Ltl0YV59gWxamjr+FxDUzjTKeiMzXBy3kvj0bOaD/a6VxjFg8nkJ4U6GSyOsm
	XvVKg27fNWxxMXwMfW9Sj5ABCuk2+pkm+rXqMiTdc76DCapuIoquAUnS20cv5QIiJ1sFlz8b0Tn
	3ZVVDbKjnYs6R7pWBuKz6sRXM
X-Received: by 2002:a05:6102:d8e:b0:756:32ba:1a83 with SMTP id ada2fe7eead31-77a64968f55mr3085561137.2.1787566166265;
        Mon, 24 Aug 2026 03:09:26 -0700 (PDT)
X-Received: by 2002:a05:6102:d8e:b0:756:32ba:1a83 with SMTP id ada2fe7eead31-77a64968f55mr3085551137.2.1787566165884;
        Mon, 24 Aug 2026 03:09:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5b93f3acdsm1390432a12.19.2026.08.24.03.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 03:09:24 -0700 (PDT)
Message-ID: <eb9067a9-4bf5-4f24-b496-0067a6c89041@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:09:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-sony-xperia-tama: Fix Bluetooth
 UART pinctrl
To: Shujath Mohd <shujath@outlook.in>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org
References: <7334c260-0130-453f-8169-c07a3145aa19@oss.qualcomm.com>
 <PUZPR01MB51413F6FF89A8FA82A9B2755C3A02@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PUZPR01MB51413F6FF89A8FA82A9B2755C3A02@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NSBTYWx0ZWRfX+Uk0fB2hC6Tl
 t+PA4Z24FYZ99oe4D9JxHkilzEBHS9lZJHDEaRnpMhnwNRNsaWTSkzNwmC++KOfbe+W4ddr1PeE
 WiEI5xqluxgR3u8OEL8tj12dJ9CwAZQjnoEMASAzNBWZidKEAe8jxQkoDfBLIkH2xKT9wIxXMMC
 G0ZLDajSgXry9FjOkPn4V80Js1KE0ZLlBMQ3QmcgOyr5l5uleiK/TqocX85HLrJM6qt+Nf+DbE9
 JXkjHTvHcl1deXn497jd6ifP4pNHto7kOzHdU6CoLDnq2YnU5aSjGsZ59j50E0F4IgF8HJpCA1u
 X0eukfOsZbitkAo3PbeTDlEbnRsgzG/MGkKr1mmoIr8YJKIDZ2IdI7vffk3Z5yDJzyByPtdCHb+
 +JU6O8GW2XNy6st3lc3Axl+GztNzji4oRweDU/Jk9YhKA7Dy38jh09TRBYJy2+DuKjgmhCqC0cE
 8fM00aD40On5S479b7Q==
X-Proofpoint-GUID: uJGDC0F8U60PwsZAuq7RrIHWge5fUfCe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NSBTYWx0ZWRfXxxTZhpiwAxMC
 jd9fAArsDNTSu+VQDDb1hP8utLx05TdyLtOg9Igp98mZqUh9Ztf0jlmcl96kwrXvhYOa9qEnE7O
 EYGZEdT5/FlKs4mRh1EEQfJCzH1Mrqw=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c1857 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nriX_wAJsTMJyBhJSSgA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: uJGDC0F8U60PwsZAuq7RrIHWge5fUfCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240085

On 8/24/26 11:45 AM, Shujath Mohd wrote:
> Use the 4-pin UART6 pinctrl configuration for the WCN3990 Bluetooth
> controller on Sony Xperia Tama devices.
> 
> This enables the UART hardware flow control required for reliable
> Bluetooth communication at higher baud rates.
> 
> Fixes: d54331131cde ("arm64: dts: qcom: sdm845-sony-xperia-tama: Add bluetooth")
> Fixes: 30a7f99befc6 ("arm64: dts: qcom: Add support for SONY Xperia XZ2 / XZ2C / XZ3 (Tama platform)")
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
