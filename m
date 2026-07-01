Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D45B2FD694
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908778; cv=none; b=rpZ/+qmAYPa5xKB0Lu5ZlcjbLP0FePnSq2yaMEgLnFdXyQFPGzjVRoKIA/pEZM1EAfPVS2IeXNlcMn5Co+SwxW3vSrMpNM/qocEqMTYQYWusYLtkthJ3Qu/BlVrP0QbXXL3ftaxLrvXlk9yD+qRuLnFYQERjdDdFRv1jj5VyPmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908778; c=relaxed/simple;
	bh=g++P9wP4ThEeg1nB+znYtKhHWwVaNlLTV3Vj96WrnXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAZPB2MwnUMPiQrDTfpS10GCZ6gpsL8Dxnk/CrSpDEUlmO3fySw0Fl/cTTTSmqjdlORaMKadGZ4pwq4nr0hJW4o/o8eVEE+P8O7QV7ws94KcXbWG9HOH7ZQHqylBYDhIptNuRZhdbKEAsuDuMXbsKtx3k5VCdeh/LyNTI2lhn38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EybAWa1H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNx6v9T5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EybAWa1H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNx6v9T5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8WxP761663
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 12:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bLyvR5zrom5hP51Zq11DZwCL/QGJ5wMO0HKgH08RYcY=; b=EybAWa1HHO7Qk+HW
	Tg7MSdu/tn2vaDJZNNjGGrc7LcgK6ZSxkOPFxgzNv/Nx1le3tsGZn1Lye71yZWXu
	cdoZf9rFOJ3Pm3d0lNuKE1d+pxXGs+6/L5zJr+P9m0lWbATADjRaRS23mN0/OafY
	gRJrA0rTAVML3xu1Ww02MASUhS/Yxehwp2h3oTMmVwOzVZjxkrLDmE4EwzIGzV/+
	wwXJ4ukkhiQXlDL1TT7U2pitwTgBSmMHySJmq9dttEroQ0/Jqj/AOpalvgtJzxKJ
	g0/y54Xg5NPkGxqmMA1ScbR1QG79hNwuARxW3YHQiqxYFXu3jC77Kn062PxZn1gA
	oR9Zxw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw40wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 12:26:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c27616421so776711cf.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782908776; x=1783513576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLyvR5zrom5hP51Zq11DZwCL/QGJ5wMO0HKgH08RYcY=;
        b=kNx6v9T5yOkioQlN72SRRfjhLmjcduimlH5tnYUAfFdQ9uIELS5AQL45f6zn3mEe/s
         uoeUhELYNGEoAo1fT8BitTXG/a9VF9NqoYDzvIi+zWHTun7GLxcXrIc9Edl3ctYhg7OK
         jwD0AA2IdI5kZk6ELf8FHVMc6qv2BoDbf52rtzq/JgCsa9WS5o+ugvPVX5c2hPzj2jm6
         rB9p38B+FmKsrISoRBMGPfFfmjB3aieP8Y7hDSMFI9lZLjY3++1hw0+K6OInCHJkqpBG
         GbLXNnkXK+FRLPfjZ/KjWHVx1+hJSIA+x0I0jMx7OUYgVoNm9AVVKGEnp4RDDY0S+cvK
         Vgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782908776; x=1783513576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLyvR5zrom5hP51Zq11DZwCL/QGJ5wMO0HKgH08RYcY=;
        b=g3Onfl46kLMELujTZasUIn7Is9S/s3bTcsHIFti/Qu2yAaTTwMQ6APGwebNa1cgI0b
         yufAhcfPKOIUbv4cG+UYooorGqVDQzY5ZCX3rWklBZIwKAkX5BtukeFQ5UNFg5ZJSyh/
         Sbngknruh7IwCmLyti7+BUrPdFA0B4T0M4wApc5Yx9CwZT9EgkisYlSt9u1ORJ5fetWf
         tyCHfbVDhhoNGeRkXLDdDgu9uj1taW1x61fvxa8zCWKKjXE8yYfGa9Ak1dpdYGCWeRqW
         t7pxesbNfAwXMC0QeLPBPFH9XUj9kg1t/W0ju3lnb7DJ8ZvMfY3NJt4Z5Dzf5qFA+D6g
         ehgA==
X-Forwarded-Encrypted: i=1; AFNElJ+ptxm0wUCotphsQ/zFawUS9XlcsqeJx93OAuf3CEWNfy8i5O2EUCzV5aZHc2camTjG2b1CoBcIb5X9@vger.kernel.org
X-Gm-Message-State: AOJu0YxjclFw7G0GBgCcJAeTxEKCbeW+onqWujrP75rQAsaeW3wc9C4v
	alYmfRvPETfnfv4ghBQ/ErKI1UgVeiIs+m8jQ49BDYCcSmtM1U6xjA+QGH/JU6z0PAfFzIeIjJK
	O9SE/czcPhtxz5XWioHutR2GoCXroRR8cKOrFSi4vNn8IQEsJIjPbhxXLfzxdKfdS
X-Gm-Gg: AfdE7cmMqd1YXL/79J3xtIM6L/l03KkvBKcjNZRmnKIBd911MytaanD2v9/bl6N0ICM
	bLVEtbrV3RW6naL06nyPLNpjTt7auWxhGhNRsdNfT5CBCKqweug8cZ5qKWg936tMGaUeluUnFnN
	ScYhmasF22+pLwejgC3hCghOkk0zXaHszWZa7EYieHcmjOpjUV7doTRnJOE8ci8rk88eJnXtLdn
	3ybhg5sf70KS2WKaLGPUjPaxOU7O0Kl+8yb9n7kp7hsyfao6c8UrzGUC14PC/qep7naHDN5EzBI
	wzbpizpFHwxoM6QxWa0B+4WtCRsMdnLvuOCg4eOjLxl5Mh7vpxbAmEkaDhz10Joo1/DeWHkKwxv
	aDQ0/cFzz7PkrSSmEff5uLEx9bOBMIcjaraI=
X-Received: by 2002:ac8:5f13:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c2693f7acmr12609691cf.0.1782908775826;
        Wed, 01 Jul 2026 05:26:15 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c2693f7acmr12609301cf.0.1782908775301;
        Wed, 01 Jul 2026 05:26:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1289178a18sm266058866b.57.2026.07.01.05.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 05:26:14 -0700 (PDT)
Message-ID: <174009b9-8be6-48e0-847f-a85c224fb817@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 14:26:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
 <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
 <0e7a5719-9271-498c-bc0d-5fa76341ede7@oss.qualcomm.com>
 <20260629122248.yb5fe7rifdoowpfl@hu-mojha-hyd.qualcomm.com>
 <b7d6e7dd-afd6-4ca9-bc54-4533de6b663e@oss.qualcomm.com>
 <20260630063037.k47sbwf26l4fi5gu@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630063037.k47sbwf26l4fi5gu@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a450768 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NxiBK8CvgdjxvVHj4DcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: km8A2_cCVGCgsWQ70v_6oPDr7EWCCAaN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzMSBTYWx0ZWRfX1w5wslyuWm5A
 1X5SCefl24nSs0q3VJyudJYw6LJDbaQltkPubA24wNBFSpS7fHn2eZ0j90nIQ8PcTxw+ytLVdX9
 DagJtHSD/vB/+XgdI6zjcjZKFImrR7w=
X-Proofpoint-GUID: km8A2_cCVGCgsWQ70v_6oPDr7EWCCAaN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzMSBTYWx0ZWRfXwt88aC49Zw8+
 AQ8dAxPnmgyRZBeykTUfZwk2drmyRNVZu1gSDRn07+pvR7fi/l4Ep8PFal7LkhMytlsVS+MpS8i
 5eWCOo9T7nOYUSjINhz4pJRdbps//iu9JjGYgMCgfDWi5kg2PnNLiHFWZ+/T9lLluv+g3lOU9zn
 lVQ+Q7b0Mgbph72XCCxns0UsgCkoeGR+eig69oKmImeB/d5iW4FZUQBiOWjv4f5332k5+QJaaLJ
 QRZH/2D5iOk5Vq/4lft1Uu/AP7LkbrIr/0uYveLMRXATyf2NLfJ/aV76HId6IGBgKzQgXmy4MNm
 XiU5KUffmk3fWu3neufDI0VUtzIBFioCfhvx44DO7Qe5zLQg3KjxOXsOZbbGh7qFvnn0PCyOwX5
 rQ/J7DeGcKojnUQ6a8pCf0FhqG6oH/WjU5tNSqIkUYJMk2gAE37NDe80K2wXiWeYsoijthorfg9
 eTfH4PNR+aQf7q/bcTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010131

On 6/30/26 8:30 AM, Mukesh Ojha wrote:
> On Mon, Jun 29, 2026 at 04:08:26PM +0200, Konrad Dybcio wrote:
>> On 6/29/26 2:22 PM, Mukesh Ojha wrote:
>>> On Mon, Jun 29, 2026 at 01:36:34PM +0200, Konrad Dybcio wrote:
>>>> On 6/25/26 3:14 AM, Miaoqing Pan wrote:
>>>>>
>>>>>
>>>>> On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
>>>>>> All the existing variants Kodiak boards are using Gunyah hypervisor
>>>>>> which means that, so far, Linux-based OS could only boot in EL1 on those
>>>>>> devices.  However, it is possible for us to boot Linux at EL2 on these
>>>>>> devices [1].
>>>>
>>>> [...]
>>>>
>>>>> Is it necessary to redefine |wlan_ce_mem|? Can we consider updating |qcs6490-rb3gen2.dts|?
>>>>> I have verified that with the following changes, *NON-KVM works fine*, and |wlan_ce_mem| is only used by the WCN6750 firmware.
>>>>
>>>> Is there a good reason non-chrome devices never defined that region in
>>>> the first place?
>>>
>>> This region is needed by WPSS and non-Chrome (Gunyah) has IOMMU
>>> control, maps it for WPSS during boot up while Linux at EL2 needs
>>> to map it for WPSS in Gunyah's absence.
>>
>> Right, I'm asking about it usefulness on devices *with* Gunyah
> 
> Ideally, it does not need to be mentioned in the OS device tree when
> Gunyah is present as there is no user in OS..

But it's also reserved (in the UEFI map), right?

Konrad
