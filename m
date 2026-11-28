Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795833631;
	b=vVfqP14PGW5uhHGiIr8JKer/Oag5LJneFGn20ggDcn9u4L3ojQ67e++1r+yua3yOalMB
	 0GsjLKAU4AyjQVZXr0CUwGOL/T6DiF9Jwq/iKunV1dkerzWlzQ4RYPZUyzLBC3ScNg3EF
	 ql7rytllSCJecdk17QT4BU41XpBl6ZH4qPgiM5ksMncduGhR5U86opTuUUnUtG1vI3gXG
	 dMH9Dxfs/cykaQavF7Y1iYDVEluFL3SMD8hzWApEh9JylfFZDxW8LC2ikdJE9Cj1OQeWR
	 PHgzQJqAJHvRcY3EaEE/94yKQVMQ9WxbzBSPZKYq6NgMIT1XjSBFkuvcpmk3b8tkPBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795833631;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OKrmpmPowUf1ceqSdU7hRnQfhFnVYmAW5UXbIQRY378=;
	b=LOq4fjn+5mqtQiuTqEMDqxWAvOCNP1hpu0PN61l1PTqD3hgKKRWXGBcOjcyb8RQ01NvQ
	 lQXF89B/jtB5KbqUJysWzSXBSyfnYZL+uAAH7Z342cx63ALe7tiyR2fkGAq9PyYj8IrFN
	 GSzXIMd5g3EoWcdjBveInTFY2FHSzu0tXTXXHWHzcTwGu2u2V76bRMBkAx4i0rKNfABXK
	 G25uJhroi8t7O51aiYL+nWsHgY1QWssJiiCvjn1xgdKRi0HNxb1kTc3JjX6AN7tLHeCb9
	 UKdQ4j8hZjemFlU5V6IN0UzO0WMSWXc0EEqGfMAkTKzuAbAchKl/gevlTvzdU95/EqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LA6KK2XC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BpJ6KZ86;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA94C606A323
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 02:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA94C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LA6KK2XC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BpJ6KZ86
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AS0H7L11113145
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 02:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OKrmpmPowUf1ceqSdU7hRnQf
	hFnVYmAW5UXbIQRY378=; b=LA6KK2XCtK3HsaOnH+u//YUIVHOBMYvU0bKl9hbg
	CfbfcgXrZJTsn7rYUkz+iOKIJngBq4dq28IM/oD1obRqBXYqGxZ+8FFJoNm/SFJ8
	WO8Qc2cK33XR7EwMlQBWUSXkAfvB75gICCkS5j9Ti7OJ9q/W7PSTq4d2wNnSI3Vn
	OX24R6lqqktqjc4cWnOKW3cHTJbBSlVWLMYCd9ZbO/N9ftZBySg/kjnhI6REFoJx
	38/uTF2dmCV6o4JTX2VBKZm1SME1KHTUymwjs8qjPjBIMJSPvqJyYn5+kjKC5Mph
	crNLqQG4XVhEHxpRT6DcaIsXDSIdhoo/15lNGVmdu4MI6Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g2drr8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 02:40:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b56c696405so13849539c88.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 18:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795833629; x=1796438429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKrmpmPowUf1ceqSdU7hRnQfhFnVYmAW5UXbIQRY378=;
        b=BpJ6KZ86SbjuD5XsV001NiGUxxdRIn+IYcBYgXNN1zrVWwwOM/mORjp4kL3B5RPHY8
         2uRSzrFrs6mD+TKE6FaZEVJwKGzSJF8vXu1+lwIWuwdSIugeQg++gW8rSNd6JCTVNkr5
         LWt3ui4LZgYhZSzmTiweP86CEgjp005gEiKFqt95qo1cPPgYVlAzNhzJbvDxJSRID37M
         0OWnf1W8Lzv+bPadi1zdswADIQlBh+SkTZcVCCwuwyu3A5nqI9qMp8LvMxkPQKyqrUuv
         AMl+V2bmJb2gIFgVkx6F7yf+ydfGElgVoGaRsHuIksHKWU2lH48oRyFaeDhH+C13QN/Y
         dxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795833629; x=1796438429;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKrmpmPowUf1ceqSdU7hRnQfhFnVYmAW5UXbIQRY378=;
        b=WhKNqU//ZYhJ43yDOxv8u2QC4WncdGkzTaXMircJrL8tezH3jmYKI48hcdpN+/AVWg
         jasvzW3uEQCr5Cv+Wx2crgB3JI7JOXm1iE9erjNbsXdqOinW0N0N6SVW1Dav6F1LaCZ9
         R2AY3xYfECYgHseKcdqEeL5Yg//rbCjqxxyYuLybR/cSm5UqhUX0HZc3cXqKQed9QVkH
         RodRFpR7DuyoT+or93emswLZcthnKD/vrOEAyWhQj4dVJL/uxjz0BCKQ1c78X6YZcMKC
         CYM8pgWuTxR2ENb0jVuX3Zdf8E4Y3FlEq3xaSON7LaI1qdQ1UJwLQkbMdqwiJ+j+QaJw
         S2bA==
X-Forwarded-Encrypted: i=1; AL+hErG2mJq30amYmaJSIDxBwhXm/pwCQWKVZVYqRR6DPStcp/xjhDfdztJfzPOk7oCJdCPO1829rZ47HBfr@vger.kernel.org
X-Gm-Message-State: APuU4Z+feh6TFnGrBXcwbnZvwIO9stDKexbZxtE7na0SlMJx9e2fpbaf
	OPEtS3qIW1EED7+Hy0V1JGCAk4AUIpnYE3IpiRr4XlekNM1MAN02CmC3ZDqQ6Az89pQZ2XXMFcu
	XWmDlgBUynp5n/JRDMUKisYmhUThHRKAB3eZfKjcU8JgNzSzLDae0jIwpdlgA1wgs
X-Gm-Gg: AZFdTZcX3rQFDAb59QH8WFXG1jAo0jggy19/qjS13x4Q3I0kmWqKpmeV7xetVXvsmd9
	883NQOf7L2HvGQUOt3aM6XTjAaTYie20IG4q+Oxq2LvY4oVti/1fJAUoB+SVUXFNiHaptoXtM6A
	7v/Pn/Qko/aiGr+MWATUwJo27vLOd6+UHQBjgHVZh1rA6qrtKckOFiCH4wYDYW/r25begdzQ/Gz
	vN/wfsSd0g9Imwi1mhQeVoYz9k7/N0onpdCXgeoLddQtJ9BgwVu6CivLC4alsG7RuZgO1jr76PO
	ayfAMv9C7FTBwPuMWSnNyRRF216B+ABZCcgMt7HvIKI+Y9TYbpcBXvpxf1YhxiLhuVQsJsq1P3D
	qMcQITv/PYYzf+jVeQNHuycV6aZdOCYf3JBI2rdIR2tNmiTJ4lY/c5spphK7ixwEFlywc1giQAn
	hR14fRgYfXWYUS5ktX
X-Received: by 2002:a05:7022:e80e:b0:1b5:3b6e:e1ed with SMTP id a92af1059eb24-1b55690bcf3mr30517126c88.32.1795833628614;
        Fri, 27 Nov 2026 18:40:28 -0800 (PST)
X-Received: by 2002:a05:7022:e80e:b0:1b5:3b6e:e1ed with SMTP id a92af1059eb24-1b55690bcf3mr30517094c88.32.1795833628120;
        Fri, 27 Nov 2026 18:40:28 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm90769604c88.14.2026.11.27.18.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:40:27 -0800 (PST)
Date: Sat, 28 Nov 2026 10:40:22 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        bartosz.golaszewski@oss.qualcomm.com, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: nord: widen SoC bus to 40 bits
Message-ID: <awo_Ft6GikSaURLB@QCOM-aGQu4IUr3Y>
References: <20261127113326.2889944-1-zhangfei.gao@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127113326.2889944-1-zhangfei.gao@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDAxMCBTYWx0ZWRfX1wqKA8NffuBg
 jnTEs6oynAQK7H+Q5dVT8p0zqgN/Rks19fQGhg16hQaSI6/82rNRsnTIY7U5ONYN/wXinxGatks
 t+5379pztVesz72pPnGlvvmn9d2BZxPozu1McH+s83oZ5DejLBBUi2IWzJq5sGyeEyjTYCRL/Cb
 sAAN92PaluybFrN63v+DihzWKuOzBRQ7ktMDD0hoVsJhN/W193L1sUY3BF5bd+8QV/OMooJpgKG
 olgSY4ae0UzqfQFWLWsVdSi2WBoYUmk4+GDC2V/lmSanbCzbPpsrh3Iuf5dhDTXJEX/1VDP+sJd
 BU58UU1MJ9Ug6NuLpGsLfNdxEDXz473t3P00eYMph+d9ixm9uSZhrrCUmGpY5akaUOIC0U2sFzn
 zG92ZWONM/0uUTe1v2eX0l0kKk8k2olxThdQXnQ1uHR2CNR224IMxjuEyLc7rYIRdMzpCQOPWI9
 xs3IWnRaxuMVTK6PRVA==
X-Proofpoint-GUID: -REgX7t-6mbNwOwnCSvq5ZMPY7MTHj_k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDAxMCBTYWx0ZWRfX3Pbu9F0zlrul
 hV5a9jz0F1SmDzjDbIjHJkFVjs5o1RY6BIVDQ1889mhb6XIxG7QHvaVMCMLofhcCAU0CXeCwpaJ
 fsqJuVo5CKJ0lrk7/tmDAI5vbJFt+V8=
X-Authority-Analysis: v=2.4 cv=dJEzC+Zb c=1 sm=1 tr=0 ts=6b0a3f1d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ko5I1cYZbepkLF5qciYA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: -REgX7t-6mbNwOwnCSvq5ZMPY7MTHj_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_01,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611280010

On Fri, Nov 27, 2026 at 07:33:26PM +0800, Zhangfei Gao wrote:
> Nord exposes System RAM in the upper DDR window starting at
> 0x8800000000, beyond the current 36-bit bus range. DMA mappings for
> pages in this window are therefore treated as unreachable and may fall
> back to SWIOTLB.
> 
> Widen ranges and dma-ranges to 40 bits so capable devices can address
> the complete DDR map. Devices with narrower address limits must
> constrain their DMA masks individually.
> 
> Fixes: 5e97460df08d ("arm64: dts: qcom: Add device tree for Nord SoC series")
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>

Hi Zhangfei,

As you are the author, I would expect this:

Fixes: 5e97460df08d ("arm64: dts: qcom: Add device tree for Nord SoC series")
Co-developed-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

Shawn

> ---
>  arch/arm64/boot/dts/qcom/nord.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index fdbe290350ddd..45cdbba0e4fb9 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -911,8 +911,8 @@ soc: soc@0 {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> -		dma-ranges = <0 0 0 0 0x10 0>;
> -		ranges = <0 0 0 0 0x10 0>;
> +		dma-ranges = <0 0 0 0 0x100 0>;
> +		ranges = <0 0 0 0 0x100 0>;
>  
>  		qupv3_2: geniqup@8c0000 {
>  			compatible = "qcom,geni-se-qup";
> -- 
> 2.43.0
> 
