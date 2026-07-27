Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F603D5679
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182062; cv=none; b=S4KHjLrec8q05aWmLIFazMdxOE2cyIMvpR0syDzf0HdBG6xiJXsKEjETH3PSo2S/PSba769RC3ovNO58uqSiAJNwDztzMRyBXwGVFuIkOpqhILKvO98KTVZR3C6lMGRxiMMgaOCAILltSuzRbFwHVzAkE1y+y0jv/4l+WUsysY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182062; c=relaxed/simple;
	bh=mPqeBqjOBxVmH6JuKEoOsG/qQCPt6tV7lw1rXrIGu8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PhuJab0W/wfeXts2Gxx9XDyZa9AarH8fsB2w8NIDIvo5g9QStXD5OtqD38huvzsIFzcdnic/NUvO7pLGdPsh/AzNeJzGRcK8kI6hUDUx8+hsnggHoBJuD9IBjk7fJF6I7hcrbwsovxvi/piV6vZlzkPiUWIaVRFTqMoP45Au8iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JE1LSE7u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1mV752D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JE1LSE7u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1mV752D"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RIC1iN649177
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ywxmA9oyOrTEDn+8sC38zwcYovyJgX/Be1/xLkj62M=; b=JE1LSE7uGfhj9+mq
	9SoA4OXz7R4aUlW0E+spDHgVsK8IcQ5IjOHp+LFM//2Mdk6P7ec/gCHek8NGspfI
	xmpg61TrWf28UH/vX4z9myByEHpLguaAiliZhA05CwLeU/Am+CIRp52qp6TLf2iy
	qBWlomonFAMSRKmU0nYbO+5Sbfjl16NfwzKE06JKIjfP1RcLwzZi0HMtzFaFaMAA
	qEkg3YQdrrg8bJaknA9A30H1oHGxEWxJYcG+dXEnZEcYV1xJFzY7N9UT3OimMpvp
	ytMLIaYJwrZavLXHM0NcmqNH7e4NlEJibCSR72hcl/66h6ceju0Y6OBN2iK7NUtW
	eAMxpQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c62twa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:54:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52827090cc5so3218051cf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785182053; x=1785786853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ywxmA9oyOrTEDn+8sC38zwcYovyJgX/Be1/xLkj62M=;
        b=E1mV752DBqqsf+op5gQCt8k7m0L15lNNFeV9pX+74t/h/vyonEBSMOIqY70brjPR8h
         RkFGH9Hh54RQm1qqU42vFkiL9/NhgsX+k1Y/NRX25m7ZWIURyC6cEFlykuyI7bjVKYza
         5V0UGNo0WK7bHbS7O6vanNTir2bi0Gnj1W+Foyo36hhG2G19GrE9wEXT+iBnCSvHjjq+
         XOQRWwz7w7GvVUCvCqQyx/S3v28duoV/rdpxkMaHz4ZZubhIMJdPHBgmPkR71g5958X0
         7PvZtz3moopk8kJZ8kKPg3gjc7SzlN0W4wS7VDQSgq5k9e1aLbyxm1NKgH2LtxJQ8BQH
         t7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182053; x=1785786853;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ywxmA9oyOrTEDn+8sC38zwcYovyJgX/Be1/xLkj62M=;
        b=HmOzGxsHN482N6Da0i3IQsz4v7CCc38LQzB1Csmae97wb2ZLtWut/KdX5NfHnZ06IR
         jexecH9CfuP9jqSK4HnGGfFS0fTTD38xup4YlmysDT3lxy3DVMv28cmlqqV0qGXtmUyR
         BT7R4qhesQB7Z9y7HxUDSl/HMOdkqPU1KpQr3if0TUEsAETVkr9tUf3xoEw5r2ETHlif
         yonEVJxqd9tyw+eSCyhq9edKEjbzwTcFdS4JN1XvDSYldjUC9T3evjiKQagRXmHddSgU
         cpnrLm5TcAGdFnDe0R7uxEpqpEbAvMKvFNV47DYC+KoAVgjzr5YMq9d/nFjLoHnEgTqD
         z6GA==
X-Gm-Message-State: AOJu0YxOB9Gjrycn9SGssH2ZjMTXWgKoqwX4UKQzg5bX2N6HvIHKVLzE
	BtIFdAdpFfLJYdCaidu+XH8m/z8v0VbSBdySWWQBJhXRiajU3IsJ4i9qNDfJ0ITSQ7ImmcVC5KD
	9tL+/BYX5ILlf3cmazRtHIh4rTaUg2ozYbZa9oMDFzpXLOpn+kz1h9LTIEzjtKVvr
X-Gm-Gg: AR+sD12dtRZb3wwN9wkPI+Ez/YBZT7udMdIcv0utIhblku9nAP2fu2FUDrGRiShFjX9
	XNYkQRhAC35Xfz69aDjLngROH5z2lGAsl5OyPxF/59tn7wLl8poQ0xwT/PdptUmcGejth0hnsvh
	Zmd0KbLICTJMetMF45+RWmRIYHZtLq/LyYG6JPWGbEFH0VpIikDLw4WWjtboDv3gTI+iT3kS1sm
	Fcc2Y7CC7uga8uNrc5bitOc0BkZayGQ9i6c7QuAWJmanfUmErBAzywuKB1wmzUECpqNyKqCyY6p
	ZMM06kunTtvYULaSI/HTTRd7p5nBzpneUhCqxkuyMQQYrL7L0ATfxBP2AdRaZ4OIPk1Vs4ovdm8
	UFvuqGXKjBLWf8h1yEunbUjgVG0pXWg==
X-Received: by 2002:a05:622a:551b:b0:517:146d:2cb5 with SMTP id d75a77b69052e-529d40b43abmr1109031cf.20.1785182053001;
        Mon, 27 Jul 2026 12:54:13 -0700 (PDT)
X-Received: by 2002:a05:622a:551b:b0:517:146d:2cb5 with SMTP id d75a77b69052e-529d40b43abmr1108901cf.20.1785182052577;
        Mon, 27 Jul 2026 12:54:12 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45cb67esm18638985e9.8.2026.07.27.12.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 12:54:11 -0700 (PDT)
Message-ID: <370cff77-5ed0-4a62-9234-e58af6ab86d9@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:54:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] dtc: dt-check-style: Improvements for false positives
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a67b766 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pds0RRkhj0wH40QV8K4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE3OCBTYWx0ZWRfXx9seDWSIm0Hg
 4a5DjcaA5qrD/OQaIiIFFth7P4Ww6BBJZc1XbhxCAT0+F0HQDSsJT2pFNkK4ygq3+xY5cs7nPfh
 zrHSr81tKTbZG3Uo8yAHz3+D+ofXaqc=
X-Proofpoint-ORIG-GUID: 8cE_q_Ann3-LUU-DzOfygGkmxnRcnn4L
X-Proofpoint-GUID: 8cE_q_Ann3-LUU-DzOfygGkmxnRcnn4L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE3OCBTYWx0ZWRfX00OTmXETtqNL
 Q16+BTMmITWs6D2TTKecuApK7xqHN2zXjwr1aS/tnneIhn8P2T3p2/uV6CVUUmJYDva8yd7KhaO
 42f+zxdL5olo+s35nQ3qOtpaInzF2mdBjquhgyv6urHEB2SWC/Dx6ymvZiHZ4uzGd08Xs7RceYN
 xeCpzqpyFtvXihwfTJEIDENnpyRSjTJ2AJgxQWo8CxaZ5mj5VxvyiSwqvVQj5GAtHIDg/i4srv9
 M0BtPlakcT8YboTFkW2LX0cclyfYJUEUcMQA5r4fe50zDkCwR1b/07ld52FoZVELDgiZMyYwWab
 +4SHgPJjDOkdiMpVgCM7bHDqcBGl+LRHy/t0c2YBevfComLHcrr3tWRmR0hbYpGXoSdE+GTBquc
 Raz5XN/FkMPuNR+MH2SNtUOUtPGvkaholfmSI6HDvEmN97zatTUxOFd03IdHSwtEkli2etCQOFI
 FTiZSGaeCh0t7P6IIuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270178

On 26/07/2026 17:47, Krzysztof Kozlowski wrote:
> Few improvements and proper handling of top-level node (name, not unit
> address sorting) and property (model before compatible) sorting.
> 
> Best regards,
> Krzysztof
> 

There are several reports from Sashiko all looking scary and serious. I
will address them a bit later.

Best regards,
Krzysztof
