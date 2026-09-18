Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BA5495AE7
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725987; cv=none; b=Qci8LWBoc4osIh1/x15gY7Hrhp4xbzKbthvzoyGWfdZ6voj0+G1CljqtRUkVdCPCeXg/u7AMIlYQcLn9W1oj+HiZSkJbWdBJVpOwRqe0M8DZGzJ7X7ScXEB634tYHSgxInAaHDN0PkwdBQddkbaKAxNDYr6zfvtFhFXiDak++Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725987; c=relaxed/simple;
	bh=+4eDn2NzzhI3HyTpGmtijFMvVz1tYjpIwkHEEAOy86o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sum8xKbbaxrjicFTwnkd1MYyXLAm9BJsthzfal5IuKF3K2/kgHATSvknwzVFZLtS8RVKZTr9qwBA2HiQwyxF4jOF8+PaKyG32oQ1WR+r4FasbWkrJLwtEpykCYCodkQs7tS6dSLCqDdqMDaEirNj9SLh9zIHaCVfjdx1qf9MZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQvYbaUC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FbtVxfSn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQvYbaUC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FbtVxfSn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dg9X251066
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWxVEc1wug8j2HVzSFOeUU1DSmmULUZJ8UhLvoPQoBc=; b=XQvYbaUCmJ7BteSI
	RzMGMtd1Hj2SsUQaiptT4gRh9Cys5MXbly7kC7QUKRQlz9lNQAoqrCodkAgBe4qS
	8sXn23TD60AGF3zEKpfOTguEZzuMbARJa5wd1h6N20zxNCZxobGw/hUMVfONwI4b
	zBlXXjKxDGTBEN25gznNyAnL2eRlNEJg3mvp/Mk/d5xIXhU1Bp52D9ZlleiLuaTV
	8EIsaoeulMT3+kTBGDOtQxc6iXT6ljhEo6G49ad4MSDOxmwLU2r78CMRgVlujMiG
	HaDxrK3OAUDVKDJf8nk6Cdom93eKy6/6f0BG2Ktthwj35HvKrngrUhA9XCb3XAv4
	wKZ3YQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2390agp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:06:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106bb33cdfso1319226d6.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725979; x=1790330779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWxVEc1wug8j2HVzSFOeUU1DSmmULUZJ8UhLvoPQoBc=;
        b=FbtVxfSnNzdO1c3WCV9bJMVL7NncK0Q+xImj0yCLEdKLXPq0ntPUDG6sNNQtKapBg2
         FvmxRi7FY6M87kTZ5rdpkbuMYQLliOqFbZIwW3bQ+5a/Ayw7aClA8fwH8IS9KxHJmtfx
         ircmjLmre3Fj9JyBmhPJIMkqu6zFReQtgEQUYpzfl1de9JFICOAw2sgTWuM4261spqiq
         qPHz+RRsvRWpTtI4L0ylOasyMGWswIaxasUguB68jfol73ysLdkgU++MoX04R+DWC/Tr
         A5+FxlhH+iTQ7+ieIVjL9xMpbmK4a+1ov3E0XHrPFDrcTz+lFtRkSMC6Kpy9Gi3mgROk
         KqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725979; x=1790330779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWxVEc1wug8j2HVzSFOeUU1DSmmULUZJ8UhLvoPQoBc=;
        b=Mgz4uXbJJhxwBurTfB4neDUF1x0Vn6SzoKh7990VUdgEEXqDCKmDQVbLGEUY1QGjpm
         na6fMyRghWsdHMN6rQ0OD0tMO7/aXA9YVyK0vF6nPni184zmFw1KvbJJUtJcGjZXtbj0
         BvxTCVJTe2eijY28cg0javYNtzlzZMJadw7vjg5cwMCLalYt5Sirf4PHD+gIcPj5WTwb
         arxsqvHVedlE/GYBFobirIX7h8cKlxuL6swMmWHRbRgPgXaXuQW3rQ7x7OU/yiwC1y1P
         dNP/cIUli+1zIAOn26ypC8DRTijrDIPPeiasEJbBDnMtEVIEvqvrlT6dSdaIEUwWTxxw
         LRyg==
X-Forwarded-Encrypted: i=1; AKwUvBxDfQCP87rmTiuDtQ0wDF7QLyCIi7bsSA0SoVqvOcVYJig7u8OoQKmx7C5hJ+EYj3BovJkkPJaftyeL@vger.kernel.org
X-Gm-Message-State: AFuF++kGi40X+3hRVcnPEfVoczV0JBFEvekjLTRcQtTneMizNV1v248I
	bplEPJoSOUhAhRTMSAHKe3Es/HC3zpDaIr6vK+HdghSVlR9bFAu+Ez41/mZN56eNDFFYHs0UyqF
	yuYWXhTIwxEiKLSWpxHtil+1EDCFtaFVFVCuQbU/2d8pMSxL4n4nP2pbqMkePd519
X-Gm-Gg: AYBFou0J1Xkc38WMdJX2xvyDrc/34nWpsdG38DcqzndhbUGUZwCaS4Q4E4ctZ3Kc8hy
	MR9SEPttpgUYgLfLBKFJacZMoluVSe62HMkWcAbTcTSTWGBp2/uYR4mp/zIDV69cMticLUyLYgF
	LndrHojb3wDIRfQHrYc95tiByVJ3wxoapG1hPtNTS1TzNSN9QpQV/a3rj1UJieQUnwoVWwQ43kL
	zpRyS9RMMLYUXy6gRqyYob4YrDt5Xxz7MmKFgitG6v4QDvFcg5P0BQyWdpGy+KTKAq6bhNrSnmn
	KgPMTDAILwkn/B8AZMOLVvWqJpLs5cJdG9ozTwkLy1KAdQckq9LTIiMOw8Pdk7LCwRqo88EiEgK
	NvyuLtQDT3rRcNueXCmIZiA==
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr193611585a.5.1789725979411;
        Fri, 18 Sep 2026 03:06:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr193607485a.5.1789725978966;
        Fri, 18 Sep 2026 03:06:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59715eb1sm618412a12.16.2026.09.18.03.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:06:17 -0700 (PDT)
Message-ID: <83244e82-1f2e-4b9a-a85f-1dc704a91c3d@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:06:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] arm64: dts: qcom: sm8150: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX1ZCLMZCOHgHF
 UJgu8LWJ8NB8ZQ1471eJkIpJqMLo+SOtB2Ny0nsuYpoHkk+24GpqkN96zMAf7dkyqObqjipfo2C
 0BXbWshp7AzPpb7jhN2L3kkVy11ue0s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX7gSUd08mJXvj
 4czLz+IEPdfPvDj+6rAc3hrU0im1oahABGI/Hiw/XRvwlwFCahfkLBIiRV8QgCfKdakvfe1LfBq
 RAvZQxoYV8o5CEV/xoz/8dLmzBjR7fsNUTTTrbxPh6gpiBVO3a3ZnDI9x9yUXNvsEEhR7d7u1HE
 z0agnMZeEDDBc0YITJ8v6uiwUlSGjPMTXMUe3kB8yhSO0daYqzS0eAtmMBDRjulkJ+Ev829CtkR
 FmuvHHOiazYWhuPkO3k9UsrGG5XLRpPqZxjR2rebnsDKdmQIFvPVW8u3mOY1JvuyfltTvPduwiV
 fLbse64fRdoyHIjMVkA8k7aRfzboSvAj4kcB24m6fD+Z9Ncus5CqN+6k0y1PASZRTJFbFIauhJv
 D1ruwTe5tawDVUEpwY9ZiykitpmV1QvwSE8P0MGZ3cSjiBZHp5XQOydPlyxw/jtVWwxPmUomEU8
 eernNP7oUN7exa/D57g==
X-Proofpoint-ORIG-GUID: bjzNyVS0AIjTzKi6UzzHVxcb7JtAmbnx
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad0d1c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uzxFZR7jdtxeiR6lyLMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: bjzNyVS0AIjTzKi6UzzHVxcb7JtAmbnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to pcie0_port0 and pcie1_port0, adding labels to
> these nodes to allow board-level overrides, and renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]


> -			perst-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
>  			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;

I am mightily confused as to what this GPIO is.. bindings don't
explicitly allow it but don't seem to disallow it either?

Konrad
