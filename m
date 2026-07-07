Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C581386429
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 05:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402789; cv=none; b=IaDlZwaX6xdSXgP9W193FXiz7ej5D8S4nUjvHnzxvxlQYcs0shLbGaE0wxANxsHzbOSodjIOdqVDrNQKOcxDZMP2RfQIn2Ik5p8B9mPj9lDW72Wd6kgUEDR1JDSgEF10xWLpH9oVPMolXZQa/iRMOAa3d7WyHaDzNnOszbTMxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402789; c=relaxed/simple;
	bh=X2kVkngOoCYbBXfNxwdIGv46Mf5xJujGo6Rws6X2rz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JzOxHovGVh8BZ4OJ9hFeQK+g4Oo/QwN749fnTQIm740kB4ZmF4+R04Ub11iKucK5GcIPHlq5oCzjfHqIXSFy2pZPmZuStZO7dORwgrGTZcOD6KKFs1CPJsel3vsjLah06I8n7jWchoNQ5pC9P4Sm6b/mCiANRCwMxJXb+iHdekw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZBOJGyy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kk9Yi4Pz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZBOJGyy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kk9Yi4Pz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748Xnt2514295
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 05:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PsFzlIWDFW9ufDJ3y8kqOTwL3T/qjE2N2Ba9kxqY9L8=; b=ZZBOJGyyIdQ+k3Xs
	B8ufPh8VDIAjkZceS5Kp8fsEj31YL42T+42IbzUFyZ4Xe9JjMozB6/BG8f3vcQra
	/wtX0s+ajO48sTUiTe4z5rPcDnAfyUoLEXXuv6XS3/hWB2LuduX74fRZXxReP0av
	XfV3fg6jb04J4JhvJKlwZ+lMCHR+U6CJDoLQCP8AGIGASRqCabDUusgvREIqYuuv
	i8QafkKOFtoC9P8pEzKItlJv1LgK4sy6UI17Fp6evgG652tfTl6/cKyKeoVbk0fD
	bYsFbGvR75hqkiFn1foyaPhvq0pMNbhva+JPYZVRULy0HtZ3zC3g96YmY9X2k1jU
	tYVgTw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8gc7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:39:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so6451410a12.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 22:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402787; x=1784007587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PsFzlIWDFW9ufDJ3y8kqOTwL3T/qjE2N2Ba9kxqY9L8=;
        b=Kk9Yi4PzjGzZ/VWfrwxlEiATS5nf4a/FwikC0t0uqT7ycC382zaJdYk+eXw3chl5KZ
         UsGHXiV4OPwBAWACXuW1WqT173dHFckDyRMqtiZ2z2Vl9mFlEYxuCXk2eKu7FFE/CMpa
         WlLrt5Q9OUbj5z6agdn9oChPo6cEoQEjahuJm8+VHaVZGFF/0gf9mfWkeIuexEPd9UjT
         Owbm+ok+HoAspDSamGiunBQ2e+yEBB2D7q2cGgVt+qveG8O1dUdGTy75YrN7l2n0EGGg
         jlf9iB6fNjklBahSWq+y/v/2F2Xud65X4Wg/fa3b5CmN9ZQniRUt+MET8qxDI/xEeB4R
         VaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402787; x=1784007587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsFzlIWDFW9ufDJ3y8kqOTwL3T/qjE2N2Ba9kxqY9L8=;
        b=nRvgSZ0+UNpsA8JkzivRwSS67Vo6Qz/dIvZ8jz7p67BZpPuEl6kZnWzNQzEr4KhFIQ
         RB2OHOV6mk4/midWAVuJRHCDARStuyH1C6vNhSPWyUC9KgpuKsCS7tAPE6S0s4ckFWYn
         kI28I+U548X1ZylXjg8r4+IGSIVVFQuDIbj4LYzn+mtdn+VeSTRhyife4T4k8gYmtEpI
         oOocShGXi9DvIkHpL4ywmNrTZBKCvoEl33bPSmKsB73TeVF+PvUP/QZJPjIIXSdr0/Et
         Pp+UIbxrnRB+skSmkBTg9b2VR44f8JMtxrMiWcxMrsK+aXYwXSvPkBwPzrMnYjp9HpHm
         6O2A==
X-Forwarded-Encrypted: i=1; AHgh+RpCffDRU4akmYmJhj8xnB34Fvphb7sKDjW51NzWifTA+n1RE8l9X7D38wfkPbLw1cIuYNAPzJ7uLc3k@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdf+cASU/XQPNFgzzZf+FRbO8k0IkZFYgD+11jInhh2O8hYwBV
	zTDxIu7CLC4yzAtgMOtFbv7bAED3bNJKkVYk81k51C1BD9okREurcGb6WcmBvvTJl6kd/i5Dxrp
	VF2yI87dcdtK5iWB6FEfKPjIKyuA/nnDmMbhL9ML/QODvCBGhvc9w/YVGpFKAQndk
X-Gm-Gg: AfdE7clCAlqlH603wXA9q4rKcJpare/XWY3/2gzNvJcI1GZ7OdI1HvjXH1XN+7petgA
	d877hUTwpldYA5UeH4VCA9/LDBJ7Zxh5Dk+Hi22cqrK1owiKEghT0kIAIlWnv5RWyWgTdc8XMg7
	shGbTrv5i25beZ1oxWVDlrxis/0btptIUr4K3joCI1uDOEkXPl7vmLtrzJAR9xPMtM/nzZXQ//i
	+JuuILHn++BQfh+4YOy06NdtRFpol0rOMGkCMwvkOWfD3yy8GImufiLGc7UfvlOj1T0I8ZSnYHQ
	Le20efX7BVCGUWdljkJAb5hxlrNMv+8KTMprEEYqVp3+zgaWYNjipEyyBWOm9bDs9JOL/ewuwm8
	kXudhCBFzusQh77xIFx8feDRVZW3xLF30CYrAQjfTgZ0BaNQnWER7PQM28l6D749BrdSCU78oFL
	6C+7+r
X-Received: by 2002:a05:6a21:7d04:b0:3bf:a9cb:b794 with SMTP id adf61e73a8af0-3c08eff110emr4454014637.53.1783402787029;
        Mon, 06 Jul 2026 22:39:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d04:b0:3bf:a9cb:b794 with SMTP id adf61e73a8af0-3c08eff110emr4453972637.53.1783402786623;
        Mon, 06 Jul 2026 22:39:46 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643ecdsm405895a12.24.2026.07.06.22.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:39:46 -0700 (PDT)
Message-ID: <86812216-76d0-473a-b1d6-a7a923235755@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:09:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: PCI: Add bindings for endpoint gpios
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260630192236.GA222338@bhelgaas>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <20260630192236.GA222338@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfXyVWKUek5ymE9
 1/DTZ5NBiAzVt//D9EfOrXfVJ+D/X4BP1GIwtiZhbh0R+glpeoX3+9hZeXN7Crs1125GAV1fnnJ
 Amq5kdH/pAYxSB6jjsJyulXGuC9n7jLe3p0isBcFlgnsdFJ+jhVYZJRGYZlmcB6OAm1VAdqEMKs
 oESklCvWLCB9q4DGrNM08XpoqVAvGh9T5jVq5AMCChQD8aZXSAk166Z+pYbydmVQNzqhoC46xWq
 IOi3SxNI8zqYc4BFY97UI8kuGgL0HF4VJ+LVSq3F79JOn+r2PtcKVoDahSgZVHx1QHlw7/TzrB6
 bW750tY+kl42TgJCHB3s3V4sdSba1cP61zBdD+io0z1WPc5xfgOF2Ay4sJydw8uxl9c6hTJinHV
 eqkCn8whebBPukf7uNIXm4UFdC16Xm/3nHbsOTgOtXnMizm0X3sXDsS0P7UQWA3IWQWArF5i91Z
 3w7s0TB2VJoBOutVq4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX7S8OKkbJL1ig
 XxfCLTP4wuNZ7bfpMnnlT/RFU/YiiB2Q/p/+fqPWtSfh8Qlegq07uYFP62doh6FlYYdU0Dq1hEe
 QGyyenhoLlbKeB/oR2NuMxCTiNM8cyk=
X-Proofpoint-GUID: aZIXXfHH1FdMktFBNU9Euha7ZhlVbMsP
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4c9123 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=8PoPPqR4NMsTHzUpfcoA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: aZIXXfHH1FdMktFBNU9Euha7ZhlVbMsP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070051


On 7/1/2026 12:52 AM, Bjorn Helgaas wrote:
> On Wed, Jul 01, 2026 at 12:32:45AM +0530, Sushrut Shree Trivedi wrote:
>> Add devicetree bindings for TC9563 GPIO's which are
>> used to control endpoint power and reset.
> Include context in subject line.  Regrettably, previous commits to
> toshiba,tc9563.yaml don't include that either, but I think something
> like this would be good:
>
>    dt-bindings: PCI: toshiba,tc9563: Add endpoint GPIO bindings
>
> s/GPIO's/GPIOs/
>
> Wrap to fill 75 columns.

ACK'd.

Sushrut

