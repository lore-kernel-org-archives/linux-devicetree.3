Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D373B3891
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491502; cv=none; b=N39xQY4nwlfZ0ZexmBHgvOAQMRbFwpABMvetu9uXgs5xrq4HkOf6RdBBedvHpaFOuO3iFwfUJQxGRAs23ds2G2Lm0pvLoHdJpG3lmFO2wFR9M/3RyUEcZ+DswHW95QdQZrRsdEGukzfFMBbFAoPrikD+0tmOI9IMFHiCZZQKgAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491502; c=relaxed/simple;
	bh=Rqlmnr4CRzpdgMZyKtYLTlqhom2S/HUqMDkMLwvSmqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGEZcu8wd0/Ljls8aYNkQFBNaL2nhNxKMmkPsAovazXQZJ/VhTlkCSehIbjnMEEVeDdnK2GNY7YUvIwUG31xmKshiYqyzcniKUwvqM5FAl0pSfZ7AZyto7vawdAyZNQmhWr69mYlBzE1PFwOkE2nZnVH3Oq2yo7poSDaIZBSbeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qi9JjwUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8b9+oH8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qi9JjwUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8b9+oH8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CfIXO2076119
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 12:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LN/T6X4gkrtOTjF6PAcl6RDvM4U3ppr+nFAnKlCuqQ8=; b=Qi9JjwUY0G4Arm3a
	FXgpD5wgWdRKJ6d1R82t/y79goB9BGroRqJefnQD+8/QSi/7F+VCW0TriQIy2QuY
	vvMCrhpqENsQU7Sc9slkeBJzr1zBOZl2V/lUbC11zd4UjUKoHwH6WagYoA3LEGwf
	7qx3OUKr6y5uuG2cPCpuzE3/DWtr7jL97hNTkfVR68XuCdQmT6Z1bu7Subb+Tncj
	ZZgNDO6s1/dziJQbhDYC8yLhLQb0vwIeS64yAAk8G2/Z3xdLGd05kziJMh07yCs9
	lDLoP09iflwsdOAcehVA5jIcpUknC/k4uaSc7YQxnkinqMv46gQDIVtPw99rXL8V
	/8+SRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev19kyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 12:58:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b8fd12aeso238630785a.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780491498; x=1781096298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LN/T6X4gkrtOTjF6PAcl6RDvM4U3ppr+nFAnKlCuqQ8=;
        b=b8b9+oH8IafMuG2GNm3gWusv/SzErLXn4S9wKdurqmiq73xBTe20T9h54BU9KNPfbV
         xv712CzThtWRNCOkeYvl4eG46Dk6ay6kQqVa3wby7GYqM0b9iAMBHPeNq3Tlh+jTOBSR
         QwSs/7i3ifSdDmjlCszoOL72CNHwhYbxK5HNRQ+es8Y8A7YxdmFPTfLPMdQAIndpcWN3
         /OMDgBsIVXm5H9Na3d08EjWDNzVU62l9JObwOt6B2plsg3UsajoahhZ2iPo2oNPPlQO0
         yG5roABpebIsKj2mrEEy5eNaRhpmAjrV+ySTEaL02Dwdw9z2K9/IhiRy//Cb4aO9zR94
         qD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491498; x=1781096298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LN/T6X4gkrtOTjF6PAcl6RDvM4U3ppr+nFAnKlCuqQ8=;
        b=N1VY8UmLihYHHlRSS6V3/G2WTST9dvBNeNy9PjWxx+CURC27iZF1BSr2tdS4XVpb+J
         y7xBfFw+LIiT++KaVkuWg3uHQMiWAQOZMYA+tPPjKaX4D3VubNiBstUX/EpdEp/enXZE
         vej+CRaMfGAhSxiXYspKvmcO4GI30ZM4HPCq8WhT1a+pRhyonPkEwss36wHbLMirHWZF
         ZrFyqKNxTTO8XRLPWKwtf9vw5Ru6UhmSHD+agtlZ8rUca9Kya9sRKve7UWy9Y7Ji7ShU
         RU41j5dERd3sfsIw0HIyAAg62MCc9UsdpbQUUkUZDf+UL2w4hnEz5sFZfUMB3BcKFu22
         4pjA==
X-Forwarded-Encrypted: i=1; AFNElJ9XGP976tCTYk43pz6ix1DI/WBP9LPO4G3hHSHAb+mN/D9j7YEAb64zlsmODMjSaWs72cPGom7PlWJO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5vyU8sQs3AAZxaduLJhsfSJv0tiEjM5wNYi2gsA57BSDJrVp0
	jo8vSk6T9YOH7UWbCRAjKmJqKtgdCZzgVpWCLjvhEobe2Qp3Ff7ShVu7QgXTABDaDM1eez2eZoX
	9wip0tSkdp47TWJO1dQf4v9QYtwxg62Iy8g0cvCZKGrX0tmhOSBqrhsXGDwUmY8lh
X-Gm-Gg: Acq92OGmEo85AgF51NuUode3ldGESnvO+E20OLh5OmykbercHvDEtgORyz40X1hq6Bw
	vpK0wBELmLfwMIbLvApwvJ1khlk+b/gfCrojpjJKSpA6ZLT3xF+Pvhk3uC9NeVHQY8m/K7JgHqZ
	ut8Hxe87pVYrJ6kUjTfgTnZRMEGamTqsWceN+euJn08s9Xf2tr42XZDcArVS8wyObTlwfKM51HW
	QKzpSmNNXge4VI31N7VO74LdlZ7nB114pBbLpF+lVCK8cWWLdt4tT/d8MCWM+Ew4vYW9w/2BY1y
	1DHK50v3FWV7gMb8HICGDu8VJmQOxqR9niWhLxOHD7c0VI1UYWL8WdEQOc4rD1L0I5zo/CuRpNb
	0AT7+hUFf0ZwNOQ8EqhXWCX74hX3rEw3UEfD8Y0qGb/sinyMw+1XtdmBHwHrJ6fPH6xa/fMVNt1
	JhTy6LHIUTwlI=
X-Received: by 2002:a05:620a:2846:b0:915:8055:3f9f with SMTP id af79cd13be357-9158a3c282fmr370553485a.6.1780491497815;
        Wed, 03 Jun 2026 05:58:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2846:b0:915:8055:3f9f with SMTP id af79cd13be357-9158a3c282fmr370550385a.6.1780491497334;
        Wed, 03 Jun 2026 05:58:17 -0700 (PDT)
Received: from [10.100.11.76] (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1f62sm150973466b.57.2026.06.03.05.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:58:16 -0700 (PDT)
Message-ID: <4f9e8453-510b-4759-98c6-00c5d636bdbe@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 14:58:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add
 Embedded Controller node
To: Daniel J Blueman <daniel@quora.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260526112409.66325-1-daniel@quora.org>
 <20260526112409.66325-2-daniel@quora.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526112409.66325-2-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oSC6X_nXEGW6XNXb5FRC5OtP1k3mxOQn
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a2024ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=k28v5m6LebR3MJSO2ogA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: oSC6X_nXEGW6XNXb5FRC5OtP1k3mxOQn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNCBTYWx0ZWRfX7ETlq3Ntcj9y
 sBOCdPfu992q/PVRCkGECBfZOONLpaY+TAwDXs7nzJFUqecz1ewAOCaeXKkaS5yOi8ikF7KYYPy
 bqQDpyV++D7Gmi5ic/cX81z5V2DqkPe3ArQHcPtIb27Wc/z0tCkXQ9GmsqvmXkVREdOYEYBE+IN
 seh98fwM0kAWh3A4U1KcqUvfmIcfFeXcCUbW0IEarbdFIwE6w+7bNb2wQSTYxOlLVlsHTX/tC0g
 Z9CWcxZU/coC5CqYLr++QCPjQLZTIwHW6UFw2eSygsJEBEAcmQKUTykJe9G6jKm9JxKrnLhKsUw
 24FjNp/EkJS65QhAya897ylYRf8naOJiyJLP39wMGopvPMsx7Ojq4x10kpVFvVPychB+UjL1rX9
 6PGm0/2h6HyyUfHs5bop4X9VrSJHIAhErWezJZFI1J+3szOEv11xrBz1M3AmiD8vqndN9kd5b1m
 C/L/11LSVXZ1y+gIHKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030124



On 26-May-26 13:24, Daniel J Blueman wrote:
> The Lenovo Slim7x uses the same Embedded Controller as the Qualcomm Hamoa
> X1 Customer Reference Device. Use the lenovo,yoga-slim7x-ec compatible
> introduced by patch 1 for fan control, thermal sensor and suspend
> behaviour.
> 
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
