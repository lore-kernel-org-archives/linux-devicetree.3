Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C04038C2A0
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261681; cv=none; b=osWr5VkOGWxRiQN/kdO8eyunSYx4wmvOCGhlwLeJf4BA1NkSiWrRyYJXh8gsBLoOgk/uw3WOuk/EhAfZzneMoM9LZgSqz2NUWOhFGYAE7LM9tSXNgEsXLcm5jIk/9uWh4g/usjofcXmWfQ0poKEzetXOT5Ok5H/6N+55qO++sgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261681; c=relaxed/simple;
	bh=GYwYHEIg28nGXMvEwbExNN0xfDb17DvHgTiPgknPFbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXiDx7N41UxErw/hp4Ac0hI4pAkmLd2M87hhJ70Y8fw/JUXY80XOTGBIsLeLlZkt6BgwPlz6a+RXkVVv2FN2k64GlNr8PX1dXRY8Lmppke27VDC9xrynKWSzCC1k2Z5SaEJCQ4nX+xdRpRRHyOqtgTXB3zjE86L6AWnAGrEEZDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWGPI5/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gj8H6hwS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWGPI5/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gj8H6hwS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72iw81203145
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v4VZe3+WVFtlZ6iERjGio9Lb5hHJRT9If0sR3pjYd8A=; b=LWGPI5/a0b7aCx6P
	XWi50VcL3xEioQaz3TKBC4OT3sJVSor//mpZ1psUyILaY+bSFeHLZ8DXVJNJ2qWt
	dj+AZRbc/2UoIZkxz/U30I2oWGLPShIOYspDSjcCApiAwEtrFh6SfpKfqITm9oAg
	phPzLtBlqrnefumACjFC+BW96E4A4ecs/3oCsulLuXi0ET42vV+7/024JqCfEuTu
	2jwF5kLqyLwDkLpAEigxy9oyZiTaipbDKNj8Ff89NJO8D+07afUsdOo1AH6Yw0FD
	/CEljFoLer2eykh4ZbmmuFITMqRtV4k76aLO1C2nbrLSrmpXd7cwZc2bEpC2ARLM
	L9kkHA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5vxaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:27:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b32feb719so26654081cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774261677; x=1774866477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v4VZe3+WVFtlZ6iERjGio9Lb5hHJRT9If0sR3pjYd8A=;
        b=Gj8H6hwSTtavXLt8OpCyDY7XxOxJrAYpQL+yTovfs/K7dgfn4Zl42ajtCpL/3/6VP8
         bstSAOD0c3yomuYqsZ5R6MxzQ7NWg6l2/wMEB0e2V5PWdhAl6I/iQ81KKVBsuOErSA+M
         uGaGRQwOP5r3DtuyR4YzJzwTU4XYdCgATyJ4IgHlZsyydNkE9Rfi/icJGk+UQNk/Zp3N
         mKptp+SMBdYfHxzo2CY3L0HXxgp5LeIQuS5BuIcLjrpHkDkO3ZPoPqVbpDQV6HpW00Cs
         2rkbI1tOewzV+ewjb5Koevjq8IiW376GbKA10+E0r5olUZ5H5sh7F+FCF8aa4V/stPE4
         uwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261677; x=1774866477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4VZe3+WVFtlZ6iERjGio9Lb5hHJRT9If0sR3pjYd8A=;
        b=PA8ZFwF6VAER8TQxvI9GhJZLrME70NQncuvRTTRTgaECxB6LWdAowcuFnCcO5yMWdf
         QruSjESMOAdV21jhMEG3zR3DoFrWl0129RrrepXLYxVI1w+Kb7uCVGMuYu1I97aCEzFa
         iLEa475veEyg4JnUjaMcarvvjg6VPrEewKuNv2AseH+YnHIDS6zX2eRUvJzOyvNfDDVW
         21Xe7XZtzmjE7vxcjjVAj1gfzgvdASmdfAt/Lj51tyLfuIR3jxvrXeoa8sEGvSGBu/os
         wTJahg6acFgsl0l7iR/AIce5Uok/g+PHxdaMpQ/ZPqmdFNvSKRSrLDtrSPKoBtzEOmEj
         B0Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXZbnHkHSLaG1zgzTix31lOWpZYyMEii/YIL75xXUJWmTQ+AE5VGH01kMMZT+GnbmiQkh7sOvzaauKq@vger.kernel.org
X-Gm-Message-State: AOJu0YwBTnx7beXIK59Co79palnqU3zZpFFAFAM1tftwlyEgOWrj8R8d
	hvx8FE4697bGR0CYb6etdvMwj6KAVYpVNbiD9SeC4nXhwisx4VUKaAW4qWNds4bg9Rgs55AqUxS
	+Ub7P9zH3G2F7DuFayJoSxtj+9hUulfYQgNkQ02unkE/9ak3nQrGKpA3VntnePTq5
X-Gm-Gg: ATEYQzxfZvdwEi9vOtZjq59p663e/kFtey4kUhQTqHKfhoRVXYEkSJAjP9bKBaCdT/6
	FrMeoo/FhZNcAJkJAuAXg/TKxLiKZOFTdYQD5oB5ymLpnWEdb5Hgn4cvN3PVipuOJ3gtqVFT5v0
	h7L3eHWn3pU/WWvCHO+Vcw4yjShH4lwTN2ttHrqSQ1G4fRqVWEiD2bisKGf5pHyRr0vWso5yzTs
	gNOniQolWxpsU6JIEWfuNsXZO3ivyfGRCu1bj9VXbF1qDkvze4ohC9ZAwd6AAWn83M2zHZGKfKt
	QjC0PGyzNdfOcsNEipJyaOLyiobmoMAE/EAZmbdyAZA/uzKIWHTf+X9yT0naUV6NCJnzmbUNwl1
	rosDjSolalkQkBCUXRfUgv5/6jqIsYG14lsXTKy2x29EcBbuFAvnv1FlbPiQqWT2uqChqpYRJCX
	2nJcY=
X-Received: by 2002:a05:622a:148c:b0:50b:2875:5782 with SMTP id d75a77b69052e-50b37503d15mr139845091cf.6.1774261677413;
        Mon, 23 Mar 2026 03:27:57 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:50b:2875:5782 with SMTP id d75a77b69052e-50b37503d15mr139844771cf.6.1774261676917;
        Mon, 23 Mar 2026 03:27:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-669cba50ac3sm996835a12.30.2026.03.23.03.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:27:56 -0700 (PDT)
Message-ID: <83617d9e-c5c1-4756-afa9-28cf79374c4e@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:27:53 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] interconnect: qcom: define OCMEM bus resource
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-5-7892b8d5f2ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-5-7892b8d5f2ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c115ad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=g75QHS-HUdHfZH2ajB8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MSBTYWx0ZWRfXyjUGDoRsPT/0
 d309N/yuP9gn7aXNM6DiD6CPmOSRZPuhhILYCRM0SAX8IHV9FtOzKJWv09PBFb0PttE9V8lSvhg
 RMSB9sn8TWBbCbqLAvCmuAfs/4gdmesn8q+/Dbk/UBEx1uCDjzEhVywMdF49zT7l0+yVtLSD3Jb
 S7Tk66aNPopQCsUb+5sSF8AwGcipVLBaPQMzBqS1Ovqfm3aDULftITJuJCPeNs7y9IMFww9wsVx
 NbMZ5w/3Say5L5zYCClk2kBzoythN/I3tzODV8xGJ8ScDLiIZjaDUTvlXYS71M+5snODLTYoFcS
 H1xZI5fFfb+XMIyX59/rKcRpzPzgpnMkdRGFjU2v+IIe0Hx99gnytufCpjHXIobHz3tNwTenrkN
 zDZ0BnWt0iHWL362koiN4vISXYSQ7xJlCEKu0xUAMVVF/cadeGRqQxRxymh9sUsbxjvVy4FsTdP
 LrGkagQeAk2zE1j9IcQ==
X-Proofpoint-ORIG-GUID: OB12ITmpqijEQtS8X4K9wHya69SnBF4p
X-Proofpoint-GUID: OB12ITmpqijEQtS8X4K9wHya69SnBF4p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230081

On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> Some of the platforms (MSM8974, MSM8x26) require voting on the OCMEM
> clock. Add new resource for that clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I don't know about the GPU prefix but okay

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
