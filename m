Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B8B3AB28C
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911789; cv=none; b=mzu8aTMKbCMNCLSmrPpT1/B1MlV5RbNenEKKhHaei2B9o7iz2ebnVsBweBX3OmgigZIHewU0TLXwkxLQlYQY5yNERHMYuTP/YUhjEVBA6aU5dRLEq2dhziFtzbeZnibp4hEmPEmGE2tV82ltPcr284YSesiUZodw0fwzrK4mos0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911789; c=relaxed/simple;
	bh=q9/WUDpjYACV3HQ/MPH2I2FsGG/LC/18uhjOtfrXDQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hMNt+oWrxUSEFt5lRSF8POnZhcTjLMWTkUgGNR32Oxhnb7BKVHVVG6crUJwhYsYru+F0E/EQeSXvKGQqe+PSYFy+WmLuvruPmoVtmUYzDLZ8SOjgq1QIXNMT0noQRaaVCRNEzxAYTkpdYNiwmEHUku9tQQ1o/9Lmc7WhSryAeDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hauxVAet; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP7TrPf8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hauxVAet";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UP7TrPf8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7muh1581438
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qG8w98LlfgwYM7+PXIbKddA2vCkTh9ZYKK0MmdhadGM=; b=hauxVAetb3lsoUN9
	4z2erfwsTb1R6DNRs5BJax+nZqaXWFkvQ8lfPp8BTo6iBf/lWEXmRk/8P3VVh6UE
	n+EJNn5pIQGtXiuXgFKRKzG5SnUgPj9yxxjhaTbcofP395T3ieswL5bkB3PZsX3R
	fdUd97XaobG5nm/pMYCcvxjhdY1domnCsTjNfsHsX8YhNLOMfH2vrOzfpj5MSZ8d
	KabBF9UDrCtFrlCUbGOpCdITlZrHAGLewOx5S6O1C7DkQik8YGYhGmSAd6G+f970
	nR6J1ijYpI2YoOXoY7WkwsBJDhuOCMLUJxpdJFPEEIISeTE3KbjHC0BBtDoOL9OS
	ZFp4AA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatnc3chr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:09:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fbd0f0367so1135781cf.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 03:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787911787; x=1788516587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qG8w98LlfgwYM7+PXIbKddA2vCkTh9ZYKK0MmdhadGM=;
        b=UP7TrPf8/mdzTRyMleu+ugmQVVsyF6vXzfWzJjn4B9foNhhpb4+U7sGZ49XIxBpz0K
         vMC9cGCdXdfNwmiMOIpJqz+3QlRRTb+pRkuLBTeCNr4PJ8p/BsBWhDddBRbxJT3RqiKm
         YoNqfpKNcX7v1YrZA7L6nqwbz5Waye1y2vyRiy16gMVQeae43CNegNT5bvuTwomuEUpJ
         aa15UBTSXEiBOIrGUWsovcjh8/1uC/Ok/XsHnTOk/PfY4TV6yC8pg85DYUXDDSOPbMYG
         YTtI9PaItpvQGJgGJ7xoXv6DAMzm7YSa2sx+zFDoVEyqgqJYYseNsJdiFh1PxUj+9XJv
         ZtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911787; x=1788516587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qG8w98LlfgwYM7+PXIbKddA2vCkTh9ZYKK0MmdhadGM=;
        b=eZSTAczx61jDN39jZ1M/MSOQFSGA8G0QskWNL3IB6QGkoIDdXbsh7UROkxlCH9rp9A
         ++Gc4ugZHLI3kjD+5PJJRdIgh+gvg/BYGx5yHG0Uww7rD9jQyuClOaSjJCBcdFwXm1zM
         9KxDcf3wzrsbgBE4wbmC9ifwCUBOmFkvPKetcZ+PufIij4bdnaqwZ8wv+3Ee50CG/K2y
         R6vkjJ9SHZEPO4HD8ielCxTUbYOO4F2rlfWtrVCtgTaLivQrW9B6WPoltdc/qKmjnRqB
         vq2B5DmcWf/PLdIQUX2XoZbRrx7FYbXijrt0SsUT6w1c/WuwX78cIIbh3uB4C78C+xK7
         XJaA==
X-Forwarded-Encrypted: i=1; AHgh+RolKe0XSCfhqNVlbMYiydkTZthhPEela9BIqfORdbOSXNM72Uw7xbpm0A9bhPyO9nj3OWr7OVauEqtq@vger.kernel.org
X-Gm-Message-State: AFuF++l5nc30fy3j8XIEWL/dYe8v6PQ9i53qjldmvp7t+GBRD/mkL2HY
	cdtnWlFj5aT62Ccnld7RFvMofu2jeGPMYV7YAVBKkAyzfGZbsVZnBYPdK1s6JDNbG3LS3B6FQBy
	E0Deo0y+lx/nOcldMxBCCkWoRQcNNWmmuHOvzI1WBtpQgDPgqn8egdxWOV9VQpSnY
X-Gm-Gg: AR+sD12M0T5TXgbRA8kgd2k1VJxvDKtJbkU4vGcm+98yFc94trVOY4djE+lEn8L2IAO
	44HqasYgWX0dn44oQ+EiR9wp1YUlNhtKK/iEROXOrYMNhAsUiXMra7Qv+UeRHIAgznv7iiYCY/D
	2RAuxk5dERh2kggrYYFTiz6l8GDsOB47WcHQ71aU9TNCQxErzKzeamFUjQOzmkAiqc+RD+XbOrW
	CB0YWDl6dOVijf2Ga2xwHo0eHhHRHwIJ0pKJkC0CnVRPEFBchzazxdls5MG8mqpwE0s3NNVvTmU
	+zpMQm+PvCpauaMelvqtUgs7KpVuYBe0xVcAM+hOU9VOotbwKqNLqJb+0r4crgv3OiDcZfDyAGn
	ccEq9HmP5dpos9W78zVBA550=
X-Received: by 2002:ac8:59d5:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52fb9667fb6mr42774611cf.4.1787911786637;
        Fri, 28 Aug 2026 03:09:46 -0700 (PDT)
X-Received: by 2002:ac8:59d5:0:b0:528:3722:a372 with SMTP id d75a77b69052e-52fb9667fb6mr42774201cf.4.1787911786266;
        Fri, 28 Aug 2026 03:09:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c389aasm389350a12.14.2026.08.28.03.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 03:09:45 -0700 (PDT)
Message-ID: <3cc7897a-deda-471f-abce-d3e2fb6ba171@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 12:09:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Drop redundant
 status=okay
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfXzFHTpk14HAOi
 pDieVMeqNYyWgOoTI968qr8N0mM4LYC0Mak6UhmygflY40wj6ACEtciDyD2adjHhxsU9e6qN2S7
 9la5IN3XG2KVrggS3FEUVVtIpcKzdQVivf96RJlMEhCbU47aoksSuLyPNdlpfAZuLGtIiA1gGmq
 LOcqMJa6/7fYaydNzdsNmcm5SoJua5/CGpOm2lF85ni4Hobm9PGvPjhAQsdEKxAMpPzbgvr+dyP
 DaejFAKqw49fEQFVbZpBkIOUfW/f8KIL14Y/poZDYm2dtWitgYri8yXE19Fb8dSvcm0TbjwJRsj
 Xgo3xB4RIMkqNyT1EQmtHjHGox6imewOH66OSOQ7eEu+doM/tW4UGteZiCTq+r+1EFU13/onS96
 fW4r87np6PU+7rHASHDshalBZmVx5QiOIi4xrmzjIZp5qfDN94VBDXAbxhWwWDGHkTqwXh7WqAN
 9INFHZAD3RCEWYYNYRA==
X-Proofpoint-ORIG-GUID: hWEStL5rHckkSe6T93dDFsn-6YxLGrLx
X-Authority-Analysis: v=2.4 cv=HfUkiCE8 c=1 sm=1 tr=0 ts=6a915e6b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZOeRlPTctedjAYETTS4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4NiBTYWx0ZWRfXzR4yoD1lGH09
 ELahRSOAPahezLLUi1y2HqkOtFGlKC6zu55KqshpYaKGijYfnH0grFWLyg8/cc5+P17Gl4Fb9gc
 68p8SCaBSU3UKvWNzpJE10ORUk8Bzcs=
X-Proofpoint-GUID: hWEStL5rHckkSe6T93dDFsn-6YxLGrLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280086

On 8/27/26 11:50 PM, Krzysztof Kozlowski wrote:
> New nodes does not need to set the status as "okay", so drop one from
> fuel gauge.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
