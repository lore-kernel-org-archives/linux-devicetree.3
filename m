Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773101;
	b=lgh6OOnZguhJOXFI1hgHJw8sQdY5pWuXvvN9KKsNFnyAO9Gf7XfE1D6BvPcLzloaOCXe
	 Gc03Iie7Lh6ZNtZ2fbdgpvsa5OhNIOn98HtqO8ezIw5JzVnSwydZrgv/FwWP6jS8Rnn/J
	 JAqX1JLqoJlKUlroIugec949xy75qOlVy4yWXZhKSV4KZ7UMFHEDKdRmVS8RYFWA1xKGB
	 Smbb3RKUkAI/Py7ab2ICYOgxsLsqsXo4JNe/QUIGRuf1EA6fWdfBzeoKjtWAuWb1/ZpYJ
	 u2iR0QmbFRb1hSGbFT8ykiZTrkYVsDV0UlFg8ihgZqGkwhov5BAf2xDhnfsfkkvua4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r2jGFX0gUcItufp1z2UW5Hu34V6pVsNwCMXV+RvVXKM=;
	b=TN0fsPKNPAtGXOEbWvWTra9g1DeGlwcIuQnbFLJ+N5D8DB5EjU2Ap4rgHTEToOBDJyxh
	 f995PPBeQ95byeuSRhwW3XH+0Bw4rJonaWhbhyWi90xoUaYDQq4NGxeClToGVoKB9BoxS
	 v8Xu9UXebNupd9LUCYpbv15P/+p0VFuOeA8dVGRSP1UkwHkPQsQja9MlGC9GNG0gr1kHS
	 LlOykMWUdTE3HpKGDCdGE8wuaDvgrR+Egyxd2saKgxTv/pzCnCUmM3gE/htj9wVGEsw5y
	 I4FSWSSOYWt6cGQbfODKFIQXTIPHu/5RRhRt8+1O2vsaOL+hrn2JxvaMFTZwf14EJ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bNpv4vB/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VO9CE1lk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6B6606A337
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F6B6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bNpv4vB/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VO9CE1lk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7H1mG1076465
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r2jGFX0gUcItufp1z2UW5Hu34V6pVsNwCMXV+RvVXKM=; b=bNpv4vB/dWXMrFoE
	1p+C6gRNM101/w3jtj6GnxIT7u+4Gu5Lt7e1t9hPbU9KUiqe19wNJs/XHGQE48X6
	+3uH8rGLG8GUZO0PPi+jigHlVPEaelJsvjP4eh/ppOjyeGq+U4zkOxxbs3CT4bPL
	E7CfUYjmHMyZKcdvGRIlJ2od2okC0TgHwvtREl9Rt2SIJe2eF7cSy3CthL8ggHyN
	NYlCKUkpVJwUkfrsndcqKKBcQQvAFw1DLQAvRkif3SSnTQeegzxawmtFsz4//q+J
	0Ej7gdsh8LfKGx5Ut0GI9O8lsop+uwCProDaC/iWa+efdnrXiWd7jl2CGBg20lq0
	107TAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55tavt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 09:51:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94970ad532bso611670185a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795773098; x=1796377898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r2jGFX0gUcItufp1z2UW5Hu34V6pVsNwCMXV+RvVXKM=;
        b=VO9CE1lktVg/83d6hfVPWVwgcnL2tHAKe7aXFktueMRr86VOM9GBbFhDRDR6tDeGDB
         pLZr9zVL0AExKpi0MgWogNBln73CKmtl4Dck4jXCr+27Ge9wqqnob7WFaBd3uuqZ5TPA
         SC6Faj0kpfVAKkB+YSXxD2chK8OQufnNj5QhJEZfuWEfpuqlTjhRkpqHKA3CTjA9E5y2
         VYfxkwDuWWtZ0i7UutQEWnQ0WHqJbCxaYSMmS9OCTtv43gcJgZXiOsddNCdVhjfKU9qq
         0bfFDkwsyixKwZU8LZik6+fHJkv0fWT0Ldsa+v8BM4ROf8VDFI0YQcbuL4ddP5baVDuc
         pF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773098; x=1796377898;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2jGFX0gUcItufp1z2UW5Hu34V6pVsNwCMXV+RvVXKM=;
        b=G7HPs6gdQV120+G4REdqhDZgR7EgCdXdF5ryXsYnCDqU7SabORRfTfmjnqWoGcjzaM
         ycs43XfynZ3ANlHQfjNIUsGkcynwIXCDohQZ/GfADhojAALDUeEj8oIZm8nmFk3R5kY4
         sI2KG+Gy+scFczExAJCXS8E6w7n+1vhlq4Cqwha2fbM4owd0yEQqxJ1T/hKwALR7jVhy
         T2PJRYOZkFw3IgdZU6CuoJvDiF8nrCRdStKf1FOKzR+VJjnY6WR+/fCqaPhhf6P0Knd6
         qren4V3BlFmGt/Ob5rMoPjRn1+mIVCyIhPf02BEhZ1EQ4xOSOW/TlRFUte9bWlBy1Vyo
         R8xA==
X-Forwarded-Encrypted: i=1; AL+hErFD+02ey9ksIY7IJa9GqiOI0wjkY102k0nYq5lirgbE+BtonhmZVyRWh9HctUenHujxspbhKaUT/bSj@vger.kernel.org
X-Gm-Message-State: APuU4Z9pyYRmLqlLgXk6yClN6XpSZgOln0e3lBqL56teMfY5hN67eReA
	XgLYI9PxPfdColkdBDEqdvj8oUe0wnukKhx/q2FgK29bt9E7mrj36Z6NU0RucrKupi46z8h96ne
	iJGvvCEkGeItW6I1bIjvpnfBr00sPh6A1hOZ9D/0j3Q/Li7S0m4Q6ARRzJUnJv6ds
X-Gm-Gg: AZFdTZcD9QmmbD2qSE0BMdrjtXy3bkWMFcfbzJLZwQ5wmv811dUFL2/ST/380/GqI5j
	QYTJI2L7Mrz88O/9wb1S3vVBOxn5/FRNQ8OQQRFt/T+flTT+Uv6ohx4VRJXJoZ3NH23+myMHtEj
	yJRjhSS6cl6QbIwUCKmvBHZjdinSYXTeivWTmzPbJOOSWMqw9iaYPOD/mpK1DzenyzdhiIwZubo
	NKfQxT6b2VNVufO0g+gwZGFe9pam3Twcm1IGGNjUjuSY58zef1wquwXCeIAmxOvc9bKPlk0T2JB
	UNeRBEii38YSEwmmOKOBpbP7+buTyUWd5VlaXhIrHlONpQu9iNiFrBZOYYKys/TYOppMYbAXiQx
	p5ALMOBNfipx+fNKJsBjFogGpWgXBAzVKBgKeahYN6KC/+7tjB8aQOeYVs0W0PM7v22gd+esN8F
	9nr9zTTIfMrzj2Y4ZomZarl/T0axQqjs2ObuwhJw3nlBkvW8d+IkP380/SrQj99g==
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4402894585a.83.1795773097773;
        Fri, 27 Nov 2026 01:51:37 -0800 (PST)
X-Received: by 2002:a05:620a:468e:b0:949:6027:7580 with SMTP id af79cd13be357-949bab7df00mr4402891285a.83.1795773097314;
        Fri, 27 Nov 2026 01:51:37 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm47017200f8f.13.2026.11.27.01.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:51:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/11] pinctrl: qcom: fix and extend egpio support
Date: Fri, 27 Nov 2026 10:51:34 +0100
Message-ID: <179577307502.23314.4915241215789166549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfXyDHFixyxQlrO
 k6adFC4IpPZed9/4FA2ljfxppbibX4sqvsVqRHEGVHdDUUX/T3aJ0XP9PYo4KOISGsnWFpvOMa7
 0yfVX7nstMOjaB3kbfqnWBYX4bl4mVk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX9DYe4X9ozCkO
 XRUrRVAno7BVfmfrrg8i9s7drZUGGNKspOpF52J5wSL/CfBVkPbRdscU3bQSHf4v7L4DmpcuFJJ
 5Qs9710PB9jM5EO1blt6iP+3R4LCBgIhT1R1E/Drn+VueWHRC82bJGWPsbo+cizfvqq3VJuDXaR
 CcoatmSH4uWqqjJVl1p5se54yqij/sqwc9CjDVSCJFOk929afuZr6xVZ0MUQQPvXjvSzISpqmIF
 p/KJikOYGM7v5TADDtNA2m9hEGk+7BJMjtXmA9N8LNHga0iRzHD9tyFL5rX6Dl3g+Lm5shBb9YR
 QyRRUCnYVQKXwl8zokQBrJ2CNcZkc0Wl5LwELRzME5clCcgxDEamBK8Ahv4nH3mDy9tuoEXQj0r
 ni0r6cvKby0nqKFerbH3JY3JUCp740lJPOidJp8+mc2UHr/WG9voOdoeutPoH0HSIXva4lbey7l
 TBUWF3cFItUBfTMok/w==
X-Proofpoint-ORIG-GUID: XgzJDkobIo3UJ57xT602XAxvPuILx0fk
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b0952aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3FmSG_DaQpiI3iZ1DfoA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: XgzJDkobIo3UJ57xT602XAxvPuILx0fk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270039


On Thu, 26 Nov 2026 11:21:04 +0100, Bartosz Golaszewski wrote:
> Several Qualcomm TLMM drivers still register egpio as a strict function.
> On those SoCs, a pin muxed to egpio can't be requested as a GPIO. This
> series converts them to using MSM_GPIO_PIN_FUNCTION().
> 
> While at it: document egpio in the sm8250 and sm6115 bindings, and add
> the missing egpio function to sm8550 together with its binding.
> 
> [...]

Queueing patches 1-7 for fixes.

[01/11] pinctrl: qcom: sm8250: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/0c77a239ed4f8853901d6627aa479ab52633b760
[02/11] pinctrl: qcom: sm6115: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/2552eac9d68fec18e584858e7b6872721363db93
[03/11] pinctrl: qcom: milos: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/44788a3a359a0948405641dd7051a77457f99ef8
[04/11] pinctrl: qcom: eliza: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/7950d02193d557be6f088a214e6a4a44a7e3a134
[05/11] pinctrl: qcom: hawi: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/f666ce3884316635cc2f7e371a62ec5167613626
[06/11] pinctrl: qcom: kaanapali: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/f0426d6bf6271db4434de160913ca910e2a23f8a
[07/11] pinctrl: qcom: maili: mark egpio as a GPIO pin function
        https://git.kernel.org/brgl/c/38d3f870a1cb4eeb4c51a690d51590519de46de2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
