Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355B031E83D
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168506; cv=none; b=fzazZEhpJ4LiVUGRsqRhZihaFnw6Q2P1DgR5rAK8ZjmF65Ef7UJ52mZBiFKzytRqPRDUjkUs8FB3XW6aYLkE6EZ/aQw9uRtdSi6nvfjAm5OgstAUSI4Au3c/Y5Peq4xm7YWn2X//wUwcMvAWZGnuYQv6wIzWFzmkyJ32q3XZYyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168506; c=relaxed/simple;
	bh=QjHIjjeoTPKm4tEtKF5NR4KQhMmUScvXbRonqJcx9PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTUhEpkKVRpKGu7gA7LQoO/ESDaaTwc8R6nZn1kB1wADBhNZAFSt1Sbo5sus28J3VYMMfzoeSBNUXz7y9rNY9c63Xc8mHwwCAl1W3laIbvSFZPylzcqf0Jq0cTpzmrGh75nRcq3ghKq1rlRmwo1Wh0VL7KZnhYXldPORNzXk4j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjbmBUGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rf8Az4oF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjbmBUGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rf8Az4oF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbXNK2443386
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/8/bogxolhpJekeg2Bw4vuv3w4EHwlCdyg+CTOZ6DpA=; b=hjbmBUGsZ0EUvL7/
	e5u0Q1621SR8kknoWNstiLgk5CLdjjyVaY4E/1dzERdpZ6Zm/6qmOISsF59P74gw
	z44LhV9UeR7rNbJnCVdkRR6xiy39Ow2UbvZM/Y91jNJF/gRjJesk5yDE0Y8sv4Vw
	cjZ38YpaiK1/zz5dwPcnRKtm3HKAWTCwb38islo7ZsTDdI4p1EFRGkQImSRTIEah
	AfsCr82pvoXhj+fINera9BZuRjQzc7z/QWK62mjsZl5VZDSXfb3iyOK43zF1YrRc
	+9ucELOMVUgK3DLzwgA8V0Q8G3uVoJPjbGy76rokz0dSIj+6lauuC+fXr3kOwsnb
	zbrMHA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7gw0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:01:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af306c795so233210a91.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168504; x=1790773304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8/bogxolhpJekeg2Bw4vuv3w4EHwlCdyg+CTOZ6DpA=;
        b=Rf8Az4oFXax0hPOK7LeI7urgEh9At29qmJEQ7Gbt1SNrBTYlPECnAGMmyjFjgebNPx
         hgLvo0uxEM+RIwua1j3mpVTv4zKJbLTSuMtewTgaH8DBqJsePN+O3M1HT1bQGO+9wNVp
         YI8bY/mSX9FGEhz3Fub5uDaD/itJ4gZkwym5zLfcRk2/FdKFM9aZ/yjW9nn8ZFlf5uwB
         CEHeoorrbRJEkPrGU1Zs//55o219KiozGYrGcX8Fp3QOwTT8nhra0N4vxvCQD23pqL9o
         k+teh9q5Vzepv2BMPl3/d88Dr64Eav+ItC1AgivCRMsTNLo70pPnDCv7KVs5hwOihYCv
         OH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168504; x=1790773304;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8/bogxolhpJekeg2Bw4vuv3w4EHwlCdyg+CTOZ6DpA=;
        b=0rFjAXqxshkyOZ0ef4iVIvbhay6cu7Zp906cMhveHHZ+HQGRxnCPu977wN+6mEttuP
         0OXLID8CsBTNxKkIyKt21Y3sk+qxg0OfePK224XQp+Ea5wImgzRYFNKdTBbp/fwuy2LP
         v2KO5F0euh18hJTntYPIwqScz+zIAc9AhF6SJtuJY6bgAredlIRQhca9mKFzaXv9whxG
         H3uulLTQ8PGTm9eKquFN5Z0fL+Wjf755tEH4TBIs47TyXqkL/V9nC2Ko41kn4hKGkoFT
         HyqhwBH532sPcvjCBmOj5FklZS1+Vu5q/cg8lxxwE+ldkVF7GaL3nYsSzIYZKRS4Ly1B
         iUUA==
X-Forwarded-Encrypted: i=1; AKwUvBwfaTz1Yx1o+mf1LCJxc168AOAwwP6rQAAGUqrbNoD2nyv0ECwMByfcqhsYYv4NAZhWgvMHc4uWB4Ys@vger.kernel.org
X-Gm-Message-State: AFuF++ktwrVsXCLmZ4mVYjEAB7TES+JXkFdQhB7R5Y332a7HxhIHOibl
	7+W2SntwGYz0AzYFuEu76gItqXTpd4q1V4OcbrPaQe8FJ0rTDJqLuu2AFTusrrpKFxeFoVPXvCP
	XftOE+bRBWXpBo0hU0w1XpR13U2viYjfGoo/zMw7lZHeWhznxmAIcQ3ghagt6ZV4l
X-Gm-Gg: AYBFou0CHWyewcciLVEnS29celf1RWyMKhZHbP25teq+ZedRD7TrQSwvMl5E9dxH2Yx
	J6qMOOspN8io8psZX/+CuN/6tPVQWuGCEGZxdxgfCvjUGE4lIJvowfS0L9CNJhllW2CbGmeIbKC
	Inlc3xCSzM4FGiIeDIrhOUyKOclXx+U3NC1G7JcI+akKYYtq5UqBRFISxZTgsFk7NZAGEWxzTDj
	AYdrh2nK9mMka/Ukkkh6WmmfiOMT4C1KrSv31Q+OziFPwh+LALsdq9187JtBKgqDlknPZbJyiSi
	twv1Oe0DsKZ0vlV2M77enS+xPvxWegHSQG6/FY/sz4FWfEP6glGh67IxuhJwbKrc0x7AebYEFLa
	33ArpdzFibMPTNpnkh7nEQw==
X-Received: by 2002:a17:90b:448e:b0:3a0:60c0:7f8f with SMTP id 98e67ed59e1d1-3a07e2f68c2mr3690112a91.0.1790168503728;
        Wed, 23 Sep 2026 06:01:43 -0700 (PDT)
X-Received: by 2002:a17:90b:448e:b0:3a0:60c0:7f8f with SMTP id 98e67ed59e1d1-3a07e2f68c2mr3690028a91.0.1790168502900;
        Wed, 23 Sep 2026 06:01:42 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37eab45sm1650695a12.2.2026.09.23.06.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:01:41 -0700 (PDT)
Message-ID: <dde35cf7-10c8-4e92-b956-bc920c9cc5dd@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:01:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PRELIMINARY 4/5] arm64: dts: qcom: shikra-cqs-evk: enable
 the first Ethernet port
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
 <20260908-shikra_ethernet_dts-v1-4-69c0c5c7c124@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-4-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QAEguubw7KX2kYnv1Kgf9FCGnFXNGqPx
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3cdb8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YB9oFmEO9Py7Eu-ErZAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX4YqyvwOCP4du
 3eKa+9eZ2aiiPo9gO7zXpiqT1KrIMyu3DeVXspFjsDN5AR1uMcT00iXLA1fNby2xSdvGEUQMfcc
 buTyyqXjm6P4URCZAyhPfWBS2dbOyqBHtYtKawfNsytCF3VfQgzo5fSYXRPGpWaKR7viQpwlKM0
 kgxeOE+N1HQnnBDGRF0nTKJZrcUCXam+1CGEJEnogniqGCFqDDB9LNILxUxg9Enm/XPDOHD8WW0
 u9lSYkS4aHdVknUkvYzi3FsZL+Z89JAdUUTh4hvZz/MjUrYUL6b9Gjs7EA55n45l2gQzN817CYP
 FK7DqDTJK4xR3kOQ7NmwibTdpobQFYUx205yvE+BXjaMECOZYQ4iDAxpoepYW4AbrphsrsEafA7
 OFIHi4c+z+7aYBGe5CRyoBJvBczuKJleFpPtLlU2XlmlOEen9ocon7w/Kv3sfr/iahYxOi/+f3e
 u9NWDyR590dIw19Dw4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX/BMfbnmDtbf+
 ZJ0FlWzAj3NdMNTUNeH8+YLuDqXjy9lR+QP7kfMOZAiQnI3aBCIy64dJHQLWN7eCaIEQSTh9qCp
 0zW2K0wY3AjuXVHmqA28sVk7CZKXk2Y=
X-Proofpoint-GUID: QAEguubw7KX2kYnv1Kgf9FCGnFXNGqPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051

On 9/8/26 8:23 AM, Mohd Ayaan Anwar wrote:
> Enable ethernet0 for the Shikra CQS EVK board with its DP83867 RGMII
> PHY. The PHY is powered on using a GPIO-controlled 2.5V regulator.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

[...]

> +&tlmm {
> +	rgmii_phy_pwr_default: rgmii-phy-pwr-default-state {
> +		pins = "gpio149";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

same here

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
