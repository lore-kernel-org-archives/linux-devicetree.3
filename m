Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CBE33372A
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 11:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782645468; cv=pass; b=aPpwofkU4iJX/U/nJ5cvMvfsY/kjtkkNF/hpE9QkTb0VrKnxwUMb+Q0yXbDfaSjDoI1tZOrGufhdTAs+BSVCRUHfn8gpF7vxTfbk41mV5ZDLU8Xix6OINaehtKoI+fIwsYWxbgv445niiJ5HoHPy68CAYi166OkDWSkoqoVtYr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782645468; c=relaxed/simple;
	bh=/Rom9OzbBDvzqL47K6L16xkbWk+al5r08XLPE9atwTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLhpbbQ7pMImqMsmSPnEs4Mx72Qhdg6Wa+xjgU87dbymiWDkjWeL8q0WBQplruO9xj57Rxi/Pouibu1U6T/RUtTaubhLWx2BgoYZ4m12XdaY5iTETV0/oSN+Jpv+NX9tgNCH44YuDV2M3/PESjgEOGfdhDuByZTwm0ckntgzVao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtHxviPO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKjpTPgU; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtHxviPO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKjpTPgU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9Q39X3592961
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 11:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=08H1iIchRh/u7bYE0GFBizac
	WQgfsaPUywhrusHq414=; b=TtHxviPOQTL9MqGBZEIEoB9adv24VdofDwdz58Vg
	OFyiXkmxHK/xu9KlGy9Kf+kO4W69fV/upj6OTYdz3ifPQwK9hQ4NWu9tyw7tXBFq
	54TxOmkZbyQNBWYaJ3K/gYGSk3c/VtXsdu6S9lz7EyiqwF5VDUPpHs90C6ESG8i2
	DscUvCUL6qYIyaXPheHvznX10ZXw6kNyhKuYK5YM8FQqcucSW5KdhgmdqdC+yaiI
	3lO4fRh2U7xEnOLy1/aJ5AERBO5rNllC0EKQf4VPLSOoSJcmKLFug6qAR3ZDLuwi
	0ejVGLgrQDFS3Q1LQvVzJAY9Z1UuV8nWS/VUr/0tAf+Z1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf2nbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 11:17:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38001e788d6so65169a91.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 04:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782645465; cv=none;
        d=google.com; s=arc-20260327;
        b=Eh0fwvuewcD++ZVAm0+W+vPUfRfyxXIKT0LKaqbYy0rIsQlmnp373djspKTzMks0va
         /6GIqLDQKvQWbjWu2k/xLtQoJOhMHiWJ9OX4hRhheo6j2O/ikMS+RJzPrH8YwebAn0+B
         xtyey4DcrK60X7i2Gf0E43dwIPAd0mqiPh4XH+OBZJHTq3VcYHEsaWw7Myts6F71N7Yy
         MnQd3qjn/2wUcGWcZIPolFKfdW3wt5EKnoc/Ozflt8A3Dh0endKkXNP9Mz+FTiwiNyWo
         5TBeODknPVg0WbOR3nJc9BIFa5/kQe5IXRhgiskyQJnBEZA8G1fDBrQTeqwOnZ17qDMJ
         tolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=08H1iIchRh/u7bYE0GFBizacWQgfsaPUywhrusHq414=;
        fh=j/tVM0R+4MgnHhcLMIJjJG8v7IM5m4F8eLnb+smmkfs=;
        b=Lqr9pjtPuWbS2f9sJAdWMoxKKeDwiQ3o/6koDcD9Yw8SYLFLzFF8Ulzetxfe20UU6j
         lRhrKOcNZOwlZkMM/Gmkmh0r0Nsy8SlV6rfefb5MFQNXyKLKxqY0zFxm8UzOjOGjrTEt
         NlOAC6ll0H6A543ScphNbBZ/YKkA/XgPZ6OOOB/vIckjDtha3Bqm+Wf7PYFdzCHgQEeH
         vZoB7hmz8f+4mtajWUnT19shVv6XnL5irir2Ue07TlcmmoR1TL6uUUb78UbgsIq0dFpZ
         0VyTLEp6MBv+vBViJfn+BUClRADD+yqTbkYMAEVYhNbfGWdyqTaCxCl9jPIJP1NX3FOJ
         sdzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782645465; x=1783250265; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=08H1iIchRh/u7bYE0GFBizacWQgfsaPUywhrusHq414=;
        b=SKjpTPgUGY5sFI052cjMVYnF2i/NEh0t9gnEniKefGnVjoUh/2K+2rokZ12ZFDplZu
         yTF/IkYS7z08OuXEQYIm8qO4YeO9yrimBD5mdDgfz5J0xX2+FmnQ9ha3QI13SOQ64qo6
         N3FeRvBc5n0sKXXVFV2cNNYfDPLNPdqdU+lz1nF0iqaBVYwz3plxmSUyo0r2CyN2+NxL
         KAHnEO9lsM2H7hX+uaNVCyhPJVVMou8GJDeRQk3Nr20dQRMvxHAJhTGIMBdQ05rSvCiR
         8XxUjvCzhthGKwdWPEVigBtj3h/E8TbXA97VldytekXuza2sLgpybtjrfHcoK6cNd/sX
         NX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782645465; x=1783250265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08H1iIchRh/u7bYE0GFBizacWQgfsaPUywhrusHq414=;
        b=SviNcPmOa8qAwBXu7EagtH/K1jf4euD+C08oJlZTM5EcnkrpZaVUchLZb5vJApCdZJ
         AYBL4yv+Ya8p59gcUyDCradhF1kXkgKF91gOLelo6Dl2c/vomrrk6pfBLCAWZ90TBMr9
         pscXHq3E1ve2iXH4UU0naew3FEGBn0jCuKM1/1QZcJTwKoJblu5MQwa4aAc47eSMZLPs
         /tZ0dWTSgE02AqcjOWdqo/lxJbkQTSfDNsNnsPi+EgYIYtz5StnpOAFK7pA6tRXTQI00
         sx77eMf9az0vHO/st/lp66AAaWKqhl0b5U5DopLFowBlUf5z8tc07aM6mOwKuZDCPtYY
         dW0A==
X-Forwarded-Encrypted: i=1; AHgh+RpP3I5LHLajMxjH+0VIBAz6dOkVZmBWT/X7Oe8MjP7BsKwWAUYfp3sFcFBkBDRZFtCCc33k4GHIc1wc@vger.kernel.org
X-Gm-Message-State: AOJu0YxnsdgxIzJV8mbnmosW6SqLUwGwDJn/zhbJXcpIAwH7rJr3Fz28
	+1+fgjuyJ21mIRD/p9gKXQccOnw44zQjmeKxDMPf2aThQfi2jVPF1olqdFLcOWrgkHFW4ftosrk
	LAYqdZiNeMpQGzeXnJCao0iYUZaBExtlXpcOoRkyRQP/XJoyiQUptOeiVes8QnfJ/sUa3svgDSl
	Q3uBPk/FqwNy8atx7EDwMUi65zmMcn8rbZJLoP7KE=
X-Gm-Gg: AfdE7cknb+auRT/JpV8AEfQVFQ5xXg9nBBGapeZa+0utrJlyeL41txf7FBKFC6ZiIYg
	huDGsVshC3WWgeduFr5zRamiV8OZC/uUeYk/9DoxPdZs1awpZGY/QezSvIQE216QrDTxWkeL3JZ
	7dO0w+LHclq32iahmgQBcIQ/DXx6fACLwcnqWJ9NWy/RhZM5Ti8OJDzroLeqkM2fkgdvTZaKyBB
	YcwspLSvbb3QD3QHnGulIdCCjcfGw==
X-Received: by 2002:a17:90b:3fcf:b0:37e:2053:348f with SMTP id 98e67ed59e1d1-37f817e509cmr5371899a91.25.1782645465303;
        Sun, 28 Jun 2026 04:17:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcf:b0:37e:2053:348f with SMTP id
 98e67ed59e1d1-37f817e509cmr5371886a91.25.1782645464763; Sun, 28 Jun 2026
 04:17:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <20260429-kodiak_v2-v2-2-c3a703cc30eb@oss.qualcomm.com> <hej6absxu6nsuktv7tsegduyrduv7diq5zx7dt2a4xp3pe6gxl@b2xscorilbvn>
 <akCFlxiGT-vHNM-x@baldur>
In-Reply-To: <akCFlxiGT-vHNM-x@baldur>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 14:17:33 +0300
X-Gm-Features: AVVi8CcoKIG01MrYDJCZXznA7AF4_rDKObCyVvw0QuDn2wAQl--Q8li2DLWAFHg
Message-ID: <CAO9ioeVd=fcd5SF-J8Vo9DNEz_QzyRvo25-7i-FxGUv3j4qbAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kodiak: move dp data-lanes to
 SoC dtsi
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDA5OCBTYWx0ZWRfXxxhXmv7XtjEm
 98TQ0Tnr83S2DFGMhLbPl/n5AIci8KWHh/NBnt8ZCpdH6R/txsHh6U7Z83jLSMl6gvohysCpboX
 h6V0PgOS4JXckU5WgZjTeJcPAY4dWyE=
X-Proofpoint-GUID: wi0HPf-tD-lqanKmEUEHvkfSELUT9EWZ
X-Proofpoint-ORIG-GUID: wi0HPf-tD-lqanKmEUEHvkfSELUT9EWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDA5OCBTYWx0ZWRfX7NOwHlkF5G9I
 3OmszX+PQmx+XngBcuEh7dSEY6e28n3YElT348vDo06haH6k0HRw5qS4FLfaGtQyLTw26RZ/2Ja
 uNXrn/ekFs59+y2YoFxP0L0pYGAlAgBlvGea2QHYQqqQ4ts9da8NVqtHxwglq+x3+XETWp45AXt
 fWIvsspuXsMY2HKnXgHq5/5iuWBdGRh4niRxbVwJWpi4KDI8Iwi3t4pJdEoeUICSCIGJl0cQJv4
 H+xYBSLr3B0GI2c49F1GRVxJdPP77iz4xPj8OeATpSU7pTL/90CnZnlrDXS+5Ri3/M6eO6Mx0aJ
 4WEdFPtEkiTwappgbzPq6kh5FYszk9yXhvoRUAR9bi6EilV64uHbl9tzloO7OcybqEOMeGfktWy
 dse+9lt26hab/IZzDKVJmjKkJE5Vx/mtZ+Zedy1RcMCDy/IBPkia/e/udMfTkVuTb30c5vZ+UQO
 i6VjFefX+RGKEYF9UWQ==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a4102da cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Dppsg50_g3HS2MGcJhcA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280098

On Sun, 28 Jun 2026 at 05:26, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Fri, Jun 26, 2026 at 11:50:40PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Apr 29, 2026 at 12:10:41PM +0530, Mahadevan P wrote:
> > > From: Mahadevan P <mahap@qti.qualcomm.com>
> > >
> > > The connection between the QMP Combo PHY and the DisplayPort controller
> > > is fixed in SoC, so move the data-lanes property to kodiak.dtsi and
> > > drop the per-board overrides.
> > >
> > > Also remove the redundant remote-endpoint cross-links and
> > > orientation-switch property from qcs6490-rb3gen2 and
> > > qcs6490-thundercomm-rubikpi3, which are already defined in kodiak.dtsi.
> >
> > Separate commit.
> >
> > >
> > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/kodiak.dtsi                          |  1 +
> > >  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            |  4 ----
> > >  arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         |  4 ----
> > >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 11 -----------
> > >  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts |  1 -
> > >  arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     |  3 ---
> > >  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi                |  1 -
> > >  7 files changed, 1 insertion(+), 24 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > index 96ac3656ab5a..0acc6917d7aa 100644
> > > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > @@ -5704,6 +5704,7 @@ dp_in: endpoint {
> > >                                     port@1 {
> > >                                             reg = <1>;
> > >                                             mdss_dp_out: endpoint {
> > > +                                                   data-lanes = <0 1>;
> >
> > This is not true. The SoC has 4 lanes going from the DP controller to
> > the QMP PHY.
> >
>
> Does this property really denote the number of lanes and mapping the
> internal pipe between DP TX and PHY? Doesn't it tell how the external
> mapping looks like?

The external mappings are described as a part of the QMP PHY (see
sc7180-ecs-liva-qc710.dts as one of the recent examples). On the other
hand, this property should describe the internal mappings (i.e.
platforms should have 4 lanes here, in some cases in a weird order,
like talos.dtsi).

Ideally SC7280 Herobrine should be updated to follow the current
style, but it is complicated as almost nobody has the actual hardware.

-- 
With best wishes
Dmitry
