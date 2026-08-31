Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF11495517
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193692; cv=none; b=byw+ZfM2JkZbzD1jivmGpU+xkwZAIwnbV98rTqVNoR/DUcfddOcFbz4BMBjjMjjby4b2mpzVVQSL7zl+80iUP+e654ebYNf9dV1aqO5qxky0B68uwbyO8oU+RphyVX/g2PHSUd+FflO3wWMUFGzCBRnqeMUPeMGt81XHUFceVhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193692; c=relaxed/simple;
	bh=zkZGdVRwOoNfXfRx2NY81vLd+sAQrNPf20jgzNFCH8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HpZodyBmvlXPZPeUNu//RJPqudYHA57sS88K9nWqTiw/SO2Nk1PLXBzsR95s+vJaALrRdJaSgAZd2EN9ymSekMgYEbYJWBgW8bq89w1xfhnrc22NHZwaQaLxYv/uGYzzSeIbpbs2D2w+/SBBoZOoHJkESc5m3XbvAQNziEKbw8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aufi+QbF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7EvrDzA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aufi+QbF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7EvrDzA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFpf4D3395824
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QQAALbq9tEkve6/a0cvzrhYbBBU23fzG+zbH/pMCIG4=; b=Aufi+QbFrcZ1EklI
	yP+e1axCE2oid1XNbvldEVA/YAZYMEPNqSMQCmiuBPHNo99GhWe4ZpJZyyGGJR/T
	6M51b+JIXS4f1sxyVMLiysgm8dbZDxY5LfUL1SqsKUvr9zKgXJTHWFIaGcP9v9C/
	VzdACCIxboE/CqkPlNeJ+INS57zyOwnInsnqxo+t31mGviuvf3gMAM2kf8T7MlNi
	Zd7gPd4g8FtFxoOFm5bFnpcJqQH5NQlSxQnvd29nEQl9ta5yRxB49eKWEofsT7j3
	LBHJ5PebDflFyXAEtIx2N/h3UMVlTkgLoi6cW+oKyPrmOs4koP7Cc7DOPisM158f
	lx21wQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vcsvjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:28:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390890ae83so97320785a.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788193689; x=1788798489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQAALbq9tEkve6/a0cvzrhYbBBU23fzG+zbH/pMCIG4=;
        b=e7EvrDzAXTec2z1JF7l7dCInKqzEFQ7vECHKQBB82dXVrZSbyWDdT4WlkRk70xQOLi
         vNxpRn+g8zZVHNkJPsqtRwDEHOBxvdezLyvwB4lYOi0YTR5HZ1F18hXO/as43D+f+hCD
         APxVmD7XcWhfDJfilmIYauIbKm4nZnCJYYhuESgDfQKFg94M1OUyU0I4gagvu41mSkEq
         zXiocDkQ/euv5+8uLKOLTrbtLBKuzQMh13LsVqsFcN3O68Ah9tCMxhfvyJ5mefJPvKLa
         zqpj5oyJZf3fLePNagS95SpoEPkYy8sX7B2Xeh6U2MiiAgk5Pzsc49EMPoas4kbMi6B/
         Zvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193689; x=1788798489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQAALbq9tEkve6/a0cvzrhYbBBU23fzG+zbH/pMCIG4=;
        b=K3jieHUrHNyxW7+Q4XM2ifEkMs5n5IckhxvCLEmCN+v95MNntFeY6LKYcPY66bntFn
         Z2d83wWDRWn4JNxVg1PiIRILconCrqYXZ4AAUjBAOVKdmc8VhGsReTSTCz2xL/vsQHUQ
         JCkCDgeG6ipnRyZrTVpydwgtHOcN0jh7WVlnQt9k1iwlBoVVKsAZbLnbv2sVFAiaYI3F
         g6dfw4lKBRqK3LJog36pyj9X9tRXzkBBmgAe29sHl6DPLJWbkrNGi58WbPBCbL6PUMHM
         C1ybxdSJI4tFDIgQKU5h1dww1nZFtOIbdaI1EpSWyLYSCiGIPOHu9N0+64Pmb/SgLI8a
         HGVg==
X-Forwarded-Encrypted: i=1; AHgh+RojCZrhfyxxI+QBjpXToFk97VLEPFczgBsSOT0LhiS0H+WJPY5iINoW9u3T9EPhMXaVkakvg/EUYRdB@vger.kernel.org
X-Gm-Message-State: AFuF++nzh5mxnpOI0gCy6+R9eFIQDSFNg64Au6K2FPf4zx04UfjPBE/y
	mesG0QYN9jVGp5Vt9B7z5E4Uadv6JLanCzW6/dHs2QVTTmOmEEmsGsINbTzKdcU72ua6zltF3vO
	0/Dm+4l/Tslcfu4Ygtk+r3WJQQDyqFPm7j3EPJ/7o/+75Vqbe3iPhyLqKNx80e3Aj
X-Gm-Gg: AR+sD11qFJmpisRW94qXfFcd+VZvdnLgYPeoyypRfhHdV8+y6FvSEpH8TDk1BFr/kui
	llJpnEObgEyPaQUaAnngUI1lOSlKBfmWqCqK91VKu544jp5tTYcbEKvGQGgeFO5B23IVNaRVwDY
	qBzFIlW5le67hCB3RmprNMFJGXg4NatehhI7JpxbTF0oAOG+2JcljzYdj23v0RdUAVFdQ4yBanH
	vBkmi0v/PfFEu0qbaJSLHp30BZrYMpMenABaJ/fxME45d2tya5ZuAmdHnODRx02Eil4OVn3coAW
	DaNvwpniuRCbVa227Ehmvb3ciugPTnis/OKHdBq7NX2QvruxHiWs3O0aUBOz4Dub96oP5a/vOqt
	4FgWBw1xx8LToMen7wV27IQ==
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1054412885a.4.1788193689367;
        Mon, 31 Aug 2026 09:28:09 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1054405585a.4.1788193688823;
        Mon, 31 Aug 2026 09:28:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b5a4esm464039466b.32.2026.08.31.09.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:28:08 -0700 (PDT)
Message-ID: <563e9749-5558-4ccb-9b1d-0d3ec6a80ed6@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:28:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 03/12] drm/msm/dsi: Fix indentation of if
 block in dsi_mgr_bridge_mode_valid()
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
 <20260828-drm-msm-hdmi-eliza-v1-3-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-3-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfX1UZWYtwZRAII
 AXkYDQzQFr7KUlMnE+zUN1Uez2l5EZ9HJB+WNNeXV6e/FAr0ApLcYMWWQoERYU5r6IpFh+9KNMx
 xt8A7QmkpAux3ucla+tYhpcx8RR+N3vcFJdljqvYFre74Le7tHBPuNmU5upXxSntktN8JCdwPe/
 7jBk1G2HRl5N1cq+gwpzDTN0wYHcmVOaUdYWG1Zy5dhqEBH6t+CQakMILGNi5bTUHljZJazenxy
 eafy+wLFxaZp9cwvzI2zdX2O3J9nMnah3JgVQ0gQVF+c2TMUC7X+IYQdpMLOjVI6bVfSU7+yXbn
 Jd28icS1vhiaYcyiVOOU5CfvuPjOPVhNHcwjo1xhkzIK6aT/cLl7ENn/qaSFoNDQnxNl1wUKKzb
 dR0Fbk2ydCSL2lnjM47Jw+BL/Kj6J118mobVfFb3pLCun9Gj6byDkjNX8J6PpoCk7PNVWAydJCg
 PsHqqjbv6PzgKzsTFhQ==
X-Proofpoint-GUID: 0jyeI35dQYKp1gcXAbuS_-8kNcHCuBB2
X-Proofpoint-ORIG-GUID: 0jyeI35dQYKp1gcXAbuS_-8kNcHCuBB2
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a95ab9a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oMov3bMtrqd5QQYwA5wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfXxCy/XEvDQXWP
 Cj9E6iDMJ7jmMw5Lo/O77L0ml5Dv5X0VKQsmWPty98ycegwMDEV7NF6ag9yy09M0Q7LekTxqUHr
 Pcj2mEm2Hd7i8q4TmUAklKNheWE7qoo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310142

On 8/28/26 4:05 PM, Krzysztof Kozlowski wrote:
> Correct confusing indentation within else {} block in
> dsi_mgr_bridge_mode_valid().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
