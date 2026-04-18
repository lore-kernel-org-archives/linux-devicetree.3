Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8AC9443
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 17:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776534838; cv=none; b=s2dHOpFJsG3b4fvpFsd5lOd2bWqQUDSnT/oyfQFD4pnkjSEvHdz8iGMFCDH08uy7tuH7dMpe9ZaeGVpKj1vvytMQ9gDdt9dFqAT8h2F3fFHxniY7eHEm9aoUACubQND3NfLeYF23w+hroKZBDrKGue7pbbT3VkFzoxr+9a4EYgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776534838; c=relaxed/simple;
	bh=IMb/ej4uPGS9oFEhwVbjem56BHcc7wpQRGfbyK6CQv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HAvZl3bcofB5cVkDeQpdwVntCviE+eQJoYTgZpDgqrR5NrRobVnAjBXqjL8BGNL/6jox9RoOKDuduRlx79fPsuJ6A6CUfzEpC1/rS4mK5GfGfB7PFazk71pDlEZ5+Y+iYwnCdWRoS8oSgDgORTbUHg77JRNC7Sr1k6v7ozqDhcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AETfn3ZY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqC1PDAp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AETfn3ZY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqC1PDAp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4m2Bc2567587
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 17:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0yKS6gatsEUiAM5RPdSarvZ/
	I9lJ7Jjr5A0QwVgBKyQ=; b=AETfn3ZYqSvRsPlzGEObC5keHsWKOvYTGe5KCE4q
	5dfxHeCH+m6hz6X9v5UwuFD0mHcUTKRkMZ6CGApxANvfntQTp37KhimGa2IZRe2F
	Qlz3kpeq1dkCJU5FGcO7EXTpiUetwBm6gsWIx0UnxFeYS4MUt2nJkhLHWk9PWoB3
	cuHzf3tDsPw1HddLadjhKUkNwnqXy4r/SYGZ2cJA4aR5LiRyJde6LaOf4X/FBnyO
	9YsO5C6F6cay/OsfatD7TE1xFEI/Sidy0fP/w8YU7WfsyIx5W8Je6J29Gf5b7p8+
	U1LKMH30IvEfhbSJh/Eem+mmY8TmKGiZyXShtyVk7RfwEw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm388h566-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 17:53:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acd145817dso42710736d6.3
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776534834; x=1777139634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0yKS6gatsEUiAM5RPdSarvZ/I9lJ7Jjr5A0QwVgBKyQ=;
        b=CqC1PDApdPj4K5rAhJx5p9GQknW5QzITOJ78F8EpI9JnuVz49UgiKGvNIFzsW6Rm8q
         TQRvzwU8X0OnJf4K/z8ldW3DpWINuZQ2pmLV0Ow2YGvcRM/lZwBOy8M3IlgCanfy3R9k
         lhFxN1uiIIm7HSaX+qLVggUMkiYeuGCtKSIDXFFKbicq+Is+rIxSlPJ0brPYRAicFIMO
         E2Mm9E10wLAh3hx0QKCBtW+fT13Nbsr3NlD9xXl4NtSgHZkEzj3n5dJC9aQLPJgnwkXq
         sWGCJB3vgk0yA5kRNeSLG1hGgR2OkcSD2d7HnQjgl1XmEIKe1i8N5IrNSh9ISDMln3+/
         MLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776534834; x=1777139634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yKS6gatsEUiAM5RPdSarvZ/I9lJ7Jjr5A0QwVgBKyQ=;
        b=HYhBghogM0ubtRTIec+Pcy66a/LYkKNfijK728dzJK0qg9MUmhpREgliX8ISvk1AXb
         uJMTbcWXvno+vuAlc9Ew0ZlRP1Y6PaWVFS0e/YVL2fsSo/sjrkTbkXW5ENqg4fYjpPLn
         O1vUnWL6YiALSGmrn5UR5qYVzl3mfGG6RmtTQdWZo6iHUaQsI/hrOSZw1anFMp2JE04p
         eEFcugA5xIIt2G401aR4tfseMhHSGdj8B6kUIlN/dN0vlMFp06hIvttsFkGRtiLPSSy/
         3UKwlWH9z6jcmS2ODkGiGmP0IYeQHISKEMsTg2gv+edU34NdDApowePOge8z00I76JKG
         ePEg==
X-Forwarded-Encrypted: i=1; AFNElJ/SZ/XvHbEIR4VUeX0KMmkWAWhMg0e2xcxDwjrBuOdsoUJDYCKd9+y+1AJ78PI9TZBi0K9U8JV0arBV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwod93iGAHQAL96YP89DR3jama2lodkZ5Anik5Hs8YB1026Q3m
	UJGEo0xlp9LHO41br3xC4HiX7T7JBUBPlOQHbHtZlKVakez5UROu01qHuXxGVXcPtZK9iqgkgTQ
	6jM5aG5YZkTYwIY8vc6aQVVDoI/O//sxqXunU6iqaWMVbjdVuXD2w70ZEBGfJa1Z9
X-Gm-Gg: AeBDies+sPKFXgFxj1QWknIz6pCsgcPjkY1A86CsvfE80AC5BT1pGeTHaJRT3AVrDtr
	g+XJPDIfrB9WwaqqgJDVhJDRvlNcZmh7tvA1u152AyEE9fUK2pA/7SuaZ7XtnSGm8Ja0d6b2dNi
	TDWUj5dZFdffI1uVHtDJJ+LKJa8zt1I+V4cByRKzrmRyfKhD75sp1hoeAEkWcoiSY+PAY2QaCNq
	tI5kGBg1aw/gBIhMrH5vp8/wRibfi8tWC+DEfYvURR+YIIUHfaDRPrrm4lirpQDU9pvcFjO163l
	mtVkXNZwrATOoB3tpKMCIGlEVut9LAPmgIP21zz1JxCeNAhs7SIziHwuIObfnBS3aSX+qFNbrgu
	dcMLPa/fYAXP0kfrAbG2MFM/wC4Tyy0HpXsj13CfUkoI1aIs1KQT576koGEVy4jcVXANCea0t2i
	uOnYpLAwXN26MKWIPyubmrCOjH0rscvyKvRdMMUH7BfSrmnA==
X-Received: by 2002:a05:6214:4a0a:b0:89c:6ba4:e306 with SMTP id 6a1803df08f44-8b02812dfffmr139628746d6.43.1776534834284;
        Sat, 18 Apr 2026 10:53:54 -0700 (PDT)
X-Received: by 2002:a05:6214:4a0a:b0:89c:6ba4:e306 with SMTP id 6a1803df08f44-8b02812dfffmr139628376d6.43.1776534833880;
        Sat, 18 Apr 2026 10:53:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1248sm1509867e87.38.2026.04.18.10.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 10:53:52 -0700 (PDT)
Date: Sat, 18 Apr 2026 20:53:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 7/7] arm64: dts: qcom: milos: Add Adreno 810 GPU
 and GMU nodes
Message-ID: <inedwkfju4qtfccw2mv76sdvnbhibewdm53uhyv5qrwyluxohb@a3r6atqocugj>
References: <20260416-adreno-810-v4-0-61676e073f8a@pm.me>
 <20260416-adreno-810-v4-7-61676e073f8a@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416-adreno-810-v4-7-61676e073f8a@pm.me>
X-Authority-Analysis: v=2.4 cv=GthyPE1C c=1 sm=1 tr=0 ts=69e3c533 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=REw7ijk5hhyOG_fLH2gA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: PfQexb3vkGYFCLCEx7JqyygkZtQ5NaYq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE3OCBTYWx0ZWRfX1UsLRNpHGNvn
 N5VAkC0aahd4PRDgG9ICJCiUlR7fZznAuLCdAnbGgMp3fnbOmjLWueheN26C4yLexylSqZcjukn
 msV2xB/9EkjzgjOCOjntTSvvZThNqsjpM6uBvos6ByNs1NsWDnYrwEzTm6p6ws0ktLPCE4E+wm/
 3Y1VI0DCAxUgvFXpnpXRqQp9LKEhqAbda6QyOHv0jifl85gG/D7Op/jVDCe1tUTi8jptT+9dcGG
 K5RSzW5EiHjD+0xukd52NHoFaubDP4FRRWwYAGMVwyf3trDxmmCov2Xoxc0g0yj8cNolhcbo+Kr
 /psncteM2DuEz5eHSswUwAZAJRa4/8Q4dlM8qZM26GnFhdhT21mnrYSU8ow65pHGoYi7/hQbFIp
 JIUp/oVFx3FZr7TiDip+QsGcojur1pbjK26zECuH+lQfM8W5geKU+hx4tnWaF03nF0eP6Kt+F19
 sGYT0PofFd0DobXLRzQ==
X-Proofpoint-ORIG-GUID: PfQexb3vkGYFCLCEx7JqyygkZtQ5NaYq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180178

On Thu, Apr 16, 2026 at 11:05:57AM +0000, Alexander Koskovich wrote:
> Add GPU and GMU devicetree nodes for the Adreno 810 GPU found on
> Qualcomm SM7635 (Milos) based devices.
> 
> The qcom,kaanapali-gxclkctl.h header can be reused here because
> Milos uses the same driver and the GX_CLKCTL_GX_GDSC definition
> is identical.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 166 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
