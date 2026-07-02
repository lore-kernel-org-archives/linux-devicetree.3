Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF7F3C5DB6
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989757; cv=none; b=sCDPizibyRG08Fea/5p7u0Pd+UffhOZ/IqjzbX2SJxHefXQHmFwQjoHV6c3+JBfxhaJhyw2yasXSJEg8B64UJ2uz30/7L7mCunlregtrl5/yr0cyaZktvnl1D1mL17aRP+5A3jYnXTm6KyoE9LyjJMT+cF4GAoZrjz0Ghf9UC1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989757; c=relaxed/simple;
	bh=/ZzlequwXhlS7LWvnF4LjPV63ziQ+cD3M2ZZ5OvxKnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AodtAM1T8B8OX2y3PjkoP1gwIw4pbN5JUJ9/EUBDWVXVFZo+8VbuaOJGI/XrvJzGSAcTnpaYPikio1Gd9SEHaKoIRafz9hcMBWv0wke4Kfz99zUOXrHd3agxUtgIYriDlZNy1T+elofYDI4e/eZ5srjZ+O+OZIkrkebD7Iw4idI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2hGTebG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYwAYDZ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2hGTebG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iYwAYDZ0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662ATLGS3591664
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 10:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1ryAiwJl3UQzitsPwkR7CGd+DjhIbqH1QEDSsZ/xoQ=; b=a2hGTebGOPF34xxb
	UhjLMYhe7C++fX47vrTKWSBq+PICLiPz+P8pWN01oDjQM2YxFAtKldwza9BTz8mh
	CYtST+LaUsMAKCTZfdatkDlRKGNolCksgd3We0aKXId0NPoUxselRmnNgej0vlRS
	rLC6yo4Udy4RI0xcmwlqjCyRDNCvfAgvCWLOcdT8tjN3sHAf02YasApZ15j7K7AE
	6ql2Ub5/hm8yM5osiID1vNaTCrjBXBjbtgq4F2oMkxjuxD5AXR50SqCjwFrSBfTJ
	70fX0hS5JuTNk4rMBwo/RC51HZnkcAUaSQp9orNjSiX4nvjPdhv7ZVEooelTY3Ba
	bzHp+A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9bd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:55:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c069f73e4so4768641cf.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 03:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989754; x=1783594554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1ryAiwJl3UQzitsPwkR7CGd+DjhIbqH1QEDSsZ/xoQ=;
        b=iYwAYDZ0Hnc2OWSmwmko/D345dKyhadKPMys3qyENSbdho0/zaNa0XEsXAVDT5GjLk
         +c6gV/rGlXAKjc0WKd6eZdKEXZ2YScE/J1JPtVA/v2f2FBLGz/P1QpkX1BJm6IxOxAXe
         3zyCW9s/c/9VYIFBbJa3qUoXKWBH8e6NZ3Q2ab73yLYeVVwl8Sc1kVkPTylP1WkSatGX
         2u8PkwSta7oEE+rZxY1eWeuuxDcALIHjPO0IsqaTMgWdgObLHrtzPo8VFxAX0Tx3ITFp
         yoBY2Lm2QyTDvubixdRx+MlMVcyomcy9PP30JRlAk01bj+o9D0XjABt4kOxF6yuCPWkp
         V0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989754; x=1783594554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1ryAiwJl3UQzitsPwkR7CGd+DjhIbqH1QEDSsZ/xoQ=;
        b=KEgehGmacxgZqzVSODoyw/3WhTMS4MjJ5SdNcl78R9T15dCT9fgTTbKP57yQ6c+YRB
         UEL/178YxlUA0TBZ4qIJx+GvIhL1dyvqUh6/1AUFINu4ftPLgpI8QL71DNGk7RwikC9t
         Gz2zQ3rtXlHlH+shA5bQRrpmwcT50S7zU9mUrTgCIWix2HiNhtuZExCmlg9RdISk19UY
         icVYOknNPr/CrEVqdnG/5TqUuqxafAm9w6+ddiliiOCvSVeZkm0+pmYuHfO6gNQOoMPl
         EALsrUKcQKE/amSOkIXvVCdMB/sxEwV2cKO7JZ1J2MXatDsz7TIaOSu+sND1cM9XhJai
         ejdA==
X-Forwarded-Encrypted: i=1; AFNElJ+ReH+/6dXsyjdUUMn6K8CELWZZnY8ipfJYWRjkw7k0a0/bFcKz782Aa8bMhHLtwRAPJX06/3PROYSo@vger.kernel.org
X-Gm-Message-State: AOJu0YzuBZZpXw3ygz2MNYWQCG6PVHZlF9d1flRwXqQpZuIQJ66x2EZ+
	BXjgMwuNohNJ1HiMqb/ApJ/NGgPqOs3YN+CXbfivuUohrRN89soc4CK35Iv24FhMdRULvRE4itC
	Ao23qlaQtLjdhogu9J5MYAfT7JjcRbyDhltQCm3Lc+LlBWs8gsuyHzYPQFznXpMKo
X-Gm-Gg: AfdE7clVJsbrmO+y24xipgRcMJ4TmodEeRSFAzoadjZ1xMUysFYLiMDTkAQqUovoTsI
	lCTFcpNflnjD2T/pHWFtRDlAEDxV8wx4nIJm+cpufUxS5OOEC2QsOZXwXe7jNhDwBoLhVv4QeU3
	Kagl9ZEyuTi7oZkdOhgUdAZCn3/bDnvMbtESSqCZDslpYrGZTjjDMmaQVW1RY7ay6X6bku6h7BT
	uRJkD8Qftkeips19zcXJSG6OHplKV6T422JLVXRaIzzyl+xWbFpGkmYgGx0gDoJombXOOd7m5qp
	3PIcySbbOnl1Vrk2TY8rzoZ+VwmsgD5vXKN1xbWWUvLT+ZMpvZio7tSHpZsAWqgqtmLVBeoDZ7w
	VZoA4I1LVo+gPZeuo+pWaikt4TYtNzmBqOWk=
X-Received: by 2002:a05:622a:14d1:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c26b41df6mr43962651cf.10.1782989754165;
        Thu, 02 Jul 2026 03:55:54 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c26b41df6mr43962511cf.10.1782989753769;
        Thu, 02 Jul 2026 03:55:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad118f43sm788110a12.25.2026.07.02.03.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:55:52 -0700 (PDT)
Message-ID: <9c1aab59-14b2-4811-b778-8e96645bd65b@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 12:55:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX+l6062bIRtcI
 kImOp+qUwBv8+2Zlpo6KgThJDez+mcCs17RhtDA16Z8zbDdZbghhZUsW5DYhOipQuh4gQJWY6xF
 cdAE3BW8a3g6j6Rsapjtdx+fFXAk3afK885lBgzSj3rdQ9BNl6ARTcPuFI9nohRz5cFb3THzAHL
 h9DDVrbejPoZNNU09+WuBfdAetj28F1fWeTBzZ2SARIKd+kKIyKRToSMXLSB/3dgVQUT0mB6Stx
 FP10V/S93SQHHk9rHDimHUvPobk7x+hZvVJYGbzAXSC0Fg/McgM+cZr0RQpacc7RqNsQQ3k3tdJ
 3K2DHps4B6pIy00Q48ZdA6if8Kh64LiERrtW+n8R6irubuOz2MK7Nafmu+scdomiODZARCUUnZ2
 CfaZmeZpfYK+2v7xlHyxrnZhDp465mTL3OhaNqcqBHmVj1Ha4OHKBSzh28kSPcQRr5fCBiZdnnY
 NE16p/BcrJtkobVYV7g==
X-Proofpoint-ORIG-GUID: OLYrW2id2og363RnWXOTE5I2ihl2HgPe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMyBTYWx0ZWRfX7XvsFQlhDdH9
 HhUVYcHBDW2uoUVvzKUD4W35Y2d1A3uG0eC2/egt3apEuv6zCJmO33jY0ghvhJz0Y/cCA9ju97c
 QYjGXcRt4F9XSP+wL6aKzFFC4r0n+nc=
X-Proofpoint-GUID: OLYrW2id2og363RnWXOTE5I2ihl2HgPe
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a4643bb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=t9bxL2sBmI2IUrh-d9IA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020113

On 7/2/26 11:50 AM, Komal Bajaj wrote:
> Add gpio-reserved-ranges property to the tlmm node for all three
> Shikra EVK variants (CQM, CQS, IQS) to mark GPIOs used by the
> SoC internally and not available for general use.

These are generally added to prevent non-secure access upon TLMM
probe, i.e. the board won't boot if some of them are not protected.

I assume the proposed set contains both ones that are _absolutely
forbidden_ for Linux to touch, but also ones that are dedicated to
some specific purpose that Linux _shouldn't_ touch.

Please add comments, like in glymur-crd.dtsi:

        gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
                               <10 2>, /* OOB UART */
                               <44 4>; /* Security SPI (TPM) */

explaining what these pins are.

If any of them are boot-critical, squash this into the introductory
change

Konrad
