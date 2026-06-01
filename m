Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2433955C7
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312162; cv=none; b=udBmUcY+J+n/FSBqWVWJHOIWKk/gvd3feTtGyaPgMoDABJqbQvnqloN+7WHdEhe507gwZv1sDae+c8vt4KwX38ECnOg/Um9FOnSIzR7D/h0kN7b83YjyZ+MRVXtMeRgLde92DhbdQZj5zlTWxzF5VBAu8wQPZIE4vNxTDNizPPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312162; c=relaxed/simple;
	bh=3alUzHGu1q1rZwyrAelJu/jmfwWJ8k4Cvig7EsHZoFw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xbov44FVtC+dcqveJuz9VyrHMKcl+GsKP3vFzWzdjW+6qzaDQvnIlTZHwxdH+Zi026u67kuB++682UFaMxKOVjFKEus6pk395FwiWrpE+897v4qC2m7/ti8LbgKgQ/ENK7lXJ88ckLQcCvTCEzw+uIgzyG8kZ4j25GfKUarXOmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXtx2Dex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkzRKhJo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXtx2Dex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkzRKhJo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518eHoo1214208
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 11:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9QEMurAKXE9J6ybxszdY5PU9AaBvmWmuoM7SgFN+a8=; b=iXtx2DexuH/iRCc9
	CdcMNyuvlKZO6CRDVnxcdqrrgBVrUSFfuZCo7NhPUadDNuKWBEQsvBgrFRfLiCp7
	5VgxULzkLrO+h56lSjBpZl1u1jIkmBURaafSWpPndyMEbQulcZIw0t2c0Uc/6i8W
	sPqDT6YztMuh9CN8M3s1C3kpZqu02Zsie0XhioKJ0R7XqWLWtyDQE6yMDtS9W+Ka
	CoWntX0X971J89iW0RuaOTdByUy54yqtEl/qBTeAaR0RDR9rbQFJQTVvVm5uBjqa
	DPbESJvokHE2kG3WgrftxkO++i9pt/aTfJaEPfWclqM0Ar42YnS7YMsX0M7CkOSv
	mSNNqA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s98kns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:09:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0532a6588so18339525ad.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 04:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780312159; x=1780916959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w9QEMurAKXE9J6ybxszdY5PU9AaBvmWmuoM7SgFN+a8=;
        b=bkzRKhJoTLKRPysn/l+Er7znAvuroReNbuVjbbxy/EkY6JQRkLdwGPsPoS8ktctajy
         VP7pp5AHh35ygzKIijZvYaOsl/s1ReA6IcmTN62vqNcC0c0PRm97IxmVj8JKa5rmH4TK
         KqE/VwsRPZI3bLCGuVb1eJK++n7AeEMZOBWD9ozEcXiPbpmxIPmuIwZyaljfnIhRTLRB
         Vz57/R8D2smy//yMxr+F1hCzYDUSGgrcGmcb5ppdEendGJ2nP1fF52T/fjCahBnqQSMM
         lGAMAvORlEu8orRoT/mzp0ADlYlf1f2qn3bT9Cm9ctWBFwykOoJx6Hsa7XjJYCn1DLF9
         pHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312159; x=1780916959;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9QEMurAKXE9J6ybxszdY5PU9AaBvmWmuoM7SgFN+a8=;
        b=rfFZoI1P+L+UvxO12pad7aoIcyQbV4YvuS31wvx6iapsAG3hjvqug5WJZqsrftUvkg
         7YjZ71qUDTpG0FEeYX70Nbl+aYYOR7hn7uKscXtRM45Usiv3sOElXbbKMY8LXtftwccE
         KGfxziKTB01+BBT4PYj6Sh8KBqOeUNLMxaxRHlg7bg8MJC9mChKYiG/kybMYnJ5uBZZ9
         UeYQvOpc9DogrTzTLR2PLpD1jSl3ymVkY/g5OQEEOEG/WnRfdEMYaE9U+2QsTZ0iG23X
         XaGNOFnrK8CGonDt8ilj/Y8QffwCaF1eIc+mWQbZgB5jDj8dzSM/qFLUonXrzBWDTNPF
         epXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8F9ZNvtb3VGEBkOjsgOV2CG2dgngRCzQBNOHl2VnfoJnP1pCS1FRlbW6CHHfWr4m9dPeYC2yzYwKyY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9562jTg2ayZvvGSas3xdZX4TXhKWEnNzFpiNPsqoGhpQDXOl6
	GBl05TIjCb/Gv2CxuWwCN2Dg/L+cjSgkxsfcnC11e7CqxMeMOYP/U4e0wCPaL/OSkcSXUZqoj3p
	uCvRZFXNXXAoM8N9HUJkkGt4/h4mFxOnusnQM0ASmMHnuTnTritoXkmbV7ChTDnJk
X-Gm-Gg: Acq92OG59NmCQlbtAuwUkYYOwKCv3C+JHrpzKA5vgqsOTABJPpuhrNw6EtAhQUh8UqY
	GoKP2b2YAzRLRlf+SJihrVeYmplkhANtXmquu2aa8DDTM+04eN1l3fXbmR9arUVnkhdcNWfLh02
	LCjTh86QiUYEIUZAol+7NRKNQT5g3D24aEOwjFqtA62vHkqISFWLGrTgBVPlj9IBAXNLvZO39B4
	LU25IEGsv+nIx4jmkOBqK8DDLWCsNCgMU9UxS42l25Q0Cf3cT3bP9I8utPFqjOAqYDWQrlLu8Qk
	OzXibTL5cbxiOLH6T40og+dk3KjkcIANhHa9RwPFa7n1vRl1egvZBJ+9KR83b3pueI0qcIT4qjH
	sd6qfJOS1vn7+n9e0BA5w4kn71tMU6mFQmrZUCMY/MkS0ucrGDQ+7OMHLBDFkPw==
X-Received: by 2002:a17:903:41cb:b0:2c0:f807:56b2 with SMTP id d9443c01a7336-2c0f8075731mr14858475ad.34.1780312159482;
        Mon, 01 Jun 2026 04:09:19 -0700 (PDT)
X-Received: by 2002:a17:903:41cb:b0:2c0:f807:56b2 with SMTP id d9443c01a7336-2c0f8075731mr14858115ad.34.1780312158973;
        Mon, 01 Jun 2026 04:09:18 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a1e095sm107010925ad.32.2026.06.01.04.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 04:09:18 -0700 (PDT)
Message-ID: <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 16:39:12 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
 <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
Content-Language: en-US
In-Reply-To: <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gDkrRkbyOWBVTiVuAIRwi0zWZ1TptjAJ
X-Proofpoint-GUID: gDkrRkbyOWBVTiVuAIRwi0zWZ1TptjAJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExMiBTYWx0ZWRfXwWvKYofiCews
 b/XMsUAT/8YqyXa820z5PF4uF0nteQmwgtBUal2USFdsECGgAkePa+x6QmYhik3Ku7j5apL0qP0
 2QohXRDABJq3VB5r3YYQGC1x13yTAoYALAs68M4FaGzCD7ROixobw9DDx/Tdb6YKt+kLDkmQVe3
 1WTrNKnTPXACy1+Cl601Vd6Qt1tdGlM2XtJnmzXZ93SjuFu75MRTQgjyMo76SyETa+fijox3/hW
 oo97zOuUtLa2GYlcAXoMoZLfIpblGW62saRMoZve4mAKioiYv5aIQF66OIf1IV/Nafjg/GFMr0k
 1aoqluIlxliL45vCbWLYVlk66ZFHncty2Vj3l275PjZn6LO+ERHJAwtFv44XDmuos85QC/SP/vc
 Egzy+57E476yJyhZ1CxVLxzWv2EBg7ZONNfkuxbv4EtSWPG7ybkP3glQQcy57AhANLDvh4h1ls5
 lbsVJ06LeSDaTTQY0Yg==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1d6860 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Xj-fFaYqki_RdGdrlmAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010112



On 29-05-2026 20:20, Bryan O'Donoghue wrote:
>>           ret = 16;
>>           break;
>>
> 
> This is a pointless enum add.
> 
> NAK.

You're right. Since Glymur reuses vfe_res_x1e80100 directly, CAMSS_X1E80100
already covers it. Will drop the redundant CAMSS_GLYMUR enum in v2.

---
Regards,
Nihal
