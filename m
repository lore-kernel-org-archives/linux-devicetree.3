Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832366;
	b=yu7FOIAWqhNFkt20EJqLPfW9lqeWCj51gsjurEdGj6pqxnxrovwy7zj+4MP0rMCP85dQ
	 beQL3m40cVM6/pTm6C/gS7wtQjPVwSywpFwoMBM6AWo98Yw5pjHmRI6fQeYWHPnd296md
	 IijclfLYAIC8EcGLCmn2lqsWzTLRVofXGqCu1oE9o+0/awPk6olpc6txRYDtY1+Fnc1oz
	 TH1/FNYNUOI4x8LYtmddRsf0dp4dcyeFYTUGaJebCYnj2SfXthmZiVdHxt7R/jJsA3zi2
	 KJtJeEBJBHrIclIarTCZdRh1uB4fk7I4wYrM7JPhV8PAYGKXLbOGHxuEMV6b75FCWHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=;
	b=hOSFZ1oHuU/lvTiknarGWTUul+wxnYJvfjlkKJU088ud0QauXI8Xvaw08qK4XZqdJHwn
	 E8bFIv7rkJkrh7lgI/A9LFl2xTPmUZqtaxVql2eYQ1cqNFuouqnayENermhdgH+8YvNkK
	 F2LlsiPllEbDrupK5URUu8EKygMmvIG1GOXnJiJb36tLwFRPCc2kQuQJ3DpCwD1VPzAlW
	 c7lZaCeAeWblGWHgheTi8y1tKxQOAEKJbs0vf9vms/l11iXq+TXa7g0G65waL9QFm6mms
	 lNmO2b6kzKpug6Kulko5RfL6DFrXYk6XU6EXyKs14O8D+uUoFsmM32vf58Ikm3VlBnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNC3a1rC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViQVeOJS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92D0606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C92D0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNC3a1rC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViQVeOJS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0p5b1552344
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=; b=RNC3a1rCFItRQEKS
	NsN3B55/yQpgxTY8JmxABTsBARg+jQ+85Hz1JCyNBbPbMUStFxS3vHf+5jwUFZVC
	7RaWHqWeLg40NFhzQFRsI+ZwdsTwVI7g7K6AHST1Odu0BG6JQMJ3sD2VHHm2iAlA
	cZHO78ZBa5WveYkC0yGVzuNsjzg4EPEn3TsdZUe3OTS3hcacvhmhQu54cXy64PPH
	kMxysg98xx/KP2/AFgDEp4ZCvH7+OZvvPDp9JYq7SJv5kp7yRyzYEObaTEGVuTRN
	kmYJOBX+LUqgqJ7QXcZDAjRmZGDu8E8He42maR47VXAq8qXZRE1iUXKPsPiFULIi
	p30IEQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2gqt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:32:44 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-990ca9607c3so1459886241.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 04:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794832364; x=1795437164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=;
        b=ViQVeOJS3q76jgQ/AIqwaFL3aCc7toq+ZnHN+zMXXOaHNCvcKeOaZD5vPTD5Kbvmd7
         aPwPwdzViMOMZftvlwH9cwU5kIbDL4vpPgEjho5zgZZin1BTq41IH9+IPd9JKU09MDoA
         2YBicTKbQuLYo6H9juXiuYV1C4fcJbS92Q0kPjYBA/rCBKZGr3kTf6exPZtVlKPdZSvD
         xSVNnFh67MeuwNX1rhdhXiUCwS9+bJsUA42J2zCY0OrIsh3BbDGQSMr8Am1t9jxRqvNx
         2POQdsJGhJHul7QcYWbLwjlIAh2k/W/uE6upPk/eaAM2EnCiIuTMd2BtHx+9T3S3fP58
         GBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832364; x=1795437164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=;
        b=MKJlvN1Gz6sM1DrIVS9k2qW7PCg/u6xvN7W/+0MtOqWcIr32dWbyobW0GaZIxEtWTE
         Wcxd/LjRGml/WC2mIretrwrukbSOZM61mL51rwGMsDi0WQByc0V+Be2HvK5XNhxp4pL2
         K2PnnAxIvTgMECk+T4xqdT0vzckQXWfHCfVyE1BpXgL/N/AgABE7A5KLnsIBX+kGba0Q
         7LC6CYSErmMwURfTG0rPY2QKqg9jh30SrbnTip6D7Du92Of/QHZZ0k58THwyY2vSmbvq
         hBDYnbn7ZIqCeoLhReueYw0ZQgKAhVTnX5s9p2xSAaAjPCGy3ThDw8pb8tp6kuEjAD6L
         eALg==
X-Forwarded-Encrypted: i=1; AL+hErE5Gc9/5qcVha7aUvChfU2oBaYpOQZwBf4hA3SNFuXUwxcMVgeG5Egyw6Sq53O64w6PMkRun5bsN8iV@vger.kernel.org
X-Gm-Message-State: APuU4Z9d8HejovzNCWokBeKTxrQbwASwta5sP7HQEWBdzGTDP9nurTYQ
	A99BVKDbjArtLWVHu5w8R9sOf2+kB2Hsc9LuTXY0LzYRpzKYGwQKujJJk0QLNN0jmo5pVkt7R/3
	2QylGBtymoLc2qIPkxfZ+5Dq+qHVxw3GK1ckJ6QikMad13WaQHP846Nr2AnPtVqlEseA73oD7
X-Gm-Gg: AYBFou0mT+I2xNhuw5Mby5Uw/Xs5fuh2+etO4DjwlHaeImHMBQ2eeE6J1SP2bqY2KW4
	FFw6Dme6/Wi4fxh7KOiuYCNeBj1HO4F2F0F9wu/fcmxowSdWVjllJJC6kEhXaeEePWHhVVxx/4a
	BlX9CYLQxPpF5IGHdTT2+8zYnhnKrO1qN00Ke72OJ68RKjQ5MRa869ueQkgJK1b/QKhDGFjiOE2
	cIm0UV9phu+TiiM3njrIG5amhRKVVh5rIxwZGT0fDPiOrx/26lnSApP8yey+2hZPmFPaBifEwIp
	5gMwwsV/KgojlfrYtjKpP3EYcD7RsFJfrIIS9a44ScK16AhRLTWDTS940qz0dmu8GWZf3qML3bf
	WDnO7STeMmESivyZPp/1wZ+0Nf6UGBvPfn43ya+F48aFD1hVV9ie35eTo5M1A5+JrcFjRqe4AEN
	Lc
X-Received: by 2002:a05:6102:6892:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7d64d73ad39mr3888650137.14.1794832363796;
        Mon, 16 Nov 2026 04:32:43 -0800 (PST)
X-Received: by 2002:a05:6102:6892:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7d64d73ad39mr3888630137.14.1794832363350;
        Mon, 16 Nov 2026 04:32:43 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d64c4f6d8esm6654021137.9.2026.11.16.04.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:32:41 -0800 (PST)
Message-ID: <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:02:34 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
 <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
 <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afaf7ec cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=YRl-4mzKpuH306CQ8RIA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OSBTYWx0ZWRfXxk27zOXNNMpD
 WVpl33vKI2c+n0VTYBYLjMAE4R+uY9WeJIvBcpDtEhXy+sNCNClEo54j1/IOFIdTV4T1jcOMSCc
 jvf9hTqGachaapSJDdDO0LVRgmdNtD8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OSBTYWx0ZWRfX/cdO06tTT2m1
 w7qq6hC3pWwltMDNCgG7dr9hULpblvTxEPXfveUOR79KGoK6UEaueGJ7G8UY8u3k5Nh2FOTSLFo
 S7fQTKUsrtB7w+dghRXLjP+VnRFQ+u3m2B809y2v0bfi2aQz+nVT6SsU+hoDBzQunmSuy1B5SYG
 oSWWD99cUngdrWpbffOLY1LwEQPKkQNDU4xLBJM6b/j1CLu3o8Trfskzv80Kq4+DVAI0sHFgqf6
 qHRZNjH8cSZy9k3C9QZG77nBMjdaXhRvRXZajpIbH+jdMnf1eoBgu5AG/9hxRD/Zx8mB3fqqusB
 jf+F1NL93EyQvfAPBrhyMMDotML4F5MZeJnFaOPhQ3i3b26WA0nw/61DmeyqWPvikbRAnLJFCfp
 yXFtJH0L7xYGCRxbhlgFHrDl3gXOMCmKjAkyz2TD66eEy6+khJJQBnbk5YBmVlEm35gWc5DrUBg
 LNHI4TQpBYqArKjlhDw==
X-Proofpoint-GUID: 48k7QsnMBoDv-1C_AAT2UjpmPYSR_YsF
X-Proofpoint-ORIG-GUID: 48k7QsnMBoDv-1C_AAT2UjpmPYSR_YsF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160049



On 16-11-2026 17:52, Krzysztof Kozlowski wrote:
>> It was not used in-tree yet. 
> That's different question. You added ABI and that ABI could have been
> used. Was the ABI ever correct in the first place?

The documented ABI was not correct: port@3 came from the old X1E80100
resource-table mapping, not from the Glymur CAMSS port layout.

-- 
Regards,
Nihal Kumar Gupta

