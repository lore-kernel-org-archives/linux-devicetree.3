Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C901389DE8
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862365; cv=none; b=h3yjOdfXr18iTqR6Z94OuIwdlUYx169QGm747KlmNgncy2ikQF1WT3JjndXiCP/I7L0AaM2GR56GzZJFjTzuEnvfvo2yM3hjtx33p+Ra5MaANXYgA3H4W9dkmzJePSfbCKKEcuFm+W5v3W2r0L/UNViwdQEnEGOpEmmqr52LhTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862365; c=relaxed/simple;
	bh=CGMhqz4WMEHh/H0EyNeol4hXDWErazxDGYolq4l4d6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOzwI2yZy2Re2zDSFBlfq1afPUOWZ8usWjV9n0oh9Gwp+NMFXU3IqYsOZAvY1kt98qAJfUpN2fQwgxkubzQCwzJnDD276E7mfYVRJ295F2pf0t5eGtXGcUD70tFTsgJn8pH9buekVbPb78bKlifRmEdKLOcX8D73d+83xpvjUw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSEPAWxn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATSOXP8a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSEPAWxn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ATSOXP8a"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6VlZd605127
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dVpq79/2Mp4ZTAXSmIvqoHbQFeBJxMYGu/6xI48YL0=; b=cSEPAWxnxvwpCooG
	r1/J2gx8B6vgVk56R/UVqi8Xjgb1UaDEQzANIrYq0hq8QnFcAQJkrvDgDL206Z29
	SrDrgf241VHKNZf23sv4d5c2BPYmltSSeWp0m9kE0gvZt2JU76dcfLlyHKLvNzz7
	EFajnarq4EESiRHmYgKFXICJGDhD55tLwSQi9nMQs0NFvg8oJkaX7mr91O/CAdm3
	kFhNmkFkzJRIMERJPu99sgkBE04QLjrEhiLNYklE8wg5xmbf7dwhM7KJvn/p84v4
	IUdzpE3cBGNs4LcyssJvVh/tf9+DpPZTDn2WIvioKlRD0im3NdiifbsOsJhJa+Ow
	KZiFhg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm5vbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:19:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cbcb48003so19337776d6.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774862363; x=1775467163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dVpq79/2Mp4ZTAXSmIvqoHbQFeBJxMYGu/6xI48YL0=;
        b=ATSOXP8a6yhtj11i1IH+ag3UmNfWsiCRaJhqSis9vQQ7teCjUcgNMBfgEVS1Xq0o2h
         qagv3U+naBeoGmuSVp9T9761hmw1qLbFdlwJWna4Itw1AFFQMRDAkMY9e8vyVHsfDQyj
         VejCk6OFkvj8BDs6ke+lGwfEEKRj2QdUZwB2xPoT0X8H9bHRdtSB2mMk6Fdp5rmGG3ok
         sdUJIBOji/0k3cE5M0ZUDKAbyOemJRSMdmz/xcprrcpPcGuG7RgPYfO0LIqZA1jnY2hR
         zhMJHMmyyiullAp7ZmaIHd1zqCzjz1HudirC9xbCBHXOaETTyHZ7uUiymPa5Hn++bwL0
         C3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862363; x=1775467163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dVpq79/2Mp4ZTAXSmIvqoHbQFeBJxMYGu/6xI48YL0=;
        b=CXlJ9igxRP/IQIWccL5pF3LON9JHSG4TPwslLbJCo8NpopnkhZsHrKp1fmhZCmqVeD
         i4fEFpzUNwS+DbfRgvFaTZSryn0d4c5b6vb/5SgoXogfC0KmiC60pTqTNSVuoja8cNIU
         ZPzN9S/e9ZZbfVSquEbGGAbQdny2Z0GspTGjrQq9NxfcwfZSadRcaNKFLC8a3ZnP/lC1
         qAT5FcxgcomheyM9FdIjSZ31D8uFzfWOpYb/fNg1mL5N8qSJzo9Vt6Cqp68w/UAPrvaf
         AsPtp1Jdc8pkEoeo1UEWMUD3B/HLnmqQFXofnir7dxkfiJHLTvT2pMTATPzkXMog+EMn
         4I5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLzrhYr8lZN29U+B/61wKc5rAmBYUfxkxO6XbUDdGQeoIw0XVGxSzi9g1ihaHsVjjmt3DoBaDLkE2p@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkarBIMSQ8AwOs3OLC5f7tzBn7nYOkdzrHrSlhskxNluFpTrM
	rlRWCWysk2eGTWQIJI7pGf4WifgvY+A15i/1WEBKjbx/TwrgDkt5moQ0DW1q7h49pO/3ZzPo1Jc
	m2yGYcwuSUvy5YRKqFSmCAw8s6th9n1fg4Seai8g4x6neriDcTLQNlN5O1UCjY/KU
X-Gm-Gg: ATEYQzwLgX4xna2UFXsUKQ1aPj21f882KW/ie25hqSZMyOo5oS992Hnd5iygJ4QMGmY
	fmPMyf7IQWE+oKFOlGUQSgAH8HeFTLseAmnLbP4pvhkjrPsbickuTRBrc8a9B3BZuBDtlxzXYOr
	oMyBRXL18U8XfiQcOV18XBs9atutHCckPIWb959pzrM9krnuTHkQi9uIWrV9FEA4fumCpHc3xw5
	IlDJjR1VmaHGfzE6tDFwfXBPGW3nROzmKMqK0N9+RG89Q2ORxZOOwUkMzQQaBgT5k2Y/rbeNqa1
	JjCsdJgRPgkc4a6dj4D8A2vgn0S93q3RPox3Clom6Ak3BBQI/2068llnJ/gB7ntoSHmED8LqU1E
	09x44kbbPCZl8Nb5Md3KTVaNH3AkdWx14Wo9UXlRMGfDdjQO15Aov60S2AV6H3TJdHWFABTIKtn
	u9WE4=
X-Received: by 2002:ac8:7d0d:0:b0:509:d76:fe73 with SMTP id d75a77b69052e-50ba3858beamr122747281cf.3.1774862362923;
        Mon, 30 Mar 2026 02:19:22 -0700 (PDT)
X-Received: by 2002:ac8:7d0d:0:b0:509:d76:fe73 with SMTP id d75a77b69052e-50ba3858beamr122746961cf.3.1774862362413;
        Mon, 30 Mar 2026 02:19:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae52295sm263765366b.24.2026.03.30.02.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:19:21 -0700 (PDT)
Message-ID: <c2900de4-6dad-4822-9fd1-57721f7f8f14@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:19:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SkjnA1FOdfa6f33VY4CKvsyBY0XWI2gk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MiBTYWx0ZWRfXxvJAgPETpkon
 V+3wtapsS3VGSenpWWBj1Pa9uVi/QbVlH5uwolEfLVoeVXfioMnwFf255N+FrOzhofGGfKCkIU3
 2yAOX8EKh7mTc93Jb2ZzVb/oSE/tL75YyeC1aMpnRdNNrKJIXkn6VqEHWl2TjcBlaNRc02PgXNC
 eGam57399/28QhuvLOb2lwW0cNnZYwBx4jLKk/f4s8jr4m8bsIpfxNbn1NlszJ1VnaYwyMVg1yf
 Y6z9jRScI8MvQAzdz6qZLFmUnMN+9EZOeopYztlaTT0u+15R041942UiJC3+GMQckH2ZiuviPq1
 vXyb7naeeHaDs3R0c9cqasdUuZfyLFh2MTJ8ezGbUxTvel+IV/JFyePVor2xDK4FLG5IMqIU8L8
 C9Oi58YnIr8DzPUEdzlnLjkSgEMV3S8reKajdnM/FBrMVJccgLMILquDc/08+Mi2HuBetGbxj16
 jmdqevVpGTdPn2vDocw==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69ca401b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YTqrmQZhOYAkcZPAGwYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: SkjnA1FOdfa6f33VY4CKvsyBY0XWI2gk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300072

On 3/29/26 7:52 PM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali MTP variant. Enable USB controller in
> device mode till glink node is added.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index a603f3056d83..38269aebdf03 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -82,6 +82,11 @@ key-volume-up {
>  		};
>  	};
>  
> +	pmih0108_e1_eusb2_repeater {

Huh??

You're creating a new node here - /pmih0108_e1_eusb2_repeater{}

I believe your intent was to override it by label

Konrad
