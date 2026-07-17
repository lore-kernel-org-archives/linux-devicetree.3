Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE4E35B137
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784263817; cv=none; b=aJqjKJ2O5NdnpPLzl7LIFpQWgeWMVRABk4bRfWD6KaTNgshipFRYxmAIjHirWLeauw0m+W8x8kiLdHun2ScvOGEEN4XsAII5r3oaL5DBjFfG/h4lBgVgJcnRcgjWFOIfwN7HXfihilveKFsMEkTkzWHOdPS8/Bx7dCJ1Z43euMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784263817; c=relaxed/simple;
	bh=wegNo8nVQQHvJX2jvTfyunU2PslvpToIjVqkca5C45c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEldUs6d39ELoBi6073bUZgBNNVT1rruZ11gOl3nrujikpO0TLRHMEnlmGTfH5jOK0jU/l84ECnsLz7pywY2moG5yD1ZCtljYLY74K1CYutjHLDOX1i6VXYj3Q+Ri3DdA8JVG8RhIJwZgH7x642ARU6mhAAxSWDTYxJjjW5pt/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJeouIH6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUfSnsZV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJeouIH6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUfSnsZV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33oSY469420
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pS3hGNdU3fs5am1KSoTDnSdOUbpCQRoLxtrURiIei5E=; b=MJeouIH63+2BbAMa
	PoU1abc7u2+QA+fNvfYM7GSLQyGPBOZL24El5Pvd5NY2BXTZYRLFgmJsMo1Mbryk
	8o4aLC09ayGSB4ELB/biiJtkt9hUH+DRnXuO7KU1ttI+A4XaG+d1vxvRVKpNNNKv
	8jVwl7UbRtJl/mKttHqjtdEOyYbyeC7t1TvytavPXcaZdBcI8cAAwo/g/0WxmnUu
	Zsg+egrp75GeMd4rNeyZqXoqbP57tQGt7BhcpuB4coGNz8sdP0kPRlYaZwK35Zga
	cpzc2ZJwRHNIBd75b8bbi0hF4n+Dgls2s/L8e9CFyezxDmuc+RWNaTKCj74EpvZ6
	/Vm0Ow==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2tgka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:50:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca124bf0189so732830a12.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784263814; x=1784868614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pS3hGNdU3fs5am1KSoTDnSdOUbpCQRoLxtrURiIei5E=;
        b=HUfSnsZV9F6xDxNFWZI4KwsIPVI5/d+lHfdpvx38vQfaheasQ++BX2sTewvvLpmlLV
         aLBhRjKLThcE07n8/kddXctALmg0CrsopE+zbvZHOmK2UARtzaPlLohC5Ld2yPZjPKtd
         PF6OuVRtSJBzkagPgBr6eAtaTG4F6qUtPu58/CAxAbhVTufMQFXFjK+O0koR5dJFL2dr
         FFDay5tXBoeQcZH7bdSEtCFj7ZjmbTLpF1AZEzb75ZXGaP+Fb135S1k3lREsc2uUZOny
         xNTACmEHBHR5b/u3/NWqTFKTepD6bzHISpP4AxvwayvUS4FdesYpgbhsgYmiKU4cD+ML
         qnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784263814; x=1784868614;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pS3hGNdU3fs5am1KSoTDnSdOUbpCQRoLxtrURiIei5E=;
        b=MpVGho1J95jSq0EtVY0/3VqpLmeneUpOU224EAsnfRkpcoakQ9OiSw3H74tD0AxjUq
         BRiQObipE6BgzElDjwbW8eaY67m5LOFfmMh/ejkO36w9VArm83XgVu5TLscxamDgpS0L
         ooR0r+lprNjZZS8vIo0s0BKFcOWBKlr7q04mu/1x6Jn9iMCP3HO3zEhjRl1kbejxK7eU
         CCEeKwxH5LUFARwMOaM7zOtfX7+ql7eBA10VAwC2UNjSNAc7BvqhUd8ijsJtNAY+noot
         0fZV+2LdWiARsWEkjOwb8Den0oXsY1Ubvmo2ciTgfwmrZqrMTQlRHAwJbyXo+GVhv2v5
         27Kg==
X-Forwarded-Encrypted: i=1; AHgh+RoTSOor7W+wrZBNORsXV59fX3Wg4MrXzksvttsNhqd0SW1KTtTwxfU/XU2/wuZFie01ur5Z30xkJ42P@vger.kernel.org
X-Gm-Message-State: AOJu0YyI8PhJDNF1A4fppV97baFh9nplLXvs9qaTA8PLKT3DTFBdUV/C
	OL2g89G/dva9chbzJdyr6P5mfWmHGwU6F4LjBn5NUah1Y9GIo+CU96mBXKh5xHksqX3xaMpSv4p
	zMzodiCjZ0KI9EkjyW+brXOQLJHKSHkZIO1oJu8mycqvjlfUrRm/AOeHJp8lj4B3M
X-Gm-Gg: AfdE7cnxgYdf6mayvnsYO4EVbdR1l6b+vnwlcfwTOlr9zRzQfOTN4yvQ2BaRSV9i6gc
	SNC7uahTM5QfMQbprZs468uSJGcZW1VFMYO4et9m4FtwUwl19hnEPocMEfvofeMiLRvviTw4t/9
	Ceuhn8PrPgUfkr+4DSMRC47j3OjF6Eh1BA6RKcpe8MdHqcKr/cceAknCqKpON9itJSGF+t+P3gZ
	HzfAu5oTMO6yTdzmuTQMbC03xtqg/H/Q40/MpXQVxkBJ/65KnnrPAcMy7U+BDcBy1kibwpgOizY
	C7Xhw6SDUz82kypTqCnq4vwgoXcRy84rIG3ZsPImvrcK8vhTkgZHIuIXOUmiI9nA7bvQROUA4JI
	UIiASg9BNaFVIZlZ4YKjS/+LIHuauOsqj8HsdR7k=
X-Received: by 2002:a05:6a20:da08:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3c38db3187cmr5683885637.22.1784263814009;
        Thu, 16 Jul 2026 21:50:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:da08:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3c38db3187cmr5683864637.22.1784263813529;
        Thu, 16 Jul 2026 21:50:13 -0700 (PDT)
Received: from [192.168.1.16] ([27.34.253.228])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm1090614c88.8.2026.07.16.21.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 21:50:13 -0700 (PDT)
Message-ID: <1498c6f4-e23a-403e-b5c2-883c0ef5a671@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:20:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: smb2370: Disable SMB2370_2 by
 default
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260716-topic-smb2370_port2-v1-0-83d02b2ba4b0@oss.qualcomm.com>
 <20260716-topic-smb2370_port2-v1-1-83d02b2ba4b0@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260716-topic-smb2370_port2-v1-1-83d02b2ba4b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: weLA5paKWJAQ-xp9XzJVeT1_IlbH8Bno
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA0NCBTYWx0ZWRfX75NNSkWf1M/I
 pVoBH4JBVIm9OtH+wOQsY3ozrPWD43oNEMgdHnXHDHpzWwzqVygzToYdTep3/djh+kFf39+kGIR
 LjzdH/5d7W7Du2M+HACdVZoKr0HTSiU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA0NCBTYWx0ZWRfXytrpNktcCUS8
 se/S779/DeyAL3uS1vHiz4sOUqZ8zrBH8DxPCr7KDl9+gdL5/kUQRVxDF8DFp8+26Knn+yBKtGP
 tm07ra0v5rfxhqQNnGUFxsFNKhwRMIzmK2FSeM4LT+gSVAaSpKAGLwpATbrOkfA6/1xiFJ1a0+B
 BfeBWEBdALE+1BBPG33kpj78jcFZCr/h62psCCguseU2z7Bn4pxR7oU2y+cw7B4awY8P1EirrJ7
 vuLOx4HljeX0MHjGn1yWFxsDvPbWMAEonNPc9YoaiBQBTIfUy7VsJJuSCNeoJbbPbz7M8YTV1DF
 aaEmWSzOPD9omn3KCgmdUxHVOx6HEV0RgPR5x0H1p3LJgzaFjEYDCOdGZmQlJsL2eoaY1HRPOwv
 YWlclTZos7KOxtNXB2sRUFQf5Rrd+x6AFf2jaMdA6eEWfG8Ozn5aI0fstJ7CZwzVkWG7ehKq+1m
 WzbqOUyKDY19HO1DSqA==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a59b487 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=EFAlAs44/J+PPaf1aCL80Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=BB0AK1rG8zphIdw4350A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: weLA5paKWJAQ-xp9XzJVeT1_IlbH8Bno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170044



On 7/16/2026 11:03 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's absent on laptops that only have 2 type-C ports (the majority so
> far, including the CRD). Keep it disabled by default, following
> established practice from the previous generation.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/smb2370.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> index 80f3fdae5705..1e02578e4ee3 100644
> --- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
> +++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
> @@ -36,6 +36,8 @@ smb2370_l_e2: pmic@b {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> +		status = "disabled";
> +
>   		smb2370_l_e2_eusb2_repeater: phy@fd00 {
>   			compatible = "qcom,smb2370-eusb2-repeater";
>   			reg = <0xfd00>;
> 
Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
