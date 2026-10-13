Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958216AD4
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 19:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919937; cv=none; b=j5CD7730a+LMAwd2XIhqkzqxR0eUAXtdeMtzWcFk4l+SSoSj179OCAoGRGWjRhWXREaI565C0iNkrm+qst0vwGmovuMDfPK6FLBJmZUSBm6G6juaI/gM1/JAY+J/VbPLw88oSJnZg3vEOB36no0dJzeykTBfN4IVvINJjKIaCOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919937; c=relaxed/simple;
	bh=KKnKl+kEpHM9Q5slF2orkEHPjvUeCE+p5oGRss8bTY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOu4C0/N7ojO/ZIg7UiDSJ9StjSD+EXUU+UZ2MRFp1yxkKpXxEUHHJwmT9S0P9Sfegh/F6hrlGTq61blzmvKt6Mp91I7Ki8F6NWvcyyC1tb6wFq4SWw9SoFOVSNtPwwIMjbPS2N+85U2tVTweV2JZ5dME5SxujOZMd1N6nb0Ojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAMFoMXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8y6yCmn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAMFoMXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8y6yCmn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHuq0P1125185
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 19:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VqPMTRpakh1qxvavIfVW4CR/
	DB6TqX3Zg53T4Y+hCZQ=; b=hAMFoMXLp/ix7dIcAEaqhhAzic+JM5Llo66WMrRa
	2jqmKNRtgTti08cropuG1N16gaRP9X4eyC1Vgk6FhziXISql0CrqtkR7zi/zOs8l
	vRK1CuplQ43kgddSNjUwDNKgC4yBcRfpK54x4GeEijyyZFPgkDSeve241tKxkPzK
	yEwDQwVpc5VUJyXDtbTcvD39dg14w7VjJLrQIsoi8yFs6vSNV+GKtUiIYRVOsONo
	rc1GQbxEiU2dy4AYGdr10FqA/4A+074+aq6TEv7f6QAfMzE82Pn0UA8Q1rbcW8cj
	ncW8sFQ6B1TSeRlkPUwtz14tjDG0oeUTeIazdX4ZgO/jDA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sg80eru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 19:32:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1de6d5c3so761682185a.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791919933; x=1792524733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VqPMTRpakh1qxvavIfVW4CR/DB6TqX3Zg53T4Y+hCZQ=;
        b=b8y6yCmn8Bd/XoaCuc8tszqbdYaG3923b/4VDQ/6xjOoXzfbwDvl1B2MRifOvEw6mb
         upd/dH2cGLeH7SL0y6cdtXM9bwpmhxCAFnLyQ4az5ALmKTzjfUaizD2H5BZ7axosUgBH
         GKYexjkCh2pd+l6y0+O36rybJEa4Dmgw4c1PuamhRUZt7Hxhv3mFuYpWwNQg4v690qbz
         z5lFCIDf6asr+PTpJOWsWVUSzaedSk2FD0ByNixnS0UAeKEMCJJ68UKVAo2oVxmoZhBG
         xxo28KaOxWs/SBbPIr543QscgHwO2ss2/W/YTqyQD+wgcjL7q+VSk38a8ko/Kh7QWyX1
         T9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919933; x=1792524733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqPMTRpakh1qxvavIfVW4CR/DB6TqX3Zg53T4Y+hCZQ=;
        b=wvmzSHAqFbEyl/NcPAj/1HFPkjoV5FZdukvoUE2k5JvjkdLP1IaE2qsC8RK8l/2tsI
         QnTOkiWHHkySkysp++9jOTIYcQOngwOOXsWmpprLOYxdbzaK8hk9g95LfFUDcJ70WBBO
         Eub5tfpM/P/edUjR2ofa8IHcz9bv6UX59P0T4cugujpIS2RJZ5KKnTMCKenTc1mG+olg
         X00Pc8Ts+vJUnF7dcvZe7TwiZZXGDHOIMyL57tHYJdxr6+BXP5Don7bpDDva9nCFiZFG
         30QaXSB4XLSPHRDR9gdQnvLb4SnLaoLTysRH7omJTzo1jNt+J3r2FfBAwAdDnKt7ueH8
         tahA==
X-Forwarded-Encrypted: i=1; AKwUvByScLZQkav00ZLw8XAz3VJwhUzqQzc8/ErNRSLrp/BqlvEhyM5ARx7EyQlyRWRn26w7imkiMYiCoe/b@vger.kernel.org
X-Gm-Message-State: AFq9FYI3elh+enGoDacZ/2XLL+FI+8XErRjWgvYKsMCsnA9WHx305bnb
	Us7UFDoT1Tt1tDryYBHGQ1DSH0rMcEcXOUYXWGplUWRBWYtVPPdbWWP815hJUTUatM6+NIPEVqJ
	jIWFztyy2nv+ybX4uFT22tM1n7CgbTCf9F3Mx7HKpRBDjhH9nChfLpm4fAkvbkbZh
X-Gm-Gg: AYBFou0XP806a7jj3tQJprZZkw7Raj/fViunjHztyka1/wJCPWYhcpUuI08o89DgF21
	+4lGJr0+1iWfbdN1Wy+oPWY5LxYxrzlvCsVmtWDMMrSSfKLQClUhtUFci/ozlSk2LGHuo/psYug
	hVGOd5zr4XBEiHf+RTdPJlmiAsa/d8/09YzSiI9G0FbHtfs7ChJpmwn6H3wfRD1lCCIIy0KRe+G
	hc4hucHQH7snN7MaSLW5mwUg56IK8wizIscknllLyB1LIEFl6Y8NOQLubSzi+2QOFbaKSRnzWjU
	W2XXArr7GsTUxfSbR5K6mqMOE/qTC90L242OeeUYCO3Hkh9x3DZ+fTHwDt8nfw1XcWj4CEyuQC7
	x/tPXaHDI7YEgXHqiV0YK46LyDKpTj3Y+1l6OBJFA+/SDOk3ktpBBSQC0BazvWJM19dLE/m0CcG
	2xfi0ahaAzwXQF
X-Received: by 2002:a05:620a:4395:b0:93c:b3aa:4290 with SMTP id af79cd13be357-93ebd20e63cmr2162591885a.23.1791919932747;
        Tue, 13 Oct 2026 12:32:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4395:b0:93c:b3aa:4290 with SMTP id af79cd13be357-93ebd20e63cmr2162587785a.23.1791919932103;
        Tue, 13 Oct 2026 12:32:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d7fd61sm132144e87.45.2026.10.13.12.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:32:10 -0700 (PDT)
Date: Tue, 13 Oct 2026 22:32:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
Message-ID: <e2na2pyjjlvnnolgz5sv26c22pzcv75iz42wtnaqnixzxmyf27@f7v4ljtsxb74>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
 <20261013-nord-usb-dwc-dts-v3-4-bcaaf3faae24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-nord-usb-dwc-dts-v3-4-bcaaf3faae24@oss.qualcomm.com>
X-Proofpoint-GUID: y1PGH0lO99glT59886IqbGniC6zTVrJS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfX1Z7wQZDEFfJn
 YGdL5Doh9x+yvEaQQ2LPMIQz7wvh046IsHxakSyZgs7ZS9kz2CkrfsWL0+JvRAJRMjacZG9dOT7
 inhppbfqEL0ZW+ThOAN1ua6FqCuyFPk=
X-Proofpoint-ORIG-GUID: y1PGH0lO99glT59886IqbGniC6zTVrJS
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6ace873d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=jKzDs__1sFnS_SVA_NAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfXyuTa6ZgZt/eN
 UkPTxTN0fwdzt1EvbEmtPGN0kYdk5T1vNozLedwN0SBgi3bkGY48Db4qk5xDT7qI2RE4vTEseXP
 LjjgTCk2h00d5DZYhIrdCxNsoZ72SI2DSSowPXt44ynTsHeHYrHGqxKLyNDDbQdK2PZq6GqdvYK
 qkeOSKKv3tx+t/aPILOtsNTERbt3T21B7ZJ31pOqgwtA9bg89UbgIlAyCXFcnet1T4Q3qCjlkOi
 2zlYnX/QeOX5coLK1j7HS0KHaN9qTteccT3WonJx/GffcFrmuhORSVdImK+wwyjHdQg+beYF/3Y
 dPSeYHnPrROb4XurjHUl4vtMKs+ItkpILXOORHI0xGdtSaR/LT/Noo5yggD8fVi+1veo6IUHM0L
 1cBgTqoUjd8gNkgOWhMll72rFRlk0vHSAdRxqZQKsKSZPzPN1LTtlKaNfSd1HwT3aijagBcgEhK
 oM33SIUy3JBA0M0u8tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130077

On Tue, Oct 13, 2026 at 01:34:49PM +0200, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Wire up the board specific pieces for USB ports. Enable i2c9 and add the
> three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
> supply and reset GPIOs on the PMIC GPIO expanders.
> 
> Add the onsemi FUSB15201 dual port Type-C controller at 0x50, with
> its interrupt and pinctrl state on pmau0102_i gpio8. Both controller
> ports are wired on this board, so describe two usb-c-connector
> children and cross-link their HS and SS endpoints to the dwc3 HS
> endpoint and the QMP combo PHY SS output of USB_0 and USB_1. Both
> controllers therefore run in OTG mode with usb-role-switch.
> 
> USB_2 has no Type-C connector, so it is configured as a fixed host
> port. Its VBUS is supplied by a fixed regulator gated by
> pmau0102_h gpio3, kept always-on since nothing switches it at
> runtime.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 222 ++++++++++++++++++++++++
>  1 file changed, 222 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
