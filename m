Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80A82DC78C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 02:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784169364; cv=none; b=SjPFpeOWEO44S7CY0uXfx+pNiVGAJXrhWnPT0tRz98ocPjCqqPNm38uoZ4GJrjU0CZH0EJsgFXlTU7KtG5P02EE2EdZ6YxMmzsPZPp7YQ0FI4c+HLpmVABSZcBv3rcdZ8KtqXSyjWAKku14txviUJYNhIDRbaaLWlS27vl5DCBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784169364; c=relaxed/simple;
	bh=h1UZyikz0JDoM1JObJv4IyOGznkDwWbgrD2GEUT7r14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzpN/3UzeSuZ2ITifmWkm5tLaJdLEBPSEDKAag27dNGsdMAXbQLDc3vLwbabdTH+5hM/lg7gumAHF9p4D7Kymxa6bPrKuAoSOrRoREfcw7UxfztWIo7kN6Ub4hfimGLp+if3ih9KbqjDJJORBKrRnJB6ekauxMVnZzaPkoe8qAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIyNH0o/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/+j91MH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIyNH0o/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/+j91MH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0Xa2K1005044
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 02:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g05Nqs0a+DO3y0LDbu2S/rRe
	I308lTNH3/Hk03QO/Pg=; b=eIyNH0o/a4myHg3bP/nbm19i2mgZUwFhTPhCQT1m
	8kuhmlCX763vDqt1xE2rLsIvrSOPE6fRWv4JlFn8xVzfLWhqmxgSKqkgqEgPm9FC
	zMdaKjVkn2g+H0JLV5XKj5PjybgqcqMlt2FuTCD2Lv+eBE9CWtHFkAuD2KEMmNHg
	eFWFfynIZ5UKG8+XZvfima8ViXnnPdmlw4X7rnoWMxl7zFEkO3+BQx6lZLeIMaMQ
	Z935+HUeTVTNPxg9ZIM0CkBxZQz0lIgyOAPtmmZO6Q5Iehj5TQnS7JYhqqn5yOY9
	nx6MQ7XhXBFjzlcEZZB8RXSlaOGWYo/4bSw/mzu+ZQ/UOg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fecnya7k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 02:36:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso2469848a12.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784169360; x=1784774160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g05Nqs0a+DO3y0LDbu2S/rReI308lTNH3/Hk03QO/Pg=;
        b=E/+j91MHD5jp6lDdmbMlXaryyDFubCYuCRArzTvPzqVbjz46s++JDPfTyMO9QemfTi
         jmz8txmTKC4+oGvzFw1KvkauZrsDihDiAmZzyNDtqJzy9RURS+4KZmZCTZixdT/ce05D
         tjWfc64+4vCGRJ69/48onC6HG6qt+DkDN26XjEqrDsivZeHaCTi36pEUhrsice9a8ZmU
         3qMo0yneREfA0GVkaXryXLE5kLdYZgOAYwliZZfiAkmokvQfiicIvZTVAGX4kKelXpW6
         2K/vdVOi6V0WcaS6+NvzkbNvJQUMBq8/3AMYDSVzmPghj3o12WEgEXrFvKLEAzt8GdJ/
         G9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784169360; x=1784774160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g05Nqs0a+DO3y0LDbu2S/rReI308lTNH3/Hk03QO/Pg=;
        b=qAbawP+sEhO/DrCa8+89Lvhh7q7N0+lL3KhHB1rxx2aDqxvxANjM2AQHnzYhgpzZWp
         Y9DeNqeIzMbLwDG1BUB6e+flxrchOx/gEb2QAftWD84uHRVlUcB90Qp9zqmo6ljJu4EX
         eslBbBM67guMGk3gx3Wsrm8B8fV1FmTFtrFv5qL2dxVMA+XMg7aBS6sNFKR+WDDsUCEA
         gNIvSUZXCwmF/I83MeUy90RsVRXqf7E3jGBs7rHOteo4nYwoBUjdhfENXTfVIudF/i8G
         CIAXBDzODYZtfm3wfo3ouu+67CKN9tFIO/3iPM5d0jsfuYr6iSwX7F1DyM4AFzcM64uR
         vDig==
X-Forwarded-Encrypted: i=1; AHgh+Rr40In+R+DXr7srsXhnd2Uy+r4nEhbLj4M5bChKVAmMN+WvcF1aFnhByuyxEnpM93eTh28pqWKeegPp@vger.kernel.org
X-Gm-Message-State: AOJu0YxnisM75jnZh7/xCoUL7oljCCbQMyt0qLhNZd4wgZdp6IywedbE
	RHcYFCkQ3CgSm3a0MH0FruzwQHoV2WhSyQKrtuMSDwzOVH/RoOfdAa3dyQCYhJFkfliozd8b0hh
	l70v5wD78S1OK/qutSgZAYNILeTHEQMvPSy0+dAfBlqsgJ6CJKBX69sLlb0gBOv6V
X-Gm-Gg: AfdE7cn0ac1lmoqck3I66vUbFu+Xc9CVOTJ8ypiF2dpMBPnD9E5g3PXOHmB0d632W+e
	TotDNa1GTIe/g1+kbmoPLgh6jbJgvGqcP2N5ldhOw72XRQY8hZcWjkgGMtnlXaiwPgCiJ72Inax
	K77eYTqqzddx/TZuN/4ynBxrFtSwIP2iI52qVj3zeL99oEtcsxpo2/SvmYrlCqKS3f4c5ydCefe
	ZPzMjJKbSN3uOBCHzkOwf10qyanZeVj6HsUcDWSLEEcPs/GthT4NZUnwSbjPRrxx6TP3axg4rpb
	Cr/obe3ztuEZqpeavqRtz4yaQtwRagcp8E02o7t/Bw59smNp53UXUeLVXv5qsH8704ZGqDV9Zps
	vZlzlH/k5eVUv968ofhwHLcFfluEFVOw+KsWuKBsSR5C05KFu4A==
X-Received: by 2002:a05:6a21:4cca:b0:3b4:8a40:85ed with SMTP id adf61e73a8af0-3c11077686bmr20992760637.7.1784169360278;
        Wed, 15 Jul 2026 19:36:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cca:b0:3b4:8a40:85ed with SMTP id adf61e73a8af0-3c11077686bmr20992729637.7.1784169359836;
        Wed, 15 Jul 2026 19:35:59 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42a155bsm5829661c88.7.2026.07.15.19.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 19:35:59 -0700 (PDT)
Date: Wed, 15 Jul 2026 19:35:57 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <alhDjZ0gJZq_7G6z@hu-petche-lv.qualcomm.com>
References: <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
 <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
 <albAccNnsI12AIUo@vbox>
 <alcAjvLJCz9D9X3p@hu-petche-lv.qualcomm.com>
 <algVe_XD5xpB_w2c@vbox>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <algVe_XD5xpB_w2c@vbox>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAyMyBTYWx0ZWRfX1ukKw180P11u
 r5FqifARkMQ0i35IkqtRaOIo0lNTqdd/UGihvIQnWCXxeOplP+tfMpixaB4o1gkh6Ciswz5h7+L
 BsjTOQkXsar/NQUmWdTdctBxJ6Uix/E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAyMyBTYWx0ZWRfX6NAbLo8fZj6q
 FSpxTBtdjzvTVvyZpFBX/Cvo6hU1ceiqECvOE7beUMgfrSVqd9y3oLq8+t/xaWP4oDPyhLQ5mZb
 EeBlmpXzZu0gxMZChhetsZ8VxFUjmudlUhgx0PICzPi2K2DN1pAUPFZ96IdQeI/aU+c6TxMQGwd
 eG/w/HZm6q4BVouMM8Ysm9EWh1ZNWKnq/iYwKrxwAI6asHg+mpJoN9OMrX37sNpzAsiV4hsy37R
 Ts3lbMiWJKw6d+wNoLF/U+Gyh4s0xOwjslIdQ3r08y6G9OM1lJz6onoaGTYxnRyKhpUi+s9NHUU
 R+ETjZ2aDSYDl6jEogS1NU/PuttRSA/RV8liQGt5HX/OYJfchgb0wLYS4KNYMCjnU3otvcLlIME
 pgBfKapVIP3fftICf454psx5ax4NwCGZzlo0nJGAWTM/chjcA7Y23OJlopxWHfJJls7CP6KVDU0
 VrX8iqR8M64FR+zNVlA==
X-Proofpoint-ORIG-GUID: 3Ucj3DDB0oS3beJvT6X71CEzcEXtrfpe
X-Authority-Analysis: v=2.4 cv=Lt2iDHdc c=1 sm=1 tr=0 ts=6a584391 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ozYoIpVpmoLeJXfkQ_kA:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 3Ucj3DDB0oS3beJvT6X71CEzcEXtrfpe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160023

On 26-07-16 00:09:47, Thinh Nguyen wrote:
> > 
> > Only the new user for adding phy_type="eusb2" at dts needs to check the
> > controller logic, and this is what the user needs to do that check the
> > new added device tree property logic at the driver.
> 
> To clarify, are you suggesting to introduce a new phy_type property to
> indicate phy type? If so, that sounds similar to qcom,has-eusb2-phy but
> more generic. Also, where do you plan to define it (dwc3 or phy node)?
> 

No, I meant just adding new entry at below usbphy_modes array, that's the
easier way. At the current code at of.c, it indeed mixes description of
the phy interface (between controller and phy) and phy type, the array
names phy interface, and dt property names "phy_type".

diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
index 1ab134f45d67..5cbf17d493ad 100644
--- a/drivers/usb/phy/of.c
+++ b/drivers/usb/phy/of.c
@@ -16,6 +16,7 @@ static const char *const usbphy_modes[] = {
 	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
 	[USBPHY_INTERFACE_MODE_SERIAL]	= "serial",
 	[USBPHY_INTERFACE_MODE_HSIC]	= "hsic",
+	[USBPHY_INTERFACE_MODE_EUSB2]	= "eusb2",
 };

line34: err = of_property_read_string(np, "phy_type", &phy_type);

In fact, HSIC is not the interface between controller and PHY, it is
after UTMI(+) or ULPI, and similar with eUSB2.

The API of_usb_get_phy_mode is mainly used by controller driver
to know what kinds of PHY it is connected, and do corresponding
configuration, the configuration may not limit to interface between
controller and PHY. Do you agree we just take "phy mode" and
"phy type" are same thing, and delete "INTERFACE" in this file
and add "eusb2" as a new "phy_type"?
	
> 
> If you mean defining a new PHY_TYPE_EUSB2 constant in
> include/dt-bindings/phy/phy.h, the glue driver needs to parse the
> phandle args, and the eusb2 bindings would also need to change the
> number of #phy-cells. That's a bigger change.
> 

No. Like you said, it is a bigger change.

-- 

Thanks,
Peter Chen
