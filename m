Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098174;
	b=KTyZ5N2SJjRhnvW+Nkpkp1px4+OMHdHF8apqII2j5/+xAOlFqexCwz8na2MMS8jhy0Ta
	 bA/fGcAeHVfe+1e2ZUgRuAodtT4hHnPQGHJCOguE7OY936FYg75yjGRxN5nRjQGY75OLA
	 uZejMWmfF1IsVS1n7ChQ3b2UlsHDjFp/qzxJHfIYKJlOKaldN/T/CIwzD5hufRTqWBrVG
	 mM4gJVwUDg8cx3BkpuKCnrXyHaPIv6MTEeVvZSChlkHs2Bk+AG6rn7s345lMvwNWLXEfN
	 dR8fvR3SSrKuPt7RTZzDkSDaXPl063U5q0X3jjWMVPhw28hLICm1A49byY0/UWtpItQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098174;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k5tGmvbUJ2op+8nhPcyTDEVrgBH/N8qAtJfXgf1NHn4=;
	b=iqQ2S2QI37RjXKTLDgCMAogBqrctxcZj6GLaszSjdXePA8bgzrsvBtedc7VVLiHDWH2T
	 uIPcIRXkB8cXoBSiczi1Ei6CuwSqM9gZ9wKeAnwVmjjRyIn/iMoxZ339+H5vZ1yWsUjT1
	 TXU2vHBI4PURJCGuW9nK3Yz4Fm/t7mExy/tZSm7SRXjBvNrUwDrS/59hVWZQIaG/v08nQ
	 /08o4QVEKZ+BvjhuIo+aM0nphy4tETC46pavgToOf0oLHWHM8D/D04uREOMfUqyBmAj1a
	 KEj3biLc46DbetAdjC+QZOF1/7mSbEbOvcFkacv70H4n3HhFAlB8/oIXiI1SQ4qblsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0Y8JYGd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KoB7iIMz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A67A606A324
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A67A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0Y8JYGd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KoB7iIMz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeSp5895437
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5tGmvbUJ2op+8nhPcyTDEVrgBH/N8qAtJfXgf1NHn4=; b=g0Y8JYGd4Gq3paKq
	f2ixC2P0SWWVpBU9vHSGH9+1X5Z9ogQsqsrQdnW/bCs1YL6b07UaTm4ADDZae4d5
	7VgGadjp6T60ugbFKHAhJzDFoutjzc/WCbjqGL+q8apJlsXcAvF8JeWpyUYU7FVr
	KuIoSevxpeKxOXaaKaJvj5UJonbqhSrKL3XEqJscW3t1rFBvcVLrz2IewgbH7GPD
	JCizz23DjD/MDfAigqfL6pNlCvoTKRn91Z3o8QwMXpAh8bMLLjPDxOqEXJIB9SuC
	aB906McLIHrrgxA7/itSyUPEj53We1mgVeOhzwjJzLfo6C93+I945da+RVH4dt1Z
	/XmkVA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smv2wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:49:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5356c6d98cbso13780981cf.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098172; x=1793702972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5tGmvbUJ2op+8nhPcyTDEVrgBH/N8qAtJfXgf1NHn4=;
        b=KoB7iIMzv+LKYWLN7yRyZS5VOvFdIEwHT5p9o4iZoLk7W+mVAIyogLgQ9A6qhssuQL
         3V+PcitsqMzSjp4iyt37f1wSvl8pwkTxXCUYANAFXSckwfxmCda5gh1HywzhbeZnO9rX
         J2FEyzCeDVTStN4+3568P3IWZZbWaKu0YR8ZQP8CBQj4LeptmEY7TxJAFZIE+yUxIatd
         u09GiE8TxFQOszCWxYRJ+nmtniAuo8XSIx2hvK5340CAN0YAFKDRSF/Fhzds0DL4RQJ4
         RQQ2OQpr2kPodebMbRffIPx0VU6gj5JvOKL8xvtZQ/uygVZX0SFRcUJAVqFruZxMWVM7
         YppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098172; x=1793702972;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5tGmvbUJ2op+8nhPcyTDEVrgBH/N8qAtJfXgf1NHn4=;
        b=RqmGJ1bJVSzWCNgo7p+A+qDUJjGtERjq3yX0K8OHbICLvnLo2nx6odQTXx56Wwg9Fg
         /WTHG2GJoQJ/a2kAZiDBf7CeZpAYvwWzzZjm5NVKQNG2lNPdZ26eB8RiZlLxU2SWHJWm
         KxQWfScKCr4SONIz0G7k+CnaY9wYij1T8ZFMFjxGMC+/Gsk3aOfthAXWuoTt4/TOiWwr
         fqcfpC/ZBPnXnTRvOjckFAFsu6viJU+TtaxkQdSDyKQSCpQ4ugx7MAjbsfbTuiXYyLTH
         SEr6iYI+efyQBZXzCL0Gho9XA1Ig6JSdM4vWdEiwhzqo+AHyghB5RH52h1oR2u596XI+
         r6xw==
X-Forwarded-Encrypted: i=1; AKwUvBySKJIj4QOo8V8+2XlaqCwWibBRMyo7uDIjUJwbx4vn3TK/n5LKQJhDjpemSQvy03uy9PYHCUw86hYA@vger.kernel.org
X-Gm-Message-State: AFq9FYLHNzwbET+1uo1QzjbeEeBvBo1QTzzaDjUOuMTM9xYQtV4Le+ny
	AU7H/PHBmo+ilh/yUM0azwa//U/Jj55/9unZRjJeImuQ+6IZT5lX//V1WYdXV5lr7DozhCs/1oq
	vi+VISaphuJyWZBTVgqe3DNx7pdinCQAnJ4Dk2QGNAIuNqAcai5NX4gt6FNJRFn9U
X-Gm-Gg: AYBFou02qfjEfNy+tbin4AdIxTYMA+PPZxqDBjbH0xCqSeNQHIdNB6MeeEupau5mjeL
	kkjuIavoxwXrop3/1oGdyaPxIxnUYWLBGYzUop+RWLsD7mWBQ57M79XaD/rqrdZS6iGbsBY2lAU
	XqiZYbZ7P7RDiqn0tptMX4XHjrhBdqGjlVi0zmMb5T+viB5/OhJHLpiD6V5hfJ4HVM5OiaobZKY
	rnWC1zDWFM4q1MHsoarp3OVhWhxPw1jt6QtpwmiMlk92N35nWr3hrEagsJ+NL8PYA+mpoZKRJvN
	b+oNPtM6wTbOBXuzcjdYCF76qq7QbyuiWnDYFCf7aCSTbl/tVEWVWqWIhejet8SHvjCHaIpkeRT
	RyF7MYUpBCn0wzfta0VZDpw==
X-Received: by 2002:a05:622a:e309:20b0:536:3519:de44 with SMTP id d75a77b69052e-5383b6426e3mr146321911cf.4.1793098172304;
        Tue, 27 Oct 2026 03:49:32 -0700 (PDT)
X-Received: by 2002:a05:622a:e309:20b0:536:3519:de44 with SMTP id d75a77b69052e-5383b6426e3mr146321851cf.4.1793098171923;
        Tue, 27 Oct 2026 03:49:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd77e1e9sm429781566b.67.2026.10.27.03.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:49:31 -0700 (PDT)
Message-ID: <665b6014-f9df-4582-a682-e825dbb1ca4d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:49:29 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
To: Jeff Roach <jeff.roach0@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261026154001.9323-1-jeff.roach0@gmail.com>
 <20261026154001.9323-3-jeff.roach0@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026154001.9323-3-jeff.roach0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CTUtj1krw1FHeP7WonobK0M-Idy42G9F
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae081bd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qQh0c9Rk1agPjm9wVCwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: CTUtj1krw1FHeP7WonobK0M-Idy42G9F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfX2W05G/nL3qKe
 4omM+qrCeEijqX5Ct046Z7oLAvYYd5rYaQh/SHSngumLFRTq8HbuhW/vUMVIBRrSE7sMZsK5Tgr
 4JPYHJ3prfCBTADb74W3eoYnS9yT+Qg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfX0QbYmmzXKpK2
 Xgg37u0yCmZpqzp3Vq3K5IT+l4GfX8fl6xxATtVvJ1eCoC8xPPqAoN45DfMqJDxcfb99Lnanrj9
 iN6Svfdg4WccYYvnR5yvNJL/u+iWPyu5GOCFb3/md/19tNQNC1oNhTP+lMjGoj7/ZYH1kl4Dt56
 NwkflqY/252LKqIsiYrs9iLfR2wuIsyyNOvBLD+GtCckg74xjbDgYVUGxJlm3Kc59oL47Lq7sG2
 Pp+7/WlPjdxvWYEmoGNbD2Se/zNCKvCwYMoIUXEVa7oW2P43JfGV5t5SDCIsMvdgs/WaSujtTqS
 GSL0aiKn8wz5W5LfvvHUHeQBBqvuVaZ/53z9NItKK27z9RzZG1cUWWSBctZXOkBA8/axGtEtD2O
 NXvx1/xhpHvi2jwtRfIFQIzUIw4au/Qk+aro7aKVRbek6+pRI6MKwAt38LxUldUMVj+9GVRFCRu
 77dQiWKSm5xs+7pdfEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270042

On 10/26/26 4:40 PM, Jeff Roach wrote:
> Add a device tree for the HP OmniBook X 16-cp1 laptop, based on the
> Qualcomm Mahua (Snapdragon X2 Elite, 12 cores) SoC.
> 
> Supported and tested:
> - Keyboard, touchpad and touchscreen over I2C HID
> - Lid switch
> - NVMe SSD (PCIe 5)
> - Qualcomm QCC2072 Wi-Fi (PCIe 4, M.2 key E slot)
> - Two USB-C ports with orientation switching, USB PD and battery
>   reporting through pmic-glink
> - USB-A port (usb_2)
> - Webcam on the internal USB 2.0 host
> - eDP OLED panel with DP AUX backlight
> - DisplayPort alt mode on both USB-C ports
> - ADSP and CDSP remoteprocs
> - Two speakers (WSA8845) and two digital microphones
> 
> The GPU is left disabled until Mahua's Adreno X2-85 is supported.
> 
> This device tree was written with the help of an AI coding assistant
> (Claude), starting from glymur-hp-elitebook-x-g2q.dts and the laptop's
> ACPI tables. I reviewed it and tested every feature listed above on the
> laptop.

I hope you asked the agent to go through the regulator settings!

Konrad
