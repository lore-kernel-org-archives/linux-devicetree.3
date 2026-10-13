Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103C94A1E14
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887858; cv=none; b=e72/j2eR82c5lZxzdB2P9F/oi4lcF778FOIu51roIn9LLBASKuaHwp+KWERq+r00rTVZCMltQC1/3lqUeFcjq6xFipBANsvWWa4R1MZZ900zuwUWSEb95TYwoyQt/WlfDoF+6ZGnp9wcXWPLxR24kcX8hIzaJYa9Z2ScGwMXKV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887858; c=relaxed/simple;
	bh=+HssKmFa4W8QviNZoCbAs5D4xy1mXVxaLSOA8v8Z2Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODVXNTE4CVHiZSqSQ2evWdtlMW9wYFJjrkoseRZb0VdTXhBdv2jzuSBWI0uhVdmyJ+5zVFPbWPCa9rls5PbGrP5dUWSBTNimEzsNN7yNEV9cq6nMXiWfwc26WELOWF487J+hcrqiP8HnVSGxI4HuMLMDtT2kntPJwoy9TDRj1G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5N+ZGoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgBuJL7j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5N+ZGoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgBuJL7j"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8JHbi988774
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a9AxPqD/Z29pGklUbSzpuY+z
	VJ7aQfVVvZ7OQ9MppEc=; b=O5N+ZGoZ0iA/VHGDtnF/mhl9zz6ze7KHh2YzbJNq
	gtE+g/zxFAKZ+pNvWQbUnI0eI1q2W/wJe5E8LqFHTq7QLJlWE1fHoJWpepXElLIK
	tFrP84fAJP532XxN/f7NwTh3V+RydjMPlnh+vA2w89e8E9ZLyFKZIm4uJwkuDTgF
	ZNc+UOLzvyk/ySUXA3nqU0+lqBw8b/18H+gmEqUILSEGh0m5vGro0SXGlgCEM5Pj
	slJS6XoGwEk70o5PtnFH8mxAed7nFQhV6GPhnmV5bmo1CrfkR86TR2PCvT0xMnFE
	iO3qsBulk+S03Ei3bLqbjKUDBYBPsYISe1YHzULLOrClRQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcaffw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:37:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so617747285a.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887854; x=1792492654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a9AxPqD/Z29pGklUbSzpuY+zVJ7aQfVVvZ7OQ9MppEc=;
        b=jgBuJL7jskyybTD6hyKAdxjEzFRyXCSk/WcnZl28fH2BKWNEBc6QA+IxQJm0iIOBTZ
         flbwVJLjeTYjn8BfeVT0qzvFntq8c9PK+Jtk4pvKIT/nwUGNRA5Xt3pr6Cn+lKrL3EdH
         UzCpSdc0AfAGwUxjzXmm4HvvwHRQuu/r388xD6w4kJzsSotDNiTWQEt29ySlOv9FkYdy
         lPYdEP9CwhK1d6h/qKD7oHnUSeITcBbwVcDOMbXJkfNuqUmvP6WfQZB21CGyBznJ+eRq
         +WsHfP1GwCYCyD9Kp46cv/w9i5c50pYqEZmdncAT98BEsf0SlMSwjM/WkjLC6FCfXmtg
         ejgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887854; x=1792492654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9AxPqD/Z29pGklUbSzpuY+zVJ7aQfVVvZ7OQ9MppEc=;
        b=GcYKEpqxEX8Cji3tZo+9maymI1vU8j00l3A993+fJDCqqIDG035kPxzRUAL7s5ql84
         S1L/vjoy4aKN6Qd0HCmAVW1/KkJP+erPbE9hjHlkSqigdvHdaCysdOR44DArEHCeVXvV
         6qDmgr7i3wNg1R0P1jyIQVpB4Ow+JtFfc8LP2zb8/tMpqMLU/CakMKSR2Az3KgdMoMO/
         Ks5UqB77BiWIpzk7XRPGzUMiw3zD/n/ikd7rLkmoxMnFDEKc01GhRfZFYYFIwY3TVwLE
         raCxiWEYSuq/xV3klMPYFXZ6DFCVYTVuAsuouw0nnTbofstRU5dlb98OUNCattPrPD9V
         46gA==
X-Forwarded-Encrypted: i=1; AKwUvBwdMIIFDnsK/BdyzuTtsrULxyxq0wDktwxQbw+Xi4LeZngqdlQynOuv9GYwu4rANz+c19WDo+Y2pzR2@vger.kernel.org
X-Gm-Message-State: AFq9FYLgCj9xjsoi51ne+lCZJ7ZplsaM76kPr+dLC9LpozUHG0q+c3lg
	6jEpMJlnCgp8lvvgGc0yKidOh2rXdheAJfai0qa8XBHmQLgCr16OQAMByQGJzcbCTXQtPg0p7gi
	ljZPAoMnop2HTEo5QYdV/PeKPeIz4Fg58NGlPJOUbxcQRGWLvV+u3OH9DISN3CCzg
X-Gm-Gg: AYBFou0YE2BiDuuzRqBSM1BTKH1ziBNNeZkYU1hwPWqHqdeP9LrLVu5GiQkXRqviIiM
	1iOQ7Jn0eRqXwhtu7BEWA1oR+bELaaQqzBG2e5tNHCbHaKedUiODJby2m3dlDl7IP5orYPOD35S
	aSplUlxfZfGGAJIoQiEeVDJeJPS/uDA6W+aB/0kqavTeeRJyIV6qihJ1nubuy78iST6BJ3DLwd0
	MsI9ZhXEMIgKQViUBGh5tcue5GQS8+rzWi3e6P3WlZV0lN22+Eivh8yYptm7TTGTmPHAkgdNZfp
	17+4T+sDSUpTsc2TYpFt0qtE9KInSsNEUbL+IS59GlOLLZHTIjgJoCWhWK/lmBWCaxxW4/w92Yb
	2yH/WymS/tAVh1xji1az+7+jgy0o4wv7Txci90RgJ4YDkb6dwZMAPgUXlOpQY0h2SuoHvduzk75
	SIJcmO1EyBh497
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr1860607685a.74.1791887853963;
        Tue, 13 Oct 2026 03:37:33 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr1860605385a.74.1791887853548;
        Tue, 13 Oct 2026 03:37:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea81c7sm3497937e87.49.2026.10.13.03.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:37:31 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:37:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v3 1/6] clk: qcom: gcc-nord: mark PCIe link clocks as
 critical
Message-ID: <zlvbdhqnndsqmat5pux3alfdnnhalvmjwf3gh4qs7u455vkaak@ge7gn4gv2jqx>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-1-32b45232217f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-nords_mm_v1-v3-1-32b45232217f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX4IHdG9zfIKwy
 bVr9PDB/sfILPdVRZmqQnJE0E7J/zxH7d+oyAd6Utn2LlQ7SBoEc0elcQT75YShYV9Vp5fp4jaw
 L7/5w5CH/WXDQcpd+OxH74p2gnVgx9uBYK5SlWWoXZeRiQP2EwVsXxh/gBM3r4bHdwp0ubYYmuS
 +jTazYX/knMWMZik5PnqhdPLU7GtBAPnTdh82z1Ell0XQkGN4rYtsM+Fvo5RZK0UaGc4djOrRpl
 SnGyS1UWUy/r+GYmP0tcA9IaRi1PYDpdBc+e/OE7b37MnZmxPOpaTanZGx7bMgOo8nCm31ZE9YM
 EBpVVW3SpN06ScKMgSOJ2SXZ/Vk1ZrtD9008vFrSAi6ds170YtO3viuVozfMVr4wzY4ajL2522j
 G6EvnDmD8ylMtW+NC/t45czMWkkEU8iRpc0SRrw3zmzlsqzkrce+3tm5krRP1cjR4Saq408OJho
 QvgnjN21Hzqy/G30Z/Q==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace09ef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=IpJZQVW2AAAA:8 a=te8iVueUN0VzZH6eLK0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: GAENsSKrdpiF_y6ob1oKQtQkxoNF-Qac
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX/3wm0ndW2J/M
 IG3fnEEonuR0Fs/xHFNadtqoYn7iBBwXdCaiqdS1rJardP951C25VHzd2YmopPfJsaGQU+AT3yG
 +r+haGodFEkH5K8ofSX+EaqCoQRhTnY=
X-Proofpoint-GUID: GAENsSKrdpiF_y6ob1oKQtQkxoNF-Qac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On Fri, Jul 24, 2026 at 04:25:05PM +0530, Taniya Das wrote:
> The PCIe link AHB and XO clocks must remain enabled for proper
> operation. Representing them as clk_branch instances allows them
> to be gated, which is undesirable.
> 
> Remove their clk_branch definitions and register their CBCRs as
> critical clocks instead so they remain enabled.
> 
> This matches the handling of similar always-on clocks in other
> Qualcomm clock drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-nord.c | 37 +++++++------------------------------
>  1 file changed, 7 insertions(+), 30 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
