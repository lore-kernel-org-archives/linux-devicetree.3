Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB7A3B776C
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150475; cv=none; b=Lixc0jiVeOm1nFTcaQ1h1bGdepoxnZRSB5OvVI6yeALC/XGzyL0jBvCOqQLmA6b8kBwO1VSVwuqLa6acUJVTMNtTiKpax1dyHxU2TfJuxTqEke0xG6+XBOgJXPt7Qc07ZWQs1EVtr/ZsABlIWl8kB06b6C+fsSuf2nZJHnUqFsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150475; c=relaxed/simple;
	bh=uP1Vm39mGXJ/9f4RTFIjWj5GN267Chxo03KGXfMZxLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2p5v8WFEZa8rJe66YbyvsU5RR1UgavTYSBiatIGdxEG6ucv/0InNBQ4cGU6a074bVXSVXbPnthrzNj0XzOxLTXujv2e9RsqtPghOcrw2OsPp04kyX0w14HA1M40Pm1MJwvsREaPcOrRNKkAtP5ZNrjKyNKlIipe2PekI3yC+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWaHMneY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJygEiMN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWaHMneY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJygEiMN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEcugi486010
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	et6FsqPMKm7fed5oniWthllmYXZYgRzS1qcnjI8OPWo=; b=IWaHMneY/cxAQvPP
	wDJR4ArWk5uMeAvO/SffF+oCpqZeLZ01tE0GPKcSAUnCQlqIEUcoqu5baZ9l9yJI
	+TXz0q3MEgjaEXAekIHwZCDWU8wpX5A4aZGnL7IU3cOK1olAqZ7o4T1BsMkCKvoI
	3mIoNIf0AQye+MiuwV1TBw3TwKdwAlVZQHGvRKdRmM256HdZUXlhFgfEIN+p/foi
	Qb/wUDNFk6Ug7YO3ZxDoXAksQbWMTSaE4woKKQGuJ0OXREuwJTawOKFDUHuWQ8St
	DWl8G6LmDVuRrfQZbB2AV1ISC6JQ1W5isBnwqHEs4FddqQraHpdeEs+dQvmfbzmI
	mmKu/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfnbqam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:41:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b4e315000so3638911cf.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787150472; x=1787755272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=et6FsqPMKm7fed5oniWthllmYXZYgRzS1qcnjI8OPWo=;
        b=HJygEiMNayTuCeL1TQSOEZmQIzH79GdQdVFantqGXKQzaTdX1gyp0KaFarv3roNLTQ
         2EMJoc+cKaDzFVql4ZQUvGc4oGOkMwg5hz/yFrCe6Mu8erlCwHG0aUhmu9ZYlDqE2q6m
         iyz+3IBdwrDyUaUpOYpjDR6Pu0iLkrbBXmFfKRDADkdVwTKjR1h/4/oYZkZ8dK4GxcjK
         eNHKIRiHGAxio+fSKi2zFTPLrK52RW486TmeAuhdggqKpOdaOh2gMUyehsKdEEVH9ZR1
         g4g/OqQdE+1zrEQXYTr8v+h9qP56yhlwhAw3fX03DtboETZLgqaBD5IDHSJO0XTSYKUS
         ERnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150472; x=1787755272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=et6FsqPMKm7fed5oniWthllmYXZYgRzS1qcnjI8OPWo=;
        b=plYWmfkCcbFzx3kI9b2a5bKGOl5xeaHIKCLeFWR9ZT6mp3Dl8tdsRT1m+DmCE3zUUm
         C2ldKWLoNKlqCRMsLFxNWhKNix6PqmKCol+5x25j8QT0AfHNqACHoRdZFNbubfK8q5Wq
         Ln/cSAXRGvWP/gBqDCPREAWOLY/78QvHRfYKXLiIA6sbSSdSQQwW3ExqK3gLmJAy4gQk
         M4Y4ymqitMyGH4+OTTe0ctRyOag0OWQMMIMcuhF/ipTDn9fXGWd16QbiwvHYzRwmX2W9
         cl+jCLDjL7MQL0d4RrU8UmvfGw7kvFlX+0l2eof9dhTEvtbyRPX7awVzsT/q0JwbKsrV
         fEQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9Twfm2vS3xD6m5o+MLkY83XBJMQisyUub+odrICWvoIT3Lsc4E8cj8MVHiZFr/U7oviKhTPyQQ2tw@vger.kernel.org
X-Gm-Message-State: AOJu0YyivaS7NEgdWmDImFnw8ffEvPk6a+26J9bOeBlCeosShqgY5ZMM
	oJX85sCjjd5KPu593t7/6qDFzzQ/2xIhtWGhLyhIE+23G/HuO4dC3nInBXB9Ai/gcRDokHaAWlp
	4HvgO3tVqO6Is3QCbXSQ0cu+tB9XpZfk327m2PrOcY/l/8xyRZi+k1Ci7O2DcDYyS
X-Gm-Gg: AR+sD13goFpdGRL05hlxwVLPykVfjkutsgE3cep3qStRF3ybeDSiCaUzlf482F2jlrk
	SXOnwLJqXQ2SOtEUiiexExSWqMCR+joZbN3zD7B6caIqTUmwxi4ua22ckkY4yrMwoBwcJrmW67v
	x0+LD+QkNhKu+l1Dc+g5k0mcmUWMcheJI9RNS0EymIGKPzWcFZzBgWIzDuMVlGI4Eyj51xc/ptn
	oC+JvdAdaAl10U/b0muOBOdLYhCPxT3CeMxl1Pq4RqJ+O2nAvJpK1sZFclHVrxuIxl5zSTeev3N
	Ypbz7U/PMpq2fODbAQCAt51VmtKrhqdRVv6iaVJWCWev6jedJYxbDeajAvzvPVGqzfGAeDQxrVH
	J/VhoE12ogfCyU1XpEbVYsFp+
X-Received: by 2002:a05:622a:2d4:b0:51c:2324:666 with SMTP id d75a77b69052e-52dd5e287c9mr36595941cf.3.1787150472021;
        Wed, 19 Aug 2026 07:41:12 -0700 (PDT)
X-Received: by 2002:a05:622a:2d4:b0:51c:2324:666 with SMTP id d75a77b69052e-52dd5e287c9mr36595551cf.3.1787150471535;
        Wed, 19 Aug 2026 07:41:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c244b6a5277sm18028766b.36.2026.08.19.07.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:41:10 -0700 (PDT)
Message-ID: <67a37c6e-ff13-406b-8897-1faac3ec9f27@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:41:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845-oneplus: Move touchscreen
 y-axis to the right place
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Marcus Ramberg <marcus@means.no>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260819-oneplus-ts-quirk-v1-0-0cdbcea195a2@ixit.cz>
 <20260819-oneplus-ts-quirk-v1-1-0cdbcea195a2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-oneplus-ts-quirk-v1-1-0cdbcea195a2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a85c088 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3R9UXOM9zR6sg_fn3_IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3Q0yC3VLm3hvEOfpl9_U9_x1OLgtAHem
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfXxU7Hbb2X+2ej
 JCiwkEXAkO+O7DmsrCvfKUfvduz5APXaaUuJ5FPBtaD9nhGFxCnMxayTsdq1H5TfeDEFzTHERpe
 xjWpoVEACh1Isl2jV8HHhRvP+Mb8b9U=
X-Proofpoint-GUID: 3Q0yC3VLm3hvEOfpl9_U9_x1OLgtAHem
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfXxRY4pHtTx9Sv
 sw1QbjO5VVOKy7LUrVbQrW4t2PEVoMBGVUUYApMZExPlyHfrMBkhRtT+DmaTIgoH2/OzE1i/vkf
 lRzg9gvhVUSnFkf/1b+LDw+dAsvOvPCJUA7E5bvNn5j87SnNcRwS6yvAmmT3bQb27bcEcYEceyP
 EES3AVyM+61cXDd62nEex2/EMrVHbsG69t3vOJfjkHppxt5FLnpNcFqFfyIDyuqU+fQSCiVJ7Py
 TJF0sROXh2t/fQzNlf/sJGnmSfnmTjQvHwUQqKJEbjDZHca2rAEph2GpuhC/816kHf6g+yPEyAH
 vBEL+BXMS5CL7OYr2SSvhS4dZx5Y+DI1YCItZ+KgaAgaxbsSVYolGYHLQS3gMTs3hfhTGkZCmW5
 klppWZAWzxq0DWb2l574CcgFLzKyPpPUfEy0uoRf82csnsQ3sF47Q7Qaha0TujPqGseSMXivtPk
 DZbcPqDBDIY+vztjodg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190114

On 8/19/26 3:56 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This value belongs only to enchilada, fajita sets it's own (as the width
> / y-axis differs).
> 
> No functional change.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
