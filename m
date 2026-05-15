Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59503E9C0B
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836593; cv=none; b=UCzfHw0N+tf2dfl4iFm+IKQuGLiJcBX4+cBBhx9c3i1BHFiN8fA5CTaRUVXs4iKYJ0ctgrqL8E1fRllxgbtxWiY5g+cQX+tvL866iEPQBWybLKAs40LfEe1bpOcO9vNR8ShtTD6T/0WH0xwUJHVrlV1f3Axa5JP3nwiYSSXkssM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836593; c=relaxed/simple;
	bh=lTltjPlWC/LmlpHNY8mM+jmNxZu6sAszVV28ZApN2ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUYNYvNaTy2HH7yLZcYAW/cKCsbEnNmZl+O5DaJcptkxYOGxAHWLHmDS2t9pguJrCv66UT3kcfIjZotlvJjqQwnA0N41Cjp8FwfHqqqRh1Apvf59N1CrX9LFrGKfqC4lMudtattHBhBSzezisYxps4Ci+SrZoFlpw91w4Ey99yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbwIn7/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+hWoWlN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbwIn7/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+hWoWlN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5X5Ge3514759
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvhR2weDmub4Q4ZQoD//N9gjTjMPd6c4Apfti5N/kTU=; b=LbwIn7/BxVuJVr3P
	Ulyq/JQtjrKNn8CmPNivSWjv7xJ+PmFk4MNAO4h73KYHYshYyinnTdukVJ6Jktel
	CaL8lrsOb5bRl6LTKVsh7Zop1kLsMeIhrvkhlBVeYDZ+V1BMf9X0Sq43xgXDd/PC
	al/V5h09RzS8i63L6XcP0f50G3quQMipyD5lTU7877uBFy515ND0fLDGy32u7Vjb
	AqyJQSg1rJrJ9fJxWPFzVoIlJlJaeuyMdgqfsTBMNEy7BgQYTjgLIFWz8fftHgTA
	cscZ7QzXSaqD0P35RchLfSBTo7aOCGijMkAi978u1f+aqiUTcDs5Gqoglg6Cjiuz
	tbu0FA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vajm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:16:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso12119183a91.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836590; x=1779441390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvhR2weDmub4Q4ZQoD//N9gjTjMPd6c4Apfti5N/kTU=;
        b=G+hWoWlNNXri6FbQXo9BVkrnp0WSyDBCA8ei6vH2VYrSoTy12SCjBv96H2vTiDBC4Y
         cWQ4hZnzhm0h5X6q6mYOiv6XYDl7JHXz1hJ/iy5wqYQMAvfrFnHLiTcMNCAWfbE4zy+c
         +5gXOLhPrG600Ceyh0HWn8qQNPjo5tUzL5/AFkJtjXXtoDj7KCHoWyoqKnEFaSZCme1+
         xBSxvmQcTYs/D9n9fqWvwWjEFLio9j8ASWQ9xsSBDH0sg72hd1dQf9kop7Q7RuYRCXmL
         av3Mi11DXZgJzhojAVC544nq9Yywy+qvgaxjgRxXsJpGeM8e+Kr2HyYA8fWnDu/HYERp
         dEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836590; x=1779441390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvhR2weDmub4Q4ZQoD//N9gjTjMPd6c4Apfti5N/kTU=;
        b=sCGsmd+3iTQoqZuPoYjeGyFBrdiZ3oxpACW6zNCwLkWY8NJNxUlPQzoTHUxcPRboeX
         sK26D8w9z1mDRNGXkGwPxK4RzzpSfJ9fnKjlXfOv+MTkmmtPAP/iWiAYY6W4vY6MZMjy
         TvkVyWJr05IRlWrLjibgrkKg4CsXwO3PWij59N+N0DxtE7tCgr+we3OZUP6v/9+9UGZy
         rvOfLDCkpiG9xfTzwZkNK4abLISJ0Z/P3rKx7Dv+TqVYLD7xY3KD7ou/UnxoeeVO7ii1
         PQuGO/F3fdZMcUmlrm1CZso5yL9LrD+hRji/9/47HzNy8nRES1yJRAvsz6liMnxj+OAk
         DygQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lC4BF6ct366suAcjE9inH+DbxysY255KAc/1M/WeLHRpGsfFzbla5Mfz2DsYBPkqApsQwbE3dHC8q@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj9ULZ+bK6yvlur6TrnZt8pXjkdOtN/ZRrkdsKLH9mS9ie6OS1
	GuZQOKLJJ+44i+KNuXWgNGOA4gVOuARB4zmtMZN5AnQh/ypFkuhyqMXE9WBHSTeZoUpC5yvJWsc
	B522/TMtLd2Dcw1Ux2BWfrqUmvbPLCqBm+Zfp60gYe9uB8ZcNIwvDHZBg4JYkYc2u
X-Gm-Gg: Acq92OHWDCxrPi6kiBlzmki+ujw5EZhrB+fm5GVA3a7l3vsGH1rnIwS6eYVGgvPExWl
	djtBqe62Pk1FKRYrUBW/uT94v29PTO8xal4udpYb9xiyre2ZEp/I7aRoBC/g1bhbzFtVoNsA7ZL
	KX68f1+6kRrDLiKYBEohq1E3hhZVH5WgkXdHh1aNjgchTurkbSTOGkaP3JSBP/vcmME4IQRXULu
	3fE9YTH4S2xYWw8UF8R6Zoc/5q/+M0Q7HEjK26Z9nKooPEPW3S/i/py/gjC913mfpLsvu8frSyU
	3QQjo2fETqQZ2MaKZYDKLE1nY0NWY60WK4RkcQqm1P0t6E7Jg72T8ddRtVsU0sgX9SoRQehL6F9
	InIweB5T3c5eHm/z8Tlz+aCA4P00jTkOhZaghjJtoRBJpJKQz3T0LdsBCmCqVCxPv/A==
X-Received: by 2002:a17:90b:3811:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-36951b88708mr3007556a91.17.1778836589599;
        Fri, 15 May 2026 02:16:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3811:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-36951b88708mr3007523a91.17.1778836589119;
        Fri, 15 May 2026 02:16:29 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951434eafsm2165324a91.10.2026.05.15.02.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:16:28 -0700 (PDT)
Message-ID: <c8940496-c63c-48aa-9ac6-752bb2c54c4c@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:46:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5210: add the download mode support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-ipq5210_dload_support-v1-1-5609c6b8330e@oss.qualcomm.com>
 <7a0d05fb-48fb-4183-9eb3-9dd316f4cc62@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <7a0d05fb-48fb-4183-9eb3-9dd316f4cc62@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MyBTYWx0ZWRfX9RK8TFinfZoM
 5Yqdpi62NvMkMkiHY/TdkfhZYZVR6KBqJXB141h4GOOHbaEGCh9Tq1SAbPhke+m2TGmJjvHNMva
 ci6/55zLEzGhsZtdJsP9gy3kzczyBkzHqbjs3tpfcwbQxxV41A4XK7JSBptSpDN3O4Naact2XFr
 80VEscDQ2lsoylfEutdkhG8FDsF3Qn2KTOUDjJIblaotIDy3qJ5S/WJagjLREZ3CZbLDvKozjFb
 6olK7udY1eTDG7preJT09aWoD5CzLfeV4xiP0RaadwXs1JYod3LnoiwtwMSWFcDqEQfR0biSa9t
 ET0Rrb9GAnFVzsq3HCWCm+u8qqXhfnAN7O+UpYw6a4MiXyULAm15bRHNfEE8co+4Q7BsX9K817W
 yQ/Vzw57eLbz84zcpw1iCf9KsAiCkjdR10qgve9x7HYr2D7YeGIKckX7qVaiu+YKc4W9CVjTcyF
 7bdnszDLCkFI/9A5oiQ==
X-Proofpoint-GUID: XIhX5LE0lJCf4tooens1YtbIcvMuV_a7
X-Proofpoint-ORIG-GUID: XIhX5LE0lJCf4tooens1YtbIcvMuV_a7
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06e46e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fdgjUL4clUkD61Hg5IsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150093


On 5/15/2026 1:53 PM, Krzysztof Kozlowski wrote:
> On 11/05/2026 13:01, Kathiravan Thirumoorthy wrote:
>> Enable support for download mode to collect RAM dumps in case
>> of system crash, facilitating post mortem analysis.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
> So you sent ALL your patches separately. One by one.
>
> This is non acceptable waste of maintainers time.

Agreed and apologies for the same. Will squash all the DT changes 
together and post it.

>
> Best regards,
> Krzysztof
