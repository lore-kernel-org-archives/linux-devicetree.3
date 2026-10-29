Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263651;
	b=qyIOK0Y4lQfC7qVY3UA0GrBmThg2Kbm3YfqLlbmVOslugnwe4XTDZLdnhkFzQNHYkRqL
	 Qz3SZxRwybWGMUiv3oXfCGp19lU2A3ewDWMdFmrYQ6eG+aV1Ic8pxJTy3gVw73vO4QuMd
	 cMy2nIcNu3jSd/0lAADhCUStR0PCiJetI+ngXx8WicOX6SXqMTGzlFSg/7ceJDtSRD3HH
	 HnWu5jJVRA+5oAQb6vqcqOLanT0wshfl/22ouc4gl2Cnkjbcz6OcNyICBbup6AJk8vMaO
	 1Kp0urgSeAsrzwoGbd4/gUKvTZRBvHjGOhqcvBPZtcgGxZLF46l3S5z7D3MS1tagN3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D76HTO9lfNBVTEQWZLuujhsipMwGBK+YZR6CO3J/B+k=;
	b=x3EfO4+gmFOhAjedb+SOuClnmFMxC2oGpQbl4TPXdiyHWa9Ibz8s7atWsrcfmJuCOYMb
	 GDSGFaZhzGp60i+O4b3QLZj6jauc8+pA0j90Yota7WJmBngwbzgFrI1dnuKysc8anirOx
	 DD5vYOyz/Cq/oeGsY2Zhzv4JPuBHs5r2stc9rwz1EodNe21xtJ82V9cU9cxf1PVBTH+08
	 2ASKzZ/CzXO1ssWTZoCRN4jHnBHUGQR/CaBfvL4f0/SWohzyUcbsus1aNJVCjwrzMPgzm
	 cx5JJOK6oSlntGthcZamtTQ76j9K18LWokirERTyaVg021/5SStloHkXM2b3taN4lAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPcqZhJT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DU8VKrtK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBD7606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EBD7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPcqZhJT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DU8VKrtK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HsAN2429755
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D76HTO9lfNBVTEQWZLuujhsipMwGBK+YZR6CO3J/B+k=; b=CPcqZhJT2wwmPp0O
	gvuEwkBP0PFNw8EYWeesy203Iy+BXKkxUBVpqIfS1ANsAcAjqsor8CrpTve9dOGp
	NLKnct3f3ma5i6K5BPfdT8isxE4kVvjvS1fE2WprBRcTvXI/zYhtU1eGq5gCJ37F
	VH4k/n/dRfhcXtS+ke+S7k52aJhGQwVCuGw5No40ihIke0GS3ytF2+fS4VAsRwI1
	tXcrBgu9tlowR36RkyTkG/qMRI//cfMnpUejm70Fq1A9U5U5NyhcDOkb/MUm/TzY
	4rNQO1u/f+u8jN8aC3mbn0iGxGHP+yZqFBfETEpE0cia0T3Ls7EAwjSWXRkOC1Fb
	Tges2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2b476-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:47:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530cd3dff25so4059301cf.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793263649; x=1793868449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D76HTO9lfNBVTEQWZLuujhsipMwGBK+YZR6CO3J/B+k=;
        b=DU8VKrtKKYdUSwlhPozH2skTy3uAZvPuQ+W1V4ThT9o2TEHSNYgTIHM1jzlcvE6O1n
         xPpYNoo+ghjUjic7OFXxLFFh2juk7qjNmUB7OJuP+9Eoa2+DjTvgLHVY/5HVDkxxOnNa
         au16Qbrfd8S5+rnbn2BvsGyX/xNeUVVQzCDMXknUjaLgaSovPXWH++SMm8BLEumIEh/0
         yssgqDYg+3TOhVMQIvF1h7fOMU+ceEWPV1Of/Ip0LeaQOyKZZ/hcEiGK6ntawi6wnllB
         frdlE7RTB/QAnwo496L7X6j/7920dDRGWkWBw7Ae0GxjXzBLOae3P92HOXwLnNVxJX6b
         NL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263649; x=1793868449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D76HTO9lfNBVTEQWZLuujhsipMwGBK+YZR6CO3J/B+k=;
        b=SM2MK2/zuJVhGZfevOOVwNjQc2H7SfnFpoampakbIFHgYeyPf8OtHysQQJrFjnitI2
         0OzXBeHFV6ReH34yqW7tRYfmcXCXt5FwzocDQR93zAdH5mtuQHv/CU9fTrUKu1d4n2pk
         TUYtzefK+0qmpjQzLDTT+8eyvO8EQMLw4XtJ3EQkZ+jSRFbG0CSICoKYru1lua5wDtzg
         rw54KkMGc8W16yKwCuXjrXy9Ug9gNmK4zTlJ6sMdn00WhmgXytGTEnGn7qpA5zWZoS2R
         JcJXHjvIM2TQxhdMksu44O8DIILql7y7GBDTVBqgmLDcLDjy5eiIzxB8w+N44EFm0TlO
         o43Q==
X-Forwarded-Encrypted: i=1; AKwUvBx2CD3HGfHv88ptiW5WWz2hPqHGZODgkG9NP29djp6abLkfxfh8K2s5yXWAXPL6E05pNlgmNP0Y2S+5@vger.kernel.org
X-Gm-Message-State: AFq9FYIsnw29TC1XTsUSUR68fvT8SxDDpyCTEk69+oA1Bf21BDBronE6
	06MnufsSQMTeYmuANJvcCAO1p3Zohg075S6UeK7DhnuVMJnrTIcFdyiUlEgDosK9eYKN531oA1H
	7XoC/mWuzFYsZ1ZFMpBQkgT9gD2SJbjfdpObc102a1/seXbydP82f4QXH5UfA7r7e
X-Gm-Gg: AYBFou35uNC26kF6iCgLtidbLI4dwthTed6vU4jFwemW2i35KcVPnwXZII0+mcDp8/e
	JE1Jp+wKDt3FaQfT72x2zvpiVCX44KgMHX4MjYQjJ/wKb1u3UaePQSLqXZXgF5ecBPCs3HMSzup
	u1rRk4aM54nFf2dvIaCJbpDE1z+8RG8OttQ7b/yhH8r9Dz9zfT/bQELAv3d3HbsLWLzdOyfPyU/
	tB0nQ9HphB7K4O/QlIWEUqSVt36HBke3c2ICkmpOMGBxmthQClWlsZJ/o5EXt1UtDAz2Z6Z89Yz
	7583WjR9y7AQEHRsJQsfhA3QPBXcnPirui/B/ci3Y0HIJV6SHzCSdaONiDzocN4H2i4u2NubFgC
	fqU7Br0OZHi3id2B4tMHNqZhHHyYAOUdp2EXAh9OpEZHugpfAeDvxCVgl/IfKkzNcS7Zo4KM=
X-Received: by 2002:a05:622a:7a8c:b0:536:662:3776 with SMTP id d75a77b69052e-53fcc0d944emr91974241cf.3.1793263648904;
        Thu, 29 Oct 2026 01:47:28 -0700 (PDT)
X-Received: by 2002:a05:622a:7a8c:b0:536:662:3776 with SMTP id d75a77b69052e-53fcc0d944emr91973901cf.3.1793263648171;
        Thu, 29 Oct 2026 01:47:28 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496459f10sm2495969a12.36.2026.10.29.01.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:47:26 -0700 (PDT)
Message-ID: <6eeacfab-95a0-4352-9c89-51a374408091@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:47:23 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO
 polarity
To: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
References: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae30821 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=A8FiRQsTqyrrzY21g8QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: jPhBCZMoDdZEAQ3ZFK3isIdJQA8wV7QK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX/CWxU21UlaiY
 nk6uxhv0E7rMB5JFBi+bE5dzlRbN1z+jplA0TlVxkJULtCMxwtmNDk5Nec8nVP9TiLSo6+81acr
 C7ABqULUwYVN2uMx/Q8+hguE+fDS8So=
X-Proofpoint-GUID: jPhBCZMoDdZEAQ3ZFK3isIdJQA8wV7QK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX+2EJxL923p41
 /eRWW++3Dgcg8OESyWAAjbqXwjNUcSeJK1UcjER+weZ1yOvT5sAkL6F7B44NncLJTISUlckain9
 h09nYD9FG638rxyQ6jH3nk1/fQAsIDj0m7Vg61lhjV4THcnn+H9V92QwouWps/wmhSY1E1oBg4Q
 D+qm1GZ9J2t6HEQT0lhgOWHaZlL5i0yZ/GNw0ROohWIZ/lb407aJCjKA0yS/Jy2jQMtwHN02NxZ
 nk38EsjfsfQUKZMp3ZQKQUH2sAEEoF1+7Me0CFfNAa0AWu8PIZPfq/GM+sdk9YdCu7OdiJSwJ4o
 BVOt2a0u/PSXnTEp83X3kUni+xTPquY30gkxTf/w0ooonxRH9eN+AjpVaMvKd8vDdVeOwbKaViK
 a/5uKn2Jeai1uu7VnwWXadn3vw5M0jeFdOHzy4SQ/xlirZVrAgUNLiS07kctdtcWoluDtSukCMC
 Ka0a59J1WrFrawYBDSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290033

On 10/29/26 9:42 AM, Zhiyuan Sheng wrote:
> The W_DISABLE2# signal of the M.2 E key connector is active-low as
> defined in the PCI Express M.2 Specification. Fix the w-disable2-gpios
> polarity by using GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH.
> 
> Signed-off-by: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
> ---

Fixes: 073c6a891eb3 ("arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector")

Konrad

