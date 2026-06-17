Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8FE3F8715
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699857; cv=none; b=Li+7O3YK5+fv4MH6d9mXIV6VdPnGWNEm5cf3HPggg0xvIb1J7Bis57fv0+0RSMPvvJAv9tycPfrFmVWlM91jYKPNOvaHYqh+7jRGxXwjI3I7IJs96T7g6vtzkoz0l6PJdNpZG3Jd7Fs2Nst2pLIrgADa8waeKs/7f3sNWnUteA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699857; c=relaxed/simple;
	bh=XYs/oadJQqChAK/QzTrw5RRoV1X9xRPmSI1lX7f6q3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhRpg2iDKt9TOeZgxuaGGWoCjULgiYfKxdl+I14wB1+0MK+Nnj71SzAU9rbMSvTPWP3IuIyKpNaiGgJASkLk2jSajmvS/hGDZOgQ2Grawi3EyeqFYbC41OJ8WkhWFlSqodRjt5twWELeyMhaQyByEIO+TvQnkKyRQOD3DLOlCMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBJGnm+B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DmAA/v0A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBJGnm+B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DmAA/v0A"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8W0TG2056650
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DorGlPjOBR93ED2pENry4c/2qPs9HOj8ceWaJguAAAo=; b=nBJGnm+BimSKT/at
	X4G66KldEwCD4sZKE4jqWe1JlylGCMkNMXzG7/H82hXZ4ksJqQJlBWskJZ8WYGm+
	bcYhmHDmA2Vh5elHy9otdqwohSUIXWy/u4STRiG5vLFvuJaHtIU5OUE9wUJBH3p3
	YOFoYN97RNPqA0Blxma1CDmmOIVjN3xKsCcC4Rwmou+Cu7TJFfSGcjei1EcYG/NC
	6MCn/WuOAWQorDeAalkSoYTM/LXkjiYPC2W3TKGAFFdvtblMCUrp5fAgfK8QH5eQ
	yT7hNHyYVfcc6iCwVlfctPm2jKDKslDig8X7NR0W3GjHLi6DStN6l+0wtwe+f6PN
	dXUf5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesb4tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:37:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157b3e5182so27424085a.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781699854; x=1782304654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DorGlPjOBR93ED2pENry4c/2qPs9HOj8ceWaJguAAAo=;
        b=DmAA/v0Az7lb9cmHBbUfxG8yNaqPI68BEtoRrTOXOhXFZqotJaZIS00o0vg0HzSEQc
         R1sAkwjBAKBXITjp4TTHo5IHFeGsBuJkmZcPPFEF01jp12VvCpSORmimcCesAoJTF0BJ
         Pp0Ma5Pxl3LXfKk1m3HO6vWhwB6nSnjd/qNCnwjQK8UWd1raO9/cygwtAi6/5whVaDfF
         KN7EPmM1Ef2PTsMFcQqgw5AWsjrpEaJX1xTeRNWyR8Zx09bnUw7EDRmA+Hc+DaJT/J88
         WoHWNkvsl88BHwT/OBwv6R0NTvWkAUPWB4wfS8jiiIdzFLVLWE7ePtm6K9O6L/3Ws7XO
         j+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699854; x=1782304654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DorGlPjOBR93ED2pENry4c/2qPs9HOj8ceWaJguAAAo=;
        b=RGjOs67UVNMrvzkyNGeqj5ZA78ju7F30QJcVyDG5rtlfVXMLBuMKtYyFTNzF81QB2L
         +3zG7Hui0ab9Rau7UU7jmJEgAHWwkKvyRe82h/RhzC1pYiFXDDPRDHhwyGVGtvI/R7H+
         xZAFyKdQNKLbJPYJOYbXEjIePleXRVovRfO6kyyfi3ChOvHnFkszsF9ONHRppeeMCeLT
         pyaezItnD8fknVCs47qM0Fn4X1WK60rvL28Vj7mhwX5cYydofEiP+c9oPdMJLgP+RsBY
         6a23GalQ5gDU2cY6QeN2zds//r7hgsCrw1kBg0wq3/BZppctuA14vzxSBBLhck/NHtp9
         j9oQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/1nya+++TRSvld+4XLvoJR9L+9b9LWK0zXO0jXa7oc0aocvwZFzUYEQu68HgYQFrN6leDR5k+/RWr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6C6Jc/TijuLWNEPeTKHsrQTttc/kvpnYKaw0TuKvQdLdPEfQN
	ot7TeguAE/AxCMB0ik7TZdhL688v4cZ9n2A+munoIXn4+blfxb/hf1uban6GGRl/x/b2J7TXvMf
	895aTd47RKRG7/oiF8yIvX3BTZTz4cn3/3RNlhBlrdaamKigms5JBn7hqZLBJ/04E
X-Gm-Gg: Acq92OF4ze1lQwZRBvIcQKjd0IDD95cwrnb2D7sFb0cvCqCfWlMsatbMuhSgC8vJLw7
	Ny9nPIFUlJMK0WiQhTGo2+aK+BG2oWW062ECXGHleZw0lFwkFfpTb1U3E9Np/4emaQSgLTlHpeI
	VIMNYgNhGqTAzSLYbiNEgftT5kuJ3SoYYtmychUMn6pb/taadDH70JTgINfmDFQOlwC7qO7VXOx
	wGs6IIlNpqQjeJUtKPJE7Yn1utnz7Dl+ThK68qfmOakjddffJ/3iUMUv90LLcod88cbSq4owDpx
	9N89X8VjNpITVCGHFEjuZHbI4iRtUFjoTYQkoz1ONu1YnXM4Qu0CToOPhwb5JcyOOz5fFrbgmfE
	9ALZPtjeB6zMl+kLe87c8FIdL3fAs6cUVP8w=
X-Received: by 2002:a05:620a:19a7:b0:8f3:5988:f97c with SMTP id af79cd13be357-91dbb8439b9mr292636685a.3.1781699854468;
        Wed, 17 Jun 2026 05:37:34 -0700 (PDT)
X-Received: by 2002:a05:620a:19a7:b0:8f3:5988:f97c with SMTP id af79cd13be357-91dbb8439b9mr292633285a.3.1781699854018;
        Wed, 17 Jun 2026 05:37:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44209f0sm794849066b.6.2026.06.17.05.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:37:33 -0700 (PDT)
Message-ID: <97894905-dd0b-4bdb-b0bc-04486631327d@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:37:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display
 nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        KancyJoe <kancy2333@outlook.com>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyMCBTYWx0ZWRfX1AKlSm3StGPo
 WFZ11grjTHD9mAvzgjJfPDTQVV3/aPhCbMwKcSwS6B+sEzAojzyvnZbM+/OP7F/ABXGamWlWHeS
 8jdJ+Gx8v8MvsAUjq+zIiNbKfgS8NDc=
X-Proofpoint-ORIG-GUID: nqewO9m-xGX0geOGdNoZ4N1F2BgKXiti
X-Authority-Analysis: v=2.4 cv=R6oz39RX c=1 sm=1 tr=0 ts=6a32950f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8
 a=bD1lVzg5nK0LGGNu_iYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: nqewO9m-xGX0geOGdNoZ4N1F2BgKXiti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyMCBTYWx0ZWRfXy1BAnEXplNy9
 NF0+SFuWydj8KNroyE3FGfWAwsBzs8F3EwkaZB+qnyjmj6YaLBoHIlDzCdia8HhXDF8gN79oNyp
 khZ/QZZDkR+ByJt8ONnV6+ZVPIZwTJf58BUKVqA0Hc1mC39x1g34yWNQwGJhVPUBMtEfdr6lNRn
 OhBQK8+hwdJVn3rRHJCce8M0u5TYZ1rZ78mbA8zbcIVkgvlG0aYZK2L+whGnyaf/CLMF0DOaQAg
 T4VOFY+yd128b9dDIPVbfu1fQnW9vb3Gs57YJ32Yff9JR8ILUdrF7tfZNuunLUoiX4Hcm/mqnkM
 kTvOEv+Im6j4+//YyBsClOF9T7OeFW1WKqAa3L8/m1Pxxi04X2/Uw19KDGEhuZPah5JgdUgdfJJ
 s06E7GeWic4COCATapLYGk3kfLrqF6CrC7+Q3LRKZSFpXGRsoYesrgffzZ+J+I6Rjc1Pg3bnjl5
 hs9O1Bec+8aOZNOy72g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170120

On 5/22/26 3:15 PM, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Depends on follwing bindings, all reviewed:
> - https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-1-16edddda9951@linaro.org/
> - https://lore.kernel.org/all/20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org/
> - https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-1-bd6b1c300ecc@linaro.org/
> ---
> Changes in v2:
> - Update for bindings changes
> - Remove empty line
> - Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-v1-1-ff132c00d076@linaro.org
> ---
>  .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 241 +++++++++++++++++++++
>  1 file changed, 241 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> index 0dc994f4e48d..af890e76813b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> @@ -220,6 +220,22 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
>  		pinctrl-names = "default";
>  	};
>  
> +	sy7758_vdd33_reg: sy7758-vdd33-regulator {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "sy7758_vdd33";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpios = <&tlmm 163 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&vph_pwr>;
> +
> +		pinctrl-0 = <&sy7758_vdd33>;
> +		pinctrl-names = "default";

regulator-boot-on would be my guess, probably also on the other
disp regulators


Konrad
