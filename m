Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44DB4B66EF
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446461; cv=none; b=W+fBKeM/Y154B6M3TKuqp4/0kKx+s8Am29flHuIcWCvtLsjQpaDGMMab8aL7NxsTxRS5lzPKyL/ztw13gktqyWnKBaTIxC0I/OfwkXD6qOD2YohVBKerLsR3k63aNEwCn/XGnMBoIrjez8lstviRGhkw/TmE3HVqpD62MuRn0WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446461; c=relaxed/simple;
	bh=gi9mZjH3jh34DK+gNA1UPkWEDaxFzIUHDuBU6k1qR0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwH1MoVgzPxOgMWWFv9ARYLGCryh/udcs6iad8IDPWNI5LWnVUbEZWxtShyAOiYyVubnjzq5sWokUVlab04N+Rn2mSXIK1uuLhfomcxg8ixVA2pHwLPqRRW7vXNLKLo/PY11HnoL+OwIfkcNWqSj14+Fa/ACKogQU8x19dedHTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dBK842fY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MabNpojT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dBK842fY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MabNpojT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAdwM822691
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 14:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PgPqH75E2Evg/LBzbjzhxHEEsoKS9CNve/6QYZ72/hU=; b=dBK842fY8gNu9XDN
	zoQ/UYkuTkfbiLqEi4fBQCgGl9oyBZdCDJmCFcVDFZFjvnJRgMY9MPDQhoNDCwbZ
	y0mHOy/k4LNRG+bpWh5Df1Wb1ArEMLzE5G4brP2JMUWle0O8Rtgjdhs19Jdfesqg
	cDG8Oer+Vn53UWUFfedl77YW5MjCY7LOzVoIvj7Xkos6DqbkOI0j/TOqTGcwsXs+
	chGCtnybaWc+PM7RscvWvIspRJZLCQ7v03uOvljsvfCrHxSLyBHccf188DZwK+DA
	gExti/F1jJGJsFNp6vObuyiy+HUdCU13YOHDqYuaMxhhi3kNU80Xv1yVmTw4g6PN
	XbUPMA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p715b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 14:40:50 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so65072e0c.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788446450; x=1789051250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgPqH75E2Evg/LBzbjzhxHEEsoKS9CNve/6QYZ72/hU=;
        b=MabNpojTSNW0eohxwYVrIvbNrQybiLADBH/pqvYcZCYZQp5up5/ToENgZfN6GUiDgM
         CLoIOX/Ira4e+SfJB/i8TR+eKAsGUOUqR7I3BcoXLuW1383i/7Wb5tiI0XLgGcc8GxYv
         DcwCtDDycXMlX0Rl/GJfSKrnZXm/Jc5dAL8Liz1jWh8FNlWtm5j2P0xht1H9hDpIWWAa
         SCoxf9SWoXtsVrElm/LMC7yuWAkSN2S/E/A1PRE+303dSVGDgCfTBWUv33ojRb8ouZxT
         TxblCwGNVpl3xP6hxv4VtESNZ7lg/Z74ECIzfs7nVOZWdFNbIiShMSUhXrnKEObYP0d0
         LnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446450; x=1789051250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgPqH75E2Evg/LBzbjzhxHEEsoKS9CNve/6QYZ72/hU=;
        b=at3a+d9kC6VDTnawlxHwd4pNv347liOBSXWQmiJW3h4G8taLNg18CGViXidE+EAYOG
         WupgxlfhT98twSpCxmnhrFibgQaO9YtYNPWYrcNvrLvCpKvV6Q6SANjMc6xcG2wzjTy2
         d1+XrTe9TFC04KABDbUx/NGUv/5rAbw6BnK7GZRvpvn7avfmPWQJyY1ITjZUswVbGODW
         3Z1FgA5m0pKRLPdROENIR5Ezp/YKFzl7r0zoQY8/2QYHI4jlPZeDp0E7rvXX9kwl56H5
         eSA4jVrt/AKx5+jukUTwWCGV5oFtfaCxFcBUHzUlpvAYId4YYlUTfXxgohOnyU8Vp7su
         Tceg==
X-Forwarded-Encrypted: i=1; AKwUvBxP3fTw3+dOccD6vLDu/eRRUBLtd1SYXa5PIeLJiTaRbi2x4t0XyHD7OkJd9kVZx1SJXTNZbfEoQuEG@vger.kernel.org
X-Gm-Message-State: AFuF++l4ZvL/Wjc3sNRwShbkkIgAvNKK1jIIruI8CXnIYdk4N/GJNAgl
	O4y+P4ZCSXkec1n+pEmLSJ2PN9YJxfxPaGeHo50kMyvt/BEdqgHPgeHFt6RrZv0o4xoxNGk3qgd
	Uz+GWjL3icrQucq8m8/9bM9f+svo8umNJ+Ea0C2pPaLQxBBoF0gU9pns+ozUWccBS
X-Gm-Gg: AYBFou3b6bRvQ//jmtKFJO6SW9p07YvQwhStcVsmaRhAy8r/Ut4GgtS2SHYNRlgDe7V
	RPZ6eDTBAiA3pqdZe19DdWHyPzFMr0iGSZeLx1KNNpp7MKEHyJ2e+ob3omJRlXI22EV45oWWCfx
	OS+EY744xKbpaMag9F2xyj6iJczPdBSq4PhwPCaqA8nRXXjh5btBEaUzX8KCOn+mG9+ELa0gFm/
	44Xz0lEiDc3d1R9meTg8Rex0CBoqMto3BHGC2VW+q6XrmYwl0yv0z485T75PgdbyZz9IcJs9Tr8
	ncbYg5DZr+yn7DECn2suDfhtX0qhN3m6EetmsH2F6AIUCoz6Eg+DlgoCbHScL8d0ruJp3PXHtRZ
	wAy4ZdzeU7YLd2sSXxbLwfA==
X-Received: by 2002:ac5:c84a:0:b0:5c7:d15b:5f2a with SMTP id 71dfb90a1353d-5c7d2809352mr1626584e0c.2.1788446450032;
        Thu, 03 Sep 2026 07:40:50 -0700 (PDT)
X-Received: by 2002:ac5:c84a:0:b0:5c7:d15b:5f2a with SMTP id 71dfb90a1353d-5c7d2809352mr1626554e0c.2.1788446449511;
        Thu, 03 Sep 2026 07:40:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705866acsm147251fa.18.2026.09.03.07.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 07:40:48 -0700 (PDT)
Message-ID: <a5d83aa4-7065-47c0-bbda-35063034b0d6@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 16:40:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] PCI: of: Avoid config reads for disabled bridge nodes
To: sophon@radxa.com, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>
References: <20260901-q8b-dts-v1-0-7de0b6a73d08@radxa.com>
 <20260901-q8b-dts-v1-1-7de0b6a73d08@radxa.com>
 <8c2eaba0-c1bd-4db0-bbc8-5ae3b3d9a13c@oss.qualcomm.com>
 <B4EB99E5B76C9F40+e6fdbdd4-5c05-4b98-867c-29c7178a0d72@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <B4EB99E5B76C9F40+e6fdbdd4-5c05-4b98-867c-29c7178a0d72@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aJED1wFZFzsDMNwgeZv3YlVF2Neg194H
X-Proofpoint-ORIG-GUID: aJED1wFZFzsDMNwgeZv3YlVF2Neg194H
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a9986f2 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=z2R-DqfiRA8ArFDFZ6YA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyNyBTYWx0ZWRfX55T2zRsc/sAU
 eUrWYj1ZfKi1czGHMVhSleCvS/vieLnvIa+iIbYI4+I/Ia4wK1EUpU0pgEPMjqUC5KZYWFMndTe
 VKRHAYdkkQySQFbtA2ghVAMhl5aXl1E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyNyBTYWx0ZWRfX8BW2TyMa9Frz
 kZQTMxZzaLw1MIOYxOG5NjUDD9M9oSo+eq4Tbjit1n02eJbz1qG9Uffe+8dipSEnId7HVOAsaZL
 o3A5U9TcwYIN9xMO3bKle0RSBLnL74Yw0vOc1fcV8Ie5++ESVlRI/ylFTehHRna3BldO11Ceaat
 gmlJ+rg1vn60GDYadjg8g20JTU6PZIfStZqtBC8iBWw3szsNQabF9kXALOSmzRnPWG76R4WyNVT
 4n0qWc6IRGwW4DQulwG9VnCId7u+W22f04nzZlSKZ36e+ViSi0JxdLNUuGBCjek9PsElHya8aSd
 hHxIKl9PtXRMmvzgG9XfHV+oNRz+i8QPyLe8wM+KPsC1nooUAUzuSii2cyLXZKiLaJPlEMffzlo
 rfRYX5y5iMypnlzgTBeJY/hSTxz/ZXXzeEnSkPQ2iTFIDj3HTcE8OL1IaWJgDt+dr1JMzgNKs0T
 F3A0hwZ1nav+hXFH+zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030127

On 9/2/26 11:31 AM, Xilin Wu wrote:
> On 9/2/2026 4:43 PM, Konrad Dybcio wrote:
>> On 9/1/26 10:47 AM, Xilin Wu wrote:
>>> The TC9563 PCI power-control driver powers off external downstream ports
>>> whose device tree nodes have status = "disabled".
>>>
>>> On the Radxa Dragon Q8B, reading the Vendor ID from one of these
>>> powered-off port functions during PCI enumeration raises an Arm SError
>>> instead of returning an all-ones PCI error response. This prevents the
>>> board from completing boot.
>>
>> I agree with the premise of the patch, but I'd like to understand why
>> that happens - do you have any details?
> 
> Unfortunately, I don't have further details. The downstream kernel also includes a similar workaround, so I suspect it's related to how the TC9563 chip is designed.

I'm curious in why the port is still advertised on the bus if
the i2c interface writes some magic bits to "disable" it on the IC
side.. but perhaps that's just how that IC behaves and we can't
do anything about it?

Konrad
