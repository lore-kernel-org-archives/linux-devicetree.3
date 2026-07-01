Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD243E92BD
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 09:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896480; cv=none; b=fnhWQgLHoT9r4qCQkQal+rIKm1DSakli9nrBB3K7HJ6beaAwqmFIRQAp81/Q+iGcGqmCH4NMPy38TwCc3fbr9v/cYbcL6RHp4e6iJIu2XpUOOtnMH+3kZhIek3GI13EJjIJFiuJ4L7EGfnk9tMZJY0K7ddDzGirbYElXsRbJppo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896480; c=relaxed/simple;
	bh=jNUvXUzWVUVxHPQn/XcF+BeGL5jG8XLLXmo5wRcbFoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxpTwrP+Pj8TD4McuJ0y27qcfKfclSgdS30RoGB0p+vs9JV4wFDPLeAQSPIQRUbEGEg+Y5dQ72HaGyW28uYJalnk4e2u7UAvDWAFxPPL0NI+EHYAY+kvprTH60if/TbAqV8Nx3SNK2a+3JSItFstt7sOOxxeOQ6ZOYUi8E4T70c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9Sm65oC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfmuHF2Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9Sm65oC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfmuHF2Q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G93s378956
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 09:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SIo/Kr2b/QKYf+Ssgghdgmh7
	XUPBIGLixRtlJEqDmCk=; b=b9Sm65oCwroboIvhH/FZh6GZSnc1MCE3dxeUjsN8
	M+1GEYYTZWAOJJ5iWfkj6EJ7DgifISUbp8om9ZqwXUVg7vTrxDLlyPAwS/18FoJT
	92Xku97wVa0wGtcKKeUS9v5KSpphhOFXnD5Mn/C0sUuTeJzgS2YotpMS36oXUevN
	kLRM1bizvLuv9E2/l+iCE9oKXhHLsp4K6ZeXYrhcpDm3GFafN6Er2BQvWezO0NCV
	qQgcy+ZKX2BBk9fKLOd+Emzj6TGwA7xrGB9pAje8tmuV66nBgUDce8ILW1s8UtIg
	hKDoSYdFZgQ+ixOBzebQzLkQji/YUzzSk7+pZQGBrDQzJA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd3wj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 09:01:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37ffaca522dso363838a91.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 02:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782896478; x=1783501278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIo/Kr2b/QKYf+Ssgghdgmh7XUPBIGLixRtlJEqDmCk=;
        b=PfmuHF2QuRo4Wl+6Lz9uLOePIF4HUCFG0Rw58Bo9S66hBFYfoygDWA+isnqr081G1N
         MH26iZGgKN/eW7uieByTplqcRTGVT3+Ijg33AIhGqQpUKPBC348QonQI2gZrFkpiCw7G
         qfE/92P4zqQJ2ajW5G4r7qeLYNgl6dJOTWN3COqLzQbqSa1FrSVe9OdEavVMFfO24wMS
         2rKUVQCMWW4fblcAMmw4sOBCl1gVX19ew68ZZPH7P2fq4w9S+fLJSxuCHYvzRIL0/z5/
         VN1ELJk3emG1x1QzygahKp51YKPUSmgqgyFhQhR/pYFp/bvrTZE2xP6fKTgUZ19N0agJ
         bOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782896478; x=1783501278;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIo/Kr2b/QKYf+Ssgghdgmh7XUPBIGLixRtlJEqDmCk=;
        b=FNKflLVdRFmrr8wKCp2uPIsKD9jN8aWlFjyqwsRy+RupQcgjiZdRcqy9Lyso2jjw+i
         9+0MZO3j4ImoBbkSe0i3FdKFyBbU25YrHVMeaX2s8HJh0mF4cagA20OhLVYqH2elNoQU
         WoJ+8h7yzsbM1XbrgLkY3wseoav6X/phhLdJ53zkYi/PlYJm/9C/6EgQpuTQvDVZKD7A
         5UtrOtmobxkxI6UtRfNFKcx7gjm1jXTEJwz/X2hl7j3gdBdPV6m8zLqRT/4IRL+uyYj9
         ycKgbg+fBCE0/F9BWTNcWyb60osajq9oN44tqULSD0XNI6CvzwnPLrRgfiZLlTagWpji
         xjvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdAd9dVTMnJzZBTgu+9SHpqBENDCUCj6rTQT0ecHMb3H7T9K0PQ9TwDWqPirmJIsXpJqjlMqhrWs41@vger.kernel.org
X-Gm-Message-State: AOJu0YzWR8Z4X9/03o1RBHh0Wzy3PdkjdUhd42CCFTqkUfMu9rRB39gx
	iSExCPzBkkTwJ1mXKnHZ07gREQcSQUfrUmPZM71ZspLUAxfr0z/DEb2EShfWlfKnQUIdnbbEdEd
	2zcxhDS3FAwijAKZW8WU9gHXcvp+t33Lr4KLrYRQY4B3QXr1OaLjxKf2wIS/7nrYQ
X-Gm-Gg: AfdE7cmxGx2I48bmPLxUEcQEbq9Os0W1Yz73GEosHeUyVq0beY+jdHvsdrdenTTHQbZ
	alKrk3Psv72RGmSRyS3XGpI22mIa9crjGDLYGS7RA9pq/WdoRA8wGPUE1osWX8mEJjoU+JSS/M8
	4USgUtS+lWpcfBUon6+07EdxPmb018NuzB0wIddGev/FBXfQCT8F5tiu+4cuOJITSTRBcb2G213
	Bb2dN8qSTLkCJozgaQpqZVUc/8zWffoup+HksPHYStKDdnOJn0zzZs6DpBS2VnIl87FBpmBPn3i
	4vhwbitNrlm/uGltuI+ZFGYxrKA72wD2kvECXTS14M/GkYeFHwmpk/Wa3sjV1uI83hklBQoVWhd
	hteRM2VyuEfVsoDDojHdSOaSxw5XQscoTS9y42fq9asfKtg==
X-Received: by 2002:a17:902:f549:b0:2c9:97a7:f544 with SMTP id d9443c01a7336-2ca7e8dc7c2mr9350105ad.42.1782896477642;
        Wed, 01 Jul 2026 02:01:17 -0700 (PDT)
X-Received: by 2002:a17:902:f549:b0:2c9:97a7:f544 with SMTP id d9443c01a7336-2ca7e8dc7c2mr9348205ad.42.1782896475252;
        Wed, 01 Jul 2026 02:01:15 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828c6d2sm29037065ad.39.2026.07.01.02.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:01:14 -0700 (PDT)
Date: Wed, 1 Jul 2026 14:31:08 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V1 0/2] arm64: dts: qcom: lemans-evk: Update SDHC storage
 support via overlays
Message-ID: <akTXVNYamY7hguLo@hu-mchunara-hyd.qualcomm.com>
References: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5MSBTYWx0ZWRfX506Z/EjZwXdZ
 zJgPMJtz7l06/6vq27kExaQA7tgBaoGTeqp1Pnrmx6FV02LrLo5485O5Y84TvKgbpi4tEZKMwOV
 v2UedXeU46S6HOzuNYloxkOp2QqTqSw=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44d75e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Xq9aKHyif9_oXKuhy5kA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 72g2F7ZSubkIL88cImgyqOjRMkvvdp79
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5MSBTYWx0ZWRfX4O3wvgNkWOLO
 4//LdLPxNPmXJHMCJvFrBLiEseMzJjSn1Epvu6hTk1+mQs8Qs8ettVaLSARZh8SJlwexqkfHUYN
 OufEbU8GFTaISAxyu+z2QYnP2LW1gzXSXZk6lWXsSD6z3PLgTMvYrtCKYwHQapEak1vJOa3eP/v
 c4v/QCc469EPSn90jOzvQKyfqVl28n6KM6fD9KHo/WBWmSsLsQlSp0/e+yF+pHy4moMPiq8qmyt
 Fw+t9aL2rYGrLe30llFeCmqAJGKZwDioTWgPoyf8i5TdzzAs2PQOGUKqRLXVCOjxRciPRdlt7VN
 6cnV4HhnTEnpF5Hw5NIyaYM5HWtBwMXcJRA3D2Gv/ZYWMZ6iIevumXTJQurFPTXQHtgbBa5eLMl
 Hx62+Pla08MUjC4tNQM5ubmQrTqQmLiOyiqLOOrtn0j9sqjL1UUxXZKEfgFFyOlVmXPo50atiOh
 eMK1qvcM5t0KTJDe1bw==
X-Proofpoint-GUID: 72g2F7ZSubkIL88cImgyqOjRMkvvdp79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010091

On Fri, Feb 27, 2026 at 03:54:03PM +0530, Monish Chunara wrote:
> This series updates the device tree configuration for the LeMans EVK
> board to support dynamic selection between SD card and eMMC storage.
> 
> The LeMans EVK hardware supports either an SD card or eMMC, but the
> interfaces are mutually exclusive as they share the same controller and
> resources. Previously, SD card support was hardcoded in the main device
> tree, preventing easy switching to eMMC.
> 
> This series refactors the SDHC configuration by:
> 
> 1. Moving the existing SD card configuration into a dedicated overlay.
> 2. Adding a new overlay to support eMMC.
> 3. Updating the common SDHC node in the SoC dtsi to include necessary
> resources (clocks, register ranges) required by the eMMC configuration.
> 
> This allows the bootloader to apply the appropriate overlay based on the
> desired storage medium.
> 
> Monish Chunara (2):
>   arm64: dts: qcom: lemans-evk: Move SD card support to overlay
>   arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay
> 
>  arch/arm64/boot/dts/qcom/Makefile             |  6 ++
>  arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
>  .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 ++++++++
>  arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 -----
>  arch/arm64/boot/dts/qcom/lemans.dtsi          | 10 ++-
>  5 files changed, 102 insertions(+), 19 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
>

Since these changes have been discussed upon separately and reached a
conclusion, requesting for a re-review from maintainers to get these changes
mainlined in linux-next.

Regards,
Monish
