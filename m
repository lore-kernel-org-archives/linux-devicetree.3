Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D45A3806A3
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358901; cv=none; b=tZH7ga9VxBydOt4A/hiXrSyQ8rSSDfMa0WHxD3wgmx75VWwajVjSviUGHQo++tpw4EW1L0IVWelU3lgBfMEXDs6fS4LhbCcEOwTs2ZPgIs+26Dw7BkTpBui26JMYus40akl/DFjiR/tUG8FBaWvRMEBdfWiCXR+ZO6qFSwY04jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358901; c=relaxed/simple;
	bh=QhPbVZ32ARSFRCmhEhRTUEojjFFbPAw0ehbADsv4MSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mkRg2rezhEZJXrza+7iidIYly+ItqouXLSDgAYfN108Hj/NPNe2YJMR2xo46dex2+kicScUY/V01b6+gB2u4P8vowjQ23fIOcSiBoMXdE0EfVnMFBZdHXlh68TMCLIN0LXBLxahNeafJScG+vXQy6ImhXpgKvcBMZSEJsBE7WSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZvptoeV0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jz10epXO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZvptoeV0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jz10epXO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99upC3772832
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GOctqrIp7yWxZYDyUjClrejv+dblgIqYIZ74d+eTfGk=; b=ZvptoeV03vV1RnIx
	5gB3zabIGRZ7I6uhUA61mqkv43tMGfeGejMd/JunCKORhS0ZVqR+ZGdSnlWv9hyM
	i+OdPEqqtVSkfxKtvmJUa+PMc2Z+UY4JqyiG1ywFJ/JXZJUShfeCdx5F9zwQ0ft8
	ounGgYDkleg5t5TDxHL2NQslxqqfGg7XhFBYadoRuMXjglWAANaiSNWP88hvsWKR
	jUj53RhTIBltWiMAhzSUfdxjJYoz6b87ojpsKsraMGvK1BPsm1tP+ao3dX++Kd53
	WOtA1JCMXbe6QcQUoNuQhc6AgtVY6B7atO0yYNOnzWzLKBThFVSs8U11shBddYBb
	RPIKRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma42qgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:21:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faec938fcso15201491cf.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779358898; x=1779963698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GOctqrIp7yWxZYDyUjClrejv+dblgIqYIZ74d+eTfGk=;
        b=Jz10epXOCv6CY6CAD3ta2FFuO7Bpr5V3YA2XEdw5xmgInl0DKQKMvfO3h1+ZDWq2Cd
         JflrlKjpRCO0yz9lQ6i4OeFe5bRmhZ1nz+zHB18goxEA471m1iXWR94O5mycMOq4SexM
         c699y8FJMyh6MoSfY7mvn+x06xut4X+uhn0hSxvwQEC195JOmbKc4mRTvryWDlgPl/xG
         4zX7sk9U9vgRIWGKzI7hnKbrQoYzBIHlQNvk3uGdijNTuVShmrG1xyvR7Eqr7b5moWt8
         G6uCY9GvUE79i4Keo6TTqExyIGCsGKdepICqI/Z6pSiI5Io1Ki1YdhhqRjGZqXycuImf
         Xcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358898; x=1779963698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOctqrIp7yWxZYDyUjClrejv+dblgIqYIZ74d+eTfGk=;
        b=eUxiaxUfr+gJPRK0S1rtcRUw4xnj+38db5CTif5F9rDENBcbktMhM+bXTNfvusyhWN
         fzGcN06wZPeHABwPsekcUkWgEtti6h4AkAPtQXxszOKwbqErz9K4HYfKnlkkltkl2hCa
         sREp40g6kDzmvXmi2KVv+RWJc3k5P3sUxutKJ5dZXuWr+BnSkH53vvCovkqLxUGtUX66
         wuGVS5xvqX2nsaqg19OCRRs7yKMHU9v7ZEMRDLi3pf8TMZrlXGqb866MqYf3Z7cXFk+5
         lRXf+K/7OwSJ8emyi6k8a8Uf4/P/puQqJpAMZ2TL4gM32tCkZlh4Rw8zz9Q8NdKXTtpM
         zueA==
X-Forwarded-Encrypted: i=1; AFNElJ+vuBMvH0kYwEuDM/56z1WA+MlThIjTXOfdDT/D4P8TdOenVZ+TBBcDFIy5BfTKtAnneA6veP9AaW+C@vger.kernel.org
X-Gm-Message-State: AOJu0YxtxXOL6eOQ6sUF6hIEknrnVLRgg9bYduD3cNXqzJRet3SLDE1j
	YNAPwjsQhjAefKTG+zF8LO55jazkvuVIUgmLhmJwMuOsIEbKiIAH+lKQnz5Tr1aw+8sdWYK8h4q
	m0g1+AEiVRJJDj92XugXJoq6177eC7IJL9xXN2O68wCHEjhfGEzxRZah9R1FcCXDswC5nSkHg
X-Gm-Gg: Acq92OHxU0wfA8bPFEf+KjnhnzV/zJ2gV8E4nnhsAkhVuxQavlv10Uw49RBGx6pQuKQ
	IolUYBrQ9x/amYsX/pPCd3nvQiTfr6uBH6aHqM9HZcNNZvbkGB/PqYA+QAC5/iiWs1LUcFYbiE+
	9XtIWNeGjqmK5aTe+hQliILIuaMKTM7H4pLwx2us52B/e0EFdkjySJfczfgqE6Ffjbaq0pB1vcM
	f5vFjlIF68c1ozhw+C/wM8y/nBKKs5aYtqZQC6MWHKftlM4zW5ePLIVmlT0sX5GkPf0N3Emkvdw
	hop3ZF1v9EzpSo3GcTrwsGNpWBYbsC/aqrhl3e86rUOkPOF9p/GHqVIt1Hqi/Lr2amsPHxNzi4c
	yPLioOgQX3M9Baqn+drqm/w5peABaWDilmJDLY/a2OU9bgKL8SsFQnv/4076wPbSOYPZRzgKznd
	cezrc=
X-Received: by 2002:ac8:73d9:0:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-516cae0c958mr5233921cf.0.1779358898277;
        Thu, 21 May 2026 03:21:38 -0700 (PDT)
X-Received: by 2002:ac8:73d9:0:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-516cae0c958mr5233731cf.0.1779358897736;
        Thu, 21 May 2026 03:21:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87890f2csm27749766b.3.2026.05.21.03.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:21:36 -0700 (PDT)
Message-ID: <19de35c4-8ddc-4824-b8c6-083eb53a5e8d@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:21:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] firmware: qcom: scm: Add minidump SRAM support
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
 <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519171442.1582987-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0edcb3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=y6rW8TDjuTIuaxCCkQgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: XSjC2aDlGFE4KRv-db9HuIEm8KhJ2_AQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwMyBTYWx0ZWRfX72JSPLUauw9D
 ICfQc/q7iVaF7GLSo32vikBNa/IcA53W2XfB37ZZeLkaX5TWEb7T4kRDX1+Sa9urfPABPctiFSE
 rqXDxtPUgCEGJglo2Z6SC7byxJFfe6j92qlyS6gWAfnHVrU03NhBqU4iM/A7Pg2/HmGAdWqDPHr
 6ozSS1bG1svMCcOzxkfWDbipq8TwrsgpKa9IYz7bagbx4SKKe034TRYucvZl9AqnZxdMvDCHYCU
 MDWTidXKQaInxYX+udRSqVxvM2IEC20pggI8/85j6G385S8ay+dwkSxes2pWuiQXbZT+KUQiTqq
 dw+LEVMnUcRjJ8AoDmvDQbJVi5wR0nWLspxN/0xAm6gWi69vqTX/1S/jPOYkuc9g92BmTv8y+Bf
 J4UWM4Xnw9mDHUKj0c7OF5u0M765xtLvGKuRhS17FMsoBfpyNZlc/VrFCxEdR68VY46ubcAZrZf
 4q/Aen/e4xJSLewG1mg==
X-Proofpoint-ORIG-GUID: XSjC2aDlGFE4KRv-db9HuIEm8KhJ2_AQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210103

On 5/19/26 7:14 PM, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
> to deliver it (USB upload to a host, or save to local storage).
> 
> The SRAM region is described by a 'sram' phandle on the SCM DT node.
> If the property is absent the feature is silently disabled, keeping
> existing SoCs unaffected.
> 
> Expose a 'minidump_dest' module parameter (default: usb) so the user can
> select the destination. Only the string names "usb" or "storage" are
> accepted; an invalid value is rejected with -EINVAL. Changing the
> destination while minidump mode is already active updates SRAM immediately.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> +
> +static u32 minidump_dest = QCOM_MINIDUMP_DEST_USB;
> +
> +static const char * const minidump_dest_name[] = { "usb", "storage" };
> +static const u32 minidump_dest_val[] = {
> +	QCOM_MINIDUMP_DEST_USB,
> +	QCOM_MINIDUMP_DEST_STORAGE,
> +};

Since these two are supposed to live together, could you turn this into
a struct?

Konrad
