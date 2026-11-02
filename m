Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631449;
	b=dRlzmHB5tQ1I/yQFd+T+hv833EoACuf8v122mhCoj6uG1i/KKXWnZCqtk/kpMft0AdTk
	 6uvYzu45CH7nO0KK1uw8EY6HLEEgUTb/pqwaiyESjfWdQtz6CSu2UAJ7qepnGKS2viiNm
	 fjevq5ggRm4far32iAQwiIaip1i/i/NnsjYsOfhoVQOnO+perRA3oLYWk0xPpbqqxyJiE
	 sL0Cd9NwfQlPlAtYPsJ+gZrP/gIfAbRzjQAkxoM67AxxqNjeZsbOM1b7t0g2BBfOeRxXh
	 rY19hJ0UGGMb7HaPpDi+oXAyW54cZ3JZ5d+SMySSnYM3W9LazKB9epf1qRXZZkQjTHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JXR36f4oB+4j0+bk1Hu9kxNOzkpgp6U0kS7jZZ2UGrk=;
	b=dCTczNsNYZIwXDIMN/u7BxtEQCSXekumk90cIBoI+w0m0efcK31dAZQ1lnsm2TmDp01q
	 NUa8XVYSBdGXvPOGK/YHkPChyolU7WrqWrZfL/lQVW/484faqQWlbqvs3C4+oSPn0CPHJ
	 88fU3A3IBAcVPRWErVDfZMiLPjO0e9Wmi6i7bAJ2BwlAGcdoEKfI/bO4wlfY+OYqCYu21
	 4AbC1MkRbaQ9e1IItuWmekRQpqsCX7EN/xaTjdV0yCco4ZWYF84rJUwKqcGaU+xnfxnWq
	 e5wqd3F9QcuztCMbI/wlTHa3xrJnGIJopS7h0BG20H2QZWEcXH4W22eIRBTR3vLkPpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfEndfI5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PFn22shS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED16606A59B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 14:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED16606A59B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfEndfI5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PFn22shS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpG2N4034010
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 14:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXR36f4oB+4j0+bk1Hu9kxNOzkpgp6U0kS7jZZ2UGrk=; b=BfEndfI5s7N7Rjhl
	j2Fr/oOFAWDZ9Jx/C08rPHE1OZ/BmyZR5fEGzhxB1/uqA3ZbSS5Uz07mg0C+WARn
	pjTVEFL8kBQsuColh2trHt4TMn7G4onxO8TjiY9mCpXHZoijzRNC24kwfq0IPC01
	CbTkdW+RLXEkgeijXRNPYCiXHllsY3k8eeO9EPghueJKExI2hhIbAXPgoWKXhrum
	jg6r6JWXb4W7uqP2YnK2QD71LqSRjJ95OsktLOJ6qwbLci1TBBlXsRgG5qnNUkUh
	N9nCkKQyw5qPF3qXZCClq6YGef8Kgc3HqS1ZpkJRaU+PxZcyvK8Jv0nlVw0178Uy
	DLbv7A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe9nru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 14:57:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso107320137.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 06:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631447; x=1794236247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXR36f4oB+4j0+bk1Hu9kxNOzkpgp6U0kS7jZZ2UGrk=;
        b=PFn22shScAkEWkTyecd96WL6oKAfoTF3/koFnFMB4IsmJJ4NXOsFVOu+6Rp94liBcP
         Z382GclK+fSt1A9kfMDlVdFYQbDxG3tkEXPbFBc/oIgryGF/VPYEFt3aY4nrQa99wnVP
         fgMvn8jZq2tJwhm4VLJ5jV99smhlXI6M2k6WfSKZiRzZKwvUZCdnvx8yq5kh5wYKetDH
         Lwwt12G3kUhhw49RqBfecok/UgLTMAzVDObgdC4tv60oy8K1KZJnlRnv09DTj6cm0PO9
         E6AfLhELMU84l9IzDpNSnRtfazs2ujjVAzT2rPUbOhfbqSes3tByDxZRD2yqyYG2mKN2
         5nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631447; x=1794236247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXR36f4oB+4j0+bk1Hu9kxNOzkpgp6U0kS7jZZ2UGrk=;
        b=fgLY5hm5rePL8XBQgiVNFw7i1xvdWhLg14U1HI7iT5kJRAHskbWsp20PgXtOB3Pn0j
         kb+lfhcE6zPyZi0PXwCuJq/3jCesqc3cNsSCpQGPas4azksBpB9nGrjXcMPlQgg9meoq
         E0EhN3e1lsUiendMxKysrVvBcGLwj1uQaLC54LLgXhPP54hcS6i0Qz4ixMc9m2SFh7/Q
         2ceR6Z5GHmq1pguo7oEAwZ4p27lUXtUTzceB3WDGnLbYj2ahvqi4fJaQMa9HXUJ7NleX
         ZEFtjp8AZI0N4tALeTMceaQ70QlG5bhhutzFTRVSBCpmK39W4VxyOo12eB7bWKFrerO9
         jpvw==
X-Forwarded-Encrypted: i=1; AKwUvBzYtRkLZycnx/e3vOZkzsvK4o1sQm+jXCBFzDt2oWanNF2Os+hkd0e9bBkbggl8/x6HCWZqUR7hxjLd@vger.kernel.org
X-Gm-Message-State: APuU4Z+PCfjAqeaMIg1+EpMi2aau+TqQ4AiouRWcdxPdPABoMg0TQPOi
	a3SOu2MSmNj2RHErhLotr1f1eULx4qticBuLvQePu6gLuuQ7GnAvWLt5XrvgYt/j9oFArZRLmTi
	6ywOuc8Q0UrC76jgs+LHywW9w4IAD/2CLa3dVLmhDEJ6IHWRGI5QBjgJriM3Aa60n
X-Gm-Gg: AYBFou0UCZpirT0QjZguc6rFhswWo6OzwIP0JxUT0KMdaKIN4Kpd3nPlJaAHhpsPEsI
	VO2JTMMC7MPr9DsM+cKjz3jAp+83KLRAEwbMPjOEP9dPxTo21l6UeAd5+bbxcXJYzLMaTAMkVIG
	lur9BZ/NyR06qehRQg+LxAbSj16eqo/84JINLQnNSlzyamW29FSY58vdRoDGHvQZYQTXlrh6f4T
	lye/Or6seH8UeJDfDJOAKJpGYy+EkcIFCBwiP9L9E4nAsI8BmqxNZ1vvuRtWRcWuhTdkmktSYSy
	mLdkqgK+QhO9MajwO3PH/QHVOXcTPCiW7DnAFsyQZ7u4mtDgB8l15GK/4Mi5lCPxJhgenUYDVFP
	JCQsWfxUv+pYdL06TxEI1wuWuYhJS4dSLZCSHd/jSWR2VdNIAY+iRgoFcZSH6+C8luwQb7Q==
X-Received: by 2002:a05:6102:a193:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d0724f26f2mr3612430137.0.1793631446598;
        Mon, 02 Nov 2026 06:57:26 -0800 (PST)
X-Received: by 2002:a05:6102:a193:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d0724f26f2mr3612414137.0.1793631446121;
        Mon, 02 Nov 2026 06:57:26 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec91e2f2sm3411988a12.0.2026.11.02.06.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:57:24 -0800 (PST)
Message-ID: <e1657c34-201e-45f9-909e-29e536c4f616@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:57:21 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add EL2 overlay for
 hamoa-advantech-som-db5830
To: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
References: <20261029-come_kvm-v1-1-576afbde32c4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-come_kvm-v1-1-576afbde32c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8a4d7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FdHCPVNKWVIqwBdtxFIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX63qFqIpzlavo
 GM/IkQadFxLdRNcCgfnvKFbRqhGAODF2J8uuqi3lezmqOniek2jTr3lX6vz7p8ZGlPfUmJNIoIt
 kDwkPg9pDHw2eLrZEGfHmrVxuLXyqg8xbHzNmWNqzA0CNciHiSGx1k+xSca4HkFLmN4bndaX9Ka
 usVWXEKKpntr/R1PrqPsudrqpW9wUUsJpNLpqAC80C5GJPjPtE6PVlj3m1A4xmySzg+kN1+UP5q
 zn2ZTouHO9XK7V6ppzVheNz49wlrUQNtXzn3JIFOGLxfNCGwr45aTJQVfSbP461repITc1EGrMc
 LDIexDpL6A7Ua3ShRqaUoVElv3NzwwHskSfiNl8oFcBzGvBm1aNxnTz2LSC+Qnujv7vNr4u/t0W
 8IplRGdUhwgUT62YcL5/+EDYzCH8rHWZnng4THYUzDQp5S6j70nP5ty3wXtJbPOHLULdgEPqeZi
 JlkdLdZzzCo7Qp09LxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX15cyFP2qZNol
 aXUxSIAd1bKLGf0wT4i6L4oEbmLN2XXBFg4PMRJVlh7BfQUNmzpwSLMZP5q/KFQirlWK0EuyCZC
 LMGTBFg4tQzilfFM4RXzaM2ALVTX214=
X-Proofpoint-ORIG-GUID: y141_LjhTYSlz9_tcAfB-Od459ujEy03
X-Proofpoint-GUID: y141_LjhTYSlz9_tcAfB-Od459ujEy03
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

On 10/29/26 8:55 AM, Yuanjie Yang wrote:
> Add support for building an EL2 combined DTB for the
> hamoa-advantech-som-db5830 in the Qualcomm DTS Makefile.
> 
> The new hamoa-advantech-som-db5830-el2.dtb is generated by combining
> the base hamoa-advantech-som-db5830.dtb with the x1-el2.dtbo overlay,
> enabling EL2-specific configurations required by the platform.
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
