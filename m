Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EE5175A7E
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711727; cv=none; b=qUzbggxl2PuLK0gmwkiJuLzZLaAG/RY6j4LpyCtUVdegOOvT6gKcf7NjyqI6bziNGz2aC1Js4R5nPfu4T9qZ41u1qPACSKAMRIXbkSAgXlf2Dx2dAC/jcPyoCCSc7DqZMRMERzlqiUTglPQs0KrzvRBnfZut9SE7GU59Ng4Feg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711727; c=relaxed/simple;
	bh=2btaEAsFIeOo4Dk/9XtErvOk/K+pyuYcCLZyVtuxDsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ik7k56SGr+A+01ioewoq3CQ5Vz6ED4iBT9VCP2TZeFN7RPgD+WqmQgqUpiED+GmkL3rKHpubyjJ6EvMZlFajrfLjeiIDzmGiUT5JRtJHg84WYglg6IYgF+mtBBG+q7ghBtlDJShV3BYvGkEeFsLdimgtWsYu70jUTxYQvWntYAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4yopz51; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZWtqNJI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4yopz51";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZWtqNJI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7QoQD3064409
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zaHC1P6aJTyMS1Le9joMlhJCuWTFxPQ+6C1FAgEu8aM=; b=A4yopz51ba7eIhUh
	+zlCY2Fd3QHnGDMa8jD6QDcyTgmmPXGhjIOPBjQKjbIL0BJI6YC6Qc32NcSIS9KI
	5BZflMKAgN76ePJ/RXH33YWiTh2b6k7xGhkD8EDgVila4miqmHIaqm/BFlVkOJNH
	LGRQHmwNotcy1+cZK5apMXSO6LEuMem43wO6rUsDFgESAdX7DhrHoAQoWsmMzoad
	1FBrdPjlV0rjrxdHEPaSlKW3aGfSD9DYyjwXDn7cBVqHx3OckuxhYh097K1c91d2
	ut9AOnoUN6TdLX9M9J4q0NqJ1ef5AXgVwMh2d1wEoIvdBbNsI/2kyLfkrXyzviI5
	7wR1UQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecj1gh1y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 12:22:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faec938fcso23343521cf.3
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 05:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779711723; x=1780316523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zaHC1P6aJTyMS1Le9joMlhJCuWTFxPQ+6C1FAgEu8aM=;
        b=jZWtqNJIy0y9UrG/msCNbVjnkLsIvJWR0tF5dW6BqGru+9Xi4gHjXZbxeZAq0+n3Dr
         bjpdqHJWUm30bC0C6nRs958wtAAB9Ho9+wa4ZAcv/lF7Yfu4X/Cg0p7i/+a60hQIiZEp
         p/jObsqxkn9otynVVyUx+PT4c+GyySsulBoe9/QsraVvgMwUy9zb009xlXG0eVdIQ0hf
         R47AwMwCFcUxWqJUCSoNxcscLK89N6ECJ9nZYtYUs4kAx/RkANwsubnRC4Bv5YDFsKpP
         TsSyMB+OSYXB8Y9j5uOQUs1Yi44YaWRTNt4lWaaMbJCpEHR44RQV/guDNHzEC6LcBV9V
         B90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779711723; x=1780316523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zaHC1P6aJTyMS1Le9joMlhJCuWTFxPQ+6C1FAgEu8aM=;
        b=rJc7jEX++cbCG6ksK7kzT7MULwwkGLa+eTWCbbkWHxzrYgL/ZeHYGlxaQ/h4sZN75Q
         GmcTmlZ2BbCjHrDhR+KJcz/iF0A330nonJdWt6Up5h4ENsdSlgponRcgOzHmyZvTdo9X
         TyH3HAMqfPOz1zFOoYJl2Y5cZhgeUS3//pP0okXJqQ2+Y3OL4Vw++XkJZWMMNA8ZvjFl
         wRAYcl6KwJ329VR1A+1cuDXCRKknp35aIzPJIJ6M5lNV3RBOQXAu4NJT/Skd3eISrEY0
         9AxgsfcecXneJXVX78ydMJ5FWNgxGnxO3MyMMkV780ErVt5Kwll7JMM/CyryUcbDxCQk
         FFsg==
X-Forwarded-Encrypted: i=1; AFNElJ/Aong8zbKmO1IOyn3qDZezOsLKhoCWglNmDmbcSwfzs0+B8lnHWyQL4Vvpgu7UFeHuYeFgE91cUtvY@vger.kernel.org
X-Gm-Message-State: AOJu0YyFnnGchmbSncB+iN+AUSfHJkM0h1KChNA8lXQeKOLe88YDbOwI
	XpwDeuRv9dwnvi+/FRCEfLVzPL20Tk/NxBH8Ha/WinVjWoXlOW9wzS63mzpl0QTYj/qSthNTeJz
	YqxlJXTYI9lGi8M+eAU4r6AtKsNAKoupw1x32KSyXmyc0PTFv3UoVc8szwOg3OoBQ
X-Gm-Gg: Acq92OH5FrkP3JoDyRuXaRxJKZ6/aUYm1720jrNrROqiHqk3fD2RfJyeJZOo6cR83AP
	f7G7ZH+eLqxIn3zWlpIBboLDndQ9Hu3mxpGne7er80PmOWvXDNAy/JmlndzEeEl6O1Fl6Ntlh6k
	n53qDR1i2ckDAgUX6TQKcWPf3ybc+IdTx94PRlM4KZ1Jqr/ZyV7zqTH8pPFpLLKGVKLq0s9DvWH
	j5vTa8RiWxIGpc1nQtbu8kwxK101yXICULSPWDBTHrGC6YxuUwILImoCAoRDorAYF2ZOuZzoU9W
	eakIRkdnLHoZIQhIMFjHGEF039/2IyLWS8B0cVuDUj9s3h/A8+o6NXqc9Ms6jzk9zHfNz6H5MEi
	qnZCQmE9PvtjUqucgXnycgbWPgrsUi7PhdGaREWhCoZrEfA==
X-Received: by 2002:a05:622a:17c7:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-516d43c245emr153486391cf.7.1779711723162;
        Mon, 25 May 2026 05:22:03 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-516d43c245emr153486101cf.7.1779711722779;
        Mon, 25 May 2026 05:22:02 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5eced0asm396478166b.39.2026.05.25.05.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:22:01 -0700 (PDT)
Message-ID: <73e7ea01-d0d4-4ea2-8157-f2f699d64c4d@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:21:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: Add EPSS L3 scaling support for
 Shikra SoC
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com>
 <20260524-shikra_epss_l3-v1-2-b1528a436134@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260524-shikra_epss_l3-v1-2-b1528a436134@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WNb4eZWzv_bwVE5qZUvY-dy4FC0Nq_Nm
X-Proofpoint-GUID: WNb4eZWzv_bwVE5qZUvY-dy4FC0Nq_Nm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEyNyBTYWx0ZWRfXwYAS9J2WOEN4
 hPs0E4Dp7918MlrzhvQFTgLeaQii1hyxFx6uyETQQ4RJ+elKRRdWLBSr/WFo/YwukG/7pjiAZ1a
 aJN7bobkJxf4l3WBD/8JiR3DnHTNMYmsfhSQBSsB8SYk+1w43HAaqjxHavX+66FpYHshLCuunYR
 ZtaBObFj6zZJoTC4XbIrGy+lebqeXysNXU0EcapA08ldtTryv3JEH7ymL6/f58X7izoNETdhw3F
 HKhAAzXQrhIuEyStHEI8Noe8fyUKVKW/hXuHjv5VOTam6wxuOPhTSwUHJzas025EGHBaBSwl0ks
 yDsfXwsl20PIyV/lV+mh9hhebaNfvHn0mGfFb/xsF4YpG1BW3yizO337nYgVt+dihSIFPJ5yu2c
 V2l5Xn8liawVS6bF8uexbXyr95fsZsOYykPglIl2xZqUM52E2gdwQUXIjrx5wVGb4M+XXgD6ETC
 KWooBZHkOmIQeHTHKWQ==
X-Authority-Analysis: v=2.4 cv=D8F37PRj c=1 sm=1 tr=0 ts=6a143eeb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=AL6Zp-OlWJ-5pd4xuMwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250127

On 5/24/26 8:03 PM, Raviteja Laggyshetty wrote:
> Add Epoch Subsystem (EPSS) L3 interconnect provider support on
> Qualcomm Shikra SoC.
> 
> The EPSS L3 block on Shikra SoC is similar to existing Qualcomm EPSS/OSM
> L3 providers, but supports only up to 12 frequency lookup table entries.
> Reading beyond the supported LUT entries can expose incorrect frequencies.
> Add shikra-specific EPSS descriptor shikra_epss_l3_perf_state that reuses
> existing EPSS configuration with appropriate LUT entries limit.
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
