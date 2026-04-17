Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029BA175A66
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776468579; cv=none; b=kLsIjeUmNpVIpe9Unwax5anmTIw/UZmF5Ciy2y4An9Femf8bDbz/b2uSxkkYi4A3Hb+Fonnpojau+ErvGUCpdze0lyR739MEnEPpEgNHGU6/hpliZvQ4p0SubUxP35lMbZvZdwY5vwjaHb1LJLAPiOHTQiN14uOEj6UNjIzPOJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776468579; c=relaxed/simple;
	bh=i1wj9aA/8YlyZGyvudCzIaleGVZglVR8+NTSQS06GEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqAPcy0nIYgyltUaNFzvEDy6tcPtv7UheGCiicdkCfGg+l4B4L4OQQgZ53Z55DketZd83INoBFD0DNDrFI6l+WXiSbtyndWo2FoD8BvV/ZUqxXn8WsYa/tCeDklfP+HxJpe3zjanQthZAHGNbm3LAN+Lnlnav9sgMVdEz7t+XAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUJrw/R1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRdbJWF1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUJrw/R1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DRdbJWF1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4ZZm455078
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rHgSNXi6Q1B7a4INzY3cg+7z2v/tmCcKjEA3iSJcotI=; b=DUJrw/R1OpwPuDTJ
	xnj7WKhGQUuHfa78VLKB5ypI8QBhu0brEKA4SXLRJ4VuF/E5AmAopG+/HE8Oc1lj
	PlCumd77754CVpA5wPMxyOjDs3YNaCVYojgUOtQLipPriVk5rpids5oCe+/gs5rh
	JmIrEwh5F/b17v0Dd0tY5PJRF99XAmP2Ry6d61WY42ISRcgbouoc3qIbk5oFsUBl
	zdio9GxEG3zdCMV9sI9Cq8C156W0YMB5H/hWK3L/0BR4OOrRz8i1jCQ6B3Sx1wFR
	U2zaE8uaoKwdOxJG5gY2ZWI09njj4DxfhStbn7OaDPZ/mqqXYsP8fLWefNdGs+uG
	S2eIvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88u3bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 23:29:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d63962d83so30101041cf.2
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 16:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776468576; x=1777073376; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rHgSNXi6Q1B7a4INzY3cg+7z2v/tmCcKjEA3iSJcotI=;
        b=DRdbJWF1qZqhiIxeu237N+xxPMKYpTbP798i7Aoyviw0aJtvYvsoCfFPGT0e/q6VY2
         vBAH4ugqyeuDPNRdm6LCQtbLkrFZpro6433dbUVHCXnuP6gNU2p5ky1wDzAe4pDi3RvW
         eb8ZyACDUv7LwIY4CP1MaEz50jm0SJyq3N68oMSt1b9T/EEf941c4w7UGRRcg872zWJZ
         sSsOxtx12ryAIA76gPBXKNi5j1Z0h2sGzNQNNxYyzgpMrNaFoP8AcjKlogQV0EsY0DXW
         oL+3pJKHLHc5uPc5GHEkBvBkRLUiEc4hidmimDCpxHgmyYjFm4jrteqnOmeCObZz9zvg
         Jv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776468576; x=1777073376;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHgSNXi6Q1B7a4INzY3cg+7z2v/tmCcKjEA3iSJcotI=;
        b=Eev1qDRW14oq9yHyerQmIdlt6L6/Wd2Psq8ZkCqRUHKQwlg+07aIwbcyelziu7LaXn
         F6WYOeVFR22JiYt2lkmLHNsRHLztkrp24UMmSXAhvGw8wvH8jyy8SZLvWZ0MUv3Hq5E0
         5xKy0VJqaNAXMqai1uFnqRQA+cdedqqvYBGR8cbldmvxfiKhQZ5vTeVNOuH3cRiqWkJ9
         V4PRKEaz21D580VDlM95EryXMCMvZoH2+Rz5sMoHooLbtRnrjXhMbBOBC30XtxzOwGZ9
         zu4XOnb1bYv66fi18V4l+JbquafHcNPuOdQhQv6/7uERwYP++tb6XxGSVKG5MFTTAoGU
         3Oxg==
X-Forwarded-Encrypted: i=1; AFNElJ8iSErgg+NgETpOho1fGGP/Zh6dmxzsKlnVT7XuC+Tmyp80A4jMa+r8ZV0CQkczrnSAPBYMLuKswl+E@vger.kernel.org
X-Gm-Message-State: AOJu0YzbxC212hfbObZMtVf0N23RK4raKpbj4kLi25SBWRv8qtSYuGlK
	vmrWVhtY0a6pyhc9g0kf+0LNRcVp8g+noFrtGFcl25u6xpfd+ID0lKyvcMR1kmT858/JkraF2Yc
	yzTuhrHcNc2S5/ZJ3OZYdeCjolF0Af8Qo7qYFPssoU5OGbF0cihAs3hLH2kqrErKX
X-Gm-Gg: AeBDieulqgYHzdqh3gRKD+eV+XnJZ01lXXBPEigkVB0nBHUm+S08e3g7DKl+oyrVXob
	C/Cygz68wzDxOyswKeH7dmyKV6Ttao4tfLpQ2GXbjM3N0qZFDmeoS1OMpzKKj4udLoFnnft1Llf
	x3nJcD3G9SuteC/W1zCd2Ze86fzGsbjNq443GtVZr76h8EmN1cerLswkcgflosMoHfurAFw5mIl
	o1m97IlMhvGYT9YlfnfIR6pKP/qYkbGq6a9ItgMqVro5/db19uEB7/GHINBlYaz71WN/0vPjjLY
	3q+/Ydm5wVKbu2Eld1QeZ2SzOPxxLYKei8KbWtxetGBNQSGBAtjA3sZiolGxGlZDfQHCJ007rQY
	2gjetQbE4DpB90vdNQVeRW+EbNj28eILwUfw4WzOIdS87U2xHITV4JQIsvWLXUDWSbV6ukvurr7
	ZbbxFM7FfU2Rb4B4Y2dCd90OrIkQaKMkOAWoSI4rFSsheQ8w==
X-Received: by 2002:a05:622a:1307:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-50e36e9c0bbmr70244951cf.30.1776468576351;
        Fri, 17 Apr 2026 16:29:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1307:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-50e36e9c0bbmr70244691cf.30.1776468575880;
        Fri, 17 Apr 2026 16:29:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0dbsm812199e87.6.2026.04.17.16.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:29:34 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:29:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
Message-ID: <p3qh7jhkzgw7w7yh27gia2d2ri7ycbgxeiwdalqboq7yyv3cwu@kwqdzv6ldcx4>
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
 <mxawruvb2p6svks3y4rab7feyn4dhkwe6dosjyc6yt2ozdaual@bvvof6rzm3jo>
 <c5d1578d-729d-4c09-b761-c67e6d3be745@oss.qualcomm.com>
 <48bbcc34-f5bf-4ada-8210-b115f72ee850@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48bbcc34-f5bf-4ada-8210-b115f72ee850@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: evSAfHpnaMeZCPoJhgA1I299oBRFE4M-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMSBTYWx0ZWRfX5URCScsChWSh
 sOfQXBk5bgbzv9XErGhLiTBr7XRVGvbikLueMKwYBNRbDUdEpgjm+hRJi03zLL3AndcV8ukvrT/
 PmCHB4PBfpriDRBUOpQDwxh/Fp//EfubhR/hT5XH576MSrS6uLkJStCA+M1UwdLF6SQeMuTMfFH
 SJkRTv50eNsJIX0G6nwELKld/4FbDhjc42T9CmO/Eyh85+LeTxbgQ+y5pSO4eEG/cXN7daxNytT
 EWGFD3uHCGyGY5PPDGpqt4AG/FFNVZKTGpQO7kB/YEFXKddyVtlKOsQz9bkXkBfYM7H2YNYVuKY
 fSkg36iAv/oovIeOs2HYObvMGgEWxObFzJ3aGER1mjoo1RgDQrbSFpkYwOxxKsq5Rhph2Q99n9+
 HquIvxCc92JGp40YjpPn2NUK81tO3Mqs4AS9U8+7b8EC7sfRpUcHMiF51BUPv23k51W/HLvAK4B
 gxQsJbl89U8CEk6OYZw==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e2c260 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=DHNw6_5qktLrKIcdsVAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: evSAfHpnaMeZCPoJhgA1I299oBRFE4M-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170231

On Fri, Apr 17, 2026 at 01:24:07PM +0800, Fenglin Wu wrote:
> 
> On 4/2/2026 12:18 PM, Fenglin Wu wrote:
> > 
> > On 4/1/2026 7:22 PM, Dmitry Baryshkov wrote:
> > > On Wed, Apr 01, 2026 at 02:41:24AM -0700, Fenglin Wu wrote:
> > > > PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
> > > > the definition of the channel status register bit fields. Add support
> > > > to handle this difference.
> > > > 
> > > > Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > > > ---
> > > >   drivers/spmi/spmi-pmic-arb.c | 69
> > > > ++++++++++++++++++++++++++++++++++++++------
> > > >   1 file changed, 60 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/spmi/spmi-pmic-arb.c
> > > > b/drivers/spmi/spmi-pmic-arb.c
> > > > index 69f8d456324a..deeaa39bb647 100644
> > > > --- a/drivers/spmi/spmi-pmic-arb.c
> > > > +++ b/drivers/spmi/spmi-pmic-arb.c
> > > > @@ -28,6 +28,7 @@
> > > >   #define PMIC_ARB_VERSION_V5_MIN        0x50000000
> > > >   #define PMIC_ARB_VERSION_V7_MIN        0x70000000
> > > >   #define PMIC_ARB_VERSION_V8_MIN        0x80000000
> > > > +#define PMIC_ARB_VERSION_V8P5_MIN    0x80050000
> > > >   #define PMIC_ARB_INT_EN            0x0004
> > > >     #define PMIC_ARB_FEATURES        0x0004
> > > > @@ -63,11 +64,34 @@
> > > >   #define SPMI_OWNERSHIP_PERIPH2OWNER(X)    ((X) & 0x7)
> > > >     /* Channel Status fields */
> > > > -enum pmic_arb_chnl_status {
> > > > -    PMIC_ARB_STATUS_DONE    = BIT(0),
> > > > -    PMIC_ARB_STATUS_FAILURE    = BIT(1),
> > > > -    PMIC_ARB_STATUS_DENIED    = BIT(2),
> > > > -    PMIC_ARB_STATUS_DROPPED    = BIT(3),
> > > > +struct pmic_arb_chnl_status_mask {
> > > > +    u8    done;
> > > > +    u8    failure;
> > > > +    u8    crc;
> > > > +    u8    parity;
> > > > +    u8    nack;
> > > > +    u8    denied;
> > > > +    u8    dropped;
> > > > +};
> > > > +
> > > > +static const struct pmic_arb_chnl_status_mask chnl_status_mask = {
> > > > +    .done        = BIT(0),
> > > > +    .failure    = BIT(1),
> > > > +    .crc        = 0,
> > > > +    .parity        = 0,
> > > > +    .nack        = 0,
> > > > +    .denied        = BIT(2),
> > > > +    .dropped    = BIT(3),
> > > > +};
> > > > +
> > > > +static const struct pmic_arb_chnl_status_mask
> > > > chnl_status_mask_v8p5 = {
> > > > +    .done        = BIT(0),
> > > > +    .failure    = BIT(1),
> > > > +    .crc        = BIT(2),
> > > > +    .parity        = BIT(3),
> > > > +    .nack        = BIT(4),
> > > > +    .denied        = BIT(5),
> > > > +    .dropped    = BIT(6),
> > > Would it be better to extract generation-specific callback to decode the
> > > error rather than defining the list of masks?
> > 
> > Are you proposing to add a callback in pmic_arb_ver_ops, like
> > '*check_chnl_status', and create separate implementations for PMIC
> > arbiter versions before and after v8.5?
> > 
> > This approach would add more extensive code changes with some code
> > duplication, especially for handling common error bits shared across all
> > versions—even if they only print error messages and return an error
> > code. Is that a concern?
> > 
> > Fenglin
> 
> Hi Dmitry,
> 
> Please let me know if this your preferred way and if you are fine with the
> concern that I mentioned.
> 
> I can come up with this approach and post a new patch.

Sorry.

Yes, a somewhat duplicate code would be better than having a bitfields
where the individual fields will differ from platform to platform.

-- 
With best wishes
Dmitry
