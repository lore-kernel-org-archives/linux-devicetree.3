Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625925;
	b=Gm09H0Wk8pFykWmVN4EM5iseOR7yWmUj66+Ngm/a8uBFVduXKG9hoog+KshEDZ+1a1mn
	 2YC3UsgpUjxediyT3HuQuqp8wo1LPU1mATOXAoaKCDHrDoC1CL0KHrYeYLYgSGjjjMMvf
	 mQ3xXS/GGCG4hH8JNEo8U0ul18KscS8jZoNRmWGhiLNymidInTu/xYgETeIVHalChQiKI
	 5//syaBrbE7M1nelkKLCY/wdoIVawIM6U4Q6ffDAs9z9QhlsAvIOl772fBqF3XoIiPhAB
	 KONDCrxfpYbpNENz/kzA0zUZ9Qw96SV/io7e5L/FwWm/wDVopSysruQYESfQ92GMghw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uUWEEnkgVVcM9gdESx6pqeOBCncyqZLXNSTJSCB8J1o=;
	b=YUwZUPphbQE7WptxUTrg5hAxKKWmC5gci7rRpKlofQtpp8Jij9dVxzae3G3f8Pbc+Y/u
	 sHhmvFjYcDKunD0Lqej0LMorE5NG0X0H4FGBUoYcO+FBhl9OYdN2xW69KMGsu+zfYy1ng
	 XysOrKSGb6OP4CJ2vbs8C4AFAHwd1nExevxyGqYczqAB9Otxsz1k3dxd0GQDuYspotV7e
	 dtekbOooo2ZrkQ409xB/TdMMqeE8Ir0SnoI0Q+X32r632bnRjB3op0jKpjPgbiddm+Nb9
	 gXyVZAV10ix9z92wxDgNzpUQXpeZl5oeqxHclRuS5V3/63AMztSRN/5goB9nqpNjxxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+NBmADy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lzr6Ka4K;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED5606A33C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30ED5606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+NBmADy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lzr6Ka4K
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAINe3423267
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 13:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uUWEEnkgVVcM9gdESx6pqeOB
	CncyqZLXNSTJSCB8J1o=; b=n+NBmADy4liAn3FPBtfPpY2OxGEG7NI2qjoZpxvO
	8fBM1ROB1ZyVs6b583ZnuZQcPWUEo2WoA2uJUYiSdNa14TXWgfnPRTIiuXuW3pv7
	yP9M7KiQf0bw618boZCwFRuHXCiz9oDdX2ihhJ1QzW8t5uj3gpYqUJ9oDzPcwz+1
	BwJlcEniAw5dyXwKizuL+Vn9tp/MhBOnkbv/or0tZoa5pu8K/qmTmkQIoi9LYUcL
	VQQAWV595SMxn+BQZWxGwSDFqbMgNAs5H4nlk87dEOeWfEaIu67pmvwkbiAVFDs/
	MXy3mOrHtPfOON4Ca6uPPJpgdyFGQ3IkmLHSk9zCqa6H4Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrh0hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:25:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b8c60c550so81564596d6.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625922; x=1794230722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uUWEEnkgVVcM9gdESx6pqeOBCncyqZLXNSTJSCB8J1o=;
        b=Lzr6Ka4KqeLZ41urYrsYGPgVHEYk3Y51Nl6lTb+gWI67E2zS1dxM3myqo2sV8c6aIL
         HgxbwXKhh0H3qGLqbTKxBbtYyGdSQD9HE8+lkBe2RXO9wHIKscGCTOH4ZCjQKyaR7AF5
         77Tq+rItfMzZ/Qa2qfgzkzXnEmbR+k2y+tDhYjzGiFSHa9B53NiU9WFmlCmyQmC7Do+h
         F8LgyNkvD5acNbrPcAroI9AWylOKXEsfvNZ6Zr9cJ9jgtMS0zT1v354AlnXmcwsVA4Ec
         hv+fZpz+TbeqPTaeVMtXXIjdk4kKsJbvT+tVPF4YsGcxe5YlQtZslyCCB3vi75g3+f3J
         aMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625922; x=1794230722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUWEEnkgVVcM9gdESx6pqeOBCncyqZLXNSTJSCB8J1o=;
        b=eH5D7bZKe0on+wHU2b2oHSqls2xrbgNdVOBVfXaIupFa26t33Tc0CvQPBKGRup1lBf
         5Qw0NsXPWRbQ9Ac4yK20EXOGdZYDgiXVn6eHynX1vXmZTSrh13KEG1HZRKw4Afwel3Uq
         mqtV1xtETvx5k7VEddpZEehnYw6abZRcdtpZV9DumMOwGMzMDZj1+60ExYXhjKo0XvGZ
         OQ7CqfwofEyuzABEjlZzs//E7ZrBR0WCG7WuZrrmfPPCMx1Ha0gsRAzivCMPZktI2ZyQ
         xlJ6iaD3vuPk6WB7x9go2YBX3RaXXHphIql/YvVEkVYwDxQTl5NEWIJUynZ5cMfYy1li
         hACg==
X-Forwarded-Encrypted: i=1; AKwUvBz7ccnkVpDotjYMdru4PXvROOl5boT6Rrj+9VFjl1kEosXwjrdKdIGnpr7vvnKSNkA1dXAwzFtzHc1S@vger.kernel.org
X-Gm-Message-State: AFq9FYL/xZ1Ct7jViwlDhr3eWqMfVn3ACRfD7k3kNSTmt3KWM3/bPp0y
	LH1+DNrSBg8rmgrGXqSXm8kjOQs+h6crvzZr33Xj0MqjqpqoDk9HqE5VAqSey8uJ7V7Ay/s/dBU
	j9GDK7HygiRFIhbc/SLJVw3GI9TcyyKe2IfgiVx+49or5BNT/T5rBXjIhm0vyZNm8
X-Gm-Gg: AYBFou2ul3KSis550MiJdNEkzIqQRzydFUDxUXrKUspdeTm0wUxAkdV4gg0+/boEgbE
	IeqtZhwy69K3EQ0HwzCudHu9oTSJ2YvYj/Udlhs/YX8xTFoRWy+dEjXh8vNXhRKoUyMcVjkNc3z
	rRKor2ScpimkOVqBJqqOnxBeyPacBo5bLJBuCOx5dn5Uxktsrt/+7Yw9WpfAgMvsueznta70M6z
	AETnoL6Tu6Wm07MjwGhdptFM1pfacPtYwcww+Yi3OXbQs7R4hKTniv2l4g1CE6S5W9wjznAJ+tW
	H6o8x7OHOP9wAKNAomqL6d68UB4xY4efjOXkZDxHCfEr2E5aI7skdLPxNevBLRNfdcoArN3zNwx
	YorLgRlFuNTasTZ/n2nlBxmu8fvJW/QeuQcBg9uXXtPL7//E2Ctz1MS6frRCUpLY=
X-Received: by 2002:a05:620a:84c4:b0:940:7e5c:7424 with SMTP id af79cd13be357-94421718c5amr1505536185a.66.1793625922145;
        Mon, 02 Nov 2026 05:25:22 -0800 (PST)
X-Received: by 2002:a05:620a:84c4:b0:940:7e5c:7424 with SMTP id af79cd13be357-94421718c5amr1505530585a.66.1793625921465;
        Mon, 02 Nov 2026 05:25:21 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c7852esm257033185e9.11.2026.11.02.05.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:25:20 -0800 (PST)
Date: Mon, 2 Nov 2026 15:25:19 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx
Message-ID: <mmpow46nqejnddkndwlwdslgspjl3b25gocnpbc3qaxkmyqstn@52zey5gvjp2m>
References: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
 <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae88f43 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9QAMbel9zcorH4rNmSIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 9OeZ8ngHqpOI6yRyYq6twUoJ8ba2U5y1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXwaGm4+WyapnD
 xY5t8NmQeBIwNcxCzkJ+zQflQd3gUUEqX1NtwWTXqeToAp7nZIzWIsuEaoix4XZxFfyeTrizxyR
 a9yTRASuiwOYP1zCpw1lumU0R1MQlWo=
X-Proofpoint-ORIG-GUID: 9OeZ8ngHqpOI6yRyYq6twUoJ8ba2U5y1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXzpWDHkuBOe4L
 agHobj5guuP73TTE1UWpZWMqc7DDflXzZwZ5Zj3DW9Sa+wcN+xLP6XYnF6Ma8Ytulkf+GutI4E8
 NDsrptyH2XvGIXJGuZtyvKosV12SRHaX4od/maiTwCHqRcGl634pbASjgiPP0NgMfWefIdWxv4M
 5khBqNIIK6/8cC3M2Syha1Si+9NiXGMiWhG0MzDnSXl2nuBaajbcOcV1st5xJQw4I5hPpi3SxG/
 ry0jlmYwsVqzdqXwLSI+lmniif24mbcsiDundxehZIetjURklLTsezx+kBjtjueyREzPgT3AonD
 Gl1uxO1Z1o9xul5mnoa7teOeTE49dgczIJLzY1+bnBywY6xI7tbIr0LrCGHitJfjL1xA2ygA3Fg
 sm+PD1cZviFNL5/FOe0BdRUyOum40Wvlvq6gKbWZSmfmcrclXYPtY2QRq/XcQN6s8aS7/sDlxXo
 R/WrS3buRXfMFvNV3Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020053

On 26-11-01 12:02:35, Jason Pettit wrote:
> Add board support for HP OmniBook Ultra 14" Next Gen AI PC
> (product SKU D29KLAS#ABA, board 8F03), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,omnibook-ultra-kg0xxx" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> - internal eDP panel (2880 x 1800)
> - 3x USB Type-C with DisplayPort alt-mode, USB, Power Delivery
> - NVMe SSD on PCIe (pcie3b)
> - Wi-Fi and Bluetooth
> - HID-over-I2C keyboard, touchpad, touchscreen, lid switch
> - Adreno GPU and GMU (Freedreno GL on Mesa)
> - Audio playback and capture
> - Real-time clock
> - ADSP and CDSP
> - 5MP USB RGB Camera + IR Camera
> 
> Assisted-by: LLM

I believe checkpatch now complains about this. So drop it and mention
something in the cover letter about using LLM for this patch.

> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>

The rest looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
