Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196193C2B92
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482814; cv=none; b=f8iYO6VJp/GFIWeG1Pkako5mxxqt8/6IcB+Oj4FkYLmLxtbt0mLJIPhjNUL14pK8emCucekOeSJybfLNls3AMR3DPB/J2QlvaFT6hUAzgaUZo82PUx/q6UUGkh+jEsGbPA44TFa84zJr5ePV21eBQ/lW8j4ibs2Ga4X4niD2fd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482814; c=relaxed/simple;
	bh=IgSqdWbz2cU2bQE+T2wg9EJncdAcsgrGIfLGx+VQE0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gySjloBHab/bwpCT/4L4W7ZlwHxbD1wjYT5AJTSOsN9YwcmI0rtOvAhWl8A8k8Gp0+nIiu7RzgvKHBKDjvz9L9mhkQ6eeyd7/DLoBtRl4x8iq9wbtrM4C3UAobWLx7Q8Cp9+o4wgPhE+3qaek8QyXP8q2vViPzkC58xovbdXCFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWlxHE6o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7zCn70e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EWlxHE6o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7zCn70e"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD02cQ3112097
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=If8WzIzCj6FHW4yPt0p5a8Pe
	wiklLs1ePVK8V2FeYF4=; b=EWlxHE6oZza4mxhEoziyf2ukQBFOoCLk7PWGfJ2+
	vLrYo8D1Z/lPwqjw4tVyBGdi5xj5GXgqv3mjPzU+GwmA74N5RSf3WnzkQPmtPOLs
	Afwks/PWGEibT/Gs9HE85NOI5XtPnUGJhFQXJwqiC/0R+v3imDlUpP29+RhsKl4N
	L/+jeqQ3OtCpsx+9Y/8ljqqMQEzXJNYwIMCGNf+j28o1QJZYEmp0am/j1/JHDZk/
	GEXclQ9utwXbr+BBpft+znME2At7txu5DLKE+laUWF2RpH+RymlcFsZUYJLdWPUv
	2F62taLANFIIJWdbg1eZcpiNfoU+4bfM6Jtf/qFMvADUpw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye72e3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 14:33:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so3250639a91.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 07:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789482808; x=1790087608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=If8WzIzCj6FHW4yPt0p5a8PewiklLs1ePVK8V2FeYF4=;
        b=c7zCn70eXSHjqyB53laaInWgefnLCO6MwWajydNGOFp32HQMi5K3hxfOl6bjkSlxVr
         VTQjORG+BW3nAr1sTFDr+Z3elMYncEwSxWQjwDjQ+4XYWQFy7GSdQgMhgYyhgGgXjyB/
         8UIgAH3Dac2ovPhxTFQp6qrn8XF2jzNWTnmao03oTyB/8xWl/xlaRmMf96eoRmdytAk0
         hgG8U1wqSEOwVLbrcpDzH4u/NpwisuqupBfFPk0fEDW0qtf/xBhzCO3uhoxGeqs5WStW
         1D8g6w1nqPqmuDU/ruv0FyRUHshSeshaTOsUwV7id3eHsc6/z74DRYA19gcx7HIJHoS5
         W67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789482808; x=1790087608;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=If8WzIzCj6FHW4yPt0p5a8PewiklLs1ePVK8V2FeYF4=;
        b=EoMmnXI/z4pkza3qqhooderpTolI1kL5LoRRCMtTg5Ldbp9JswZB86DGm9EfGMppHh
         lOrWPgKCpa7ARsCSPcR10d1o+gp6uq7xgSlHylITekQk2FFopf6i743AFVci78AXQtq0
         MgJnBFwDwkGNy5MyxZPFVZH0e0AY0daVm0L+8EknzMFV6VOQ3mGeerjGd5lZmJPSq+d7
         bQug97XixR08E2BFHJF1ELgyE6ktFJ/yankI68PYbT4T9l7h3/yIG6U9+2i3eoZ+K0S+
         JGBbSOOjVOibsZFvd5NvXh8MkIFZQ4ygJYikkGGXRmcOmFIb44B0ckmlxd9aIKH4s0bW
         SsMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5vUZgbw8foJtykJGZqJALudxq+PEC7aASNmd2qBXW8BirVbvdGoDprwySMUSY8YQ9TAxhxyblj9j9@vger.kernel.org
X-Gm-Message-State: AFuF++lgPOKQnXTFFloYzLnGhJGcs+kQ6dqq0bk14nEWTU2r7MUuiL5N
	u8eZaWP1jVF/WDQxfe7/6OaeGcq23Jo3Vz18qAki+U7U8vjJX8U13P0s0IxchOuFPV+d9bRmfnW
	mm09DRWpNviDI3267oTThKGBoCRYrgdiPU3CT/bTe2nwY89YorCbwJR/o+qFDDJN+
X-Gm-Gg: AYBFou09vlFBb8Xed4QCpMf2yBLyZRUhOcyjmTIu5bcaVpbipPS0qQQUC0D/IXJkZKJ
	IPvvG8skZf30NoAwKmLNN3s3Bk+K4I67MT/UKM+8wRL9on4yeHHlUMfruDJqNpZYCWZG9cBLUFs
	ERlyppOpVJzqdCCE56TGkG0ZWTDnU76FhSQ+n04BVzopg+6KZjMWeAwLG0ZDjZ+BV/dRHbikcp3
	ps6TIzZEpYCnQ3iOgKrnA2TwU1uYaa1V5k8b7MD1eZzkKqtmU1lN7hQSGfD7jcKTSKRlJJlFe+m
	bgtHwdRY+T197+erYdh/LlGublD2p1N63j+yas3oKK2acn942W8bFuHC3AyQsfrwzh8OXY0KMOl
	MAgxNSqrDYE4tmPe05uYAj6zpKg==
X-Received: by 2002:a17:90b:1811:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39e10fbaf78mr2137380a91.12.1789482807457;
        Tue, 15 Sep 2026 07:33:27 -0700 (PDT)
X-Received: by 2002:a17:90b:1811:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39e10fbaf78mr2137316a91.12.1789482806918;
        Tue, 15 Sep 2026 07:33:26 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdb3045bsm6690697a91.17.2026.09.15.07.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:33:26 -0700 (PDT)
Date: Tue, 15 Sep 2026 20:03:16 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Sunyun Yang <syyang@lontium.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v15 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <aqlXLJt5GGbRg8xk@hu-mdsor-hyd.qualcomm.com>
References: <20260915-lt9611c-v7-v15-0-88f9e9387eab@oss.qualcomm.com>
 <20260915-lt9611c-v7-v15-2-88f9e9387eab@oss.qualcomm.com>
 <DLFWR377PSNH.3253TRHVTTGMQ@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLFWR377PSNH.3253TRHVTTGMQ@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIxMSBTYWx0ZWRfX+9bpIQbdAaH0
 plBAxyvS1h9bRgsJlSY/wmZa5C6xlhWrWQG75m73VPTiOVfK1n+QxNjYh8x+LrDJ5PFU0zifane
 WQcxXb0sI8YLS0LrHK4s9WUJRGhCI/z2OsuCUuNszvWxFq8WyeWsm3TNpdOnekJN7+f18IV0gJY
 kVPpin0fMb8MXSH+sLZe9Dn5ENLfUAVdTIy4p6E6VmxkMf52QTBF+cReFapeuRCWEhxP1p6h4zJ
 ntDtGa1W0wFZiuEmKHsyQVKfbRqT6WY9bK2BNAURYpbMtldGgNfIm34K9/EolwvQoaqRVbVHmrW
 e+3YiCUww5nZ5zU+xfL/+oJp/Z0MaDDWPmX5daVi0lcH8LRAH1UjbHaj56MG0BLsDaab/b6xFBj
 +1HEAFQpKh9SdPjvvh/nXZEQCdyOArxFzz7Wl5vnmvCBN3wl4Wq6Av3fni3NaOjF431u3XmQ/HM
 dPtw3kiXRR6cJWSKGXg==
X-Proofpoint-GUID: rwDerhglYrUNgnZvusPe6jnjGwJzyGxD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIxMSBTYWx0ZWRfX9WEfxXQhOFQS
 zlyZPkx6LVM4Dh9qe49a40houWOC35H4/FSjPMRIgMJKkMFGcZUB+4IzmkZruWcn6wdYg72Bw3u
 fHBwrEPX45+oSWVwSmcHxFNVq10m+1w=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa95738 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=Kz8-B0t5AAAA:8 a=EUspDBNiAAAA:8 a=Tr7HC1OQeac_aXw3zzUA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: rwDerhglYrUNgnZvusPe6jnjGwJzyGxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150211

On Tue, Sep 15, 2026 at 03:01:14PM +0200, Luca Ceresoli wrote:
> Hello Mohit,
> 
> On Tue Sep 15, 2026 at 2:33 PM CEST, mohit.dsor wrote:
> > From: Sunyun Yang <syyang@lontium.com>
> >
> > LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> > mipi dsi and output hdmi, differences in hardware features:
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> You are carrying this Reviewed-by Dmitry since v11, but the patch has
> changed a lot since then. You should drop that R-by line, unless you got an
> explicit consent to keeping it for specific agreed changes.
Ok I will drop it and send next version. Can you please review it.
Thanks.

> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
