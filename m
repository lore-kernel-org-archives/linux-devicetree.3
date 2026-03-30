Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC570383C66
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862300; cv=none; b=rO1ZI10N+F6UGw36lyVK3yB1RBGSBHm525Z+0SRR2m8pf7MsTN6OPweJlxul/Gul/YuF0KYxSIzmPavDnFmJT9y4hHSlBoRmIEfgKd/wndFsYUfGupXS5J/gLgyQOLe9YY0vQUMm8Vp6bM7gAjL5cmw11Bt3kVgEpOzXwBQOYz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862300; c=relaxed/simple;
	bh=EgmTmKlnGSggZ9oeuTL+y6aV8pgQMth7vygiP6lUmQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7kL9PSY6G+fsAgsdg6ZCEIlgXyB8iwoLQHOPtnQmwgSWG4EY+2k05IYh3Wfdm5YtcbXVS7AOOGXF8yxa5Es8aqbJV/8MyP2pchADKuCvPbak9Qrp1shymK+O/wQtrSNkyrfe2BlA+ImHCI2bme/G+C37MFelf3t1S6xomO1l10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQHAtDaq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Doe2guXj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQHAtDaq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Doe2guXj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7XHJ83164030
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qjxNTNDyCOYF8ParJqsQO9O0jX2elDP2zds2jZ5uMkU=; b=aQHAtDaqX2VxDlhw
	aowZjgz+xZyLmcUxSk5yjnQ/fJPC4B5R7JG37aj1oJUablZyXK0cs0QOSs7YYgBm
	w51kn9sqvW2Qse0LeH26BpSgCrYqBh2DSYbxSb6D+tgqmvu2GcxSl6Nb3iW/gx0y
	dcbF2/BfMkRrOnN6soYD9+0Ir0Up7iQHmAdLcYWz1N5ustSOIsCzP7elxSX9X6T4
	yBWNJ5L8S7IDBuBbSlPkuq47bKn84rCmo4DuZsHKtlkMQyZ3U20GfieqC7rW0quX
	BUSxqXBDg9S+NXVnduDgGmzeQB+roRBLc3NSRjO9ayzEagZU5xUM6AiuABWV/VRr
	NraPUA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmkgh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:18:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50943e69b08so15488891cf.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774862297; x=1775467097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qjxNTNDyCOYF8ParJqsQO9O0jX2elDP2zds2jZ5uMkU=;
        b=Doe2guXjncQ8q+ei1I+LIOVFIvgCnGPgNv6tvFxEZvnwNwRreaHDNmHziEN9S5OF4g
         KnwmZLdCHx11WYjFKr0hg6IfydxCKh1iQ2CThjGOjMMcAAAGWh/+0WHAOzdbQkGumock
         qmxZMQSrwGuYFxMm8ugIb41CyYEPGXs52a+ijPadN4sYpFP6E286N3CHt3ohJSifrYnj
         kIqOAz0vDGS2OFFZ7czTs5w7DexNykCtAV85zsiVeJ7pyYO+F9bWkUKANtf0XtxmnXeI
         TILdIL6QGDdSLnEmqxMh65pIMQ4vzj0vUHWMI7VdAwXbyRweccrawR6NLZ8pkEDuBYFL
         PpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862297; x=1775467097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qjxNTNDyCOYF8ParJqsQO9O0jX2elDP2zds2jZ5uMkU=;
        b=hfsBNhoRIRUXPyuMy5JAqzV6Pwzore8D9bpAt0PfIqCuk0cRV54VLSr5XkX8bFhvTX
         rwgiCBWesI7FQ7nLBWvoSp0PaqCKbrY9MsVzBNdvVKADl0cq/Y3CHmZCRbTAAzyyyU4I
         a+ATfD9Ql1y8jjWPRVsWpZWgfnShF+C7LH+FDBnhB+U2KzwwpTFXiQBb4uOSvzE/Eth1
         9DL/pqkABJzS4v/AdWDXYQEKTMfdmNRRxUxrQ12tI6zBsX+NN9x9/GGiwoYNAXPRTJao
         x7jcJhyhP0HaRtWumohpDh3IIGak+RTTC/cqy1iTbISGGtdNB+HArZjhpDvd9qKZ8M5x
         CI+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZkp6neftkPnfwzpNefM/SY+Rysh8G7DYA/68RxeKQTFV9Sddobjjrg8rzN6NKpTJKddex+yg8b5LO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf0U9dedtFECy9OhFIWOMq/JEbEWNd1vKZW49BnY3MxpM8nFgp
	GiS4rKTW04TFAliHUQ779fXhqIHD1CSj2DmDgEJE7kjVb0msnLiTL2Lrmf2rsHWZJaCpCeEAbwe
	PWxn6jzUeMoDdcmZ83oJxJS2on/FRWumh7TEzIVfKfgyq5c3/6UT01P01FtjWFMca
X-Gm-Gg: ATEYQzzuchWUFdZzicXtfL+ikuYGQxaCaFQRTsMgl63C54K6PzgdjhJBZI6PxgTQ0q0
	r0kQcuTmwVIanNmFGsvc2Oo9bPAisSHN6OCsr8eR+qXNuOap7cBsPZ+6OkG1b2yl2tU0KofQGww
	Sbjh/0pWvKzjpX61EMCPVGXZQFFFA8kaVbRrqwaGTOxArij2V5uWxSH/0FgSHDCJgf0PiBptkIB
	Q+jY+gfXc0jHN+oP07/6e7nQmzC1QlJrAOsf/n4iJ3ltx9e5uMS+wmUUdF2rXrTFMFBWjJ1x1IH
	o7Qr/kSz7VeJw68fEtQ5oBRuABsvjkgjA+JzrudFFWbsK0bceC+pxiktI6flSSEpC3v20e9G4rF
	VzbieL17KiMlb8YsvY2JwKWT2pP7veCTyzGMkmrD4lLhyPGIp/+nTS/mrmJHv9zmkc22U+44p2q
	jr/DE=
X-Received: by 2002:a05:622a:30b:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50ba3970575mr120358771cf.4.1774862297178;
        Mon, 30 Mar 2026 02:18:17 -0700 (PDT)
X-Received: by 2002:a05:622a:30b:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50ba3970575mr120358571cf.4.1774862296712;
        Mon, 30 Mar 2026 02:18:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae520c2sm266091366b.21.2026.03.30.02.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:18:15 -0700 (PDT)
Message-ID: <f971b7d9-8e88-446f-ac93-c3506bca83bb@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:18:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260329175249.2946508-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MiBTYWx0ZWRfX5LUaHV31n0m7
 rDG8yqLhC8xKQ1j88wbnB6ZNkVAIqLFez0OFRiZcw4BvGXCcU6DBCiOslYie/c51jmNpPs/96Ew
 RhGtImVD7jcxG3LySoGrnoyDathEpS5L0VtR4/YWlNyrDpbR9pc6YFaKSjU+KrcQd94fW32c3N5
 QdXWcmkVgRqbWEjxWb3Ect6HxwvRG2sOhBtnYoISrApw9uwgh8zVranbGgQyfhx1jsX4GrQ2YL8
 8qU13p0HcUe8aMC3Cr1rvP511Xq8YujYz8j2dOod/bM2pTXp3Me2wYh/lmXFmzd9Wvn87YAOBWd
 kiFVCohe/qKwaASjkYFp/GvDSJUEcbmDYEj0pMiTGdfNellDYPzStZtrX81FXzsxva7Xp6U/FR2
 AolTjMz+aCJyt1ajtO/QLGn/pttNEMwhf/xVe7EWlyBE+p5JuqlbWwGXXXD8+LHBY/pKpEirc4x
 3ss3+Mqc029qHFc9xTA==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca3fda cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=edOAiv4QBLOMXHKBau0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: amWfW-2Zn9d1nHjYaAhAhuaT7wZftLiA
X-Proofpoint-GUID: amWfW-2Zn9d1nHjYaAhAhuaT7wZftLiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300072

On 3/29/26 7:52 PM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Add the base USB devicetree definitions for Kaanapali platform. The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

[...]

> +		usb: usb@a600000 {
> +			compatible = "qcom,kaanapali-dwc3", "qcom,snps-dwc3";
> +			reg = <0x0 0x0a600000 0x0 0xfc100>;

Following the woes on Hamoa, can the platform suspend and wake up
succesfully with the flattened DT node?

Konrad
