Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFEA530E11
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951638; cv=none; b=hNtC4llJmBWev6qFZWlzMlTwJ028B71REadc9nckTYXmjhitPzDQWq/7LmQdNA/qPuOydjNfW7bJbjhsCZUvr8hBFajB44GhE2NKFeatQFjZGQviWCh0jxhj+R4H/B6tk8IN4DRggkP854JmccAoH9yMVCZRkSNynH3ckbwco04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951638; c=relaxed/simple;
	bh=BpZU+Csbr6XAi4Uya3364FwpsUxyX/Gtm2FuGJ0r0Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BYX6eVAtuQfj8TRJvt0LA1Xpe8DKvPQSpHcf1Z/IbX5vZCclcz01aAuAMiYRWu5tKFRIVCBZA+IhRpm9TpVYBKCbcYxQDKNMnJDAOCW6mJENgaq2GivCtPjAJ0lav7arxaauCAV2zSmsdsa7Cs/j+GkFQbB0V6pX/Gh8aAJZHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cH4zVMhT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfZmrSDy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cH4zVMhT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfZmrSDy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689ApWvt2875158
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 11:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7M1xBfbwoWpxywxGNIz7S/tIizoYLnlcHAJ3EhjTxbI=; b=cH4zVMhTMuyO21jy
	30UgnLlKC0zv279sZxMCK+xh5RiN5zRsalXPfLhUQ+C28JTBLAfQ8IvWaoWYV7PE
	UzPSVYD06CV+MImUo99tggF3kuSifr49YyTuOd9XVF48p73nU75E++tyKC0/apAK
	YdDb13iTcLzj1TgL9OAP/9oRLiuYdWw0s2UXEkiqcUoQzU8wYaBxUWfSYhMTPHTP
	Dq7s4CXX3VjbCnjO2mADXjruMYg4KHjYd6ez80ETI+UMCKmiVc7oBURqpGfxklyl
	4CVptdJ55cSeRHfpDxBUrHKRjXK/cBetZ+n/cQ11L+7ZdeznA02+DiJBvzARwaUq
	UZZFfg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw3r46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 11:00:33 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7530aaa7212so168251137.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951633; x=1789556433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7M1xBfbwoWpxywxGNIz7S/tIizoYLnlcHAJ3EhjTxbI=;
        b=VfZmrSDygn8TFCRiH4sM86qzifxcdilgDdOtY2J2sLtVPs+wmLqgv9lXpWjb87qtZQ
         glXsVeg67hdbBQd5gWAMTMmWPu+scSaAuqrYzgtZmj64LRYeUD5wI/wF/6tNL6zSt69Q
         WndMSWqEyqxEF5lgkZNbVQlhDhx0BVpJHu6+u6gF4XQRJyjJa0TZs/fQLNcfomiAfZtH
         JzHpqjQpnNiaVQUs+HmwkkaX6X08U+3bZhewE6FvZgGOQ/qyDMz0sfq1EvfGRqsNSmMb
         0gGaeSmOSPzxJtumT2QT7yoyG1TBf5Pnf1jdfDC64+jsBQqkhrZd3k8TZgTfpnzfUBzH
         sF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951633; x=1789556433;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7M1xBfbwoWpxywxGNIz7S/tIizoYLnlcHAJ3EhjTxbI=;
        b=JobHhGmpoCNJbrp0DIaOyT6rM40IaweL0TS7Rz3HCz5D7RGssZP2snvc7mwmfcnelW
         u0QiFOfMQUYtfXqr8ENMzRP5ugUh73hd4AJTmfQT+n9+pOJLQkiAsxq0CUMBGZ+TIaEt
         g3nniFvx3VOT/9DIbaB/yPJwdyrQO094f6kUTbsONsFVyZCpHPhu91JEKfpzleFf5b6z
         EaA5tTfdHEaSCMmEMJhE73YEDpU/eKzV4bZYu/glamVpWBdXCd2SRGCs22aTe+N/yEhy
         8kQYGj1x2F7U70+3OfqHK7dGbHygXA2YqTowtOKPYZPNrkkcloBt6xtaOIBNOBLQZXgr
         yr3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxfg0eFBnL8p0Ey3RHaTIks0COZxKdWB7Lm6E29A1Zsu8UW4/BdF6YOpS+XuXPqywOFfm1rKtnJ5chw@vger.kernel.org
X-Gm-Message-State: AFuF++lVIjNsJHLUZj59sGlTuIMkpOqq+R3kdS5W8g248uZeDAmOg5ym
	EeQJuobNJZiKgbWLIttjr780p3/0q2Eg7wsfkvFI0qFYSE0IB/SCSuQW/zvszC69p1NUZ9gsJBJ
	xumEPIfjOc89DuOybwWoFvqn88fOfQLfjANfpyBL15caM/akHYpcJsET/1DyUPYb6GHvrhZ1X
X-Gm-Gg: AYBFou13tHOC4jtsQqQdEuDpt5WiP16eH86Ro0n9meZqkZ4yit6cyvohDo3YPv5XLfE
	/SFL1VSK1O9HeADd/M4VzH4RTneQ7hfBk48SkIQuufOwZLDTxf5SPgLkGOgozerUTjcRitqs027
	TtnEfHEweyfpo/ECYTfSLbLBaJMf2qv8tL7DOfL0o8UgpB7nv7wkAwOspi8yNmL9zA3PS0+skUv
	yTzkgxCADZl2jyr+hYQrvAktkDhOQUxVjWp6f2+cOPl5SVuQvNqndQBm364LwF7u9zxTlFwEEdW
	bqDAaZJVeoKnplpKLBTbJifhu4awgvmQ7CZNCEvP6qkvb5wy0K9lavfdtXXhAphDuk8QJ5wQnh/
	kjvibyxQfa3iLkKpuvJHlVQ==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2465037137.1.1788951630532;
        Wed, 09 Sep 2026 04:00:30 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2465021137.1.1788951629956;
        Wed, 09 Sep 2026 04:00:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a49e959082sm3022831fa.20.2026.09.09.04.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:00:27 -0700 (PDT)
Message-ID: <0b999fca-7441-44c2-b6b6-a092c30cd65c@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:00:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
 <20260907-pixel3-camera-v9-1-b1981f2d3291@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-pixel3-camera-v9-1-b1981f2d3291@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ct6PX8-lcDTVRYmqCqEuhNhNfizoYrhK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfX2QSVnwlizUax
 KbIaSbVR54sG9rIdw8tr7OSxLlJFBW4XkIkIkb1UQe37XY5K7Tj9oVKQe/Psd+sk4usIKnSKePy
 ZSL6JvidLF6GolJLA/2HqvclJ7uAFR0=
X-Proofpoint-GUID: Ct6PX8-lcDTVRYmqCqEuhNhNfizoYrhK
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa13c52 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uxpBaPyPSpK-buiB_gcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfX39Lfp+0+HsJI
 fXOAQB5lPaHzipqjNHNvBPuFiH+qMqWGR0qokjEsxuJPZ2XIbLX4WRcAnnzvamXl0WeiwLxCun1
 Yn3cn+L3/zbB/CFOUrk2TeywYAjub918Rlf/dj9Xt6hVhgLDyN/jZuqRiet9SDhBbkzvrGU5s1r
 vcBzg71Kd5vtoJ2bCgxMC4LiFRGi6YTjX57NVcN1MTu/5+vlLBZkRVDIYE/pJiIIv5btTC2txUe
 hRMFyn8p0AMpAvSvBc4ZYb86sLVZG/a76rLN21E6xx85eocL7hglydilMLSykB2nh8KAecuAMK1
 D+Aq/ynwrw3OWc6kVO7uf4rQeV2vUre6owVg13fx6GesIjnhtIZyLmpHmERO+JDFK6NGlWhZViR
 Yr9O26CX7gA40ievPUm1s/ErG3BJRePUknByOpy0s2PNwW9b+onx4JMny8GrdPR7Qz+cwiPbiSV
 EIevSDFWoGU4UoEyQoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090121

On 9/7/26 5:58 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
