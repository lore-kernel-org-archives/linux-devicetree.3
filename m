Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B1B31F9B0
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552756; cv=none; b=GsbYGh5le/BhDBqFDFCK4b7rqxBF1jWY0SEyHgvP8JsPhl5AYA4x9HDRcCw0XOrLqROLw06fCtVX2rqYDLvmKz985IK1AV8AMyqD/vThb0IQrOrpQy50WrKqTxNncCC214n7A42JI1iAWz/T9MsuDr4ZTBBwR0Fj+iQ3dA3QcpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552756; c=relaxed/simple;
	bh=v0fWKcmmZaTBzmXsWIZR7+NS5yoy15MBy64/dQy39MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fN58JARccHQv16znnZ9Fpw7TZhcVhkj7+hPWYzSJwxJBFjLV5i3GL0LfGan8jWuU/mgjunQMFbYC54ROibh7Qh69CTosrI0gFAjEWlqYF5l+YsFco9gWCihFCraiCXLGAM5JYtXIAH4/MuPTaIRKJJ9mgWXWTjTuF63MxI5YXBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0LlzcKn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfrbdEZN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0LlzcKn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfrbdEZN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvPPE2421522
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9lRDDD1vzpw5E/8CxKTqsEOwuxf/6n9OdNFo1Cm5mc=; b=B0LlzcKnPAUKR+UW
	CfZO7kvccs9AOuQ0FuM4SZV9mejvKjCVupbx5NbXyrZNbrOXg5hWHnq63OAiJ9lG
	dU9ePK3MwcRD7uEzXYWhWbyc6gDP4qFmhXb4qIGhDJUvnqSDXQI6fW7Olb2wrBBO
	KExlDAfvnroX3kJ5rxANUnjiq217XUIweru7UHpX0xlTNY+D1B7170jVzm/GWTVv
	0lufsBV41RO2EwK9eRCPNljwEy+teG1ZdG4a31O357IPK9ZCn77FgwwAR2R2Xl5/
	vFPQww+oPkb3frID67ABzH25a8M8vebcZ0WrXcUgsAnlGR0q/HakdVCatkYbNY0r
	OTcmSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxhadm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:05:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e632390d2so1323118685a.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 06:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784552753; x=1785157553; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B9lRDDD1vzpw5E/8CxKTqsEOwuxf/6n9OdNFo1Cm5mc=;
        b=HfrbdEZNktMpzRbsGPA3aglJu2U42YhwsEM5ux13YNtXj3e4j9xSUWvBvUxBZUaoYu
         5wHYJ3SUnJFjlVUU9k9M83tNV6yb0fTOYORO7tqRNuaEvv/JrZHFbpjwEC2zxp8pvrkF
         dHvUcQHJ5KJ6N/y1JEbzRcVFqknXxmc3jMf2ukE0YZ9FPAJCLyoJ/+qhM07WEUtqIGBa
         xTn+L9dKshMrXUtx13ceXumb493rpLeMSl9mc1MG12CpakQnQlzzoy7gQ96xpkn8pLmZ
         lFD+ANmwPBr/JBnpYPIXD3viIlfbHk4RlVEsHhawB4xDWJhM9UGLjeV1CyfhxRUPfUZP
         uuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552753; x=1785157553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B9lRDDD1vzpw5E/8CxKTqsEOwuxf/6n9OdNFo1Cm5mc=;
        b=Fiqj645dCPB/RQeRIkGFtwT55SI/xdAdrOefMUffi4hD467c/Xoaa/SVqYZMqFWXCh
         VtBeQtlfBklGXhOt9MLShrTimONMVpvnadehKbAzec5tw2PS4+wPXItUoPP33s4wEO87
         1oFnT50Rs0mGPgpSFbkylR7e5OoAAeNKiWTaJRPKjE9kWArtnEqf+QGx1MrKtP9yneCp
         fU35xwe3LBTGP9Zbko6wAx9F1ZbLtpIn7Nl2zg17oZQpypF6+bKNm5dzO0k3yquQJ/bs
         MMj5i9yBxRcAVdOE6ZSW/rEfELudZKa/T9LGj8cRjJxBC3MGbh6tnBz5R8miPsfXdi8E
         3Osw==
X-Forwarded-Encrypted: i=1; AHgh+RrFmXYtiC961c2ca7pkzjHY3qjvuzxT0LdaKGX3xoNvPhH1ZbQasMW9BxqTMaTBUF+Uy5QD1TM3qqyi@vger.kernel.org
X-Gm-Message-State: AOJu0YxE06szJDVRKH9DowYneJXI+eXS8hVb0KVCXbhsymq87xI5kNRJ
	JEIzJVmzm4dkjseExAZXs6eEAnwU1693dA7u8xlGu1M6duy1KtQjtkDB0FBD2khIS+hTKGwYs59
	cPNInRoqo5kjgOPaeDtlTOrSqAWuMaYQxK4UXAky16kvFnin5okxW78FfnPlJKs3N
X-Gm-Gg: AfdE7cl6J690E2tmmTS/HhK/MwUgJtO4Vclt2Awyc5jcZ70XCAL9wB+F68gSeDJMKr0
	vqkGoQ7B1Q8gtUHfOvGzsegTZ6SBWMRKgYu2DrDuMDxFbjPtY4C93u7/U7tCMwTGxCPuUiljBTW
	nvpwXoHyVjGNkfJlL0WaeMjJ+gCUtDPA4pHZ6L88jiitgCIVhy/oFr5uHsWLtjQH29vj0lrCBqc
	zVPakEj/Jk0xaTWWYQuePc7NfeRlHxMNOlaAF2UOwUd5cZHPsU8mtf8pu50Dd+7PIKMLy/zzosX
	xjh5o4eX9lZpj15y8Uh8Gz2KOfJdOPReHXltUZF76rDEmwF6Gn8KE3ZjQ3NN9Cz3+XRpeCs9G87
	o4nLDfjGOD6f9yz/IXuBCQScig2RadypgLb4VFoAMbO9x4L9LoswGWS3bYp+qu5OuWm8jWrFPby
	X5SotRHsYEUnxSkQ==
X-Received: by 2002:a05:622a:1114:b0:517:577a:76f2 with SMTP id d75a77b69052e-5213f667ef7mr126686541cf.54.1784552753102;
        Mon, 20 Jul 2026 06:05:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1114:b0:517:577a:76f2 with SMTP id d75a77b69052e-5213f667ef7mr126685821cf.54.1784552752353;
        Mon, 20 Jul 2026 06:05:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d8a71esm2239425e87.1.2026.07.20.06.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:05:50 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:05:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <rq4echpblosddelpjmcms4ezynohrzfbr6axfjtonhd7ptn5mj@gj6ecmqv4ows>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
 <4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com>
 <fa5bf9e0-66ec-4506-a2fa-bf1d95adf9a6@oss.qualcomm.com>
 <6c89ef9d-3551-4b92-904c-316dbcffcfbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c89ef9d-3551-4b92-904c-316dbcffcfbd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e1d32 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=Xr-WBXzQFotaGLdkbuEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfX0MlPopjlg8an
 Z5p89eFPWd7Wg6PGP3QCgl/19qwc4mwp0X8SqdRMFLNRlV9zmffnBq9K/F2zn6+h3AiraVF+dx9
 Md932Gy6iTJGWL6LROug1SM7Qksrhy0=
X-Proofpoint-GUID: 3EQPwye6IQma_3L4MCA0jeKsnrH-zXkH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfX6lUrh025JEyQ
 ajIMLdKISOR8j6y0C8CO0V2GS3EQ+D7NxI7LQs3WPOAfotIXkMxGEU1Zeogo+hOWNHl0h+Unmot
 YEVNb/D9p2CjFAb1xnAJL5aRa83YiN0OlP2+9R+ldYPnK+c6cHIAHFOXV7x0tTT2g1NqxHFZgcf
 wNhbd3qlufgfp08ACmnp9S/MS8bgF7rJlWvMiteonbClLvTC+LDKnCXaPwH0pOitkICIcHtTMoN
 IO8fIsP+DLW0Be4he/Yy6Ypkkwt9QT6Rp35irVzaKmqrSnyqvb3YLJvXdLeUPsNVUKKL4e0nqWD
 jMCFtHo2/vJMNbLHhD4XSVy2sX98SUMFg1vc6319q/cTXZeFAKnjXJFzaQvgiFMlhsUl6nAd3BP
 WjRC6bdvG+r6VT5dHAfEKHJjlvg2i5JiFZEN+RUksOkdjRxerhbTqOy1XzdtJdXBA4/WkGrg3IY
 50EKVCDHVW+FTvgyqtw==
X-Proofpoint-ORIG-GUID: 3EQPwye6IQma_3L4MCA0jeKsnrH-zXkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200144

On Mon, Jul 20, 2026 at 05:37:25PM +0530, Arpit Saini wrote:
> Hi Konrad,
> 
> On 7/16/2026 11:21 PM, Konrad Dybcio wrote:
> > On 7/14/26 9:21 AM, Arpit Saini wrote:
> >> Hi Dmitry,Konrad
> >>
> >> On 7/10/2026 6:09 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Jul 10, 2026 at 05:28:04PM +0530, Arpit Saini wrote:
> >>>> Hi Konrad,
> >>>>
> >>>> On 7/10/2026 2:31 PM, Arpit Saini wrote:
> > 
> > [...]
> > 
> >>>> Normally the backlight EN pin is controlled by a backlight driver.
> >>>>
> >>>> However, this panel uses MIPI DCS based backlight control with no
> >>>>
> >>>> separate backlight driver. Since there is no driver to assert gpio91,
> >>>>
> >>>> we control it via the panel's pinctrl default state..
> >>>>
> >>>> So this is platform specific pin , we need this to enable/disable
> >>>>
> >>>> the backlight.
> >>>
> >>> Handle it from the panel driver. Also please fix your editor to prevent
> >>> it from inserting extra empty lines.
> >>>
> >>
> >> Earlier I handled it through panel driver, but this GPIO is specific to our
> >> Qualcomm Daughter Card, it is not going to the panel connector.
> > 
> > So is it an enable pin of a voltage regulator maybe? I'm having trouble
> > understanding how this is all tied together, given the panel driver
> > uses DCS commands to control the backlight status
> > 
> > Konrad
> 
> No, it is not a voltage regulator enable.
> GPIO91 (WLED_P1_EN) is the enable pin of the WLED driver IC on the Qualcomm daughter card.
> The WLED driver is a boost LED driver that powers the backlight LEDs.
> The backlight control works in two parts:

_that powers the backlight LEDs_.

So it is a power supply.

> 
> 1. GPIO91 must be asserted to enable the WLED driver IC itself.
> 2. The panel's CABC output (a PWM signal) is connected to the WLED driver's PWM input
> and controls the actual brightness.
> This CABC output is driven by the DCS set_display_brightness command sent from the panel driver.
> 
> So the DCS commands control brightness via the panel's PWM/CABC output,
> but the WLED driver IC needs to be enabled first via GPIO91.
> 
> Since GPIO91 is on the Qualcomm daughter card and not on the panel connector.
> 
> Dmitry suggested , it is not appropriate to model it in the panel binding.
> The current approach of asserting it via pinctrl default state in the board DTS keeps it board-specific.
> 
> If you have a better suggestion for modelling this, I'm happy to follow your guidance.
> 
> SoC (ITP Baseband Card)
>  ├── GPIO91 (WLED_P1_EN) ─────────────────────────────────────┐
>  │                                                            │
>  └── DSI ──────────────────────────────────────────────────┐  │
>                                                            │  │
> ┌──────────────────────────────────────────────────────────┼──┼──────────────────────────────────┐
> │ Qualcomm Display Daughter Card                           │  │                                  │
> │                                                          │  │                                  │
> │  ┌─────────────────────────────────┐                     │  │   ┌──────────────────────┐       │
> │  │  DLC DLC0697 Panel (ILI7807S)   │◄────────────────────┘  │   │  WLED Driver IC      │       │
> │  │                                 │                        |   │                      │       │
> │  │  DCS set_display_brightness()   │                        └──►│  EN                  │       │
> │  │        │                        │                            │                      │       │
> │  │        ▼                        │                            │                      │       │
> │  │  CABC output ───────────────────┼───────────────────────────►│  PWM                 │       │
> │  │                                 │                            │                      │       │
> │  │                                 │                            │  LED outputs ────────┼──► Backlight LEDs
> │  └─────────────────────────────────┘                            └──────────────────────┘       │
> │                                                                                                │
> └────────────────────────────────────────────────────────────────────────────────────────────────┘

This is a nice diagram, but it shows backlight LEDs as something
completely separate. Usually they are a part of the panel. Are they not
in this case?

I'd be more interested in a different representation of the information.
What are the _actual_ panel inputs? Decribe those (and only those) in
the panel bindings.

-- 
With best wishes
Dmitry
