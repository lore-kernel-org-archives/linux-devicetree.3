Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB023B3885
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247774; cv=none; b=m1OcvQAtzFVe3dQOf2ek2NJlwQF7fV7me9WJtX7tE9SR1TSuJybgPHAeeEUz4Wju95hnhuWhiVBAmQuInAfJfkCGcevEUzfG8jDd2uF1U7ubGhGDtKqqdOg89ISOWBXSHz4SYu4ZQDCXVtHp7OFyrJoRThQGK0mxuYF/SfQaFhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247774; c=relaxed/simple;
	bh=izIZUsvbEAV/0fCfYRTbm3ulS6qw1DIy4b9hYSIb/SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDqRWb4UnQvwG7h2S0nBK41mAF+TfNoG7swaq0Ob/HXa2cCTSBhUbVyhnWv7kvYIVMIeYd4q3cmwbVhIAtbnfwAlyaFAjobeeMkxANp/ikpMZ3pc2NHnA9lkHs3J73pjrfdOIeMw3b0nQBuycHrYFQO9HBW7nwdfi2gl2gk+8bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8tvSY/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IiFAibC7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8tvSY/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IiFAibC7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633FexJP947585
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 20:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4yDt06DKkjZYPE2ZQ7EPO/ds
	rviXxjbdzSBRuroEz6I=; b=h8tvSY/lEIg5f86ErkOrj+54LUrEUnGRTm8GX3OI
	AAUUcIhu8IvXk5rEaV9Mz0DjE63F/e6IADsUHEEAseHO6R8cpxgvM/tVToCC6DKg
	NxjDr8V9GbiwXZ0u/dp4HjFIYLud4+mZgD8i3bp442Qd+jOR9mpYFktJ3orsnI+E
	oY4ya0ZUOOWFxAyntDISdkmTCxhkgIS7wG84K+1Bw9fwF0/yvNUpIA/Wr2K92cMS
	B1xk1Lr/e/tqbIcctUw7uoK+K0YPPm4+owErCqf6IFU6A9S9w9JsopYP5vtoCbWq
	R2VprTMMxxYcZmKDf25fBN4fPpxVrUPFtYF45Id4wvUnCA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9xwfku54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 20:22:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31cff27fso21191421cf.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 13:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775247772; x=1775852572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4yDt06DKkjZYPE2ZQ7EPO/dsrviXxjbdzSBRuroEz6I=;
        b=IiFAibC7oHHv4n9LsZLi1RCZ74CsSO9P/lLwrWom1tnpURTpo7ZqBZM0L7ZuuNk6CL
         7OsPr7/KOfegACit/QwZi27pqux2Z5XwnLkrB15QgYiwpPSyIYgqJZkpqQf1m6AM2LCJ
         rYiXYKyrO5uIBQWXbWRgmC0vVYGyzc57hFcdox7Cg7/of8m5Tp/Ne5C7exy6ULvokEYl
         /X6AjAKiOpU+NaCa4/FGfhPyQkWSRzvLisaa+KoHCi685JZBY0upjfO1UK23qTmSCIXl
         yMpf8bqdoQ2C39XjChWxPa4eWJDWAe5J3fBsBsY9J04wB+vMuZTi7xl3/ui/8wZKTror
         nIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775247772; x=1775852572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yDt06DKkjZYPE2ZQ7EPO/dsrviXxjbdzSBRuroEz6I=;
        b=haRc0jWeNvYb86244ULwUA5b0kUAGHhijtDkaHFqGz5yJKbIL/nTiEp4MGZWqiNobK
         MhNFDeC/pBHXx0bJOM95I2EZmhm2qJ8tEJQ3zmKuoaWbmOP2EEv4VENqDIrnkgpmeWdf
         tco442tPiMnVywpE3SfjPjIo/0DhVENLa/lS3DO/a0hUbf29SSwpMNXwbbacB9vthdMa
         AjqShZ7Mz2xmGC8EbIb3kq0U3Y9wWQCfPkVb1oqyEVTnWGjBMVC98RUJSQ/5pIVHo/2B
         EwFpa9Xqp8a9hJ02jk2scDi635fbwm3nCBgQxI68CHeONKjUdPUAtpbCEir6iBLkVTHd
         j5Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUnoj7rNYJ4sRatQQQqwRdSGiYqbVTPOKdHxTaaSGoXQRsp0Si3FOhdqqCYE7SnmTuEFmChT4mRUL2t@vger.kernel.org
X-Gm-Message-State: AOJu0YxYICH8pB0PGAo87/jVhszAGXP1czVZ2+rYF4p3f+YZ5C/hDIKp
	jn5+ln609+dVBnpUYlMcYktlYf17zK7j7Kmr3jBpMuNAr6pyOGFAKu0LSyiAZXHd+EtTM8MrPsW
	2bO45zcie+rXumbtf/99ZsIXpGbzkjOy5mYp/XxMywHFhBG4Nq6fhmEEzHGdfYhWT
X-Gm-Gg: ATEYQzzPFRxTFWQdHwlEkw1xCaWmTI+jqIxjV7uaHvoaJnPCXYD5z9EPvh8lGODzPYE
	yWpoxEeS58Tb0cj5zv6Nv8lpI8K9SHBn4frcVwYrHulplJNzB0CpL8ath+/Su/m7xg9t2Qp12tD
	PGs8Liq49jY98xwlOWYcItZ9NKwi0+yeIh9RnwDFG7fW5Uh0t3133581zQRlPNuopLqkv4Hua7T
	pDvTiIzvTsmqz0S0uziRwsN3vUi5u0WFwINUrCL98MGnb6gDZLeDQlcg9kVmwovkM0THTiGJCi2
	WBT+AVBeK4ETIWP+mvcSpREEMu/4vtb4GyKvlvgWLohpcrCrovvN1aj14DE0vH4lfmO0aLVyX8g
	JoUHYcQrOImZlGwrF2glt96Cu6r9wUSvcmvOpFwgd7uWUaZa/4zCwnGUBHlCzYrnxHE+81JuPKs
	KCDTlBje8tmhvQ0zsPqW9EG3t4uPdXLVzSDwo=
X-Received: by 2002:a05:622a:5918:b0:50d:6baa:9e9c with SMTP id d75a77b69052e-50d6baaa2e1mr38237381cf.6.1775247772048;
        Fri, 03 Apr 2026 13:22:52 -0700 (PDT)
X-Received: by 2002:a05:622a:5918:b0:50d:6baa:9e9c with SMTP id d75a77b69052e-50d6baaa2e1mr38237051cf.6.1775247771565;
        Fri, 03 Apr 2026 13:22:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c97cd008sm1357566e87.27.2026.04.03.13.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:22:50 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:22:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Prasanna Tolety <quic_ptolety@quicinc.com>
Subject: Re: [PATCH 5/7] clk: qcom: rpmh: Add support for Nord rpmh clocks
Message-ID: <fnugbpprfyhisikdxrimmmumf7u7frjatjs253flet7xu26nz6@d5wjpz4hchg5>
References: <20260403-nord-clks-v1-0-018af14979fd@oss.qualcomm.com>
 <20260403-nord-clks-v1-5-018af14979fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-nord-clks-v1-5-018af14979fd@oss.qualcomm.com>
X-Proofpoint-GUID: fp3WO-RjcNbUTyL55qiIHIApidSAadxD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE4MiBTYWx0ZWRfX/I1IxnVugoNZ
 kNzuxrCHpH5sDQfGKB/Jn/63cZhDxFL63AlphbzL4unVsTtlZO6StzsWwTbmf9EzwFvl0EwOeB5
 LxyeFix7Q+WpLdz9GY4LT31Dn6vE3mkL2JH+Q9qRRS7n6OdPxuuvckVnSPPcRUBBzfpBm/72s0S
 DWhwd135fipAB1M1oMeW3Ai6fq0wMlH3uKLfMPanzgtsqOFntiiHvI93PvNhpqpiuDZeugsc1TZ
 cnVYBCuAgtQ9NvrywxrjLMQXFdtjNnaQSV49A01zYb0vhmdyRls6SCp+ewjHS2TIi39epayZ0Pv
 qDdHmu3sEVid5eFgH3WKsdGfbOfk39YS5GvVXmbVpgZUiq6tSaiVt4kRm7AJwpb0/tf1dU8gRed
 MnQj/ZUcFLmbsq6Gn9xFQurhb/t4Wu1sW4IPYxmzZCzQJzPeGuhkDh3cve5H+xY+8ccBW72siBd
 3GqK4jPAt+6nBti3vhw==
X-Proofpoint-ORIG-GUID: fp3WO-RjcNbUTyL55qiIHIApidSAadxD
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69d0219d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=BqJ7pa9g7VlX8Zvc9WEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030182

On Fri, Apr 03, 2026 at 04:10:53PM +0200, Bartosz Golaszewski wrote:
> From: Prasanna Tolety <quic_ptolety@quicinc.com>
> 
> Add RPMH clock support for the Nord SoC to allow enable/disable of the
> clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> @@ -1054,6 +1073,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id clk_rpmh_match_table[] = {
> +	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},

I R-B'ed already, but then I noticed. Please keep the list sorted out.

>  	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
>  	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
>  	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
> 
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry
