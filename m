Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DB73F54A7
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371414; cv=none; b=gng1l6TkIMaLeELaSQQe1yCS9YAbdQ9MhWLxhiM2wXLzEHuvKrqyVVfSMsDyyarKJHNgrMcii312XmwwiZph2DkBeA1dWWTDrgLJAqWOf1e+e6U6kpypx4DpjkM490oGvks5QOJuv28U0Rcc/YmTf6Kgt8neTFReLwr9MzFkbM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371414; c=relaxed/simple;
	bh=aSsL7rH+5SD4ws07ph4c6ndDoV5PwOr9X6Do/Fjxf8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hndn/wyebz6RRVhR97TFISuNdUlbyP5xHkTu8Btx22rV3YsqPbW+6QczfSWsQCJd3hACxQRoQ38jJ1G4dBtxybG07UX81k19gORl3BURWYHyc8dk9GXwxhRXoXV/ewpQzl9UaUJa+UKBD3Ni8w0D1thq99uHpKy4Gu3X1Q+xQrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyaQNs4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LH1RzwLn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyaQNs4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LH1RzwLn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5imZI4057530
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fr1yzaJs+rjZLZHda9IeRhrD
	ixH5hc7r7hGKmk257AI=; b=hyaQNs4+KTzwP5CIMJJlRtLzjQmC1VvZ8uNPGjMG
	D0RckwXCbSfglMXCRPU/oFXInBoYlsVbuhGDoYlSKix0phOAgUDC4HbopvV6fCq5
	t8MVEc17yrdEUXRAYCjQ0z5SqHJY3dKhBGIDxdwnoB29M2TgxdkrMnzVVnahoANp
	jsBaj3oKAQR3Ou3rk072daU9Iy02JpVzexLJ89O4FdGIOe0l/9089OA6kc4yBC1k
	Yfj5hZO7ujoRyF4iq6LkJUKmWO8vOSp59rY7Z4avnjKm7qQEZvYuL0agFUCa2VL7
	tYr2phRlUDtZ86RjRAaBlD27drJoklHDlDTiD40VuOUSmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsscac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:36:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936e393061dso476087985a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371409; x=1789976209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fr1yzaJs+rjZLZHda9IeRhrDixH5hc7r7hGKmk257AI=;
        b=LH1RzwLneUITQbplNbX3S+IkRx/HsPGzdqhewoR6PZbYBf+vX85dhe53nlr0+5TUGn
         3QBIZSJ6Xuojd5jdXMVy7pC7PYzik+aWHJwEdhyAtW1dSOLgWgUKwYm410525lJN2tjR
         BBHW8LHwcu+wON80NiDW/862JjFE3OgK8cEGhtTNuF7c4fnDQf9S/RNjBkaVp41t0P/+
         q+hEphEtYQuy89X+0ElqAo8gtcFmuMcpkl9w4m9khqu+ICKUcnMO+MPL4zmc42PZHg8G
         5IglObnIpj7/tcqCsJ2gedKlqf/+g+GOvEWDAOoByKIKrpFOQAdwAvIK0WSdJc+qdRgQ
         V7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371409; x=1789976209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr1yzaJs+rjZLZHda9IeRhrDixH5hc7r7hGKmk257AI=;
        b=YY56NjiaawDrer69erE3dMC/KQmlkQfnxhiJA5FPFNZHc3rGPfVQAGhvfZcjSj8wpk
         bpm3Pc6ip+h6bNKGYnQ+wGjzUwzYrZjBm/rP6xcogyU9l/NtSM+bAaMrD2E1B+1NP6fX
         vWBsMGRiN8rLyh9Ar79pbYqKPcgdAdSr67tyv6g6U1YY+Mb0Fsrt6VAaCE+W/ti4OpkE
         wcq7FztoW4t82jnNfDJGz0lJ161Wa44bz3wUvdJXXrj4BRMuUyXSjxU3vqADt+b1zg7U
         KNi15I+ZGTFTIoBRE0OMu44qryX/VnPp09PE8d19cCp50zEPhEcpZ/TSWjC5+lqVFEGb
         BLRg==
X-Forwarded-Encrypted: i=1; AKwUvBzTrnbs81VK8KoXDhNVRLYBMBvYPKABLygGwDAAWB4KmRhNgNpSCCdN2LFQ++5yjtjcJmuP+ky+XjUh@vger.kernel.org
X-Gm-Message-State: AFuF++kkMJePKkbE4Msl24vYrf+YKb0IVSknFEbRb4B7dmyTEpr3IJ6b
	6wuJRkNLjw1306lW/5leCivJ7X2NH2vy8xJ93xi2urESp8yAQWzCLB0kGI3d3NFkGtakoMD7SvK
	UeL+/Riy9doCIbcCXJTN/pWtdZF1HIhSiRlRQiZzZhX3eZ2XPZz/jbCc+dddSHpXvVyWkaMxX
X-Gm-Gg: AYBFou3bcc3u7i0w+V/74Iqmzb9zL+PxpiAEhYTmukZJ0eBStTJBW1esburqYrpfRg4
	4CdKrglOiXBotAjm40lB1H98QpZRs0aairY54MVL4/n2J5/Jxunh9okrbiJ24M99GnoCKMyYnu6
	+v689Iuks2ck3pejhIqAI7zlyHtcfyvYAyuCJNv+YTTDrY2XdavD3WWKcVyVS1baoCqnoJa4V5n
	6iWJHd83GXLCW3UBav5lLFHXd63E1J32YtgBoX6Gzt2XpV4POdNTbtw1m1RTwFRfesMlpWJfT7+
	U7gAWCmhWMxJ6h+2v4i6hswQHToTk2MW4J/RLEROMp5/q8WWlXUt/4bXMq4ck2otnbcPU9isAWB
	jqowH+RRyM7wHUg==
X-Received: by 2002:a05:620a:8805:b0:939:6dea:374b with SMTP id af79cd13be357-93a29bf8ec3mr182575785a.47.1789371409208;
        Mon, 14 Sep 2026 00:36:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8805:b0:939:6dea:374b with SMTP id af79cd13be357-93a29bf8ec3mr182573285a.47.1789371408699;
        Mon, 14 Sep 2026 00:36:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a803c5sm186263595e9.1.2026.09.14.00.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:36:47 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:36:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 06/31] arm64: dts: qcom: sdm845: Add domain idle state
 names
Message-ID: <xckqlfn2kld23qsslwypherdgznlyf5xmsuojv3oh3djymllpw@v5cryhdebc7w>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX1eiYyd3Csu+2
 o9Dv6NMQ1F3wMRyk+aKhvMLz2qPaFCGaJWkeVHvHdkvrZWblKD5Mem1qzUD9k2JRFCqilG15Off
 Kv4DqyZ1d6yhZcxy2SAavz3DPUnOFhVVl71yX89BHwJEJPcfiTLl2iIlCDYVbbjBbhGb11RAqBi
 asa55/q+tm1aecSmVLR3BKiBQKqVd5+KmN32sB7vukHxg6YWddXTtti0uAqa5QCTTr6073EtnHC
 QykU7piQpWp+FD3b4FsRyz5JPyVeWrE1V/qhQr4GVWsjZfY0nCzeK50P/Ve2wqeqDAyl9Jx7pxo
 4chPCRu3FTyGRDog49M/IIipgezAWFGHo4JsedE7HS6UtrOeOmyPeOdzvMkirE261fJj/jajsW5
 GrqMbx4DzhaavyY+rl+Bysl7m8xEXqaylGwp7v7pdOIo0kTCJwQE0FtbYcRTSjSDc/1/4XCKN+J
 lPW7RMO4jBMvQFBAtQw==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7a411 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: SQil0RR6uWNuBbR3K45hr6LtG1R_8UB-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX8wrLGax2jFgk
 3Ft1iWm09c+oTkY7yNIewFviNqmz2Fo6j+lfg93OZ/0A3hXbbzvfrp5pPuepCgCXR6KIkpGCESN
 U/WA6Ld02fxcfAnEHp4yZry5c/csPaA=
X-Proofpoint-ORIG-GUID: SQil0RR6uWNuBbR3K45hr6LtG1R_8UB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:38, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
