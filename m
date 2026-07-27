Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A054D39A4A4
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 03:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123567; cv=none; b=eWuWUjudiTxVRS63P+QHWBHjZFAbZE4SiTbjMjtoWiOd9kCtQeqHXTgpQUU8bwMTC8PHRUsSm5DCLdWd4mkTuMHxpHyHHDEuNP8HQG9HNezv6+/9p0uRr2t/aaUP19gKnwqizCrxkjFRVCmtnzRdodokFJyWhKuqPxYySmp6e0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123567; c=relaxed/simple;
	bh=5Fx4lcYMSNhiafu27Cu7fS52tqIBEV4dp7FZqGxE0jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrhRxaZcQXy4J6M6ATgL0to7o52avALKFXblD59X03jnu6KXY7gWvyBkOo3CTeK5ijRd0gZP7/wUPxvuTzQtP0Aa5Nx0GRKu3CkxckG8+rdmBVFI0JhKWZOi8YdPof2UOvh7UXyw29dGPdpCkr1y/cVI9iOxuvOsneKtHLGhYNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PsPOScNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lc1nFtM0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PsPOScNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lc1nFtM0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1g0TA1768490
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 03:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uMuopM3jj9hYTI8JJHTg8Bku
	5lZJtKAWtmi7JMJUgbs=; b=PsPOScNyZ2YZ0MNTB08e8ioktINMkaw5EpPL9J3n
	ZLh7/F5WcPcGf3ogzRehKKFl+9kTLFwtuH7f6beRCayKRWObELjeREIh/ap9AATZ
	wX0HqzHpBVjQvTXLNK4sD8An2ksYcCUr05Fp3r4CZG1MLwOqUknuirObb42hdGzT
	D9QSZqJNox/fTwf0qXFlnHp41C3+l8C3HAdgEhxlJSV4W2jq5dbOkfELKmt54JEq
	imj5xs7Oqh2PVHPDEtQgfTBG6/t27h/rUlT/oZW7PS9QmBpprbKTmYEu15QiFd1I
	F4fUSqNIlykSr0h9APnkivGyE7V5qHnFm9Uiondx0xZS4Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajm502-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 03:39:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so3111154a12.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 20:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785123565; x=1785728365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uMuopM3jj9hYTI8JJHTg8Bku5lZJtKAWtmi7JMJUgbs=;
        b=Lc1nFtM0X0S4w4iF35FwMeDeyOBWzVnb4SptSLqTP4uzYelbayMQpkbpcutZWdHtEQ
         9SqhAdJQuWSWzOJb6NtTenvimOeNQMwyzKGIKcebHScC6WvOhwy76MGQY48JxTB7sBdS
         VgKdxK2B5XmB2W+KN9ojKzdQumYtOAJJI6+EiuXq1b50HmZVQMtmzOy9WTOFxvtmfNKA
         o/ybelaMHrPB6L4LBbRB4g4X93lX+9gdl0Xhq0EdRHSx6eyp07PnV/IjHRKoiP/GlMkZ
         ZNrHdTgP+6MNpm4thBYhZeHv1xGAW8O0CrEErEbZWu9ZRGlV613NEkrP4vTqts5NTHMy
         EwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785123565; x=1785728365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMuopM3jj9hYTI8JJHTg8Bku5lZJtKAWtmi7JMJUgbs=;
        b=LwH4EQWrnrme2n88sFKLL7Iqt4nmqC4RrvMd3xfYAcGPqnoZZb35B+ykrRIXr1O4C7
         WZKUKhwYZdmuldp8P96QSnFekb6UT14wYblhbV1x8Ks2sxA8pgXGa3ORhG6wXFetWdzk
         6wm1YfHFFp+Qw5aloQvVZ7X7t7ZPl1UAVJpZ1WyacV2zCHZs75m1PKsCQB4BQB4J8OQP
         z3TK/JiZruAdkWlz1IkCo7C5GDe1s0hf3K3PxjoaPINZQx1/NWg+v0PVjNir/u23K4zm
         YeTBBShoZjJKpSax07IR96fuJ7sSyxVSBckhmZGAcETwrUOJxDLBnn48Hl1QOUUFECcu
         aP5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrymDFt2d8DxYo213dxEg9HbLRcl7KolgjiO4BTUmREnAgylb/ldwwFaIcsiHIhfGT+QCaBHVXUm6II@vger.kernel.org
X-Gm-Message-State: AOJu0YxVyGXF4bO2veuoO/fyhWdnG2csgYCkW9TwpTmOsDliSw8MG3cC
	aXolwO6OxXgBvBhC0vUJCV+yuixC3qmnKyL6NcXCuuas/C7jSlHghkhrIzGqMbrxOA28jyh0h25
	FXOoeXTaxGWwldlDhuPOwganuzbomE7dl42Bhv7Cdl9veyHwpXpUyadBg+u9nCw1P
X-Gm-Gg: AR+sD11Wjam+Aq+cd3qsjdq1eHlPRQxRcCtVgEe3pl/h5f7kp6olsovN43gnBxdmFGk
	OjvGpSmFrs8m8XQEH81zoAGGBOx6uSslt6BM8hrHMcFdn4ybGnIiBEUH1qhUKePaV8aKT3Zpdo4
	+/jOLla+d/a+3zORzarZXUn6YjbwUBVkv4N3WN9GI79UDT3yKPj7o4ZyukOvDIxI3nqnKywRhXI
	jolwk9VjbYaSgucv5r6dQ554qPyHSeW6NGYPopjhzav2ddm2QsIV5sKmnKUy/5tkhVidvGREt5/
	BNbZRGo4DffQFd36GLNMS6cfn6guf/+VoHwkTd4bGlQJYjTJ3rOfWBvBhXhAuCyNRKfPtJOuDyd
	Srn/IYHAL9nsk3iFDyuOhkRwU+HERtqAaG2XhhnRKJaA=
X-Received: by 2002:a05:6a20:4305:b0:3c3:8aa8:6caf with SMTP id adf61e73a8af0-3c67dd8a496mr6498047637.27.1785123565133;
        Sun, 26 Jul 2026 20:39:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:4305:b0:3c3:8aa8:6caf with SMTP id adf61e73a8af0-3c67dd8a496mr6498019637.27.1785123564714;
        Sun, 26 Jul 2026 20:39:24 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm83325598c88.2.2026.07.26.20.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 20:39:24 -0700 (PDT)
Date: Mon, 27 Jul 2026 11:39:18 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/6] Add initial device trees for Nord platform
Message-ID: <ambS5k07GdnESW50@QCOM-aGQu4IUr3Y>
References: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: MUw-FySKnS3Lwk1p8IOGmal07PiV6bww
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a66d2ed cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BveBNERCQC9dx0wiZzUA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: MUw-FySKnS3Lwk1p8IOGmal07PiV6bww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDAzMiBTYWx0ZWRfX3kJCj/mqAv4q
 soM/LwXShQeCS4W44mJZbRkOazWXMcsxay0cSVmqE/oj0HDcGxAMK0x/4w2PftgNmI3No8GlYEx
 29Jg/EO/j5bneDIZhmBscILj97reAXEnhb0pu9yoe5zQocXaQKwajxYfHZfRtOVDMn9oTgA+F4j
 I+hfOeaXpU0Xq8YEBXU84BJnrLlPTAf54zX2zhC2Xl8oFFGAJ84pi6x7Wuhf8URjo2DvDRM8QB9
 7W72iZ3DCx4P9CDaiXQoecwn5jyG1qsfCOU+vvdM3FX3/o01uRmEpID4/hHQIyPd6RU/2+N4GNC
 WQUPxxeU2Q78AcufVhRlnKN2S6l3Z/vFK4HAGjR6KIUNkHxwvqIQkRE7g4QwwGLZRTz2mup5kwa
 jdl0bYu/Ed5YeYRr7ndKIbYj6EriQFVTWIQdPavftklpEU8fOvinfJQwLchfo3MTyn6PEu78oIg
 GwTcCwCBh3qW1Wm20rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDAzMiBTYWx0ZWRfXxdSCvCn89LN6
 EPNiN0S7Iuxc1DiWKupZY4t8FTAmBqnuEtD9szkQlZcAyU3TMGFs5NQ7/3fXIwCXqWxqTlqmniW
 /68kFV63HCkZihuDRoxAxKnKiN9gZbU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270032

On Tue, Jul 21, 2026 at 12:39:59PM +0800, Shawn Guo wrote:
> This series adds initial device tree support for Qualcomm's Nord SoC
> and the reference design boards, SA8797P RIDE for Automotive and IQ10 RRD
> for Robotics.
> 
> Nord includes two variants, GearVM and Embedded. The GearVM variant has
> platform resources (clocks, regulators, powerdomains, etc.) controlled
> by SCMI server running on a VM. And the Embedded variant has the resources
> directly controlled by the operating system.
> 
> SA8797P RIDE board is built on GearVM variant, while IQ10 RRD is built
> on Embedded variant.
> 
> Tested on next-20260713
> 
> Binding Dependencies:
> - I2C: https://lore.kernel.org/all/20260707095708.3801043-1-shengchao.guo@oss.qualcomm.com/
> - SPI: https://lore.kernel.org/all/20260714120226.1788391-1-shengchao.guo@oss.qualcomm.com/
> - UFS: https://lore.kernel.org/all/20260720023552.2667237-1-shengchao.guo@oss.qualcomm.com/

Hi Bjorn,

The rc5 is out there and we are approaching rc6. It seems quite unlikely
we will get these dependencies land on linux-next in time, even though
these bindings already got enough Acks/Reviews. I understand this is
summer and maintainers may be on holidays. But I don't really want to see
the whole series miss the 7.3 merge window due to the dependencies that
are only required by patch 5/6 (nord-ride.dts). So may I ask you to apply
the series excluding patch 5/6, if the rest of the series looks good
to you? Let me know if you want a resend.

Thank you!

Shawn

> Changes for v7:
> - Do not paste the comment of bootloader updating IRQ number for each of
>   the 64 SCMI instances
> - Correct crypto status to be "okay" in nord-embedded.dtsi
> - Drop scmi15 from nord-ride.dts as there is no consumers
> - Drop unneeded LDO/SMPS regulators comment from nord-rrd.dts
> - Drop regulator ufs_vdd_hba and ufs_vccq2 which do not exist on RRD
> - Drop always-on/boot-on flag for vreg_l3e_1p8 and vreg_l2i_1p2 in
>   nord-rrd.dts
> - Drop untested I2C device and add tested EPSON RX8900 RTC for
>   nord-rrd
> - Restrict nord-rrd UFS PHY regulators as HPM only to avoid potential
>   intermittent failures
> - Link to v6: https://lore.kernel.org/all/20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com/
