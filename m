Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89D1339861
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135346; cv=none; b=Plvi9OWLEgGPBfYGeLpxxtH0uFHxTxAubhT31/9Vs+gWYd9ucsg70M+uybON1HEnJXa94IGZxPK6C5jGJsEdyJ8Di9HgyQ26BI8yrwaPM92lWOgmQJ3iF6pTbCb2f0/Bg3RAnHn1eRJnCQeVwLZVUbOutbPeQijae0Thp1GOUho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135346; c=relaxed/simple;
	bh=q4n4WscZymGR+jyXhlIk0f5MOolnTwjpVYSPetxxmyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAtxFuZ1emuWzZWP8FIAaMsoAxYvu9v4UXFsBmMJEiKgJ5hfN6VEw1TslJzwazzjqRSIbZ6Yy+9P/0NNx+HZjvNqzNER8lTb5lj5dLTPguUONUYrJdYg/yhlD3Jn2xxzDQMYw7in3ipxsA4Q3vpGE8ze0WlaLK1kczsVJCNUyU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okPBS4Wg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4ufDIbn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okPBS4Wg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4ufDIbn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eHet1669796
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MfXJtZr1BfbpzWAqkA3avZGzmWbhCTFbYqpnpL7A00=; b=okPBS4WgbSJc119L
	dmcdC9QxnO/7Q0WxFtlWr/TSF+g3Xr/faXdpBDz8RZBZrwvrJmzgm7K6EMdW/fbC
	SkviSo9rn+wm3toholzlcBi3YHsaiNM3EWITvOhKzz8JNxvHsiTjTLskQHp7l/Zb
	HPL2giqopb3EmaZ+906JKl1CSe4NESfq0MyTUN4zCkERnXlfU2FCXmsroxYG0Xaw
	bFCEQJLrLGQ4cB0/Yj+tCtXyri/EcxWs6DVv7ug2SamfJmqtxfOQcJBsn8O2ErOp
	JqxqLk81ugb8Slkb+K9xkTW0iRbGIscjTVDRlXGZPrchVFFS9w400bTY+Mwwh+ee
	nQ/k/A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1p0gq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:29:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-362d9dd9a49so576095a91.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778135344; x=1778740144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3MfXJtZr1BfbpzWAqkA3avZGzmWbhCTFbYqpnpL7A00=;
        b=G4ufDIbnm831HspkaPk3Zlvp7tkgzaqgsNQQcXvb7ab8oW48KzKb2RnbuODBeDcbZW
         H1ZqTMtmsn/EuLXhayGRsSI6ewaC9g9odh5E4Rp+Vai7WZBCs1sdpD6zJuJrhaVhGi1E
         1AyVHDG85kegbWG882IurAk8+ThbiFaruqFoFV6yGfudMWSP/E9o3paHKU5u4LFKT1Ux
         rU9IDDMrU9onts3gYOlzx1gzFTELbJB1v+E0tuj2tJaV5OAhQdnKGa82clA0HOh4we0M
         S+4sorFLN5/ccO3B2iFdXhQrMxYoQgcll9Fs0ARssMTX2LSwxhCXwbmjFMJDEwxf37ht
         Y3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135344; x=1778740144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MfXJtZr1BfbpzWAqkA3avZGzmWbhCTFbYqpnpL7A00=;
        b=C+MbUsLZ3rpeE5YGcpTen+QQGMH7tUWB0xhBn9VL9v6A4nWFRGAAVq1GmnVo4y0AHV
         n8lqmS1sxFCJW6tXzDbLrfBLORRsK6zCCe77+qjer/mYCsrukrXf4ETHmG+BdtbnsSVi
         S9qG8XH8hEWmTxmw7knYazDL6mF7V6H3cqajYdm70pGzst3bGOeEO+dl71uDUGh+a/27
         Iq4vdWD0ludBeUJtfnM4dV+aTrwShIocKpCVTNWChVijVcqpzLuZPBQ4Z01FVdjS2jFE
         94faaBKG6cdzN0A4/4/62YbMt/Ve98DqA8A3ytGeLO89VyCBZKA/rtYyhMoy0+eg7LVl
         R5GQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EopdE/5a96hxmxAC8tWrS9LwgFjtR6txI6EwMmbzj4MxkFB8V2ZXtrWeeRDfUOnUQBNhLEBKr6OXv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv7dFv/MHXLYXq3dz+FmR1nD/Ped57itzxnGfw9KR75Bla/d6j
	DHgggajIc83+DYYS6OTPgjOVPdt8xNJdzmoBxB2CGRQvjMSkFpm9ozd+E3901G6of7/4Ouux/lO
	CKcE51fwfdM4a5qCPq0CfaxpOZaswB9lUvYYgtsjPQ8oKVdxkPxSmtUXMJb434eot
X-Gm-Gg: AeBDiesa9spBoibaxUhBycqk2vx9fPxXoW1S2y0CnF+dtLWgwVIlbaLJzFdnBaG02iD
	YLU3V7Qsh3WBr3K5ouy1guwKD5E70Fjm16yl2gAOaMKRWYGVo5tt/TCZcZ09VPdu0WjI+BCRaqp
	UnXeU5Rn15ZjyUevsbQCtucGh2qUvHOjJZi48kzuSNn5x54FmW/lvN5KvVA+ckIzmktxSucb1uk
	p1uCkDmut/CRY4oWAVH9nelZKWslwkmP53Plmhmr8mHAwtbgOW2iGMpB4ecKPjiNq4aGU+22v5X
	yuJQEJm39wpL3XX3z4Z/+J7Pw6fvIjjEefuvHXMGEd1bCeeqhjyVQ+7QIBx6jnoaejwweR3jWiK
	pUcyknFqS8xfNU2GpF8FqNP5CbzvGUNq9nD4lf4dkYAKCHndgEoiQmolBCgPHFpPAewY=
X-Received: by 2002:a17:90b:3911:b0:364:aa5d:7d64 with SMTP id 98e67ed59e1d1-365ac270394mr6667601a91.14.1778135344468;
        Wed, 06 May 2026 23:29:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3911:b0:364:aa5d:7d64 with SMTP id 98e67ed59e1d1-365ac270394mr6667566a91.14.1778135343956;
        Wed, 06 May 2026 23:29:03 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365df289c4bsm1525252a91.3.2026.05.06.23.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 23:29:03 -0700 (PDT)
Message-ID: <2440d481-d7a2-4d52-baa6-6003b49a3f88@oss.qualcomm.com>
Date: Thu, 7 May 2026 11:58:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] media: iris: Add platform data for X1P42100
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
 <20260507-enable_iris_on_purwa-v6-3-48da505e23bf@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-enable_iris_on_purwa-v6-3-48da505e23bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MSBTYWx0ZWRfX3AzZ8d55DwQO
 2T2vNZu/THUQV/99Idg/F3TuRwYN5A1pdDA9J5FWsZjgjlTklCWWuZ5gLsOgZ3yYt/NQrYyUJW+
 6a+BLFdre4CzJRr174o0w+k3v2x53vJKgpLEISlBQzXf69D/F8yj3kWo4kYhyLeh3m8G0PZoIcw
 WcdlbvSYvCEp9CP2eswpy1X9994qUFDwM8BJunkrNDraQhhSVjcuF0sccRc1zY8lJY1rRQ9zfjt
 SYGxCtO+2nwqClEv+Dp7GuFEmAbIwpZRcku49dfsK79gXqMwCMhf4B2u/88tL4ezHCn9AAK7yCX
 SNFE+HAzpdTIw6730+b22wggCFLOe8nlRJBkgDX4biYvTxFuo/JBL02jtF6YLzcLPaN4F3mh1GO
 29EddTTr+wwSUG196UrtZ/OpdpTb7uYJZRr4gG82F2f1aSE5HBUtuJq46uNV5koG2iT76F9TbjS
 cjiP6/kfOg2qjVkae4Q==
X-Proofpoint-GUID: Y-_vSPYu3-iPeDcd6w1iv5jvPYYOSUd5
X-Proofpoint-ORIG-GUID: Y-_vSPYu3-iPeDcd6w1iv5jvPYYOSUd5
X-Authority-Analysis: v=2.4 cv=K4IS2SWI c=1 sm=1 tr=0 ts=69fc3131 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=BKLBf-2C27FvE5_AC5EA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070061


On 5/7/2026 11:35 AM, Wangao Wang wrote:
> Introduce platform data for X1P42100, derived from SM8550 but using a
> different clock configuration and a dedicated OPP setup.
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 103 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_x1p42100.h    |  22 +++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>   4 files changed, 130 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

