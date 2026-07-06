Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3107B430CC0
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342251; cv=none; b=Z2AFqt4aycsI0vHR9bIEGzi8QX8zzGAVsaHf2LM3iC15HmtUYf0+oixPfAo9w7ms8rT5GjuJTyzmt35B8wMInPLc4/XzbcX0WmGrqvKLo7AMydpBafDho9BsMFsUHSEpSvddXToaIBOKxYVQ7uKxA8QlCaQ+Bta7i21soTPG0wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342251; c=relaxed/simple;
	bh=3GUFbaWSljl9zforu3BuYQcd30BioHvA/OWZjXRh66E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0FKDKuTlk5sR6bg946JoH8uAOJ1ln41YAI7FJ7wvXaNJc3BZKe8x2wtK49K7mxaFHc8HcdfthXNAGlPvP2sXv25C27D1fiF6iBv/uY5KQ75IYbzQOCKmeaw5JcSnZrugaGoXLUCZbwizW9oZWpjqIWIUlWoFGxK/8YDEXgqae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlPtKx/X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjupSTf8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlPtKx/X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TjupSTf8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDh3366717
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 12:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxMrA7grsJIjwwI6lQtydeWlp2h0gCGybnCqXGL1ls8=; b=BlPtKx/XxxpKK7H5
	qRgIwOUpdLlMWv1Hty2Ow1YqXT4FfZHu7hpaxt3FgNrKaijKp5c7KslEiHp7I36O
	CNqEEFI/DPhbgH6F1Y2HWyd6jLtmn/L1kM1O5u5jvbHQgRQKDLIY1OQkuUbQ3JHP
	kVBxE0ZbnGP3gUzi8dPDAkdEmZbnbaixay45JhQYWAYWUHC2JdK76St6ZRvOmN5b
	Y9gcAjZulsOMD+uI/eBcpuzsvnH/hoGRwmwYcWCYiVAiwq6kNDyYZ2yOAxoNgzgm
	rnOtAqgYEStA2gn5f92RmNhKEp59ndqfZCc2ax2GZ5pnbW63haTqD47OwMwxL6ug
	Y+qJfw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urx8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 12:50:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c08e9c344so12824121cf.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342248; x=1783947048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxMrA7grsJIjwwI6lQtydeWlp2h0gCGybnCqXGL1ls8=;
        b=TjupSTf8K9OcP2BE6QRtzJNOzLViN5+TX2+ygGVQ1SShX8fAfkLwFq9ZGKRCFvIM1R
         kMU7dTph/69II2i6QravcZzzisLBdOOpq7I9qgRsUGXXQ23gHCSoCqt5bBbiIBSjz1/c
         /EW95IrEITKp7HKx4Q9u/TF1um6miPNzGEe7vWG66nHKJT0yawTklTWiKvJBiErtKAEZ
         Lobm3pRYA27QnMK1F+/hjlO87HEY5CDlvsXClx33v/XBUxfDTXyesOrjJ+EqZIZz9a8E
         tT7yrGjwiz5uBecOt8lJFXHz5/iewzGBZ1B4pMki05gS5fXsMxdRsRWsYqAfrTrNdl1J
         mgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342248; x=1783947048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxMrA7grsJIjwwI6lQtydeWlp2h0gCGybnCqXGL1ls8=;
        b=WOzpXYYBLjlMvB2oA5OqOlOb+oJSNwy57HzwI51Fr99sksiTwT0QDnM2FrKjlNeNrn
         ZUmPHWGzFjy97Y8PvcUcS3EUWZjI+N04mC7B0PJrUmB42PshLnL9BgzBNSIN0GtvK5Mr
         a23EGi0cAGlt6L1VYtbB26bKgrjPOJKAZuis0ZLq0Ij9fAFTODMoilloXdFt7lJ+ImaP
         jRc51NWgwOAn7SEksef0+6po8C/xbaH5CZCJpdU/0LbTZD0F4L781oD98Y6R2u/aycdL
         GSTVxQWSRWzhs0NI6tN0TWldyBQcwssBc8pSnBlIplmbeYCknGe8XZjnytgdGUpRGJdP
         o5pw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0Vr/4cU//LzPBtcFqi+8+b1+j/0Kbg0Df8dpYNeiijnk4gvwWnUeeYa/osqzJZi4Gw784ZB+zympO@vger.kernel.org
X-Gm-Message-State: AOJu0YyrGKvKoZzO3kEge9nmyJyli1vsyISCK+MLceE+oOy3Sfg31qPF
	lDTtRomw1byPd6pj5XjWMsoc3JVveHRRbFPTHxHX4/RxbTWIPPngSS19pjRf1l6DyYTQrye47A8
	REzupg5c5AImREH2Wm+T4pQ+UTRD7SBvMYdKxKqZcL0ZLrUjDox3dMjcgErxwnROB
X-Gm-Gg: AfdE7clyurEC4pxSNeZB/Y3+78iVfNr2baTtw9wChJs/d8nUAdsDMjI7P+OrLQC9/f/
	49fqT/atkBsOwh8Ls3QHW18rDQxdCh3LxvSZQQsF53PmZvNMBL7nPXOtZtx6mbixS9TkFWi29PH
	cc8FcI+dphc0gB2s19Gu++gWDSy/e/wH+a21UMK6h3GHiplV7WpKjvvpj9VUqFqrSyvlk+i2oQe
	jOerN9WliN+9i/DbLjrfq2J7oW7yXyNNOq9riq4GzFP9RaV9ZWWgLnPTlRZQyyulHHpYlLPFFAW
	BudQTCSB4eGDv0gEMkxzRStM3VMH1rDOB6S4ZIjhOq0WK/LYRfvZ9z/wkYimLVMXX/CMcU94ZXG
	zv0AW+/krF1EDm/+IEhJVnDY7VNypttJGaKM=
X-Received: by 2002:a05:622a:38f:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c4beeb5e0mr87551231cf.11.1783342248555;
        Mon, 06 Jul 2026 05:50:48 -0700 (PDT)
X-Received: by 2002:a05:622a:38f:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c4beeb5e0mr87550941cf.11.1783342248080;
        Mon, 06 Jul 2026 05:50:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d79906sm4324196a12.14.2026.07.06.05.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:50:47 -0700 (PDT)
Message-ID: <91c2d523-206c-49cf-a368-1ec9f864bd35@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:50:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-7-776f2811b7af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-7-776f2811b7af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ez3W2i2mxSQaGSErWFsg8xWqYgAPWEMR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX9B+bXiz64RvA
 TsyHEewvU8efNON/4f0lXBOdEp5iVT32MFhS/pBc6Nj+saxA6o4HdB2Nkqb7fr+k6RwbxAZxCnS
 fywIohnXtS5z3k8l9UZG3jsMkdUEaeE=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4ba4a9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xUocDvRE5Z91C_HALZkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX76b+z1/9FX8c
 qKC/HWE3xywxJu64+3647b5hwBTy2iMEWOTbgtz7EmHRRwm1Niy81rmxrkgL+ta3EoLm6eRi6TY
 WzcC9yoQq9vQMmuqRcBC0SzmoeAkJ3jCMP/bjFHJQckBqZ761BKZOZfhAgZLLpetnpViXEhk78t
 U79SN7MhqY2n+AIIszanjqeyymv84BAgZz8kL7bqqNlso3A0CM1TKOyYc0h9PyJvJkZM1sMGESn
 CJCniPK7MSflK7DW1goKQabFT2svya4DG96UF9iI1sOJJbOMlI4Fe+x5nqnA4omNxWdmh9T7hLq
 5svzxIeQeEctzWbbVLkLQAZSCyNShkfYWXbGlYqxU+SfMTzKTINTFa9keVIczA18ubYTGx5IMfw
 WJHqqkg2fitSRLL2IldCcUG4iZlmT8j3PjhpBqy3yzwBetC9FLTv4Wj6N8UjX/x9XoJNhGx3uVE
 KHnjNaJp0dUHuzFylxQ==
X-Proofpoint-ORIG-GUID: ez3W2i2mxSQaGSErWFsg8xWqYgAPWEMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060130

On 7/2/26 9:36 AM, Qiang Yu wrote:
> Mahua has a different QREF topology from Glymur. Override the TCSR
> compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
> LDO supplies on the CRD board.
> 
> Unlike the other PCIe controllers, PCIe5 PHY on Mahua gets its refclk
> from the CXO0 pad directly and requires no QREF clkref_en voting. Hence,
> point its ref clock at RPMH_CXO_CLK.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad
