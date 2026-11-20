Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167420;
	b=xAmba4gK35YIEl7yTsdYM10Y2ACpBvOXWVE+8cWkIXlSE+ZIqnVBHdxLKou0BtoV4Y8X
	 /A5a5quVGdgzhxoqRiOz49PLMpJPpYrDDtblcjXvtp5WvXaF9g6RbPC/ScXsucPfTEBJ1
	 e/Nf1ujZ+NVO3lqpjnX9dGOOI8M8iCzVhk9KxL7zOkU8SOvaJxLF4ZOjt0lTIDpTv36XU
	 JfYUmlNOFoDyOuceafVRAk8Gjc4EcKqKucYPuWfxx+nTMHPhPlDPQvKvwsLp5uKektXjm
	 +eDb+n8rw/+5hIljEWXL/R8YWjqLhOESCmCm6+rjqOZwAXXn8JFafDK+Z+rPILNJ+Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dzVvc+8XsI4mSrpEcEXWdjpdTd52V0l/DsZKFGKiNHQ=;
	b=tNmkbLwXchkDosrQlrNIx7ahvh+GFvY9ABE0KbBWadkFaEouv6k+5GPRvbkm+wFOMXfI
	 jykAGkJPtOofqgQVQBIRbjvAmZYUWzKdrCTPNK7B2SeLCVa6JgtEN05cNXuhD8rZjYN+L
	 obqENIvqn1YPsFAjGMna8P68L22Ce4YZfPN78AsktDThpVdsmvzBf4IX21t1/ZLppAzWZ
	 AtyM0TEXqWhDecASuK0JZ2BAd0H86P2rO4s/WmHGrFBgyWs+njlMFIenDf/G4ulxnDwS5
	 C1XBrBG/PUGJI/mExkrsYc5PEadWCi9Vr2iUeabHWHmSRXcJBa7UQErLP10kXcSrZww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+2XMwXl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K2wS5+pS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E810606A33C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E810606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+2XMwXl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K2wS5+pS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f1Kc1048917
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dzVvc+8XsI4mSrpEcEXWdjpdTd52V0l/DsZKFGKiNHQ=; b=F+2XMwXl2VN+r4ce
	HeaKZ/LNm9kaNf9UWO2fLOQe34kupTxy/VEmHvbVKWX6sxJLC2YIn1JCLxvS2FZ0
	5++WVRDcJt/nXIkU00dtUNVtjPSjDdIMY5tGRemvuBy8CE33vWs0K4D4hkOWqgMX
	Tu1VmK7L2+FvEXCq2gKwFhf/b2BuPbbuy5mQJnBsgPRhYE6KPCEmCoNCFK2lIgdK
	pNLH6oNq4HYDhQlktyAECeJ0MJv8Lyiow6wqCexq5yuyilT2YUL81tgTP0t18PeW
	UvNqn8VbsZgsnAGCyiw0BdP16NTGefl8PdLicZzyRAQUD2m2dwfq73ThWZXU+q6i
	UvU02w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guagtfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:36:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so763606a91.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795167418; x=1795772218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzVvc+8XsI4mSrpEcEXWdjpdTd52V0l/DsZKFGKiNHQ=;
        b=K2wS5+pSxJhnWrJW+FtcR2nRUJIgtfaMwvROnUAPpDqaos5ZbjwezJLDRq9En1Va68
         AAFFN69Md95asOyzARORtdr0PMIurtScH7uyiqSL5IshHgj02TesmCVP8D++A9ML+gvl
         ozbpK4VDhQ8j1rb4u9gATfa3c1zj8BQXP17wBLyFHy0wLI8iledTHG49m6XrS9wQujjE
         4aXf1C77FRy7bvecVV5HjKJ5rrbe9BAoTdRLYooi1GVp12lFYtW/DhmT2bjkt7cYJm1G
         5BcM1eDZloDr4FeSwZtUHihUYYLNB1CabrubvtjM8Q0nwyPn5HwWyJhx41Npj9+Ba869
         s2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167418; x=1795772218;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzVvc+8XsI4mSrpEcEXWdjpdTd52V0l/DsZKFGKiNHQ=;
        b=PXamompT8kpLqUOYeo2UvGvtKWDtvzjD9q9rItCZDBjtPvEVaiiHLpSnY1z3zgUzNk
         ZZUKbw3dGL0iLA54sg5LkhACc2H7BIKdZgMjZTdJ5EnphBChucKttXcn3nGrfjQvc9uX
         OSLOqIeXHzout3w7cd49/lEFYpPjFVFp9HRcO6I21S9u5OkPdHzjrPTE5krGZ62TuNCZ
         Wz+dUi0KNFftIHuu1AgoIYIHW/t94HfaJUVm9gy6w7vaRWZCS6kB7zaSHiBnhXsMjklN
         cWFn0fBs6HZIAN7YXiGDDgv08AVVGuQpEvSS2kJWBDuKFDjlcpquWeMhkAchlbhZi+ym
         Y0rA==
X-Forwarded-Encrypted: i=1; AL+hErHeUkiW71TUEtQ4cmwzN4dqIKOKoEqL2uyvF41riBHUv8zeospMmN65jz4L4ISpt3J5s/C0DLpvU7MZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+mFDrhOSE+QaUQj5i6QMM7hgDW3X2n5h0gkf+TncWuT+uYVCqc
	oEjlFoh7FH6nMtghg8ecSI73Y3w5XlxWwnsULGkn8c8pZW2BedmC20ochf9y0MQNq0OehdM5Gok
	JsZdnwbbW/i78YLZ+/q9FvO0f0Z3IOLO2LCyVO6+39eSGkjOZo39FyGjSFIbINz82
X-Gm-Gg: AZFdTZdsXN0D9Rvr9nAciVvoGrr77vPVifyJkdSXz9iVTwQdd0z2lh5H/An7vOmBP1I
	Dg5wMkcMBuVX1KFVA1bgDGKxaDyHPSB6WWsBTx8Iv/6i1p23Qq3BvkUk923A4fT3UzF3IJ5o3Bg
	Gr5huGYpg3SJfEUwXYG0KgMoa5a5YPNaOnTFhXTetlnCkccUEiw2Dbo2wJ1w/1i8jsagfkCfarL
	NGyPIePe+aK0ao3ceiiN1FtEEU/sreovPl3Q9mMB1er+kbcEQF3wshtu1Cy8P9C6Q76hBPJdWld
	j9o9IbcOj69lnMo8PDCd6rpfp/BS/YKJB0kjJ9K+JaoAynCd2LXgl/0I0oidazuUYKJH8eHLEjK
	2sxV1aYh6fDj/UIPLvO206+TxRbqmtbpFcLLaIfLOwCteHeFF5TuzYYuUyqawPow0uZfN5/2YWJ
	08z0iebg==
X-Received: by 2002:a17:90b:35c2:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b41c8e0c7emr1983735a91.18.1795167417643;
        Fri, 20 Nov 2026 01:36:57 -0800 (PST)
X-Received: by 2002:a17:90b:35c2:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b41c8e0c7emr1983709a91.18.1795167417198;
        Fri, 20 Nov 2026 01:36:57 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40548711esm7000212a91.0.2026.11.20.01.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 01:36:56 -0800 (PST)
Message-ID: <a116e2b0-8857-48c8-85f6-be3a62325515@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 15:06:50 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
 <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
 <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
 <20261118125534.7iyzuefhz4te35st@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261118125534.7iyzuefhz4te35st@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfXy6/WB7SrDuGg
 /y2FFSfwip9AAmvb1rA1eIOHqY6Op9B3qjiFph1oKhD1wdl+XYYtKAkpQ4SVzu2yWFgfmpwuERu
 ZycZFuHD3+omm89wdqrns4VooNll/DitKPOUsQ2V64UznlltWgpXFNu8fK6deOsiivoLWJNzt3r
 ucHEOhNjNksn7GuxCegGOS9DHAheahGdS2m7RzP9gDGfWDqhXYMNXax4+HDENjKY8XUH1IjY7Gr
 y25Lb8M+IAhea4TyB7KKSJ0SKjkbzYRD8lyFexEqerm53SuLgAieC1HAw8cVxYAZMJxuzzHbFxZ
 Mk1ToG0zG50M5o/x7blLGsrEn0XMjwMk/cvdKt1eHy70owTxZEcYNetDurVETCdnfeSYoNWYl7F
 GpapUfd5080ukxGqNJO3nGD5vqugy3/o47+x9Mgt3cFNTJ8F4wS9TiyLC1WN8YPO47fB5AFqJ/l
 50n6vciEmHwnZawA3NQ==
X-Proofpoint-ORIG-GUID: HcgWNbaOvl56hY5c4MHhNnPucOpMcgAl
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b0014ba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=H8OHiH52VRMc-eBXeh4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: HcgWNbaOvl56hY5c4MHhNnPucOpMcgAl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX0g0oUIo1fOTy
 KqfwMoAwUhG3ICt7Em0CMSqmfslrzMZEXm1170Ic5sCmoJKwcjpnseRFe2B3g024XcPGwT1GHQr
 M0E/CHjyG6NJu8iJciXoRh1HLohpljo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200038


On 18-11-2026 06:25 pm, Mukesh Ojha wrote:
> On Wed, Nov 18, 2026 at 04:35:55PM +0530, Vishnu Santhosh wrote:
>> On 17-11-2026 09:49 pm, Mukesh Ojha wrote:
>>> On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
>>>> The RPM message RAM is shared with other subsystems, and parts of it
>>>> are not accessible to the APSS. It is expected to be mapped as Device
>>>> memory.
>>>>
>>>> The "mmio-sram" compatible makes the SRAM driver map the region as
>>>> write-combined (Normal Non-cacheable) memory instead, which allows
>>>> speculative reads into the protected parts and results in XPU
>>>> violations.
>>>>
>>>> Add no-memory-wc so the region is mapped as Device memory.
>>>>
>>>> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
>>>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>> Why only for Shikra ?
>> This XPU violation was seen only on Shikra, and only with Linux
>> running at EL2 (KVM). It is not seen on Shikra when Linux runs at
>> EL1 under Gunyah. So, I kept the change to Shikra.
> Thats not explained in this commit, why this issue not seen under
> Gunyah ?

Under Gunyah, Linux runs at EL1 and Gunyah maps this region as Device
memory at stage-2. The stricter stage-2 type applies, so the
write-combined mapping from the SRAM driver has no effect.

With KVM, Linux runs at EL2 (VHE) and there is no stage-2, so the
write-combined mapping takes effect and speculative reads reach the
protected regions.

The region is expected to be mapped non-write-combined regardless of
the exception level, so I kept the commit message to that. I can add
the EL2 detail in v2 if you prefer.

Vishnu

>
>
