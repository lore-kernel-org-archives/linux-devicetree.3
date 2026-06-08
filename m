Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7FC3E0230
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 18:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780943772; cv=none; b=j2FGmVL3n99Ga92+kcgrqzKrukJ/IwNxrBAyCKtPkLaH1s4Ry8EUEyeL1g8xCsQw15B9nnX7TABV6EwVMpL2v53eX5KNFasCZbixWbGvTIUa1il00By7DPVTayUteGrfJy97+sgASfizD1cEroQSiK0l4KVTTOgsV+uqvjfmjUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780943772; c=relaxed/simple;
	bh=+X4pezE2922d596Af5ASfQnVu1TRws/IydngxFVvotI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mW1ulhts4jApvEPdjcbFWHaDg/WvpZcq4iwfahlH2Rnjz1jbeoBJZDO1/8g9F4w/LzUoZWNWBy1+nWPap5L/iol6T5b37LGPnxSgZMASGPu71taVzIw5PGUDB2An5TE9xr8AzNiNak9o4pvvKKllsMUZdy+j47FEGs7BoTRCbe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/MZx9wx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMN8KRtC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/MZx9wx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMN8KRtC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFR6O3592848
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 18:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wxwTllO3Xeua002xBaThYp49
	lPGhAz0Nblos69p+78w=; b=Z/MZx9wxfzFDrntwSanVF38O3t2EX9uPwECseMfW
	Ahi9H2LtV/Z0fBwxAmmwTcavWbBkTNnBu0nvTm/778OT/8lrDfH+nkpVrL+ybERl
	Z24corn04QuL2vAttWEG3cNngAdbtuo0OyN0x/p79VZAdbEVs58128Av+PrW7M9u
	zjwD4V1WhFWGyCSJjCv9r5hJCBazsPeikKIgsEznKRvjrCdYoTWWY8YJHnrLz898
	JCxiJi6c/Ss8RWGF/ectf+d/dXY72LID53/pRnLhr0XcEHYqAE+A0RInLf1tGBc8
	1bJG5TGEdKxJkNXY+d2sk2X7zJeoYxkPitCb4oqTW/kmKg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m1y7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 18:36:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso2531985137.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 11:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780943769; x=1781548569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wxwTllO3Xeua002xBaThYp49lPGhAz0Nblos69p+78w=;
        b=WMN8KRtCc2LSPoUQ0kYAPVjcLCUq5yz2d2qXOPs7s/fS7+HsojawuC5LzUBA9gZbhq
         9LgtKSovtiiRnpOwWSx/Xi1F63wvqBRZWeodBSGpav3ocPiHaJFYauEstLwC1i+V75s5
         jxq4OZBQ584dzl3163D1HYyvnNiyzz2/LAP9/NmZqWdKk4ZQTyFfvZNshl17SrB5Lxft
         q45Z7gsxzUwhVoy7ZJMU6UhmC2rWOLoCSwc/BwNAjB38TB0ORhVl5Tu1UXW4dPwLgKS2
         EEpeqLggAwGJO/o388wwRnZkHYYUMMznyUo4oE12NWqf7GyzXoHZaQobOq/UF1q4oh1R
         hB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780943769; x=1781548569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxwTllO3Xeua002xBaThYp49lPGhAz0Nblos69p+78w=;
        b=EuA7FVCBn9RT9Ch/1XRY49ohwRq3UqLiSVEo9cOMwMJPnMoZqdmWbSEosqG3ighqVM
         D1L8utLEqfvLHx2X5QqyFWsBM5QlQ1k5lZnWzvM8xUZ2yW0a507CBfoJ9jFK9ZYJcfio
         JrdyBKJcqP15W4Eb0TDpHsegmOsR0HkNjOI0xPaJJxQzThbIiODd8YBArIhucWUDgavQ
         kIs0Dwqxjza3fKOnOuwTljXRtmF/7IDMk5NdHqCj8RrkGtaQuLH2cbZ086wqvfMalCVk
         Y9vsrYn2b4rv+bLMHRm4MqNkD0e6s+DOPeIIlx2QtOHl1YywKWZtw4FgEsCtLfCqKs86
         PnLg==
X-Forwarded-Encrypted: i=1; AFNElJ/gONnPScKthd3G6Q7GQhbMgX8S5WslVdvLsPHE61Uw/swVYpIhHms/WQ/CO8zq2rvz++/DVGSFiclB@vger.kernel.org
X-Gm-Message-State: AOJu0YyI5QO4RWssb/5pxgdEbtBHULIwAPbcRIx7RBJEpMmFZwtehbpI
	fW0vNU5hnI/Gy39PixN3noZequ9M8ivPD12IwXo+Y+jTPGW/0U5FtembLFzEGAFiXUdnEHg0GW3
	+NfkcghWCdND0vtQDLq+4dTztbKlHXw0X5cSiY1tHRP0V2YPQIUX8FClBSI2Vh9jw
X-Gm-Gg: Acq92OFEXBtQe39p4Arx93LoiUioKKzXtKydA+BrXZAuEq1o3/3IYApIaCB5bi3gBH1
	JRmB5ND4wYh1XyRaRaXuSOAuC2ZbLPFIf8ZkWt5TrP/EwyMDTkqppoUrGSkX4Z6DOrgP1dqiyus
	7AtKHx1M+Rty+4K0a1TTVjUXVSbIU4/o4UZ2jZ7PTpfIKXtjr4so9+I/7FdIoMHSjlsJLyx1tWo
	Qd7YHx530UQpRMVrK343qzkVOsGedDcc+DbZTaISs1lxckB38PBaBh6GTx/XjvDyieWWXadDOmS
	ajaGm4Lr2+5D82Yk8XpbJae4qJ5lAtHPES8PBqVCl3mFbB+4bkpOMBUAwEZO2cfW4n31cLAy4CL
	3/gvVxKk9VOs1FiqIDZA9xggXrgpL3P/9Eb7ydgppwDTXJ98xXVgk0jKUWeFzklTc6irXP00TGQ
	vROD16KrskYH5BPIHZ/EB4jZgdn3TtEMj/oHxXS8+c45Vcog==
X-Received: by 2002:a05:6102:3749:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6ff0610cd27mr7976937137.25.1780943768616;
        Mon, 08 Jun 2026 11:36:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3749:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-6ff0610cd27mr7976915137.25.1780943768168;
        Mon, 08 Jun 2026 11:36:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf66e37sm51078631fa.5.2026.06.08.11.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 11:36:05 -0700 (PDT)
Date: Mon, 8 Jun 2026 21:36:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
Message-ID: <a5crn75rxxqtf26ke6552b27ar4xrglkrwdgw2sfnkuli53ymd@2gapkkkcx4o4>
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE3NCBTYWx0ZWRfX0KmnXtUpCQti
 wPG6hVc6wFArQpf1cGuKsRtOZ7FeaPCCPkv3Gn3yQ0Ck97TgMjEXKn5LxiIf3NuElzojYKSSdF+
 Ia+OdzYcYfq0VfB8ZD430ljv4/kYKzRDfsCqTuVQeBWLAXAUf60R3TOn7P6+0mf6M84of3INu38
 TQrEco8JfzGhlOG+mCyuvC5f4s9sZ/zVQohFzuCBgU1m6Eu82v+izX1Ab99I28zjhv2Oq5jwjSm
 lVBQRvZDmI1c0rLiW83KZezJoLV4KjPN3Y2QiXh6U4LXCKYEyOg4YS5kuGhv0P0Q/ftyETLQLoO
 287yxp97PW/w8j+Ko1QKEXl3JwjwHt9j4SCStVlma6nQN/enlv3OIZISHNEfhMCVKUD2T58jyJH
 uCTTOmxUVssnDZTHi5l9ZFnMhOT287HrMR+k8ujrq/1K9tWwHThylINF6L6bLhKud0Ar+yQ1a2c
 UAJU0WxJCpAqTzm+dhA==
X-Proofpoint-ORIG-GUID: WIF3k9uZd823uk-hu0lrAidIy1JHtrgv
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a270b99 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=G-4fGFNKO6kq0i09DNwA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: WIF3k9uZd823uk-hu0lrAidIy1JHtrgv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080174

On Mon, Jun 08, 2026 at 05:51:51PM +0530, Imran Shaik wrote:
> Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
> SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
