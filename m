Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793400084;
	b=M4GhG6Vh9stzOcNXRDmdnG8Sn86kxOncb34aS5iG/b8Ift/q/RqWqAx1Bgx2z6llGd0P
	 zS23m0x6qtrnJMoXmozaRqsgK9sx1bUxzInuCvcV6vwI3aeIqW43ad7/c6mOMFQkEirdB
	 HTd26fvGyGOq9yiJ74QJ9Ye0myKm5ITWrnmoYh84hjiZFwKDZMjyY9P22zCIuTDy1u3GP
	 OcKIlg7qPo4y/ClYC6Lkf/Dd5k5uT3JHs6h9VKw1tQ24g/A9dAR2Phj1ShplJk2pHVgeP
	 Md0YnfPlRlBfwfQbbPNvKP5mOyXiht0b+ClquE+gYh4ybdsH7Waiqyb8DEJQprFgjrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/M+guSwoUUJbW4+q61V10waj+erZ44ZYQ+J9aHIJa7c=;
	b=REruY70M5btE4ed0Y8zOxkh7TqAcpBPIkVfCK0Towlq2TPCXd305jEPfzdr2rKYlxYEp
	 Vv3fy1k56/XGquodwRR/wpuRtFagtu7k9lUu3qpDRTNMuxIOnHvD7Puzul8eddrIlpfrW
	 vD2rWLnv2SYbMD0P/x5sSM82zCqbqNcgBpIFmXFVZCjvgFHaYHFPPFzsgp+0rWIHpf+zh
	 mveOnU6zxhikjDrO45OUiI+5DlPvNlhjSUpfTCove6+1VYFjUBOpsNwsURyToAUmJBsfQ
	 wHWLI/Lmzde8xOJyGDumV4ya0gJHOQJLYPQKWLK3Ia+WDgpqb8mBEGSRCMah1P+lXtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLFfrCNj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jooJld9j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97C5606A321
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 22:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D97C5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLFfrCNj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jooJld9j
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtL2F4185873
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 22:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/M+guSwoUUJbW4+q61V10waj+erZ44ZYQ+J9aHIJa7c=; b=TLFfrCNjrTTxgqnn
	jxpH7DzAWxcamJvHJR3iQMrEe+bf22GGqFX+jDICN8vl0GxobHdgU78l0HJi8K/2
	UVw6x0zkbgmPoo/RjckWL77qFrlxvCzxDHB1AsA0ScbjMw6IyaVCwiNwB4r4Thqg
	wc3x3HMst9G98KvAC8+rTCK/P+iWoquOVRybUlbNH/1/lwOkb7aBH72QTbSa/B8h
	w/bGHbpMpC5hlSksroN+cR25Seh/7kmeh5xOZSuQ4+tlhmjMF1p5h7abAxOlyRtY
	08Vdx0U6ha9eL1s/k2dwU6m+8/0z3cxytsfQxlk4eviPJH7gQfc4E0LqwvlcksAY
	1jjjOA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x109v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 22:41:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36998507c13so1825276eec.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 15:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793400082; x=1794004882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/M+guSwoUUJbW4+q61V10waj+erZ44ZYQ+J9aHIJa7c=;
        b=jooJld9jQVlLB8yPP6gkXlrboPYRZ1VS2QaTAddzd0mwJ5ik+7BRmp+p27TuriU37N
         2SudshpBooT94CeQt0wEfpKA/p8iwtiQ9oM0KWvKVi3I9y5Xwp+cNMnqDNiqGkVFoIXU
         LGNeLvVkowIwT3yT4OaUuX/MlV9TXlcEsHOMKF2fh4ozSc7sFqSUXRgqASBzG19pVwMi
         Kl+n7t7vF+L84X4v5x+speCZzX7yWe2zdq0bP6+2NZ0dKCCtIopsQ4NVEI5I/92dqnjw
         s/CtrbHeBEHyOWsUnFE7QZ7+wR7ApPXX+aL733UM4pD8xXBoSOxHRN5JAf8miIaGTRcS
         UAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793400082; x=1794004882;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/M+guSwoUUJbW4+q61V10waj+erZ44ZYQ+J9aHIJa7c=;
        b=zt/CPr6zJsyz3/pYBLDm7jtQd2x/JqclgWCxDnSmwPcGoTC8KhfjfSwgkW+v7SLBsi
         qSweZV28BiCtJlMGQeLJ51F/wnBYHQP8i/2Xk2UH0dkHC61LUvVr7UkvZjTlUkTc8z3P
         Qgs5P/rshfVRlB9I5BfEtsDzzP4XJJHDv/kzd07vPxHbjpfSZIDS4Hly5Wm+FkEdtcOE
         Ls2mX4AAFmC6Q5TeJzmBI2kBR4+TS3slpxOYyi24TnvAXiqX1nmhLwoE8TgNOzT8QmW5
         fg+5uYtexzcyraQSOB+HteNkmSrLa5BzvQGA3hAGngcqlFhAf3lR524h2s4uB/6b/skz
         apXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNBhZ2IeZYjwVslbfISul8X+4YB9D3GMdEhyeWYO8HOZhqIc/dHmDwRkh24zracf9zuy6ePAn6guI9@vger.kernel.org
X-Gm-Message-State: AFq9FYIMAs9Gz+Sa5O2kj/33vc7uKwD+y4PLZwzYK8DS7NL7KrjiB1Fr
	/0YwCAb5l604OKiV9oBYxVEebXHAiev53Vv5kzlbcJxFsbAu4eEKKMoQ/ETsXj2i+hNqFiAf81e
	4IYJZmkyLJ/aNol9IWHuxEnVm56M4F8EMFUd7PHO7cdXSS2jsOyo9yHne+I/PB4F4
X-Gm-Gg: AYBFou26RIlrGer4JSReJ2YJrw+eT9bwF4oDv2yRq0pskYZNOLaJvjnl++68Irb7cOs
	jh0A8H35PCKGzXS9T7JuO+mmqujKLwSU62bz39Xv7JY2JfTPcmDnAwhvnsUW+LokoXM4nxRWI/A
	RtWcqLrXO9TZ1yc/KYBfK0Uqbg/UrqTb7GcemsvYSW33VzsKUYaBCpUXdySLUzg/HTD4LdkBYTK
	rLLtf7k09YlZsKblVtisVGIkHlBen18FGZIzv2yaWyjhJgriTIiO8UNA/x+jBkA4SJffUFnG0g8
	vhui3vLxJyNlrgEcsKr/RAJQBreXyD8xtBE+PcVNHNAfjTPIwRQtPIHvOIUnQ72zjVH0vD+53jb
	O9CxVV6AGFv2176DxUB1DYo/7Sv/Cw3s3lw9jZMYPSgeJRIXKD46bfTwdySZJoLyOmMg3GwXov0
	uxjZbRvkHTnNxvBcOox3/h2oE/LCY=
X-Received: by 2002:a05:7300:ce86:b0:35e:a225:3ba6 with SMTP id 5a478bee46e88-36a424011eamr4570389eec.13.1793400081637;
        Fri, 30 Oct 2026 15:41:21 -0700 (PDT)
X-Received: by 2002:a05:7300:ce86:b0:35e:a225:3ba6 with SMTP id 5a478bee46e88-36a424011eamr4570352eec.13.1793400080933;
        Fri, 30 Oct 2026 15:41:20 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm14002245eec.16.2026.10.30.15.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:41:20 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Andrew LaMarche <andrewjlamarche@gmail.com>,
        linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
In-Reply-To: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
References: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
Subject: Re: [PATCH v2] dt-bindings: wireless: ath12k: allow calibration
 variant for WCN7850
Message-Id: <179340007978.1790611.11188538641227151930.b4-ty@b4>
Date: Fri, 30 Oct 2026 15:41:19 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: D1Fs3LY6AIHbgMOlkT26gSqnZXzgOZvh
X-Proofpoint-ORIG-GUID: D1Fs3LY6AIHbgMOlkT26gSqnZXzgOZvh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfX6Ggar6IAXd+S
 L/D0CCy/CZkHZOUVLJrRg3nJYw1oNVzPQ06i/iuwwtK44OuYH6d2NwkmmbN4eK/tj/YogvmPSTz
 EUjBdsa3OoIWamudPXhOgyf9gFtOiS4=
X-Authority-Analysis: v=2.4 cv=abD0Dhot c=1 sm=1 tr=0 ts=6ae51d12 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gIeeTYuhQ723c2I_zY0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfX8LlVEv7Os/fJ
 2dFWhlgNOlRQHWqFB2BZkPlqXVorXZsd41h0pYa/V//3Bpr+vGuWfhT4xF50UlTryzDxbhZEzzO
 32DDi7YP/lwVxYxVitTF/l6AeADDSu6wBtRQ5bqRxTDSymJI/IN49MIsbPHqZq3IjTwbIpN9oq1
 OT6GvGoUenUV7O42OYIH1iFidqjNuLSgbHJwwjvgesGk8GbLjjIS299+gUPCuoRLdAp7/Cufaov
 5BrY4DqM0HD97r8XRUc9bKoXmvHXA/TY5pHRgukV7470L3w9i2lEhLr9etN738YmBG8EXbNTgpy
 5R4MrkiBtU86mp0e3L1uLRZXBmmEUD0LBTbNHdZn/dNGlsMAx0UnRqcplD5aoALg9cGb7TYXYdu
 JZjPvtssA2dXxOFAlKdpXMzilG0bSqCBc8mnHlpQJfvBEbvhxyRTjIc/zecvUK+M6UrMd9B/8El
 xZsO2GlYhrJJxa27Qpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610300090


On Mon, 07 Sep 2026 16:17:20 +0200, Ernest Van Hoecke wrote:
> qcom,calibration-variant is the generic Qualcomm Wi-Fi DT property for
> selecting board-specific calibration data when the device identity alone
> is ambiguous.
> 
> Commit 06cca100ad08 ("wifi: ath12k: support calibration-variant from
> device tree") implemented support for this property in the ath12k
> driver.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: wireless: ath12k: allow calibration variant for WCN7850
      commit: 75bc725cd92b2b4dfa76850ce5983aacb52d894c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

