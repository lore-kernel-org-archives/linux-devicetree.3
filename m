Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515289;
	b=bdqZv0zyHvTbzEQmCwoCjbGhwekozCOQurKdt6J49R28q+oJGF2FpR2bnCT/kn0p+fYS
	 0S/dnnLFOD0edFCHHtEQsgFLUg7YucjyRPvNVZmSLgHt700vDVBQahO6G7r4bom+9rqa0
	 KSNHKJkJ843oiWnOTdJumfNaJuGGfnmRGoruptcbQ0ki3sUgN2cm6dZBbbXP2FCCaXbGP
	 HZ2FTY1ZDpPwWkdnLlMvFUpP0ZDX/3CIvWwB6SbQRKC5xNU5y0YgYN3HqBWvmkEG3Rtpo
	 bEmFgSUCWXZWG//3MbCHN1k3cu+/W3ZOL2Mcz4FO7PHUsyKl4U1pLxRiSL4fc4y/SLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515289;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qk5z0LMGZDeAjOO0is3KJcdYLiEOWcWt97+nTtdMwHo=;
	b=B0vchR9WxGzAELbeqgLeLTBpyyGz3PK2IBt70k6kPLwt4GpspIrKjzDDplLZ3pgZcCzj
	 soCCpdQHcXmsrYeRng2fR/C2RGU+CfHE/UykEx+dFJSjag0RSXXCQCGkO0Lipp8nLOOTd
	 JKdGMsl6iSydneWvoU5CmMp+loai3bvcfiw2CiseG6pJo6BwaVWR6E+u4z4gPp8bsUcw3
	 aelpEz8qnrG3rnIQEU4VxS6AM1hzZlJN0ayYOlAUoq2q1vujCg2evt3l96fYVcRMaMrPQ
	 HvQ8DaxooWYo0lQC6RK0rSwuiQuN/2hhiBb825UrhtCN4jRobssyxjRGGQHOBU+k0lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFR3B1R2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIRDQFzC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBBC606A6A6
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCBBC606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VFR3B1R2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AIRDQFzC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8Y6W4196988
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qk5z0LMGZDeAjOO0is3KJcdY
	LiEOWcWt97+nTtdMwHo=; b=VFR3B1R2Td0bQsw1M1DnPcEQpKrSI4aiQmj4+Dgq
	palLmVfgzbVR4pKHEFZI4XMw0Q0KOGuiVjjVBG98f6F1wMaNpzj++zqSufU/JLNc
	pvfDtW0fz5OygALJ3Fa0v/s0mJjS3kNSklZOj8UHj6Ux0hwf2LSsW9RdZde3nyeU
	dbnOpF8YLR7KMxajzIdIK3sjm3B1DpiipLPqDs0q3Gq5A8DFKcH+7nla1Hx/x5Sp
	7if3aSkguDALLfpaD9iNarxrXUU5M5AJgemnZErBDx1cbpcLlNDD73hRZQimNpfk
	EFJm+or5mZI7fk6TN5gfG+Bv5rhU8fPYthNUH3h4yoej+A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrb4p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:14:48 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b56c696405so3465572c88.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515287; x=1796120087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qk5z0LMGZDeAjOO0is3KJcdYLiEOWcWt97+nTtdMwHo=;
        b=AIRDQFzC6U91Eo9MLbSCG1Gn0VN08OOH6jlM/Ti54hjIYmsmj5OIGymJBQMkFm7KXm
         AU8tXHOfl6c74hnOPoVsMDiMnt1zsFTrMko3uiyOAUTaPr+5QHUyYUgk2GXVXuM+P8ri
         iQLPl7wPBsisiJxIKczmfVw2ImMDz1KCf0SiADDtABNSfXBTQ7jIKOBsIEc4Lp3qVf8Z
         yP/jpUuhd+CXwRxTYd2av5Z8e5knOTUyiJjSQlGrvOcNjecudY0iD9n0TH+8mI0OYtvV
         E5vIL4V6D9gcajujn2XQZX54nnzcmnMP64pnxwk3EZWZNCoq/EYZfePHt+/t3/fK/MgB
         ohnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515287; x=1796120087;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qk5z0LMGZDeAjOO0is3KJcdYLiEOWcWt97+nTtdMwHo=;
        b=KKCfobACH1rOs+yrd0Mglx9Q3jmDdpJT0pkZffmTmlvjAxSBdmLzG40Hpv67Qh0vfs
         o/nQj+0AWraFkyoCgY5UYnwOy6FlQBc7ee4KNyuD6awwo/XcekA7u+aPRlEH0l/Ypbxg
         pPFENylcsRVvWOORu63wvRKtbr5ji90H2z1y+hIy5K+UkqyCyo8MXnJMDoeY05qTj2ck
         uQOKqgCz6vVa5SrtZmsFkFUhRJjaZunwY3hq8656KVa7MOp6rRzwcoC37G4Bsel/QOKs
         R81GOsLHx5/natQdiP+X5M6ZJoWQJdQRTQT6kCBWfBoiUDM2tfqewmvaHvk/MwK9hPtY
         ABvA==
X-Forwarded-Encrypted: i=1; AL+hErHlEQ2IZZO08WDwMfCMcl9jUc6hBgYFTZpGN0oWbpmmPAUdGNHwhdjGgssxLH8jy/m1aE3vIhATh77G@vger.kernel.org
X-Gm-Message-State: APuU4Z92AnMObf0MrMSDLkL33Nz0vQ/XmZcCgFVMgrI3WlKx1xpn35Gc
	uOBoC8cap1KwOmW9E/Z21DGaTB81q7g4GvzsbsT0Q/dt4M2g0sbrlvCICrdlaEtaozeLOpqd9sM
	GQRgIYhC4k5JcjubutrpvuycywHIbaxoSm5uilzgcLtkAJ3UMxRfwwqZuDEPZbQrX
X-Gm-Gg: AZFdTZeVmznBZeQCUCJBhb7E0sKZNOcpjGWTY1CPMafLPUrrZg5kvGQ4OhaOGzY2cdc
	tO1whalz0Nm3A0P0o/eHW59H7oPP53Qgpq/AZhIRPP2+QoIMFSwmtbxeK2gqbhvdbg9HOgt/gKp
	3KhPIM1+u61Gm8Hxehg2g63M/v3vsmsq4b5fUYZtlwtrX23WEcWwVfbKiInCZsIE2CelvtesOM9
	wM4M9DKYP0dlrDp2SfOBajj/sDh5pb8DXZy74KVtNQSzJ3PPT0LTE0K3m3UqW60VVCyRlpuwYTN
	SznlPtG8WBP7aDM6MYVGBOXCu5iyUtUR3H00sbcdS762OnxHB1Ia2q4LG4xbieZSNS9mb6wVTYw
	Klkoko9xjgUwTKDaBWg5rdEcBANfUgl7LzUCs6mhZpJlNH2rNpRhA4LKvn6bQa26ZHgb4jdVFKm
	TF
X-Received: by 2002:a05:701b:4555:20b0:1b5:3616:5961 with SMTP id a92af1059eb24-1b556823656mr14255577c88.4.1795515287202;
        Tue, 24 Nov 2026 02:14:47 -0800 (PST)
X-Received: by 2002:a05:701b:4555:20b0:1b5:3616:5961 with SMTP id a92af1059eb24-1b556823656mr14255550c88.4.1795515286532;
        Tue, 24 Nov 2026 02:14:46 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm37791810c88.6.2026.11.24.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:14:46 -0800 (PST)
Date: Tue, 24 Nov 2026 15:44:38 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 3/5] dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6
 iommus for SM8750 ADSP
Message-ID: <20261124101438.n46ncolgnghojved@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-3-9d9000eb50d4@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-shikra-el2-v7-3-9d9000eb50d4@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX6XKXAD0/L+NA
 MU3VO/ciFV+lEr37X21wxkmXLgFw0Z/OrvMnU4cnUtF9PDHu3KeF7oyI8+rTwRexxIMIvm6vwVZ
 oln6QjMWSwfl1pm5UBznFqNiMYDZyl0=
X-Proofpoint-ORIG-GUID: YQfSavJxlNmjd6RSjcb6oe6pTL8TbN_p
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b056398 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RHyrlyLPk3cZOz1Q9CoA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX9oHR8GvhPmUK
 Jtw2lAoG/CB5XMVJZvcxWEQctiAFwzw8XpACu/4xJTmg1gSfPtinB1tBGnj0BN8vOC/XV17Y6EV
 DNtK44gY0hquZjmH7Zx7EbhMl0A8Ua6ccP2HPiz6z0kCouT/6mplh//2fTYT3c3VHsELF5gfDd2
 fM17ZzJgh1aj3hRhvo+6+oeTAGxUb2RWuAFDbGcKERCdXFWVpT7aGg49/t9LNsn1nxY8ytDo9Qq
 kjBy6Oivtdoa9sRQw4d4DFL+6TIXGr1mbyPOrIvyKjqwPHCSLYixWHKia0aObAWH2dhsOg2UBYw
 tRDaKH7GUjmVDLmOqWoLn+TcVYjbZCle048KRffnYOfK0X7yC9Rns5c1yEqEVYhVakDskDXw7hI
 +6IANSUiOU6gIDoyvBJjK+YsfPiIK+94rDJa8McFgBuvcC61KMWCkkcznzx4yUt6pF9wDR84yoK
 kFYrA/xQI/Z5emNpgMQ==
X-Proofpoint-GUID: YQfSavJxlNmjd6RSjcb6oe6pTL8TbN_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039

On Fri, Nov 20, 2026 at 06:50:51PM +0530, Komal Bajaj wrote:
> Remote processors behind an IOMMU may use multiple firmware streams. On
> SM8750, ADSP uses six IOMMU streams, which exceeds the single entry
> currently allowed by the binding. CDSP uses a single stream, while MPSS
> does not require any.
> 
> Allow up to six iommus entries in the binding. Require six entries for
> qcom,sm8750-adsp-pas, disallow the property for qcom,sm8750-mpss-pas,
> and retain the single-entry limit for the other compatibles.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
