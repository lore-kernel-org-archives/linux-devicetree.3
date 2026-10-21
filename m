Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573074;
	b=CEeY18xB1EbhtSAgH3amqCJR6QGcWRVA+UKkc+bbSOssifkHlSocPCZyNhxjITyt9Pp3
	 JcInzANE6IiUh30RxK0o1WAsNEOmrJZ3U5+GLj5p3WglrzmfphN+Sb6IYRq/tkp3gSe02
	 LfFqUXB17mVjDgeBZhjF6EScXxoeos5Km4QWuYOgdzBxvQ8p6gVtlion7gnHmvBoSMg/x
	 Xun0EhOumigbeLAMJz3NegH1Lqd0Zb1JGZqupYyOK8gFc86lJrtWKLHLmdyzDtrBjGhjl
	 nCO1AV8T1D8Pg2GSyQKjh5C1+CLTd40Fg7E7YdIpfRceT7FhxVGeftH2Hm0+BmLx2jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tSbUl6g1KEN/r5qj9L9Ad63cAJqZB7l4QVyz0bWrOQk=;
	b=19q0rARED88SMIJ3o28eyYRv72FqWk75sqNGzx/1zO5HYlcUSECHakWKjhx5J0Vp6xTX
	 NQd+/oWslGqOT2bSMzGqaL09dZWG6bADa4UEKXbhz4EPRhPfBqlYx0kM6LaOFDwF75ERw
	 VQcp+PUHu4UfGJ2VzQruw+iAm7busczytf8MyRzkMp4ME6bLlGN+R69QQXgmVZs/NLvJx
	 xoT6a95IqN/V0KmxMQvkFHxaSWZx7UtgOj+QYHy0q9ngEeOdJXgGIrw5ahapvxWHeYf2v
	 8OcqNuroKUH75PQMxgS+zxuJ1LTxyE1eSfDyg2aP20LYFmGkCS/KN19Db7J5lvqj1lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJgLUL0l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EcuKOeG8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BE6606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89BE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJgLUL0l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EcuKOeG8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j6R0793360
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSbUl6g1KEN/r5qj9L9Ad63cAJqZB7l4QVyz0bWrOQk=; b=OJgLUL0lZzDQy1/4
	zf713iFJ8apkpA2+yOO1loGARBBzJoeXZ6DLtEkYwK0ck20lrOH1OZQL8JNGiOTA
	Ezan32mStR8xqHcFxU+gmORjcffeOCQE8uVEwTAUBbdtG+gfqrKEC3Y+3RXqE94q
	l+7hvgF6t4HeW21rr3Tr7c2rF2WKlHkJCNxr0jsoq9VVTmWrkeovQVHG4uOYiu4r
	Hnn0ehj+Q3s+CWltTyq4tcfX28+N7E8bn8YOmdBDreQrI5xd53ASchmpC3uCCzWR
	sX0hbj3n9m4Xej2noCJZD1HEt17cU6unOzqn3vQdpSCKShPkDF/KkL1sT/4pEUCT
	ERjJoQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabk58r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:57:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so1905735eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573073; x=1793177873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSbUl6g1KEN/r5qj9L9Ad63cAJqZB7l4QVyz0bWrOQk=;
        b=EcuKOeG8hTfLo3Z4JZEXv6HSNxmfcyY+1aRl1l7EMpI+/vnL245XantQyf0zIqMYZC
         H0LlTJY38oh8FnMrwSS4NmjgQgd1hGD16YdUl83WhRGKCgjYKXw5PapbkmZdoBn9kqcw
         EtXV7vKdX2+PebkyMvPBwzY5DRWpoMSnceFQBqSUUNXBojKIKOtlBDnXUp94b0O+C9Gz
         1gLYWmwE+fi2VA5212nsczg1LIaa2O7aIoF8D9ssuiXPdlIqYvaGOdNCHhKqa27+NW23
         0SEAkNVdkw6+bWOgi90m2tEBA5qMJDlRfjBYiUa6R03sWOJNq710s5cGuCrMQ4FFjCp3
         XPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573073; x=1793177873;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSbUl6g1KEN/r5qj9L9Ad63cAJqZB7l4QVyz0bWrOQk=;
        b=zHYqHvXw95hOWKXDEUszxW7uWZ3w+9R8aqw/I2fLtlmO7CdrrxrBjpNbCQ2B5BC0zk
         XOZtX5ABW55YSd7y4Br5416TT+F4ICY0EORZMWL0RUmWehwTuoXsD76HUygzvtA38zy3
         LyaB6mZH51TPT66xhGmz1J8vE4XS/kFBfa4ciQQ8X8n+QjEXPaB8wBwI9htFDi1aW+ib
         qefmmZ6VmTfFU5fZpZSQG+EJlQ2TFam8x4w92q4etNT0qcANXVvZbP8Zitm0w1RUyiQF
         wT1eRmed5N+JJQnN1pINknXDlsdAAIIvIAZDlSkTdieOeCtqqAfgj/Rgf7YYXc4wXUDi
         BmIw==
X-Gm-Message-State: AFq9FYKRlZrALyHtqmdnfIX7+ChqLz5pBmfIfgHb/APuV8TdXFnKi5zk
	d1qQGBzNYPo7X2JjCuJIv+89aMwzd7pP4W7obxKJAN26z8Bt7717x+/v+RhGCtfQlYoS4lejkhh
	IoliiZC6wTGwCUnAI+HpwGdyyWP3/9suSQlm8YZMEfi1T/NeMWCvpC+9F0TUCcb7nJB9Z7Z2b
X-Gm-Gg: AYBFou1U32m1pZvZHeQ2tF7V5ScjTaDddLSE3xOBgIhEj8F76J/qTnyqpGtyHLoSq+N
	pDk5NOL4CRuuPxTvFYNOQPL6/qq1FBd6KtS+SLexdTTmTQqBJk05qjxED6bRUC1UOZrmIopPNnx
	d0fMBaS3n5kQhI89grDPIjlli7JV0IICymc7bIlI9qSqDg1tMlK/w8eJLZC//V6KTbUR9WZQCsz
	CQRxc1Le5WvOuy8GUxCXogVTA1h8CXr0C/AwITM2zU1hntE2gdMqQPjTpX9PhQ72k3bO3GAmZA1
	RrjV8+rsttWLFgMNziu63n3Kpqra3ySonf6h/D6h9Aodnr40vVfLBwWA41m4gcwFLAci6muKuo8
	PYLpMW2j5pA/bC2cDLjj9gokiprF7r8s=
X-Received: by 2002:a05:693c:88c7:20b0:366:846a:e21d with SMTP id 5a478bee46e88-3674ef200d1mr2486973eec.33.1792573072656;
        Wed, 21 Oct 2026 01:57:52 -0700 (PDT)
X-Received: by 2002:a05:693c:88c7:20b0:366:846a:e21d with SMTP id 5a478bee46e88-3674ef200d1mr2486941eec.33.1792573071922;
        Wed, 21 Oct 2026 01:57:51 -0700 (PDT)
Received: from [10.217.223.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed295sm5976131eec.9.2026.10.21.01.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:57:51 -0700 (PDT)
Message-ID: <147d2906-917e-4e77-8447-085a67b84fd8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:27:48 +0530
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
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: lemans: Enable
 lemans-sa8255p-ride board support
To: sashiko-reviews@lists.linux.dev,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
 <sashiko-outbox-172176@kernel.org>
Content-Language: en-US
From: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-172176@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX3jP5QMoj/RFv
 XJrEF7BnW7+nCK0NGN78Mpkatc7REfDz6BF+dNc67V2J5SF+8IdS5VraW8BhuV8KbyneMLciVWA
 rlKrtVzJd6d6KtFM7S5VBYbs/xWZFsY=
X-Proofpoint-ORIG-GUID: dHdHgNJh3DX61nxXyjUOyGeBAvLk3OGV
X-Proofpoint-GUID: dHdHgNJh3DX61nxXyjUOyGeBAvLk3OGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX+LUp514ET0I2
 tlRiJO5esLNXltZ2AKtKNPGDvMHgw7Q3cCYbf6ELSWzbRieUS2gC4Ca3nHn/gJOJ3LQimVEyFbg
 3V9cdUe/eQpP/SMo7U4PWtXrsnmHijVfR9GtwMmkZzS12Y62CU9v/pMYu0RuIaBn+f2PHMjS7RE
 8B+xxdVYQ7KxLQhSUmfJHQV66q1w7lX0B1VAsdfU/BN3j2td4nv4DJzOg0rSmJzBuY4/0poqcKJ
 FP5geFi+XrDnDHHshSXATm1hGg4pMkJfnouRoL6JA2qwe7lKFJsoegQw94kvFDaiiva4RIhjSZ1
 5DDW4qv+KyILQ+ODR6uESgCbq2LQgkDFvA+b4qJuTSiJxvNlnjq/Xc9biRRx/HeCqI9+eNSESyG
 FOfENGopR/0Cv9BGwd0LMkMeGFCCS0njwh/KqUvJ41sejCXf7YPpzKa+uf8lzcCzImuFxrCWkvw
 hhml0C8/bbN//+W8xJg==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad87e91 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=cyixkC-7dOoUwMZJH6MA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210035

Hi,

On 10/15/2026 8:18 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] dts: qcom: missing status = "okay" for pcie0_ep and pcie1_ep
> - [Medium] dts: qcom: incorrect polarity for PCIe EP wake-gpios
> --
> 
> commit 3fa46fe28ef2e9d52dd0b40b57be7d7192538595
> Author: Nikunj Kela <quic_nkela@quicinc.com>
> 
> arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support
> 
> Add initial device tree support for the Lemans SA8255P Ride board. Enable
> UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
> zones for PMM8654AU sensors, and SCMI protocol nodes.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
>> new file mode 100644
>> index 0000000000000..4273f47c3dffc
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
> 
> [ ... ]
> 
>> +&pcie0_ep {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
>> +		    &pcie0_ep_wake_default>;
>> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> 
> [Severity: Medium]
> Since the commit message states this patch enables the PCIe EP interfaces,
> should pcie0_ep include a status = "okay"; property?

This needs not to be enabled by default as PCIe0 RC is enabled and both 
cannot be status = "okay" at the same time.

> 
> Without explicitly overriding the status, the node will likely remain
> disabled as typically defined in the base device tree, preventing the kernel
> from probing the controller.
> 
>> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> 
> [Severity: Medium]
> Is the polarity for the wake-gpios correct here?

Yes.

> 
> The PCIe WAKE# signal is architecturally active-low and open-drain. By
> configuring it as GPIO_ACTIVE_HIGH, the physical pad will be driven low
> when the driver intends to initialize or deassert it, and high when
> asserting it.
> 
> Could this invert the wake signal and break PCIe endpoint power management
> wakeups?

No, this will not break the EP power management.

> 
>> +};
>> +
>> +&pcie1_ep {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie1_ep_clkreq_default &pcie1_ep_perst_default
>> +		    &pcie1_ep_wake_default>;
>> +	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
> 
> [Severity: Medium]
> Similarly, should pcie1_ep also include a status = "okay"; property to
> ensure it is enabled?

This needs not to be enabled by default as PCIe0 RC is enabled and both 
cannot be status = "okay" at the same time.

> 
>> +	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> 
> [Severity: Medium]
> Does this wake-gpios configuration also suffer from the same active-low
> signal inversion issue as pcie0_ep?

No.

> 
>> +};
> 

-Shazad

