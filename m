Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E13E0080
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719173; cv=pass; b=lhcx1zV21F0FSECKr4VH3S2eMRWH2ainKwq0u3aN13jVU/7sQCNcWJqXwmRVKCRmIz+GaJS0kX4xf40HTZFK/wCybH6tf1uU1S53BnqyXB9w92cnVIBRvcz0cX+llZPKmvtoDfiSPcZ6nPez/kWladKGFX5AQ3tHeI7ydvv7Le4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719173; c=relaxed/simple;
	bh=6tHTC7dMaWLutqIJyz+8sg1I2A6BctzDU8v6IomSqhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6yh6st0rnuv2X3WjFE0M/ZnleBGEGnmGIhIrO5oMi1KpEzxCKvKeWhlhDj4RnIRCFIFvob8rlnBQtWhDu2qbQGSSYXH0jJDwu/AYSTI2VPx5Po+8TAKgjmzTJ/TlXtQwTKj9t8ONtd/ulNzy53qvRjy5huEVJCovv80NpqSKyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lgvgeeg6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDiI+9sL; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lgvgeeg6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDiI+9sL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T72e8x2164000
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aCQLcRC1jMG+f6yczHRsyvOb
	Q/+zkZyDP00/2XGZBZI=; b=Lgvgeeg6WRX3ChCWVb7Zjr+1lEBKPEhEWoTwRy0X
	zrB4ISZS9/UrBNid1MyEO0gkCm2UhgGgPg3JP2PuXfTR2LYGBjeoWnxCwgn5P1y3
	3J+dWClruo1XSmzkbyKNp1cOR1VHfwoKTIzL1bkPV3BxjqDazPV/ENeYkziIPHcA
	NBXVdkjKOlJPabRycshqHHbJAa71i9fNU33FLWhWHkyTumR+AoCV9BViPtbh7BTp
	oACAW0SGpY+uZKSgNIr3LdNG0U6IKgy9M7zq1fXF+1/F3o3yGWPqehpTEuo77qH5
	qjqdCkxNO8HTKAD5gjT6hisZk0oZtcdk9urq8dvISvphIA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjg5wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:46:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca0331d0b1so8924685ad.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 00:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782719165; cv=none;
        d=google.com; s=arc-20260327;
        b=QjevrJ6ADQ9fNNWg6WivmBYr9y1oEftZoEuLVq39vYqwEXGJI3r4fH4aMve/hmuSQo
         4Qpy92uGB18eQ4rPkZeGQjsXnCgRUdXVSVDt0y4f5tpRIya/C63Hb8qgHaBFmGJzF7bD
         FDvQozre9rLu84l4GGGnAn8C2KHWLh5vhAVKQm1Kt1xgYHP5tJRD8BeSyPRCEsCGe7t4
         ksAdTZLCKJ7ft+jobaMn7IqgKyylVqZMC1NeL1b9HxR/GFiNoZfxQZYxTh1TfCVK0O0v
         RwS0vUntLyBc1Cr3rv8BqTziM4E9fwfHqAt28nDmVy3EZl5lPwn0ImdrhIUIKtojURGW
         bJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aCQLcRC1jMG+f6yczHRsyvObQ/+zkZyDP00/2XGZBZI=;
        fh=9UzCMN1OfHVYnx9KoSrCr8dyYdjuM6jsRX4lc3kLKUE=;
        b=QZ+n1ksYL3TOO420Wunkdqg1vrRF1KaSD7lfyyVwUt+qFvIn3fyzrC6vihGtgAEDW1
         lNmntEgtuicFUJrCXOXU8xn38b3bTx2e62wsOkol+scflWt8JDcOIVD8Jsy16eKK0VHo
         RbcGzWaGNymdC+yV9l8ChTmnxJc4zkTWTj3DsWJN1OyKVRMFxSa7y5h39Q4QCYb4y5H+
         OOfW+ltyjLWnG96Ta/gAysnwxCQ1Eif4v3hId5zNryr+aigsM/7dFLTiOvyEQkCOVDvr
         NTx4/NwSpdFJUzVPlyPNgNxxZ86ahUO0ExieLcZAQn/rXDItOrgdZ2/f9UXMSjn4IK4s
         hjgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782719165; x=1783323965; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aCQLcRC1jMG+f6yczHRsyvObQ/+zkZyDP00/2XGZBZI=;
        b=TDiI+9sLnJVTbF4GjGCZmesYFIgIwvN3Jdw98tYbw5qJEzztl+OmICY+e3zR3T5c+y
         weAutzS5j7PUrc/+T8aeNh20vW3/TSfhcW2ODkTYwv10C+HfX7D+heAZOtFeOl4ZV3va
         zJtioYmmUlXLwKBdUaZBs3+8igPoxBGC1I4I5n7UQd0nD+F0RtsibO0WRtdBin0txgVg
         WmjyTSuks9O1LZIgE2P5jxcUfxrHgfuLUiHq8EHc4x4z7rz9XRtikp8blMBAD8Etcqp6
         RdIK6eiV1+zlfGdH1+qPFNJC9RQPPaK3q2JfffNGmYn2zqk0UlHmU5lO+LCltoDVYwSM
         y68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782719165; x=1783323965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCQLcRC1jMG+f6yczHRsyvObQ/+zkZyDP00/2XGZBZI=;
        b=h/VGDbW2WHlbrie+7KgEJJPV7BrZJOKj1rpcQ/XTeghxp91YQb+t54k71xheAtRjku
         ofKFU06goZ3cUg5BKxoS10kuZQziw0tJBsphP/DpS+OIjIVq/fDlT9Pd6RTqioA3Gu1c
         HwfzFKyswNQA+lkNwY8Rp9SVqg5ZGMPDpjEqONMPz2XIfSunfSYZeKeRAOAsVDDNwnMc
         n8tRfDnU8voc6veaNDdQ2YjZ7i4yq8Fb7pcKm3q2eFKqNm0T9XkAG4kz+hoExnHEmR+U
         N8jKniisHxYI9zn//XyRpeTOIAVYyXhij/NJpEE7kKCISa6PS4QjC8h9kfjCh+D5AoQT
         S8vw==
X-Forwarded-Encrypted: i=1; AFNElJ/8c9xWFVf54142OA3mCbNqZbbxynBT9rkpA2l8aH4VEW1ZN8ps3y296dGty0If1z6RR197xDqZ/S+P@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3qqlHtsz6zg0lele1oLrSx9WgMc4Y9I2pWDttFV5xcIO3X7f7
	bhRqvDcVRSYabLnatnFs0AHvZn4n/8fO/0bGNrfmjndxabQr8HkIAhBTOwuSNTx/+HjX8iZVy46
	xv+6+90P/nezXTMx5zeGdCHCvkxIG6ifHG80NEVPckhExbQK6h16pFP3fjazZBuWFjBsiXJ7gDN
	0TMYF8WgGmxhwwuyVQFp8rXZJQSJJeH+uLWYOAJG4=
X-Gm-Gg: AfdE7cmI9ER1D8musRIjqsVIzirMFQY1LHXMD0h6wV3mKkb0+IIDMor9FrjBcpAVEP0
	k3/WqYxHRT6jh2Yw7J9Ym8+4lRE+xIzLauxFn+O7sV8s2gB8hA5mlsNqhXXhZ75hRWcYk9LaLPh
	3MZ+J8l34aAvLXpgsU+nulq7HJMGIgwDsiWvNeEPApK8EZYidu79vZIFV9IV9PYHjuR+q4WR27+
	ph8NT27N8YgbmI9L3Hlmjxjo7Yl4Q==
X-Received: by 2002:a05:6a21:694:b0:3bf:6c08:fb93 with SMTP id adf61e73a8af0-3bf6c09147bmr8846519637.53.1782719165185;
        Mon, 29 Jun 2026 00:46:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:694:b0:3bf:6c08:fb93 with SMTP id
 adf61e73a8af0-3bf6c09147bmr8846501637.53.1782719164714; Mon, 29 Jun 2026
 00:46:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-1-449a402673d0@oss.qualcomm.com>
 <hwn2kjauk3xt35cwmv3ludr3sxrwklf4n65p2tziox6m7req5o@lldl2cztbqi4> <276e001a-00a4-4822-849c-f1c0879b81d5@oss.qualcomm.com>
In-Reply-To: <276e001a-00a4-4822-849c-f1c0879b81d5@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:45:53 +0300
X-Gm-Features: AVVi8CcZBxmYWaIoIL4LytxUTmmGJMy6wbU3f0iW_j9dnLWGAuso1nTRnz7u_UQ
Message-ID: <CAO9ioeVq1UHC7w63vQOo2-hxZ-d=N+XPXrU8W4txXsDXqOf6gQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: shikra: Add MDSS display subsystem
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: a6__sl8UGVqcsJMLYBnuAcltu5yp56U9
X-Proofpoint-ORIG-GUID: a6__sl8UGVqcsJMLYBnuAcltu5yp56U9
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a4222be cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=7gqF0e2FHWVQxZ1fruEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MiBTYWx0ZWRfX78hxtZDl76el
 J3rRsnnqtpAw9qujUk+4v5pYj1vJPeNvYmke1opechsEb74aDuBaTxUaFSs8qZOe8INqMJ04RPj
 RE3oBEWodHTPugIJKJh/tiGIxQX5kpQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MiBTYWx0ZWRfX2A0o3vooIOMb
 HGfMQwADuWr6xmc+8HTbnDf9DDjrjwEVFJkDpXfDX6MW+LNucveuGhzPGiYCfhHlsSOzixgkGv5
 lPDzyCvxcoYdFOiIWZJGGaDcF8omRZtE36h+XoBCXiPnx9T2UHC34otEVF5d16kNgFa705bGT5R
 cvfTJRdMrdTM6slzrNk2LV1oJg5gnEqEnWFh3Vbnacc3tPfLeEo1d+wiHAi26inrRuY9TUA0bc6
 gE9kzArqCRFn57ocsWsQwqrRdJ0ApEd/C+PIjoKOrZLh0+JyxsiPjtOZfUSt8tU1rouSuDfOrvH
 z/jXfLBP/7K7Sm6jQFQlX14z5EZEZBhiy4SjJReDaM3ks2HXukR8/QeM8DeAHRdML32RO6hW0fN
 5Hx4uqSUR/+6jjYl9dn+mOMvJLYrgAyPCZbn/Zxx5tX9NmxyswyWBSzTeyx63aK0GJxQxWN2WfO
 JGZOypfNhl2GbzJ2WZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290062

On Mon, 29 Jun 2026 at 10:25, Nabige Aala <nabige.aala@oss.qualcomm.com> wrote:
>
> Hi Dmitry,
>
> you want me to use this generic power domain index ?
> => RPMPD_VDDCX

Which indices are used by the rest of the file?

Also, please , stop top-posting. And don't post HTML emails.

> On 6/28/2026 6:05 PM, Dmitry Baryshkov wrote:
> > On Sat, Jun 27, 2026 at 03:31:35PM +0530, Nabige Aala wrote:
> >> Add the SoC-level display subsystem nodes for Shikra: MDSS wrapper,
> >> DPU display controller, DSI host controller, and 14nm DSI PHY.
> >>
> >> Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
> >> compatible strings are used as the primary match with QCM2290 fallbacks
> >> to reuse the existing driver support.
> >>
> >> The dispcc clock inputs for the DSI byte and pixel PLLs are wired
> >> from mdss_dsi0_phy.
> >>
> >> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/shikra.dtsi | 203 ++++++++++++++++++++++++++++++++++-
> >>   1 file changed, 201 insertions(+), 2 deletions(-)
> >>
> >> +
> >> +                            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> >> +                                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
> >> +                                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
> >> +                                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> >> +                                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> >> +                            clock-names = "bus",
> >> +                                          "iface",
> >> +                                          "core",
> >> +                                          "lut",
> >> +                                          "vsync";
> >> +
> >> +                            operating-points-v2 = <&mdp_opp_table>;
> >> +                            power-domains = <&rpmpd QCM2290_VDDCX>;
> > Don't blindly copy bits and pieces from other platforms. No, its' not
> > QCM2290.
> >
> >> +
> >> +                            ports {
> >> +                                    #address-cells = <1>;
> >> +                                    #size-cells = <0>;
> >> +
> > [...]
> >
> >> +
> >> +                            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> >> +                                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> >> +                            assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> >> +                                                     <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
> >> +
> >> +                            operating-points-v2 = <&dsi_opp_table>;
> >> +                            power-domains = <&rpmpd QCM2290_VDDCX>;
> > The same.
> >
> >> +                            phys = <&mdss_dsi0_phy>;
> >> +
> >> +                            #address-cells = <1>;
> >> +                            #size-cells = <0>;
> >> +
> >> +                            status = "disabled";
> >> +



-- 
With best wishes
Dmitry
