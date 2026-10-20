Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483419;
	b=ZwxAwgVGh2ur0P8t3m57ZROEuNKMulvI5l49X6wFeljN8NWvz+IV85MuvmsxeuR8vvDz
	 bfUiV1pkBvupLFiqOFOPGKxP+pvCYTxlJoH4PXRtp2epKj4zy7iRsJR0sryyKHAIuLyxI
	 lOARwAWY0HNGBsgBvrUZJVUN5wWbRayFhDTFvI2yjxW9IgbD0+c3AdFWQj4zwo+OXM2xs
	 z3u3fLvXX0e1Pags/QQMYoXH4y+bzZk50qDkvThFiayr4gqyxsgK1qGDgGz1IOeDMKB6U
	 30uGljmxsRtnvMJkMIbbVcGzNNDmbpEcyp8bJEKPNJMSdtz3wd0NQxu730Du3GLBTGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483419;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=;
	b=pfucMqzLVY1xWrizsBxtOGWW9eQR1JIBJQHGML//rW77glZGhWPw13MZ41UMeSoR3X0B
	 2Bg7dqI4qIaiYVnwCitx6evvLkIH0fKpp2Hj0iFBbTZ4m8y0nthuGZTdds4Myuq+SmSXm
	 NVzXBXMe/bD6SoLJOFxa1mjH7KpZMHtDjlFa1cTTnUKh1QiGzsyQlA4vgbvccSTiZYy+O
	 nh33+XPjIrW7IAp5uw2OJz2v6Xjet49GhxUCk8731zqXoKlQ/0NVZdbUjt3SwzppcLTRF
	 8rMqJhCqnEExuYsyPtmG1/NaaQRkr1IUx/x5jWtFtKmGOejW5CFeve1iNhRB2JUJ5Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwIW49qS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CpjbxOXk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE22606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AE22606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwIW49qS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CpjbxOXk
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tiRs4032824
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=; b=AwIW49qSYs4fGCDL
	VwFeNJDN7IHzBkHSnFSTpR8xzs+O9CbaFMAA6TXvDlQxZZ+5VrutOEkGYwc09Yi+
	ynaGEduK5MdNSy6n44A68TTi5B4TTaVVrs1n1AyBlx0z95x2z+IYVdo5PFQY4pp3
	wvPwf9tC6NpfcbVjId4CC+TV9IPERa3TeoD3ZNgyaDf7Pwx94LoEUZ5AI0Aux8bg
	wWNla66lhwhxS/kc0mBuE7tLF8qPeMr2EiG1WRXTfTq56NcKD+j6T3JfJYBToBKK
	b9lzH6uVC7Pp5cjxt6uRAps7kBC5mxQqFQZh3Lajh7VRGLzmikUPwI1NiXXgzjri
	z3/3SQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q9g25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:03:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536708d1a3eso5058681cf.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483417; x=1793088217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=;
        b=CpjbxOXkZC9RN6P7/LPEhWyZU9s1ox1jQFE6Mym15AuR0VyQW/FFxMlcgRz4BH4woi
         WgBKEa7cSkdV6XWOIhpr1VESvs4UbOq6MdRPECL83wxuc2THI91Xn5IK3xVlip8G0Lmo
         fC/K2Vqr5aD7og4v3cmRF7lDEFYJplJX+Bg5Er1uuZoc5gIxxu8Xsg2et5qd/5G9DLcq
         V78Zi7R2S9whgzxfe7gnm3KZsqryGXur54LcMDRux6k6rqqZwbqMgsGxmuWcdeE/NddW
         7gbvG449xQ06bxWNI6hOZZezjRehOZnIGNgR9BmqSWtZArE8MdxptX4sW7FftAfCX491
         j6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483417; x=1793088217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=;
        b=NNiIWneLsXmMhvK8UmyagBGI4txu/VqIJadPed25Tk7IvdlPyDWPMchkv/ycFSwE4O
         vWwnkhtbC7+pFSa1SDkTnHw1QGpjKq7ejzPBzjmKoSYniEWGZtBA0q5/e8EuW/NFS2MO
         e1OmbKJZtY6o/qW0L5T0WI1/z32tL5lrrF3FPR5ZEuIJhtxixaPOKhMajwObGdBEz1iB
         MCr41R1aBr5wNxE9QMjkfqGMQVXQ3Gg0/0bzWwTnDEMp1JUZkjz6dL4QvIjx0lTjEn7s
         iKiqZod1RAkIyT6XkX9ADE5MukQFOHN0BDen3PFGp7jy2UyJYoYMcA6ZRpCR2QZL8EYl
         IawQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMlsM36yu9HvbqRR4E/Zpy0SS2ZLe7BijB0lk7fQwjZibAtKPSs5SXV7Gcy9jfZAmTUaeBI8TGePuS@vger.kernel.org
X-Gm-Message-State: AFq9FYLnwY17YBQOuuJ1rk+k26MKEbTuinrbSItxlhkYmrHEsBfNd+6d
	u1jw/qyw+J5r+qKGwbVq6SRbmVTOb/aQk+MJRArA/DZOAuLun0U5znjx+5Bs98zhcootskIhgIZ
	A65NiY7GqtzLbrPQmtEogWax1XX8mxqHtWjIBVCv8Noc1VBqNdgygPD6Eg1B0zLbi
X-Gm-Gg: AYBFou1SV5H9mDtdkrzZYe7i6iDmV3g2lqDNdLDcDJzlYoux5lR9800dZV8mDOwVbwJ
	GPGipyzULVzqJDnQ9C97EqTh474i2AfLgB3Jovfu6A09hsG8tXfNkZyG1co5znxwG7ZTDkRvPgZ
	0h7PUxC7w+SBWTLpFXE54l0D5faY6wXYpX/kArXAtsoBjV0qtRbKFl8GRcamAwrH0By4Gv5hoHZ
	HPuc2oU2J6HfGhGZ4gWM1t+xImQSn41hjUAquc+lmOP7WSxTmK/IugbzaJLJ/nArN7SJqGO/VWt
	RmkvrocTVcLqmbJEnyw0N7IHEr2BecVVEviGAYt5DHzk0TlwQ1IIFP1/SQtl5vqKUth7d4sINYj
	s40qWh4SS4mZTzO0yWDlm6w==
X-Received: by 2002:a05:622a:1304:b0:535:496:56ab with SMTP id d75a77b69052e-536459e2a4amr180284431cf.0.1792483412540;
        Tue, 20 Oct 2026 01:03:32 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:b0:535:496:56ab with SMTP id d75a77b69052e-536459e2a4amr180281231cf.0.1792483407204;
        Tue, 20 Oct 2026 01:03:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0402sm460634166b.61.2026.10.20.01.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:03:26 -0700 (PDT)
Message-ID: <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:03:24 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z1NP3BSpDUIumqFCfOheoi7VZc8lwll4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX3U3zIwYEAlAy
 ZD54u0RUEgqAJr9d9G7w0pZHsykvSJ9vmkA0AyL4J+is3LhT3YkCIMQiHGEbDJmRwnqz20d6EYa
 DRP8GjoLY5s9kIp4RDtKcnQTbjML44Kc+69xEgFsOTvie65RJ7tx2ccdYrxR/Wl6Vv6g7/iKkHt
 4aWxdSXR0EXVW1hslMHiPH3NQyWNHWjDRqJjqKu+wZml27JmymG8HWsikjwiD1GJNBDehUry5EV
 E8u6+VqeBmn+wRIWTZtfWz8Idjylq9lJYqwxY2jscmheJCm2PVfNu0ZXnPUEFqK7ZLpTf5mGoL1
 qb+VUKM0T6qxrV+97S8PqPQ4cWjbsLRvyJOuS86s/kLWPwMPsnKgSeocVArxvCn3Caeu6TW5Bo/
 rZ5DMuBHh7waBIxYrv1+AnxxJ6AvIpr+KmjiPripTUbcXABbkyGETp69rcrh9TXF6489ngJStzV
 clwd/Lw1f0SUKdH55Bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfXxBdAACcn6+Sd
 U3TG7sI6Dgq2YBa+RZFaPgRZqfZZ4lh5IJhfHdVU95tgX2WlKhQoO7e21KVARC8lU7Id+xVFJRi
 LIIsD3WC3eSTl18+qGjkp9ZpTouzhhc=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad72059 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Nmv2DHgxKDD6GQ1_MrcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: z1NP3BSpDUIumqFCfOheoi7VZc8lwll4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200031

On 9/28/26 8:36 AM, Anvesh Jain P wrote:
> Add support for back cover, keyboard, and SoC thermal zones through
> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index e27c697e3170..571c98124a40 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -594,10 +594,12 @@ &i2c9 {
>  
>  	status = "okay";
>  
> -	embedded-controller@76 {
> +	ec: embedded-controller@76 {

"ec" is a super short label, perhaps let's spell out
embedded_controller

[...]

> +&thermal_zones {
> +	ec-back-cover {
> +		polling-delay = <10000>;
> +		thermal-sensors = <&ec 2>;
> +
> +		trips {
> +			trip-point0 {
> +				temperature = <90000>;

This is *really* hot!

> +				hysteresis = <5000>;
> +				type = "hot";
> +			};
> +		};
> +	};
> +
> +	ec-keyboard {
> +		polling-delay = <10000>;
> +		thermal-sensors = <&ec 1>;
> +
> +		trips {
> +			trip-point0 {
> +				temperature = <90000>;

Likewise

Konrad
