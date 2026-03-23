Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB6F324705
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428213; cv=none; b=F9fHwFr0XATfFlotv/PYX8ofgsAz1hBTkSQO0g9f+ojnvULoRJSz2IkauoiQ5roV72QkhvsLX0a5HzLufboH2GI4JJ5ne/MvkExB1X4H84sKxfck2YKX7KfuM1ybYHqac2IQe5jHvAbC19UhstSbYxrdLXy0FRy5kkYupQLcPtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428213; c=relaxed/simple;
	bh=PfgQkrfYdPNctfp9CKFj1h1fAMaZukE9EODqpjh9ztw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obQH7nD1bwZD5t48ZzaX6qZX94Yyig/yhDv+Ba2uTo6/kHfxNmHefd3Gdb8uSzfxKFgBQsAbKnC9fK2yWKUPkKcmIj/i+cWeyFwbBkWcanoWsU0/KvFTjTLtRrkYLrG8aXRvjJ3DF9yDx+D8yFt0ePiF6j7rc+3fm7LeNQQSqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgbpngZh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWtos+Vf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgbpngZh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWtos+Vf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5A3vt2075400
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0GsGo3pNmrgcHbg82tYTMyyK1ijJTCgeoJ5nVlkwyc=; b=FgbpngZhNePEE1mG
	6wR7a95/zCq09kxUmMLjN69hzAY/+gyijgZ0dfzTG+3aAWDe/FxPYivtQ/EREVBk
	TzqCOG2t09ba/DfgKeCCy9Gez7xW1uuz/aoSdwNZUX1jFfRApg1gwIfdqitBwIvz
	vvHWKGU8+Fy/NPUsL6bKGhXgvyI0qdmGKy/YZYi6kUfPkxg7GlD9aruy3swia+6H
	CBOT7MlwP+TOXVR247OfcCsZOXWc4rY4tQpo8lfdXw2XfzrbDvzY4+9Z/tsaABo7
	u3Whepl5ry979lP0n15biBHu+7vp308XoYCRglQ3dJ6XKzxzZZI6Iz6Zf9bHTKav
	iuy62Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41412a17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 08:43:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cbcb48003so7651776d6.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 01:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774428210; x=1775033010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i0GsGo3pNmrgcHbg82tYTMyyK1ijJTCgeoJ5nVlkwyc=;
        b=dWtos+VfMQj/jbeh9CHbWXXsjXMegY6yyBeA/P4NpOMZUheN1dTw8wWMNqkvtjyG78
         q2s9yNuf1BuNdStkaoxyQq5TLHTEOY8tCC+qCq1Rz/NlyLYwTt5xJVnDAZlRUdn7WirA
         smbEdxP0fU4C6Az/ht9RyKLO9Q8t85PNfSTn6PLxo2WvNqtgb6c82wjIKDJlz+hL13dQ
         fA52wmZfU+eRQ+0cakvCMBcwRSYMwdX8lM7xMGP0U058agtuL5TneH8i1ucsFSklZl9E
         lPsDYo7+7RUrhUA++E2tRsoKmRgUM91ZhrO/9ZrNiwWVEN1ZH7u7ngotkHzDWHHHpg3e
         SwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774428210; x=1775033010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0GsGo3pNmrgcHbg82tYTMyyK1ijJTCgeoJ5nVlkwyc=;
        b=Muco8g6GWBLy86KRMQ10ADaa0ez8tKBR+g56TTIKymFAJ/8v2XlF0fDHpAqHnSUbvP
         xHCg3IejROq2xSY3P2LfXKbO8OyWO4+QSJ3qoWUsBq7zDeHk4sIbwUW2+qDhWaHLlkmr
         Fr8Sb/aA8Xj55KDYnptP6yAJK9+KbsPjSm335vw4dGWWCISafSezYtdcOu0sfMIVZTqU
         O1QYoTWcuDS+INJJloTTa1UDRI/hll7wEqcVQz2YzRxDa0ItgLxU3Op/TtsldBwL/0BF
         UFW0lZ+bYF0zddNBnGSqRS6RBHsCQX64H2iiwDCj9p4yjVEp62dMswmKAKSAdwZJo8rL
         wmZg==
X-Forwarded-Encrypted: i=1; AJvYcCWjoCmssKcl2LdG5wapzOYXCK7BZz5Fhf9El/BLPt2fY0doV+LXxBRFf43VjcAIBfSqhENIDYrVmQwe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx59JNypHuoRjnqoySFZq0356SjikkZhODKysqcndHoFfMOP59a
	Do9uMDLKPQRNS9zdL+YwAOIeH8vgfzgQI7p6rMar8/WwmoDT51p5JNw5x+einArCED8kVCcbkgL
	MUijBig8Ih/V7O6Cp79OIl9jEd9L7XRnXmBkEXW148mOx2jbKsVi5Ggbb/ebSZNKK
X-Gm-Gg: ATEYQzxtRiRvzHMTaHTT9Zqi8qMZY01wQjdYW4WCc6UffrHYTZYcos4kUyvSn/BhhDQ
	P2ZoBf5w2dgZRWYI89RSq2DIRDikOLTpc19GHdcVBMpdLAnQ30AFY784cFh5jizF0bOXSoegA+P
	6UjUj1lMy9u42Wl7Nei1IyiRJDZLXStf/dr84IloG2blT7e95/n5vSGq05k7xB7o6Mr8aItc5mi
	YjQibGMy1GeBZuhJBu7ZfFMnDvn8gTpUaYdAzMyJ+Cer2UbE0xcsC7KQOzK/gJcnbwoB4E1KYKx
	SKP0Cb8C1uD14kmQr1VE1/cjNG2qaHk+6RDwJASK9DLhzocszfk8DRl6HPFaif2qsdlqKbKge0W
	wtMRWwQsZEglrlsbZU5IaXkFkfZvj6oRztDc4doLExLjVuG4yelkFfy+2l4/SlBQ8G33Y8+TRbT
	1+1HU=
X-Received: by 2002:a05:6214:ccd:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-89cc4ba5220mr31450506d6.7.1774428210338;
        Wed, 25 Mar 2026 01:43:30 -0700 (PDT)
X-Received: by 2002:a05:6214:ccd:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-89cc4ba5220mr31450366d6.7.1774428209934;
        Wed, 25 Mar 2026 01:43:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8d3e6sm762953266b.20.2026.03.25.01.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 01:43:28 -0700 (PDT)
Message-ID: <3004a905-d454-412b-b10e-a0035c76fe01@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:43:39 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Add LPASS I2S2 pinctrl
 definitions
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260323095247.92890-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323095247.92890-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3a033 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z3ui5y-J4bSPkrMtwxMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: CsgR_RXcQZ33h7XAk3qpT7SHrimkc1Fz
X-Proofpoint-ORIG-GUID: CsgR_RXcQZ33h7XAk3qpT7SHrimkc1Fz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2MSBTYWx0ZWRfX779dBcUiNvTQ
 +mR9Ama9AmlbezGWrunsntTxjWSNKwUEQTWFuf5V+9MQthXt+cN0hWtv3ZYeq/pHROsRl+/Iw94
 hLtDzBkGfQjdNiAlTRTLdPhguZ76O0EscWv9/sOEAk+gPeyw1J3cKqs968ubUj6x0ILKsZW9yIG
 888ujOsTGITrE1LSt7NAtDl/zr8dda1cNneIGuGkQeiJQ/xiGzOttltkTIh+fPTcGTlcPak0cel
 h5If3pQ3ibNkJVlqVQMsAdq9XZpn4pNef+p7uJax5CHBM08SxFhidLO5PfRRLJKo+OMJllXmo6o
 B8+MRDyChjX8MQrJNLEzAmn5jChiIO9vJdVop/hVm6Xpi3Bpb9nlOIoqG0jRL5S7jnrXS1Ciaiq
 Gpy/DfdngJdx7ZTnIvBQesUYt0xaNr2jvq92HL2B1EOjoEQ5CQrLWDRIbtD++K2xZ9p3DP9U3ab
 hleS6KIMAJptXxHxBww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250061

On 3/23/26 10:40 AM, Val Packett wrote:
> Add the pinctrl definitions to configure gpio10-gpio13 of the lpass_tlmm
> for I2S output.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> Similar to ff9c117c32bc6ace7 which just landed, this is for the other MI2S
> interface on there. It is the Senary MI2S, so actually using it requires
> the series from [1] and then more changes on top, but I have sound working
> on my device with it, so let's get this DT chunk in first / at the same time
> as the other prereqs land as well.
> 
> [1]: https://lore.kernel.org/all/20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com/
> 
> Thanks,
> ~val

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

