Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6577222580
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683875; cv=none; b=ZqX5BD2vWBN0vpY9uTalca01pUkOC8gWVY22m5nclpL+t7BK4Ng6DopHnUXMc1j65Tf1p7d7Ka+mMofHO9zIfVwwGc/JTyzwrbx/KfuLvtyhRNIqK2/FBiSLYUmS+Cj3jelcUXUrO1cXojydfs0VYCCET4aAn8Evy3MP0mbNvck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683875; c=relaxed/simple;
	bh=X533S4orIOcyH6d6QqDplEDIo0eDwal2V08+BLKYfKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8Ik3G9tXIe1BPor8jhek3hRQG3Z7HApiUn2tmCqedzOxbAXvuGRfCADsKbOrfjEZgbxKkZ33MM45XyzK0kJ2hPH2mnDDFG6CArbA9+RIHrMn0i3fekPRmQCEyITE5686Qj1hN+xgBiCIMcR2O0XUrev0ZZ/IobCy9xXswv6lRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtfFiIIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4cP4Heg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtfFiIIy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4cP4Heg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAOQp92338776
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzfLZa8B0chDGUqP+XPMbNKLlQOwhpMumklJOcLO0d0=; b=LtfFiIIyCCGAxDXm
	11yr0oW0B3KX7VliSYCsHTsLVFrLJ+SLP9i2QjTR1XhKXV6rNQIdqVXn78AdtHYB
	H1Ewqi8ZPZJCKKlO1z8URkbPXDi+vjKYO6cG1E9x2zumkfhSHD4K/6hrUMEJoqqL
	WTKXvt0JJgKLmr//e9XQp8+aqyufNFLB0MyoVz8NgXt9kpSUM9stMNIZxsbWeBmU
	l3m2X7K60GDp4pVIn6aJ0ny/2SIXCx7hVl8XtfpyhiVxobOJMEq1un0e6Gp/vmJz
	LBLwl/TGocix3Gd/Ys+jgV0hiBe+ZPD0YpPslOf21hJqz7mlZKR+Eim1fhrxSObI
	fOkN1g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxc0em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:51:07 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95192ee0b2bso332042241.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778683867; x=1779288667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xzfLZa8B0chDGUqP+XPMbNKLlQOwhpMumklJOcLO0d0=;
        b=H4cP4HegIfjJ1+cCurdr3J5gfKAJUI9Yw9H+vChCk82Ly9e0HQyy1Z2QKq3D2/A4K/
         TN+jYpARIN4XSIt0HdGzi9lLbUGjh5ZRSiP9WG0XW2ATP8kH4Ov+ktmStwm7PRMzs6k6
         Gy7RkhKoFRdlVzDceGFnZ9YOQTDyh9rZUIJn1UlAMp0bpXuPi2phYP1RkuGvLNWwk4li
         A6hrUuF/y4TiwOvMcX1i315Cjqp6AOP+K3ke6kU3tDvE1HesJv75An0JS6mkNNLX49cF
         HtF4Q8yFk0VLN+l0o1KquwuSZHrIomtxBFDNJ3B7zTO61HwGiMa1HgCVVZSPavVxiZg7
         +Heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683867; x=1779288667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzfLZa8B0chDGUqP+XPMbNKLlQOwhpMumklJOcLO0d0=;
        b=OlhXhfUMgBjs2XtqDzrZDYPejNpi8EYpBmauwGry49sa7lm0eryHWYC7/mUC3gZJjY
         ATLhHcfCn2GsDcouKyEkuaSR0/e6YQLZhQ5/UDUzPz+x6jW6hRtn3WGR/tF1sYkJXNRE
         w8Hc9SZ7JXf4QPYbGgAWRWpD2BQagsMWyAvABpf3hkgtddUUpozXHtDMM+THVKNQkNtN
         hw9HHrhDgONj8pU9WVeR4Va2L8ObJkJwUdRNCAfQpVVhL5KQF8M4sW1B/6MkuG9hAZUL
         KDUTscHL0w9aihN9KUPCXNIF9C4ThWIFApav7Rm8m5f5JpsLPRh8xkCctIvQQhO6SrDB
         4qMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8X6srdHPRaEMfg7dmYHwSIh4eqMW2gKIlzU+B85dIW1PHKYvjC+eU4Qfn9/Cz4bJ89WwoibkYPRW44@vger.kernel.org
X-Gm-Message-State: AOJu0YxKYiBmJFDWllsChpWXmfat8gMv/RR3SbIScqT0WOzKOsYZU5hu
	DaQ5x+hoVBvIKrvPnKNl5zI+cBeT7Ff6ruWnB+RZgml36IaZbPvVN6XtQsquPfGcfjCXILyZmMO
	nbv97Zvda6CpcyOhbYv4OHy75mpk5nvis17GyIWUqc41LObzeotcbz8j+toGByOlr
X-Gm-Gg: Acq92OE0DFVUk4s6ALKxeSpN5vZGSih1igfvhLml5UiyjN/hsC5i0HgP4juc1K8Qi94
	anO7lAZov/MNRN4wD5PksJw9sFzmPrRKmi2GL7nVHFc7YqmKFFjdhSNBxGGJk3Gtgy/9FChOH6r
	IwoSpPEoNoRLRCaGYWyiz2rYfFcJZ780oiBwXizZU5AtS/k4ioG50zW1YOz1YMgIyx35iF74pTa
	uePml/eWP0ffGKF8vuEzWDhw2zoaA5rYjxTK5L+xSN6M/xBBkthr3wqad3JeYS31bQ2Whf30cVH
	P4HBot1mKCPEvdWx9jGogDE2nTlNHEzGUDsBTi1Ec9T8JY0u3o4eUtoWb3cG1dZstYZfLJFsv5S
	O/gOftyZxNhMtT7aYAz8TT0xlG8mz3WLMWgXzIS/Q/L8oGPpgXEsMppQX/Bn36oERsUFo6M2c8V
	fey08=
X-Received: by 2002:a05:6102:4420:b0:633:3bf6:976f with SMTP id ada2fe7eead31-6376f0b4e32mr751909137.0.1778683867156;
        Wed, 13 May 2026 07:51:07 -0700 (PDT)
X-Received: by 2002:a05:6102:4420:b0:633:3bf6:976f with SMTP id ada2fe7eead31-6376f0b4e32mr751892137.0.1778683866700;
        Wed, 13 May 2026 07:51:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd3716f396esm170614966b.48.2026.05.13.07.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:51:05 -0700 (PDT)
Message-ID: <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
Date: Wed, 13 May 2026 16:51:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
 <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bwr1rOFtIlRLTmmk6VQb9vM4bhwotfUt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MiBTYWx0ZWRfX49WvVj07ZvWF
 E3l308JuTJXkWevRbsLnYdc56pChONVHntyfaVYlICvR+qD6HNIagKB77VI5jSQwEDHQWpLr18S
 HsStbLsIi4hy6kAZZaOLNNjcEq4fqdq6SlM92R2p2QfnRv9xogwUJZfNbu3Ym+1hsmK8YVhucoT
 tgSN5L5S/tH5crh/EwBW3Rcu6hx4HrnTtDrVZ8hCWdIEDll1leY2jGVw+2J3QFY37/UeoJfWZ0H
 2ZEsz5np7IXnA9gdTdWFcv1P5ntfzMMWfrwQ39Ota5mLhShDHDH5COTLdR/DSqcIUzUo1cB504+
 weW+furGBd03N5CpU6T8MblFD1UrEZ9gJUYe4XXO+ioeUilopL6WEiRP2sbtYxTWowGDfBjxlYB
 bB3RrwSSmTsSbBDm+uCX6zF5GruBYbiC5JxSIztzMFW524JScOp99L0T+TEDVRypw3bUpEgDOI5
 iJBQHkHP4JFPJHdQWug==
X-Proofpoint-GUID: bwr1rOFtIlRLTmmk6VQb9vM4bhwotfUt
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a048fdb cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hpvrPbskcaH-GHovVAIA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130152

On 5/13/26 4:06 PM, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
>> On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
>>> Add a driver for the Display clock controller on Qualcomm Shikra SoC.
>>>
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---
>>>  drivers/clk/qcom/Kconfig         |  10 +
>>>  drivers/clk/qcom/Makefile        |   1 +
>>>  drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 576 insertions(+)
>>>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> After comparing the files...
> 
> Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
> clock-indices, but I think it should be fine to use clock-names as a
> one-off.

Or we can convert it to use indices, since those are stable for agatti
too - the names would remain in the binding, just unused by the driver

Konrad
