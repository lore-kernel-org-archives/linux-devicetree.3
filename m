Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738845;
	b=Fe5kPjQfE/bmT/Kwp4tmFTiT3104Bb4hETFNDO/X28gWaCKkViSNlesdlrRwTEKKS6Pi
	 +9WkLJZrl0U+Tws82fRSbiKP2nTgzl1mUT5BQpZFtFk63jmrKvcUzadlfMXQSHLlP1eXf
	 JSgrt11xCH4Gkz1DYUyqJfWBN83BPdwlbzWqXr7zchc+36XJl9OmnD5NoUEJ41zW/VGDb
	 6CL1r9ICTh/tY6s4gKLQGJygH3JNfHc9NmVlEuVnTH5d3T7OiFC5Tqbj/F0mX5sZzkEpo
	 eGKrW+ANrTEQj2RAvH/Db8v2ziT4dYfsKy8Y22XgR4DdZ292aYytcFPlEeMMIjj65gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738845;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Li6ecssWAKTyIqGTgzg996bMuxChvYuVzdJanfbIoyg=;
	b=rCcQGcCg4TU3MURcVQx6oR/uPUJ8B1k/Gs+7fjMhq2you2W0RLwbn+9Ls7U4/Ijf58KV
	 2blf9BQmKvxjksF92oMx4LYJyWz9l7N/dN5mnN8w7+w6BEx/mz9CHvUJq87ks3qf8QrNc
	 frvzB2Z5wpF8bmHszQh52NP1G2oe8Zr/efr0WBnJZjPhvR3oXsxLzoBWEXY3WxrYseBkJ
	 9u57mN0nyCh7GGUfV+HBGFclmeZDZwcNYwTCMBN8Yjgg3RuLRpVoXEW9CAYTYVf5CyBZN
	 BVvjvNFuJWRny+FC0C/gBtvXOaDOroy+zbGKDsbcG9E/C8luU9yujei5MmLVSppmY4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IUSmHvAs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NYJV1nS/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3B4606A322
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C3B4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IUSmHvAs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NYJV1nS/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F3Qi2376527
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Li6ecssWAKTyIqGTgzg996bM
	uxChvYuVzdJanfbIoyg=; b=IUSmHvAsgjbRvDHLbpw4xaj5zBPceQmfN3MLm7ZP
	mnLR1VvyQ2kZWRjklFKANC990rumGPWaIPxhGNHbhtdExLqBDW3WNJ2tsA6umb8o
	1dUshLtrNa/dSh3gUBmI5WQxtzjzGEPeidxX4So+81Yn+p8iQN2s5sgPkz9/F9mf
	9AGoFD9p4bHS0yBRwvq4WtAyIRv35LbK2ukBHwgk8IT1tR56zS4Ssdiez8cJV5rz
	Uo+ctmaH7uzwBS1OXopAZAT3nD8u7lNi57ihjHzvcqUwynpEYKSjsO2tCMKSik7L
	ZKCms9yi4lzAtnLSO10oXjFmINAxk46Nuq/RxmtwUBcWdw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrabgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:00:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e876e33e6cso1226505ad.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738831; x=1793343631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Li6ecssWAKTyIqGTgzg996bMuxChvYuVzdJanfbIoyg=;
        b=NYJV1nS/xhKwj/O96Fsh5VvCEwW2ttOfwNdkFQctxPrLlpEPV6XHFGRUXiyTUEfmHz
         Gks9vQjbevYihc9WoKJKyMTjr1ISkTZOcZhg8pzEVVs97L+P+RgmH047kgQAPG+ejmOP
         rpOXAeL2VqK10+ZFQjXrY97WJ+ZTiDSDKcGLFt7dsNhEf2AkVFLOOhiWVa00IGZZW0Zo
         MN/6+z+k2uk1/md+7/Dy/2fuw82shV32Ux2miiItesRTYNsQXWouj5weHXwatMcMT7yo
         NcHggEpJApEhbAZYPnOBpQ8nd0eR9iDmclg9/s7O4OFVVNgFkc/20UpYClVHGF+yZzBT
         +76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738831; x=1793343631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Li6ecssWAKTyIqGTgzg996bMuxChvYuVzdJanfbIoyg=;
        b=sl4oQbaapf6xjrO7JAC3V1K1nvkLXa37KDinowX3RZOZo+6lNJsy2ubI0eHcbBgfkD
         r192xj7h6woiCbjOcnqVDiMpwBXtKmWzqS7q5sSmvPuyfnWQxd2wjTtdm6E0DuMnWoWY
         6J0s8FRZDtsL2Qywhi10fFwGbQ8gmmABaUI7GW6MCeSss8FJHeFLUmzA2eKs7f+H6V6/
         fYkbSGR1Sedv4eWv5LI/OfHSnii5FWwTf46cAAfTyh/x77e57M/9btqn/uuunM03as+J
         jOPjeuvJOfdFQJNdWctKb4cUiiVSTb+ji+cMbZDm2w9p+kn5zI8jlRkCkvi++aWcKaAU
         XqAg==
X-Forwarded-Encrypted: i=1; AKwUvBwbvJTvRaBATt6EeDoyaOIZ/6zhb9K5m7x7Hu4tNX1YbPqmQTgy04Cn+palNvMha/y9Q/gSoCfDh4u9@vger.kernel.org
X-Gm-Message-State: AFq9FYJVGUd2EFNr+m2BOJ11aVv/ScVcHvpkte3TldTg2rUovWz91n9B
	ccWdrgroC2NV54lBwzi8piQESPsTkfSEQ9bu3ufVdN1h9WbEBv3cS4HqYJQvXWxTg7gE3zspSJ8
	Pdy2V48VJE1wtB5tZ6mqgWG9UxAbomzLszuCKW4RJybP1u9p5TEot5I9NO5YkEBdS8FRNy/IO
X-Gm-Gg: AYBFou1MUSP838kBZ//N2qrZyxuY5Lr7FbVn6B1AxYCXI8P7aRf/7g5DAR7BenJR1H6
	YbCMrSSEaLm0ClPVelRWNO+02FFF3WArX3M9vvECjllxE2VTdWng2IDqRt13So78kwnw/BIy1Y4
	+H0U7REjsWRc0mlcM36fUcaahYITXb0S36l6gfU39md5JWdrEXav22iJYqYvKr0DICgMi1cpwhw
	yg2bTs7rr4b8gcO3IXoh1ZW9x6X7jFgFrwwrPsi8WQALxaTDYUwxDWnGav+rk/OTwHyTkeXuOTT
	nzh9UtnLJp2Vl0QlldDdegTUYYca2rtod5kk8KLn51Sd8f3sPwrk8OVDOcTLVQtVWO6lK3FO3rJ
	pnqmHMSVW0+C3cxNUDbT/26kjVDYNW1YMVwB+QrPYyZj8QUX6+MywLPYXfj2CoXFbrQXHPV4w8B
	vPXAU/qursy4J2yQaZ+71hZMr0ps4g9aZM/p5Ctcf/KM6SSz+QZh8=
X-Received: by 2002:a17:903:32cb:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea7d0c87acmr20794105ad.3.1792738831207;
        Fri, 23 Oct 2026 00:00:31 -0700 (PDT)
X-Received: by 2002:a17:903:32cb:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea7d0c87acmr20793695ad.3.1792738830688;
        Fri, 23 Oct 2026 00:00:30 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3bc54fsm6202865ad.47.2026.10.23.00.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:00:29 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:30:22 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 4/7] arm64: defconfig: Enable RPi touchscreen V2
 regulator and ILI9881C panel
Message-ID: <atsGBkugguCQmOo4@hu-vishsain-blr.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-4-adaea735999f@oss.qualcomm.com>
 <4b05475b-443e-49d0-9bfd-d78388246706@kernel.org>
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
In-Reply-To: <4b05475b-443e-49d0-9bfd-d78388246706@kernel.org>
X-Proofpoint-GUID: PL7FxdIDXddkKmve9EWCml2KVWCgAGkr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXxTqvduBlht09
 8NOG5nTETvX+nWF/JkaE0tFyH65+Ablb4slU97au8SK1JNXE+crpF95kv2o1IxithyoyiZ7RpZV
 INl86obqV/68P6EnMiArpG2A0JpNNdE=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb060f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=nis2Za4te4CX2erPvBIA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX/39xtxFyozeN
 w24YeIa8rxOWrQddc+9pcUZmE7v7iSAlCfnr276ZDYyCrnjrDJIk/QZYputObuJIFosK/U/oe+R
 azZexlmMbPpu145OP5Z3gZVZndpEm/mjVAUpCIXbWTqISQ7qewBxGHbUgkY52fKLXW1xPJU+ZaB
 4Zx/m7PC5aCnxMxgtUcULOr6Aa4CmrpuuFFgnrM7Guzndj4fsYd5tv8P3RqOR6Nm95lDONt4Cuu
 Z93yCfwiJ5ZYd5ee7RnMhyX7pxNMUfjgRPo5y4RgJc85D5pKyi1jbFz2jWaVZYM03usZf0XLcjN
 0e5j0NiwD07yvHg5kYouHXtb+57wiFJYF9pApAa+ndgniESw+9dQtRaP39ZhsEnBrkN/iG/NDi9
 3P3hQk6I5HVarSs18ZMcI2bUiRp3F4oSV/feGCS99Dk7eRzls9DglprdiqHUNksXwYOP4kUkHk/
 +ZVb6T1gTztCtZ0Ww+w==
X-Proofpoint-ORIG-GUID: PL7FxdIDXddkKmve9EWCml2KVWCgAGkr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

On Thu, Oct 22, 2026 at 12:45:50PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 16:21, Vishnu Saini wrote:
> > Enable the regulator driver for the Raspberry Pi touchscreen V2 power
> > and backlight controller, and the Ilitek ILI9881C DSI panel driver, as
> > modules, for the Raspberry Pi 7 inch DSI panel on the 22-pin JDISP1 DSI0
> > connector on Qualcomm Shikra EVK, Talos Lyra EVK boards.
> 
> I don't understand - next commit is saying that it is enabling this for
> "Qualcomm Shikra EVK, Talos Lyra EVK boards."
> 
> so why same work is visible twice?

These defconfig changes are required for the RPi panel, while the ones in the next commit are required for the Waveshare panel.

I kept them separate per panel, but I can combine all the defconfig changes into a single commit if preferred.

> Best regards,
> Krzysztof
