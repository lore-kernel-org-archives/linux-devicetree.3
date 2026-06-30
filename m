Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C448C2882D7
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827830; cv=none; b=QYCYHHf9AQDHpfC2OFAU7WrDagUQyzmyYFO78lowaJX3/GCP4C3XFh/ongEF2Saaf4iaNrkhu6j99y0xaq2Gp4hCtlvE6v+kDyDUT8aw5lGlCVZYP8mt/D5Axr7ZQvWrwAzZryQrmlXAbpxYFWsEHnUjwXP8BmEJ+/QbNnijHgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827830; c=relaxed/simple;
	bh=d1Xt+LCSeLsvO5aRhd4vU+y91sKUruPMlkg+Ebm4BfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1A1AWT+qCxH1tB9PYQRY/rq/wpzUrTH3SDblOT5lnNPnIeDz5Z8B192bVhUN1e5zbx08MyeEagq0998FV1lMza31DetwNBxN3+rNMzUo16cRZL3+szIeOz9Y3bqG9OONTZ2fiKl1P3aNkzRORw0JMwDT/upZLb8i4ub2+FiuBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJFmWDeD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/EQEN05; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJFmWDeD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/EQEN05"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mw7W1604653
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xGf3q1sMxp7hVytKtAfTiomXRp8edhMsYCsyjla46c=; b=NJFmWDeDxxzpzIQr
	JZzizpdOC7LqG5EH9JFXsTxreNVt7jo3OIMI1OZHLMeg8/dCwv048IMAMygxVOyd
	nOU9sWQwFQtTHnoeTU1qgkn4y86o87eiPmSFY1h7XeSY8PCv/U5xdPi6QA7epDH3
	UBWdWJQDcraiRDd5j8h1fgTuv/1TMZ0bWPmDVojKkBoeC3c6A+xYGq0J3KYc8xsn
	pDSbpBeRiFm9v+5y6nfjgzJ9I3LAraawRoyWGaZGmpnuVvyJ46qIkwO5wmhQx/6T
	zi41Lmp+esNCxEwXhQKQA9ByEa67bCo9OonnvvXq+DpCpfsXyls6CTcnoEcAoG8N
	uCVkNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fjhwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:57:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e21552dso36464185a.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827827; x=1783432627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xGf3q1sMxp7hVytKtAfTiomXRp8edhMsYCsyjla46c=;
        b=X/EQEN05dudiQ7gN5BPLHIUkbUKbwWE/PBmvL5xJ3OhUxKstrynRbBoXzQyRZwLHTQ
         1xQzVm9WGyu3E5e0ac9Z1yqjqnV8veTrrbaJWzKOSdPEAg3wa4AE1FHoKmz/k3bgHHpN
         qG/v0r29pKRzdl0/NIJiEbRwb/ISAAPV/iwKIRAmzx7RiKVpj76QoOCRxY4KSbIM7Nw4
         4OqNg9kYnilsES5XpVtrrYHv8U8DkZj+kaME4K8EEvDkacAsw/viRDYmzX9apWkF4gGk
         ZuySGII9gebb0GaO2EY6InOXNnSi/FWl5Ep7ewpLItgNMOQ0KkMNIXIxcBbbpP7Dv5mH
         s/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827827; x=1783432627;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xGf3q1sMxp7hVytKtAfTiomXRp8edhMsYCsyjla46c=;
        b=NSREnqczR30GWt5lEkTfQnTZCuWFVPyDtCSsamCWtLPFbggDzhj/Juvb0zsYDCnYWW
         MkeIlRupqGD+4iuiWCcEDE1GppKpbMMT4msQNqW6wZSRILm8qsfPN8RTM3cuuEqsxEyz
         DF7TxMr4oFmoRb7k8NrFuGaKWTy9UTwN1FH4nzrzYviZkMTwhnC1vIIspAMD3QfNPut0
         3UK1Q82mQUUNAe4ujKuzLJAdvT+X9bIGxGHQAvJQVf6TlsIJFFB1dHp2fuNKz0jxd2UU
         5pCVHg/Nc4ML6mgD0z79NPfPPIK8YLvDi5eBZt5qMBSs9pPzxT5XIjTU+x0uVOta2O3l
         LCgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZM7hxGdmZeVyD1lnzc0dbkPPENDJZswKQf/h+6sknKWWW6h/DCnZkECuvJzqbwX4dIPQVc1N1EEL8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/vXl7s0qJB/YEn2Wk4tQyT2w+pHtveVf4Fbbezt6vqgtLWIxY
	N3Zb6QQAl9FH7nyakP3n9wGeQc8vOHbibEXs7uwvHlJ3pU/BoTubL1zh3aQ0EZXlfy7ru+fae5B
	w45zGdVBWfP85Ya3Sk9drffE8Cq6h5jRrzrICnMZXGjELOWKYxCmb6jng/6kkNutX
X-Gm-Gg: AfdE7cn7eJKkE93FAf0PjmRDTTElzJbV0VNF4XNzZh4pbwOSG4Pw7E55OC9lKp+E5Qa
	Qma1xldRklRp+TzhkF0vwzHy7K2Lk/GUVJ03eUm43CBprDlRsxSj5o/DFXpMpKNsUfdxYF1L2Xi
	tqWI4jqcggIw/2s/QW/zezJDUxC7OX28k5GagbY2XIh4fu3FRJpGQDkvg5FUhPNjELrGJNRkEAT
	lUvnKNbp3N7eOGYVqCCEzw+XQwiRfUKL6VS1ceWfcP5COW4BCME+ZYrFfawdZm1UfQrLjdBHjQ+
	nCFr0BJxhIRUTJ7vEFsI9tho8wqU431iAaBanYSAjWNcoEvXuaw+HwvR8yye8CBSLz/wbQXvoIA
	qfNx935oCirjtk/Y2vXkTKrGTHR7RWrEj2yk=
X-Received: by 2002:a05:620a:4710:b0:92c:b769:ad1f with SMTP id af79cd13be357-92e62adf8d9mr360896585a.6.1782827827080;
        Tue, 30 Jun 2026 06:57:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4710:b0:92c:b769:ad1f with SMTP id af79cd13be357-92e62adf8d9mr360892385a.6.1782827826465;
        Tue, 30 Jun 2026 06:57:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288b082e7sm133823666b.0.2026.06.30.06.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:57:05 -0700 (PDT)
Message-ID: <53a2a17d-8400-42fe-bac2-6af997b5ebf5@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:57:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
 <20260612-shikra-dt-v6-3-6b6cb58db477@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612-shikra-dt-v6-3-6b6cb58db477@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfXwVBVGa7t4Geo
 mvKRI9Mq4YnKeajU5WaULEmgJWXpjI09hAY8FI0jqAIScJp/G4ov0i8GoyeQca4UiI8DZG3O/PW
 +NMiNcWAKw04lA9CLQhTV4PYgMQASo1iogZC2eeSUx1IbZLM1597RCqXJ8JvrUVsmuEwffyPWYG
 2o1TbLmJd1FP+2I6s5mgMX/+zHdLmMfMd4ofcO+P3vwEMJfhB6LZWYNbuLirYwF8c+/Wd2htIAH
 AnNwN3junVADdfbubfFY52Yp/7TIrs65s7ib7wC3ZxM7MbEIbuxk9xmxEFyDktn1ySSUHA8JfoX
 +Lm45ZeGsYJjpyzoznm/hBafds+i6tVBSAZn1+7gv1GbOKpSwzBeWG9+IXGUWRcUgWxZ5RhWQ9V
 W7CreGrrYCVD603xpdpnUQ5+3l9I0Ca/KEO/pYgU49u3eDC00DGxlBeRKj9Wwdbql86I9sAmv80
 X+tR56uVahEMX/FufyQ==
X-Proofpoint-ORIG-GUID: ooZ381LqGC8FmOMLH5cihD7t1wNmTE_N
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a43cb34 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=djcwQD5uGQ3GNs8by1sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ooZ381LqGC8FmOMLH5cihD7t1wNmTE_N
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfXyd+KCkqoi7l/
 3gP9DXY80wqX5pX/r/VVhRU62nsiuP8rXF5vArTPRHLV+dxdrQjxEkSJK+uwRGI7U8063NGKkeI
 TclxrvcDNxhZQIbct/OwcEsWOj0PfXE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300130

On 6/12/26 7:27 PM, Komal Bajaj wrote:
> Add device tree include for the CQ2390M variant of the Shikra
> System-on-Module, a compact compute module integrating the Shikra SoC
> and PMIC for IoT applications, designed to mount on carrier boards.
> 
>   - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)
> 
> The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
> peripheral definitions specific to this variant. Since PM8005 regulators
> are controlled by rpmpd, so disabling the pm8005 regulators.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
