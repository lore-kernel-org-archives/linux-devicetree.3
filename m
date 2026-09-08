Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2F239658D
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851975; cv=none; b=JMtUjky8WUjpM1NxzN/hpMcmJtI0+CqCobQC19QdEbRzFgpmIC3lQoJb3hB+Gnh7gWKJ5p1JJ2rkUPqYv6eoVuKYAfzmGLebe4T0YhZiQD9W6hsc5ESh9B4wQvt+wzO/TFqytFx8t9hrJfejH/o/TBkC2VBdGjPXLWlqzIH1PVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851975; c=relaxed/simple;
	bh=Ora6sadeyViVycjKTx40vbOAm0KDcOCTjb459MoIpdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdwsR9+QZB+hz3wjRUgzQKXlGvwTpWmL7/NWj9rcdebdCIKL0KrxdwX7A+Tms5mOzDEIU1Rx9lXJMAKVssZvd6jIl5AZMnVqwJ9kZv8gwLdi93M5mi0lDaxV17ZXtFpBDei1ovnCjfYEb/r7pG1iRQmt+EwgOobxGCIoYKtOeKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yzfg13gu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnWrwBwJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yzfg13gu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnWrwBwJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LnSu2172672
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 07:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MSh8ZXxCngtmXhzbngM3XhQp
	WNOjHFHLp51iif8TSwg=; b=Yzfg13gudpEGD8iWOaI1f/xcayBP+KuTEt6eFOe3
	DnPisuX7hwVZCn1A+tLWnOfZoexxsVSi02xbenAeekDIVOqDF02SyrnXH48dkWlu
	gyK8/c0YThlCGQuTtsQp0SVWDQBqSb8yMlQoHCgwP6G5k3at2hfnXxs8ced4mWbS
	Kwtn+5jMQoNjkHR6FNNQd5q5VJsBPs50eL4q8IqdQl3XY2PAo3Ngz7CGUrNfyre+
	ZEV8FtQ7IXVdRMAiaOy6oF8nx9sIWFEUadrC41uET9AWrRWZUlq5BtaaCV7CE2tx
	410DldZJ87UxN+61HBH5ho6pG5HcapceqbBBk0D63Tx7EQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrj7jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 07:19:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d8cdso828168385a.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851967; x=1789456767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MSh8ZXxCngtmXhzbngM3XhQpWNOjHFHLp51iif8TSwg=;
        b=bnWrwBwJlwiBM9asRH3WPrY7ytjuTI/thTvwyqUfu8qO0aVmp+88V4lABz8OT6jwzc
         OIUVMU25CWkypfZSy4zI1Gy21m71J2ggs/C9Q8rcM8Y+TG1JEPRUmqZYnbaI/IrdTi+n
         eCy+Rrd40tk1sH4QahXL6OTpC5CJde2JkeJ34T+SUvgdaG0bpLMyo+MV9EIDrKZTAboT
         Sh0oRDfe1/PL+qtKq94NSfR6p3ecb7jeZs+Oymejyf2tNpGtO5BM5aDr7ruxZ+DHaGKR
         DIAaQEa7U+ft+EsqXx1ungDt7RHYXKj2KxF5yORnOUhRkxvcuGtiha97fsmxojPlNvUc
         JKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851967; x=1789456767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSh8ZXxCngtmXhzbngM3XhQpWNOjHFHLp51iif8TSwg=;
        b=TJCHjSBZclrmAjMPyxpKK9PTHWDBq69GC0Xxxx8j5gxrvipqlPzn1zvk3WMJI9x38M
         WB0+rzH7cSNcoYawxKa2x6eqNffkHXMo3iHMK6KcLsnt/8RuuarKTpu6PE+nB+013k9/
         nx8mSiMee/9Xq3a5zUHxo0BKd5JLA7HZNAZRku0OB13sQb8kex0lTq2qAwIGZoKXrFfw
         fTfSa3FQ5webrA7ko6WDlxlKMS6boBlbKADKP+NKDa7XA+gYlI826VX5IIaJ76pwuNcg
         KN9HkhzBQQ4ff4eKPA1ReV3TPUFpcrew3ptV/uOXP5mtyJ5RcDyf71CXvkHbhH7Pvfos
         WsoQ==
X-Forwarded-Encrypted: i=1; AKwUvBweNPFtxkPOMrkiojDVoNdUTsnLT1IY8y8qasTAWTRsBKHbgUL0CvZjRoxlftUVEve5eGQDS02MpzVV@vger.kernel.org
X-Gm-Message-State: AFuF++k+gGycC7Eg4Y3Qwbj/KDR9t+6iPwj0G8rxLcOhH0VzwCKDMJ5V
	oELFJrINElCihg5XfSYHRX+TgrH1KuSPAcvTWv0xFVnUI7+A+RX/DfqCbTqG3rVfIhsEU4IDGhk
	FIALNqFQQUigqA8xAg5fJ/oM5TpANDatRnN2gYrCTckU39lr+CVEibebQfzS32D0J
X-Gm-Gg: AYBFou0zd+iIxelB9bbpuoLgguRxSks9kgjkWzn8NiIrxGyegUrLZXNcmXacHiVa+L4
	TJ1gNmrdAawCogclTaDRe00Lo53fVM156hfpvN1+cMvB4yQ/qX5ZsMxWz/a2edxXRyEQw1ZRPtM
	R+eOdBIH68tGZvr2VURGoBkqEwu6R2sU8jHXvti7H6ntlk6n4QtKvLgZQYKnbQ/1XqGVe74taCZ
	lXJ1fyyelG3LDv6RqtAOrl44yg2L9iycGxt9f2j6iH+gzmXy22TUiCbm9MdQ8jTlZR0JrDdnuBw
	EosfSXreuW3h77lqMa66CXazf+QXQNGXFcZIuM7BX0hhBbbepxKUBIUl3UnqJlr7Y5wSRoTkcQb
	WshHbH0PeJt8=
X-Received: by 2002:a05:620a:2888:b0:92e:f3ca:2eaf with SMTP id af79cd13be357-9398059a718mr2929290185a.11.1788851967601;
        Tue, 08 Sep 2026 00:19:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2888:b0:92e:f3ca:2eaf with SMTP id af79cd13be357-9398059a718mr2929285885a.11.1788851967137;
        Tue, 08 Sep 2026 00:19:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm33045263f8f.3.2026.09.08.00.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:19:25 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:19:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shujath Mohd <shujath@outlook.in>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: Add battery
 properties
Message-ID: <5enkadptjkxm5mmjjwtqehm4futxejzwewevoewlpeedjhszbb@dsfsfewasuiu>
References: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX9P/hy9c4oiRJ
 OF3005xUdbJh6+393sWEgK5ktYdRNetWDLOwxYnK8pHnQx/7i2AMETb9KFJXxFM+NeUh2zgQqoe
 mm5HaYGrhRxCxmhWDg4QHT9GMahJp6s=
X-Proofpoint-GUID: Pqa7l5Sf5k4WRQeC0zEMRTeMfW1uSB7Y
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9fb700 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=i5nSP4-SYfabNta8v3YA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX8AKVfWOHUtOH
 cWWsEMteXhvI9d3yHIm0SAN3TFU3Fza8WIv0zMNeV4BhvDjaoyjsqzMdW5tbRXzymYN4JJLGHDs
 ZoJH8S5thAFFmSPxZ1QYW39htge3nlcQKyHE49qd34osifvW/rWuU1E+dIOtlt8s/VzroMlgRpZ
 A26QwYeIOxk0Gg3eA0ZSmsFTMUEibB/i0VHNojOeqfFr+4uhR2OKddfBef7GQ3SINQe4VALu2A2
 9JyHIBw5UsBWNz+dNVvuPi6tXG5PaDN664xZCPFceWxmXvh2I3U8igyMhAjZrKemm2ZHv0SypPe
 Vt6EZ2i7UuH2utDR5D+yHXY5HWdhoz6l3RYXDPxc9Qa5VYBjVZyTjk2Lpob0EaMLtAY0Swb1tnH
 +FA+k6aFIxveQtjk13htvBojoTYzoaLSctTUuIBLsDatI3bbq5OBUW4+mDd2dwzZZHYJCAh4jzz
 /8BwaGb8e9WN+8BYzvQ==
X-Proofpoint-ORIG-GUID: Pqa7l5Sf5k4WRQeC0zEMRTeMfW1uSB7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On 26-09-07 21:33:08, Shujath Mohd wrote:
> Add simple-battery nodes describing the design capacity and voltage
> limits of the Xperia TAMA batteries.
> 
> The Xperia XZ2, XZ2 Compact, and XZ3 use 3.4 V as the drained
> battery voltage and 4.245 V as the fully charged voltage.
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>

So what changed since v1 ?
