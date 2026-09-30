Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B034BEE20
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766310; cv=none; b=WPEORTczk8tQMkaiYRZh+WnaGmVm6O3dn5ByufHt2cqTYevTQlkVNtRjRDm/Jh7XZVLdVONmbjaPHVOh/Dyq2Wipw6SRw7+SLcT7wGuQhgXjiRJg3wkehvLQzw1k07OAK82dw+2CpCQr2Zb6so0BfNYeilDDD+JpHIEfJyRIknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766310; c=relaxed/simple;
	bh=PknkWi6bFhwMmqL8I8ZmnWoNz4EVuxRbnexTR4caDrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvL93MkRj5/SibzAXrQFFsFhOSipLMmS/EDsTdOi2J8BBQa6tgWrFhfaOo67num4JovqO8FltLAfl7tBeQO6RhWHPyAR3HJ2Zl1PgUcTRuNNUYP34W2GHQuYT5BFTDVgFAAoACP/VGAvo1mLJwz+Qv2foeTQRKjm6SxBRWWB8TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHeFITAh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkFMj+wP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHeFITAh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkFMj+wP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dbGF2433153
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Rm7CC2UUQcjwFVGUTfRmxXmlR+XeDBRnP1vcD2ZUKM=; b=dHeFITAhIHTObKce
	Xg7F+2RFwKge0dwaq72OL/lufzBzlUlWrTMVlUydLRi8Lb9/nyMcoPkW/RU6LhLd
	V4Gwl2v224CsOwTQxHejRXDbvzuPK/2mEw4C2Ni+/8RGBmsOP0TiHGzhEsGHWCot
	E0VyxGJ7xw5hpptjCWezroEa+xZ1qgVDvS+iaXU0WFcvVKP3kur41KuJ614KVZvZ
	XkjttkJOEPBSmgmKxuNsepYCZTIWN/DeWWCmGTLQfiHokMdzz3CeQsoSNwXr+3Cx
	KNSaBjjwXmetibIFcg46XBe6OcmRMk4qwRs4HU1xRczYr+1NybwpeCRCr8PYV2pN
	enSoyA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn1uhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:04:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179ef12a03so1284286d6.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766296; x=1791371096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rm7CC2UUQcjwFVGUTfRmxXmlR+XeDBRnP1vcD2ZUKM=;
        b=jkFMj+wPAuClE0i+btfCk+hasVTs6cUnOsTZJdEvu29+T3K/Pbm1Q7LQwHaiDFfpPA
         hXyPLcKtCwosKJQXuwrb1q4YNHBmj3SWmOLFiubrg2rK6i/ypaap0iPZJr2MXynjPewp
         SG0V+J5dI0BxCPHaQ9htEVgaaCo7obHJm7GwGMnjR6Gp5c6MEI/TgVJGbMJd4yLFonhg
         lEXIAzCxgA4+LW7JswqR/7xaLhEy/QJCHa24pPJWKqMx1uZT7ABt3V+3E/dJRjqHie3k
         BbpNDNPVRkUEwIgtSueCOq5DGuBEA2pQytceD0VEJV7K26TiGY3Ea2+Yn5VGKGuoZE4+
         eglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766296; x=1791371096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Rm7CC2UUQcjwFVGUTfRmxXmlR+XeDBRnP1vcD2ZUKM=;
        b=PGN2L6QcmVORfyfDnl4R0mVjQk5JvGmrTO3f3Kj7HsD2txiQ8paTdU1ryfxHQuTKi9
         HVdOLDsriZt9+fHXbp/Tb8WN1jWfspgQkWEwklKBgDMXuby3Df1Eeo+f5yJ7r4l7UILs
         E/1T9UzFQi5R22bkvMECOVCmwkz6DG2M4b2fdSGZHWQRF4U4dG3Wb+eyRzsvwXvQ27ZZ
         RA0EiPLU9RA1ST6mD7C3w56AxktprdAK3zi/I3zLTpEy2ucYglf1pk0k1XKMRti0HFpx
         SkcVMifANqPysBq4/Yszwi1wcOEJJOcRs5UHJuhkmP6lcCIbyOlAy1WiO7nriWllt6HU
         1dxw==
X-Forwarded-Encrypted: i=1; AKwUvBx6NaLjPM0pYjg1wXPuLScCajMQMFv9lq1t+27fVu3C/jbZa6QpOrdUHg7uFZSUpRKVXbypLLOuO5lI@vger.kernel.org
X-Gm-Message-State: AFuF++kVI7fN7qm04Q/UJx5dXe2BXP+Y+4q4yfYv+fiwz1kvHWKD0/ip
	JYdwLFQiLEhc6SzVbn62ptaK8vO+eJ8OonR7/MEwbGDlRnwTzVo8sfvQQ5VHHoAQ0cDu+RJh6gv
	iRgeG1n9ebF2Y+KQIwlbD/beP9W49wwXb/ShIruWz7aUbfka8ozUWpQJhuXbraWCu
X-Gm-Gg: AYBFou1JcwCQKx6T4KNZnWWcrgcLgT3NgzFo/WukFv56AOxxTl0y5wtU9DjHEHi7toc
	pJL9/IDaZbsAuEQeihdqZ5E5w+gf0WiPViIwtPzQuEaNqk+DaS7Q6xhsrVsLR5s/iTwFRtL0CtU
	Yo8f85Wdm9zhts43wZYuTrcxKPnOcJKP0llhYID8FP/L+YjXwNer/ELfGUzeMBL4GKmyV/KlwgG
	J+Ahzax/033YHbzaiyNYyYBdK3/3AhMMjRP7sA94Xg7TMP0pVdE4e8MhLOO2JsnEYpqLM9BVz2w
	YHwNQhBkY5obdqWb8oPo8vBJLQfsDR7lbHVxkyiz+wu3SmIduaooNx8oRUby7sdxJNjRAdbToEH
	HZVxZT0yFHt6MqDJNvP7aBA==
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr146823085a.6.1790766296329;
        Wed, 30 Sep 2026 04:04:56 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr146815785a.6.1790766295693;
        Wed, 30 Sep 2026 04:04:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae15395755sm604092a12.11.2026.09.30.04.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:04:54 -0700 (PDT)
Message-ID: <87ec94fa-d692-42ef-bc80-9ca485312c88@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:04:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/15] arm64: dts: qcom: hawi-mtp: Enable camera
 subsystem for Hawi MTP
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-10-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-10-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abcecd9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=APqY-0NjVA1trQotmb0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Qhav7sUtUnYakZvhXKcL8QRCUxfSE_VT
X-Proofpoint-GUID: Qhav7sUtUnYakZvhXKcL8QRCUxfSE_VT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX7tzzOXCTK4Ql
 y/JTwzSkWLjk/ymQET7QYm7QOhSVVP2CJVtM5CDgd0X9Y7usjEfk+AZfe8uC1/DaJuqDvo638vX
 oShdfRyehxyDSHWCmyYEOxVo0YNpuXAxmC7Zr/Tnwk6wCY/ajGRkhzGpwtVvvtlgno2dDH0j7Vr
 omSvU0DpQX/FbKzO1Q8BKSuGbs6j9l0EDFgRF+f819DfbKYf5w3mOFqzaZQ5TwOgabYfx8UY3M0
 04nkbaIbkJ6wkHxjNCPQB3sKEujtjCFtJzH6oxHNRY4JkHleDujLXOLQRYNW4d/ObgtAEKVY8cG
 h/deP2lBlG9tqXcqhLJfAnC48Tj/XQnTkVc/aacyzWH7pFXKzxX/C2rtG2VPYwINZG3pOvC66a4
 2SrDUYtZ3GslAxYAcfbbhgIuEh1/JAdXcN2Kqd1AXLk6hItUMZPTg+5OERTDO34jcFnHE5yvjzS
 j6lGVOOnWi/v1lsPasA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MyBTYWx0ZWRfX4ECy6b+8yHGP
 rd1YvhoogvHzjZWl+z0YM+bVkcYHjuA3q+dCY0CagVhzh/XQtGVJv4PvI0JQSoy1zIDm+l0VBcp
 CMt5hjx1cSMRg8rNm5qZeyw8hSjGOK0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300043

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Enable the camera subsystem on the Hawi MTP along with the S5KJN5 sensor
> connected to CSIPHY2 through I2C0 CCI1. Add the camera master clock and
> sensor reset pin states on the TLMM GPIOs.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
