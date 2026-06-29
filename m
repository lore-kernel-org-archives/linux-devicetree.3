Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC0237205D
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742112; cv=none; b=V066yrOfHBaE/Kog0mTC3ZQI7hODvqzCWZUWl7XveUkz6s1hGmRRYtKcfI6guRpzWgGceVgJRwg+TM8rLrgm8usZDHvFXd5lA/8Jvv8Wog/P639FhXjXhT8MSQhUkQIsV6sYJ9eXUrsF0VR5otLdmwfSFHqLqthxjVanYdJDjc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742112; c=relaxed/simple;
	bh=tTVEQ3ziSu7uDquEpspbeYDN402+e8a2yg63mpWuHmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPpSo6Jwcwn7TXmPUu0i8Hb4gc1osJydhi+GgpS7y13wCTq1coRMfEfmKi5YgQfJwx46WyqoU+Rocicncu/i6i85+cwZdHu83MrRKXWV6kShKlMtfyvaL7ygJS2ZKaL1RD0O8VrH9g8D2NDPWHmwC7RZJuOQZspGTvJ1kfiJTcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QeB1HJRZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Brg7SBih; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QeB1HJRZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Brg7SBih"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATEvM2579129
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p3VIhMwBt9pgPyY7ZrnWOd2uoz6kYTJzZPAmx2SEnsU=; b=QeB1HJRZT8o8Yv1n
	juYALnpcdN/GlTSlB4sT1j1HhNrO+Ae3bbsRivbdXa7RqVqLPINB0C00jXXZ3S7g
	ZVyktgDUlpQWD9D0s0RG+1mpsBpKN3873Bka5nilWl3xLk8bQS2+KfR3CaEOcz/W
	OA3EvkX5Na+GAi9NsfBdgLK1SeLVB+nGn1InWdv20GIXlprlBP2zcjjngrARdQIs
	jKid8eCsPQI+4iXeMT6rOwcOKCPLdTlC2pskyISxpSp+YCZp4ygXKBGQDKyZEgfz
	AJ6DD2pZ6RREo56BP7MHUF3QR2aLDVZwCLxo71bKwKr6bZrw6q2+oV2vqx0nDONQ
	SqmLXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7hpx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:08:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so2036401cf.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742110; x=1783346910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3VIhMwBt9pgPyY7ZrnWOd2uoz6kYTJzZPAmx2SEnsU=;
        b=Brg7SBihIh6rZjQmZm/VEJSXwxkijLATPuoHqds3wnR8IkmKJfikXiJJuQwN3QOuMa
         B8Dqe4+IlGGEUgZDZwVugB9FOxladkdn5ttwh2gSQuHtRBc8IoGhjkUoWLGU2cJeIWxx
         jLGPjNg0od78rRFxnDOf/7O8Bu8k6ppy9h7mwdK8YkwMWpck5l8Z6p1BFDJaxMayacKF
         WuKE1eLk/E4zmvW5vM1ANevH67qxpYg3eklI/Yb8hJwBFz/YmIqH2GuzLiUg5eEHB/PR
         4VYcaw8/6NbX2IbQg5BiR6+2okAFFbIs4qDaXhTKcPzjerMsQoFkWqPOIEdlETKEiRwL
         FnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742110; x=1783346910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3VIhMwBt9pgPyY7ZrnWOd2uoz6kYTJzZPAmx2SEnsU=;
        b=d3291NYephIwvcWTLlkxieevV2heb61DBu3+GN8CSX/Cjj1U78zoOLNB4B42TAFF7c
         Puo29nYOtb1Db04YHF/Zd1EINCy/L5vaQJYlqZo/RQZGibGh7WKiMfTD+nLqvHDFbOjb
         x1s/b1QYCnxhPEFiz84VcLmwkZ42Twc0x/xJ9aO68csVnmKXKvkikLmRlfra23+Tlq/U
         51kY63Dv1EFVSgEdm36g7y+hJoiPRlQZLrit5CwWHGGAEbnd0MU2ZwSWtkVaJgqvGGkj
         /aWBuQ02XmQFt5T7Sfq0I2zL82Rdsb8K8a59PqLOqNAx+G62QudeldlIOPkzhoyVqDpf
         OwTw==
X-Forwarded-Encrypted: i=1; AFNElJ/E/2imhVj0g8S4PxmvSKdBwhhH5pqqZ81mAvqudc0kSNOUi8DtTSGQy10hfAwXypkNVpe5dRHz3hTI@vger.kernel.org
X-Gm-Message-State: AOJu0YzY35DhDMKF4/k/IbW5ftZVYd8bfJPEOZqILqk+9DcYSIa6L442
	AFKDiPM2YNvP3dQ9oPY/fBIVlj75zAbq0HlWq2L6Ox4jy+hpurwQTnMafElhr1KVuua50qOlphi
	L/6rk1z2cjsiFWDuSKi0WXJRUZxveT18cyd9+emwiyJmgf5blD1Stmotc3ONVhsKA
X-Gm-Gg: AfdE7cmi+cjCoXHE0LlR+Vm5XYvqUnPSjtmHTKUl2ahjgKbaLXUcHkkbKGuKeTMevBT
	u4GD1HXiKK44nGXlUSt8fFjSTg7a5eTm7SJom8BSAIdbqkZA4ingZU2wHnzhECi7131bG0Vby6a
	G9m5rvqLlZvJ4tnvEqYaMFfWDWKUHEgtFOxB/d/I2WeolW4FtxZGN8ioEyP1rLgtOuMnEGEgfjj
	9Xbdkd7BUIlnLT3sFi96SSCDxFTwA13gHq0M15HwC/nQrB0Vb/p2cbXcDncNzjukB5ZVyaJ6ke+
	f7ju5LQV8h3RDrjYKDC0+PJiBZIw94BOVJQWebFkpk0EGP5t4dFcV62VLtsnzXOkDCGVPL8Y6/B
	cNl4xSZAhJNDUwM1hLy3be6dcwBW9ai1yv2U=
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51a8c9b95eemr101318731cf.9.1782742109542;
        Mon, 29 Jun 2026 07:08:29 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51a8c9b95eemr101318071cf.9.1782742108974;
        Mon, 29 Jun 2026 07:08:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1269da0b8dsm171260366b.41.2026.06.29.07.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:08:28 -0700 (PDT)
Message-ID: <b7d6e7dd-afd6-4ca9-bc54-4533de6b663e@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:08:26 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629122248.yb5fe7rifdoowpfl@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExNyBTYWx0ZWRfXxzvxW1s1SJE/
 QCO/B/2+1b3EfouiInhlbrDCfu3Ij7LGT7Ym8BVIm3AR9tOoawsF76bGUH2rVOeJVzwtWDe8T7V
 vI/bX9d1oSAXQJ0568gjPlwXrYVeRuY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExNyBTYWx0ZWRfX4xAQRNt34tMw
 0oBz0ZpB+1KT3hqksOGbAJJ43MZNIzOhS5unkR5+R2ZbNo1yI0rXh1r4Kua5j+GSEvnZ6pRQ/zv
 UQzQZXKJTNlMYltHAXlHs4KWWXfpy55oKdouogtAdD+K4gr+N7pJCfBI+r9Gc7bvrVM+dWrkMS9
 /CAbuMWh9mHycvbFJ+3koufU2bVHsev+2N05QqAJwgyBeHtfrTnBAcd1hc9ADD5fvnfE/CXU1ah
 kY317qmFr5MSKQgssIANqHrO688Ns26gMGTUoymN3oOaTF5XwnjIEzGx35kfG/pts5EQruYgN+n
 icawfAlsGjHN6mIBhZ+wJelWcXo95jFuJOyOuai5DqYwbUejASenBScVaHZxHngYlWMu+2CebZO
 yI3XKhRuRoTGDJmWJxZTq7MbnuMr7Q+1BgDrUBGwrDZlknqvNe8vzjhsqkqQYgm/jMbkFLdItaU
 6HtA+DXpDW9qdVu1Wqw==
X-Proofpoint-ORIG-GUID: xWVfN1rSvokZScw_l0Ny79WUUZbR9_hY
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a427c5e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=S_MyG1G9oLpO98hWXnUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xWVfN1rSvokZScw_l0Ny79WUUZbR9_hY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290117

On 6/29/26 2:22 PM, Mukesh Ojha wrote:
> On Mon, Jun 29, 2026 at 01:36:34PM +0200, Konrad Dybcio wrote:
>> On 6/25/26 3:14 AM, Miaoqing Pan wrote:
>>>
>>>
>>> On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
>>>> All the existing variants Kodiak boards are using Gunyah hypervisor
>>>> which means that, so far, Linux-based OS could only boot in EL1 on those
>>>> devices.  However, it is possible for us to boot Linux at EL2 on these
>>>> devices [1].
>>
>> [...]
>>
>>> Is it necessary to redefine |wlan_ce_mem|? Can we consider updating |qcs6490-rb3gen2.dts|?
>>> I have verified that with the following changes, *NON-KVM works fine*, and |wlan_ce_mem| is only used by the WCN6750 firmware.
>>
>> Is there a good reason non-chrome devices never defined that region in
>> the first place?
> 
> This region is needed by WPSS and non-Chrome (Gunyah) has IOMMU
> control, maps it for WPSS during boot up while Linux at EL2 needs
> to map it for WPSS in Gunyah's absence.

Right, I'm asking about it usefulness on devices *with* Gunyah

Konrad
