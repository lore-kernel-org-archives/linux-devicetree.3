Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950AD2AEEB
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227133; cv=none; b=G7xdvIN+mdnbxE1eDW41jjKmH7zUh54iSTTSG4ubPasRa/XygDqvdftABco78NCM7w8SVuLS9Az/7fwuQZV0ADeJ85UODhljGxoLqgmAoLSb6u9zkQcnTXFBBGPGfh9U1U21Y/qSZXxtVo7RXfYn7mqkLw9v42zm74skYKHbOkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227133; c=relaxed/simple;
	bh=kA03Dsr/1AHH0hl43xERedXPdz2D5bE29hNcSja11iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDvGUqlbS4SGRl6KhZrkVThUZV2rwyscu9xq8scuel3lpfADDh6rlhMmiY3GsfRJy9bRQKYke1exY9EnVRIFGPiVlo+Lvt4ApgXl5l22OiZ65+5hZ082i6ofZ9MBGsvmFj8gg9DGh7nPIgDUuAvaO5Y37k3ESMk68uZDZwS7P8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnyhJEI9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1qH04rB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnyhJEI9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1qH04rB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEe6J72607812
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/5DBiz3xkQf+uQf9ORN1tCQu
	Bg+aStW3CqHxiKqhVrM=; b=nnyhJEI9E3IYeBxHDuIP/mBraAXITH56GgjaASKc
	9IuRE73qmmt6TOmsrUTPvc1RhVfd7Qgs5NxRlK1HERk6x1zTQxq8/IgcfKbcsrJ4
	+N3/67zGdoZFehzA50MeUrFVF/G1iWjzTzX6iNQA670l+8fCkgZqGyJswuvIZmso
	3T4lpVif4E7rTfbxiGDQwX6mIr+K9FgD+HHa+UkwFpTYPBZktIq+zOOItbZKOpEs
	FwGwr3xhOTw5wDDIS66/8ryyGNNTK2mBsBSv1mGtlFW5ewFgSQACBq+GxqfT9Awx
	D66E5XV6h/ESUrjEV4oxLRAZiTNiswktMVMQO2HKXpmbJA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c98hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:32:11 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82c2e9761so493078e0c.0
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 08:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227131; x=1789831931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/5DBiz3xkQf+uQf9ORN1tCQuBg+aStW3CqHxiKqhVrM=;
        b=X1qH04rBEDZu0mVBvr6LLVeekxDrC/LywjOe0Dj1XiBx6O9cqLRICKU4Zq2sZOAjH9
         tfiRbFfdROREMXE+RFQFfefUX4c+/QpyUGXi+i+cEEIx6GVg1eUU+5sN9PGBC7O73mh/
         u7dxdSS8XcnfhcePkDqFEVAifynTdxwpFgpklTGvUecskLF5rtvuZu/4uzYZ31O/pg7N
         7/DT8t9KpNroqik87iNxdEZOHngn3dDirRfLMsXnfTG01PiKVoX9GMmJVlh/lMWiPbXQ
         AmONeaKsOmdL2GSM7YuG8eEYaG3XgZBSeJ4eWOcFZos7PUktb2kk9/QxOAZvIaHrE9qq
         hD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227131; x=1789831931;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5DBiz3xkQf+uQf9ORN1tCQuBg+aStW3CqHxiKqhVrM=;
        b=jFq/IujTxmsBCDUvtlUjFF1NM1Tp47yRORI27pZo8D746ZX5qZgASTT3Kw3w/RhlsP
         VA3JzDxKJmp3v1ngNYowwPu66EAPpGx03ckNANApdtrytmPj7hRHEdeBrT+F+wEPN3zh
         Bk+lCmL2vRl6aFlbMEoEambWf275/DQsTDq6clIVSEAKM2bS9OZuGFlBieEDsdxiAvid
         xPvd3Kt8oDI2LHIGajOLzDvZlZ7KrYvj5My5sY3SxP2UyK0CTQXH8YQQ4s0+VHCujk5e
         eVbk7RAQ/UcBCbo5m+mPwmPpz8iXxgTDllMUveh8EjQ+/nEH+1H5IGhzvElKApvwmI4C
         v9Yw==
X-Forwarded-Encrypted: i=1; AKwUvBy/qSELXJdHPDxD7qvL+GlJT6Xa6BCXRpjM5ATiVe3Qr7hi4zv9Tho6nAjvlYVHsJjddmvESNX7ImYA@vger.kernel.org
X-Gm-Message-State: AFuF++kLX2FIcvkMJLsSpA7UR9ZEe0TQn2kjQTzCOmmhea/kEL1wIdZQ
	BBjpH1CIb3b5cKmP3m4t9xbXkVOyHNCdBRE08NbYipVHFjiwuKQWOPlMQmc0hIA760tU6x69/2C
	ugsurErSAvAgQL2QrceTgcwlwTZiIiT6uOW2g9fU8HPdTCIPGep3m1PrBnl78k0QV
X-Gm-Gg: AYBFou2RoGQa+LpGrSJZIFad5QhHOiW+TGqbQ24qkWbXRRAPjJiGKKfomUcw+VcAphg
	t8VYignTSGcIziG6wZjYVG9avNJKvErzWoaobUcmmoGwpp9rnRv8jT9ktrSGh6OwfHNBMxbhI0V
	0uo77KdRRUZcx90JxvXwPGsA0Ypreru3iq/cF9iomZk7SaJcyy75m1bSnKVl2xRoNnzBsSbb8Hp
	sY7VkDDtw5pTG+Ut4PziZ/EIdcjSIOwLgw1BG8V8wrLpkgdH+AvkMfCQsf+G2Qzg86xEQDgE1vt
	17kzTcDXekNq2c8qXM6Wmqi0XDIpO6OOyzefYsbi+PIuSE/6JeCN0g7UqHj7BSWSfHD0YiPY87L
	FwfiaH3ghMEnZPA==
X-Received: by 2002:a05:6122:180f:b0:5c8:4bd6:fe with SMTP id 71dfb90a1353d-5c965ef7403mr2720484e0c.8.1789227130522;
        Sat, 12 Sep 2026 08:32:10 -0700 (PDT)
X-Received: by 2002:a05:6122:180f:b0:5c8:4bd6:fe with SMTP id 71dfb90a1353d-5c965ef7403mr2720349e0c.8.1789227129945;
        Sat, 12 Sep 2026 08:32:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm12842770f8f.10.2026.09.12.08.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:32:08 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:32:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
Message-ID: <xzuh3522zh4hqck6kr4piauyzoyczbtv7ngnrjdn4rr5jz45r2@7uwm2rvm5mq6>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: 1ngValcKNrOTHnfjVy8uY39s6P4uAHKm
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa5707b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yfiF4Zao35L6hQxt72EA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNCBTYWx0ZWRfX5X/GNICGTiB0
 WtomS6crQFBpYUtwQg5928Q83PG3dRMMP+IiewKAZKdWgh26l1WKt99LJwm789hIXww52EMgr/r
 f8jsImBUvXTcSNjoaNA5GxtGFevAbZ4=
X-Proofpoint-ORIG-GUID: 1ngValcKNrOTHnfjVy8uY39s6P4uAHKm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNCBTYWx0ZWRfX8Irt7vA4S2sp
 Nouv6em601eUgmXt2GJzi2OzSSnRuVREbtcVsuUmXBCUWmXUyfn6Owp62RXhudSLtvAPNX9f+K5
 aCstk1S3xIG+JGiEaIqqOd8rcvoRCOf9kDOC092tAe8qgqFIw3JTkdr9FTmgp00QEoqTgmG96nY
 UjzKETuHoeKKMuZOUDOQ5dDLZOdyy/FGPVwmAV+CWreHC8IojycIcXZbY8vugaxGlfxtOQWoqdq
 UMRezjLfTrXql8FrpNrl4niWvBL34oIGpq4wftkv2nSqBqKE+eHp9BSBfyhWHlPO0cgyjuIbB36
 JgzG5MAXdZsyEYEpb3fQa9RWK+QU2XVTDDGO5IpxFIDQ4QUSRYlBwXb4TVHJVeX0dUO2KhNmh5D
 yJ3y0ak1YpGeDuxE57+6FFPCUegcYon2768FFbPxA2u7ekKLyaHtvVefr14Ow2Cj2O38lowS9mg
 nUrHSnAUOxomM7B70cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120224

On 26-09-11 22:20:38, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the platform resources for the three USB controllers on the embedded
> Nord variant: clocks, resets, power domains and interconnect paths.
> 
> Add the eUSB2 PHY for each of the three controllers, plus the QMP combo
> PHYs for USB_0 and USB_1, and feed the two QMP USB3 pipe clocks back
> into negcc, which so far carried placeholder zeros in their place.
> 
> The eUSB2 PHY of instance 2 gets no 'resets': the SoC provides only two
> QUSB2PHY block resets, belonging to instances 0 and 1. Instance 2 comes
> out of reset with the rest of the USB20 tile, driven by the controller.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
