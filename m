Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871E643B3C4
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344435; cv=none; b=EnXjxiBqhGXxBmNS334eJx4HtqteodIz2dYx4b1dDphw9c2YpJT8VOg1AoKHPGyjHR8F0E+MRW9Q44XKA/e9RCgksE6QOqomaKAV19XIOW3eVy2xj71iPTU9Em+aCZ9QtNxt3f4Moek+t3bGaLKEKInJmsFLn6RbFJ5Co6p8BdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344435; c=relaxed/simple;
	bh=Gl/eblPX1ENd7RHGdBYgjQjGQ4WWSbsmq2Tw0xLJNTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2X0u5h95ssCK2Qn8iQUecp8gaSe/p7xPrUmhCleqIzwSFdBTF8lGYrwYo64cnvOMAUgIbX0pq+4rni7ZwcxpdavNrRR+Q2A+sCeAOAkLEZfoZVXxLn8jN/isno7Vn2dYjnkUE4i60FHizNK1HyFQGxiYprT85zWKT8yFLuTeyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juTrCFiW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4Jv592/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juTrCFiW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U4Jv592/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829N8iN2246232
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 10:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UatKS6EJFQUBnBNuylWYQ1B7yyNJd+dkywKevNEdSaE=; b=juTrCFiWv533CV0a
	wablqA4MrIxCGKL23hrdzsX9xiB8W+QgWZ0dU5rC5W11cZByjSnLt9jemqEaSomW
	dzS7vy8Qi6KmeBbsC5pZL+eGF1GFgZ2G26U1JBzARbMzRGtmrq7eV9//gkW2V2k0
	JV/me8DXtmmAUNQ3Ex0aC7w9wo3CvKhu4+iM8dxrfjTu2QQGInO59W5cHaPqdpuy
	FAGrZG2Ljz8FRD6wx4f6/PYzlZ2RrnuTYwnBvxo86oW8UEfuJx7XWgZZu2jqv4h4
	gR29ByVgxNdRIv3f9X7NcnXO3TJu/7naa1cpO9WpdjdSsqB2FHFwY0C/Yx89ceic
	KTQo+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whj1an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 10:20:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e661ce1dcso22711085a.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344431; x=1788949231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UatKS6EJFQUBnBNuylWYQ1B7yyNJd+dkywKevNEdSaE=;
        b=U4Jv592/iQrt8ZFhg2VQaEoglTAbi53a58alh2rEB0+g08rohUFvzgR2bvnoTTH4+Q
         1KQZaDeirvh2tgX/NE3rkXSzKykSqT6Fk0+EGW33D8cjy3iTRuRM/EdvJAulsjkNDRnb
         z6e/dqwOB24MNRhBVMCrEXgBJSu6pX+fhWwKQG4ABe9Dpz8WkueaKSXJtfbywbZIkgZH
         /o8tKYhAV+I06k3T3UfHJwOOWfoEYY4ljZJlDgqJ+R774YLn7gU/a0rApvClhPYAwGg5
         Vcga9pLYcuLjAgzA/7Ref5jDYG6woiCaMGRKUQyp5ohyuExSWAjJb3qkfv5DKYzfLTNo
         Fs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344431; x=1788949231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UatKS6EJFQUBnBNuylWYQ1B7yyNJd+dkywKevNEdSaE=;
        b=SqX0X1w3gs0nrFvlrYbEparFU3BJsIB9UyWeDGIYm+YVg6Ppgj9zP67Mp2pqFRW2rD
         iOQts95SUYqWR0P0awCS6zXVgYLLf3IMyt3Ss8w5JyxdvEurJgY5ArgC6gfE3GJ91RzE
         yqHD3BdVVrh0rFFgIiIzJdnqyeNidxiEl8ekJvmif3GsM4JYc6z/FMEruNX1Lzpwhh+Q
         bU18i/9ex0e8v9CKe+l8kPDG4oXzqD8rfTIhizrWMGBt4AaesNWrMml3rZEqHW/AeFzM
         +aZAXe47BKmbh/AcKIwU7NA2UPpqnmkfSIMIX+74E7l8bGZiePrQicdMWkOOUutT3nW0
         IWZg==
X-Forwarded-Encrypted: i=1; AHgh+Rqm1hAiP6sKfgcayPsiMAjN1vHK+5OFCyvZ1vsp+zcXRcoul7PFQrDytOiEIeAIIxKCqVj4SbSnLeDb@vger.kernel.org
X-Gm-Message-State: AFuF++nDL4DGKUVj5bIM3z0QR4RqJkRtmVFiPzhcTFuuMInD7JMtLn/e
	w5NdnrgwvSefPdhDnrhJxz6gQks4wE999BJ9jSQPki+wkh5v4HEHeIH3oJPFWg71i2Bp2tR4M57
	XOsjojRjjw3GeLS9vTTWOcY1v7D+RIrQC/4CFaJafewZvXprRHTSVBVqgq5ZM1+Om
X-Gm-Gg: AR+sD133P3O9kBeWg8J/KXP6iP9l2jI7Ar7IcPSvGn6ZnGMca3r6hTYmE6f9QoH8ovN
	v5zcSm0aks+9vzYRb9/12zL02x2Vyi0GNp2KXRrn8bs1zQxSW3XKse7kqPmkeTk6DcI7tTMEjQz
	Dg2xqWnt8zfwHPee3W0epC4B9ghPrSI8zl/R3d2ihpwCzkPXH5zqsA9dNQ4+tEcCFR+b4rLjGtx
	RrIGvcfdJtv4U8fT+25HlmxT5/LmTWZlQ0kXaA7Qcp6jglnO3LldLi6ajtMmsWlNMKAqavyMTe+
	RXE21Pch8gp75qJKlpLXt4jGdz0sOorVBQTT8NPgv4SKRjmWok+M+uDuhIIS3BsqbC75nCoJIE6
	CZcQu7uC2rXNgKz26cWhrTg==
X-Received: by 2002:a05:620a:4387:b0:939:5fd6:9382 with SMTP id af79cd13be357-93960ccbe4bmr256807285a.1.1788344431402;
        Wed, 02 Sep 2026 03:20:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4387:b0:939:5fd6:9382 with SMTP id af79cd13be357-93960ccbe4bmr256775285a.1.1788344426102;
        Wed, 02 Sep 2026 03:20:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9423f5sm812539a12.22.2026.09.02.03.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:20:25 -0700 (PDT)
Message-ID: <5492ecfe-3c3b-4bc0-ae28-1eab79f6936c@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:20:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Talos Lyra EVK board
To: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-3-e3a76dc9e21c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-lyra_upstreaming-v1-3-e3a76dc9e21c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a97f870 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=xvvC8mGeTzBMa8I3sMMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: AbFUzWBtm7CQyndkcImVX6v9ZnenTIM5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfX1w7ccXD+Elkq
 ylx+o6/DwBq8HzgzgbUr9P3AEkDrde9VUutxZFXEDug7gzZaWs8fejmUKk5kV0X/+fYAAeSV8YW
 DlBNSkx4Xfi6qqfj9kkkWmLnvNdJkkVC5g+4UhTbMAMUwQ9r1TPvxNYd0KEpI1inOIlKwdKdyEK
 MsPf8SXc2lao8Nm64MrRnANtDlqNQRnnChZzyjMie7q/IXWT4g5k7m9QQuW4o0Y/0xVxQIOfqDc
 k+koE5NTxrA92y0Y6VMXm5JEduXEpZA//5GnT7LFLau/FLlwS/59YHfyUYuYIbrgnHKseKkjh5Z
 SXNA+k4D6yuk5baT46IHUCC0woF+TIcqJ3ekHUEOTm1Ag9R+gxm9XospjLQCGwFWJkuWtMdA7Uf
 1UJYtuAvJe00r+5garz2e3u8jTOhiKkj7ap3xu1fBNWmfPwMeR5aiumjsQY3gC0Mk0sfcuec3Xb
 nDVS0eK5ogUA7J5RPmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfX1f8e5abEg/po
 2jNCEwJsuthGjxmzEKJmVLhLf/+t4Cn6RUw+FY0OOUxRfPjHP23wHaJ+Srp5uAWCWDJHIs3bpBY
 y9DUnFCWY/QYo9a1m2kZ3R9E0ZtT59k=
X-Proofpoint-GUID: AbFUzWBtm7CQyndkcImVX6v9ZnenTIM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020090

On 9/1/26 3:44 PM, Avaneesh Kumar Dwivedi wrote:
> Add the device tree for the Talos Lyra EVK platform which combines
> the Talos Lyra EVK SoM and Lyra carrier board.
> 
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:

[...]

> +&i2c5 {
> +	clock-frequency = <100000>;
> +	status = "okay";

nit: Let's keep a \n before 'status' consistently

Konrad
