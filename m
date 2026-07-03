Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6502E3B14B5
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070606; cv=none; b=ENCzNWM6cXRp07uMLJAIBv7SVa0ZbhTVzX9RPht+KpE2VpTkX32VuBdouG/VwMJNeb01a3qAQnZQPbbD0UOSzZE6jfTtwBGKJ5bHczFen4MbFOzDhcJ7TtfL7LP8i4I9XGNJjlQ732RCgOty/OQ6EZBsQxc08AJZna9b9M22QnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070606; c=relaxed/simple;
	bh=D6FyfstTISzH9+nCkYuJjjuigMmR9dmkecqosBg370g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IRPA9WGooeUsxn1jmDMd8y/AuqSSfeWJuywq9q5i79dhb09j6+8GFgqXIUKRoX+UYlQ1e5sJP0Z6+BLXFjcYko1zQ/f5h1PfzyA+0sEZnmahOxbkm79NBcqvvlqDNHnEl0MBeCkm6c2EecWVPMibhsxYPBIsqOK3FE64mxOVvZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXm0VbVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dD283ZQd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXm0VbVG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dD283ZQd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s4gf3124343
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 09:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NOw/y5u6kP1EYPo+p71lja3UI5ENfrKWunho0Mw4UtQ=; b=JXm0VbVGUgl1DN4v
	Aocpo2T7qOQBSC+5Dm7ZAjfcEVQEHjJysI4lzG5vHRl8gWBXW0SMBRLjabn+gzp1
	LmM2ZecDViXL9GOw51Up0vWPGMQZ+xesNb9YVItRlH0RlOxbEdJMI56p7jW3xbxL
	j9qmhgWsdArGlvMC2tq/pviwt23W5T9IH2u7ukReIIEoe/o/9YDhWnvocMpcxkm3
	H4LAv3SyQBDE+u8Y+4ayG1/Vw1kDaNj34nmnSCTBxe3TMDrL/QEtFZbRjPF9K1A8
	HNTL4grsDMXDOyXpSvjXSOSoIF5DRpI4mYJ2B3jlnDh1PwxqHEHewegGljBFN1Rm
	NrBtIA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpcmqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 09:23:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca0331d0b1so5819645ad.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 02:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783070601; x=1783675401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOw/y5u6kP1EYPo+p71lja3UI5ENfrKWunho0Mw4UtQ=;
        b=dD283ZQde6aLx88b4VKiU+EwnBglsqulwBa1v2fmIU8LU6vnBKPoXBxKZEH8+fB1+V
         pNauq/oV60SgDJV1fmZUpY39DDTu4Q4Fki8gUWt0cSRATI9O/u105CwxXfl3QDwMLZMY
         22qGze+45UQPmEdz/1LuHly1O1VygUnrPwS49ZyOL2pBEAdR1LJDSBGB+xM4baxXmI9I
         ODINp0FVbO/2Bz3JxiB0ijqeIf4uBFYUm5KUUn/jTZHXDeLIb4s6jNb5tDvOp8M8Dwx+
         BIRJVSbDIMKo8iOf0/ZUHS9kew0QRKVwjo08RXHvY3txwRkl0vO6glTaWmxr86wP6W+0
         MmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783070601; x=1783675401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOw/y5u6kP1EYPo+p71lja3UI5ENfrKWunho0Mw4UtQ=;
        b=cMmHRD3J7Yo3Jw5CCdK0KGyugD++KHbpJ0vJ6mwJysA77Po+ao/N7Ebi7wDBvVetrQ
         AlTpt1nWgGJLVw6wfRr5IritOwaX0C+tPAtrlfmevJJph91D6DExzJIY8rOvyNHsl8aI
         VEDd7k50vtmIfNuZMXeeRSSc5h9TMpK6QwerPHmADl4IMvYZn6BI9fXoRZnc/YeRbUJS
         0tCaRQl8o1pJpZj/T4HVn6Bs9hu/hwulF9EWKuxg8y6V92waHIJgdCAZ3IIxxjR8lRJN
         Y/SFgEAK1OPhKzY3zpb42YjFLZpPDuT9MB6+4zF6K0KaNduJcPr55KrYGYbkU3NvnDVc
         FaWA==
X-Forwarded-Encrypted: i=1; AHgh+RrA+oFx1a1JRx1py76VacWjI2Sf3Fsq5ht+5fBQ2MXjv6SwlGoRpI2FCa2TlDKknV2z8RNOtkUdnPZe@vger.kernel.org
X-Gm-Message-State: AOJu0YxA/QHyrm9C/TvjcoOGPQWlXJFdBL7DfviK6wxQhu82LrXW/G1G
	fsf2CDEHbIYtwW1j8TvUVTtoxkfyvo6JRPjhzIWR8f9Y/dxy+7pP1waQDAb2c/vC4vqrYh/VCPc
	S76KFjmrY5rk4NwA0fdhfWG0RGsQ+YtattAVSijPPa/0qp7I3kHn1etGM9GFD+Fi+
X-Gm-Gg: AfdE7ckw1tOAJc/j5Jx2069gNyfMLX1t6AHva3lhAzG4FryZj/1XK0b+Q9AaPxEvmMC
	XUnq5beC4w4S3dXwd15MXyRhzVFWpV0cCOTF29QJ5cySnohhtsFOuDZhI6RtV/wZU6ZwXx0mvIP
	NzAm9fWNvHm0kqT6T4aKOMV87IsFCTL3Syk+JgsJaSINWcJYvqSXGekwWaqsFKlsjsevpOjJ2QX
	0P0KmcwMMfsy2DuYvNqsH8CaKTc5F4hglNI05GiE1QP7fzlDUksAoFM/qAhr/xtQc0Pd2bGhbk0
	LrAZjCiFK0eDzmNOeydcKd1kIgFvlCuUZtN9QzQmFABM+16y0/b7BVPhYr+GWB+2M5UmlZ/D4A0
	HYP9n6nL8Sh7jpp6xKffnOkp3t/k0UJHjZpNJYT8=
X-Received: by 2002:a17:903:240a:b0:2c6:c9de:cd0e with SMTP id d9443c01a7336-2ca7e75afccmr103764075ad.23.1783070600762;
        Fri, 03 Jul 2026 02:23:20 -0700 (PDT)
X-Received: by 2002:a17:903:240a:b0:2c6:c9de:cd0e with SMTP id d9443c01a7336-2ca7e75afccmr103763625ad.23.1783070600307;
        Fri, 03 Jul 2026 02:23:20 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad789237bsm6382845ad.71.2026.07.03.02.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:23:19 -0700 (PDT)
Message-ID: <c72d2ac6-b1c8-4c96-a0c6-eafe18147ac0@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:53:10 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
 <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
 <0bbfd60c-236e-43e5-a150-93738961f3de@kernel.org>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <0bbfd60c-236e-43e5-a150-93738961f3de@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX+IVL3kDTZpgN
 Ig3mbFuEapDf6fnOaHerzGNz1qgDXFbRDoF8VsR65ydWQl+yEuwRCYnHIxpUImpM8EXIpslBINa
 HJMpsTjLYwGIYKDafCVabrFab/afUp8=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a477f89 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=TT0SokwCUCox7tJrE_AA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX6Udj1tdMbYio
 ScgothlYU7y5fCDB0/WG0gfrN2kUhukCJMMOps4G8NqtK1sZ2HZjBvQy0KVW+AHx5hHVRAG3vV5
 n1KBXQNheBNiZQBYhxx1L+L6I6egTHcSkMTpxZH9MdAXrwliTOjGpKKwsOkOjViWWQfmZFN7OYW
 QAbXEyjSvcN+eH4N8t1VnWe/CmFtawCO3V157UOJQwMtJfJu7XHki/01wHUBUpN5jIfRPabTE4L
 xSPSA0YfV0clx6cz7w/JaGyfA51ScpfU6/s4uemiUmwCl45q1i2aiM5iXmiXu6PL1BcluNgO+f5
 V+oLSAShOlYCEephlsD5nU0GbG5HGleE9ngWI/3lc3hB+F12a/C2IHgVfzWzWDl10dVnB+LFExg
 5SFs/pa4eHo0mmWMIFwZkqmlHvJo1QNUlmFM+0ZLT+NWRwtHn6b5lG9J2SleLhCCghcgjVFzo05
 E+fk2/nxw6U+6gM6Dkg==
X-Proofpoint-ORIG-GUID: Q-67Wq9115zbTa-s9KN-t0OL57g8f3Ic
X-Proofpoint-GUID: Q-67Wq9115zbTa-s9KN-t0OL57g8f3Ic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030088


On 6/4/2026 6:23 PM, Krzysztof Kozlowski wrote:
> On 04/06/2026 14:30, Nabige Aala wrote:
>> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
>> used on the Shikra CQM EVK board.
>
> Does Samsung Shikra CQM EVK have it? I guess no.
>
> Best regards,
> Krzysztof
Hi Krzysztof,

I checked internally and found that there is no Samsung specific Shikra 
board. Shikra (CQS and CQM) boards have this panel and i am upstreaming 
for the same boards.

I hope this clarifies the concern. Please let me know if you have any 
further questions.


Thanks,
Nabige
