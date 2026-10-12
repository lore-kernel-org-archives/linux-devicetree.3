Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED2D49B5C1
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818675; cv=none; b=sIdl5dtFXU3vrS+ggP/8/5m3jNfHRkaMv/QJFyqzLnKoZ0aM05RhhkG32V+Y8Es/9ah1Zr1YwtASPzrr4u4RSSC1Jqf0IdspuZ4V3JzROGG3YWl4/1Srl84pH4/q7IvaLhYH6UZijGJ+gNf4BjiWW6Fjx4VkSHdZd46XkcHa2ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818675; c=relaxed/simple;
	bh=NII8/DvpqZvskuTyC2R0uY1SUxGgGLheGvOiAEFExD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RKDo3gSQ5cGA2WbzluF0ptZRlX3EbfmY5Kv5vxzK6NnNUWWEZoRgM+TwRuyJ3KI5DAmChBj+O4YM+b0Ve8ng8Nn2tAR3w5+dnIB7hWVWpBqQRzLrOgSWBbWHi56z0PsDWeLpTjfR7WeB1AK5dzZXdEgExZ6aHbVCmUvQ+oDyFSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFc8vo5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUtMYj9J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFc8vo5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUtMYj9J"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC07wT1686158
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=; b=PFc8vo5kxN16SUEr
	++sEWJXikqTUqeYqg+psoHnAvFRP5OBO5TrI6oC5Ev4B/IuZc1nLKRn52FIlp5Tm
	33Y9dqoPqHXP6TgOtsjuvZFD1LoLyTptcrCSOtl7iXElvdS+0264FZ1ndttSV6n8
	hPxoZpjLYau3M3NekYrVCBJIH/SY37plFgjVMHOQHGk/NnWF+9KfXigMTLUR6iRr
	E53GnQftYpe8EqH0cVJ1Yh8VXq6xffX9o7fDTjcUA2XbwkpxyyppqGoOpfUrdXqh
	C4+UObK/V5+Vffev+rWiCheVHxhSYu2rKWaPtaM/BKlSq2kankP6VLh/f19xUQ6b
	4wG+OQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1fct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:24:34 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c1fd351530so39116137.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818673; x=1792423473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=;
        b=DUtMYj9JQt8/a5tgNXN/7hK+w2oO+ax2h3Sa7Yun3zZMvRgXqzdQESRP9WRIzU0IwI
         YNX09TPEY0OtpFmWVy8SZYO1HV67Dowb5S85PdnaBsF0aVnIRZKKaH3x+CJeme7A/u/a
         zT0aY5KOvYNl8NjS4M8gbRyu6Rw7I+9i/+5eBYSLIGGFL6Ja+b3ogZ1hpsRoiyWUqonE
         ITh7CR//9rdC5jawpHL1ecO6QHdgvaDYNb+fFr3+no7ypM1u3GdhzFxsYwu43oledF/b
         /DN1jbcW0+Ix3YKu2aafoWDUQha/PhXMl4EgS5nilq+ol5otBK4AFO3ge9jUwC2zGnyY
         /0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818673; x=1792423473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTbbiR4wtSkmSbiIjGz9C42zpD3RSjcT/iZky4rnXuY=;
        b=t1ZcsIWMKSaUCKpLQSuN9T5xWI5p8ykNtHEg2D8mpUo74WF9CVtQ4YncNE3pYI6Cke
         MsVBBB84w2vekPvV9XNE9GgM6ym2y+ekK3z9JOLrW2GqtV0QHTfiS2X4yKz3olfOx/78
         VxsEx3HxxWw/PuUX72VshPleqNaPAomEEPsVJb74ttk5tB/ECW94pUIV+tdTC/wMSYho
         9CZGYqTETQR8C+YOETo4h9sppJd309krUDmPKZ5crGzAERmhEtq3CeU7abcxltnV6av3
         C/E4e24OpMRzcu3A0SVugle24uKgKoe1W43cPRe0hwRCvc4ZbF3amBWkEtJ/lMWixiiv
         4IqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyYO2Cul5gvZHjIiAUKb00UBBP+fj88FadaVMCAtGmHXSID9qe4PwlNt6hwIKo/Z7pHsrzYkSJFSG1@vger.kernel.org
X-Gm-Message-State: AFq9FYKwrcfjMN75b8afUda6T+HoKyVIaoHNSqdQg01TbGuIkldfa/7R
	I4WdAVlmGnZ6UbeBxuRVVfrjVGkbpQU3xiXUpDSpBHcxEhbn/j1RTtbOgRMz5LqyFGBlIiX3Mif
	D6PDA2kRksIbWtEsqhOFLWhf4+c3TTk8T+J85HAqOgkfbPRX0PqflPaqI4NVPUtUl
X-Gm-Gg: AYBFou2lVOvJup0vuhtzK193781Mk2Pkm4Foul9sKeMlb8qKjcTFnNFN/8KXlJ+x5HR
	x8GSBtyrqVPXQhHRmTcBsAax3+FZNf2LC6ZXUFTumB/+KTuehboF/oDJn+WPWWV6syDS13oB/C+
	z4n7bM+ncFAFAY6815WvnqJAe0uJehjxyvTFnc91YmRGBF6A0iCR4uJPgLrWzuzJPJWrqNrxaV7
	oAM/ruh+fQWZIhDm7bF0gxp+euXqTdEEUdIEM9CKcBzMnZcZEovj6boe3l9S3g1PmHqotZXw4xu
	/WEEa/ikT/1VX5o7cwguhC5Qp8KHfndUjJW8o2S6n0UqqmFxTTEH+jeKdq/cc9LIE9AiXjxwhGs
	BBKu1moBeVOLilKdtRvWXvQ==
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr1919652e0c.0.1791818673039;
        Mon, 12 Oct 2026 08:24:33 -0700 (PDT)
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr1919634e0c.0.1791818672619;
        Mon, 12 Oct 2026 08:24:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bc20sm483347766b.22.2026.10.12.08.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:24:31 -0700 (PDT)
Message-ID: <6d931183-fa72-4704-9356-161da26a08bc@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:24:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/38] arm: dts: qcom: apq8064: Remove empty line at end
 of node
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <dbab80dfe63748bce2dc47155e6e5d40d1f9214e.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dbab80dfe63748bce2dc47155e6e5d40d1f9214e.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX3dq24IZfkTTj
 1MkCu1caeScdZJVGWNEIiJIv2YjCRZUlT1DXH+FrZAfdDWumX4Vr2wBRkBpAvGxglxwNmPUSNzs
 PjaCgmeUoD+t43Bg+plrrRL3LTvxfUE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX063rCNxhCib6
 B67Gid6j78vt6Uabrp4sJ9B/lQaBVW30yF7VjEum1CeD2GzzxpdHT/kxM89UG5Oe4wYZntPfxn9
 AyMa/gEc2qs2Wd3SawwGjuSGQKpMuOuG04kuAJrv8edRKVszqq3BQ+NPBy1uFf2dwjakRIBYYnl
 gP1aIKNezP3i6eySEON4dsKlJANwweW6hNwVldvhxBNmwl3eC6O+kDh4oLflyEemrVKs1GG9NMc
 tc58KVDHs7VFQ+TDYZFzCUQUuYUuFEl+Lu/yk48iA07tAwF9uwDRWYO6EG5nBZvY/ow3SYxNUGt
 9nMYu0/1eRMCu5v0pbtulq0y1zb3+m1u4vMNa8Dh0hDjBEyD57hwd0aL6c/fYPeAdM8NZijX6Wk
 jxOUKMx2u9XFlboGXkDtIKpRBxqeBxEpJsOuV1+C+dfgdLLEWFkyFeYSIWS3TepG+GyYjegjGEe
 FkzvkZDACIdTBeSNf+A==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfbb2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=cfbp-VlG0RD5cB8OVJAA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: 52l5W_lm0_qa4VX6y_f-sNC8CamltapJ
X-Proofpoint-GUID: 52l5W_lm0_qa4VX6y_f-sNC8CamltapJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be an empty line at end of node definition. Found/fixed
> with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
