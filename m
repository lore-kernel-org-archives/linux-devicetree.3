Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76FB3E63B7
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177817; cv=none; b=tV1rAeoYDwDUHnku9zK93v0Mh0KwvdoKhLTyehkRK3ReaTl1TKIRaddxMlVhlydj/VZLE4xWAxSA5Eec3oyvbb3iQHF99Pt+0G1rZgvIWBR0v3ouPe4I/anMCeKGSl7SQH0sClQR3lmwIoI8Xpngfi1MzT/IdDhfjwVXmGFRClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177817; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJbOHJS1Hl+rb1w6sJ0dUGLLaeakkyhub7o5Ut2un5LERS+O3RlCmZ8uGcWlncTvufwpPXiWmwcakgEs5P4UWyV1mKJyd626vhvAvij+DtDbaYONLz/kt6NjFPkhwgsKl2YAmTxYWnvBA0NInQvbtya+pXdz7X+qDO76J7pCegE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fg03Kk6P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h3bGnM6h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fg03Kk6P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h3bGnM6h"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xJpU2890211
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=Fg03Kk6Pdm+HlNRe
	EncTXRHJFVMBTbOj/AFr/PnJfz8AqRl7nMnDxy99hAoiv+M0/PWfazWVhNj6txrq
	jMHRahQqS2CsbgqFDRdg88+hkvyGiQjC08GfpQlRqtsxp5QdyBK8WxVOBLYjwBxQ
	LWt2syjmMBM6FtIi/ic9nGaHFvolv/dsNEaDqVN7MYcy5JAC8kM7R9U90KBJId1D
	cdfDpItiKcNnqTkFXQIFXuPqo18Y0DOvya7LD2/mwrktr/4PJ8OKU5Uti+J9p0nm
	+AwLh0Uf99i09FC4PGwu6nDOLCmaa6H4fVbD9fe3wjwxW/U3I9fGfoYWMw30iMD1
	neCfIQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79k4v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:36:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51759082206so23381241cf.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177814; x=1781782614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=h3bGnM6hJRLnxHy/xYMzbPWqz4fNkxWHlsDmSoUbkRTMSZT+kC+Xedb+vTGDQ1ekVo
         X8ofIgriKmw+eWR15qJWCljE/Taq7B9RMa1z3lOkiMA0jU7CSEvozpoPEHQAdm1hqael
         aNINsTyBPp5oZs0HI8eAJ98u7HrzhZSwKfQspCzehofKM6QOpUUkhiNZI89IXWF3Lv1q
         SnzNzWvojWS5DwzL8NdCVzLeCj3XLTFtMMCApRaOktbgcI7ltUChT4zJQE//PkSA7I/T
         7mTEBkreCKTIbNzq3BvSmFCf5vQtQVSbv96RW9vnxqT9Fa0nCjpDLFT4S8dWpS/Reg+S
         AwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177814; x=1781782614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=kheQgjZyWDTfaO9V2zZ7gB26RM5u6MVRxKY6QAabOLGL1nQgbKI3VyCvBDaEFdYgbw
         jx6PgYe+Io0wi8KQESnLLD+j51WDjgao74I0V1vYRY16Y7vdnpr6zXfJS9hnIM/a7Qk+
         hFghc/XBt+fKfBIEVAma1V5Yf1TSQwZJLEnDvSOrMveyhvqpEljeYul5RnRgLx0Mtktv
         QkZf9MTTbMq8P+gKfX3lcTmCSXyV4+TMUXJvLBpXug71w0TpEgxzzSbspv3qzLouGoYU
         5bJl/z/6gxKnaK+hrBnDoXma20XPAI/9c1ffNeClT2UPNoNanWYfUBTV05/92/uWlARN
         qwxg==
X-Forwarded-Encrypted: i=1; AFNElJ9yxGVroyil1dofIVjahZIHDCSUOiyjRc0nmF/KuwKxo5K+UD/MUghuFcgcz4+jZGdsT0Z4sMfQ10Tf@vger.kernel.org
X-Gm-Message-State: AOJu0YxesLyAOx6DLEGuPn8E1RI2wll1AI8wwN+ULCcoMwNcGRvBD4pJ
	VDj//K+OpIF7Tf84pPTEzHGm45akywdFRzwnQriwn7DIimIvpIQSm1QbR67OeS1ipje3P1a0Tnj
	wwQAChsdS0W/2K10zsJWFuC2dbJX0gGpCD8UXMRGm22MdcKs6NIk/yLg7csZGR6TvRfDu2kGE
X-Gm-Gg: Acq92OHzrOQI+137g7TAjL95bZVV4td5JK4GwWKMfX7XMNGZPyaba0ukdXTqjcbEqgN
	miVksG2KZlDONuajaSfQYwQCzYaCZa/JdYJ2y5dZKX5k9qMjr4Ucu5aIcrwbQCs6i5nSYqhIDOY
	YNM+8RdZ4VtyptoxdE5984mULepZ7GRcfmab5MHjsDIxB9EDxKLO3jPSV68zwI8yZSQSkzMtx2V
	x2OeDOKMkGM/V33qDRIwdjLSUi5vMan5rMd5TQKaUh+nDrtZ6ktcZwC3yftOK6hBUj7vH8vt5rM
	ibiDv73d0yn1cgZi4pA6HR37L0A6wsKdMUqlc5Qa3aUcyfEpGXoWYH4Uy4DHmBiSJ/8ojf81OJI
	OQEcdqdDRoVQeX0o4rNXNg9UqtNySlM4hfxskx3I20LRl5ubDnHnd1vZd
X-Received: by 2002:a05:622a:4813:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517edcd7197mr23306711cf.2.1781177813858;
        Thu, 11 Jun 2026 04:36:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4813:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517edcd7197mr23306541cf.2.1781177813383;
        Thu, 11 Jun 2026 04:36:53 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f147e2sm53745066b.7.2026.06.11.04.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:36:52 -0700 (PDT)
Message-ID: <1a0e4b34-1b39-4def-890b-0057913f1b41@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:36:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/18] arm64: dts: qcom: sc7280: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-13-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-13-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vVuqLv9gQ5eNjsl8BZY4m2wNaun2tHdJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX+TDysn5Js6Ww
 7W1UATOvcnYqFnKDV0s/q8SuNhEaTJYLS3HJTQ5YmPW12UtsTWkSqdZKF9s3P7CDLjPEwnsoAak
 Nf0ZiXiG15WLWErnUfa6ZfaeBMjCF8+119Cqv1i7cylLIWguueQzS11pmjzIDKZenDJZhWnw8j0
 pdG743DnVMj4xos3zx6/RUBOvD5JHUrpfp79afOCWEGuGMOwE4m8Qrz8sH3y7tKKFxOQu0nweIF
 vs7/jPQr7o8H2TuvxK9sG0HizpOGTA3093gWJIkJ1EoMI1GNpY+qY1A3nQ1qp5S4BIOOrf3F/H9
 TD/32bBq/Vof/xxYl361Qozo2ALrgviUeU7fnvjQ5hja2jSjapBT/l6Sjz7R3AvK8WyTZgeJ5w0
 M6dQwIGjO05WhshqLJ0wvIDTzjVcT/RYbEn7w498f3Wwn6+43XUc1lID1J/zpCChXAUSopEH3M8
 SRHlD5pSwrV2gKPP3OQ==
X-Proofpoint-GUID: vVuqLv9gQ5eNjsl8BZY4m2wNaun2tHdJ
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a9dd7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXyJXolPAOW516
 8mMAxMpLv2GCv9X/DsXH7Cb13OFPrBJIo9kAlSF1agv/gq/tfD3HztwNhLiBWxcq+iHC9r6hDzx
 OD6thyCA+209FYLFklhSjpZsoeh8Fiw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110116

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
