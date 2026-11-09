Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242955;
	b=XCYHGhHDdhVaQ0BWP5Wfj8oC3S6kmayNxerYTPe1HscXFN61qa7Ml1baEYMBu4Zxqny9
	 bConP0zAB5RPzSp4xBo4pB2vO0Az1sy0JX6i8qRhyKzBVz8SWOzpNvOhv513J1/YASyfS
	 CzETbVS1VMENrgeXZ69kyyBzu72AE+tmE1HGiZX0Ry/vKvriSAKOantXO+dWKD3q+9JSj
	 cM6xpof7Sr32/VbQuC2mE5q++1yHa+V4GqVaa6QcuF7bYe6xqIIiXT4EIqE0xAJiob1zK
	 EWQpXjgGxxSOMV2rkQqdb7GCjGrqedyJqV7KTCGdLV9MnCLVxiFsd9j24lVgYtHIkmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=c6AwzobJV0fUKMq6G3UDWz5i4sFBbBdzjNX7/+61mUM=;
	b=QUt5jftVBzH0CgcHNuYDoVPYsYZhuUMSCSsXR68OUcqoIM8z3oUiGvl0jL7kFMZ3d2iZ
	 US58KRLC4p9eVh/FwcZnrZTHNkglV4Vqm4nzFrvmgFbnnEa2veqFH7ZcYvWyTfVO2gLvA
	 Mr0K8+Wn2tQ3HrhRKhj02boaCeW+sN8fWozyb3cHPJi2fbNwWSADrivJFu8i+TgRru1Xh
	 5RE7apeULRbCJNgdTXKwkjxSy1G3NiabsTzYCEuv9PVDMpfSUVkfmbcwSYzm/tjYsAucX
	 o/NvdAX4oLYvZOgUldvVxZYktzDn0rWI1VFhfx8SUfjb0FgdRqK4kILZ2BQ0E6B41sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PM1ywSq6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fMqn+YDH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5AB606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 16:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D5AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PM1ywSq6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fMqn+YDH
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFRbp3589068
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 16:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c6AwzobJV0fUKMq6G3UDWz5i
	4sFBbBdzjNX7/+61mUM=; b=PM1ywSq64LIJCiN33Mkf6Gy+Se0GF2jAVzVOUGKV
	PssnunQe71GlRO6iDyxNIYQab5Z9HK1qtiLpwtjDnkEr5SIOSkRgqmJhVIKAN3Lp
	h0bJs2tCL/PjUdmr7C8gtJiCsk/UVUSXmPbz/0TfxKbsUsQQozGadM8u3wE1tmFf
	uWk9RbrINkF/qY5OpdxICArsIhmCIqYL3EWoFUDOgEB+hmwN9jvCFRROkOJTa+nP
	nI9tg7VG74C9AZVwxoidR9dH89CCmEA5EfZJm06CLYW7bMh+FUiA44ChNuZRl9Zm
	KVszE/9JxkwG3WEMKnbL9nj6dguLvx6XJBV7IFjaQju79Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj94h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 16:49:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso842087241.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794242953; x=1794847753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c6AwzobJV0fUKMq6G3UDWz5i4sFBbBdzjNX7/+61mUM=;
        b=fMqn+YDHCfdcX154sY2wAqcVBcSToEyO7YoCJP2BJ1Z3oZ9s6qRmnrLL4HmKiRB2Wg
         GOmnOKnEdr0OTAKrIzRmMpjsVFj3AsRYiIy1AE1rp9fDaLeio3wglPMicG1eOBbCBB4f
         9lCZcofcac3GJeBpDWHbkILSbqXcBhDAdqOM07R2YIbzzToQxKF16s82Ys+268Nqv9jU
         IIGcDAvWBaRrW8koNvX5ez/92nRLO09g8cUBNn5FiGgs4DtMYZMCg85OOvxiOEtvzfa0
         sYID8nBMS5uBtc9BoHEgVVY5VtakLahl1BmNoB39lx9QK1O/QADkqXUxniU4JeyDkb6T
         i+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242953; x=1794847753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6AwzobJV0fUKMq6G3UDWz5i4sFBbBdzjNX7/+61mUM=;
        b=zTPmkdvH36vs4fToxNEPozu+mDn2FwM8sNXAEnGwSDRryeqC9/jEyfeO/vpLk1M3cG
         cfOXV+fyYNgGy4r6t6FQIN0NYEDwGG7X51J24ygFsqF+NZEoD/N8dUS6Xr9Wer6pqwiH
         s16PmqzHzrt3MjrPevithoXWGEh5ix7Z6k8TzNJvPly9vOLK94uT4zQMYPoXSEL7T79c
         kGF3L816zsrFaSrwQfwEq4l+RPUEzEPvVwqPoWI15sd3tWYflM1zxM825VMNsN6ZF9fE
         ide8Kd0x4qISjizqnxV5vfkfzHA/Uo5UqHlhi893HZdTxIjERznq9E78bDe/x8fAn0tf
         5RvA==
X-Forwarded-Encrypted: i=1; AL+hErH0zjhpWkgpuplBBG9uT2hIDaVIaNOlUmB51y0q0r40mo8PkXx7S6YMlXeSE4OAYhoLtsHoIL84YHOs@vger.kernel.org
X-Gm-Message-State: APuU4Z9cydIC9S+8KG+iOwkvNXU12Pvkyw7JRUnX4B5EhNMPYgOARHKd
	LFbUr0RrKtzbvH1r/CcrnpERgJCFDQfVXnooFSkPpIdqiyqhMtf1LrAwChr5t6TC+C11drrtd7o
	mXtM1VUb/FtKoI+g9R3WEpy1LYZSAnjTOIP2L5ROCALOfduenoRbRSz8PfJyWRwRX
X-Gm-Gg: AYBFou2SG7J/Q5fktvNZ+i8Xjr6KmtDufqDvXAaD0N860hnqdpT/s3KvLXp+G+NCbts
	YSfAAV1xakgBW5JxTN/Ps8pttU9yP1xk5Hq8JTvwSCEhsmMF+tORzU+Tor+Sv70Amqr7wM1LBht
	zZlhL0PDVpdZ62QcR++cXLOheEPoSyZ5LJPl1D7fAHGFVBmX5woqdB9Uhu6aQ98G6eEDUCWcF2g
	cKLz82GlMMjszK32fENEWCALnQQhcuNwr+LxLwXE6+vrkl/p72X9x2KYspctbrZ5ZXheWNLoY8V
	+dh9deMDZnMhWnWRXipmWUIciJpPvNauQotDbGDSKKePWRHtEQmgaC8H5ACWZ1hQbvZegnvIugR
	zz7q2I/rd0z5UozfQ2Zh6CN1t4/jqNBeTdOFMyvzy6Jq+NsCyqU5YMJ2FhCmeY6g=
X-Received: by 2002:a05:6102:e0c:b0:7d2:c786:5a98 with SMTP id ada2fe7eead31-7d2db07fba3mr1589434137.8.1794242952571;
        Mon, 09 Nov 2026 08:49:12 -0800 (PST)
X-Received: by 2002:a05:6102:e0c:b0:7d2:c786:5a98 with SMTP id ada2fe7eead31-7d2db07fba3mr1589408137.8.1794242951891;
        Mon, 09 Nov 2026 08:49:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d8edf1sm2348025e9.5.2026.11.09.08.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:49:10 -0800 (PST)
Date: Mon, 9 Nov 2026 18:49:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Fix
 LDO voltages
Message-ID: <gfwbr3yicasc2yrmh3xrabiuxfhrrt22m7xpjckqpv33k3pjr6@sot7sdzzufe7>
References: <20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com>
 <bcea16ba-019f-4fbe-bc70-9f9a29461a30@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcea16ba-019f-4fbe-bc70-9f9a29461a30@oss.qualcomm.com>
X-Proofpoint-GUID: _Xnn2koyos6Mp2wgvxyOUDKENYJLR4Aa
X-Proofpoint-ORIG-GUID: _Xnn2koyos6Mp2wgvxyOUDKENYJLR4Aa
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1f989 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5gVVVXgHm4f7vdZG38cA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX6b9QPn8/MXq5
 gxBU/B8F34q8zL5Y2eYyF8iDX+21PKtyuigBlnncId0jw9aYtIcbgdmaHmR4d6ufjdxQUGppj0M
 5ZD5OAi98yMY/dUoHfFWaurgjN3PeX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2NiBTYWx0ZWRfX98BJePpy59pZ
 G0O9oWe4ORg3qhmuvHJxEzeSCDaBmATaVhAO7EWYQd45Bs8PJLWuQASdvN8Ej7Hf9ES3VEISjCm
 3YFZQsUBd/aqsfM8vm/azRv9ieSIYGKfw9DKfqaSWCOOMaqrenKwm8G7KxvSke3CHlcMQ9qYc+o
 BrA8NC6TtlqvRcCbDSBC7ajB85rNCi5uaGU3PE321UTfTVjrEvKwm1lPv4Zw0KWmCR8sxfuASVl
 pfVBSq/T9Xv35WXa2A3HjsE31LFGrjhXPCQvPg+Pj/ItNP1/5vUj1DJgy6WX0K/O/I9qqPQ2rRr
 g+NuRBoCcYchKFxnT8x/lWI+GxfyBL3Sr1J1dMsiD3VjxO6oH3e8c6mlh0Ycs6n/2Mc02CSJ9PS
 uzv3ZQPO1zlrULPsq7LVB/t0gqlC6VvL5yWnjP7RPoeZmNFFHIxD8keGv4mSmYc+zfNGDn8Az0t
 DxvBGSHw4C96O8iAjNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090066

On 26-11-09 14:38:10, Konrad Dybcio wrote:
> On 11/8/26 10:01 PM, Abel Vesa wrote:
> > Several LDO voltages do not match what the firmware votes for the
> > consumers of these rails (the PMICVREGVOTE entries in the ACPI tables)
> > nor the schematics:
> > 
> >   L1C E1: 0.832V -> 0.912V (PCIe4/PCIe6 PHYs)
> >   L2C E1: 1.144V -> 1.2V
> >   L4C E1: 0.72V  -> 0.912V (eUSB2 PHY of the third USB controller)
> >   L1F E1: 0.88V  -> 0.904V
> >   L2F E1: 0.904V -> 0.88V  (the L1F and L2F E1 values were swapped)
> >   L2H E0: 0.832V -> 0.88V  (HS and multiport USB PHYs)
> >   L7B E0: 2.79V  -> 3.072V (eUSB2 repeaters)
> > 
> > Fix them and rename the labels to match.
> > 
> > Fixes: 300f5c59beb2 ("arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> Merging the power grid consolidation will fix these too and I'm
> hoping Bjorn is eyeing that one, as I would really hate having to
> rebase it..

Sounds good to me.

Bjorn, please take the following patchset instead:

https://lore.kernel.org/all/20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com/
