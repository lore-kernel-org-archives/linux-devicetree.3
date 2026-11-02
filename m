Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610025;
	b=5MmgETDjbbAsYgnYQihZX0m/PEJWSbODGv0MwCOK2cbWgQe4fDkaPxLKnjiLU8Rb5st7
	 lq5CvsWGDK66K4Cmo9h1OgP6BlNrNdxUqaOUN+MoEzu/nFh012ZzfEdSGERn6cn1XhPXB
	 87DGbGIhWSSiQj6X1m449YVqFmIvlFrXLWnF9obniwmu3PR75NaDxEPM24p3HTmOSgT/7
	 lUqJykOx2zG1+A/sXEw83XPfH7Rst1EvqTZZv+B9sbtc731IsL8kiBELf+RdoG30ptLyD
	 b1VHCSRxdq7SuC4YjmJXoLRwZ4PkNuFi+YFF6fYL2pPL7H6bIwBo+MhFBuwrKSYfMhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LcyZmMSv6hzfdTjtAfjoFhydCDrEqbyOrtGH/2VjRSw=;
	b=O7Nu8bOezh1JD6+UPLzVn9MqgSa6GoKMS/XXNlifgufFnGpbf1uzmWG7dZIvojCnsjSl
	 qbMrEWWBZEInPh0MsS7Qu52sDyjWWb3XBTj8LBgTLMW2Wya89KTCS5NkY8pCcmU4uUfm7
	 EN8UbVUqDkb3R5Ed0KstNQJvzkrcmvT9CCHGBjdpCCEufZdGCwOjZpEa3A30ADAQ3z+Yj
	 IphcOgmFzg4xvff/p+kmFJX8muZU0Rw251soZD0iJzKhDL0Xj4GORC/SXWrSvHZfJBhv4
	 JmX+Fx2vLYvUGvIxlzXnCt1clmvBahFQQ/z2O/WJCprPRL08eyt62pMaWWRd8LFp5PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RZiaF9n8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UtWnLWrZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66EC606A334
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B66EC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RZiaF9n8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UtWnLWrZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A27qgMG3863014
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LcyZmMSv6hzfdTjtAfjoFhydCDrEqbyOrtGH/2VjRSw=; b=RZiaF9n8KoArplt3
	Zk+xpRAm0lflCwyQ0IThXCXR2KTfyrvX7mq/99gb8HxZTwZzA6zfKKY1pWBM6RmC
	z/qpFuqGDsk2ajfL6uGTudXsqnGS5S4PecRHmYQKQ9432J8tJ3kZ6IPYuW7/pQ4E
	17Fa6UpbXELoGsUip9BMrTNXzcn3R5o3PO0/Y74p0X0LeVWeOXXpY1KCRuw1yJIA
	VRYJPqZWFF6dpTCwAv5kx5iolCBmCByX0F0D1uNz2wB7ZnEOhGWhDEBJHSUc6TGG
	cUTKOPm92AJfRS+SBiEm0GU/RpY/2SH+XwOU4rznMFIB+f4LC1hgriJS62wScRi9
	fXiF0A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph1892b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:00:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c82e9d68fso8138116d6.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610023; x=1794214823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcyZmMSv6hzfdTjtAfjoFhydCDrEqbyOrtGH/2VjRSw=;
        b=UtWnLWrZmtBV+OvKejjvEzTCIfJg0oRxpbt3zGb70wwJgYu2t9vmBpnFVUCxHd7F37
         HXxPxH/XTmvDb6GOGfL7MNROESNhaa/C4nlIhBrfU+j1cS8KTWgQj8XgkzFklq/dzQoF
         f/y3d2Y0yYNOq2jnqvxqdY7KRW7Rm3WZb6+DCgwzV667/3nJs8viktn0kgHt0X9hU+b/
         r4GWKnkJZ2w6BlDgDcp4Ndu9jHLCIMG6x2PyEM2kH9k4PjbjbYxLod0aNxvAUu1aIXMR
         XrjpB90XWsJxlTZq8YEWeSD+YwOZltwQxKYlBGZzCJi06sUG4L8EPvvw0ldCCS8W0asD
         BtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610023; x=1794214823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LcyZmMSv6hzfdTjtAfjoFhydCDrEqbyOrtGH/2VjRSw=;
        b=um5cnO6BHBfNerMTui41/Fa+HZrsXkIY9BhN+ejZ2WRmp+XKMeYPvmA+QW1b7HRd7u
         YTln+XlKsLv5RFIZKCu8aOonE04j4kpeAINX/FKYsrqcB/ELyBkqUsq4Lny//ws2r+KJ
         94mtA/etXDKp2dmJfADv6mFm7uZAoYovLpp622Y/ckFsi6B0zEpBzZTmgo00mULd+xP6
         PJwxrvTttPD8+CTOBoe78t5WkxIBoYlIUAuKVksDB/oYCk0lrDkaN65h3aZxLBj+pQ7t
         iJthqjFsRcwTpbdkUsfRrxaL9O+GFQ3g7IVytqx2cPrWuWZLLLN8SlbJq0pnKIPIYf//
         YfYw==
X-Forwarded-Encrypted: i=1; AKwUvByI+MHj0kDQBsMwKeTS8+2K/YD53eIpxot2V6EvNkzea80MB72jovKp71wcSrbrqYtrJ9XDNwQz9XwY@vger.kernel.org
X-Gm-Message-State: AFq9FYIuMK47xlWgpnnWgHrTcCXNqge7tmo18IO+FmOvARbA1h8zoMat
	onom2t9+sHSP8W9DYc/7xDNCZbNGcrMjKXn+jPVmtubwsrGnkF7LxjEEPcg4QCZ6JfEKrcXKi+6
	jurfzzS8bx3qDhfN6PqdTVCXB98wSEr725Px2c3TAUfmq//gCdANGUDKXEZTz5/Rx
X-Gm-Gg: AYBFou1k7inCH8aDduWaxlKMuy89kX3B9Dg0SGGEw+hxooZyPXjwdyjeIeFrFikCfyC
	QcBEAMu604XisuKTHOO/djkji7vUB82VguxlpQPf/i/WwRv6FanpG/FqAulbC3cNtqTj8B0tV2o
	UTsTXv5PJXXaPOXoQzxhRVA9f7d5EPW0wZhGmCgP9gB1/6jUZa80m/6XiDL8t/frEwADxvRR8zV
	Q1H9hjfBay0zxFXwLOn9zgtrE8pXpbQr2gCicLfwVcsU8dJrZIvrg/8YyzCef8TJRC7S+0y6XmN
	nSi+V8Kk/xdFyKkYEnc64aJ0X5e8tBhs/d2b7izYtl4d1a6AVB+0rriTAVKFq4Ry5rkOKKvu2AD
	5u9BGbYDTu/4YX0zlU75xxCV1h8zf2Xjv/HZi3FssHxi/iNVY0byZUZaREBTzY/qBi6YBZ/8=
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1466941185a.3.1793610021477;
        Mon, 02 Nov 2026 01:00:21 -0800 (PST)
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1466937685a.3.1793610021051;
        Mon, 02 Nov 2026 01:00:21 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cb092c042sm333304866b.82.2026.11.02.01.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:00:20 -0800 (PST)
Message-ID: <c1e1f708-86a4-45a5-921b-fb8a74a827d4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:00:17 +0100
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
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: sm8750: describe two of the
 three CCI I2C controllers
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org,
        linux-regulator@vger.kernel.org, devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261102060458.461372-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102060458.461372-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mgumU4E27TLLXElVLIzDjHKKeLMRZd-u
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae85127 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lfLXJ-OPjq8_KLG3azgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: mgumU4E27TLLXElVLIzDjHKKeLMRZd-u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX1ySHQPtQJhuk
 0tq8O1AVy8Fm6NaNlKhjj1lfNbQIHwQam6XqeXWQziTxuVQ/zcpQ5FZRTppD/F6TUlo26OQ8eM2
 0C/1nnjCvYmsB9xjqOiV1YTC/w9Mzh3ZVITwfuy3zKYpNt66yVomeff7eieOiWU0wy6PqQzA0rI
 nxfbBmSRLI+A8xPNGn+KKBnneDJkwgIZHCUkwj1RJ+L1QBmUfX9Cd3pd+wS6odDE7pp4VC1ejf4
 KzYSPCYNOh1H/vBu5YdNM7uuMZMuHSznShmj09JxhR4pGt8W9vKIyJqZK3ENR/2rS1P8r7stSBd
 T/7o5eNmVPme6k5azetH4oSISkYGgsTlvCD5emJ+8at3iWydb6t8UtvapPdLGyN7b4xpgEWmZVn
 i759VtGt2xZcHymMWQnNDSqNYvrIduu5ygp7uZk7+BJBoLDbpWt6XwLVYeyInTCKeRCY5QcEFCQ
 1MqbKlsVvltIbh9wFBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX2A2GY/bAbws8
 7ZvzXx997CwZrBgJi91o25JmjXJtm2T7ZzRN/oC9e8hZ0TG09Bq5U7s0ENNlX5QSzWIyHPw4jLe
 ozQscLEI0pHL3sumwI3O6uPlH8/6GWE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035

On 11/2/26 7:04 AM, Qianhui Xu wrote:
> The SM8750 has three CCI I2C controllers; this dtsi describes the two
> that the Qualcomm camera subsystem binds to on this SoC. Each controller
> exposes two I2C buses; both buses are described and left available, as
> on sm8550 and sm8650.
> 
> The TLMM pad assignment is cci0 bus 0 on gpio113/114, cci0 bus 1 on
> gpio115/116, cci1 bus 0 on gpio117/118 and cci1 bus 1 on gpio111/164,
> the last two being the pads shared with cci_timer. The remaining CCI
> pads, gpio112/153 and gpio119/120, belong to cci2, which is not
> described here.
> 
> The controller nodes are placed in unit-address order after
> videocc@aaf0000, and the pinctrl states in alphabetical order inside
> the TLMM node.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---

There's an identical patchset in flight, please don't send competing
series without a clear reason

https://lore.kernel.org/linux-arm-msm/20260618-pakala-camera-v2-2-9fbb729fd242@oss.qualcomm.com/

Konrad
