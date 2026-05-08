Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F094936D9FA
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 19:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268039; cv=none; b=TgYs6a+o4Si3d9U+EpK19uzcutJDSRjE3+45yaq53a3lP5ERi9lq3YsnX8fpE8xNa3yTk8ZCADGBDhbrTfxH2rELw1cdn8YtIyuJZ+RW9bF8lbRsrO9oJSl15iowJ+zXcPKCxEuzrB59EHGRyb5KEGQl+EMtqqDdWTVBk+8xwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268039; c=relaxed/simple;
	bh=UAMVwWLPOlb06OiGlUHEI7yxWTDO23kLGEMFXjCn5vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdxo6osVpIlq48P5zqbLbXm7Xrl3jlQKuXQCn6PkACQGpn82P/aRrEnd8+l/foT6b2xZ4nyiczOjZsfiX9087km/YvUEAaTElZihPPX5u1eU6VSd9Kf9Iu/tzn4UtSmv30ktUa8XJ6dzP6Ocg3m7F5V6RTCFnn1KnXJeeX4ZmI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5gglEjc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXY1ca4W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5gglEjc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXY1ca4W"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G36xm725045
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 19:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cMtQJYJVO2Gf9M/V1tEx2sOU
	Xhro7LsTOX7c9UtcKe8=; b=O5gglEjcEVXSpfd3j/yiolJPtp6hq8KO2hTF7sPR
	9sVRMaKQ/bwlBqlnnT/apkrzBTQyvNU3wi37SxAjGQkxTBmR4ExF9b/prHiqNSqc
	a4MoSrVjbM7SyH8yMaxttzTwQKTxHqsD99d/E+luciQOcF/UUE1migTltYPmcrUm
	k6na5Qhw0Kbyo+fsnVKiIZ/bUwlWpKDVQcbCSQc2VtqN2iV9CXxGepX+TlnLyHM8
	wQaDvw1AqNCHm5bY0JYdH5o2LjbKeqKWli0VALnSVwOAbULO1YsEe6oINke4ZyU8
	rPAz1YEI0Yef5r57W4Zjfg1IvBtrM5lZhMPPaEWZ+xTWcA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k0ugpnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 19:20:36 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-631a49033bbso74920137.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 12:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778268036; x=1778872836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cMtQJYJVO2Gf9M/V1tEx2sOUXhro7LsTOX7c9UtcKe8=;
        b=WXY1ca4W2nzWExAHgYKkKnDqT6ZfLd2NZq1WJ9JVXoheixv9EI9JTSGejsJonoVRI8
         Xwi7u4U2n3kdppOHZmSkOxKqeaWzqR4fY/P/qTn2CS1WXZV16akhDXwS0hvYfpM5ca6L
         Ol0GcZ4CEKtIsQWjT2ey0ARByRWKwJjI4kTPURN9zMzYFep9d6dBqF1EKO0wDyBUj+Nn
         u3PFNzdW8ByXm1wlZdEwre/r80Ve5OqLsffRW9AqDWXZTfc9NJIX+MIZGD66Fy/8chLO
         V0+2pMFJ9AFptnRtPVVNqKEhHjeebsh1YSixudTxcdKj7vnrIgFsWQCKQmYx1tE89nFm
         weuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778268036; x=1778872836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMtQJYJVO2Gf9M/V1tEx2sOUXhro7LsTOX7c9UtcKe8=;
        b=gu9T2EQu2tZW2gO7ucKpw0Xv15r0bKWY/D2MBTAmjEj7zQAeXwq+kUNgEGJrKWAksJ
         W+PKBpWDqHE8Gt7lokwOe1Wc/o4Apv9PB0zN8pLhiLtbMCULl7gsKOt/eAYthmKWO/h8
         mnZ/Wyj5iAf2XrXohYNJhlEWm28Vi10SO9hQdd1P4U6MJIVyp54quoh1NfGcV3062evd
         1xm7rPMCyMJnLYe3s24sMPURMqfFKR/rpgOhkqf9kzpF+wbFHI2b6LUBSWawv9NyL5oK
         nGeh/ILfMmrvr6QGNEwyhfRnQ9cJWPbdijLQtYn1Xsu5FfOLNUsBOY3+QHwNPkuYOgEI
         261w==
X-Forwarded-Encrypted: i=1; AFNElJ/y16TKSQ8CFM/s2oO500NSCgI5yk1+FrohxbAXPaYtVI7SMhlIDK2H7Nl05j5AWLTAz2xgjIwtbSla@vger.kernel.org
X-Gm-Message-State: AOJu0YwBYTo/Rxt36+As4I3GT75wDWUC68QIN3iSdKX3MIEFh8v/Jr/W
	HpK6CJ0Pufddaxpx/qFZVee0q5lgTjvyUes38qZh7sT2btOUzi+BdTfxU/e7G1pmg2g1AqqhcPZ
	ikkLxcB7hloE9oGralUBMoAc7H+n+FbDc/gZslrwJVi9aYmIirWYH2DO1x2qfm++V
X-Gm-Gg: Acq92OGMnw27XcIolKZz0notenQJNsSgZ00P+7dCzdraJ7aPHH/85zmOGyVqKN+7kdD
	UElmBjmJCIP0c+AVbtuD9q97nRTKSJq83Ldyc5QmotiyQenPtGza0I8KEv3oxaEuKWk42iC4JxE
	q/JtlNJANADj4A7uBfGHH9DxUPf3Z+ox3VtO3JyJ7iFSvRwlts0lp726fxm/rl/i2aabjOjJgO6
	72d4FAbh5fiGFhdsTsICqIg83aTz6hDbMsLpzW3srkqeCkGaMm1v5CC/UYyOwSj4Nnp3dYh/tKM
	kJ/kM7lfkoLgpBm9xnlIjl1Dc6sgOE+bzy6qKUg66YGNcHE8/TQVxQozRIji6ysW1906kdAgXBD
	E4p0GgWBAvy8clU12i6SSpPnD1ErpLM8xBH04XKACFs0LX5ydQddVaz6Wzv+KXgFTzg7OkImJdJ
	IW3mC40xh3tfnsg5KTZMEIaMhuKcBZEnCK3QE=
X-Received: by 2002:a05:6102:26ce:b0:60f:928f:bf98 with SMTP id ada2fe7eead31-630f8ff11cbmr7365923137.17.1778268036304;
        Fri, 08 May 2026 12:20:36 -0700 (PDT)
X-Received: by 2002:a05:6102:26ce:b0:60f:928f:bf98 with SMTP id ada2fe7eead31-630f8ff11cbmr7365894137.17.1778268035868;
        Fri, 08 May 2026 12:20:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951520csm747036e87.15.2026.05.08.12.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:20:34 -0700 (PDT)
Date: Fri, 8 May 2026 22:20:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 03/14] media: iris: Fix VM count passed to firmware
Message-ID: <zfh3hb4gowxejxeip3l24jub2z3xh26pzl5xmjhjos634c6e3u@y26yubeb7v33>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-3-7fbb340c5dbd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dIqWXuZb c=1 sm=1 tr=0 ts=69fe3784 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lCV4VpG5okPm4yurM3MA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: nBGFc_gJ61A4v95qtmkWXfnlubJ-n883
X-Proofpoint-GUID: nBGFc_gJ61A4v95qtmkWXfnlubJ-n883
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MyBTYWx0ZWRfXxuLSDps+268Y
 jPXz6na0NQxJaodkpIRkzfvapHPz+SzrYSO0uMDmeMP1SykyJgNcd7kpRBX315uwnpoxnT/lSnt
 C0j5TURz/AnCgdbUV4dOZ0cdarLkSYFQfnsVkmZcZTF2pyZibPXaFm+e+zAqLp8o+aOOLwa5MVr
 pajpxvAQ3Ir/gQMRxYIamQxDV3XiMavl7vMhIUtkDvy3z5O2EmSkK7R9FeR20r2bXNXQEqGROl9
 j2HNOOc2nNswz1aF6BvyiJQ+QTVBZ1V7USpj+NG5XNw8nwyhGUa8wQaZ8HpOTZDkUuTSPKSGvFA
 wQVcwgwyP+WGt1W4o4bC3RRBGP6EZQYCwF9InpakNXbcQRr0fQzz4LkASmiybSBPcPzlf8iFRUC
 kf9O1LaB8Yj1TSKage/fomvNRTe7cY31/BWjXhHBbU87ePqk32pfjWFKaJ/cY0Wmg6vQ8xMNJC0
 zk/CfOq/P2+lRF6QKCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080193

On Sat, May 09, 2026 at 12:29:52AM +0530, Vishnu Reddy wrote:
> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
> the number of virtual machines (VMs) and internally adds 1 to it. Writing
> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
> remove this write to leave the register at its reset value of 0. This does
> not affect other platforms as only Glymur firmware uses this register,
> earlier platform firmwares ignore it.

The explanation is pretty suspicious. I can see this write in venus
sources too and it was added in the initial submission, dating 2017. The
driver targeted two platforms, MSM8916 and MSM8996, so this write
predates Glymur pretty much.

> 
> Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
> Cc: stable@vger.kernel.org
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>  1 file changed, 1 deletion(-)
> 

-- 
With best wishes
Dmitry
