Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C59A3C1974
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991707; cv=none; b=BnLICF1s63dqVzkVv1F3kcpUHsnPJrVXkyC72n0xrXzqNOx7UEFAy4711SU1ecyYEIA9ob8WSw7q74P+bktTTLQ9M1ZGi8O2svpQFkNz/yEiIxrWnjIMOgfKR0PEuG/JV4DeqbAgGVFJLf3slROuGZ1Mty9h75P0I8TsX0F4okg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991707; c=relaxed/simple;
	bh=m1yYYjjRdySRSDwEYNVomy4f7mN8aEu6wrcxnuTly8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xce1TI8nt8pjjMjJosVMmEG8759LkvtsHziLvp1WzOxR7LVwgCFVN2cO25LvIxiB6qkiu/nxkXYa6Ecjh2vtODHpQr6iBzRRLrJk6h2VvbhSwGJj13xpRv6wCfXIuhkrfDEqsa8kP9zbbJ8nVDx+JBbEYww6A/x0cUMfYFyRsy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPAToCVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgc+4Dgr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPAToCVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgc+4Dgr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4r9b1130242
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1l0xGPYmjoerQ7fYBq7N03N9
	7e+UsH48mWxRklhvRXc=; b=lPAToCVbrR6NQaR38Y7MMHgk6FK/dqiIL3H1biw1
	LoR5JAKmmOIlgedMNolxFbEpEYtUdvlTHya8ia0c+mb95Pfxm7uEuZ1lFF3bISjK
	MuR/5KnN6y+L7Y4vIn9TOJJ9TeKI/7EnwotqsJIKbj2hd5o2+lfz4GiawIL65tbq
	UnaSUdc/mlvOFjNvHtIAG5EiFOMKWVtXONnOaZlLjEFlWkJlbKSMlnCQEDh4ewbh
	qUPOY5rubJasD7v3ycksZZJ3RR5KoTfsCkio0wLc3hnJXnPi0ef1LZx3mzCcX7dv
	/EDhe+erj0y0A/2k3b44+qe8fdd19+ukt9+JKJmQZKqcRg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csg650-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:55:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390a2c895bso233569585a.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991705; x=1790596505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1l0xGPYmjoerQ7fYBq7N03N97e+UsH48mWxRklhvRXc=;
        b=fgc+4DgrEq8j5CpLNmF3Vzhu6S4pck4xC2w7nH1bBxZQyRZedHtQecyjC5JUFm1tHm
         DJcvOgCLL6joelkaR9U59729NUTDUcFJvy7gqRnypnSjdMk+P+1tBPJY8fguEvUMUJxY
         7OeilQNFDpO1pzxSWeznrrMIrjGrsxAhtdeLZ8nKzeHVKDUguO5T3nnoX64Bj62ayiRf
         WDuyiUxiUq/KOVnSVqUltDP9nHiZNfobyIUH9POJ26blecJ0Qpkh+gR8v1Mb9Fi+KMqb
         EAAKheLk1/zYBfZw4ZO2iwBPLOZ69QvVfVvBr2TM6ZrUog9XxIpGBxDH0TRoUZzCjCwO
         IqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991705; x=1790596505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1l0xGPYmjoerQ7fYBq7N03N97e+UsH48mWxRklhvRXc=;
        b=QykhwuDnqZBOmVQ2u7UDaDd3/t2jx4WKyElY8cq4l5c2QGK7uVIliKBkuqGHD7IUdh
         U8AlsG0ql5G6Zko3o1C1KmsyLIIUMkErtsAyPryYE+00WguTT8TEwubQJ4xm/1gy7/ca
         AmjCoKqLyVBr86pf335mGV64fqYa0PTRKauz4jrR4+DBjtl6GoTyEjzGj7PgA/RnngNV
         0x5qMfc7+NAJtZDT5YF6N6P3Pkm5AUXTyAGMC6tr9WVIfmWFrq+oIMzqv4RhCNdXnl6Q
         30gQKpo4vKc//QUPAeE1iYJ2ktSfCCBmeoy+Iv+1JlDq2EEgNqsNVfLzqExpiO8yTJcu
         2ryw==
X-Forwarded-Encrypted: i=1; AKwUvBzxGF2eSwP8fkGd/Px0rJRuUM7i7e5sOJh5/o+En2+p1AGfYC8GoTHsK7UCCu+A9f3aaRPGtriX/49P@vger.kernel.org
X-Gm-Message-State: AFuF++nYRSSMS8Gf9p8LKq48V/1SBEDWbPU1KywD0gunVIZbbeCOgUaD
	gVKemA6tzwBWoRv8h7QUv7UJ6s+2+YdgBlNOrmHYE/0rUe3tfpn7G7Narl4GKn5gpMh0iX1dA3z
	wH8RMiZKA9woMCOqic2LBSe6BMYRvn4uq9FIklPV7f6yiqUTDION30+NwAgouBW5Y
X-Gm-Gg: AYBFou3jN8XsJA6NcCem06ooIPn3YRjrNpv8qtu9THLl9IuS2HJvAy3LwNtRF3V17yU
	OWKU3uDxxtwBzdlYTCQ0jR0W4xFEX7LGuCwRcfZ56xGRbYQrLp9Sgl/+C5MBtbEHN2vyegnpmNv
	bn9FSb2s1DNbyLoEnkcYAl92eVcPgU3Oea5frtaORp5j5c3afDSfTZrLqjFxs8IN5PqUxLa16lk
	1zxsCfnouuNujd25urmCi9wg1qX3KcVtznvskMQnvkEcZ0zunn1Gr4x1XAWZmjcwbmjgckghAYq
	MY5Nv8+DKrIczjk0xBeUU25u6sUpGrsCjKD5i326ZT2FmKe/2AVT5LJkoe+G13HPLFBgdG/slUM
	yBnTDJz6jBThkuw==
X-Received: by 2002:a05:620a:4454:b0:93b:c07d:a6bb with SMTP id af79cd13be357-93c15dbc8acmr22557285a.16.1789991704738;
        Mon, 21 Sep 2026 04:55:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4454:b0:93b:c07d:a6bb with SMTP id af79cd13be357-93c15dbc8acmr22550685a.16.1789991704070;
        Mon, 21 Sep 2026 04:55:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd068059sm235056795e9.5.2026.09.21.04.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:55:03 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:55:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
Message-ID: <ezqh4tzvgns4i3i6zodx3h46xbd2qxkqoifzelihw62gamlb2o@6ps7bn6oloh5>
References: <20260920-ifc6560-adv-v1-1-89b1435d00c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-ifc6560-adv-v1-1-89b1435d00c2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MiBTYWx0ZWRfXwicMC3j5FF3L
 lC8zeEK1yuGUitaStoyXKknuVjivvcQ2eXxQc7c2TlW61NG66eLmfBp00usBhDgvAXYgjte6Ul1
 yy4CkM5aptMspqrhms4bHBwLxwxdYb4=
X-Proofpoint-GUID: ZDA28QcWoQDfaDe5FYFQW--I9rec3fS9
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab11b19 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ajiliMmGaEjDzu8pHK0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MiBTYWx0ZWRfX0Audrj9+EoYq
 hJjk19slosfa8qlK8IrA0jX5pYMQ4PYdaijzKiAAhK2oiieogzmmJdX5SCMJIIDIWvc43lEN3lH
 pbww8Lt9FbObMGoAoKWhJyLihnYFpikj0qBygXCbQv9rzeU4mp4amguTvFNk90cLy0sfdjaMXhU
 6H+7U+neHRa4SLrc+f9GHkn0/pqiUCLxc5gHpqUUr/w3iYFWuXFv0AKEOF4P6gkDqS8rGhakr2W
 fULGImjzXlxwAsR1Hj/urc6gKbPa5Me7wH8F08rQmOnKvm9CQ8j2lL3D7IPC6CfzvpzswKrydua
 PJlcahloMb3z7dfXIYSYI9X8PozV3M5QzCr7ROGNxvA/jK9H6r2975ZTIPghwvn71rmqxlscIXQ
 9TiRzHrkj7rgG3XiNzJsXrZy7DPMuIfUAXBH8PaWNO5cKKF7q2IFteV+tslIVug5ktQ8Zo2h8PF
 jwjWygaOzaFUXyTflOg==
X-Proofpoint-ORIG-GUID: ZDA28QcWoQDfaDe5FYFQW--I9rec3fS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210172

On 26-09-20 14:11:09, Dmitry Baryshkov wrote:
> Probing the ADV7535 HDMI bridge fails on the IFC6560:
> 
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ
> 
> The bridge's interrupt line is PM660L GPIO11, but the board never
> configures that pad. pmic_gpio_populate() reads back the state left by
> the bootloader, which is PMIC_GPIO_MODE_DIGITAL_OUTPUT, so
> pmic_gpio_get_direction() reports GPIO_LINE_DIRECTION_OUT and
> gpiochip_lock_as_irq() refuses the line. Requesting the interrupt then
> fails and the bridge does not probe.
> 
> Add a default pinctrl state switching the pad to digital input, applied
> by pinctrl_bind_pins() before the driver requests the interrupt. The
> ADV7535 INT pin is open-drain and pulled up on the board, so leave the
> internal bias disabled.
> 
> Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
