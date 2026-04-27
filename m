Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFE9308F07
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285825; cv=none; b=DCGRSHTCK1NPF7btLufxOf2dKiLYaki96cOiDLMlLhIva8kXAE16fFXFkg++Pl5D9VtbRuka7ooCn5fdLEaPJ1y1J78uoSiK1DG2OvnQvYMIL6+GNp2EDv7NQyjmBDdsVSU1T1EfhiSpPYL3h1vgeYj/SW5uL0uIigijYRoqP9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285825; c=relaxed/simple;
	bh=O+O2Da9Tx+m2o+PdmRLmn/1gOukRiRjrdAZN96vi1oE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPZZMUvCn/PpJ/qs8AqKd3GWN2Snz4lMfY0qQQGnS5QTkYCgEywL+gKneOPvQSCVlTmtAIFhqUwLjD+44HhkEuQ4zKkc6SO4EKn4VHS4NkKRBU4OA3YIYMp7/kJUYI5kvlCQ1ia6mp3eQ9kOWm96kP/qNSjHuI/oEkOdYlLRSKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kU6kphdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZ1tQIZU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kU6kphdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZ1tQIZU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T8qD861219
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4qlwL+HPQ79ANfRyWMKQgYDF1kjRb0P1Vm5frgwBkcI=; b=kU6kphdEaBmtlpRY
	kJdoY8GPFH1JA9RpwG9V61mnEK+6pBbsGIg012XB9v03O6RlVkcYmxOymvwT2wXZ
	qLJ9YmTcRAC4ack9ngK+lu/C79Wag/uWZ9GZvADGyopqkWksshOKTrzVjFrrRE1j
	mSlYmYimce+uOGq3sYxODs9NGAGnFvqibSF+vR7PGbXo86EO+2ReE/3uLMO1B/q+
	4/QVbZ0uN9918LNyHz1uig4ZEb9vWRxjELgbqAigNF23VfC/hTxaBVG580k/0Gc8
	GvMNeu6zt0gjFc3lobL2CU5jAlL1lSAw6RsYQPIVzQkv7lAQmxGF1+iQE633RlRg
	TosOfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw5pgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:30:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d45ebdbc9fso203477385a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285823; x=1777890623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4qlwL+HPQ79ANfRyWMKQgYDF1kjRb0P1Vm5frgwBkcI=;
        b=LZ1tQIZUcCNMyHhv2r52qShGKnfXhZW5+ja4zF5rwRGRzyi4kwkff2pkUVfZ6xt/bQ
         dyiCogZ1yELDVXPu3RwGJBt8ax4kd2UJM1wKDhiAwPFbw0j02buwnPeFRHMcRraUny2S
         C5xxjpmHyToIL4lJn/GNjxDMTMeUv3nJ2kRfzlvhnf9DqQJNfzWuAVOh27RyF9HzH489
         T5FKbu7h9/kDlMmzExacOkaa1kSEoGnVrOLTL3igmbR+SZzKDh1WkgCwymPfeblStQKT
         N79uG2QQRKmalq3VfB8IW+L9U9bbsYu/AhcmPdJGqcs0wdPQJg/HrHj7Xirn3tL4DuVq
         BOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285823; x=1777890623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qlwL+HPQ79ANfRyWMKQgYDF1kjRb0P1Vm5frgwBkcI=;
        b=cEM9K1KEmM5xMFqZZbp/WEKfP9llBsHCFDiDGNxuFt0HLJEl6lbMFBXtT2g1ImMd9A
         hcY8B0WTBp5wnOQs3jTa8TZvHlYAxMTe3FkzcT98jfz0E64L62VcJxRrWTv4F664Xfwq
         6ARehXBb0k/TxP1ioH5fIzSx0k7lENvzAUkbZNuD9Jzxs7RWA2ytLWL47J6JH0wK8esX
         jIPw6sQ+vBpEYgubMDbDDjpUHSiWEyLSZuxtvsdVBioxNVvHJ6V/UslX3KeNUjCT9JxX
         H9LWUdpekElC87I/4YOJ3RiAG1GFP4xHmdW7ksDkC1stWevmDnKtz8nFeheHHP3mCiiF
         ZRdA==
X-Forwarded-Encrypted: i=1; AFNElJ9CVeyLEgxDmJ6j8Lsi1fLXuTlw6+k4kn81RY0pKl6JuAU+hYuMFPhJSXalGEopzyq2PSSmam8BG2Mx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4WcP5h8KCZibRWu2thtkhW929WwGmzrVJ1lrfoGwTTDCmwtmR
	maYedEFQNdQUYFrIjqwzYKljDDCWHQJ+x2xftAhvDU5Txncd51JR8J1qgymT+GroY+vODQOflbr
	dLMgGILU6XAf0tOy9kn9JFzy2RfvUBZTm1rQO4cM1A9iMKeEnrCnVN4u+E9pi26Hk
X-Gm-Gg: AeBDietVDzPGDr2jWjYuvroIQzqM+FcNBJjRYUrqDO0RkGgre640QVXr2B6SBf+7C+8
	XFtFnTiM0oFL1NaVFgdiOXvZaOmtIOLSh0Zo7ZA6xagGkLCPV16DUVE6cIhxCQKp//JQYPNtEN8
	1uauSgRZ3HarRGhMN/tVCLn5HteDnhr0fua7QIPMfArPBCu8JPmlfhkuJFaAKpTzR41ti1wZEGa
	mEM7GRNtTA77CNUDs4Pgcu/X7+PZmmYO9JCZGmRDSEPA9fegsbdy6pEMjfSOul8NjlKR5aemGh5
	MMq5HKyeNSaN5sJkosqfDwrkkhjU7K38tOL4zVxRw1jbXK0e33ikFn1SpPo3OAepgF4wjpHUTFa
	fuaNy8usJY1V9wB/DcXwxANCD2vnPsVCpL94/Etgdy0iRWW7rLsxR4Zw186vSIDXTcWOrGXLHIe
	X+27XOLSVV1GDP6w==
X-Received: by 2002:a05:622a:4187:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50e36c55f44mr395732881cf.6.1777285823003;
        Mon, 27 Apr 2026 03:30:23 -0700 (PDT)
X-Received: by 2002:a05:622a:4187:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50e36c55f44mr395732511cf.6.1777285822589;
        Mon, 27 Apr 2026 03:30:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121042esm1071712966b.13.2026.04.27.03.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:30:21 -0700 (PDT)
Message-ID: <cf7de1e0-fe66-4134-b061-bc86aaa758f8@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:30:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] regulator: rpmh-regulator: Add RPMH regulator
 support for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427011159.230698-1-shengchao.guo@oss.qualcomm.com>
 <20260427011159.230698-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427011159.230698-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExMSBTYWx0ZWRfX2y29ipqa+rOd
 WmxQVzI5Er5xqumT7/hjPksKj9DC/s48YKKftJblw+7Hl7esBfgzhj/0upcUTiFdrB+Pyuw7KS0
 CGRbUxgQ6BNfy/kG9VQe46A3TUjDRkcNCOustBMIYEFtijS0lWjWvYktqYLPma+qdx0hKssihxn
 7ESLI5LwrcyCXibt7YiwE7FJynmj95hHHgqO86KcdyzJWdUxKN8IpX+e1ZsxoNyEsGwWuEbjrGp
 TldNo51f00YsnrzL29Qb5CSlpB9VHU89QjT+jFYNfvXFcncbbZqSYCBT4lhzF1DpFIrCKLKE5jO
 8FHLddsTY96LDJDNgRDDr26DmAag2nKdVhxBKtAWqcTBzpsJfE0yVdjzqMVEJXTOPoQRZV6J7W/
 bM4vkKKoQV1Xas4Z/mYZJiHElLhpe6yN9G5tS6ckGxFTkSWTVPQPAnZ1r+cIKGnmZkXpyvTAtB3
 BKqP8QQ62AMORNBe1lA==
X-Proofpoint-ORIG-GUID: rbO8ruO722qYBlczs-xdWqmt8JFrz3eN
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69ef3abf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qFgLWpbH0Cdle2BixX4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rbO8ruO722qYBlczs-xdWqmt8JFrz3eN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270111

On 4/27/26 3:11 AM, Shawn Guo wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add support for PMAU0102 PMIC voltage regulators which are present on
> Nord boards.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
