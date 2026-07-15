Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C4C43F8CE
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111032; cv=none; b=HStoIHAw7dzvXUayPA5TDMLSnkceNB9dzFtEGYttb4AS7uix5Fe1DDuXq1yofxf3CNWQcK9ewKRrwkzg5CAS6jRC9jiHQYUNT1/MR2An0wC/ilaq1iQzhHtpy0M/mDpjmSYOFpsQpIg6YkkEhKEtFp1kr6EdwHQAtiknIHws05g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111032; c=relaxed/simple;
	bh=dolCZFloOHyIdVTD7TrCs6lUgDEHNVgJlSOuABpT9eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0JqLYOPbEmUWI8aYOjZgs7rsILf88+ekX8bVEDzbgjZAjfB7enr2nsSHIsFG5QZTYFNJSadnf5sPqub8Ynj5BnpSjJojOsVx5+yrUY/FGyXVPgxp9JXtZZp9ojddicyk7NmLCwo1FeLIsBD9DDU41js4c20Ygac5PhcrS2Rqkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pqiw3VYI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKCG6CXp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pqiw3VYI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKCG6CXp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F6hJZI2795809
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	usbf8FGUCBoK4wmdLpHe+mE0Ra/HMX4Li1R3SmnHXbc=; b=Pqiw3VYIXNzB6POK
	teq0KumgRyghnQEzmFvNtSO9JNgqRUVE2GRUoCCoAH8ZAoqGR1n+WGCkNazc4DGA
	U/IVJAsCL0nQn9aczPE5HYsQk6b9HqsAGqZAXqz+1Nh+zR20kZ6WGZk4XTxn8wu2
	OHsHkWin+J5Rgq6HCrfzb1MawHnnpC5zUp017xXoTLfOrEl/UqS4P05PjnEOjdVf
	9TMf1u85q5ht6E9U0DwKkR6o0pzIZ3o8AZXDFeoO5sSNcTupg7DL+OX/xprYLLc0
	kpWB+G6KF92KlBZQ3cKotqHaCl05uHOTpIwpkZqwb8lH+MCvkYwHwTdbhlLCZLbl
	Sqkqew==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h8tau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:23:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c27616421so17831431cf.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784111028; x=1784715828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usbf8FGUCBoK4wmdLpHe+mE0Ra/HMX4Li1R3SmnHXbc=;
        b=OKCG6CXp1geUlOwjpwUNYjbrSDO2Rm94wHCegAwv3rNvvMt6Qte1BEqpNh43VB03zw
         t+8hPybgJZNEcTYLC+psUGev0h3h+XDgQxlFSfxMYKpE1tPZKT3HFcS8kednTgLZlXWl
         mjnsdM52d5XJ3MXP2L/JNd0XvXVZhgAdbFyNkNXIrOZI9wqETvqHjSzMHJEaEIDjInhL
         8SHOvqAXaZBDG9CZF5xRYTf9Ei6nPVwEn9Qkf5SdgV302eNt//M9TasthNLf1Q8prODD
         6jcXgeJ7ONNOPIXDfHLx81oqRVkfKAvnyjLxZIHN7IDB0cv1L3jVFb3GvnXOYQ5uBaOu
         ZOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111028; x=1784715828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usbf8FGUCBoK4wmdLpHe+mE0Ra/HMX4Li1R3SmnHXbc=;
        b=KIEiAYYz2AegrguJzKJp1c7AJangbh9gxBD0+io+mOCc0wr4E4M/GE/N1vAB+VyDef
         EK0zJ2euXDaHGZ+NA5ULI8zs7IVbZ+0vp4OvNyeeY4YcJGEZBlz9ttXjFdvkXq3nO/pY
         7uP1N4XGbEICRS+Yce1eVk0d+2+rK+KXmYd9y0WjEVlCppnF0vX5ivnm148QyNJRmrMl
         AtDHOaIwxZ89kKryJU937fI9AsGskVx9g8hgu3SuGejsPCMbhQxOD/8ehERCn07cYGM1
         tNPvOYjyuIq9aLajIwIW52It7hdH4yuDTWNwWyM3Rsk7KrHsVJnSsvGv3eDJSHRuENIl
         i4jA==
X-Forwarded-Encrypted: i=1; AHgh+RpcNXJZuHfO2pMybuBpTRs2O6LSEN7i2CR1iMYV71vKZ4EM4I//iGsktVkwdOJZyRUAMnTAUS8rfx79@vger.kernel.org
X-Gm-Message-State: AOJu0YxiQPdpJJoBtRvwMIkVp4dyo3nqEFBnSrtf92GQn0Inrxp6Bfx2
	It7l4QY8pQlWjrkm8PmRycX7nQTFg0OODZrrmBVougQ4CBMu+rV3H8pf/3X0paVbK1xgetHDr6I
	/tEULFxzGyJrFMiklPUGqEu5o/KW/EMSxOwP38dqCbMZ63+sk8+PKDobX97hGc0Ls
X-Gm-Gg: AfdE7ckX50xWEB7x5zfKufm9HIqzfXW8B73tdMFIPIiw9pjRycINWaDlewGvvrJyfHR
	wlxIAxyK+LE47LgMxf1jerrDaoAsx+4A7BzkWGL4BoXzP5RSJnKu+SvGMPdhHerj3u+zBuJ2dMG
	xvXsEN8lKW0sBmOdkney8IjY51EJd6DOXYKSGvqpMaG6rfNkjZz/ZquvNfz4pUT1eFTNkonETeW
	SrZjG+vQGmZ4hALcSzLyuHkEI9eHAIDTDdYoC5ENlQpAKh9mu6l13oycOodRgpJw8CsAQ8wQoEC
	4YsDBYBppIZ/rZFA6ZxhyuyVQpNmfjv02dEPq7ABf6mlgQ2l5Yty4nv3kjqJJioKVLh3eKB03eq
	ROOFuNrLSJTNeRqFPPuFlx1idyyuLOFsdfpg=
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr134730291cf.4.1784111028233;
        Wed, 15 Jul 2026 03:23:48 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:51c:215:3e81 with SMTP id d75a77b69052e-51cbf0e8ca9mr134730031cf.4.1784111027799;
        Wed, 15 Jul 2026 03:23:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb30f98sm1327760266b.55.2026.07.15.03.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:23:46 -0700 (PDT)
Message-ID: <7218baf4-df73-48f8-bacb-514ac3cafd52@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:23:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Eliza CDSP support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
 <20260714-remoteproc-eliza-cdsp-v1-2-32eb7a1f2c59@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-remoteproc-eliza-cdsp-v1-2-32eb7a1f2c59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMSBTYWx0ZWRfX870zJJf+MVqW
 /cJ35tx8VEYwF4n00pGKszaT5o1ZCRv2XjyWE7jDHZVQ+hsKSakC78vq8G8S3AsRSESAw8nfzf5
 yAj3CEjj+juL6s3lmwZvHp4fasVlK+0=
X-Proofpoint-ORIG-GUID: wVj8FUSp9C9rD6eeLehZi4Jktrd2gsER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMSBTYWx0ZWRfX+BzUllJhGa8a
 hb8TffeTWOt3/L0CpPuBijtOnr2fSFwCgqZxWYdBS0/Ql5T28s4PGbszRWqwSqlNaENQTsFbqSc
 opQDnJWVgzYmBNKsNQxGwMljtG4ECzn2GR8/+WTpgUQKwdBoA6UDgBG85oZ45QuefJZU+zMUCpl
 bXkMoDMhxIuYhgJ9Epb80G2KQuZeA8o5CmGW/jhwOGcy86AqHPAD1dzEV/xD2aYzn9yGtMjhfew
 402hA2gzyVbmzJSjbYkddxSIehQ1drC0q1IUdhrnniBLHrIGC/WTczVrw5o9QB1RfIdYiRl9/1K
 tVnuG69/5dP4cBBkhf+5haxdlWpNtHjDqUn08o4yZmwlCYEqAD8BmzBjrwiWkg6I7yNJOrn9DH0
 rgi/zgLPz/31QAxifgnrmSYVEoK/hXO8JHVtDtFiDB6LbbUfb6jBAt1W7sWNJPgFGz4tWIi8Sm7
 MZOfs7PVrx0hcKT1k6A==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a575fb5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FtAS-mdK90XYVRSJJl4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: wVj8FUSp9C9rD6eeLehZi4Jktrd2gsER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150101

On 7/14/26 2:24 PM, Abel Vesa wrote:
> Add dedicated driver data for the Eliza CDSP remote processor. It looks
> almost the same as for Milos, except Eliza needs region assign.
> Tie the new driver data to the Eliza specific compatible.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
