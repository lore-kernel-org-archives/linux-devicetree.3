Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3744352C52
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 20:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246556; cv=none; b=jEzsOXp/6xjA1PnWdfyO78eY0CL5Vd3u2ymFIDC2rVWiLOH+WNA2uk1P6NK6RCbq8P9O+OmISAip5CfutBX9K660z8WQh7f1c2KiLLczb9SaZ48til3JnQj2EQc6c9unSiMLeLrXcFhjdgBW+wASh3eDO5SIf73cxXCQNSV92xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246556; c=relaxed/simple;
	bh=crMzeAvRDKSc+oYzWKMBeU0u1eHcNkl52DqLw8sUBNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmcQ9W6AVIBs+kgKgACii8Psc6NqfD9+lcbPDr2779hIeBcB8WP73l3hXoYvufGAkNc+4tG8gQcy1OlaS/CD2mJhHxqoSIam8GN+QaT5kEgDhtCJHEf1Z5RT8mysDlbCoczmPNJTYfd88z7ycGo0ut+l0pwk23TMikZnaU7f3A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AX62KU0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jETuYKUc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AX62KU0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jETuYKUc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EZ7q4142094
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 20:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6SBF5UL6FbQfto/4s8YknHPL
	hSX/uFdWPyfp8iHTzv0=; b=AX62KU0Sn6FDkeYtRGyaADed8cM90clzxYajwt99
	Hi6N7yFfwhWio5vGDSBjlfMMzMok1Kj6XFjezvhQb4VmWQTJY+3FMn230Noj92Ux
	M9DZkRh2cjWidCGlJzxwz0D/WqV1Qjiis/0czp/gxyH8mEV3SVux2hqLbNnFzjjf
	X4cV9S2ZD4ZQOiiphdbKfTNaL0YWzmahnmyYPCMfddobDqUac1jiWUeJQ+5A/maN
	OIKqP5CN40x2O0jwMIVJRd6KZQnNwrfUbwDCOSMs9stDfNeA4oNr7YvOq8TfiIOJ
	QfMCrbH++etGq91UlUynhfsU7hpnsWrVr2Hq+r3gxZ2Y7g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y284c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 20:02:34 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-953e00e8ea7so953550241.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 13:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775246553; x=1775851353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6SBF5UL6FbQfto/4s8YknHPLhSX/uFdWPyfp8iHTzv0=;
        b=jETuYKUcx8YPZf2kpeevCrbpZ2X7WZu27r9PKyhV93FCkqFUqERh6mejjYhFKSgrvT
         TrQRjx5sjr8QWI0GAo2NsjBjA8AKZr7PaZih6LK5O3HEP4w17qeoH/5Joz+/VsoHS59Z
         uV2i7OAlcRVbr0pV+KJ2t4b9wr5JrZp+nwoMx/h2lpOFHG9Hww5F9fN9o3j5t02UaDEK
         uNOvG0xJgicPW0ryVTv39W3N20t625Ic6d5gQYLU4G3UBaun0tYeVS4LiCactDAS1MTb
         rQrdZ4BUewIIawSFX2PEuK3Vt3GmQpLYiw8R6/Zuk3lQg0CZkyHWiXjDlLDQmmHTuZRi
         MD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775246553; x=1775851353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SBF5UL6FbQfto/4s8YknHPLhSX/uFdWPyfp8iHTzv0=;
        b=ARAXZDmpb1GXslvgoxkJ6g+5aVGrFWizhvc22MM/Dd9+Wrr374WylxBCMXRl4svwUg
         UIV5wCHuWQdqHv5IujZRFNjUJUTRI4iwHfA+p8hO0D8U/lbwQX4lluQ6t52qIF5ymVo1
         x9J6ifAjDSMFNjBLsp/7X5dOlxjowprhSAcFGBvCkRyPDeF5jBSGPbUv3N7HLi4vcf/B
         TqF8LJwG+22tpPOCZz+ToBSzmYQ6fYeW2JAPeBP+8G0hwC1Gs28whUO0kq93ZCm/xWf9
         f51jo4yPDFz4phPB9NDHnAvMgt6m/BVqgzxGCqiPaQUksUx+cjn2EyuTRjKhVjvqCh8U
         45Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWa6qsWYRkGUoqlK1lOBCTSu73X10F3bLO8+hfJDOm0hTkxaMEwooHcdWqR8a9Fw4kGhr465UIAACpx@vger.kernel.org
X-Gm-Message-State: AOJu0YywvSnbLxUXyUJ+lGHGZFxOv9pl0HlJ+epofsnRD/R1csdmYc3q
	DFR+8haqOOvTaQITNCA7lzjsNoJLOhMS0naHEV+rb6VDQ5t3OgP1JNNF14W2NfYXu8o/bqlYXGu
	lQpVqYYIikLspbvZd07YhkrdGeh7BrHdIWpPSDC8Hgw4nfgscc/DdMfS5nyLxHAJ0
X-Gm-Gg: AeBDievUlToWGxf8dnSi8t+enNHuurbG0MrKQLkXoT+tmm3v6yy4K78vx0+9xC5bO82
	YuZiubUrqJBrwovkVQYbdXTvmYko/6xYFMmFZLZpDQ8ggXF76GbBvdXqNtxl3aZs2X4rUCjq6Er
	Lq4zrjJp4mn8XNQoO+zX5VVTK/LX3/EaBKUeO4b4Y+6j44+5Ph1iF924c4JTyiO2+Cxxs4ABcae
	PdmOKYlHwmMGu30FGKBHOln5LDZyHe2NpXCsUcz36rPI36n0JLrs3ESGj98clnJuWTWOpbsOgJT
	9tgD1Cp+3c3Wc1XUG2wDAv+njVDOyxk3hQe7oY8lK3/WufbQ1Bch1iOLi2OGEx3IybNIzHPwbyk
	PWdfEjP243K2nNm/1Bjydo66rF6KtrH8DhjsWmc7R6NLqFQ/g6I9egJBUZaYymq7AuzB47Eqv/Z
	Y2A3P7rqozaRKBB2SQoNeD3ZYRQeGhrNP78X4=
X-Received: by 2002:a05:6122:e469:b0:56b:a6b4:5902 with SMTP id 71dfb90a1353d-56daba46a67mr1470006e0c.16.1775246553098;
        Fri, 03 Apr 2026 13:02:33 -0700 (PDT)
X-Received: by 2002:a05:6122:e469:b0:56b:a6b4:5902 with SMTP id 71dfb90a1353d-56daba46a67mr1469977e0c.16.1775246552613;
        Fri, 03 Apr 2026 13:02:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6033sm1700350e87.48.2026.04.03.13.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:02:30 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:02:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: Add support for GXCLK for Milos
Message-ID: <nxeer7565nk7mcyqucak7cetdgzsueqpvvy7hj52al6743qcox@yvyb5ixtnzpx>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
 <20260403-milos-gxclkctl-v2-2-95eb94a7d0a4@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-gxclkctl-v2-2-95eb94a7d0a4@fairphone.com>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69d01cda cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6H0WHjuAAAAA:8 a=Tg6AtToVi0MBdbWWjBoA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 67Wh7uFS3X-JptUTKYwIVeL7C8k4yvdw
X-Proofpoint-GUID: 67Wh7uFS3X-JptUTKYwIVeL7C8k4yvdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3OSBTYWx0ZWRfXw6i5sajIzuTs
 MdcDZFwGeggSzkVbe0TjNSsrliKE/A1RqkK7LQMNooCmkrfrnRuN9ddRH0vMhx02e7akpZxBiZw
 LQpt+2Tf537f7bcq3mmCtSzC0cFPPye1aUymxLYhhrme0rKdfMWqklK46fiIVN9bem0DwN0gDEn
 nIrQ8UdKwx6jwyYESBspeEBU8s9GzQwG3ONwlAvwXKuK6eynaY3Z0pt3u0YLQ1Ff1ADRQ9/AWkT
 eLCwSYFtI9fS0WOp7oexpuM8eCN6jR57cI/B5l1HmS2pVaNEGjndHuyXuGx4vYQhdAJ/2knkxBg
 TycrQwrq2fZKaBxbuzfllGPY8alX1xgkhMmNNQbSmTHGKt/suP+jq6lLU2EooLHkIAtYS2OVpxW
 bD2bzDzTrIz5Ee8peKODyxD2+/4TVppKH5MM02jGOVLcf13OHTz1SVqh3zFjpDfAVF6s+gpR28P
 86fG87R/6tzJ6tn+xbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030179

On Fri, Apr 03, 2026 at 02:03:47PM +0200, Luca Weiss wrote:
> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
> clocks for the GPU subsystem on GX power domain. The GX clock controller
> driver manages only the GX GDSC and the rest of the resources of the
> controller are managed by the firmware.
> 
> We can use the existing kaanapali driver for Milos as well since the
> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
> configuration.
> 
> Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/Makefile             | 2 +-
>  drivers/clk/qcom/gxclkctl-kaanapali.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
