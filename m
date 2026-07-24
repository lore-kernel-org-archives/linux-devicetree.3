Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DAA3DFC80
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883752; cv=none; b=ZeTmUEjo8nkVn0lP1vpEtjXtGHG0ECY9jyUqoyJa/Ulbn8TXFQI/7MQjyV7X7SWC6tnyzxKpZ9r5W/PJq9Jbk225q95N2uU3jXpPSuBLMvnlBfWlkINvorUFuMI82S0rGiy+fggaLtZvTOLGw5OKHR5SU5QQdd414X+1A9I8quw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883752; c=relaxed/simple;
	bh=uGEwcFqsud+F9B3NSbZNTWlyAJ0KhUGW/Uwq6LX6VHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzJBoP8uwOzm10Z6qOCIHeTY2mo30gDoZUildW4bOUYLZIEdKqNH7haH453PfWxYM84Qq8Ex95JKYVuR4a52Vef+n4m/WxGsiuCRhA413O4a0Cg4rWJBHdE73boLIcb+eINZJuEtn6M0jbrtiUl4C+nzip/EhsjLUXh6L4di0yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7jaVvqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZBQ5eFI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7jaVvqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZBQ5eFI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4leZU1992550
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zMh1KmHao1LhCLxddpBcSUgeQd+7Z2xRwAtyaliLo0=; b=a7jaVvqrETP7JElo
	NqTryjz8Pj/g+f7EJ+foE0wTJQccpblUSr4FD2Rfp/7SeR4iyEcY27EduZ75LE+c
	6YMl7ZqlfcKGfI3dRD85KNNf8mdny8uUG4csvs6Jk5zhscv4tLwC6RIPnKOdLTDl
	2EZ/Go4zOZH7qUWrhPp1Vnoe8oBRG5MyCrSdMl7l5VK5M+q9Uao6GbZ376cXHPop
	N1q6ZfozVvsoC1qBlbWkMmRmIeSzy48kPNSC8/RNMO7jIKb8VksI2qHtU+JUa1EC
	ZgNVlhwndCA8AKQo3vlhhRM1JDjxEH9euO8bB9reUbaiz4o/O5nh6IoBA5bwpnyu
	UkAANg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p510ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 09:02:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so4601085ad.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784883749; x=1785488549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zMh1KmHao1LhCLxddpBcSUgeQd+7Z2xRwAtyaliLo0=;
        b=VZBQ5eFILRSwJeY2wE54Yrg4IAyp6lx3XYQH6EFVSaFcZLhGUl9MzJMpEge3RJYpgk
         2yHtaCJyTy+trIC3kceB0sbW1kFgSlJWlYm9sLzi/6EShjujvSFVARnvXRlO4GJ4cUSQ
         +EEGYaORDmxnn5k4S3do+LjZMIX298yWnwcknWr7Wph428vqoVrTTho2CfD9dujuW7UF
         HlQfibsRAHnwdJ+XjfQDoVZXcw6eutgJpQL75RBMyPpzCwghmOJREdgqQ+buNe965670
         0/zJyZ5vTTRDiylixu07fC0SNRdxHIygE4r94eV1M5+HkLAnHDi2Dms+Z2+PZR4nlnoM
         t+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883749; x=1785488549;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zMh1KmHao1LhCLxddpBcSUgeQd+7Z2xRwAtyaliLo0=;
        b=Jk2oeqSbpsVF0d0bIxfYiz7MJ4lOi2+qXZe2lu8HyKUG8UYiCcn/S6oo30rVcLWF7B
         nf7lr4c2hYokBjbjUmO8KQyyw5YZJfR4PLsbXt365Z/YtYif9NLRGUztFf9bRDiY9P74
         lw7Yv5OUqlAVg8omm15tYWIqw98DM1gthi1RdQsxAX5oR/5W8uYnPadxs0uXP2bUluUK
         3qmIojur78aTb2eL1ZuE2p5/JUQYvGGmSjngF25EyWeD7dHbYwlO3lLMFZvoy4GksduQ
         zN+/4nrH7WtgIeY1Pj+O7MUFX9ukynEShqxmmoCyQeOAOh1gFBR9MBe4hodI+BMrecZJ
         qZ3A==
X-Forwarded-Encrypted: i=1; AHgh+RofVHi7wBU27xiwaLCv15BMVLllc0SGALGWWo5r8Zm4u8aOPnHCmn4muV6b56Hmrr8xHlb+uPE2+pFZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwuQ1k3EMMxyNCV/42RpW2kD9xDT4+CITgD/ZpJQZz6UaFzZqvq
	W6A/gDycrYglqO6RfHhafybjOv/qbo6S5WcLvlyyotbAG7W2UZ/GtX9eFL0T+l7CQDcDJv6AKJb
	M10/+SNAyzDRssiIjjiddwc+3td2DXGWd86xWFwOsBgVac6/OyS2lKG4bsgpRQ5Wm
X-Gm-Gg: AR+sD13oiPs/ot9xys8PjiQgYPZB+ZGL8HL9kNs+zw0Ejxbpv8udwzSXkXZb3PNa1IU
	xv/OKV7WgINBylOQqmgM//zZAXb80Q3k9bewmfdB0L8vVolL6o3mFu9RWBSyT0e4h/EJWufWgzN
	kIPmgoi5532CeUxjWEazOKjM4vK/4Z5I2IN5xYL2Hj6NmJlLyrCjWFgCNBk+vXUNS4HPlzzdwWT
	Vtnnvilg1+o3EpE3M8TR1pjTxPsw2esHwr9a2ef4LWN9ufS9rjjWtexY50iABLkIsee2J0o3vcf
	HHhfqIXqRKkjU/cSqBbBM8lf4+C4EXKD1+Eyrd3avk+OCVzVvDDveb1cLToXudMVQBJ+2x2HWI6
	vB+LckA0YOSvYR99tYJFtoJbP9ewk+GKyFvry11OoMxItzuRmtTbtVcvldAax5ZFf4FzW/b5t2e
	UAl2ujAmgeF/uhWYa2ZB0TGTI0jQ==
X-Received: by 2002:a17:902:d2c7:b0:2cf:ba0c:aa5a with SMTP id d9443c01a7336-2cfba0cb91amr39535335ad.47.1784883748714;
        Fri, 24 Jul 2026 02:02:28 -0700 (PDT)
X-Received: by 2002:a17:902:d2c7:b0:2cf:ba0c:aa5a with SMTP id d9443c01a7336-2cfba0cb91amr39534615ad.47.1784883748164;
        Fri, 24 Jul 2026 02:02:28 -0700 (PDT)
Received: from [10.190.200.168] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efddfe1sm48392965ad.32.2026.07.24.02.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 02:02:27 -0700 (PDT)
Message-ID: <cce14564-9f74-48d1-a18d-8db6a265b7ac@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:32:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/10] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>,
        Jia Yang <jia.yang@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
 <20260724-space-magpie-of-promise-b71ead@sudeepholla>
Content-Language: en-US
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
In-Reply-To: <20260724-space-magpie-of-promise-b71ead@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a632a25 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=mBLlwB273A3eCssxvk8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: lUeTzWK8GiDI87yYTsqymFuLTXt2aa-R
X-Proofpoint-ORIG-GUID: lUeTzWK8GiDI87yYTsqymFuLTXt2aa-R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MiBTYWx0ZWRfXwnTAmADup+yB
 x9kCfj/j0uT5ypuUc0JkuJxdsKExR60+Def11QDnpUFFPKedyA5kXs/T0Xrm+9O/+v6/KwRnUtK
 vrYSV2xXOFQkfkdS2eeoBalaZMD0yhE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MiBTYWx0ZWRfXyqTmKc5Nm0Iu
 AcE2sBolWO4c9qqXe/4Tv78+KC8XTXhlbwLPXxZ34rnMQh++xS5vqFvwneml3XI5bSeLumpgxqO
 V8UnGt8SCet8ywFWaq5FTfyM+ivX+gjqEwH+iNw6lERbllfPvN3QTtedf8Qe6gc8cSbdVGcvpew
 D4D7O+UHukoRm7jD5ErvY80Wl+vmMGyW4CWRuFzCiG9YgEC6+X981vPr6qW2Ye8b9dl5B57XOPs
 Jxzu0Ix5EypqOUEAHXrYDP8ZkYFIx9/oDUQIy4kYN8+bxI6GlHSseGIdHoPUuEmkjBxOuCGx5ht
 JrT2w93SAHnV1qWkFaRqHg8X9a9jvsQdXO6lV92luzlCKokPmsZwPGhcthTiRdcHQIi422DsK7R
 DPeb1Z/UTx7yHpQJVWdmvpNG3BCNUUK2h+IKEe2ttsU9PLmXUfpvyMmaJlIQxyykJv40xR8mhdT
 sGs1HZhVUWkECBPes4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240082



On 24-Jul-26 2:10 PM, Sudeep Holla wrote:
> On Fri, Jul 24, 2026 at 12:48:05PM +0530, Pragnesh Papaniya wrote:
> 
> [...]
> 
>>
>> Changes in v8:
> 
> Yet the patches are labelled as if they are RFC and/or v1, so it gets really
> hard to track.

It was a miss. Won't happen again.

Thanks,
pragnesh

> 

