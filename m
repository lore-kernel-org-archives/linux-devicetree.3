Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544B34E532B
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021670; cv=none; b=Om3W/zLl7Y+HWrS5mL1suK4iQBPe5N4/TLuTyFvjgXbeupeuuxODYiYa9D75/RZpPa37KXChRyY9y8RqS6pKYoDSu4BsPk1ukkMJ10oIWzLTKNrSZcotyh/gjg7qn1A/Lg2h0HSOcU0RNKKo9p/dKKR7N/c0fzrqYViWVhoL3RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021670; c=relaxed/simple;
	bh=Mr72y5DUeV010T8JwhU6xIUOY5wzfcfT+k0VitQvdNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8hz2RXF9MVH70XQKEvmkPc+ebR8b7NqmDuNtil1lxdobl2/BNgnYFdZzrqrAENk2c7AQdcBrUZugqJzA7ogGlzhT++dOOsPVoYXxfHE/rTcNo6I30XbTwtdQA7GrQW0yInLC7Np5xe9bOnCDtN/vafJaQRB+GZBe6q2KbdR55A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LSCWDxQw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6DcHEqd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LSCWDxQw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G6DcHEqd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EIiN3t1555571
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8jeQjHDKcOHCXmCoyag9tPF5
	EdS/R/OQDxIBgOt2FOY=; b=LSCWDxQwT4suNSOnBFbCQ7rfN+pgjj16sC1Fqza/
	LD7YzSGPrkPPTmsXIJnfzfyoENc2oNnRMAfD2+GN1A7pyUlReFCB1DLIaYIWm93u
	59gdvlM/1NP8rSjQthbco/PWpU0ehjYRrZFtcsND5TMvdeZH8Xt+eHwH8RmCP5ON
	TwR5G0E/6kMI+/uYKiR221325vASNsyMQ60zxtkwdM9ToWu04Ief4EEnPS/O+8R9
	jMuJ3LsjMd+SbarNRQyNVPZuB+YKiaIAiIXZNdzi6KN003SX+XuH+KNmJQjpdwWD
	wHBNJ9rrAfbXwN8Dwp2iyaQ7A5W9Q/8LyXOY/aBwNosVqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80ctur6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 23:47:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939c30aa9a0so107335585a.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 16:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021666; x=1792626466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8jeQjHDKcOHCXmCoyag9tPF5EdS/R/OQDxIBgOt2FOY=;
        b=G6DcHEqdS7rKih8bcU2hSdWix7xGbWC/KumXySsdeud6jmdjBuO6xOsULLDLgowOwG
         AeIkbRx1ugRlbc1z3AxHsZDuQSBR1WqJT3KXELlLMkCdty2hPlzwNmer0+wbOXXgtErS
         SrLr1Co/txjiijWrlVWDw8fXMUOfCz0qIE9wn893ehgTXpQJkMCgwsr2e2AY+P+taqcF
         arYVx5LEwGul4k4gk5KU5pIW0i54ySK2f3wHX51dI4g9R53y+8obVmC+etcRaqubc45o
         5/rXgid9YvBvTcEToTJUXjCFyIeOkEqrGYZ0ciHINRNUR1DLb6CSgvJHkPTwHAvdi1vC
         S/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021666; x=1792626466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8jeQjHDKcOHCXmCoyag9tPF5EdS/R/OQDxIBgOt2FOY=;
        b=sqyCHC64jmXux6GlozpK+wUy8ZyGYu6jqazE/PxMvy9cIKNOjoIrnND/kv44txEf5Y
         DVXIEun9pOvrBQG3hdvgsWda2qmAnUMoOidAVf8DK/OjTX7dxXoomHmWz73KmnqmFZoe
         PRu7cG6tjtqLigd85s0BIWkJEK0haBR87uNBIlv9XBWjigtF4f5I6L7JtSxrm5zFgpw0
         Zst2cpIJI80N0VXIr20oOro0/kYjWn97kwAVe7dzKqdAyHYJutFaURwtIOr9nEiwtebc
         1UIImatpJsJIBBUtknqlxJbNO1qmQCsxJKt4/QWcpS8bXAmAGxLYAxLisTNrBeLWOSTN
         +Lcw==
X-Forwarded-Encrypted: i=1; AKwUvBwfPlCcYKKnZu/+90sRVIA/yRh3fANUTNkBIsh/IA19jWQ4ysSo4Jr/9Hx+c58J7rTkdFE1y37D1kIR@vger.kernel.org
X-Gm-Message-State: AFq9FYJWQbSyzdDIS4FuYsK7lqi2IbIU7kTkBUxLS638YKlPCU8givcI
	ocZKDyB2LKniopSwPZFcbZlVYlU9RiMZ9rPpjaa2MWaeeeJ9pbxwWf9Lbk9Fhvq6JxgdDkmJQRi
	zKwOhEM2w44zfJyXJ9ifHk65CrIjO8sPBV+Vpoz9/PGIRhjCFHwKEUa8I/LhPkMkP
X-Gm-Gg: AYBFou3ncApbWjUicOOuBk5PHtNkmvhMI1F5xaQl9hOv43672qaoC90Ns5jPSf8wMaj
	OPXRlkhfmMexDTPumAKxiBlf3K0sKkvHTIqVJktiLvBMGcyei8YosqZ713mlGEN7WSJEE4LnrJX
	I2l8acGhfd4dX9zMVOeL2bFEmgDeuSzshYWgiqKqizdh7Od/1JM4Fm2INKIk+tiYeqbTkS/f52N
	0b9jdxHlSjAmQhji9IMJHeQsX8R1+MDRanz3XotMRlsaHnO3Ksv+SdRUOkVwACt/deyuQ7D96iz
	N8YzSgQaJXJM8u4RqNkGGw4VbyR0KetkY2H0JJPB9mNzw4xMUO6wMQaiEvTNizO2chVHPCnT2eC
	0K2v/VALY6wBmM9BzHl8+6tQOu1+BjudGYMJ8d5Zj2Rsuduz3uh5YJiuTfFCzNjMlNJNMTnFEbe
	r7zSfjKhjG9zt6
X-Received: by 2002:a05:620a:84c3:b0:939:ed29:8ad with SMTP id af79cd13be357-93ebd0bf49emr2568370685a.3.1792021666269;
        Wed, 14 Oct 2026 16:47:46 -0700 (PDT)
X-Received: by 2002:a05:620a:84c3:b0:939:ed29:8ad with SMTP id af79cd13be357-93ebd0bf49emr2568368585a.3.1792021665765;
        Wed, 14 Oct 2026 16:47:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafdeaa3afsm2113211fa.14.2026.10.14.16.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:47:42 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:47:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
Message-ID: <mtiuiy5rfqsozygax7fuifbotn2vno2irdtkc6bew2xxasd2mq@uypohil5zz2g>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX7fMCQanGmbC1
 0IPFry5j7vwGfcztyyGPVckdmo1020dvM2kCtAOCicf1ErqTHAHuwtXSITryD2N4MmHRtwOVV2N
 U/xkeDuVImZ6N0GYXIdxz4AsQDUr2UU=
X-Proofpoint-GUID: S5ZoQlUkY6AYJQKdmjj2hZ7GjmWuo2ep
X-Proofpoint-ORIG-GUID: S5ZoQlUkY6AYJQKdmjj2hZ7GjmWuo2ep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX0Xtz/u/OsZEU
 cJLlaekn0m8mQ540MpHzE+OgbrQr+so8n/irruDriAN6H1BUsZdKlkitOKbuKJ7JRuwPbHX8bB0
 e2/nUCjKCTfqYXKafyLPkU5twsOR5jalcMqX/pFSC2ZkjGGlfJG9KjeikLeseaXYpM/zTxln2h6
 2sW/m1zDkfmPNb51lfo36PK3m+WbHRscxZjzu21xIHhdhfz548IyfcqqdFlcFfwMjm1MJPmC4/W
 lAO2deqbfUUPjkZ4hnoRohgR5TPWTGxpS0OCztr5Z1ic2jN0ZzzNdyVa66eoSlKR9dQ+KRC0z69
 8YYgletLAZTckrZxKn9vkqAhYs6kbC1adgrQdnJUWquapR2TgAxDj/mKU9FzGbxFekJvwWRVViw
 dn0n1gxtLGoxj0vScnk+QrGqHkduIJXoXd1QKkefMrAAGa59QgqYwpv2fwFwTdL00EK2wBW1/GP
 con5tomfQOFzi7BrMTg==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6ad014a3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QX4gbG5DAAAA:8
 a=Gdl50fq9-iV3HN9amUMA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140094

On Wed, Oct 14, 2026 at 11:31:51PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up mt8390 Genio
> platform incorrectly announcing UFP_D (upwards facing) support. This
> feature is unfortunately not supported by the SoC.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi |  8 ++++++--
>  arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 10 ++++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index 669eaec662f3..02f8b33d64ac 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -527,8 +527,12 @@ PDO_FIXED_DUAL_ROLE |
>  
>  			altmodes {
>  				displayport {
> -					svid = /bits/ 16 <0xff01>;
> -					vdo = <0x001c1c47>;
> +					svid = /bits/ 16 <USB_DISPLAYPORT_SVID>;

USB_SVID_DP_ALTMODE

> +					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> +						      DP_CAP_UHBR_13_5_UNSUPPORTED,
> +						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> +						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> +						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
>  				};
>  			};
>  
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
> index aef908df530e..3f7d57dfcf93 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
> @@ -597,8 +597,14 @@ PDO_FIXED_DUAL_ROLE |
>  
>  				altmodes {
>  					displayport {
> -						svid = /bits/ 16 <0xff01>;
> -						vdo = <0x00001c46>;
> +						svid = /bits/ 16 <USB_DISPLAYPORT_SVID>;

USB_SVID_DP_ALTMODE

> +						vdo = <VDO_DP(DP_CAP_DPAM_V2_0,
> +							      DP_CAP_CABLE_TYPE_PASSIVE,
> +							      DP_CAP_UHBR_13_5_UNSUPPORTED,
> +							      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> +							      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> +							      DP_CAP_SIGNALLING_HBR3,
> +							      DP_CAP_DFP_D)>;
>  					};
>  				};
>  
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
