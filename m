Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BD9476075
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636357; cv=none; b=VaoJzSpx4R7qz9+AOajHILb5RXDOU75lf4lR5Gw18D7h7uhzt1Ue0kHq+ezyNrab1dV6yqzhERyQfb4WYVIQ/qRMxPm0Z1JekgJTgj2cDIBwMyCAFGuRfINUA7ADNMXldZC7fg9lw0vT9KfkP87FOtrbEGur7+WNrCXBSunvVJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636357; c=relaxed/simple;
	bh=MJaXpxk8SgycetXdhs/9jAfTSWIIXfPWvoyOBjRier8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjLZcuM6sy87OIQOZ/iSRVESLxzTS9+Hc1aXSRGx0MDU+DgfinYM1pSslxLsrPMDuyhTdoq4InQMSaRHoSsa8QZsXbr+cvWrC8UYSXfPYVxQ5ahVnT+wGD97PopHX/Py0FQuNAA9HYzTLP9q4sGTi8MEQAfwKUwf/PoUZHsre/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Huyn2mH8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqUFJ62A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Huyn2mH8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqUFJ62A"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTlX03185971
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1H4BUaoFl55Pgyv3qAZFTdQT
	91e144GEzYr6Flshtro=; b=Huyn2mH8ahBanKe/41geqTI5zrugqu4pDnKXHiNA
	xalHnfgcyRguPHYCZaYxUgOyFJ5mZxXZ79DAB1AMBNT7/9Stk5p65gsNcj9MYNQP
	jdYTFK/+3/Dcm0k7Aj0Wc/Q7wkj1Km2IrJ/aGuNl50m/BW5VpZ5FtRiY/vFeUGvS
	K3WlQtPVgiQsUMVwWWcsVbL4yvJeorQT0fMQHkP4xQ24ofsElwiif+D5YVR5Qrxh
	F2mpOboEGx3akFZFFqjpKwc4L3nj2TTChGfpNpGrT7JoJaLE0TS23MSyKksZGZOd
	/ydMJneEYtflKs3f+IK3viNdPBubFPRTu/WvHsucbW0E6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g11asm08g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:52:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so779741cf.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786636349; x=1787241149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1H4BUaoFl55Pgyv3qAZFTdQT91e144GEzYr6Flshtro=;
        b=PqUFJ62AbZyxPwz+miTMXgZ9qE+FC4KacqBVN6OyGz5oUrPirsM13uNXtVtoot5TI6
         13R/u3cj1q9wM4lppQlHK2MF/wQ1B1ElGlu3wDSZpQhGx8nS0dKs1Z1f/tgDobENtl7V
         Eiz4qK26LbNIIFdOSFWLDV3T4HIz+WT5kqZgQBT0TsNNiY5Gb5vtL8WtVlpZbQp95rrK
         98wQskht3jKA1HtBiUkCRYPKZm1dGfe1rW94LYsODiLSYlXfCQEzg9DO698j1JnIrL76
         PRoDMbWisBmRERhhl1JPw48BRq6GVAyqybRllauBQITJ5wWhfbEP4Rpeujp4V4NNqjcm
         mHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786636349; x=1787241149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1H4BUaoFl55Pgyv3qAZFTdQT91e144GEzYr6Flshtro=;
        b=EW+3wsXG46oG5iDA5xQmOhRJoN6aVH/lNOJR87YlIE3h8ds7EZ+Y+XcYIZOp9aY7qw
         NmQR0wN6JKcpbrC+RPoBHeoMlchsW1B91kCqmkmQPgYt8mRjzk8/xgrN0H+5t0NsRmBp
         BUnZgKUVV1h8zyhOCfBiWWWwnv+yKxN5z0s7i4DQO60ylGd+Y6AphmTCURctG21hsuYn
         4Xw9EuSvX8ekgJ9WBCbfpLsbQAKG6/Rz2g4kJBIGfYD+ZkAO2E8/N8rwesBnEkVCwvJa
         Dgo0PvYRRrM3R2052PycnMwgCUJh/LAT0IsesNtRknyIfMlzffsKIhDHac//pMyZcC2r
         q0Tg==
X-Forwarded-Encrypted: i=1; AHgh+RqXVlyUhQwENOsUst971p4xPa14XPY11RUsWIi0iMTtMU37ZenBbsJUC/kdvrVXT9ykugM2hKzbZ/E0@vger.kernel.org
X-Gm-Message-State: AOJu0YzgesPgrzwEvqtNFyE+BEGgY+iyCVKK3WuJGBc2AabVr3RqkNYL
	P9wAuni+3PYDfBoXLvXulMbRb9PcZKyS2jk55yPYrpoIXAShvUmovfDRJ8peGiiKQJ+lkghuzzU
	dVKxnGpNOvkTpaL02/GACc9FXlvZqFGOKlO1znzO0PvZO5U1MNDBKsPKH0h6MbIB9
X-Gm-Gg: AR+sD12aRzWAwSR7yKelkGBJakDDvX6jUjMmOiCg/FFpDu+mu7CupHbe5Wd2b3HQE+Q
	ZQbib9gVhClH+JfqIRknpyJfKTzMnpAh6tRtGpY11ogcytt9O7G3Px5MX1V4lKgFMS7ugQg92Hm
	c7/baEeXHc8pCZNXZzO5W07PRuN/7UqPzVwKs6UMJCtIMdmnsGP5l1P28CL8Gsh2cSULwh0VBRG
	kFybzHGipLizeFWY9ayhTeBR5aKQYmjtsjSIT32VyTkCvcTTsbQxZJpE7ziILt2i8RHtXCcUjGh
	4IMGhdgdxYEB8hm+PRs2LFgtnFG8cRHPGL3xBD651XskykHI0wAXOqxUFanRlFuoiQvRPwcc2jJ
	sKCnWZh98H+9vgCcJxnxWUjQTrYy3meiG4dPKKpSNRlN6DrS6x4ODF/LiWBOu0JtDWkh5D1ny2e
	jO1Sr+QVsMJPyJ
X-Received: by 2002:a05:622a:64f:b0:51c:b900:5136 with SMTP id d75a77b69052e-52d73aa07b1mr77451291cf.0.1786636348582;
        Thu, 13 Aug 2026 08:52:28 -0700 (PDT)
X-Received: by 2002:a05:622a:64f:b0:51c:b900:5136 with SMTP id d75a77b69052e-52d73aa07b1mr77450311cf.0.1786636348000;
        Thu, 13 Aug 2026 08:52:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b453a67ec3sm568413e87.75.2026.08.13.08.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:52:26 -0700 (PDT)
Date: Thu, 13 Aug 2026 18:52:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin@snyders.xyz
Cc: Casey Connolly <casey.connolly@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>
Subject: Re: [PATCH v3 2/2] power: supply: qcom_smbx: add SMB5 support
Message-ID: <hryxv7fl3alrhnekb7bqn5zgexdyv3p6ndug7kp3uqxsiiwmsv@wtvg3za3qspu>
References: <20260813-submit-qcom-smbx-send-v1-v3-0-27be0091d7c7@snyders.xyz>
 <20260813-submit-qcom-smbx-send-v1-v3-2-27be0091d7c7@snyders.xyz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-submit-qcom-smbx-send-v1-v3-2-27be0091d7c7@snyders.xyz>
X-Authority-Analysis: v=2.4 cv=EujiaycA c=1 sm=1 tr=0 ts=6a7de83d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=WFa1dZBpAAAA:8 a=OsHF4jKAAAAA:8 a=OBdvcqqgoCy4BfhIt8YA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22 a=MZguhEFr_PtxzKXayD1K:22
 a=aAwnOj5LE8VeXseigifb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfXywa97++89enI
 FcBy3fRkOKnWojDyM7yT0RM7vk53kWGwotp4zci47S/rnoZSGu4DxBRrAcc9nDQ9pISHsgz9a8J
 RHy0HWZ/o1YqZGcIt4N37NOqCQjnUF8didBtJECvaXcXeK94oDcFOAq1UZCGBm5d6ciSCBv1eRD
 BbtDx1jmUn2pyl281x2RgrJkcEtE97N0zhGm3hbR/86jR27eqyoSJD7f5wU62UvvOgAYxwEmS6c
 7jAACa7WFp/wNbj7FMRCeFW/x8n6eG3DOwgxjacUYBNoKQCQKfpduZej0AQPs5bNFaCLykq+vSU
 zd7ak3VLjU4jORInbMj1cw9Io2QxcI490wfieYsB/z2uz04ZvY1A5l6PTIVF3ZNErk7CQC04Pe+
 xBZkeYnZkrmaNVB/Qod0zs7W4C0boks6WMAswx0qB0b7hjhTKbua9iyZmmOPwdAq1zA2QmN+9iJ
 pxgVcGINpY6trpd4WlA==
X-Proofpoint-GUID: XfXoDogcoHprPn0H_MKFkShetgohjCeV
X-Proofpoint-ORIG-GUID: XfXoDogcoHprPn0H_MKFkShetgohjCeV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfX5k4qNQRcfkN0
 5s/SD6eW8mJED7zRDecN1WDr2Vs2b2UhcjOLEgDJOp0XhmEVd/TMcWRASFNWf3PDO5lguH8rer7
 o8LV7fFkkL7brG4DoKs7vEW86qooy2M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130114

On Thu, Aug 13, 2026 at 12:45:42PM +0200, Robin Snyders via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Introduce support for the SMB5 charger found on PM7250B, PM8150B and
> related Qualcomm PMICs.
> 
> SMB5 uses different DCDC status offsets, charger-state encodings and
> electrical ranges. Select these from per-PMIC match data, with PM7250B
> using the PM8150B compatible fallback and parameter block. Read
> overvoltage from the SMB5 status bit, use the already-prescaled IIO
> voltage reading, and convert the SMB5 current-sense voltage to microamps.
> Use battery-info property presence when selecting voltage and current
> targets.
> 
> Keep Type-C power-role and VBUS control with the dedicated TCPM and
> regulator drivers. Clear the unsupported HVDCP negotiation modes so stale
> firmware settings cannot raise VBUS. Leave the firmware recharge policy
> unchanged and match the downstream default of ADC-based AICL disabled,
> while enabling periodic hardware AICL with its twelve-second SMB5 rerun
> interval. Preserve the existing three-second SMB2 interval.
> 
> Program the battery limits and complete SMB5 input and charging setup
> from the power-supply registration init callback before device_add
> publishes the properties. This makes all public callbacks safe without
> driver-specific probe synchronization.
> 
> Suspend USB input and charging before SMB5 initialization. On a later
> failure, restore the original charging-enable state before the
> input-suspend state; leave the input suspended if charging cannot be
> restored. Cancel status work before unregistering the power supply during
> managed teardown. Update the Kconfig description to cover both charger
> generations.

I remember that in SMB2 case the TCPM and charger drivers were
programming the registers from the same block. Is there no such conflict
on the SMB5 platforms? Have you tested that this doesn't break the USB-C
dongles being connected to the device?

> 
> On a OnePlus 7T Pro, register reads from the initial implementation
> confirmed the programmed 4.40 V, 1.50 A and 500 mA limits. A 180-second
> guarded charging trace and a subsequent 600-second runtime trace
> completed without crossing the voltage guard.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Co-developed-by: Joel Selvaraj <foss@joelselvaraj.com>
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> Co-developed-by: Robin Snyders <robin@snyders.xyz>
> Signed-off-by: Robin Snyders <robin@snyders.xyz>
> ---
>  drivers/power/supply/Kconfig     |   8 +-
>  drivers/power/supply/qcom_smbx.c | 744 ++++++++++++++++++++++++++++++---------
>  2 files changed, 590 insertions(+), 162 deletions(-)
> 

-- 
With best wishes
Dmitry
