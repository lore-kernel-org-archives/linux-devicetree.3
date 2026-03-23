Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F61391E4A
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263475; cv=none; b=Q5kBTBPW9kUosIKZX1q5GXQmTmFFEN0/sjlTXikzFXd61l68sD/yQnfmG9D8fC5/d/VczvB7hwPFFARY9VjuJBi9Ah+AJxZttn0YeTyXtjqX0+AFZqJNQxoNLpkGx050/98cwOw73G3wTR9+rafOta61dtcFjFD0F2ZjxvqP378=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263475; c=relaxed/simple;
	bh=/mZGsh1xkiPR3p8xvGVSUGgB/QMPQ1B8WN0TVuTZnRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k6AZHTlV4RuhivSTOKBOjhHU+0VsD2+75WP6xaLWSKybMwrQetKoKymxrJMj5JO7MKianX76eta5fDiBV3A5yYf6oPPhrNCcA6Qs24DHfgIoThNRVicoRNZmIDel7NY8xNItJRDR8dRSrctR3ibvhd6YrnczdbekI4h1gDbLFJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrwhkHJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LuxQV7FC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jrwhkHJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LuxQV7FC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tMRW2291969
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMUrSOVeDAhPlf3XvTZybFu18sRSydomNUdVxKEA3CY=; b=jrwhkHJTcSOoCWC/
	v1WHDI50yFx6fUpR1R8ARd5bXDUlOI6w8CCpXxTfn8UOmZR4oD4QY0FaWSOfR+6O
	lEzofxDJYuE4QqbXOiufolOUhx76Ri6zqDYvwVVEn3Ht1apjzj2xeNazKERUcqRg
	5wtUirZsTA80ydu6dtHuK2ygekUv6FIbm84+L1M7UWpYgyfHWSug9l2RPF80sgV1
	0dJC6mxbbAb32zuTVneyJOeMJMCVvWAbGkUr9Yua/FUo4L383VBZ1PJgv7cfx3ux
	zpS8SOaPwj7qWGl/SoIyTpenvZMyCqMNC6C5VqeNIDrc8/+G15eewCsNIFT35ItP
	sCy9tQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j70mu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:57:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a5b38affdso32715846d6.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263471; x=1774868271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lMUrSOVeDAhPlf3XvTZybFu18sRSydomNUdVxKEA3CY=;
        b=LuxQV7FC0+Wlx3nHrKIG74VwkXemqGfgEOau9SQLJGrdCBO4KJQC4RbMpsdu4e5s3M
         bNBOjoBPfvGdhajy1W+/r5VF1d4ueG0PMTdvaNLiTR7ccAx+WqDTnfl9KV3JrjPLBmzi
         eJG2Qg3XhG2FUA7Y3D/9RcPvbrvvjSwsvuXG2xUTPYUuLdmkteAOr4gVfayQrA9n7GdU
         Oyg4cLBuNTkgMFW7g3X7Zg18eX/SwgUUGhM2ItodJRisvXRQXy3lYOgM6L6vLf1K9Vmg
         W/yOxVDCv3cBsIZ/9Xw5HOGmend/wFHywmD5Tc3/eqiHqOXP2nQJoj5RilEQuJVO8xP6
         z4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263471; x=1774868271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMUrSOVeDAhPlf3XvTZybFu18sRSydomNUdVxKEA3CY=;
        b=CWCrbWEOTYLuMyLqJz4OGUsj9P8Brt//egdir7oC/InSolYcRxI5NzyxhxDHuipB5g
         bpm3hdaCbQC2AjAc5bB2qcZgUXem2EUGCZvsHaG/NIOoPK4eFM5bV97GDH9THfQCGzGI
         0OrQac2kWIqlLMsTRVoDJfd/fHcpUEP72uFq7+UTZtu8GsV3/wW2613MNxcx0JiSbeLO
         WrCgQGNPAiOs8VmNseRwOiVlmKESqubdK+GR+XXJFdMdNJMJ/YdlXh2p26CjfUBK7fNT
         5Yo+iHnkCDKx304F+fUjiLzOLFpkcUrNZbOl55GqHDK7HueLZbmGUGrhU+ssEQwzgyEz
         Dfgg==
X-Forwarded-Encrypted: i=1; AJvYcCWvWmvpljS0pRHY9T3Z9NSGFd0p9hYzW/S8+R8VqUk0jAjM0cTo1PYNJ4bRfp51yonVDOAyxI3xZ2E2@vger.kernel.org
X-Gm-Message-State: AOJu0YzkOI+sXkMH4GWyADsqwDPDEeIwyA+/tQGpHM7ZRsCAfhFpm2ED
	n9+x4/givwFbfmXu19peXGADMQNemzjdEaBndLPnL+oSzt5NAe9W988S8syq8fa3H9BCDPXevto
	SWEEcgEisBSB3mLBSLSBARuRLei/ZIYycaM7D+YHUod3RtveOIR2TNKjw9EXavAQ9
X-Gm-Gg: ATEYQzwm8PdfHHreHkRCbAKCPF+bvJtSWzJn9/x4Piyz8/9U1ybPlzHvS8FA6GxMxTp
	0zxQbhsO/DHLkIy8PWbYzfKi9DwqXrsXq5Xi2KPuBXZm2R/HDJaHoCOw3bjljbfYa+s+PE8L0VY
	vf3pdmJGtRUEfHTAiZ9Jsqeu5DyPeOu+3mQpcWYVTZk73BAQpVXpiZ36L2BSg4R/2iJZuRBoTZr
	0/A15BvR8+n2MBNGfQbJZ8iqlAUzG5Xurr86WMkg872hDScsARh1o0J0BWR/VZlr+RKcwLV9uqi
	M/a6eJA6dGx9xfUYgS+rDRTJlAeA6DezC0qFD7mD+fsDC2iYNVBMfULwpOOhDHE4KSkLX0xMZli
	/6b3qBoaTBio+Wc6CoWENc/Rfbtp4ugc8QiSjnDRvRkIHsXfRKARxPkCuf306rVHJiJmFRVttpR
	Goyi0=
X-Received: by 2002:a05:6214:2b0a:b0:89a:564f:bbab with SMTP id 6a1803df08f44-89c85a44319mr154147256d6.3.1774263470815;
        Mon, 23 Mar 2026 03:57:50 -0700 (PDT)
X-Received: by 2002:a05:6214:2b0a:b0:89a:564f:bbab with SMTP id 6a1803df08f44-89c85a44319mr154146986d6.3.1774263470416;
        Mon, 23 Mar 2026 03:57:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a14csm466546566b.43.2026.03.23.03.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:57:49 -0700 (PDT)
Message-ID: <e0235341-8a81-44c2-b3ac-d9417c2f5705@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:57:47 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] dt-bindings: usb: qcom,snps-dwc3: Add constraints
 for SM6375
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
 <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-3-3bcd37c0a5b5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-3-3bcd37c0a5b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c11caf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=eptGKOKebL7jaDLwLzIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: gijqS4pVMBgNduy8sdyVewDZI58w6TE2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4NSBTYWx0ZWRfX2C9ZOUwxaFvY
 kq4QmUZ6q7sUye/ASDWNPQSbrl4qa8Q5YAA8IipOa4YVyH5W3kpyQ64TDA893Wn2hxnwKu2f4Gn
 HAat9HoizDdZVVZ6uAVuXa34GSolGmlWbKTgsJPDepR67JUqb7OtI1EMDzoXSSESvpGRmQqjv9Q
 1B7O4MfjF9T7fdZ/rV16OLh99qFrh0uprrZUVVVB/yl+cNDHkdeAhgyjzHQGiwwHG1d7jo0a3mq
 RF7UKxawj0yYrxdEgZmj1un7MwBPhnsaCSRydtLexwA0ZFhNH5wtDqOl626erURV3PEb1hlF0jL
 i3a3frTQD3ydq2uS+XjpCDYCQWrjY5mCo79x//YdefCjsDbpACn7DhIiID9Opx/8RXiw4kRUOcl
 mrt2tXsx9N2DfXdf56Za7eTvEqH6Is27EsEstdLS4H4YNYdgltTA8dIA/H8/YuBdg69fnBb8DnF
 Ugf3JkM3sUklqF8aLkA==
X-Proofpoint-GUID: gijqS4pVMBgNduy8sdyVewDZI58w6TE2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230085

On 3/23/26 9:54 AM, Krzysztof Kozlowski wrote:
> The qcom,sm6375-dwc3 is already documented in top level part, but it
> misses specific constraints for clocks and interrupts.
> 
> Closes: https://sashiko.dev/#/patchset/20260319092348.35237-2-krzysztof.kozlowski%40oss.qualcomm.com
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
