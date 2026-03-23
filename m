Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D6C1D63F3
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275579; cv=none; b=SGk80XnIULboYbabX+g2Z+e71aJWw+jvSTsCi01R+sRgsEmQrzZwPsfYblOqc6Pt2K8pc1Z4SMRlhm4QAiaEeYUOGQlyVh2o0T2KytN8uU3Apn/erPI3oz84/vlj3lB5yEj/1yH1Fc/qzxdqHALnZt0A6h2I0iYLDAaDwwTPQQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275579; c=relaxed/simple;
	bh=ZZSCN4kQpGWeTrlTAJJtXzaniqkZv+8b6jSRBJAOSaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyP3/JH31KeV8ZuawfBBpSC22YUJPUIVPfifQCoDiXSeifjsVcyTCMltJ6q9dZWl8c/xa3UbKu5W6AmAQ3Hz+Vnv8jFIEMNdQD+iEe1/Y92B8M5Zllh8/tapWU2KRkhvtxmUhTxqnyIoJL6VbCg0AZDLAup3jGmsFFg34Ge80j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FksSSyvz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9XBH3bL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FksSSyvz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9XBH3bL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NDdBgq1627188
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8d4KjTzuSxbeYdFstSsVJ45Ghx8yVL1UTRluH2xJZO8=; b=FksSSyvz5qWJa8Ep
	biwO1cjoi2ayopGCKpKKx6ow+bvmrYeb/1CpHNCLLc7snlcQB3FxE2p7r6mYCgqs
	VuzqzGBX9aDzx+It4ydq54K5vJ+GcZrZmqvRR2x7/nd4QVUdyAJfKor3GMGiI9zz
	x6U9JZDdLBX6RO4J8FGNcYMCRhC1UeAeyvO0M5uKpyZ6n4ADfEV6KRA/UeCvUSf6
	I8eDpTXSfgajkSmBgATHdikCM2jrExh+2sWZCYGeW/zXZv7WnAlr37Ydb6Uu3G5N
	Uvg1jgzJxeSqm5jE0Y8BR3CotkY9QVkH+CohYDKJBx14p1LdaOmBypErMjBW1qAl
	SF2eBA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc1c4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:19:38 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94acebd8d64so2314336241.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275577; x=1774880377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8d4KjTzuSxbeYdFstSsVJ45Ghx8yVL1UTRluH2xJZO8=;
        b=Y9XBH3bLhGWu8IKGfzrt25dlgJEPCsbvyvd4kEYLFmBGoKXEvEoeIh/SoVjVtYu03q
         JOg+eUQrOo0JSOTohh7xh1aloxuUOv1FUxHEFw1SK1m1Jo4uiZgk5MXjtg8nKPafLLbR
         bvEPkUcOVGqESubrj0OrppP7x0YNEJx3yu6NBVugup9QzqnQWTY7XdUE4xxQ6ILOHu+h
         Oa11GqWfstPJJweEUXX4H6oQPwtXzQRNjm0xe0epnwKqHAtP44syfs2z77IQlrqywqe7
         O8M7PzLZURty49iKVbHArUevrfehIhs4D28RpQMsNuy7/Gh0zY0oLPk7VC0MHxiMSi4e
         aQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275577; x=1774880377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8d4KjTzuSxbeYdFstSsVJ45Ghx8yVL1UTRluH2xJZO8=;
        b=sEMrEInhpXBC05pnSECNi5E21W6k9mtTBmMGG6/LOw7KFnSzNWCAXvGBD2EFSubXa3
         GG3aSlgqZsN7WfWwTYKMb2QPZ+QkeULSasM2ORd5VBEflQefObt9ffV76UVC+WCwHCMH
         uCbmE/UZ/U0G3ZSh61SzVq7mTg/d3ZE/sIbuwHEft7S20PVt5V+VnHP5I//cNgbJQqIc
         YnfjOlVtm+bZIPCyhFqblExCkFF6O+mCTnghIqcAj7PTwLJRB2fZLDQT1CST2cmJjBxi
         klVJuO1d65xP0ElRQbmzixB4kXH+3tfzkF2yYguWp9Nrxmuu4ZTk878BPWlH6n5hL9bY
         AT/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4JY0FA9qPa2uYTP7uSxD/Sh7f3s75AuiiZH73zkt0KwZCVcCV3rH6y3NKJJs49EotSz+a3zPkf7sg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/vGkpP1Px3U5zbBakXuyrXM38S2KKjJFY6Q9G1AMl68FC/k9e
	Rsgx0bG5H78xTDAS1OS/jWAx5PVSeSn0ES5ROzpYzPz3ZOtPzKVg4Dc1zjIoezUwbzMZ9B8RPzi
	EJyoHLCQjOmkkxGbBu1BGTlPl908uF/lzr3G7C6AnrT97E47BiugVv/C5kbKTAffP
X-Gm-Gg: ATEYQzyK1PeDyAmTFZNuXVsJp16s3oZtEdxP+Ta9Rj6Er6YouuqV4vXzrY1HJEsZtub
	FIc2xfTlsWl3XXKpPhSU2bSiKiaIdPc+b19hobGCFBoOhDIzsulJdthS3KWb9OC/Rmi5TRWfd6z
	X+mJbS1f/F4FEeisJgpn8fjdYL/7i5S1ceObt1JzMuycPVQFSA71XJb3zWh0D45x/IRVSNu74g8
	QibuXuH7lwoUMuqUgDwCWcfUA7Avka4cnBtgSbzzHZq/mTz7L55T1G5m4PLmF0nzVPAwsoKt3Ah
	L01TFjm/Mfb0lZaRxQVk/5HI3mkPuq0Nv4On1Py7WXYLtHhKjwGMYNHnwfUaWlXHfxty/4CQcjh
	IujoSerQIMEN5Sj5qjidipNYpVH/1YMpp6xSXRovH2jDGMOXo4Nu5MvkrbMXOWJvCfKdUYuIMIR
	nHNoeQUlpS
X-Received: by 2002:a05:6102:9d4:b0:602:9a1b:ce47 with SMTP id ada2fe7eead31-602aeac9142mr5294356137.5.1774275577132;
        Mon, 23 Mar 2026 07:19:37 -0700 (PDT)
X-Received: by 2002:a05:6102:9d4:b0:602:9a1b:ce47 with SMTP id ada2fe7eead31-602aeac9142mr5294337137.5.1774275576603;
        Mon, 23 Mar 2026 07:19:36 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a297sm30222101f8f.37.2026.03.23.07.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:19:35 -0700 (PDT)
Message-ID: <2d1d6fd3-b34b-4eea-a4b7-0085a6a7342e@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 15:19:34 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-3-gaurav.kohli@oss.qualcomm.com>
 <20260128-whispering-caracal-of-respect-a26638@quoll>
 <36706481-2549-4716-8e6d-0e4db42591a2@oss.qualcomm.com>
 <546faeda-d896-403c-a449-5c9b0cd7159e@kernel.org>
 <17474333-bb82-49d7-bc04-45ab21095c38@oss.qualcomm.com>
 <ae4c1f7e-8f4c-4ce0-a6b8-bab29984e693@kernel.org>
 <c6136314-5bdf-466b-b19e-43062fb11150@oss.qualcomm.com>
 <e6679f94-2648-4d35-80cf-d3f823f9dad3@kernel.org>
 <4f815a0f-a815-4b77-a4cf-a4b18e776eab@oss.qualcomm.com>
 <95142608-b5b1-43a4-b8b6-38e658275f30@kernel.org>
 <abhgxF1RcAJD-cK9@mai.linaro.org>
 <3922012f-25e6-4b75-9183-f9277ef5d040@oss.qualcomm.com>
 <74f59ef0-ead7-483f-a80e-a3da2f6ebcdb@oss.qualcomm.com>
 <909009ab-53fe-4b20-ad2c-bc8eac9e8bc1@oss.qualcomm.com>
 <7e50100a-514f-4f73-a976-9858ce5cc0e1@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <7e50100a-514f-4f73-a976-9858ce5cc0e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c14bfa cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=DL43HRGuj61veDmeUBAA:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: UMEQ8vdDEDrI26h_i0E9hsg4Ir6csU58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExMCBTYWx0ZWRfX+eB/Pb4CxVIF
 uNYpkkKtXFtbhz+Twz6y4kHHekw2EsMk3pd4zLeVUuhIH8AqcrF50wP6OEKXvhFsEY6Y7FuzrYJ
 F0fS7v8n6NFMkKin4z3KM0EivJq+oWLsPA/Y9GxS6lwokmo6LcsctWD1MSv7GjvkB2BsfjbPTdA
 VVWON29zzjp1jOUwe6dSbI/MWW70nL5FkpubLfWQY0hZbuinrF7S0VD0WCPvBQeFW0OFEGpVwzt
 5FUB1YsmpH00Xru0z+Bm2ph7I0D9sgIbmHJOIsKWz9iv3WDGyZhsXNASXJsnc0Gz/H2JFSewJWT
 TsbZBKGMDyqc8g+q1sZbwQv90qlkA5IzfIiacLBejy5GuIyk3covjGB7pvnh7e38JIS39c+DKXp
 OV+61dD4HZC9cCDVm2bNLJWB2ZMJxlxHSl2us7hhXD19iQ/voBsquyUfVODAUpW03NzMnEUuoug
 mlun5RKuHlVqDmmZmKw==
X-Proofpoint-ORIG-GUID: UMEQ8vdDEDrI26h_i0E9hsg4Ir6csU58
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230110

On 3/23/26 13:29, Konrad Dybcio wrote:
> On 3/21/26 10:00 AM, Daniel Lezcano wrote:
>> 
>> Hi Konrad,

[ ... ]

> My specific suggestion is to _not_ spawn an additional node, since
> all of this logic relates to the behavior of the (e.g.) CDSP, which
> already has its own node

Got it thanks !

+1
