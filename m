Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519D73B05AC
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384044; cv=none; b=U2VZ5hDqtO/4WB74T9uJ+nd9fZDidYE6dAPARd37ADQHlT2uuco7km96YTE7WQ0+T8/xYhIVaU55lExN7+RkFk9fO6NA10co6ZvGMr/TKPQtEcAz3N1lzjA7tpspTtSY0wH+erwTViAO7MoQzO/a9EmQclh6VKNuDMotqorJ/uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384044; c=relaxed/simple;
	bh=xYsLDYHzX3vjcXE15qP88OPePOGOo8XHzB7bDzWf8KI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7Smij6dtpdAbM5ZvP62y7lrlOnu7l6lhemdmim9O67uqTg+E67IFEBg8d+r5hhGUDm18Imt68MyZ9IJWyCMiTjFjcCvFy9g67+hogftBRdVlEK0fF/s+s4Iuoj3PVRGMzd5lQRyDfZ4BRgP8yz4mgpAPDhe8ZnwwECLehhk9Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byBNS3s5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBN7k0WH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byBNS3s5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBN7k0WH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmMdu4032520
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVmNbZXZqwHQu9GXVO2u+sF0wdZLciwJFvqeKGxeNv8=; b=byBNS3s5SujcMjbb
	HUssKUkGExzh/rGvdqT75AHs2YHG5ClgioucHDKX1dX8Qja+bVAAeBc8Uln3x3WY
	enlOMwBzBRtEKQDWgu/mjjsshNlWGGhHui6MMODyJ4ucIwUbsYuLQ/DHVqsqzlr6
	zRs1hqZv562dAjdwIdsYpMVSJpH6ZI0+wraPjbRNlWdsDwDMR8aJ/Be1cPLqU25E
	gcny96dfgm0Pb7SaiqVT3OUJrFDX0Qn6BBM8lnVD70pWsT3MewNWxvRLwNvTAcwo
	ri0jNWgZ4m3gYJoZO9tfnTXzHtpgtYCLa6gcWM7dk5zLxZ/d6lKjiRRYtJXj/euL
	H/mFjg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq88n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:07:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9106d577ac5so7474746d6.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384042; x=1789988842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVmNbZXZqwHQu9GXVO2u+sF0wdZLciwJFvqeKGxeNv8=;
        b=MBN7k0WH/Bz3yK7WKOOF7Xp7D05q6nklgsxdt8MNUXXeLBur6bRpTs8+Q4BLM0YEit
         0g9W5rhS0qdvlWBI55TyBnoW/LHeIV0cXkaEdhAiSkcj5LlOOMS6iiAP6QMvfX4f8kQR
         A6z+Y2Peiof2PFhNanLpVXKqrg+VpQq+SLBAbhnRYsiiWXtUHx6UgNV11xbCW8FM1xYP
         t/DqnQY0bWZmNYhUHEmJ4ELchjSRFRisfbFW4OUXj952Q3VgHiPR1iGr9Q0xvkXlSbZe
         ynEGJZafpi0j88w/gd1NeRNGOIua3QX9HMlUXC24vwqVwAkMSjTAWDcaiB8zFy7kDX7J
         KhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384042; x=1789988842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVmNbZXZqwHQu9GXVO2u+sF0wdZLciwJFvqeKGxeNv8=;
        b=pkWh8rTYv+eoGfyrtjIx6nB65N+kV8tr9V7MoIDGWiahR1mZN/49XHXQRHRJaHnJYt
         cUpArKJzoSFFeQOuKG4Ciu0LJC9RV3U90A5Z8VFWXFT/D+muN9EWlsrAuIvBYHVtOr/A
         hAwpVUm/UTDRCgkAzBdtHwhF+Z8HbIspqr6nn1nozaOjI3z+Qwn3lY3K3RbUc/NAU/Ve
         pR7BxfyTbpkuw2MTGjiRdTqB8eL8YXipTPK7+PqoupOMAeSaCbVNkkZDxVGQjH5rswMC
         JSaqqRF83RcuXAJ+16L6w7nFDEx9kHCzDA/UnUqqPi/6Rdin1b/YQbWrCFX5OfbyTElo
         IqMA==
X-Forwarded-Encrypted: i=1; AKwUvBxJnvAtT32MQL5rX6jX23F1tFNMA8y+FnXSxj8iSnhYpV3K4lclRuZ3gjfVawI5c20NkZntvyBiP9hP@vger.kernel.org
X-Gm-Message-State: AFuF++m1/Ms8yCCPfP574AsSF1x/ZTHBDT9nGibU5GCeDLPGp1HUzrhI
	1Ig3+aGcxRIUSuA5S8XNxUxLjmBbR6Cb9NYIPCYw0XwbC+mk4MoKg8I1DA6dM+a6PUZCd31ZTl/
	lq2mAe6h50IwunfksKnHqIMXTCbl4H/N28FHPslFSIZ4HBa7mcb9DWFm8sEMLSGxr
X-Gm-Gg: AYBFou2Oa6qExkufBMoDi4mRMuuKMjE0n2ce++fNXLXoBMTFBI3NO2mgi38SUCnuJD9
	sXLWPW7wITDnmDIN+WVJjGghMr3sYsq+akWDAuywbB1ZrOCY2FArlJu6TvBLGGsqF18+O+6HsVM
	g8CahGmpjTcnCL6PrToqy5tR3aCY/Y7lVpPVDm05Atdd1iSaUFelC2ys8rTODN1DBnYh4mvkSx2
	r3Bk4J+v4afCclIinu3hNyEnE5MNfe1gVxfYRlAy+MoGP108yU6jZMQ+bD85jelR9RygTDHyiR/
	iA5QHd4Al3xtW/jBaICy/05B18E8pqi2k0/ERtRtcAjMFKLJW73IYnnQ2mdf6DUlRXg2Q1fAe1i
	ax/dBcTD320hk1JPvzx7o5A==
X-Received: by 2002:a05:6214:1249:b0:912:311:12b6 with SMTP id 6a1803df08f44-9122e65e041mr27730976d6.3.1789384041541;
        Mon, 14 Sep 2026 04:07:21 -0700 (PDT)
X-Received: by 2002:a05:6214:1249:b0:912:311:12b6 with SMTP id 6a1803df08f44-9122e65e041mr27730436d6.3.1789384041075;
        Mon, 14 Sep 2026 04:07:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594e462sm4164264a12.24.2026.09.14.04.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:07:19 -0700 (PDT)
Message-ID: <b550d226-e7ed-467a-8af9-a45bde169ecb@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:07:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: purwa-iot-evk: use on-board
 crystal for PS8830 retimers
To: Xin Liu <xin.liu@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        guodong.xu@oss.qualcomm.com
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX3mtg0MjcwPEW
 MJo7f624+ge/5aG2B+3RbRASdXoUvfqZfj52061sSCy0Sp2wrQVwtUwZcKcJ1b4gkMpZ8vwZkZs
 tG6CDLdKqSQ7Ig9ZmatvdaVP3+tAjfc56JE/yVpuJuBSKlPl2RPtkRrsvlpwwdjTtPOWcAzg6I0
 09fV+Ty4frJk4SLYtR9ippZYoGQ7IceiTLr1Cp3027ngcrj7Da15eTQAVGHFdFH46mf80lZDu3Q
 1k1PMvQNlIHyP40iP9nWZDr8RaO3h6fuG5p66cnU3x4/dx5GTwNPeXEuuJtu7gxuVntRcBCpTST
 bsvNVAkkCcY0iPgBflVWR996LJjNx+3+ndUpiCkGXH+uT/Q15Dcg2lany3OJMjgnyayG0xLNJxI
 Gr5/2nOtd8VoDs/GPp3FXB0SFFpAv1IdaYkP7knG5NbnysB+VbRLyE0j455txfTGB+O7Bl6XMy+
 xJ1BhPTB7tqlDxfnZMg==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7d56a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=D9jnvxXfBeoGJ7MCLz4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 4Nny4tn9TcSqFvOFtIWu0E1YnU6Pg3K5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfXzXYQcgFc139L
 XXrq+B7LoGuRGFbcuLOh8rLdQQ4vg7tdgODF8vnkocNfa5h6rGGmNjEEYIpGJJdRdItCQGql3Qi
 vfXzm+uSedAF1PmNjBCKBryXIZUpd28=
X-Proofpoint-GUID: 4Nny4tn9TcSqFvOFtIWu0E1YnU6Pg3K5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140157

On 9/14/26 12:12 PM, Xin Liu wrote:
> On the Purwa IoT EVK, each PS8830 retimer has its own 25 MHz crystal
> wired to the retimer's XI/XO pins. The reference clock does not come
> from the PMIC, so the RPMH_RF_CLK4/5 references in the retimer nodes
> are wrong: they keep those RF clocks enabled for nothing and describe a
> connection that does not exist on the board.
> 
> Remove the stale "Left unused" annotation from the vreg_rtmr0 regulators
> as the retimer is actively used.
> 
> Fixes: 9ed20e877239 ("arm64: dts: qcom: Add base PURWA-IOT-EVK board")
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
