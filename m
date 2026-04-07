Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0263A9002
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558303; cv=none; b=YFjQ076FA99xiC9HcdJ0bwwTzGvaun7ORotYtT3uog1ic0WBAkJArg3vgtLcKAfx/0PBv4td1Wxm/ulthlGJainIy4pZQb3ffTjcND7Usb6svixAc41C4YsDvPSGZ8hjGQzYk/lX+O6ICX32JsGzYYYN84pso1wt6POa9unfyhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558303; c=relaxed/simple;
	bh=pG/8VuhPAHUopEyOrDM0yRnbbv6CUyYjLv9n4BTdsLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+LxIWcpcoRSwK8BY6HmJ1rgJXvQoQVptksIKWl+B/DC79KeurgWlEala8p3uJ/oAYyFXm8mggXgzs3axXvAn/603G46LfN715dd26fHaf7SM5+h3HCVPsbuL1B3ZdJPWVJwcveWOJyFSwG84zV/Q0GWC/TaJuVNKyrm6Yys8NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMy5Iguu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8CzWIxL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMy5Iguu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8CzWIxL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376WljY1584681
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 10:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cT9ak/hEG6D0P8APAV5wjPhc3R+jHNLKgpne0/0WKMg=; b=RMy5IguugJnpzQcg
	6o4jFwvz/jof/LMb+A55OA39sxPk5pXFxj9Fh5Qmo7aLp6Nsa26/8gYDmhnskaji
	6YLsdjnWowtMYHv11fASCJYU0C6tgbpnHM6qAK3W971O7700m6QqLOh0TiBt1Vau
	zO/jCxtoF+8cNJQXLjEtLPqmF6+S/xFA7dAR/gE2X5wEeCy3o8C1MLsV8kIZENWX
	I6yApgT/jmP7ZVJ6KGMSRR2yEPkFWq+tBOR/Oe5RpW3CtzGBGNod4BI3t2ZbymFi
	zNwdsxqwzZ+skdNosmSVewIE5MCf8iNNPK5PT+hYEZAL3mekPuTplXkMAsz/uVhS
	ucLxRA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9tahk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 10:38:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a016b99579so21729736d6.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558300; x=1776163100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cT9ak/hEG6D0P8APAV5wjPhc3R+jHNLKgpne0/0WKMg=;
        b=J8CzWIxLDuu02BO+ivJlbnjDFCqSVyx/e6altj7vDtl7lMEjEa3o/+rYFYhWEKRuwo
         oXpzpwfNmgz3NAmWQ8Im5VeMaEo1z+Ujur6/Kkn5gWjaVYdRZE2ZzULdqRj5o2keffsC
         fIxEs7guE/WC8Pn4tXNAhX4VQsDhqR8x1AG27PAFbE+UXw8zYVtA4b4bEU8QSOJDaTaH
         iKb9psXzo/CNyTe/MLC9IyAXmmwaWw+Z97QtiQmQeCe17JG4uat9J+EI2VNFQ/VlK7mu
         eQ/oLJfcroO/IsnD4aDLViwf/P7fsO4M3WEe5lUpF+x+Sb/t2vcDoDuEtB3hN1xsvrJW
         PIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558300; x=1776163100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cT9ak/hEG6D0P8APAV5wjPhc3R+jHNLKgpne0/0WKMg=;
        b=ozsssEbya18NKcd7PHzp4ol475dVGxrV1VuJCKHrXrC/L1yuYs7YCKdR1kD2m5oxAO
         CajxQUA0R1sxRp3I3ZKAnn2D9T4kb7acee+2fgvgnGEIMjVIQX+m5dohpuHepCYIgy3S
         Y/4htmxUO6qmmrup7N+/NeGMqE9R+KNgNjC4wv3Kmjvubsqap6fMqbgazmOzcdY6Wap5
         z58/k/6NBhkjhWQMPdRmhELQPG232fF8Ms75aiGXBHIjoNZJlUvmiORPytpK64njeDMp
         /pDlLowedliTMtcdDq5HiEi77R6k1491+GFtrwNYSeno1AMstOy5+jcfiwsOolO4EF7f
         k99Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuoSigkoqA17vMciCdKNh2vp3RzFK5Itz5w7j9UORC4JJIDFja8R1mn38Wnw5aO9IYY5fDAl1YOtNr@vger.kernel.org
X-Gm-Message-State: AOJu0YzOWaSbgKVBR8kQNe6I0AxEv4SqzrmUn8SxgOIF2vyzdb0fzrO5
	Kz07Xu0dmqPPDCbcwf9fjwp7/SlJCKBogGERuQRVsOZBPoM7B4TnBp5cYPMLwEbnoKRU0QQekY/
	JgFtxvdVQTOGSfepR810n6C/m1S8KveKo1+rKXkcejWO4oxrRgKyw83eNtPxalSuK
X-Gm-Gg: AeBDieuweSOqEMDxJ8sn7yJxcrfKxiSRM1Dx3ML3yxG9N6QES4+gWvs8+Mc4hfcmmwB
	KNrWns6otSLFAmLa5z07tJGgS/ECr3LfP/SDtxB2y5rjT8E4aRJ8ha0ISDh2cdNSR3azXVcW0Oc
	FdLOFZQEWAM8xbpVjD1JifFGk6rZS/Bcu1b1cBLxw/RLDKclWiZ5IyPtSm8pskfgD6IYJ6hY3Dv
	kQznKbmkwfq0fBP9MIqL2md/qgY8dMW5NqB1cqZZz3THVdDlM+twXRNJl4MFqJfo0Hmu4SN5NGW
	l2FaErahezmQ6AdmBAZoIAw5fOzomM5YlFVYtKtSKKBJN3Cgj0vbtl0U5cWpQp5x6UmK/WcWMjX
	RWj+In7JiILrLYJwmfSxfu7GPPdh+14Jq9dbkJOYeW9SbgKagBZAyj60hFt30K/AL6dIbVONQp6
	2K97g=
X-Received: by 2002:a05:6214:c8b:b0:89e:9fd6:f78 with SMTP id 6a1803df08f44-8a704ea5d59mr210870256d6.6.1775558300350;
        Tue, 07 Apr 2026 03:38:20 -0700 (PDT)
X-Received: by 2002:a05:6214:c8b:b0:89e:9fd6:f78 with SMTP id 6a1803df08f44-8a704ea5d59mr210869966d6.6.1775558299965;
        Tue, 07 Apr 2026 03:38:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff19c0sm539698866b.48.2026.04.07.03.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:38:18 -0700 (PDT)
Message-ID: <588004fe-6ede-4065-afbf-eed620caf380@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:38:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Motorola Edge 30 (dubai) DTS
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403054417.167917-1-val@packett.cool>
 <20260403054417.167917-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403054417.167917-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4de9d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ePosGYAZjQQ63RukehsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OCBTYWx0ZWRfX4Y2HRrK/7AnA
 2OV71JKwEGJlTnsaRiMoTZIhzCDofIMv5lZs+n6TUXfYc9oMCrkWIbzmEcRxPng+JW7CBjgLF/u
 vn5+hjJaw78rYcO/gHxaRNOjOfO/2uWF3SDkb0zYKKTZaOv1lXqWoMjW47JfsW+F7xcHrQe69X5
 ZKRjdi94YeP3RO7cXHC8w6tXulpJmNiNAb8+df2FKaMNa//ppm0wZdFd3rPPMZo9sN4VwN/1/lE
 CMYbpJNjOFkq3bTYOVarBBxIuv23r1cvcAmnigcNgb2CSlVcib4jDU6/UVUbrGVcbeYoo2Ly31X
 1d7hz/pqB/crbt1a/X045WO8Z23sOjIckAx1gm+lHWRkY5aepKrnTuqgEgNpKS0uIq4jkwqbu5f
 KjZsuiwXfMNQgw7BY8/JSjt4CbxQ3LUsmoVaakeAOlJCjNz+RcsD2RdqOw7x4Hg+QcuKqrmOBPN
 m7/3TIceFOlxEdMOogA==
X-Proofpoint-GUID: XYIJHGoFTe4Nc2LdDmbCZ2GxaKr46ZoP
X-Proofpoint-ORIG-GUID: XYIJHGoFTe4Nc2LdDmbCZ2GxaKr46ZoP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070098

On 4/3/26 7:33 AM, Val Packett wrote:
> The Motorola Edge 30 is a smartphone released in 2022.
> 
> This commit has the following features working:
> - Display (simplefb)
> - Touchscreen
> - Power and volume buttons
> - Storage (UFS 3.1)
> - Battery (ADSP battmgr)
> - USB (Type-C, 2.0, dual-role)
> - Wi-Fi and Bluetooth (WCN6750 hw1.0)
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> v2: Apply suggestions from Konrad

"fix bug" :P

> v1: https://lore.kernel.org/all/20260329103055.96649-2-val@packett.cool/
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
