Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F103D45DE
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383452; cv=none; b=kdwBX6w3ptkVPKf07ccM3srYHqnEEFbbFGUdrkKRfQIvNh1R0vvbww+PAR5eJrJ6pSN2BCdnSZcDsc3odRV7qlsjVxD5Xr0aC3TyzvVLuNE6wWDmP9IrNdi7nmrg0DNu4ghO0j+UtvcfCWaApUK9Cbjqf7KVE5/A6aN9Gh6Ez6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383452; c=relaxed/simple;
	bh=KziHKxbNFDfs2CIWf9u6vkQUwcOAf74I8pDOVwGeyhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWqdOYJEYxdTG8t8j7TKHNRctYzI6La7aLoAgtLQvCjzOMxjgnGeY+rIHdICzXGi5rM8qw3fjbwfyXQ4BfbOAmAFuSgs4ALHbixc3hAETpc3D5mgoFgTQ+t9hbcT9UOoU49gpP+cIIOgwz0S57bMRKXJQo70x7pdFxIJcUP8kiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKHVu9T7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YpCIGOao; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKHVu9T7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YpCIGOao"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm5jg1216249
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AfpbxI5qodFuclNrDqv+NkaqyrNe7rAen2jS+miRfik=; b=LKHVu9T7ioJox7QK
	uYGG2N3iIj7T+VDU+KlblmtX2XvUkgAm1dYCGNlrvM23gVxX2z165EDNWm1c6zmP
	VkU5/UXZfEv/GkRmDvRe3X2v2C/hOFylf3MhR2YgaOggHIOPg9cd3Gf9UGEmwmRu
	BGNpOzHd6ggohcR+UT5UJ+b9IL9YOt5DTLQf9IiP/jQ8bQi87pROZ7XKFRSSkgdc
	xrbjYD33pzjZbF86e1kaSVCawpkGio2bNc7iKcY0lMQNSeSoNDtEvbE5yxUwA8ai
	7UPRGCfcf7Yux00xkO+aRJ9hW5KnGvM8SJvNjhDddesgBQQsDby4+2ZuXMGxdmAR
	WLY73g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0a55p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:57:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1118fb97so14499385a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383449; x=1789988249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AfpbxI5qodFuclNrDqv+NkaqyrNe7rAen2jS+miRfik=;
        b=YpCIGOao7sFGjdWySw/Nkfp5WfKdwccZcYIssOVTUmQa7zigMT7l1SOKlUVir/WF60
         y0YnAnxFNH6WP/Kqqc1+loQzbjB+KBdgxhzo0P8kYczmsuY9H7GbwcuHynCbakjUdnmU
         uIszRuyQxrCQYeBTlmWum9F37eHoUgHNfp7Pu+U59ZcSTg8RipP8j0cRVvpE/wnc9yE0
         X8kD3y3rR3K5wwiCddkDKmWpiM6vItzaD+t9ttZ5z06V4151X7FyGMbbQK/7yizAj/s6
         B0zCavHe8E6hzTaJTUWZOy/nVOkB9mVUaBzmPyWXlyd8dj8LoDFGExfvOjo9B8tUiPuM
         Ip9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383449; x=1789988249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AfpbxI5qodFuclNrDqv+NkaqyrNe7rAen2jS+miRfik=;
        b=gsNLUy48dbBYu2yfC6SJIFU9eKxue9m+FhxkeIVx4VWKMhTldinRZ/laQdLiJlc7MB
         6T02i+q5eXZJVycWkVy45cdF5JWQikmB2eDl76SlTy/c6fW84HDWV0LVau1CjQ1qp9dL
         uK/7GfStMN4qmbkTKOB+OYYPG8us0h4V8fbd9o5jNk2/jBejNMvPqsBPvPH7u9NJGVm+
         uSfPU6tMjTC4JjsaB0v8yx3GB1BTAX4Xy7vKXwB7eOPYC5jB8T+csmyiD2z41RAW2z21
         SDJiHcP5VCLuGFSj4uDDn/9XDb6issl+v9tIQRDTCxa5OUJqw00Q/4sFDDBufFXF/+L0
         qSiQ==
X-Forwarded-Encrypted: i=1; AKwUvByZXDgLCCIwNl2mqQTA2Rku29oNXXYU/2+NeBCp5mq4ISa0vRg2AFiKvp8OudDSlGbrjzcaMzW7qvBw@vger.kernel.org
X-Gm-Message-State: AFuF++mwN+fjUq2HNAwTAded6utX4pu25Xz7OH2aclashDbtvIYGMqTf
	W5NDFyMdMBNeGLfSsoPiVjaS0yCqf28Mg8jCTuMDwtsJvkOH1D/Bj39fMZKZPq4Rdr9cIPsMaCB
	CB9BxjXr7oryzNw5JUUODfaAtn/hjne38PJpEDzFjru8nlU+OdRswzsJ+vQafWa1k
X-Gm-Gg: AYBFou25X1W+l1m+rVE9avdWlCVPX2v2jdww2S9JYWwviQ8NXppnXaf6CDpIU8mkUpK
	/JgRqngAy0IIg1TEmT+tymYK7O3mYLN06cAod7U+vwRt3Kh2SXsAJWnuuGuoiiXehVuYE2XDJfJ
	uBS1CHPjo2xmFp3H57NXlnN3fihGb/BnUGiyCV89xoBQQ4893etX8uzqpRdkWMkxEpdvIzhqfky
	UFV6MiU+NT+QimMxQ7nl9W1j1EQUnnQa+YIb0Q+lDDuHQKVGtTO8rbEFGQNKsY026QUbAZdj+5Z
	O8QFVAsExFju3DAsqMjrZ4bdnNgXgZ/WgcHSPYecs9lsOb215qt6QPZz9G9IFs/KG9IsqF2ceVf
	ZYgK9g7YWGcX7SvEEeknBVg==
X-Received: by 2002:a05:620a:2b9c:b0:939:c6ab:e3f3 with SMTP id af79cd13be357-93a29a24508mr220428585a.3.1789383449077;
        Mon, 14 Sep 2026 03:57:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:939:c6ab:e3f3 with SMTP id af79cd13be357-93a29a24508mr220424485a.3.1789383448454;
        Mon, 14 Sep 2026 03:57:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966024941sm411467866b.14.2026.09.14.03.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:57:27 -0700 (PDT)
Message-ID: <1adaf787-1219-4125-9080-7426ef53826e@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:57:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] arm64: dts: qcom: shikra: sort /soc@0 nodes by
 unit address
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
 <20260912-usb-shikra-v7-v9-1-c7b507a0ec27@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-usb-shikra-v7-v9-1-c7b507a0ec27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NSBTYWx0ZWRfX0VEywinxpH9V
 ijEb8gTFU0kVM6Pmtn7JxxbOHNB8BOvN5J+rdiPp9iCwDfqAammq6UeXdvcMo5lihEevVv31G0X
 IQzh8bLHR9CISUkoa4Of0QFJJaG2nM0=
X-Proofpoint-GUID: ILts02i9GN9hfgXYBFrKcTAIjiaiiTiZ
X-Proofpoint-ORIG-GUID: ILts02i9GN9hfgXYBFrKcTAIjiaiiTiZ
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7d31a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=99Sh8nnqGf6VeWgbmrYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NSBTYWx0ZWRfXyxPiSuqDdrX0
 t9oTXTmTrmIewRc078qSquJwJirUj+cu8uUuVKSWS9W6ptCecpb+SI8RDBLc9mQ/e47fSfWnkY6
 gFheoLOqdmXUwvcys0GKyc+geRXN0m/s4zGLzRI4UZOnGJOnNXvvmcfKoRqB3UTT+QAYTuNZMWn
 /vPz/zER9wl1iG5pGHrcZ1D8fHKfS9HihivdNdmhyHYWUtR+1nxJu4zfnkx2dmqftezaB9An4PG
 3Yl5bdB/Ow02SAu5Fd+b6+1su1ggliJLnUBSlJtzN2b+5E0N1mmM2iKoSXfLSLR6D0GX2qbiVy8
 KTlOMVjI0XMjZUaIF1Ymf7bdTg8paHxZyhvdAcjIJ7uD9CuTeaW/o7uQPzgfTv0FB3DbRCxtUHp
 uwqAs2cbQ/5oifNMcba1kY5lNYYWMy6zYNYGI5coPVexaUpbwjNNkWnakw9mH2LhrDJrC6Bp2GK
 qjjJJJjqfrOApoIS7RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140155

On 9/12/26 4:47 PM, Komal Bajaj wrote:
> Sort /soc@0 subnodes in ascending order of unit address.
> Reorder the misplaced nodes so their declaration order matches
> increasing node addresses.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
