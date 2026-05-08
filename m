Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2126A3DC4CD
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 12:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778242391; cv=none; b=VzJb36ibEuURIwsLvRrG0l1BViPMz7iZDg+/OgZ9RuM6U8Q7e7sIef6DfgAhtDUTAWlOrtf1e0wZYU0lIhosnkP/RBqI4wCMuPDtXpMdidM4+qjG0C+9UbWo5Fa0OX6cPX/85CV09it75ElB3kNlviukp93bjgq2bjkNHYUqOS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778242391; c=relaxed/simple;
	bh=gQhKQ9uejPq7urMZtVvppxql2FEI2E8cmhVOfecdbJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgvPzGy+FlaEQ8tz5xN3hM/+4z3XWeGwyp7aSEE5CvBPzBPhAO13f+UhFKPBvVqC234J1v0d2evoN6ZHjQgMlU9fZWzVEPp/lohtIiXqUkrNHPwssHRob0o6dlWxkZpZSG0PRNhNQUxm4ADnmAVDiwbK1hbIY1cHWByS/7EAgAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XaJ3ctv8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kiypbAvH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XaJ3ctv8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kiypbAvH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489VxBu2771502
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 12:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AzJKM4LY9eDR05imqaETs6SnpHADXv5BDM6HRtwJMwA=; b=XaJ3ctv8qvehTC7D
	GxP/NOyT6paq8IsQE+pk8dkQoaegmlN5mRIOt8r8WE4VRqJcBU/LBfoVdSmA9AYE
	/I6MwWtHP9l5VQ7yMRRhl4kscwSapmDlGqBukoC16PJXtHpZZzrBsMZfOvh9BhIu
	xT5KgH4vuFvGow9JqtHsIc41yURC0/P2SOL1fmIJdGF49hWyiyahxC1xvl0IZ+zY
	tHYxFh5qr1/yg6Xj8GWKInnbSS9q32ZmsyCtmY8aWu4VesrbGCLEx217f4JuPFNN
	JYBuYjfKlvhuxnsFh6vqPFiRBmdk4OJ3AKZ79UWJ49sV2qL713NviRazigps6ArU
	9U51BA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5kn2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 12:13:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95d434f3356so1372404241.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 05:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778242388; x=1778847188; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AzJKM4LY9eDR05imqaETs6SnpHADXv5BDM6HRtwJMwA=;
        b=kiypbAvHmrG4A/FmGXuqdKNaLA/WPhaAERn6zq5eXjx3Tfo2jOEX1ZF6HXN0qTS9i1
         FhJr7gau+MrNgPFTRBa1xx8gNzw+FC3jM2LI0B+FJMNvP25mQ+WOQ0s/JNh/TzLu0LPa
         QPtwwEWULJbUDgsoWXGu2EreymRfEBtuYHnEov2v41ofLfbvneaaulnRjRI+Uh0VD1U5
         rlMPs9lsTD3U9HtUcytrKQeykH6Vypc8H50WNOrNnw8chjO7SzpCRofnYLZb7XI7cPUw
         DlX8JAcP9MvEvqn2QNlkoBwLhouf6Rqz+0EEU0zYpOTUtBGmQFg8Vre46Z/kgpFft/jT
         ShWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778242388; x=1778847188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AzJKM4LY9eDR05imqaETs6SnpHADXv5BDM6HRtwJMwA=;
        b=kxkR1WqZiUisQCWZGTvDN4eUNCaziS2ukduCCBo+TKrKQQbTXrLfvyKUB8IZOhRCdC
         Lrseg8eXlc82RSA3Hm2uefeSdnSb9cDT3TS4bE8xZX4+vNt5vPSMTUL+t0GOqOeaolcc
         xQ/AMPRSMKFfEqBW/Igdj/QFZzd8OGtpFH8CfXJOFCG34jv1V+aCVKQ/Aec0IOomWte1
         WUCc1rzXe1ltv4jwaMn7QgltVwNM/dcXGBq0cvy+Lm9ZqFodInSLR3N+1a2BfrbcAqmv
         lKfarRUWlK5EUH9YtOrSXf7gmisRu4qXWaLh6ziWPW0hQXBLsn1mteSpHczCC0dvutHn
         pouw==
X-Forwarded-Encrypted: i=1; AFNElJ8NtRIaq4RaNepkWeCLqa3F3EV3BH3A1JXvh8hm8Xhn0mQkx6eV8nfgHbQcLtGadotXvA6yFvScLa7+@vger.kernel.org
X-Gm-Message-State: AOJu0YxXCq6TQR7kq8Z6GJ4ShfOedIsymQb01Nmws45EMA7Z/bnSgBpu
	aBVr9YnK9VaMmM4PTFcUGcSsE2laSpweSxiEpbrVk4IoFesQcfmeTHqp8Ul3ObLymyZ4rw3uoTZ
	bWy7ZlQ2uveKshE7Kkc9q5iilZzrtrwVgQZy/xQ2QvGhngKQ7NEkfVHNsUAPp/9I6
X-Gm-Gg: Acq92OEHGGGWraxWrsQoy6iScq8lzXl+Cwz7ld453eu1yMSEYwjnQ3LRNBnteRZkOYN
	IfNX5BXe+jVVu8IFtETCukVNS2slV1Kvx7UOlVE8oWJi5nila/Nx6ylxqf3cgqkWgAX3VX6VTcw
	CAk5F9Z63B/xerH4PGal0jgO7sF4QrsG7i1SpeZNGeSl4rthTQZPbsytDGHrZxHsbkKRm1KfHgu
	xTHLfmBnw7t/mSVyjNbqYTy7BgBtLQkZDgqV+rc6kVNccb5WCmvW7k9vHYJPVT2lTfuO2yHOeom
	Dl18qeHOKiZsjTEUwqkMNhUw6OOrxbtVM5P9H+fiT0+xe1vgLCeklI1p2e4fD/QnlCa3494ffdp
	oCGfbfDvahlx9tRKbCVQ86WSsV2AOXwgUdCUefaLZDEZbdKSl6HBB/lMQPU9FyoAgRzEGTmr4Z6
	CYvadHvGDR7gO2OFQGndYDxOwfb5U3qEc0+8A=
X-Received: by 2002:a05:6102:f9d:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-6314cd8bb9fmr251671137.13.1778242388307;
        Fri, 08 May 2026 05:13:08 -0700 (PDT)
X-Received: by 2002:a05:6102:f9d:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-6314cd8bb9fmr251631137.13.1778242387830;
        Fri, 08 May 2026 05:13:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b3d0sm455378e87.80.2026.05.08.05.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:13:06 -0700 (PDT)
Date: Fri, 8 May 2026 15:13:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, yangsunyun1993@gmail.com,
        xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com,
        rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v5 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Message-ID: <ly35dnwogvo4omdjvm2sqajwponibhegdws6pdbthqf6zutscb@nm5j7uyfw36l>
References: <20260507024214.97708-1-syyang@lontium.com>
 <20260507024214.97708-2-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260507024214.97708-2-syyang@lontium.com>
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdd355 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=Kz8-B0t5AAAA:8 a=VwQbUJbxAAAA:8 a=FA6Kg9t7gy3gg5_aXx8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: Gh18Flc0DDyIr2_JqAapv9GO1wUM5Xp0
X-Proofpoint-ORIG-GUID: Gh18Flc0DDyIr2_JqAapv9GO1wUM5Xp0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyNyBTYWx0ZWRfX1HRtZzRnXfvD
 HcltOEt6XNh2hhif+C9txIVkbzTmHT/pS4iwbmIANu5XvL2fpNg+VsoupaqsEkmSbK6bRGNahKl
 sXA2sxe3dqTPrG/2pihCl0r4PfNPp73Nqkj3W0jP4XzsVBoWppE+HogknlnM5lVadup3UyywKJT
 zHf8QgNsIWMfWOezjw+f19nqnFA4+9A82p6NvXuLAB4DnIBOW5FdW9kaXMX9OwHvbPDlN5905GJ
 PP4qDpLytYyDQ0aqdZw/Kxl47Pybq0hsp5KLEXgGZ5te2DRPagwzXyDZXyV9vspQWwQSzGoh2qH
 qWauo8yHTmKDDYm/YkoMvBne/rPGyaJea4lhPlxWZfs3tfiheHLufFy87ZDsj6Fw/am7zvauhjk
 AEfnyJ1wF/HWeJ5FEtM2XFEX1d0zeCOUiNo+BETj2zRM++qE1Bgyxj0WVE+OQ8ipe/GD0CbaiNA
 viB9XfCvt2pDtr7yddg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080127

On Thu, May 07, 2026 at 10:42:13AM +0800, syyang@lontium.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> mipi dsi and output hdmi, differences in hardware features:
> - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> 
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
>  .../bindings/display/bridge/lontium,lt9611.yaml           | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> index 429a06057ae8..b20a43456b01 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> @@ -4,19 +4,23 @@
>  $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
> +title: Lontium LT9611(UXC/C/EX/UXD) 2 Port MIPI DSI to HDMI Bridge
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
>  
>  description: |
> -  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
> +  The LT9611、LT9611UXC、LT9611C、LT9611EX and LT9611UXD
> +  are bridge devices which convert DSI to HDMI
>  
>  properties:
>    compatible:
>      enum:
>        - lontium,lt9611
>        - lontium,lt9611uxc
> +      - lontium,lt9611c
> +      - lontium,lt9611ex
> +      - lontium,lt9611uxd

Please keep the list sorted

>  
>    reg:
>      maxItems: 1
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
