Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4413D7D9E
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776265495; cv=pass; b=f2zOo9C5G01AaUicbwMN2jQzO4BTCsnyJSxtwt9nrdZ0PD+JsI7mUW0iUdG9GGJDvj4JNu6MFWVS9mYTEtuxrOSIluHeHDOMiDc4GdNQcldvKQs8CoCn7voUZTF8MOTNdLw03Oz12n241rvdV+u22O1s6e3YZnStVdcL1gC9pOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776265495; c=relaxed/simple;
	bh=S6yvXcs+saJM6pDkqxKkJBwAcz1oyiNnnADT4A51sdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E88gTvmMs2QHs3LgbxvQ+KMdgmeyTZrTUZBVACOIzbvDgbDB+ukWSPchYVDSFxZBV+935ZfJ/jFVPjf7kqeHcGLe9svc5HLvwVRCV0Lq+cKD2FTrVAOAho/sIBxaZ1ragmEsRlQyHe73Abbq1fI/QlxTlHYEtag7SnZ1UxuHMow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fw+M3cHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkHoYGpt; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fw+M3cHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkHoYGpt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FEOFTG2972434
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 15:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=S6yvXcs+saJM6pDkqxKkJBwAcz1oyiNnnADT4A51sdQ=; b=fw
	+M3cHGs+7LEwwds+pwdn8AcXhx7lB33loKA74OBywFOIFUn7VawDpXXzCZIL+cmj
	N932L0wO9lpYKl0H+zltcnsIBBQp3bizglCXvrr27O3Wc73oQ1Wuv607+cdbJtyy
	ieqqu+i1YWJDlVXsc1JzAP8cRm5s31qrWO9fB8chbaXOhc3L2zvsJZzjq+pVJB3p
	awOjCk+TGUJtw6XW/iPm3vhOIIKvvrk3/U7ccEaJNkefwn+6km9kIkdQUaKhceC5
	onrXQT7z3UJKDjqyvi5c6fpl3WYLPgwengTuxB45yjXKwOgftc4P+vBS6+g5mZmH
	3OeOVeNEOW568k16vXEQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj74g9fj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 15:04:52 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-40f25e55f20so10365815fac.0
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 08:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776265491; cv=none;
        d=google.com; s=arc-20240605;
        b=L2NIoKcLwkuyW9noE6bky4MIdCFSNRdIKdMMirRdaGN+yIM0GnARp8Q51y9cTBB3tH
         0Glz6m9guVDI8m681ik3qHES5yhpjO0uKXEcVBcj8IluzduJGuMYWU0ugVRWdDSGoArB
         MfWpK5ZDbNSIAL9rPHvBMQijTxeZ88yFfCLhTURHZCW6ObAL8VznEjT5wQnjuc42M9tD
         rNvo80/7lLrot7/q8QQ+Ve+mZO9B3moSRFgrZPXV+Fql6PcYJlYzBXaKtcfD9UEuOBoS
         BFAzh9QJCWm5sQSGhE5GBuhHTnXRwEdmXASEK5RTuHK12kAOa7MsgLSPciN4meNC2vVX
         pyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=S6yvXcs+saJM6pDkqxKkJBwAcz1oyiNnnADT4A51sdQ=;
        fh=QQ1QH3qbW+nVorE4cEh+b48z2Sp/QhiXodzkEnfAc+8=;
        b=Nj55nIeZJMH399yVR27Zt3P8CB8LpdhPEy5C2JA/JVHu/ucQpV6mJ+5S1bNWH8+6x3
         FuNVqxIrRcrRyKA/cU3WPM8GvTulfA5UaGxnUaZms9omGvVUTFln6z2jtc3rSYaNY4/h
         zQz4eKKAIeEkCpzz23P+TLzkNKStbtgEjRV3VWxR3OK7SRXtBroOGjrZwMdkQbiJ+mzA
         a7zu+Cq6dUi4hOwSMUxpPEs/qsM1882Q5Pv5xTGoHz+by9TMHk7huCUvrQwVo8J0ESDA
         T6leoOgfrMN0WiacxLTSPsHdNK4nCxYYYTiKoX+1nKWaWGOiwuZcdlnlF1FBan7PHNml
         9Dlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776265491; x=1776870291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S6yvXcs+saJM6pDkqxKkJBwAcz1oyiNnnADT4A51sdQ=;
        b=OkHoYGpteGQOMV4RNU7UawuR19Y0JOXOjXoRzoCsPrX93tm04Vqqr0u29o2DA4uwbg
         T7gQyzQvy1QYoV3q/a4w/jn0JBGRDyeVM3cmvR3ZxlItA+nBZbmq3rlkMrjRwr2xfAAv
         uwrJJHq5xq8aUcaPy/T1sveK1Z6knNzc7bRgEW5GhxJj7TjhN/mdvs01VYLKQesvSGPq
         vLpdFEmFIn2Tx9qo3hEiTg8gDdlkDf5sAZrXspS/nyXtYTmD+8vfupDbmkqGhcEDvz1e
         uJyxoRIQwIq/dN9ixaFBQCZqbGnqyh2O7hDsAYxMUAgTnm90KH85TMf2qV47icQZEYXm
         Qglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776265491; x=1776870291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6yvXcs+saJM6pDkqxKkJBwAcz1oyiNnnADT4A51sdQ=;
        b=ThR3DJqLugIR/a/IbUq+EFiElgifdNczksuxNcu6d7NQTL/uFkaWPZS2GAR6+YuXwT
         8DjyBPj/rvgjyWdBQff67tdu+w6l0kJMT11raQ5wvWjAMHbfQoARcsVFouy1A/aE0wvS
         J5pj6987giPPdyvdn4xO5SJZNKAY/aQWM2WGx+JoERqZOAyfxKiyLAk3dz3EyumVo+H6
         eJ2/dFAGxMI/Ep4y9QmotwABDTav7MRso++6S/zj5HyWtsDkwYChaJMBL15++6wj1fDf
         fvRCTR7lgnqEjtkBw1660XMpf2/FAZ78mpN8RIcbCX7CK5fwaPycqIosK8Qr0XyYdHmW
         rjGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nD6cnPcz3NtJIKFyr8W2qfqKok4r5+FdffBy47NlQZsEGJlyPxheEM4mwgb38Jq/xgVcWrj4InBe+@vger.kernel.org
X-Gm-Message-State: AOJu0YzrrvbMxEeWIgOzcltRkcbPb/SxtsiHSOMY4IpsZzm5BmmXSw8L
	IZdru0C3g6z+gbI30iE0fpSLQ3HpJlTFU8BAyygfA+BlE2I1TnFXQSWO4yEoTfAzTIvAfoDfay8
	zPT+wITtgMD6tZkuqcFzoLLAk8q56ZPlMvbaurQEn/tmxgjUtKUYPCVD/mIQC3X2WYB71Jcreo0
	XMw8XP8wK5SoPOAsAqG6Aw35n2cNz9mK6ZkWKucYo=
X-Gm-Gg: AeBDiesBA9Au9RSYbShKdrMzksVcH/9r9E2nLsJbbp97DD2fkjUZobtxo1Vapgyzuuv
	1520AT5huiWbBqeVXMlNtsldsMMxGK4q9wLrULcwF6VmCRqtYyi3E7CokJd21A68IyXsMpIL+FM
	Mz7Npn/Jb14Rz7Rv5PhtSaglB/hR9zwzveia1BVGoYA/v/q7lv6yrIrpf/wZ2tCt0piFniE6IwM
	rx/KXIhEvMXvwUMgBcHECftImdt3pJldXkoxw==
X-Received: by 2002:a05:6870:d1c6:b0:409:6227:d313 with SMTP id 586e51a60fabf-423e10e4bb5mr12821230fac.35.1776265491366;
        Wed, 15 Apr 2026 08:04:51 -0700 (PDT)
X-Received: by 2002:a05:6870:d1c6:b0:409:6227:d313 with SMTP id
 586e51a60fabf-423e10e4bb5mr12821108fac.35.1776265490753; Wed, 15 Apr 2026
 08:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-4-2135eb11c562@oss.qualcomm.com> <17b2ff60-d2e7-4f88-b2ae-f4dcad44fc33@oss.qualcomm.com>
In-Reply-To: <17b2ff60-d2e7-4f88-b2ae-f4dcad44fc33@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 08:04:38 -0700
X-Gm-Features: AQROBzC2ZxkOJ0HY0hvdTt9PTVU7VKw9IIw6uIzUxBLIym5bcPEvwHU4RlF6Xjw
Message-ID: <CACSVV00RSbV5-BsNwzAaTkJGHx4EKnek6WZJxEUdREmyT92HxA@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] arm64: dts: qcom: Enable GPU & GMU on Glymur CRD
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEzOSBTYWx0ZWRfXwQmFGON+ectW
 V+nS8VPMxKMcy8ngMfP2cgYvDVezpecG/5aOCZgEKKk5LglRNfS4MAZ/1OBQuzVgEXaGCh4TzOb
 sdmROLLKQOPDZ+kW2AzMBaDOEi5L+KUjMNS6uAXjQBgqEm5ajLGnBZuBcDf931+P0jOp06Ochpm
 /QdvDKyDhkAOGs9BuAq9vLF23CeK6BRl0AZuwX8o6zGCl1bMLU9rA48tGHzj2/7q1+82VCUxswN
 CZenoR+jIGCVFV7u4wV+nxl+T88jq65nnPqWRJ8SaJQ5XXdoXipBdZPdyxkOLFvwqXCJB97oY6z
 7xCY+//zAt116pfYyT2TXAmSsPsGiWoTrApa0KwtpTM9cFRLzR5Ye3aAOUTHtAGcf+aKqPSI4lP
 ymsHV3hAQjXPeV4Zt/N4qW7E+8c/1Ia3dOGN/bXA8ry9JcIG9WKczSoESSw2gLkvOpM/gsOVHfw
 tGqDZExsOKkAGaizJGw==
X-Proofpoint-ORIG-GUID: X3DwFjXytGDt9cIUvJnQBRjsreDZOEy5
X-Authority-Analysis: v=2.4 cv=ZIfnX37b c=1 sm=1 tr=0 ts=69dfa914 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=emx6X9--i3bWQemKjywA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: X3DwFjXytGDt9cIUvJnQBRjsreDZOEy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150139

On Wed, Apr 15, 2026 at 2:12=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/4/26 11:03 PM, Akhil P Oommen wrote:
> > Enable the necessary DT nodes to add support for GPU on the Glymur CRD.
> > The Glymur CRD boots Linux at EL2, which means it doesn't require the
> > secure GPU firmware (zap fw).
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
>
> This isn't a blocker per se, but since there is no more zap, do you
> think we can just enable the GPU and GMU by default (i.e. no status=3D
> "disabled" in SoC DTSI)?

Agreed.. I'm pretty sure zap was the only reason for disabling by default.

BR,
-R

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
