Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C8044A3FE
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193672; cv=none; b=rL3hD7NAR1KlxoU4qgy3keVQWEyzV/0zx+Cemou3zi1W2kdzhHXIk/MGnPA2WhG4PWBOviEoEidt+QYTycpyoJLFA3jmtJY2vaq6V6I1G4q0JEoLjkqXClJNcqhNG/TSTDAHwKAg0sZ5yPGYxFHWqgDrh1k8yTc3GDblSd+DJsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193672; c=relaxed/simple;
	bh=rhAJXL/NKkli+Ix8F7UvkfRU46UJwkacUKhnytEydKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZGyE4GezObBVYvPdka/VNcjrQAo+Fe94WgNzubeqQXgnOzhVzW5n3uMeWWICsmMf4h0LOGCfcHw/hVVtPAlJnMWV+W/gg30LsRtWavypYdI7zHSSf1DeGdXKWZLAwxbsMyXvc4yiwWmo9kW4dOgmhHWfUSmMyKdAQ2xCdnFz9tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VO4zeFzR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvD8dbQ1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VO4zeFzR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvD8dbQ1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFqC624079226
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WNpN+Vr63EvamqdAdbzpzLee0raToScEoKCwQyIt1U=; b=VO4zeFzRcZaWm1Mn
	R9NqSGNXDFXRw8Bd6dGNjLdzXb11WYFfawFWyWgRiuwsNM+Bfs7FqOI/SGYZgsaY
	jU2610ckV46mPKQNVi1TDFHLc4Ev27KiFDCXso1+Efp2ZJpAAlzZQAcoOTQ8Kse/
	znAkAcoIX6Q7q2XIc6duVKeF11XZH2NbNT9Fug13TGRP2Wr2LvvawWnfLynyeebE
	5cFOvO/eVqhniN5Nq00gJTjtYoXAS7ttBz4LGz+JDxX0fEDQEiMd7XhkWDhCIgtH
	r9vSHveg74VQFbOvYn6m5Ow89K6CizzgMimrctm8yh/9+f+wf5quFH1tx/KrNYH0
	ijqGsQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rb9vgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:27:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52e4919be6aso7327701cf.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788193669; x=1788798469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WNpN+Vr63EvamqdAdbzpzLee0raToScEoKCwQyIt1U=;
        b=YvD8dbQ1+UHhNNaiSfP4ORGd3baQbaHoHr/vURmsVy6vLYQBBTOP4i7asd7/EXAt8X
         I9+ivpHTI6T3N3LhltvySZ6AV1mHGyfYvPN6AQNuB7xkjoq1CHCgokHgoPeUHXC78THi
         TV6quM1ubYKX6iw30fbsTlh7r1AwWX4/V3OcLFgGxdNsGlVxNXmtI7Tel4hl4/7qblmR
         zilzz5wd87sbgt+0PwacxbMLtJ/9YJbl1uowiICZFxOaGP83ebv2FOmo54cpu7ElC3ic
         ibQ3sHBQrS22fLWzHRvI43Yqhv2HVTH+0qBZuCB1y8r0mOJ19PZHjgHsThIwIP4ptBzY
         ss/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193669; x=1788798469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WNpN+Vr63EvamqdAdbzpzLee0raToScEoKCwQyIt1U=;
        b=pEy5YBZXgoYInYvLRYO20xmzkvLEXX5dilQJQoyD/+V3FWe0KFMGNmSFT1A2sTOrU3
         /Z7vn2IW+unafHTM9e8GdNRC0cjobTVA+YoTM+nTPrdH88RujfYp+yJjsAcM79q+4U0T
         u4ka6F8uCzc4GP7IgsPy+yXGZeZxSvhC8RLUYCgDnAchsBJ4ysAYpL+wVZ9Me2JNeGWQ
         DQ4UojRJdjJOBMeIl3HZFBP9iYAuJs81+0oJ/zLrpQB2e994WoqYXuFoSsSPRvhr6n7L
         nQKZPvLzBpc4DarKRDBSSW+ewgVN81dqIYwSnmw5HXzEvDlD/NMgcc/f0KK8FWFAse35
         v04g==
X-Forwarded-Encrypted: i=1; AHgh+RrdpGRM+b07OPwDSLKTx92Z4Kig1J1K9+TLvuJS+8jFfBvawr6oFAboFc/CbcCcowOSRR7QpIxo7cM3@vger.kernel.org
X-Gm-Message-State: AFuF++kAznjCc7S7LkwC4mF1NhVLPXRPI/qi5nNsAVbjw64ZALdEwd/c
	ygK1qA5T8l6YMKk5t0+Ta5z0VJw3hNgG9ftRBE1Hb67/Rowj40aJpbLyuN/q1aTjqftKZbAi+ir
	vKcE32z5isAC46LBvJUVv4qQDD5IQlkd26VydrOCs59Y3SyLaJXqb9WTUhmFYDENL
X-Gm-Gg: AR+sD11i2eC6v6dtg44XZ/HbXNXTfX2u75ryhKYWFrwGj0eJIjdkhjDuyk75KE2Tdy8
	qThUWcbP0gISXcCbjn1adi51knNfLEBzLJrDtAxmaRc/DQc7RdnZW4umLmMd5o6aTZ/z9WaUQBq
	1dJoMWtOaHs7FmQoyIbOJ81peCp1iI5yVYuZkPhbpow64tSX/+N26Zvy1DJgP/fOwwQ954TuWWe
	o3SZxQWEi3TYoqWbV9qhLmnT39H1miL5Zfbap0T6jN/cKdR9rOx0cC1WEqZCdVu/3gttkHYOqMQ
	ufM8e74VSu7dIMr0zU06VvnfQflkE2yKJv/i9BF9McbK0D4q+vlRW3ioZnbpS0HJ95aHZjWt4yt
	ov/UAwIzgkW46X4Iy2ztWHA==
X-Received: by 2002:a05:620a:450c:b0:939:8bc:8826 with SMTP id af79cd13be357-9393fcf48f6mr349884185a.2.1788193668966;
        Mon, 31 Aug 2026 09:27:48 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:939:8bc:8826 with SMTP id af79cd13be357-9393fcf48f6mr349878085a.2.1788193668312;
        Mon, 31 Aug 2026 09:27:48 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255eacf6bbsm450982866b.0.2026.08.31.09.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:27:47 -0700 (PDT)
Message-ID: <d4c8a4ee-2a6e-4644-84b3-bb5600836d8b@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:27:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 01/12] drm/msm/hdmi_bridge: Drop
 redundant initialization in msm_hdmi_bridge_init()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-1-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-1-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z_Jtkk2OOp2uOqBRWt7Xcn8OOvaaFwEO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfXwEK3Lqgbjph6
 G0ir8n/fx0HVQzZS0rChqIEwwUrl17No3ZN1INvDELJvRwnFWL4KnswDEq8gcz42vK0cXQQn7h7
 +Pk3MgIuG3TISuH09b2pAee/MuVvBRqgzs+l7lt+YSnAqN7g7CgkJaguPole4U0yPyZYIXrDKAx
 x1h1iOZYp/rc6mw7FZZ1TFN07Yb36iCdh3B07v51ajQT35mDrNx+Hdmh737xAhloCQ3tCS85xVy
 NYAZbqfZJaGs/obl4vL8WNv3TXU5SuVIV4zTPmzgD/4JUJgAWQbhWnPE+BllPUXW9nmx5f6b3CT
 qg/MWSFVsNT9Xt7SFYKhDB9Qg/Y7KsS2s0nrP0yv5YgcOW/wZziIhn4FDoomcYtkzsyk39O9VFa
 hq70Ljpdl/Nm8YvlZ+RkC1VEJQWoRhiQC5BESqQKPb+rQjucJiIttJUM+KC7KzgLIG1T+ttGD0v
 llnrHsNFtc0PVfuQhzg==
X-Proofpoint-GUID: z_Jtkk2OOp2uOqBRWt7Xcn8OOvaaFwEO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfX8U/GRUwFAcSp
 JJPf0PuhzKx8RNpnuy0/0gd9CzeTXludQRx8FWFKSil04Y63OAGXqGZ8JcAf5IL6uXhunVtHYCS
 i2xpX8sLcG2Gm+/GyF2xI7DrdWRBvYo=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a95ab86 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=P84uMFOcKlMy4IiKK0cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310142

On 8/28/26 4:04 PM, Krzysztof Kozlowski wrote:
> Local 'struct drm_bridge *bridge' variable is assigned in ~13th line of
> the function, before any first use, thus explicit NULL initialization is
> not necessary.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
