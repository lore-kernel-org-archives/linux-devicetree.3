Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030C1279DCC
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121412; cv=none; b=gs5HcaE7HXiXjePuT3ThEbtbMNPvujE+lsaB3TF5LXFM+Upq2Ltq4eng9sLZm22O4MS+l886rCmeYc6HdSq3gGpjPBAN16xD+LBYjObycMCcipSgtZFKVMvTx7pe48DfrTg/gD1+kizlZ9f07CiGyGqcjMKY1C/7KiJvYc14ESM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121412; c=relaxed/simple;
	bh=tO3z090rRbcX5pmiGRfyA9Zzc5BIvANllEa32FwAi7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKBm/D0n6g3NMfgr6ncdO7RnNK9KgOoQrp13QvXIwObE+3cIIY7NEwDtrtN7pXEzBTT7Q+nw80Qfch2Xm0WlCDewe+cmoZ4PKQWWamVZOwLIulWgcLJyZtkEbVYipoPZoTOy7KqR8Ahr8zdbiHuHZjOJ50FjuJpiok7BB8IAJ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l37PBrSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWN4+Q6v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l37PBrSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWN4+Q6v"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEMxV7353041
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gyj20zFPQU0YdpUQ3SEBwQ7T
	+Hy4BwpnqNdcqHAgNN4=; b=l37PBrShjS/DftgrLAos7X9eXE0g7oM0XSWc+ijq
	ShHRDXQmEQbtv+4yvYBK0Nff+8PvYOtf8bBzEht1ptdcrfJ92hkUsJ7EN3sbg3IW
	0eZK/oUjUWpbPUgTa0PSEnxVcH+d7F1OTh6oGqi/2JXh8sSF9dqWUtBrak8O8dq+
	J0Wjma729XVBOzE07bVZ3Gyv8U0lSoRtVll6h1gg59fpGl7EIIlEV+2DFQSpMBLW
	JTRhrj8aJm5r2WEk+VQJS+MPqe1tJHdaACzj4+e8wyIeY3TBLyyYR4aVLmrE1LWa
	IDCUhfwqvmqIOxkwucEr8i9M+4PSxJV/lekhFvKRNLVf+g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xjaj37r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:23:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faf575af4so72069671cf.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779121409; x=1779726209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gyj20zFPQU0YdpUQ3SEBwQ7T+Hy4BwpnqNdcqHAgNN4=;
        b=QWN4+Q6vunDN5mpUjQ5+M7TfR/jpaBSyPso8Gc/+9tnd9tZdxmLzuq+vrNYpTrZwFt
         t0SGuh2F5nMCm0/rqEWTLb7G6YkvCLm5/r87VN2iAaC0hFDs/6pdLsX4OQ9FdcCYySJu
         InvSj5/ykbD2WymDsbmlLDqK+X30VOc1WaYmoiz1Cu7ZuGz7ZZ2fWdAiuFxaGMvAo+x5
         lsBMt+eE1+3iRPriDIapzRQZkOHs3M/3BSjQ763AJgm0oAuxZAY1TqVcvEmD12QU9GoG
         p264puHrDNEZ4009WEN7cHDozn44xF/uT/0yzBovquJ6FD6Q/0RmN6mbvIL/NcmmX1+r
         TsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779121409; x=1779726209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyj20zFPQU0YdpUQ3SEBwQ7T+Hy4BwpnqNdcqHAgNN4=;
        b=BM/M2vEy3RKDDlOAXPS0XiPC0MTqW6ay7aSezGmRmggkrzbxsvWtP1MLyo/v1kLpOK
         EAOOlkP+pZ6MN25Pb3Z9kxExdUx6XTkr5VG7agdcQpiR2Oeyzuvz0VIAVzA4Jyp4F4uw
         HeeYJh11VZ4SIdjZeJr5ijJMrKKrAmZdC9VNyjwF6N4OxlJ0jQ6yqChSGqywsiY8TL6v
         cfl1W8k+liwx/po1dcFiU/d0hOj2YR9TtPMJDiaNTZmBLbH+AFTfQYt718UHxRExTQzy
         lJylPMav2BccFIqkx15nnvhrAl8EIepD3g7RxzKUpPpebrvpHz1Ts7Rr/tTX9KsGBsJy
         1fKg==
X-Forwarded-Encrypted: i=1; AFNElJ9lPcTh/rM9DCmQ5/hwelfMCmkNCVX+Id7jNKBuXNw8BNi66edGNCXnARRLiv9YNn+BKg1YlhosASZ1@vger.kernel.org
X-Gm-Message-State: AOJu0YyK0CvL7B9hMj2Ax71lT3XTUtFHzFw1OvzI/7bxVGeHTKVjt5es
	79hcXaMxqAEdPC03jpyKb1AWyDRNmD+iuRvm7oAcA0hXnP4Ici+u2xt3TBAnccZbpwEGm2XPqOT
	uOG1j2M+d1NIve4kIbXT/8cNlWvb4y1m0J8NWWiaVfD4swUPr4QLsTgl5cA2gdVri
X-Gm-Gg: Acq92OFCkiG69BqN+f2CWI4mXd3rVMiI2tHs0At7ib/xr7sXe/uY7pi6FCKodFLR3qq
	m4LGHQALpADNkHW0Woi8HUNd4mf1kNyC2xQE6JhfTJVC5lkS3M5eC/3xBIXnvTOm2fY0mFd6Xvj
	rCHRe9Udsb0mdRJ4zsrhizs/QZMR2r1QfxchOsibTe+Ap4XsrVUEcVXWLiIUFzQq17zSCKVWXCH
	lGakc5TjfRKYjfe8emis6aytnqsBklw8Z20AqsV8urYF96fxHrzUdpk4jvTOGF6hL5rnzQX2xIS
	fwZJ8NqtqCsZd9e7UT8HXjOYxX9OGSzlOlWLlDQ6pSxEhEK3lKaC4g1AR0JPKF9Gzrgvw3D5nGA
	hplGMWLDl9WXDZma9PeuuXiOLRbIQ8uWkdIvJgfCxswkC0JAhQclyM+M1xF5NzaRbr4dMyPrlcE
	Bu8rvXRo7W7gq5CCbhvan9hgQKfn6DU2y1RUvd7UIeh3oTrg==
X-Received: by 2002:a05:622a:2614:b0:50f:bb54:d3d2 with SMTP id d75a77b69052e-5165a22f4admr198883991cf.51.1779121409093;
        Mon, 18 May 2026 09:23:29 -0700 (PDT)
X-Received: by 2002:a05:622a:2614:b0:50f:bb54:d3d2 with SMTP id d75a77b69052e-5165a22f4admr198883411cf.51.1779121408560;
        Mon, 18 May 2026 09:23:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc12asm3425637e87.42.2026.05.18.09.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:23:27 -0700 (PDT)
Date: Mon, 18 May 2026 19:23:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
Message-ID: <ss3deh6wb4bjasig2r56bhl6opygpkid2ixztzdsegqgayuvdk@vgy4ytjzyife>
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
 <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2MCBTYWx0ZWRfXwedsoxrzCI20
 NGCIXGL8qeT4xVlVU77CIHaodc/fTqcYUZrs+TXaioxB3pro1bFBqGyMrNnZVuHBOIEKr+jWrvr
 J541lmg1Cb7ETYKMje1Sq1vU6+WI2tkfnr86RWCTvwI9vx45eJ4Y5+hkCpS35Vuz+HCzGVpt2dF
 9FmSL3PbDIRHO9wMcqvTD2Ay8N4Jj8WQeMIMtlErjM3usLX84c2FziZ8L7el2t4cLjpU17dXaGR
 RJyuSjqgzF9ePvmqxi0SrERd9sPlwWk0sWHEuwrb1kGofPmyvEGhSnN3bO07gag8O5wC2dfLB6H
 SDiCf05pWFceCZMdBE1jwRSYQ7i/tKc1EB+1mnND/24hWwP5HgB4xBUAojlmGDA2aHIG4c9ACOw
 cU1lHBsxYgVRGzocSIEWS+MBkrqIri1diF7oSjtRFASFlbxj3PJoqJehJPv0qU+pZva6aIq93Da
 GRFBme1M3QY5j3D4IMQ==
X-Authority-Analysis: v=2.4 cv=BYHoFLt2 c=1 sm=1 tr=0 ts=6a0b3d01 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=tXmTSpkHiUSfUerXbTcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: LYHWYMGYgS_HrBbP_2gEjXqHZ7y6X_yt
X-Proofpoint-GUID: LYHWYMGYgS_HrBbP_2gEjXqHZ7y6X_yt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180160

On Mon, May 18, 2026 at 04:34:12PM +0530, Arpit Saini wrote:
> ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
> The DLC DLC0697 1080x1920 LCD panel is based on this controller.
> 
> The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
> supply (vddi), positive LCD bias supply (avdd) and negative LCD bias
> supply (avee). The panel operates in video burst mode with four data
> lanes using RGB888 pixel format.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---
>  .../bindings/display/panel/ilitek,ili7807s.yaml    | 80 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 87 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> new file mode 100644
> index 000000000000..93c511d03c00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/ilitek,ili7807s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ILI7807S-based DSI panels
> +
> +maintainers:
> +  - Arpit Saini <arpit.saini@oss.qualcomm.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - dlc,dlc0697
> +      - const: ilitek,ili7807s
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  reset-gpios: true
> +
> +  backlight-en-gpios:
> +    description: Backlight enable GPIO (active high)

Is this actual GPIO or the GPIO-controlled supply?

> +
> +  vddi-supply:
> +    description: I/O voltage supply (1.8V)
> +
> +  avdd-supply:
> +    description: Positive LCD bias supply (AVDD), typically +5.5V
> +      (range 4.5V to 6.3V)
> +
> +  avee-supply:
> +    description: Negative LCD bias supply (AVEE), typically -5.5V
> +      (range -6.3V to -4.5V)
> +

-- 
With best wishes
Dmitry
