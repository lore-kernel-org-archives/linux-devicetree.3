Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C539351C09
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810251; cv=none; b=gyqLVsGkkRWUdSqgQ9DXWId3wT/Iz+uVAaltv/uUmwu0nqE05StmPDecbW7u2tLtWoUBG1m3cgi2KqIYZrn6WmrmhOzBGGrOsLSVfMnFm38xDbzG2C024JOkVbAlqYFHep2AAn6ewgcNc2PKjG1XZnYjZMp61pc/rUGwtSzuOQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810251; c=relaxed/simple;
	bh=cuenWBzSJmLiokbaGxbkNinIf9f1cgYhZ03f6TuoKNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUjKbpczIgL3AH2CgIL5nTt5kTRXJT48a1NmZhnA3zuTmBOV/+eSlQW3YKHpn/gf2Zp4CwpYQk7QNfa+kBtyNV5n6Ie93UkoR8mziedUYz2LKdqK/vIRZUf4CyCf56PxmVrzB6CGXbnsXmFoMOnnoebN8dPZ6jY3lhD/IVFNh2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z02rzTt6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUDMCU5p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z02rzTt6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUDMCU5p"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A52xk4780150
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cuenWBzSJmLiokbaGxbkNinIf9f1cgYhZ03f6TuoKNk=; b=Z02rzTt6EXUBoTm1
	0XzwelKLH5pzCQn9ydVoUzcEhDvQuho6OMVx5ZyKsNIg6nRaT3gQ9dLIX2J011Tz
	VOKQlMwYxesoQmTYuXY4Xb9zPbyObL+j57lJJQp5p3IUwBOuEdbYHPTXxqV6D/GW
	kIyyh7pJKzfk2x8/bovlG4pcB2rI16qtK1zi54ySH3ZyoQEnYjAxzWEFoKzs9TWp
	045hrjVtlJ4aHCBdFA1/P1xtx0voojfr+TnJAePn5g4pXrBail6ckglM0Qadr4sE
	fzwY95im+84dq4sKiyYXZe08acetgfMNE7T4SgajImxA0V4ykCcj9XCXllJMqv+R
	5gOSmQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8hupmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:37:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a18178713cso4208536d6.3
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 01:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775810249; x=1776415049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cuenWBzSJmLiokbaGxbkNinIf9f1cgYhZ03f6TuoKNk=;
        b=PUDMCU5pjY31hTM3MNiCmpd0Ip5iI1hR4wFL1LwIwVqRwHe95l1scWv192ZnL0Kb8V
         yN/gUfARduRUbiar5uh9JNlO6hitJXWdx8gz/Sw04POEvsRZ26oHA6n4Iuu9N+nOOiF3
         SIlZPrcxe6stZPy8hQLM13aMexP38g3tN+lD3/Jkr6KT8TMnOPk4Q5YkpVhuNG+lAXWF
         2o0/sUqSKREPaZeSQzlQFRluM9pcHiMY9INDMkLD4l+dlXvd+bRkZVa8pUvMmYNRWVFJ
         I5hzTkQWHk1C5WqF8fkxQZEzlWx55tVP84LQ5OuasRT8WvQD5Q30mgOLpF0T41BMvYBr
         p8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810249; x=1776415049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cuenWBzSJmLiokbaGxbkNinIf9f1cgYhZ03f6TuoKNk=;
        b=aiqfrMzlKQt0KuXJdzrfhjzKoyvILGNO5r3KDcHv++lh64mvdbNDJ1NReny2JGPiwB
         qammoAG6fSF1Q6q1EzZ33Urite35snlAN8hOwRyIXnNTudmtOk8PtvRiTiDc06xAAVTB
         sQ4EZpxnVK6HY7o6A3aQfnm/3uuX6joOsekFCl0PojSzaZl4De5bxXHDlwKDMp5LB/0B
         4H/5koJKXl660tbSfnibI1sulXbcvEoE9OtELt213v2Mgmo9FA3O09eb2CrDUILaybUq
         2fwde90mvkj557B3wGavLqYjXKosiuCOEEAaCtufKkD6qX20vV91AGrtqHgLWElKnd8W
         9sOw==
X-Forwarded-Encrypted: i=1; AJvYcCVdIsY3fVVSQZ5toefSij4WU1Kd4UZqYlJjWQKs0MyG5KnDT5oS4aqrFQEXNmD1aKkpVrKM14wszQw7@vger.kernel.org
X-Gm-Message-State: AOJu0YyF/b+jc+FU+kOuAajoIFx+iaeH0xuvRc7Me2y++6plc2c/uu1q
	bru33/KdwBIaR9m0Hr9NJIie7z367VHE/6ccv4aiQxXQe2y6q8B1YRs4fYylZJi6ieZ/4HY05Bf
	SxT6d/d4gNowY9/ZJDZC9ZAnPRjFQu+9SjEEtv9FF/I4HaxARcJ55+fxNXakpy7R1
X-Gm-Gg: AeBDies30MTIqweypWQgUveCPV34Phkn+rHOMhbJ4enDTaYUDhbkU4GDlCQy/JOe12p
	WCtPRtS0Y7z+QlTmc8vAvbxxWgBpqUzzb9ta4u3aFf3Ur6QMsoGPsmSytTn2MbjNh5RwDIwzFDg
	fI1wYUzNLR1B1rIkP0Qo6TXncKl9HefwZrrIi+MdEnJTkI5ikYbvM7TIVZBDPEtMZkCWKMeETuy
	ltLZavxoisOJ3o//3mQ2YfP0eYsNUi1Ihcd3RqkIVVx55qk8BnklGFD2Tl/wQzgB9E9PV8BTyMY
	1zR6yNsZzPFs6hffm0w79aakdQUa12CH9CJY9Iwj4MQLsJlv/tTGkQBZw8zKenun1fPFx1m2jdX
	1wOCaPvtcI0dUpAPPfEoZUg7UTV1IOVq4YMMBo6XSn4Cnx++qiamQEa3io6BFeNSN9Drs89z1rE
	XAfnU=
X-Received: by 2002:ad4:4ee8:0:b0:89c:ed34:5653 with SMTP id 6a1803df08f44-8ac862f9d75mr20986416d6.7.1775810248748;
        Fri, 10 Apr 2026 01:37:28 -0700 (PDT)
X-Received: by 2002:ad4:4ee8:0:b0:89c:ed34:5653 with SMTP id 6a1803df08f44-8ac862f9d75mr20986256d6.7.1775810248337;
        Fri, 10 Apr 2026 01:37:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1a3bsm58706366b.62.2026.04.10.01.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:37:27 -0700 (PDT)
Message-ID: <87febe1a-a4f8-41cc-b471-23af05fddc43@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:37:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: purwa: Fix GPU IOMMU property
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-purwa-gpu-dt-fix-v1-1-4637892156cf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-purwa-gpu-dt-fix-v1-1-4637892156cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d8b6c9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=a8Rx7n6bxzFdax7iYdwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: bvnQ1Z0572mVFfm_dT7umTvAw2l5-BDx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA3OSBTYWx0ZWRfX0/qGLy4NpoMD
 CCgl0RzTjCHFgCkGmsMtY2HI16fyKDxszsxzBUo0Z+UMzZZnxwsULmicJO9K3wjrncDO5+8G7oo
 h11sdKRozdEATlElDhEoR21XZ3P7EFSfwp3IVIdekE6YPu8F4qK7DhR47W9Vo1ztHX21aQA4O89
 LI+/Fbw6ilivJwC7ORY6o+6RQbv4LYsWus05V5juZcT+w3KKrvnadXQR0bX6M9zzT9pW6ZQbBSF
 uZQRQbW+42IVHvX0XBGwQ5aUFw2GcyUZDGaSzQD5rtf/scOeZv06k2qRPn3iiifg7n16a184nKQ
 sN8kKKnKjpIysbQp4VyYT8aAOslCiO5eCfPvsH+vG2SxSHr3zd7l+CnRRmMJjDjBx82SWgXqMMY
 t3fs/zfq/cII0RLV7XCdhcOc8AdxZHIuxMtIgU0Q8WcBL2cTyJMfKFc99pVVrJGwjd31zIU3RgS
 CAZAFNwOX0I3y9qVPcw==
X-Proofpoint-GUID: bvnQ1Z0572mVFfm_dT7umTvAw2l5-BDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100079

On 4/9/26 11:08 PM, Akhil P Oommen wrote:
> Purwa's GPU does not support SID 1, which is typically used for
> LPAC-related traffic. Remove SID 1 from the GPU node's iommus property to
> accurately describe the hardware. This fixes the splat below, seen with
> some versions of Gunyah hypervisor:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
