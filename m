Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C7E3890F5
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260388; cv=none; b=ao/nOJH3AS5S9ERX4QanTYr+cvTmDChd2SMBC3nmcfQPZE2p85B3QVM8+t8VLOwGXqpy27LvZxsTDprOH55r4j/KOaWFs3etLw7BuHUS+zzgpzN+oQ37Xq85KbpqM5I88Ps0miHO+jpgdfdTrpnhONgLTSXJhxBN8fPLj8iH84w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260388; c=relaxed/simple;
	bh=D7uNzZwuRI/Naa00qtBEM/2GbCAII4LHke1I9waZY68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVKecZAQmq2zNNdiWbaE/ejMCbtxEwgQWWeiGL5g04T4O5qafdpnLl7bETcNeE433QjnD6yt++yxCyHS1ZOFVzEFsPZZIV5cqmfsy1hDx7u+C33LwtKY73qbQZEgayz58fpyAHVCUtE+rz9fEtd+77C+7g491y+2khjL9nZJ8K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQWrlwYP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnGhM41s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQWrlwYP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnGhM41s"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N4VdsF876989
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5yQKiNZSsYbyYyS1YJfVWczDFd4x1Y2DGvRv4gTD1g=; b=hQWrlwYPVoRbFM+p
	LCxNxKKJxrR4mfK4Q2REdZfr/kEWXqyLZDVCjb+NWEjoylslCVtOLfbjOzAw7C4t
	9gIs14C3rMpx4e/VtFHKHKSr9AtPfi9IkoOgxjvMjJjaQvsmpVqvHe7HJF6Uif91
	/4soIxrETpmLrSbh8CMciDKOpqV/a9Ptowtyy/hhJCFrmKeHybwX2byPBZ5CwE4n
	+TzFc/5NoeR01Xzo52EUfPJ8dzjuZQHo7CvgWI5LeTTtabdY2Koa5O+DVRFafqRP
	LpTBG+sRHBWvI8m1sJF3cwJNxADRk40v01MKbzcyXZY5Av7g+XvKRmIvhgw0gmt9
	FdKIsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5mxyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:06:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094ef8c28cso18917611cf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774260385; x=1774865185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5yQKiNZSsYbyYyS1YJfVWczDFd4x1Y2DGvRv4gTD1g=;
        b=bnGhM41sP/gWTp/AUUR6y/CnBd4sGWGt+6uNWKeKUtgrcyZgRBhuOkYpZQBScp4PDz
         nwaD57SMqogcR+O44QQAnM3mcccn4AYZFuSq/Yqmh5ypnHofDtDP2frQz3xfkTJYO+V1
         DOVhAgpm0Eh2trIvf9Hy474vgV1pOrb/otC5Y4Awg4BRE9B0yI6cJu2zVK6USrJ2qnN+
         VFC7HBjPFxWCdHG2rGWqltmdKGrCJJQdnHOXQNH1r9X73NfqRtnaZJn0PhH87ZMb64Kv
         OT6z9h8jyBhtCjtzFJkjKYnmnBEP1XJqZd1tKuT+fOG1/Q/VcKoL+kQkljSNf9+GvTJ6
         Th+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774260385; x=1774865185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5yQKiNZSsYbyYyS1YJfVWczDFd4x1Y2DGvRv4gTD1g=;
        b=LmMiuugkGv9g2I8ACMUCt4wjB8gWOcUrG/BjVg2UYbqD9D0Zs+pnBF921XL94/A3DC
         904dLj36sf/MnSZIF0L7Rcz9y4rEIeVGuF3wNY8RpuWZl95cnJKsoD4Nu4vXfhF126IQ
         wPgS4+YYKPnV3WkwOGcDkDeaBnjoMWP8t814Jn5E16cx5QXRq18ALeCNYyZnmi3MHFCw
         g/BWV5SKUPRYcsD7+iiobx1tA4QK5S/3e8j4CCQLe7sOefxMBW3E7WfWLwgMRC1QuyCv
         GeZia/IUDKMNoJAwsHQf9C2mHlhv5FYlsuEdUhvHFWu1tpMSJayrwzrFX+pgec88+iQS
         eadQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNiq1nps3Q5dBmaXr3dfBCrvVnEbqIqUQyXNMT01JJxoUpB/WlevttsWCAlEvhsF6t37/A0SigrSOU@vger.kernel.org
X-Gm-Message-State: AOJu0YyphA2Hcz7ltiOi1M30VyQ3BiMqGw/bwPLIWMa6y11BRPYvy76V
	t6Xot5h5whlBdEy8qAa4gJNgGWDcXyk50l5JkYsPWg46Rw//GG5yDU6ghKDvN/yEud+MZSVH0L3
	QRzne+iQHYKJgrZFOb5wWe7UU9zfbr9ujrEsspIf6GD0Y9ooYstZwWhQgwFoo8WOd
X-Gm-Gg: ATEYQzwHop5PcPS+lJLImrPw9w9JRuY/YGlyFxh3WNfYmo91Sr6zSyjC7Jw+s+HXaC0
	aKgkoRr2h9hDxMT2l3SIefIQuuohy5X6uGhJ7nIhQTAgDPlp3VEngyuLF8uPc+BnyF5U5A1kwA8
	Tvjb9ickZ0wRYLJ7K0+S24Jly940Njk/EdqfcMVcGHjxAqwLAcUf7L+IPaWmlgVoXnhVEg/JSRM
	hzGxInFAyyuqxNLf6LLHG+WTviXlIRYPVZgX6/Ij7o1+fy4VyI/msbK07yKGdQxa6z/KQDIu9EB
	in3h4ZUlP0EqqnJLVWDgs5YG2eRrAM7yQQA+gqqQGi2LhrqQnj/qzHi3MQ/sJc7gYrc9WfFdbs+
	zncqkoKP5l7Rg8Vz1bw09vSdXSegHZBw4GsZP2Q869qMYzLtTIM/UsGhoEUtxWmpWRPvZe1rmt/
	L6Wn0=
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50b6b213568mr1668581cf.2.1774260385031;
        Mon, 23 Mar 2026 03:06:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50b6b213568mr1668351cf.2.1774260384633;
        Mon, 23 Mar 2026 03:06:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d2677970sm3533532a12.27.2026.03.23.03.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:06:23 -0700 (PDT)
Message-ID: <74679a77-55b1-41a4-8e7b-297472b6db8e@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:06:21 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-2-38d11f524856@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-add-driver-for-ec-v5-2-38d11f524856@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69c110a1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lVCZqg8DjZk64FRXgSgA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: kp0XJEPntmHSNjEyOLAD-fENQ-4sgrRd
X-Proofpoint-ORIG-GUID: kp0XJEPntmHSNjEyOLAD-fENQ-4sgrRd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3OCBTYWx0ZWRfXzvbTPILFjEbu
 N+76B4FJouGr+mYyr+fu3/jEDQsOBAzsi+d0hS5RuhZ98kd+YEhI8yFMW60rLuzsL9I9kJRjgqN
 5MJoomYkMQxGMMWkUcWZfIi6ubdRCu2u3fVnIDXHb5p9W5eWz9wNOjt6rIzAr1lb7gAPN77sbEJ
 H5GpkmyDw4i00JjukvDO8rl6fiUWz4ZbTcM/DP9zbHnq44QYLnL0KTqCtgL2qRDvyxTooNzwqjt
 5GzZH+XzCHdwBmEbbmrkbEdULyMsWPk3OlBcWruC2l/Rr96vvRIoDrD9nXQ08ZhnRj1rk///wB0
 qBf7bBUUm1NeLZF2tAUXeJTcLTmHztposHkoHjmnNQUyBrCEBiSwEK0YnR4STNneh9wktxVZ8Bw
 73phHTwQmRKkdRdngdBirWutWRd6iqSNdceBXAhkeyKyq7rFbP/QiwEmtm2g5kdq2kO3ESZvceg
 SuTtm62LfTpNkw91DbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230078

On 3/17/26 1:27 PM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the
> EC.
> 
> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
