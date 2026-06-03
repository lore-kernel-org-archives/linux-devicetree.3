Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B91233C183
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495228; cv=none; b=J/kcielAZ8rkiQO/bGRcbvhkPY0GxjV7TZayo2vp0QZDlhNIARYl1I8jXiXxX+MfJ+djyMsc9jiaA2RP+I1XTajIMPFmU2ZFCf9oTCGAbgkX1FGe9e9RTNXg2EUR1RZl08Xown+WgLvMpXgCygb2Pem+2vNRb9cUneMWM2xz/NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495228; c=relaxed/simple;
	bh=Mmc2d7zBm1iWxipjEaid3o9zeNASq3ftRZ002GwxKc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjQkMWXlZ1ztJ9EuQ9vTTkeKuzbsXP7Uybt+gHmCMxlNrqwC2y7vP5SpQXj6lHUleo4Eo2lz5wzmtT6ji6leO7Lmn9vzlMFKKTQyZTl0idKGI2zGReddFFWdyF5nSoBci6o/eckEg2iKpwhPGP2JAJZEXBmV7OGWxDlf+XkevGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2rA4Y0G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=doAsmxva; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2rA4Y0G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="doAsmxva"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395oXp780679
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 14:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9/bOeVPhoSAIurZMOzdi3+2T
	mq8rOt36OfI5aPW8pZ4=; b=O2rA4Y0GClKaJijcBDjsi/+AaYCF2wRbLro4nQmZ
	Vo1AqwwdwdFoxAsxIGC+8atTAssPhbhJm7AGunvScAbOkatwSUPEqmWbOTlE28rE
	6FkH++s5XGPd5IHrQrxhsON3yN8oE2atT1OUK2XFL5lHpo8TkBObRDCXbNROD3Re
	dccDSjSx2VCa4s8yx0DYBo4pNWITth4+nGfBM8jXyheEfAo6YJnr/txZ0G9Dq6OA
	hIfdJjalqu0KkCQ59YStkX2wujP00S0b/LI5pjFZ1B3s1av6cj8OnWFj1SZAvDvz
	3gqn3VRGYM2zMidFUV+iQsgNk44kSSxKl/jKO+Rxu5eP2Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb13fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 14:00:21 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfd2a26ab0so1709550137.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780495221; x=1781100021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9/bOeVPhoSAIurZMOzdi3+2Tmq8rOt36OfI5aPW8pZ4=;
        b=doAsmxvapn/hEoGFVgmcY+iq9iW6D7yhN+jgexCgKKyXTeC62WPy0EC4kZRpgzvHYc
         fuA2aR3I3JqsdQACa2tQPkAYQ2CPZdgn+2yNJOTSGGqMXnLZwfx4QKHfPh5eywN1Gx49
         SuzAVaWHyJmaYM4DBOOWbouYTIgYhBpvioRMCCZ27gOGe7YvfZmnImItMJcP6tDjaE6/
         6U2RUZfA5l+L8b+7JhAvhSv/JoU3PIda3R3M016ZP8CSQGvr4sjHVj9pLhqFx3NXCCUY
         MBhNF78Jic+8X9ZpliTQBfPZ6yvYgxZCk29/nZr7A4O/t0VTnyG50CXaSWA67yAk5DBv
         Jvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495221; x=1781100021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/bOeVPhoSAIurZMOzdi3+2Tmq8rOt36OfI5aPW8pZ4=;
        b=ldMSG0JCw806b2TZMhI01gazg7PLvd8mYWwpUsBpXT/dGrQiWKXMCQ9YFfpMJi0Ru4
         0YYB5lWfNlPay8FMVHOsIEvFAYWp2RqG7DFd/Ebd2u6JKzE7+YeBk6CGj0dX9x9Pv7RG
         slZ/FGgIsiT46KlgTpq8o8J35LSsCI4d8eKJKEEoBvZKVwSkSHoLqu67M6+3E8b01DLV
         EsSaJqTD5D5fv60qn0XdmGKe6oMWNsFP7Frc3OkL0Ux7o5MiV10JwtudLJrCoCgHKZ2T
         JJME65338vAAN+Oh88fjPrbh/gCLp3e51f5JMzUf+J9tAtshesuBE4jjnimYIv6pSqGM
         KcoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/drERWSFilI4hAxz/b8wsgoUmbZtiMq2Qlo4oYc1BzRAtTyG5STE8M46rf9ccARls9o1ObQUkObtyB@vger.kernel.org
X-Gm-Message-State: AOJu0YyVvkKgGEwOuAnyH0xeRf+6MFxhdS0XnJ+1+mRmQU4zxR7QRMdU
	xZ88veCI34lmVBNAwcaOoADg6MpIP+0qlVXE/r6TxD4djh0yb9lbp4d3Y3l30Jb/ZsjHNRQ6azu
	s2E+aTUiZXKPRPzBVvafDsW/8uRyH7j0vl03keSEJ+Qc0AqwdxJ4Bs6q5Cy0/BuM+
X-Gm-Gg: Acq92OFyYBs3rmc2i3e/WqH14IKtXwx03FOq610IBLYY0htq2gpsd14E0Lc9FlOLDRG
	kvid4BI71BQBj6dOMKXWnPA5UDZcsTzCJepaEZyHvihlYD2iFBJ1ROOse+TrlR2nzwgOTF/HfCl
	/yOjhobN/UuSkdHLpsmu/bCoFd5dA84FLJHNKauAVCN7ewhSyzXz6LWZ0tCE36ayTMtJKdq2ORq
	SODgEOaXT/ZKSODOPEPE6Mh4r9SkAxDwBGa9nvsgeapiENhONHD3Qfc/Nzb1djnCDEdo0STGBJx
	J6+rro2ae08KbKn4Oj53P049I7b+sVTXyHmhUqqRfm37r94gprj3lUk3bNAY0gM4BP/nOuoZ6pd
	Xco7pUeWITVWEhsExTAJHa780ib0wTH6CSAih1vXUtyg6Tn8T6HeYFhCbj/CptH0BjkuhwZxJ0T
	Ftn+AbBZRA/UkwSMiSS/wp2s0ZUki6nOYMtqDoyQuym++Cnw==
X-Received: by 2002:a05:6102:3e09:b0:6cb:d562:b96a with SMTP id ada2fe7eead31-6ec432802edmr1467057137.14.1780495221184;
        Wed, 03 Jun 2026 07:00:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3e09:b0:6cb:d562:b96a with SMTP id ada2fe7eead31-6ec432802edmr1467030137.14.1780495220739;
        Wed, 03 Jun 2026 07:00:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be038sm9721071fa.22.2026.06.03.07.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:00:19 -0700 (PDT)
Date: Wed, 3 Jun 2026 17:00:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: glymur-crd: Add FocalTech
 ft3d81 touchscreen support
Message-ID: <l3xx6wuhhrf3d3mdk5l2hag4hq3lq2br4wwbooumbq26konvyt@5aazqaoftzep>
References: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-0-3453ef577bcf@oss.qualcomm.com>
 <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-2-3453ef577bcf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-2-3453ef577bcf@oss.qualcomm.com>
X-Proofpoint-GUID: uq4xOMz9VMlHauGpCRiWKL5BuoYNbGwW
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a203375 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=N8g5PzzKtf87v6poegAA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: uq4xOMz9VMlHauGpCRiWKL5BuoYNbGwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNCBTYWx0ZWRfX4fYPZ2GjzhAJ
 2jbB6dC2ox0O7EOjKXhx7ar0Y3qi42F+ND2oojAzvPy7jmmW2sTYOtHGCcoZ3b9GScqeO67kBBY
 xD/VtHcCOm1CrwEtBwHJ5TmJygHuguV6nXEl/J60WEFV/BjDlKHKmdbGM8lwt8tZ1kROJ6Gh2L2
 Gm6Ycp5qAUxVs7DPaC0kgk0UIFIq+EByhU+K1XjsFYOs6D9fmb0TGYctxM8tqFx7evmwd8YDNbL
 eGt5dmXYvNrOEqOmOgaOvzCGPZvEk87UHKILO4nBeWv2XQsazEkfg8Vq3yeOMhqPDx0AOnKZb+x
 YT2X04EgbYsdwxmGtUQ9cDKtr3MYFr5ZOkfMrX5hI44B0zy2RNgfeMlbF3oGwGUqA01wAxes+GG
 J1JoN+LW7xK3lCcHb493d+aPXgY1fTukepbZmEgL/vm/7sWnpKGyH+WsVCMQMjPQU1+Er6L1KcM
 W4rQ8AtGvdAdxCwPH+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030134

On Wed, Jun 03, 2026 at 08:41:20AM +0530, Pradyot Kumar Nayak wrote:
> The touchscreen module on Glymur/Mahua CRDs is different from
> the one used on Hamoa CRDs and requires the reset-gpios to be wired to
> the device. Without this in place the reset line will remain
> permanently asserted during resume leaving the device offline and causing
> all I2C transactions to fail with -ENXIO.
> 
> i2c_hid_of 3-0038: failed to change power setting.
> i2c_hid_of 3-0038: PM: dpm_run_callback():
> i2c_hid_core_pm_resume [i2c_hid] returns -6
> i2c_hid_of 3-0038: PM: failed to resume async: error -6
> 
> The touchscreen on Glymur/Mahua-CRD is a focaltech ft3d81,
> which is hardware-compatible with the ft8112.
> we have added the required change in DT.
> 
> Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
> Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
