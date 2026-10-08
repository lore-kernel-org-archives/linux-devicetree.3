Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2E348F83D
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453235; cv=none; b=nSDYPOoJf/rhfgBhNcX2TQfV4b9ob8nds4M3YX+d5VcJFZaAulYMEoWcYeeYtEfVvsHsqv+myLIWqZcTLsI2Mc2EDZB/bcazqzTwCLllhTGtdOiWwidNgSLZoCr74G9qgbvDk9DuE4pdAGD/vTacR1hKWI2LQuEwKRUkkswev+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453235; c=relaxed/simple;
	bh=Z7yiThIhyVmO+J9+tKPLV3/vKur1OFGl6JNxfPU6UKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSsr3QUPdLgt7rux1MZxxHD2hnf40dX/BgTuaXgjUEDF3JPGxuq1FNWOpcXmfqIQ2EmHQn/RBo/nYLuePHZe0xTwoHI2gr5D04gjIZLM8ptQKlLBczQvZbSVF8ZPUGzkVjGGl1qXpb+SAErTEHVRX+qoFqYyRr+Cr+nQU1hEJro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZI1fMPm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mn2zNYqX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZI1fMPm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mn2zNYqX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KLgT1845507
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aMg1bw/vHi2bfRM4a3njiioU
	TDtr5eiuMVLzrt8P6+8=; b=OZI1fMPmIEeYave7maaJjpAYGKD1wEky29zJlhFb
	CMHIf9qIsEpqSRqY0SfMgpsEs8ZOu4EF3HLDn/faZUS4RKmlOjspWsR3nU/ZulQR
	mDD5GLnvE5iN+WjX10IFgh2U5IurmIQjuSG0sXqkfbUZWVHPGrNnnBB/EvqdKlhi
	237cmCb1FpkP9TQuaTSEsPQyvtl8vZVlV7/GizloE+j/VSbRaQ9H7y1szVgVX+k1
	HBAWN+PbtzXR6IklBiJocbxFZiLDFGUe4JFi6lpa55fLiXpVjAgoxUUAxaZzOdIg
	FA+qBiUoarVM2QpBC7IVP3lxt5F+E4oNvbjpSYsgr6uSpA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jd6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:53:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so1093787785a.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791453229; x=1792058029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aMg1bw/vHi2bfRM4a3njiioUTDtr5eiuMVLzrt8P6+8=;
        b=Mn2zNYqXo6SFDEkYlfgkGZiTUjWUwynEDizV25gypt1vMn6P1EI83NTDdOkUupCS7N
         Txs0hiKLFrUDvo8AWIVfbDlJrnyY+n4Q+I/7sc2XF5jHFZsH3jBROWpmXldvkROcX/mm
         kkCLum+ge06qAwE0dR2P8pKrQMG/zPoh2OX8/6IyKxK4iH5GgJi1hP4jRI6jhEkOXAAr
         yYStYPhQXtUbhGlNGyG6noEoxw7U+1d5c6rfl69CoGdb3b4Vu348kTrMzEkoMQFDPlU2
         /W3eOboIgaCY7ro0YUcdAIfb5Oip4HbQ+/nVGSwsdd/k9YlHmc5XEUAafO5PH38BIkcT
         OkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453229; x=1792058029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMg1bw/vHi2bfRM4a3njiioUTDtr5eiuMVLzrt8P6+8=;
        b=VMsdKhEn6iPqeIuFH8/Annc9u1uAuHo57XeyD7hI+jRLwDMK+xDQwAsXRSnXRv72ez
         Bz4YqLO5rUxQfNVrjUU/GoJtwWS30NhnJTqtHWmqEcSiY0A4bCMaboLJvH/C5fBp9YPg
         LICwlpyRvA4bnUCpotCHK3UFIhO2KPt/JreXcCBGHdbtWDIymjbH7iYAb8FOcK2DHsrU
         ddnsc7Yfdv2iFC6ebVzPNN1FMiOtYEBMfA183MNLI2RxiH4V7V/SD+dM0oOukveZ+3kh
         kRrXSYPRfTZOzELRIY7+4O2mrpL5FFZpH6H/fvrSA38NRvZIo3iiXQsBOCLtps+Z+7tQ
         EbTw==
X-Forwarded-Encrypted: i=1; AKwUvBwprYDmZRzCOS5Ml6xNOnPNTmcypNQm0eQYTJxNnaBZXpVE5wEUzoV34iE6effkFcAACHni0NgLCya8@vger.kernel.org
X-Gm-Message-State: AFuF++mHg10G2sQVQqM7s3OY4DVkytLGHCls2EodDetIbAg13W/MTJ8h
	m6Bogdh4QhZbBUJz1qy1LNQso6ZM4JmtZoCm76G+bZ0VbIfTBJt6YjzLeRhtNuMQsRvTsNEAN37
	4driNzLzk5Gy+gduyE1jFuGBpZ/dQmBKnLWn0qSYO4BLbYuYeUrjajuVgnVpmxH4+
X-Gm-Gg: AYBFou0FaR5MHs4fIISnrDceUbdaA+XUhmMP6lGF/XpJ1WdGOAV1I1vii6wJ+qck3B6
	zMoXRqrcx1ZbVc2KL7+aQZROSMWIOnUTIbLa+sj2GWky4ON5xYYD4QSdNy8uBiLF4dz+VfnHIA0
	jYNhazQXHxWReRylfRq4aB/AXqOy9cqBTl4VzrnROsXGo61kHR4pcua/6+EQPdE0bReaBNAdpg/
	z9nmExPY+aH1NXo2vqGRtiwYb8n/qnADFuvquI1C0LM40f20z+VSwx0sslbtqb25VDrIK92FuSz
	C7wHgpkEy3PnLG50vaqKnckrE9Vjz3W19p2CLxIB3nT92ep1pNbN1nagFUnjio2jzKfe+0C7MXo
	xDRHjHlio+zsj12fc1JnoRUJoFEOTmfoRMO22Xv4Lk5JvvMIvOdrduo/vOzOBeP9kLcw+FXsbIV
	xHnXibW7uLdV2S
X-Received: by 2002:a05:620a:2913:b0:93e:9553:3acc with SMTP id af79cd13be357-93e9b0f46f8mr1024761585a.12.1791453229145;
        Thu, 08 Oct 2026 02:53:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:93e:9553:3acc with SMTP id af79cd13be357-93e9b0f46f8mr1024758485a.12.1791453228690;
        Thu, 08 Oct 2026 02:53:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3015190sm1056704e87.6.2026.10.08.02.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:53:47 -0700 (PDT)
Date: Thu, 8 Oct 2026 12:53:45 +0300
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
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: nord-rrd: Enable USB ports
Message-ID: <wkwmg2g77xg7gvodnrrn2hvi4w67brmygcpqruyus4fzxxopn5@626h4czj3gz6>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
 <20260922-nord-usb-dwc-dts-v2-3-ba2b39f1a843@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-3-ba2b39f1a843@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX00BUNWPh4l11
 n7fjtrlz9KyeurUCpqIS/2ps8Qf7nwdX8k2uikGzurq6gFPiO4X0DabJy+G9bQfgCkiIm50LH0g
 SocUfIA6Tya01xKNMD3GX1FZJ2HmNYE=
X-Proofpoint-ORIG-GUID: 9GWyAIT8ZCo-DeTxUFqtRQTXSuu-3Tzm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX0vQ1OEMbo0QC
 jN4qWdY21vfztM+Us5o1qLVomBGQgauv3KWpYbEOlwvyovDT1Ms0hPWmdlawp31BigPg89c2sAd
 bn8wgJ+hpAlks2zJkPnSgWaZxF9J6uEwQRNdcV/khVPFIEjuiO3k5Ngqj9vaD1gQe0u2f4a8+7l
 hc9pI2H/T+VV966g5uWiopj3ttXNsxwx+3pklUDFFGhbKp4xlkN8zx3Luc0BvZvTpjdKAJWOpI8
 mrQXAEK3jqIrfIO8ZqD+NA71+mBoqkW9FONb5K7fS/6A2jFdF7d1xxrXnjZiSltJD+X3j0rMlg+
 rWI2vc+lbhhMHvcWCQ6MpN3xk0IdvSCQrhhj+ZOkpI9jVmBM+9QgY+O1jYEtYDAG5wZABvNGbU3
 ZI/cXBMuMwouEz4TIS65I/IEBREE4FE7XbvPYW9fIZOcsL+vSNvepNEhZBArgElgyovQkTyYIOa
 eth5b7GU6pnb72wAjfw==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac7682d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=iQrKqlqNRm4S_ViRXwQA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 9GWyAIT8ZCo-DeTxUFqtRQTXSuu-3Tzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080039

On Tue, Sep 22, 2026 at 05:01:09PM +0200, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Describe the RRD USB topology. Enable i2c9 and add the two NXP PTN3222
> eUSB2 repeaters for USB_0 and USB_1, supplied from vreg_l3l_1p8 and a new
> fixed 3.3 V pre-regulator, and reset through pmau0102_i GPIOs 9 and 10.
> 
> Add the onsemi FUSB15201 Type-C controller at 0x50 with its interrupt and
> pinctrl state on pmau0102_i gpio8. Unlike RIDE, only port A of
> the controller is wired on this board, to USB_0, so a single
> usb-c-connector is described and port B is left out. USB_0 is configured
> for OTG with usb-role-switch and its HS and SS endpoints are linked to
> the dwc3 HS endpoint and the QMP combo PHY SS output.
> 
> USB_1 is a fixed host port feeding an on-board Genesys Logic GL3590 USB
> 3.1 hub. Add the HS and SS hub pair as children of USB_1, linked with
> peer-hub, with the HS half reset via TLMM GPIO 170 and the SS half
> additionally supplied by a fixed 1.2 V rail.
> 
> Assisted-by: LLM
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 166 ++++++++++++++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 

With the order of regulators fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
