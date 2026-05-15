Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAEC47A0C7
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847507; cv=none; b=rcRgrRgKvjwfTs7N8Vynz2gKNBTynJwyKbJaipryFTjVXgggQC9oN7LnoaQNmxdOEXmaIWJi4d3frd5piQbSrJr7uzbayNI+CAwLHJZA8TsiO/Pbu7ToKl5EInNFVdds5LyIL92qzB7CZRl8C2cG6d5YPxT27LeqxhbiwmxJcbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847507; c=relaxed/simple;
	bh=Y92+NnwPShhzJLFZjXBc2z1/q5TAn4x/wrrX1Jcu5MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DO/Lp7vCb2+PfFETI9p7UCaNqs0Bdd5LcOjIbfmcVcG9OIoqNnu9TsNTP9M/iQ/l7frSo7SGdxr5Zmlen5Ww1ldqmo1agW5IWE+sC0yH7LBgwrb/tfIyZjjjIRIDxCYdvrPAGvUIdwdje0ykiEYeLzRhnC+F/jOSvTC3rBjZrXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9kSmNEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XrSkcPny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9kSmNEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XrSkcPny"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBeOXv1847948
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KksamNBaqVa2U64cjQ0a6DqxRRIwuhExB7Te5BU47lA=; b=d9kSmNEIqnh+MK2b
	YJSUbbcESvpM/dgfpOAgRFml+eYXTlYwIhudBwiT9zeJU93fAkrHa0qi2m8WKuhS
	e1zFWYXUSRt+87o5FgLxzBK0XvRuMqJzd2mwuX5iW2C4BIh02Ev3hOiL+kjbWcj9
	Bkun37qMYv4nPn72PvkZ7x/8ZJf0AA+au7s5BI8biFZYjX+6VLbMAcYsLBkKy4Pm
	qmjvwpsxHc4QG0f8H7/lkm7F21Evh4z6H233gkBOLmSBO+ViOUuvAa0252OtfNAW
	WiOvUOngnbdgOoP740Pol/oEXTCvQlu1ulh0DPTqhDHXNnhYxcPZVJ3wIcXYWGJH
	UYAWLg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t356x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:18:24 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ff9e60dd65so698824137.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847504; x=1779452304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KksamNBaqVa2U64cjQ0a6DqxRRIwuhExB7Te5BU47lA=;
        b=XrSkcPnyQIAVH3K7lYrhjPpbstcXOawOF4Wz06yZMksiUACMKDIPXDZfcJponIQ0Y4
         BHyBzUEsQ0J+sa5hqwJDq4t4SEiVpJc1VbFbyQXDEEHy7nmOYwTukH4MC9jtN2K1HbiN
         1CBlcJn8xFnzNv+G5lKS899YrxoC0ZTIW1LRUFVoT1Rg9V/dASB3EQXUIfkLfd1L52MO
         VEXQP6wbduoKbRYQsF+pogmnQjDNNqQjACEgAh2I2da+pqX2j1egX7ZgPiryrYrTHCN+
         FB0ugOzacM24XGB7RyQtCY2I2LLMUFScRDgAsGlNZyy7w9S+3YViKIji4LGLFmlkgD+Y
         HBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847504; x=1779452304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KksamNBaqVa2U64cjQ0a6DqxRRIwuhExB7Te5BU47lA=;
        b=g1+f0jb0VJuUeXGeY8d4jpJPLjWlJyrO1rRa2ePEt/k3esKi+eCW/l2m4KATcO2Odu
         zYt2xd+32tHqxP+1gx5TC3mxHb1zZ6LcxzZq05JaU0zGr/tuLHFZigQdVFVJmlGCKjXY
         jZliEKntX0x0KXclaij7E05N2AEF9DXs+6pgCy5qTiyD5H91qT4Pvr1O9g/Da1KhqtZG
         eC39ewGbq7Yq95TggdfMAnWfbyD57Yq3GR4CB6Dp+CJebT1CgL0qzam1hVv+Jk301G+s
         TfdyQJ49oF7ukqUdd0eI7XKfpYGHVjO++GTsZXWyV0O+TWmoa4t0UXrxNHFNiR/+QsBT
         n6Sw==
X-Forwarded-Encrypted: i=1; AFNElJ8ktjTJMuomAFTC45AwfquIVPuktjPs/iSudkTnr2B0HOt7XARNzh91DIl/F7VpEyefbrGT5hIc0hPB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+MFqXal6PmhV0HWxF56pmb74lc9DlyR0ApmIZ4LnGvGsuxvfe
	Yz03VlJHhyW53yka03aAHt5mldYJO4PWGvhwf9txkkQRFGT9Z48EsOhVL5KZMrEisZD384DYXKm
	9UCj2kA7NTRPPRWgiA/kjbfpKZ7uGZ/9VI+AvSEuzxdxx69UxUE3H05ptJk/esHkz
X-Gm-Gg: Acq92OFJjQMsKiBXeRjMs8nL3o7tMFLp/fC61T6nNO0BtCaKDX/uFX90sNj2KYxnsf/
	BLpIA7IvZKWLZrIr0mN2oxrmnYJVnl5ffRxwZSmrZ7IhIPuqBD6RaHaRuolJKgC51gmZMj8Xb+m
	67ywTO7lrLjq0FCFHaTv5tKTpG0NNdRJEVTpzpTlA4bO/2YXxG12yRUKQwrw+gFZDY9EcstDLve
	G8CR605WzI2+/mOGdpNVCvnQf1wu8wLmCkSq0nA9V/wcd8AJbAJoEbAJ2L0JGTUC8M6igNpL1Lx
	L9qNZeUlnz9IbhgwJIRr47tF1KAFJEIhWm9RaMW6V67bthm9QXoFkodHl48arwPCWUF7r8qB0fW
	THrrHQoKzIexjfp9rfUBxrkEYacb21MVyHR0JNwekUAj3bJHAFUguVNEnKvL7RA7jvrgX4gsp1z
	BqoZ0=
X-Received: by 2002:a05:6102:5092:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-63a3ca193e6mr690380137.2.1778847504342;
        Fri, 15 May 2026 05:18:24 -0700 (PDT)
X-Received: by 2002:a05:6102:5092:b0:632:c8af:8a8c with SMTP id ada2fe7eead31-63a3ca193e6mr690344137.2.1778847503791;
        Fri, 15 May 2026 05:18:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ec6548sm219253466b.62.2026.05.15.05.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:18:22 -0700 (PDT)
Message-ID: <f7800c43-011d-4133-8717-9134f5ed2c15@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:18:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qrb4210-rb2: enable venus device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-4-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a070f10 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7yNcMj-pRB2AcvHbL8oA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyNCBTYWx0ZWRfXym860U73lf+V
 MkXLZgrpMHxJyn4VXQbxepshOzYFdWcxlKSt5Bl/bXwRoDLNMJLJyePMBNd3mAHgJ6gvZAVdWoe
 jQDU9rJBuXOBW3Iayl3dvL1zzVFQi4i+iN98SUGb/WaFHQmIfv9d9MXqNybwES59JExxSrc3wyv
 Q77dc8YOmZaz/9j9uPi5v+Oo7+ZtQ46odXecONL54hwpVZtIQGEyv20pjC9vq28deIaylgFtM2h
 OwoWj4nyqnytpEtfOQrpDxobMsgYfWi5ZjoZKdujEqOcHC9dNtZX1dW2yOrv1l62CnB7i7isLnd
 HytVYYHdqXhYqeFJ7Q6YZ5JLUVMNFGiKqBbtKbhV5X7HuG58zEATKrRH5Nbn+4DwWFWM4ZYK4aa
 cdzSPc33sS/94az51S55uMN6S/IkO59aCoZcOssMz50TLDaLZiQYv9gzSAxk1lAR87D6GpRmIZC
 nNeibS1SleFLISqSl2Q==
X-Proofpoint-ORIG-GUID: n8RXebpAVE1hU3kW9MELUkZyznvd0utT
X-Proofpoint-GUID: n8RXebpAVE1hU3kW9MELUkZyznvd0utT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150124

On 5/15/26 1:59 PM, Dmitry Baryshkov wrote:
> Enable the Venus en/decoding device on the Qualcomm RB2 board. The HFI
> Gen2 firmware for AR50Lt platforms doesn't work on RB2, so fix the
> firmware in the DT for now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
