Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AC241A509
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097121; cv=none; b=D6CgkRALVjuayEr/cvVpi0d1cjqH8XS2+rBh7QPoiOXkBy2yUeIrwzqc8+eOh/5TYXkC/TFQ8IlL5diQ9o6gkIRnKR6C7JsOHTgh1eXc/VJgcI1pGeKqjWdMhgmiYBQACN+4KxPXPCNb2+RzmuP9HTCEP3RJ09jRO7AQyx3RXDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097121; c=relaxed/simple;
	bh=6kpgwgdvhMqxKGCqLqPJ1Y1A2f8tPLktx/AfyQsy7oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuZy2gHmIuK+cXDk3hIrbY4/Tljzm90zIwyyfYGL6+53Rwt//y4f5XSVXMB4af55gpA5xpPVw1JXwgWuIeAZZEWBhJ7y84bmal2OP5OJcMQDUxOB1IYZgUKea9BHSxbFhyMC6o1hx4A7YgWW7FeP9njfcVDxOFfc7SYcRY0pswM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKt/1nGi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qq8ipoFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKt/1nGi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qq8ipoFp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777m0VA3176993
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 10:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fAWs1UURLeEUz5Iks1N6ZLGS
	oNm7yU/XEj25H4dV1/4=; b=KKt/1nGi4WfbGU2cFvbb3TgJclAIq/vVviHNWdTQ
	6j5I9Mb3uTkTbzgIx4cHHrYqD3OvbOY9VwqjRcA4oH6qb/NljcTRos88FoMXBEVL
	HHTCJK2oyz4kQP3COyqg6LB4TuSM2jAZ4pV8buvtrltxU+xF+c+ZcNvwc6tp8zyW
	ehGuWdV/nCLAYVFlVeRid2bMQZsq8dBdLBSsuEn0hpQ7gCFJQVQlufFwfJSn4aZ9
	KNo6qbgf7VrGTGxMYWQqZwh8iz4dXdC3LrqEDvCeC9RCFDVWv2w6m1c1fynqcT+f
	dpKfhVcxFVLc0vbuhcp11ZW+ahJvMZdiSWPFSJu784hl4A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jkavq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 10:05:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e667368f0so5117837a91.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 03:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786097116; x=1786701916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fAWs1UURLeEUz5Iks1N6ZLGSoNm7yU/XEj25H4dV1/4=;
        b=Qq8ipoFpZz6BL+haSumX2R5WYZy0b2H6D1g+6JHhzV4+LCwr+wAJ7v7YQDkIAj423i
         0HKnm/nANiQ4Ioi4Tj0HeAyWgEQH7UcEpWjpevdtjB+gR2U2FHMXkFo/26yzi32m1tMC
         zKzvux+aKhiFcQsWmd0JV6bGQ+xoVm3PCehMFjJjnCbje5npXEX1YxHWEwc/gXxgpRES
         yB6PTUWwlBX9k1LmgztluOpukN+oWylzGjSDW7uFwLnKytum2QsDthpPPaXoi8xIQju3
         o3zsopSVzWe1CiEDlQxjoVHz6WNnIPAYcv1mkk93a3QmjYSTT2W6xt/R227hm+m1pyOH
         k0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097116; x=1786701916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAWs1UURLeEUz5Iks1N6ZLGSoNm7yU/XEj25H4dV1/4=;
        b=EFEa86N5Z+dLM8jqh9MOIhKPz0Sq5DDlTouLbXVg4UMliKt3rIkUTNDR4/KAEcADgP
         n+s/ipMrz+RBzRfO1LnJUNUGJZIkqG0X9nztdHYTna5BIQZmZuOhcAi1eXpcI0qYgJr0
         IUvro3LrgLKdB5jbFB+JAEbsPi8yakpb49T713tpxp6PlI4KQ9ym0l0pUGyGJAu173Pn
         Wg1y1CDC+QNtdZ3a5D4i4KoC2Kgw8ibqd4P726MBwrRvvYQHl3SLl78WGoi4DOCsNCkD
         3kLVO8P84/8q+D96CWxr2qpdEiXvTJMultqLMM8DcwmhUEfVyA8gSyrU18nqUK5KKtZ9
         p9KA==
X-Forwarded-Encrypted: i=1; AHgh+RrzqtrxDkWH71DjzORE7KA5pmePAGtrV2wF4J10T/VOOCSLnqvs7ecB9WFvwaNYtIt4rt/gXmTqSyeo@vger.kernel.org
X-Gm-Message-State: AOJu0Yys1a9kwcvDQG9lUO86bbbSxj4jUk+E5+2J2qwMgK/vZuzO/QxW
	ZiUFQ0d/OBbDC5DKaJ/jpbUUqt/qs/bCr4SbwKIOGwAGRQrUVTPPDCQiZKR79MNdwgpkE5towmE
	xUyU6ZlYv12ZJbIy5QUyC+3nh05MgKXao0hHCdV6OK7hXOwapJSjeVHPqNDPLrooc
X-Gm-Gg: AR+sD10ijthGCgX7WDrU4T2Tfncmfkn+JO8k9cJPQ9V8tPEthdc7EBYykVe0CdEj4Tc
	2e4AkgPbtV/3i5JVa/MIxb3WzRPXhFZ1SKo/1/rAFWsjOjr/DqU91TEoS9uULqd7BD3tdYHQjXy
	wfi26D9UMOgdVG6yuokM4AflvkMQqMh66A++35dakh97mLQr+JViDpOcMGbCsQxcTUE681vXOx6
	AxzzfZMcWiwMUP31oI4Iwmpl2pZhL3/rGEBURS7UuK0+82p69aAJN6UsxBOxODkW7oddGNExHiH
	Flp0lHkJVhVKfG93/n9qxBsfcpAE0BHFUZjiETa8rtkg00drxFoccJYYmD97AgCDFJzihD2pPdw
	VPstoFXjByVR1kJdTOY2l0dTsOQ==
X-Received: by 2002:a17:90a:fc47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3903c599361mr24076644a91.1.1786097115736;
        Fri, 07 Aug 2026 03:05:15 -0700 (PDT)
X-Received: by 2002:a17:90a:fc47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3903c599361mr24076598a91.1.1786097115298;
        Fri, 07 Aug 2026 03:05:15 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86f98esm5832917eec.6.2026.08.07.03.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:05:14 -0700 (PDT)
Date: Fri, 7 Aug 2026 15:35:05 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sunyun Yang <syyang@lontium.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Message-ID: <anWt0ZD/99ImqtGW@hu-mdsor-hyd.qualcomm.com>
References: <20260804-lt9611c-v7-v9-0-3423a76856d3@oss.qualcomm.com>
 <20260804-lt9611c-v7-v9-1-3423a76856d3@oss.qualcomm.com>
 <20260806-gregarious-swinging-cormorant-f666e1@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-gregarious-swinging-cormorant-f666e1@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NiBTYWx0ZWRfX4xNQ/fBg8n+P
 uh6JmI38M74976BAw4tE/qd2Jixfk5cSfqBTCVP4ajwj7Z1jtJxG83v1QNiyGxB3rXsUuo+UHA5
 +VQi5IlfxpA3wJSGEou+4xUCpQckoghM38KaglKt7JG81+Q3M2Id7wYLL2l3aCnO8oGMOAtg2Us
 VbLmDoyWu7p1yptxsBdtSs+qqzrD/dPLYCyQHkX+0nihVxJs5EytyJWVFX0RaYH6VBTHLJcnXJN
 SGxyrZd5/fKralfhESsnewbbhPq6mJE5KaqL37Fn9HY7wvJ/E5Ry2jrjEeOuOoRy3onY7npxOd7
 xwRa+R0ihhkYJDicGnfOLVFMRsd7PCe9CEjkqC3qtSTUea4aggYKSWp8LvO4w2T/fHCssmaYIyh
 Yv5nQXEL1KbK6p1jodp4IUPaGbR2+nXnyvBIvt1LOdxN9preQSgh2xmQNP/L3iipcnQ29qKGzre
 R7/1KzUWGpoSYc42jkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NiBTYWx0ZWRfX88PiyXs1744l
 EbLQsCRzrTbgG2yoL7D5Tg5zpBi9uLkKnf3Er7XddQ7rg4hR4n3+zwjX/fu9XCK9O6/jW7RQw1s
 SC6DS7AoPNVKJdQD2qqWNFas+z79rxk=
X-Proofpoint-ORIG-GUID: AtnIjZvnybR4CItKP2-ZWANGnXXUhl2l
X-Proofpoint-GUID: AtnIjZvnybR4CItKP2-ZWANGnXXUhl2l
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a75addc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=JFLwbLnQxsueZ3v4IKMA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070076

On Thu, Aug 06, 2026 at 09:12:59AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Aug 04, 2026 at 06:10:14PM +0530, mohit.dsor@oss.qualcomm.com wrote:
> > From: Sunyun Yang <syyang@lontium.com>
> > 
> > LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> > mipi dsi and output hdmi, differences in hardware features:
> > - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> > - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> > - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> > 
> > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > ---
> >  .../bindings/display/bridge/lontium,lt9611.yaml        | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Thanks, Krzysztof.
> 
> Best regards,
> Krzysztof
> 
