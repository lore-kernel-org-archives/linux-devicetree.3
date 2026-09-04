Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D3B358378
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 06:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502196; cv=none; b=jcoxiyKohnu+JaDhzAOPOAEjSa+CC8lyUuwqHpqi0fcCnW1tZb6X/05hpPdNuvJIwpbgQ/9ViRJykNS81XSNStNIUztgZkqGmzzbRoqQ9plukN36leADOrG0sFxNobtQEbAmsd+DpkYL2uccP0Bv7R+BGwc1laKOqI56/TucinA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502196; c=relaxed/simple;
	bh=6i1H7/7wQUtpbrY5xzX/0W4P8TBzBKtLRiVT/SoT7ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tjx1pceVsTRI15n9gzyxfJa+Qh/BwDdvEJnG+cFZmLQO61TdL9U5c3aF8gO10rwi6O/8TE9g8t/SCX4vxoyzcLl78uAOnFmbKzzBN4o/p4Du59SH7Cki7WdF5Lh64I2lJNZXzDClGunRWN1YiQmMD8xLYi1B8ICB6LRqqV0bSC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJ0VNFv1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a09VwbJS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJ0VNFv1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a09VwbJS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462XYG3498838
	for <devicetree@vger.kernel.org>; Fri, 4 Sep 2026 06:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toQXcTH0dbYcAFdl5EjWItBSNnEY93ZM4mZFCsTYmHY=; b=AJ0VNFv1xDVDBSVz
	KoJgiGxblWZQ+uOGSLDeYQVFq2t7yCAGXUj+JrgF7dNtbZDzKoae0nCEEahBXe2w
	500aUGcmg+LO3TM4dk2PXc+4kwAsa7yLQkTIp8o3ezwYQc5/MY6yADr7c0coirIq
	eb/63gLiiFUK47FHiWw5AbJWsdb7X5O3V2gtyXt6eSJIHutneQ7v0ytvPZYfJh3P
	/e96YI1wiXkogsbivyr9UUs7T4yv29wZHooCp4irattsRDS9a/DCyq35ZcniqV4q
	pjeDbA+B5jxlE1R3XeF16anijzr0BYV6aV+APFWInfuJBmNXIQIFU5uj1HKMsgK2
	IhjPlw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfbyvk3nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:09:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d7e0f3b4so918913a91.3
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 23:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788502194; x=1789106994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=toQXcTH0dbYcAFdl5EjWItBSNnEY93ZM4mZFCsTYmHY=;
        b=a09VwbJSpxWqNoGZu/bBtNKK38qIMIMuuQAfofT+fCulQO+EMY1LuUgTrOVn+iw2lX
         ggD+9VgQRMIinkI+IBM4fTHt52Yx1LpDcrO5K2dpg29WYYfIxGJ6726tNljNK0YHEjfs
         NYAbouzTuTZDCgq5dme+klnZMcCSroYR3twAQFjPv0xfCpNJH4gfgxCMuG/aW4IpYR/h
         ib3Ln5LwFSHZsuVAOHzayOUZfkwiW+8AgSiOhAYhlN0gTzF5B+m/kXCmMH+h2YoktjJG
         xWkaeOKlVtR+Z9mWFPbeN+DLSpbPERu5BynBjgo2/VD2jcYB0Ckd9ISmMTwBiY86RhNQ
         3nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788502194; x=1789106994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toQXcTH0dbYcAFdl5EjWItBSNnEY93ZM4mZFCsTYmHY=;
        b=rwxCN18swS+DMyF27eUn54oA5hSCvv8KvcDh547bS5Hm6/zh+WbktjwiIUTPo0/heJ
         zifChCuBzLIbikxuAbInrBH7kRlTKMsfW11PrTmYfyqOaHEk0xBp7PElKyyUQ7Dp9q4F
         PfLj+AmavdVHRbO35VZeoZCho/AGGHmfK0cF2xTj0ZsmlDnktG0fW/xKGlaSoOQwJfDP
         1LXWzepPuLOP6mfV5GbwEzXsSeWcFFU28DT3+/dby9uGvumYx2goAPThQ4qqgNv3IrLs
         QycRh2kav7bhMSubslWWmEECTEd8kXYm1s0kauxsTL5HdZ/BgQEPlodEt73vBwc3/1El
         EDfg==
X-Forwarded-Encrypted: i=1; AKwUvBx6Mb0HUO9oEDBRjvAKEUiiWKAhk7Vx6bGZAhCBYHPknvdc3ZXQfc+WLbgtJOm/Hie9JZTEGw3eTyWV@vger.kernel.org
X-Gm-Message-State: AFuF++lI2cUP8EGqtqIGYIWHHBfP7W7tFHygpJ8UUJ6xlrWEmxYu8cLx
	6S2ktDZprHfBxV4s/xGDYJ7zXb4BL86Pr80mqZa/dRIODHvz7JFpKmVD790HQTuMCnamRtG3bfe
	w4MprA6HXEc7KYU/oj/Z+4qGypUYAHFSXAKK1+JSOpEeM3RydmTK1MG15h5pUZxvG
X-Gm-Gg: AYBFou0vU3+7K8yUln5XB7i46EbtEcS4JUFK+U5APVgr1LTlKP6PKDNw9fzpeC7/5o7
	HJJ4NHeYyLthXUDK7+aPc+NvYXEWY/3ahM8Zde+PgGG/VcUr9e6L3dWwUrRfWSzHA4Qt4B1URbe
	Fe8aU+wUqr4yWkhL08i/A2xASB+hCEnm595XuWLhubWH6DmqJvSPEOIII0JcxGAuNEEI7yls2aB
	ZnZmYzcvTnY6UlgDmBORBl340HzQZrMZz0D+3thqIsOIHqCBde9WZvfv5G/xfdPOCfeW+W8ISUI
	cJvx7m3usITSEhhlEiNMIXq0svPvuV9nU3t8X0a5mgfEqmJYXAXvuOzyQj8Vzrn9VdwnTlr2jhz
	6uyYOQDL3dMISVMXLe6gxoQVEDda7l6bMVY7fpKgPgaAB0XoyBm7JX7mKvg0eneufDecn
X-Received: by 2002:a17:90b:5606:b0:398:9be6:f997 with SMTP id 98e67ed59e1d1-39b262dfaeamr6332346a91.22.1788502193740;
        Thu, 03 Sep 2026 23:09:53 -0700 (PDT)
X-Received: by 2002:a17:90b:5606:b0:398:9be6:f997 with SMTP id 98e67ed59e1d1-39b262dfaeamr6332268a91.22.1788502193296;
        Thu, 03 Sep 2026 23:09:53 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.244.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c3a526sm8911619a91.10.2026.09.03.23.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 23:09:52 -0700 (PDT)
Message-ID: <fd9f1fac-e4e7-453e-a830-a32e8be2f965@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:39:46 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] usb: dwc3: add xhci-reset-on-resume property for
 power-loss resume
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-6-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260903153827.3463313-6-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1Af_NXSmhx4v0dh8RI7KxJw_RSI4d712
X-Proofpoint-GUID: 1Af_NXSmhx4v0dh8RI7KxJw_RSI4d712
X-Authority-Analysis: v=2.4 cv=C8vZDwP+ c=1 sm=1 tr=0 ts=6a9a60b2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=oP200lxkGh9fc4MeAAR85Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=UW7aF9AyQ5xqPRIsElAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA1NSBTYWx0ZWRfX2n16+ZyUg25r
 XdQFuVoF10MGnJLZx6ivbBQAp0W8OgBxXwnTE6xydO6OCMCPIYxHChUQgFB2zA/GZI7ys2EoVgD
 8l3C9bL0QR2cFDVr2g66yYf0BVj8dDbQBmReLJ9NZPFTzBSrugraOQ3SfEWrSLU62s435FXavs+
 sa4m9304R0MszHvW2bEi4DAOlQ1woU5NgLw1hPhCIv41N3T2LY8SCwgFGWyPNXr43d4q221ttdk
 08Bo8JxuPCGRgk1/P/BgT/X4PsjcRbhuTafgApkENjOhnCffSP5eqCnW3XLptKEACYPtHTMoAew
 sWN1qZinly5fDXPipLntlNd9MPHvDV/dUEbvU2XWFxMUpBjO7J5m5bXYTwanEaUtC3JESYZWXKv
 495kks6k8HURVkPhZSucuYFTTF93HrJHK6le3yGXhZ/7zoJFwJxURkjuj0j4sCLIsJ7UF1s07Jq
 6wM/Tm7fe6FBrRF4oEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA1NSBTYWx0ZWRfX4QMga0vY7RXy
 gXkXqfC3361ieQaMprUdshu7j5tzN2FKAfQ+rlldNlnQq47+hdaos497QM9SLaYb5VY6ZPy9ndj
 mQSd5vDNemCSzvXy+1RM0B/cKVFpWmA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040055



On 9/3/2026 9:08 PM, Faisal Hassan wrote:
> On platforms where the USB controller loses power during system
> suspend, like SA8255P, resume triggers a Host Controller Error
> requiring full reinitialization.
> 
> The xhci driver supports XHCI_RESET_ON_RESUME to handle this,
> but dwc3 previously lacked platform-specific quirk configuration.
> Add a device property "xhci-reset-on-resume" that enables this
> quirk for controllers needing complete reinitialization after
> power loss during suspend.
> 
> Let dwc3 manage the quirk for the usb controller using
> software properties.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>   drivers/usb/dwc3/core.c | 4 ++++
>   drivers/usb/dwc3/core.h | 5 +++++
>   drivers/usb/dwc3/host.c | 5 ++++-
>   3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index fd5c2cd36c59..eb6ffd5148a7 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1712,6 +1712,10 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
>   					       &gsbuscfg0_reqinfo);
>   		if (!ret)
>   			dwc->gsbuscfg0_reqinfo = gsbuscfg0_reqinfo;
> +
> +		if (!dwc->xhci_reset_on_resume &&
> +		    device_property_read_bool(tmpdev, "xhci-reset-on-resume"))
> +			dwc->xhci_reset_on_resume = true;
>   	}

xHCI plat does look for properties in xhci device node as well as the 
ones above it in the parent chain:

"
	/* Iterate over all parent nodes for finding quirks */
	for (tmpdev = &pdev->dev; tmpdev; tmpdev = tmpdev->parent) {
"

So adding device_add_software_node in dwc3_qcom must be sufficient.

Regards,
Krishna,
