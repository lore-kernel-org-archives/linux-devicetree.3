Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C67153ECE4
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952785; cv=none; b=MWxB+Ick8Of+aWnO52H3fSN8HmvdiK8fNZgvmi2uwvZlUtfsUVpTwfrtIIGPmMGKCvfovxzJ/JcBnI9btbUwdPFv2ldkCsfuE/LZzucT3mvV3mimoOKRkYgQYsh1hQPKswwfriw4gzslaloH4xb/UuZilXIXPo+QPKAn60FvlL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952785; c=relaxed/simple;
	bh=eETRbzMJn8kFrHdjkPv75pWI84ym/O2XGiAGVOJ3dmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvzsr6hsj0zjyuiUyjW94//ryum30uUs9HTY3capEHMRcnfSxyZNfSXna20sJ3vSewED8HmPFIWQqbLE5xhBVtTiVXGaerJZHZLgPWEierXWmyL8Kzp1E77rn4xOFw185nYxVr6RFS8Y3OoKdkjB9SqU9hfNgBXnJzrIbpZaHao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCtARrMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGfJc4xc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCtARrMh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGfJc4xc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Ar1JB2294510
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 11:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dwNPyXHU4JEuyCFbr1xwWa+OLlqFRb6m/XYayok10vU=; b=gCtARrMhA9M3dbNB
	vhDMIGhuwVkijNSSrJUZtxtvz9cUrHiyRlvO+Pett2QQuwSv90RltunwSYAR2QhF
	bBhWkKcxK/7XF6p9Z4NTkGhRJuYe/KJnq7uRc6xESK9g8/Qvz7OD5EwgdwqJpWe4
	+Mmf7cywTg4mMMTs/fO2bJKeNhh+A9MBpu4o4V8rBzK2NXOgizPriljKWAHNP9Ao
	NoiUZ/dwYFPyBuyY6q0ge++NXWOUikLQ0vJI4zELg0sv9EKkw32TCd8dUvIwvDww
	grDsZs8/rh64C6kpoyU6YXpDVyEL9lSww6KeExHZvb9Ans/YLj6FOWkNz5TZD3w6
	TksE9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru05wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 11:19:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so112613785a.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788952777; x=1789557577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwNPyXHU4JEuyCFbr1xwWa+OLlqFRb6m/XYayok10vU=;
        b=ZGfJc4xcRilZumF0D2Ktsqc/HJqvRFETryG9oA35bAKcTRrZFRjaGyUzD/59ZP3heN
         FPfjGY+HQ8MwdnhPq5hcsjMODNzxoDKzOgx9rtIyvvCnYw9dCabt+jlm7HNZG7VrjPZT
         GNQ1Ngb//nNySpBLRnsm2lrNaWFA+lNc0dp8FlidEm8bGoi/K0QH/l8EAy9I0XYO8aFM
         GrcjapoVadvqP/GT2LvVdISru//Oou0K4cmpIdJNZXNMUWpH36fyQHHiCpgZn6WE9QaO
         7dhy8y9VB1vPw9LnaCn/dam/BK4DrA30Gp0qgOxDdtNBfUkJ6ydNvuDkDIGvPZHN8GUo
         0rXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952777; x=1789557577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwNPyXHU4JEuyCFbr1xwWa+OLlqFRb6m/XYayok10vU=;
        b=ZxBMiK89am1AvRqIahojnGAyyJJP/kE9+dBHdPhozwuWxKHRnd6daSXSpG6+KFfpZq
         8fMp0Y9seEul5o6K/ka+/gS1hUztFkNXngN4uuvqImr5hORIoOM4N7q0y2xtLPo2MjDR
         +N9qiIjoji980SjgKg9vMKAhzaurxcS/j/p+Rcw5jPnmLFj47BRRdvK/N3HrxR7YLvkB
         WcNRgv5POpewSwDUJiEkpcKDIwbXkZMzVr0ONJXmQHpSZTfDoHdpXIzmDfZzQhXFxMKh
         iPmVoViSGNr0hnSPiPnFnEdN7Us/lQuEYt95fDx0N73s70magKMSOhB1g1bOLY71OJie
         nIGw==
X-Forwarded-Encrypted: i=1; AKwUvBzezCYMbYfv8Nn8GNVYw77uATrUXPelwjXFsGyQ/gJAD2BmOgurr/UYKG79JVnXj+XcH2tCSO/RtRP5@vger.kernel.org
X-Gm-Message-State: AFuF++nLTSsisjnoiDXGeGAaTVkPJ0C+ZqHlbxA7HYp80TUjNjwTUdto
	hdW6PVQTMNU3KELSMAk9zjN66RGyMGOXdGqF/q1I9p0DFsHMp3l6xT7f3dVZ7nRVBKzxP3qHfjq
	s3j82I6fUwqLyZ0ia30+C+m/D+Lwroi1DsMs0D+H31fEjeNEUFPy1My9ON4/Sh8du
X-Gm-Gg: AYBFou1qSlTh7trgkCvWZoJp1hq8laEpfvUULXvOrqExkxHYVH6Cbjkws/qAclivKID
	6XzFHZl/SZXVHAHxC28tDc2V99ndk8JJMuKJfRNipE/h0p8Ztdw+XE+m/Qg73DsisBBhy6IijgY
	1asRnOH/xyLyu95MfvbwYIVWs4xur2pb5vpiyc51QSVd6SGIucTswbg/d7bkin9NpeMfs5jKcEH
	bv+j9nZYw6zojPCnh3CGDHxYFaaoGGe1VaPta+NelFdMK90CJCBgWCIAdK/DvP9McCZzqDyDyUV
	fmoKZewrQ+c9MVjcyDjhTh/A23TOTke0cXgvosNfsm6vrN+0hJxYDTNOxagNSK9hUsM/Rpt5Cv2
	ui5kjPuSAACxn43POHlXxiw==
X-Received: by 2002:a05:620a:1723:b0:939:288a:8a30 with SMTP id af79cd13be357-93980cc6996mr3076521185a.6.1788952777424;
        Wed, 09 Sep 2026 04:19:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1723:b0:939:288a:8a30 with SMTP id af79cd13be357-93980cc6996mr3076515785a.6.1788952776923;
        Wed, 09 Sep 2026 04:19:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9857ce120sm1367440a12.4.2026.09.09.04.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:19:35 -0700 (PDT)
Message-ID: <5c4258be-27eb-465c-b6c4-a0826904e48c@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:19:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PRELIMINARY 1/5] arm64: dts: qcom: shikra-iqs-som: fix
 GPIO138 reservation
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa140ca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Fd7G5nQXjrtoiyqt_gIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: L_dhOcrMh5hf6kfp-bokEUOZG0Tn2MvD
X-Proofpoint-ORIG-GUID: L_dhOcrMh5hf6kfp-bokEUOZG0Tn2MvD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyNiBTYWx0ZWRfXwLA/KcJkUHXd
 ckYB+CVfH1Izip0hlGLySHzRZ7ttVZx21j1DcV9NH3NOEfIEUJmF5Z27A91Cni9ej73xqkM1jTy
 akUaM7P/Q7ddcSbwhKkuEZxVjnUMieA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyNiBTYWx0ZWRfX+KAH+QXRi2qG
 k+xgHAp9Duu8NJywDReYVg09hEQILg0A/KSAtCa/vMrCrGlPPAvH+xoHvc68KhDuOF7Vbb2lXe4
 di1H2g+GjkzrKhr/O9FUF3J74PzCk7VRW65OcRdaAhi92zmgALTgoYv7ZlAgdtG3E5TX/iRNsVt
 n9UdNWiZkXMtrjGSHLY34OCYEClgY1kme/v5Ph0kyAY9Mwk0ST4XHJ6fUAnOssyZrk5zz2W/DYD
 ZUK30Kf/LlDc2hgZW78L7vWmR40/Ll/WyoLIZrBValTaUgxD0jmbbpJYE8XKFCujaoXSGIIjUQz
 odtb9PnRIU1XsLy2GM391qCC3kGV5ckaWD1GXqbRiuNjNfy37j9N6vFyc9qclNY2DMSUQ/Dnqqe
 vLXPp6+ol5rQ7T0HNL8JY8hzYN+G0yr0B8FbGbwdk07l7MmJAmcCvOboro9mBBNxgtWiDeEAICE
 F+iUtIyK4v5um6W59/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090126

On 9/8/26 8:23 AM, Mohd Ayaan Anwar wrote:
> The GPIO mappings on the IQS variant differ from the CQ variants.
> GPIO138 is connected to the RGMII1_RX_CTL pin rather than the NFC ESE
> Secure IO pin; the latter is connected to GPIO49. This incorrect
> reservation causes the probe of the second Ethernet port to fail:
> 
>   shikra-tlmm 500000.pinctrl: error -EINVAL: pin-138 (5d20000.ethernet)
>   shikra-tlmm 500000.pinctrl: error -EINVAL: could not request pin 138
>   (GPIO_138) from group gpio138 on device 500000.pinctrl
>   qcom-ethqos 5d20000.ethernet: Error applying setting, reverse things back
> 
> Replace gpio138 with gpio49 in the reserved list.
> 
> Fixes: 779aead2dace ("arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
