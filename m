Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3655379C59
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642062; cv=none; b=AR2z/phdB74f1vNYfGqQDRfBI8RbEn9f0HTLPYVD01rT1mDdU0g6zbQF5XswKgSQ6TWwmt+7zrI4LPslpvHbD/7Ku9cM7+exCuc9C/SjjOU3FFNxBwZfCb7bzJuExiaRNnGGJXNYzWhrBRNns57zczM9943h/xourK2C1hFu1s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642062; c=relaxed/simple;
	bh=PsxXB1ADQuqK2s194UmvMpzVkXD+A9kh+m+10fFTjKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cc6ld/aCkd5MqZwz94KokQtmG6tepyyslYc1nA1a3JiqR0niNrghQvhGhqbjAme1oiQTaTJ8YZDCxIrCHbbrSEPx0pnw4/+v4nl/rZHgpDuBKdvwH/gl1YnqftypLl8jUpyXHqZ+0eDzLnu9YyNltA9U5636UQQg5oWUXHxoKgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqtjO2F7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwUr+t0i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqtjO2F7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwUr+t0i"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg6Hu1707990
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YNbDulAa1I+AbKFTKUClc7Hwh6v/gjl6MCRbbkrXRFI=; b=GqtjO2F7DqutUXGu
	IGh4Zy8RyYG2knw2smRWSwMNamUqzcbOf/D+c1ZAgozDJY2jiAjQ7fQxXjlGaRVS
	O4Rk6pHglewkWirb1l1CxLECDtWO9i3X2u+W66AI6JQLNE6/eZhKOQERJYbeF1nG
	NY884cqM7n6wl6h+9PvYAoAq+2BIAu8uYp/tci88ByK0B83G8JYzKcYlghaTvVLK
	+vSOqDYm7ZKZtE6PNLUJDz5FuXXFMS7yD2ywya2h6Q92HY0JslLhnK83aQF510Oe
	qAJh0Y1pZY50k+WfUlBehuf01+Qehpk+I9Kc0pbDs2DgQBEPMm8O5xtukLX2H1xz
	XuNHfw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae87t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:54:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so16390898a91.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784642059; x=1785246859; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNbDulAa1I+AbKFTKUClc7Hwh6v/gjl6MCRbbkrXRFI=;
        b=cwUr+t0ioI0XRjyfhqsQOQGI4H9LsFqJlyHOdspohrEnX0GchI96+PdHF+0XoCRSNY
         856D5l8UPw/7D1D8R+Vr/t2YUvCoigOVuoT8gU58Qu7etK9O3N1d0EGPAFUpYwYazgjY
         USGCW7KcuiTGd92jyxgEucZI1yVFOt4pj3lY2dF30wiF2kI/DRaK6i8wZNXyqeRrR3gy
         iZUkb4qgHSogwq5T5eMUmdZci5/qf0+Ls1Fp0AsYXSOyazeJI0HeAl4oxdNHzHSSI7UX
         98DJ9imQhilqLAkBLxrFfRC88m/D28/8oH0wMPlMz5yKxhEQ2vZnzE+xnAnHN4zgbisR
         Q2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784642059; x=1785246859;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YNbDulAa1I+AbKFTKUClc7Hwh6v/gjl6MCRbbkrXRFI=;
        b=Da2CcoS3Sj5d8J4EoApbpf861lytSS/00zMDx51Xc41PVUCrGe57I1yrsjs1+E0DF6
         nuZIvB0ARCrrW7EkrjXAbr9mb+0KuqwNEmaIla9k/OWpT56zP5KLA1Vm/N+Lk0Y47ieD
         6V57CGjj9LIF30rPb2Ia7SYFOOJ8J5vggLgNDPBrJ5+gPrZoKbJrQC8m8foLjSjzASj1
         AxfCnGHttqb8+GON/kQWY7oqkTrdJsvt2Sy2zxRFQYLpd2UIahOjLOE22TlWWVH+eGHK
         JajJZthKb46QE6Esk9SI8vuqsG74efz04SuJEzCFTajTTBCJ3cYxhZb1apblZV0SSlYV
         lDWg==
X-Forwarded-Encrypted: i=1; AHgh+RpzSHEu1n4BU4cSpuIrMfq9pPD6qO4o1ISrR6fjw7e/BskVN4EWIqQh8HzQe45el1IzXB+C2txsa8Oq@vger.kernel.org
X-Gm-Message-State: AOJu0YwPktTZbFAu3JBzUhAqc7ntE2Q4/xWzuqHAq5QB3RwTHl2PUh55
	PrDPBSGpJ5JGQUJmoY2SsOUk+lIbGMxM4zTqVE5IZDV/lJlLBgzU9X0vaL3AptKt4T2zNI7rtOU
	LUKtNuRPWCFJn+R7dfc+1bI+kyKN83Xa+ZUQtQfz9ou4gPJydcpHhJEa98s5eB9H6
X-Gm-Gg: AR+sD117HUMRlBONycxNBmFU05BCO4l9yDJJDdBSX8yhogGeAyFc/Mh46fkAD+LCbMb
	dLCOFgM310kQMFxJWXSQZS6YWIhGS+Xl31aghY5Xxff0pz9w3NrbNISmjwpA6tyAwa//CQjGdS2
	EbnFrNxtJVxL0IuYAJxPnVq+7eGGqfeRcy9ZNhHYI53vpqSs4lhrQFkQLVjtRfCcN5OogBkbLYI
	ETwpIDFpu40j9ZcWk/jVSXe6vJ5VNF++qmU451uvSti7iDwhDg+Oa4RIMQxqoZFXiQtiBk4+NL2
	95N1VNcJ+0mR4iw6pHO2dHNtUEiK97+FxvSDu2EUNdu769QfkfZj6UncVUVXgffcVKfMVim1GCv
	hs4yoxf2qJ9vUejbN+AhGAcUBPw==
X-Received: by 2002:a17:90b:4f89:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38e4b40f926mr19219121a91.11.1784642058564;
        Tue, 21 Jul 2026 06:54:18 -0700 (PDT)
X-Received: by 2002:a17:90b:4f89:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38e4b40f926mr19219082a91.11.1784642058084;
        Tue, 21 Jul 2026 06:54:18 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2900a37sm39019725c88.0.2026.07.21.06.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:54:17 -0700 (PDT)
Date: Tue, 21 Jul 2026 19:24:07 +0530
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Message-ID: <al95/zd0JTOv8UY1@hu-mdsor-hyd.qualcomm.com>
References: <20260716-lt9611c-v7-v7-0-7553a14735fc@oss.qualcomm.com>
 <20260716-lt9611c-v7-v7-1-7553a14735fc@oss.qualcomm.com>
 <20260719-sparkling-musical-lionfish-bb9d80@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260719-sparkling-musical-lionfish-bb9d80@quoll>
X-Proofpoint-ORIG-GUID: dbTUKz18_qtV2Z9_mx9WS3QfrmIE9QHX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NyBTYWx0ZWRfX4u3Ve/bIYyxJ
 7Y0z4HG5t9yqFdC4wbT8aCcd7VlgJVWuhy0CrFEaOHkp8T3hptj6FI8xWlhgmsQN7texvrDN9jS
 XMSAIk7Pp0Bq6TplmRZnzei07qJIj5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NyBTYWx0ZWRfXxJjIaEo7e4/I
 Atxer9jafDasc5180YCYpSsLqvbvxxbaCrQi7GRiCSJLTrJKc/53lJUJ+NVi1JFfyFQG23MGTsp
 PXwhazGuswOWoix1NUP6fYqbLOsMBQf10Lt81alepNGXL3zO166vtqi24AX2+FnM9RzT4bsvUTS
 sm1J2ON7TawaT7+ZAVyhPmhdguoVcxDg34Ub9aW0KC7ubkw64R4rGyZutHesGoBqyDFCWJJ5aC5
 y4ujSR3QBjVkCsugsVTqPcSl4yBBDpzHcHOMAQaH1shWc4Hp4hmoi9d2PzVcm4/WFckTFmUm5TS
 CKrqa+AODtQVMO9ePi8qfUsuzfwU8FZDL0dyxqFqInF+LXAMKqHa5O1fKmA6xNHgFTXVmrB72OT
 pO58kVjok/cY6Ybt5TRpr34gxru5PiLKF5YDcSQpSyNZEOkgpqNHJsImBa7BytqLsncPgDgUn0j
 vHiEXuIKTc5AzMO4m7Q==
X-Proofpoint-GUID: dbTUKz18_qtV2Z9_mx9WS3QfrmIE9QHX
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5f7a0b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=VwQbUJbxAAAA:8
 a=UgQGg25I8tL8cNqpnCwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210147

On Sun, Jul 19, 2026 at 08:36:51AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 16, 2026 at 05:01:09PM +0530, mohit.dsor@oss.qualcomm.com wrote:
> > From: Sunyun Yang <syyang@lontium.com>
> > 
> > LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> > mipi dsi and output hdmi, differences in hardware features:
> > - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> 
> So you need "if:then:" block disallowing port@1.
Ok, need to add in driver code? Will add this in v8.
> 
> > - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> > - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> > 
> > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > Signed-off-by: Mohit Dsor <mdsor@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/bridge/lontium,lt9611.yaml        | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > index 429a06057ae8..e0821a63d9d7 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > @@ -4,19 +4,23 @@
> >  $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
> > +title: Lontium LT9611(UXC/C/EX/UXD) 2 Port MIPI DSI to HDMI Bridge
> >  
> >  maintainers:
> >    - Vinod Koul <vkoul@kernel.org>
> >  
> >  description: |
> > -  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
> > +  The LT9611、LT9611UXC、LT9611C、LT9611EX and LT9611UXD
> 
> These are some odd characters here. I guess this was in earlier versions
> as well...
Ok, I will fix this.
> 
> Best regards,
> Krzysztof
> 
