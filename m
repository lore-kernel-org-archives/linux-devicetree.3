Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC5E3CD8A1
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944075; cv=none; b=PIr73tjj0jmZGn16mhkJx2iAUO0wtJtBmWeuhZnaQkGB6Vlg7Aq/N9bnmZZaWvzlfITCEOj/ktDNIo2P6M0a1n88MdVy64xHDe34PHNhu1ZoHXU6zJYgeV+oVx7tHXmHN1aRNXfEsrRpZybj3Y+PAvUSaW/HPWUH8JZdZj6TynU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944075; c=relaxed/simple;
	bh=71D5q3LnwShAxYqxMaE+yJpCvwEkx0ggRNjfGlVCQ3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8FS0KzKDdx1dAvYvRIr60Uz0pxIbL1egVJmNr02LKmdQEuCoC/JKWdMeqcWD+ItqGsgQHBKeO8N3yRBVPvKBwfICklvk0tHjAGM8/Yu4FTNjuHsc+VFMmVVTs+5/jov51ZkTER1MQDRpfe3ur3qzN6fvZT7/7ewtaX9Pdq74YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aqi57tLs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6WfrqZu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aqi57tLs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6WfrqZu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V80oV6430936
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cUFyAnWnalzdlcqrIiIlSnYf2f8KbjaujscQYXFddmA=; b=Aqi57tLsTxJbstn+
	64s9RVVObvhQo/WuaXBah/DS12xXh1tfRsibD9veQW0xzpAOPA2dH8tsNddW4RKE
	W0LytxdiWL4EsGocln6OvuDmyib70L6kDtYwEnY2gu4RbtsD5cnLiDrerM8qEwnp
	iKs/q751XRw0ejfvACCHhQLQRabxdnvqZ9Fz0gw753DJp5tlV5sHpIpfIai+ioaS
	zKmQEA1itRpIEK+GughVmlxENZ+XmVGlTmdauf0hbMi+w01afJK8ggXvR+HMA3H5
	T4Vr/nyXfs1dLpf9LW5EdAe+y6iKqy8+FxMn5LB4ioGLDlkpYzSkaqdVGODQGSjT
	rqUMZg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfhach-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:01:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ba793d06dso4515151cf.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 01:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774944073; x=1775548873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cUFyAnWnalzdlcqrIiIlSnYf2f8KbjaujscQYXFddmA=;
        b=I6WfrqZuSmWatRpWx4EpPTXRaZ/3LX+x7GOK+tT+4Y5G3/TrOqxwZtSJqVu+ZqR3LW
         Q3BmhC3cfJq6SImRUScUXsOK9nuVZJkpHrsVd2PJTycjVWrc7QJbA9FcTGWFeG2BFVGV
         FF7v4QSEpTOi/Im5OQz+V/Nj0BtVbOuXfpNaTegzawtoczf4xQlWivOyYJNVmQPI2auP
         PctjIIR0Eeqfn9KitJN/2XumjlhUCND7hVHyfU+Ub5/WB3saUrx0STViYwrGYETGxjmo
         ha91dU9UrhpQ/fY5SpvxfCPMmdNw+xus97ptHAifs+GTNXLqLiBmMB8z+0TgWCHxelAI
         F/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774944073; x=1775548873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUFyAnWnalzdlcqrIiIlSnYf2f8KbjaujscQYXFddmA=;
        b=sfpug1XotzQToNAzcCaS/1yWrLYHvXgtIXPXL2WEBnBiBVbWwPuh6fHbUkzUu0QjUL
         V7vg0smmThOuXfcKu5uoJVt977AocnJ9VcySXJrUKJaiYGI1MQAWpzPkyI/Mazu7LXlU
         o6eEoY2EtqAK6wOB3K0BFiZ439FTxlv580FkmuEksSNVDoto12Uc3QtiUMDJLau71GK0
         WuS2jQpkitbH3mQ+js22R1PbvT6jRuttfPFdXvnDHHuhDozE96hsOERdHo8p4qiSvLWb
         Jn0G/0HXM2ZSIAYbv3rLtebIkAFl9PCxd9NgSrrPDYNeFvuaFGZs7peqzpOiMon4Q9s5
         rNCA==
X-Forwarded-Encrypted: i=1; AJvYcCUFdNdyV3ccjuSbcABYzBLD7vZdQGWptYpODFOComSzaW/YYoqpghjgvC9f0k83stRYRbywJsrnDjQj@vger.kernel.org
X-Gm-Message-State: AOJu0YxtWUwL33rtwowUpnfNNkyzjaACzPNgfRW6Ckd7tEASAOAa11+w
	DUMDu8k49AvDKqlVQKKwvNEnUYcjZfHXMk3Nb9YqsSsHjplj8NghwZZQoIyuYDFvX+VIe36NtFQ
	xryfl2rWbphzI2cE4+Kw1bV54+mQlpMyEb6OhBRUmR6idpUz9F8rw4cQaETXbcgRe
X-Gm-Gg: ATEYQzx7uLhCIH4LaziHn0482y5e1syL28yn8F0MOR26m+N4hiFCVLbQsQ0qLu6MUiu
	/YVXM0jcMvRjNfIK6EKGsA3fXbQdcO3T2P651z55MAS0/JnUVe+oXLX16jZ3rSZoWWbCKIJl+76
	pKWvgCr6oimta5LorJoESPmhCKyd0o+qfUWeqmvAhGDgqPv2INjbadIFy15BKGbt2Ua+fM9ugSb
	/QZxdGl2v1a/cHVEvgCVmKwkNw+SLN/g/tQj/nkcjAZvl+Zu3xVwQHxHTxTtJuAU7Hwmo2CM4Ht
	VVRytpJPeWGR8wa21GmRSyNdoS7iw7dQqlXzlLdMAxY2zjV/s0BlFAC8nVsdbt0T+YSxvL7EjzE
	Pl+PAqsHnMMTg2UlncgnCcNqW7jJSs162fO0lu2NvDG53ltRP6lXedZMw/gsRWREpdJQEKI/9rL
	QdDDg=
X-Received: by 2002:a05:6214:250b:b0:8a2:18b4:79cc with SMTP id 6a1803df08f44-8a218b48708mr50473796d6.8.1774944073088;
        Tue, 31 Mar 2026 01:01:13 -0700 (PDT)
X-Received: by 2002:a05:6214:250b:b0:8a2:18b4:79cc with SMTP id 6a1803df08f44-8a218b48708mr50473316d6.8.1774944072693;
        Tue, 31 Mar 2026 01:01:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae23f18sm372898566b.1.2026.03.31.01.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:01:11 -0700 (PDT)
Message-ID: <aca0c679-654a-4c39-8ff9-197e820653af@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:01:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] clk: qcom: Add support for global clock controller on
 Hawi
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-7-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cb7f49 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rjm_ucXa43sWr1tRvOIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NSBTYWx0ZWRfX3v4DkMsS1cDF
 C1D6lS5uQLMc8GFAXM9D3yENgJ+ECjGj7P0ewD8XTR3+4c4+gMbeCmTjcinSd/13CGdAj9UamI6
 zsq/JYtvDw0ImxT/rfe9nuRsdkW0b60DvWrY4ZrInYX4CJYsUwNyMH0N0SAvIMrmieHW3j6gJqm
 vcAVdu/oxTOBZetcQu01dhpq7qGGujMSNEEK03P0s9i4StuL6aNdj4DtnWShXxgoVwifXDh4KQR
 JPDhADG2Kk1qqvgtPLrivuFq1ncAG07SDiuJOsYF8rvBk0joCTOzsraK8d92RKHTm9Nlmk3c5dp
 kJmkFa09POdY+Cxlv9kh8T/TYWgzimhHwpHa/ixeB7mXkOqM2uzLDio3i9zJxv4WulDNkJZ5JRl
 PrDnwNHcf7kU4EtQ518fNw7dbbqM22LdLcaFPv1CsRK3q040MZEmSsIFJj/Ba3QAuvzhmV0d3IF
 YWo8qkJQZYC7LNxdnpQ==
X-Proofpoint-GUID: 2stWYtVrbXH7DdCuYpVVKXjkaQKy8Yel
X-Proofpoint-ORIG-GUID: 2stWYtVrbXH7DdCuYpVVKXjkaQKy8Yel
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310075

On 3/31/26 2:35 AM, Vivek Aknurwar wrote:
> Add support for the global clock controller (GCC) on the Hawi SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
