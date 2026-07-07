Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A2F30E82B
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 23:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783466431; cv=none; b=i0owET/9eGpKW80suS2LcX97x5GReU7KqOMsWkI79HQPGOa1E0mypk7ky4UDNH2kq/wHYPU7AvtcoG0BKGfXPgdUxdFetgd/8OFWtuUms24dORtugY4YYN8RjiF0RMAoD1Fx73KXgzVHzI9KYbO3IlB8h7WL5lKfMhI5xbG087Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783466431; c=relaxed/simple;
	bh=nNLvNAxE8oTJKmVhdhD1v29LtZ3M/VtNU3SAL14/dFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eiKFTLRr2UqQr44oyu1jTtR/ZZOQe+80FlTQTDx/251HRyxjUa2KYUIfpO8efzGolBCmm5NGviq7moxWpyEyf9trEBN+qfkg5eeRuzXfOUpbxFFiqGHfBfMDI61TuFDColpueMNiO6iNMAnXW70/Rgk2iMsw70xlaFdlZB6H2MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtwjNrEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dV64NLRn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtwjNrEP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dV64NLRn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667McnOt878787
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 23:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LGjjqLq+Ks/g3qQWYtvwlz79UBgaLrZTTvu4D5iBSCQ=; b=DtwjNrEPrDz+RPMT
	28n6Ywp74gEkEl0i6Dx3KqJ71xVDkKuZOdHv4Toa2NVLlVvfnoH6UBT3kjpw9vvr
	FUapcSuo4TOIsCJ6E0JRcpR64M59Qmo98TmXUhRYikfGec2ZHDznSwpF6b6HTuK/
	X8R6F4Yk+etS1xKyJCugWEaufx0Mo9t92quwkImca0cIL7bzGSI6DaO+zICmX0ul
	F14oooUEmA0JL3sCfExEGaFFrSbUmyzJx4GhE21hHAtTaUhAh3g5OMwxSrUo70wm
	vpL98Htea2Oj8ODo/cgw9lnwBJR+Pmze3d6K0k+dwxsn82SE4mJ9Cb/L74dc1iID
	Z/67BA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgrbkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 23:20:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484123e7c9so64895b3a.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 16:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783466428; x=1784071228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGjjqLq+Ks/g3qQWYtvwlz79UBgaLrZTTvu4D5iBSCQ=;
        b=dV64NLRnY+3LchWeoM3ff1v9DfJ92zJ2M0OrnLZ0zvdi9QX7bingjNxqSONwpd4CA9
         PqEJAC/u5/OOc5mvlPN5etIZ0FGo18v+PLB7N15CboXM88KdbNJBmsXAQeDMXuOpSY4D
         rpyAgYo4MP0PsUQ2Gb2b0k01KyzWYtyJ5GAYqkzaWVDRPfl//38O4OT+IZuPja9acnio
         2N07jnBnOalWn9LrkZqj9dBoFdq6QOq6kFC2bIT7OhB0C65Lte5kA3PpJUPuNEkVu3Tr
         u1GCQ9QDm0Jroz/gSNpiLgaGIvZjfTar+cXNfD3BabN50UHDHd3lB8D+URsC3wGcrG+n
         aFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783466428; x=1784071228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGjjqLq+Ks/g3qQWYtvwlz79UBgaLrZTTvu4D5iBSCQ=;
        b=fMugarGRHgHXMSGzNDJefm5S63b3jfAuRgZbwLFR7gnyitL5VXSK56uBD7c6CWnEmI
         ONYRDZ2kji0mfxIV5cZX0gAMfrPjgsGYilbhF1asMJzFb1SjH9thB8E7L3xc9jE5fLCK
         +EMni2axiq2Zdv7hdoFif3u1Rey9dtPJeVa7cX/52OGf7OpIUfIvBBBlxup7zwJ3fP+W
         nB9udMpz20DF8S1eCN3QdpphXNMeIVH7O7lxGzmCFKFr8fKcfDf3Rm3kHiFEhdkIPn8O
         kszC9LwSFA1CpjjgAn8R3WTmFBf0+JUsZyCIlHnFFhiqogz1ZNGMVCmRxFm/7G7hvuRv
         yXSw==
X-Forwarded-Encrypted: i=1; AHgh+RpFXQPHYHWVnCjLJ9rkGtbvwtHVwhHEHfPRcNUPbXBTYXmOHcbTVcl93lRFPuN0/Ry4rnJ2BwYVAF+w@vger.kernel.org
X-Gm-Message-State: AOJu0YxsoRVK5sWktxCAvu5CmQv97Hv9RcKl16zJlfJvbVVUaff47CCF
	LSjy76ZGivzwVd16Ycbf0mE6i5d8vmwrI0FtjzDqqwyAb2QhzPaqerx/fLvg3UBpoB8twme5W71
	QmSevFCHegOAxt7cVixiH+j1MO3qrM6kOH8/30vQSaPtxTjOQ/MOlafuVGVxQ67/2
X-Gm-Gg: AfdE7cmJcClfRQ0I1jOQNQFfOl3I5+dACkHmP4T499IMDrzlQonmYltP7gecGhEQqwV
	bkELPjzWn8TBtWb06KzA7w+Z7OVHdQDensrmfy4pH/Ex863aiVaZzKh+lIoidAltcvc1CF8S+4M
	dvZN/A1R4xkIbjUeEByKaUYeO7yiTc7C+WRnh1TsFQz2M3sXn46TlpvGFr5e0IWJ4VnjgKeDjlx
	jwwX9+BzYTLEiHkk8iEvM+J75kqxV1IZ3dzh5loKPnShSKhN+uPGiARhA8WoXZR0QmQv5QF4G/O
	ZyYPDElSmpdspvyIHmlXK41oGx8/w28DCU4Hdmfz/LLKX+SEsIVFDEcIJ7NVUDKPGaDOt3zfJRO
	BWX2VF7fN0tDQvCVZmszcuYA06g3uI6Z2L4gW9aTo7rtiUEHADuedw1MY1H+vElnXnuJ82lD70Z
	MutkA=
X-Received: by 2002:a05:6a21:1f81:b0:398:840d:39aa with SMTP id adf61e73a8af0-3c08ee371e3mr7498706637.29.1783466427590;
        Tue, 07 Jul 2026 16:20:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f81:b0:398:840d:39aa with SMTP id adf61e73a8af0-3c08ee371e3mr7498684637.29.1783466427149;
        Tue, 07 Jul 2026 16:20:27 -0700 (PDT)
Received: from ?IPV6:2603:8001:7f00:fc12:b897:54f3:b10a:6577? ([2603:8001:7f00:fc12:b897:54f3:b10a:6577])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac0557sm15675242eec.26.2026.07.07.16.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 16:20:26 -0700 (PDT)
Message-ID: <c2e03d2e-fbab-4632-b4bb-25c6a11bf88b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:20:24 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <20260703-manipulative-mauve-centipede-f8c95e@quoll>
 <2105eecd-b2e1-48b0-9795-ddffa8e43937@oss.qualcomm.com>
 <ur3haudwnsvg2vpdwrsea5ik665xxafsuz3iznvjctw6algz2i@amy37zfoumoe>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <ur3haudwnsvg2vpdwrsea5ik665xxafsuz3iznvjctw6algz2i@amy37zfoumoe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r-b46uzK6iSYn3jRZ-4fEkvZrmTVzkMs
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4d89bc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Xh3BmAQj8LICq2LrjkMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: r-b46uzK6iSYn3jRZ-4fEkvZrmTVzkMs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyOSBTYWx0ZWRfX22uAF0XOrKm5
 XtDlrfTzYulQOAAD6TPv0fc6uAOGd3Mj2+EY6sjGM07GtCnXYYCpfotprC116kH9xgJoiMBG5QZ
 SS0DPlZyl+JjDvepFBOpGg7+T257x2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyOSBTYWx0ZWRfX2yuA1F+LE5bL
 Y0m8ox8JcmqmlRPbPCHg+ge89aSCYCCBJH6QMKjueoIcheKKCEEDuNbqV6TbgZGx2lILtuTFyIP
 3Bsvt4oNSeXl84VsNLB4QElVDRjBUawLcrTzF2dh/MlDhySHvGKkuMf6sIET2+2+yeT0CL4NF1x
 KWA5j4qM25ZlXfX8qyzk1bblFPbhv3NXBa3uTVNXntzreNSzeP6GccEGtbv2ZCUFOgLSNYU9nEa
 QtI4iHNW27q3MLNwwvhx6Yp5hzWdzQKmt8CPK2UoXOimAHb4F6rbSxjHly5G2RrWiUBbtVSpTia
 3coiMI5Q4DDe1e5YnaadChl/Bh6HRgP2q1VF5wBDz0knPWz+KrmjWZgtN3jJ5rsFt4R0y5hTPlK
 qDYJg5XaIpLRV9l5W0WXCJJeSdz0pCoIcvbqRnjHn3cHfdL0+sE5eDctc/9z9fhDLlHEDmffqof
 zav1lgeRnY6xIDr9NxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070229



On 7/3/2026 5:01 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 03, 2026 at 10:56:19AM +0200, Konrad Dybcio wrote:
>> On 7/3/26 9:45 AM, Krzysztof Kozlowski wrote:
>>> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
>>>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>>>> independent High-Speed UTMI paths, depending on the SoC configuration.
>>>> Each path is distinct, with its own connector/controller connection
>>>> and role-dependent UTMI routing.
>>>
>>> You miss SoC specific compatibles in the patch. Binding describes ONLY
>>> SC7280 but you claim here it depends on SoC (not sure what is a
>>> "configuration" of a SoC).
>>
>> The hardware configuration - some (older) SoCs don't support muxing
>> to another port. The binding only says 7280 today, but after some
>> version of this series lands, we'll wire it up on basically
>> everything that came out in the past 10 years
> 
> Yes, but I'd also prefer to see exact words / platforms / references
> rather than vague "depending on the SoC configuration".
> 
The wording was intended to describe the EUD architecture implemented on
Qualcomm SoCs (as described in the EUD hardware documentation). Given that
SC7280 supports EUD only on primary port, I'll reword the commit text to
give exact platform references and add a compatible for a SoC with
dual-path EUD support(like SM8350) to serve as an example.

Thanks
Elson
