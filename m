Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54403E717E
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175857; cv=none; b=eFBXBXF3WqJNGVvcLNb59z4u8erXwPpyIJTbR9IAXajqVx6VM98EP15S5/qBJOzKm/UFP7H+knSFOMWNPNmwsz7t3dMS69HM6YGTyOnhgXXuClR38e2FxWs38atRYJ9lPG8cqn22hacEDRCGovIiI+x2croMTxq5gpx76qEu+qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175857; c=relaxed/simple;
	bh=wRoc8vqU+Do3/rxWz0CWoGTRrOvwHOWj/Ks+NtJU8Ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjXsLL7nBUXyihpM21bP5Vs8v0k03PFePdF26Ev+PxY1vJ+TOiWpYwl5d7yFFAPTH9Jjr56Zn67zBCSakYs+UugFQobdyk5/opmfTTPdZClA7QW0EkV1P5UHvsQG2nlc63SSKK9HnMF8k/QWuxkx3UtKv9yQUZQw7NntNNDoNOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnP120yy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmASR2zE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnP120yy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmASR2zE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ECMFUp969085
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YKQ7jg3Wkyd4r57T9ATozmR1799CYsFYrJoZVTakFlw=; b=MnP120yyUxKXxWyH
	Uh/UFCnxVbwpuQevgHOeQ1ng4S5LscTrPexdQoyTfxEc8c6TwZAhfvJPI8jdhvXi
	sH/l1Gx6Y36NwVnx1ZcZWTEq0MOYAeyAWW78zAFvKQSbFiAvwYFYqS2/pEmFRrGo
	8MwYLWDDbRpC6z22vEgWUTkWElTjf5141BN2lJ3XtFx9qUQ5dupkMaGkrikOrgwN
	wc38C/F1pTrSTlFCwG2hSqgZIysNph9xp/P8fqEYmTF1VSFnzUOQB2ZZmYHnFXj4
	5O8QRHL8Hh3DWLsWoPp9Ak+K5HsHf9BgJjIxLjB8oiPFEPdLQ0PWNPm8XDhkXHYf
	X6gcSw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v2xg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:10:48 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f6e373ba0so206798e0c.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776175847; x=1776780647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YKQ7jg3Wkyd4r57T9ATozmR1799CYsFYrJoZVTakFlw=;
        b=VmASR2zEiHQ0+WL2ynSjRboQO1zE8bY8zyak7ZdhGURr/SIgXMo+5y97o/4knY0t0o
         4eiGSqnv9AHcwHqg0UjFv06Dy9XLYBlRRqWhN/2uoKpDB7pr1M31P3382ymBgqLHLuaB
         /pEwH3u4tK+eUQYGRfcZcbzSqBmxYsmXAwSCnb3cJJYGbaRVsLKBoEyvvEDGxYk0qdrU
         CvETrsmQVd3RZy+eCzvFNAbG059zdCQGzlllLYWgvUDBzHcdfjoxTBiy9neGGdVox0Dr
         8tTjiAgo+iYcLW9c+uFY9rbBAyKpgkCgZVuK5FAB3JrwKH6/NIoUAbbMxgX2lxKKNcqX
         GTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175847; x=1776780647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKQ7jg3Wkyd4r57T9ATozmR1799CYsFYrJoZVTakFlw=;
        b=emIlRHvBli6E1W23K2qEw1wsXSFXj+S3hJlz54luNzGU5gc61/SjpAFH/j+J4uBAYP
         8xRZmoTLx8pfAMBiKRQoqv+ZMg37ndjAWnDX/ds+Qar1XYDeHTf6IuJuYagAb4q2QjrI
         9BBvc3kBa0ALGHGXPUV75jeKybOSr87F0wdLM8FaV9vsGtVStbCtwW2GSpIbsskAisv2
         4XtwYo3NlyD3q+192hs4LgAxXM+D6aVWj4A7TLITUZit0G1XOs2BfxkQTgDivEpx19Gb
         xFjNPUfMwFLiaTarw24Ds9fTqJvme+t++0jmbbuHAGk3irgsFkG+Xalr1Cd04T5V2Eik
         vPqw==
X-Forwarded-Encrypted: i=1; AFNElJ91S7fP2mI+0960X6EYurzHpax6lhN7Jy2CDKpRAa09LJZGRysUvJP0X9NfMC6j2KuMuVenMUqik5nr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Qa9uYWy+8jzqiuyrR3xhH7kux+WXIZ9EUmVrjOaD+Vto/1Z8
	2B2gcqG3qcyejOG0XaZ0pAPaAinW5ImM6puzsfFa9q3n60VbwqoRgODwV1Sn6s6X3NxszmP7xQs
	GIz0dYZRUXs05OAOqVrwdfNjiMvZXgGgGJH1IS4PbGMOpaXP0KCuqDNsWbd83EwaY
X-Gm-Gg: AeBDies/f045jdJLZH97EIpDHbAPmD558DOrE1Xpr0go/+/yIDGRL/dUdGmNYgtLKFi
	MFIY/Obk11jKDaAiaEmfS1QIV26+TBj3jQiC1iMxJAi89rfaXaq8vtO/ZsS08gcgvBCGM0IxPs9
	5k/4889gYNWhL11gK04MzY+ylqD9Tk9tm/PRerC/LHbb1BldQbqB3Q5z1wxTZKYvhnFMCHYCNel
	n1iagsxov3PvqhMGLt77t4OwYNF7Y+9PdtK7JAtdvcsuP7AYKWWtAx3L1BdQaYkg4TrlGU2Ww3B
	waWvLQynB7G8C1Pird0WwdrHyGNKBRY9lNMKgjdIOagKmUdr98DCfO23eD5cs4vfXszfADc/cTk
	ENfNTcFJqEUr56qesAQz/3po84ym16eHYPr+e4GdCNQcC8mh8wv8L0iB0lOukASxa6OEjWUCaM9
	Fm8JvSWrJlaxpVyw==
X-Received: by 2002:a05:6122:84b:b0:56f:5b59:5226 with SMTP id 71dfb90a1353d-56f5b59611emr1679942e0c.3.1776175847430;
        Tue, 14 Apr 2026 07:10:47 -0700 (PDT)
X-Received: by 2002:a05:6122:84b:b0:56f:5b59:5226 with SMTP id 71dfb90a1353d-56f5b59611emr1679918e0c.3.1776175846929;
        Tue, 14 Apr 2026 07:10:46 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd88c9sm417722266b.23.2026.04.14.07.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:10:45 -0700 (PDT)
Message-ID: <ad4f1000-cdfa-4c21-be9e-87cd65f2739d@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:10:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: dts: qcom: glymur: Add iris video node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-11-7d3d1cf57b16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-11-7d3d1cf57b16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzMyBTYWx0ZWRfX03cWkvX2RfyY
 Mi1CnKBhrLnDt2KOQ91S7DwOZkCqKPeIBF3fUBA62kkfkfifnbsb/NVHcWQWKI9kP08zf8a2XvL
 p6LwEnJZ4NwCZlXCLzKhH4rDwanQYEhT+W9B6t74Q2Rj7eo1eMRonsrqXDuTTmWPG79NBByv0N6
 Es/z92RqN8mtoOpwN336xyI1Ut3oj1lppwmdbwxOW2NJ2050+8VXPwftCczTcqJZmP4leSqgAXG
 trX0r0rPRJlBDsijN7eYRI4HlqCtshntOSvFdXJV/ZAtEKLbbmuL8NFuy3trZr4TYmlDEr4/PlI
 3xgSPz5wo6FlqZXFvmzWzhP/Hz771L9fMod9t09txzXvBogahM+5JN/XS519mVi9lYsIpy616qs
 IhQ6Z+VX579qiAxXEvfQ2gQvPT7VSbcOsqL6Q9FVZsYDQNfvWxRVrLCHYCHequ2K+6TXhWF4/I0
 l1p1E2y6gLR/5U91L9A==
X-Proofpoint-ORIG-GUID: QUeUgmaZqly7IBNZNXt-a5CieFx5P0TF
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69de4ae8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xYufHl49NKEuV1FEiosA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: QUeUgmaZqly7IBNZNXt-a5CieFx5P0TF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140133

On 4/14/26 7:00 AM, Vishnu Reddy wrote:
> Add iris video codec to glymur SoC, which comes with significantly
> different powering up sequence than previous plaforms, thus different
> clocks and resets.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

[...]

> +			iommus = <&apps_smmu 0x1940 0x0>,
> +				 <&apps_smmu 0x1943 0x0>,
> +				 <&apps_smmu 0x1944 0x0>,
> +				 <&apps_smmu 0x19e0 0x0>;
> +
> +			iommu-map = <IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;

Shouldn't (almost?) all iommus entries be instead bound to a function in
iommu-map?

Konrad
