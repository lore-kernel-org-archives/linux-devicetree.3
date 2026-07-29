Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B54D3C3F75
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325047; cv=none; b=p5VLfO8GimWs8jn9e9LTT1qUoggFj/Sa4QS4na4nLW0I7dHElqTIeaXhoX0pZwGwoDfNq+Y/5OW2S8Zm0kcyfrMu1yN41q70pPDCp11n+lKwytIG1LhdKEl7LUdQWEyAyM2N9PKXtSdIUs0YJADcG2ZSxJv8j8Dd99M75b7xgwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325047; c=relaxed/simple;
	bh=jX4ytLiDlHTnwLtKQDI8GK7zxpHUjDcs70Q2mGNIQzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2zQpgFINVlWs2wNCtz2C2OU3w67AuH/0gGEPigNgL/poS1UEHrsGZasFxe89OcLsc6PP+JPeKUkv2Jj93M1x0fQU/8a9AVYVQvxbLGXFQbhhrKJcG2Jbyc4DoFoYCx2+zIi+lV0iyIqXZYz8xfwD3ncX+ZaNCyJnSshDpuhLW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIGCXOBa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3MRLgyi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIGCXOBa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3MRLgyi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBXX0Q1218133
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JuKTV+oT7PmTQiu/vwLbiWOH
	3Hnm+6HCgD4PAqwboi4=; b=eIGCXOBaDq/Zp7sSl4VKuXuBoKeURK9h1aUx1Qdf
	WxYgF+TOi0SFUK3WUv0HFr8eROt7ET2YJE3RhAVVBI9c0Y4inDjpj2gtkXTmcAiO
	DSaa7US8bmg2Txje04V9JdOnh4lYwbXrf7+veFWnJU2kX3LP8SINp1M7DiEuVwd+
	TiNYsL1mDBf5Mnto78xbwxEQOUwv2LwQ6uLO+S9lwLeRq/1/hZkVXMW8hnI/HH7l
	e77HEm1hY+J/GOItZeEKhTQaa38ieXVOPbc3WQGkK9y66Aebmr4pJ7z00pJSnF/q
	hPyf+IvN4B9k3GU3xrV2t+ogec+uLgypwtw3d5kl7tgWQw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj00h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:37:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e63de75aaso1373285a91.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785325044; x=1785929844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JuKTV+oT7PmTQiu/vwLbiWOH3Hnm+6HCgD4PAqwboi4=;
        b=P3MRLgyiKvx/ky9o5xqdnWhr8yk96OGjl4ukIryEzpigZTuFtr0Nf7Sui7wWBzMGUL
         o71ioLaAx0s9XCc1Ee6VW3sDf4D5GODB6NPooyuWiUiOPmHjxMnVN0QKx3lXvyLA9vwV
         mOH8gPOm3nHXMq+1fjPUth8xB/odCiFKRwFAK3uLXR6nGcV+uMaxNpQKK4BOYrwkJyCx
         1qGD1T+ISuONdQpeRxpSNsoqNiDq+oW2vmTDx8hWq7wMrut4iDpQ6yXv12KciuXyNf8I
         KV4AVBidQKqcRuaxUZThnoISB7Mw0/INvV3bwT+l8Js+HbhHHHYHQYpiU8Yv1Eg/XFSH
         Jwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325044; x=1785929844;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JuKTV+oT7PmTQiu/vwLbiWOH3Hnm+6HCgD4PAqwboi4=;
        b=CWpcr03PfmObAnTcYWQnJpbsri/u6rs6LuKIQiac2gRDABLBNPGV0rkZWmmRmkEWuc
         L+MQ1cK7pZ+7hKD7552jD0by1uRgVqLNY7zQOHn6AtSSdpcVUTGC+nfCvnk8PGkkOzTe
         FAgFaNhYmc4YCE4A/DJNZl/HYvtpXlTcWfCMUp0jGOdYdDHdqpJ1JH/P+53Pp0ojFXzC
         AFYs7V+FU6JlfUlVivu8bQJwKlrQSAnuEON31UVlG3XLhaHRPFhW62S615p++gK/0EOZ
         AnrKq68MDbvXv6gZAkphv1wcPVau9VobarZHuZKn+f4a9SZl/1a1TjzIbT5ckOMmeROS
         uwRA==
X-Forwarded-Encrypted: i=1; AHgh+Rr25al6dZzribLnI+ajp4FG4HbFFQy+2pDfiJd5rgLM+PuAXlmm8jrOs7f+k9Qvy9FrYO2wASapMWQh@vger.kernel.org
X-Gm-Message-State: AOJu0YxHcqDsGPSmh/GdMdCnooC6lEKAu24T0c1wll2RUne1IOwB8sjS
	lICF6WXeaZzD4uzfnGNfF7O4SEUyh7CaHDl8XO2K3j7jidg0a32NczlKO6MwjR0sTqfa2m2mqDW
	4vRkYLe5zDAECyrKWWrBZzhmAnc8/SWaKJ5XCwBOKZyPBaE4O3QEKY0W4dr9tNtOu
X-Gm-Gg: AR+sD12b6x7Fha3DmQKZVgQqHxV8C/tG0DqBoFAtWEjbEgkVJssT0BatWub6kqJmmtH
	SsITJ7N1rIL9Pxc2qy5UJmHr2WFTHmjo10NivarEsnCJxWRQHWaTJmxdK4B4/GRnIfb5SUvbh6b
	bBC2gGXjszMI14wZYQOpjgG/TygsTZZ1zsyy2tE94B1ITiFbPME2rLxDRhmyK+feOqOF+qVYntF
	+zxIzLJwWzb2AqW4z15umJfMY5lymm7aC7ugGXERGnO3mh1HqKwLPcmoaJfEFMlWbWluFUdBjlO
	JpcS8pptKncJCuLL9QCCBLCi4WmiPbo9gcP60FfIGDoccBdHaXezQaYyA6BhaM6Zhyf17JP3LSf
	wawycclzpqOD6uKPvTicijaRkkw==
X-Received: by 2002:a17:90b:2701:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-38f6a4585e5mr6625877a91.10.1785325044117;
        Wed, 29 Jul 2026 04:37:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2701:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-38f6a4585e5mr6625838a91.10.1785325043665;
        Wed, 29 Jul 2026 04:37:23 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504db2c4csm9199730eec.28.2026.07.29.04.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:37:23 -0700 (PDT)
Date: Wed, 29 Jul 2026 17:07:13 +0530
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
Subject: Re: [PATCH v8 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
Message-ID: <amnl6SENeY3jjBm4@hu-mdsor-hyd.qualcomm.com>
References: <20260728-lt9611c-v7-v8-0-bda216bfaf37@oss.qualcomm.com>
 <20260728-lt9611c-v7-v8-1-bda216bfaf37@oss.qualcomm.com>
 <114159dd-0271-4d15-b07d-20fc1e28ee6d@kernel.org>
 <20260729-truthful-cinnamon-giraffe-f250d6@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-truthful-cinnamon-giraffe-f250d6@quoll>
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a69e5f4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=9bdzyRqNf_OfPh25cPwA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: PhAsb0HHQRXll-pro5-9txmiHTep7fA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5NSBTYWx0ZWRfX7zCM+Tis8U4Y
 M3Te8Xp/lV7X39G2c6xbWACGsR75FiMg3fLEfiDprsSmF2J9wrtv4E1gW5kbULGia+zgUvRHZHG
 BllyM8Hb6GUxddv3AVeG4IKMwVwJIWOIFnrKCCMsgYadiMv/UB8+pb49X9R2ZD7oJpUtrvg4i7D
 /ihM4DS0/9sVfpoNMVeeK1137Hyx9Ojydrrpp110oxkg0cFpOY/fQDzXLg9PyXuA6NJ178sBKEB
 NemTqa84w5WV7iRU2ervHq1siA01xl35k3CoY2kA4mQvhepqTi6HtVNeigXHAylHMR801tlofMu
 mSp+/0oaO4eeHv/fyLgVeeDMUeCfJtDeTqVErEtGqlHWtDUn0kbJI9fXzVOE+BQquVTbsi2l54Z
 JU0vyFOQ/ybKBQk6J48b52Rq/QzyNmdsaKOMyqSAVvozaeicdl40pCyaLMpeH5F9olASf8QOBPT
 lL/ENyAk6a2k9Lh+v6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5NSBTYWx0ZWRfX2fZh3wFAcsiv
 rKYrCeGCHGaeGvmJ5DZkB2FoMM8UTzWQ4svBlcsOsHUR/Gt6tJ/57RgWvvjPQYfcqdxHbar+GKm
 C3gA5Dl1Aq7hdbnWR0I3HmAlAlzXRe8=
X-Proofpoint-GUID: PhAsb0HHQRXll-pro5-9txmiHTep7fA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290095

On Wed, Jul 29, 2026 at 08:37:42AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jul 29, 2026 at 08:18:58AM +0200, Krzysztof Kozlowski wrote:
> > On 28/07/2026 13:09, mohit.dsor@oss.qualcomm.com wrote:
> > > From: Sunyun Yang <syyang@lontium.com>
> > > 
> > > LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> > > mipi dsi and output hdmi, differences in hardware features:
> > > - LT9611C: supports 1-port mipi dsi to hdmi 1.4
> > > - LT9611EX: supports 2-port mipi dsi to hdmi 1.4
> > > - LT9611UXD: supports 2-port mipi dsi to hdmi 1.4/2.0
> > > 
> > > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > > Signed-off-by: Mohit Dsor <mdsor@oss.qualcomm.com>
> > > ---
> > 
> > NAK. You received review. Sending the same is wasting our time.
> 
> Actually you ignored TWO independent reviews, so I will not waste time
> on this patchset anymore.
1.
>> So you need "if:then:" block disallowing port@1.
>Ok, need to add in driver code? Will add this in v8.
 
Sorry, I missed adding this in the bindings. I assumed a driver-side check would be sufficient, so I added the following validation in the driver:
+       if (lt9611c->dsi1_node && lt9611c->chip_type == CHIP_LT9611C) {
+               of_node_put(lt9611c->dsi1_node);
+               of_node_put(lt9611c->dsi0_node);
+               return dev_err_probe(dev, -EINVAL,
+                                    "LT9611C does not support dual DSI\n");
+       }
 
 
If I understand your suggestion correctly, it would be preferable to enforce this constraint in the DT bindings as well.
let me know if this is correct approach for DT bindings:
 
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -82,6 +82,16 @@ required:
allOf:
   - $ref: /schemas/sound/dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: lontium,lt9611c
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false

2. These are some odd characters here. I guess this was in earlier versions
as well....
I am sorry for this, I missed it. I will correct it in v9.
> 
> Best regards,
> Krzysztof
> 
