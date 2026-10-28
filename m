Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198260;
	b=PO8qb/nE/im34060moyWcXOZpQ2cF+3jyq64TsJH3U8C/2BuTBmjOO8exzaGYY0JWIJP
	 5TtknFNUiVlHqGaiJnTGh3CZFzqavZN8Ty2BEi9AWDIBJh4iiWZDYmurWeBhl7NCZqIT0
	 8oI8ke+123rG14PB+PktfDQ/HDZmEUbDT5WUOPZ7bX2TPUfpI8SkGvsTJ8303m8n95K1U
	 sHL5VgPojJ3jE+wIHD9tx8L4yxGA5BhM/6J3cfBK8i2j/VKvmnG3f0UjsJk0ocxr4a62s
	 r55Vz9gH+cHJmHhVoH0yLi5DRdIobm41e1YULa8r2ghBTHzQxlplqrqq1qjX5Hrn1lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198260;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vlUL5txdhxREUhLW9UqljJ3TVJiPo++T56X6t/sEh0w=;
	b=j23AUbyFoSjENBsT4zHNkSf2iBH24BXc5Rzbo5l/rxDnr4zlm76oi379+DRMpKlAKfCz
	 iiw+crZJmundTrZGQ9AMkWyakXbWXe0wzcHTYWW9fOxtVizTNGWV83hyE94++6lStESXt
	 OqFsJuuho3WKqiSIyQShv2KK25ojrQ11zf7DDTCMwmD39zVi9Ew5e49kJnYlCYU9ZREja
	 jgBsk9bvkxQClNzR35OOj2MDICoxra9Qajxk/mLc0SReIVQ+reS2q06JxIwg4D2DBfmT+
	 6PSktpFw9Ri9jfcE6XMR4eZRraOZkQzSf4RU2kK28PJ8Y1AdGjlANwAEere12+pvKzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mo8QKtvX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSRi4VZw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53517606A32D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53517606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mo8QKtvX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSRi4VZw
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe8tg994806
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vlUL5txdhxREUhLW9UqljJ3TVJiPo++T56X6t/sEh0w=; b=Mo8QKtvXUgWtezBo
	IWgLCX97eCdpRf5KvhLLQgXyUGqqhu4USHlsr9os0vzPZT4yazTxQkpCPbBXc3PL
	+IeVjF6rfpTjbph9MvQS6o2bFOp7JI9lmzmxuX2iCSdvFwKWpGSe02i7zpekDkUb
	Mr5/FkhfryENrc3GUBVX6Z0Zg3O5olNzQNB0YotlvbJSIoln9HY+icD+C6wMSrwn
	tuRz5oDtr8JqFoAM47eQPOycMCBHYVyhjYUfu5JEYV1uNAW/5nRGn1IcuUT2KgLD
	Zu1E3Jkty88q23e7qqqh+3tCyRtBNZcMASHztOD1vPT5lgJI69/wwZh16cA+VnrU
	xyVMMQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttj38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:37:38 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988b530df14so72432241.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198258; x=1793803058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vlUL5txdhxREUhLW9UqljJ3TVJiPo++T56X6t/sEh0w=;
        b=jSRi4VZwxdiPC0jX6q2M1vB6Jx1DdXXVvJq8v/REQfZTaqLt8U3INZtJJNfWhfxx3G
         d9psk0y9LdossAWeJcbtX1QBVCXDushdwRdLfB1CuicJLBXiWcGdsgCbH33AzSjl4kYA
         0fNkuunZ/d4jePLjQw5pgDYTvqtUm1l34HvuutNp8O7DjhwZPf3Mxzv/kbIDL0M9cCK3
         i1cXnohSnayOaahvI4+ZBputULwPXVYnG4SP6yJPIUPQifYso3PE61UDNL3Z1tdl+9w+
         bDu6spJ0Ox8a6vTtWh2mCtGrzgS2UEzhpHTGLldDHsRlYEkC/Mn+becUCjWYqrgtXUye
         Z3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198258; x=1793803058;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlUL5txdhxREUhLW9UqljJ3TVJiPo++T56X6t/sEh0w=;
        b=EM93/ofJMS6/4AsEkT1f2dQ2S/zk2yzpq2+F+oqf2Q1zKVGAmvlzCDiZsktlGBEbOz
         a2QqTbKhiEm2VCLaf3xhUYE5/u9sFjsGcpGnG4gI1nbYBCkijqycp6gh3JtcwZfNU6lA
         yY0Ish87XDFaubF7ljv+jkvl2iY1c8W4LCFkWYwsc99TOH5ztv0rx9ZuYgJJa8dQCEas
         rDIZpxjFfYxkNCrJGPFQ6/WpfV57iG1ZW2aJpIvqswlg39VNFJG++vIUQfU7H+Jm2dg7
         D8WoBlLA7UGisf6KQz6RwcsYenhP02bxxPiFKerb4nrRRkAflefOsR6wgYnLjN7fmYU/
         dvpg==
X-Forwarded-Encrypted: i=1; AKwUvByK31aXaLi8dTExnOP1BDUUKQDZeL4iPEhiwn2kQU39bS2f26Mk5hZm6bsEJS0azFIySDPfKlUIW9kK@vger.kernel.org
X-Gm-Message-State: AFq9FYKeu0tbq/uTDFv0uT6eIsgH/7SYl1l5pZkhuY9OohcjC2Z1SE32
	/wEmb67qMT/L3HaDCDO/qTwJq4HL3CGusBjSqQuwfVSVNVKt9+BB9gsjcNn0mIoFjhFlwCVTHjK
	ukL8yV4YmoYhOVODSm/7DJt0Pa/7yL/r312gM7zcic7XpnsYgfb3LCMgepBWTIz7N
X-Gm-Gg: AYBFou1hb9CGwNVsx7f20/4NqaCXBPE47838fOx0lYqpYnTuWXt/d5oe6pEsl36yZNC
	brudmPjsXCrMSH0OHNfIAevwyMDQDwzThD/E/aWCJqMJjoiNKOwVnmXFeV0ShSraIz1DahFVTj8
	hlBbjN+Nl45lmfSRKFlyUsTTybNoYxYpDzD6DCX86b9ZOdyYNJqzY9j9FTnhX7MlHeqiFuNvF9N
	v3zTBM0XS8BMVLlvasNdFZ5fNQtewvPtp7OAPGkKirXUWqIzPR9iQq0Xbm/+bZ0a5WZBberdKIt
	s7re+AoWrNH9oi45r/qEfbOOUXz3LfhrLVX98sxzuleRevP7o6Ic2PmwPZ/TQAEl6ANzaymyaEu
	wTW+SLZvekfkVxA6MxZ+HNwaT3uD0v7RWus2r7baf0LYJ/aOSQP+2bQ0fWUeLsUU4NlIQcsI=
X-Received: by 2002:a05:6122:3b06:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec4cca1106mr1415598e0c.4.1793198257507;
        Wed, 28 Oct 2026 07:37:37 -0700 (PDT)
X-Received: by 2002:a05:6122:3b06:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec4cca1106mr1415554e0c.4.1793198257053;
        Wed, 28 Oct 2026 07:37:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e784esm601408766b.19.2026.10.28.07.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:37:36 -0700 (PDT)
Message-ID: <5b27776f-cef4-4963-85d4-6d2f970c8484@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:37:33 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 vdda-refgen and refgen supply properties
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-2-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916102023.2054761-2-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0guLxzz9JEeoCbr952WrsVYD50HIN_lE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXxXWFbBKdxsCU
 ly4S2Yz5bCBkr/5XQoUtnkhP1oqjM+bpZDnEHA2nxzBmiCtewz54YxBNzJnsZ3EPKvxcfEbJSIG
 eBmngsJJtgy/eP4VWA2V/tjf3sH9xc8=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae208b2 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PuOz1RSaosiZ807nmPEA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: 0guLxzz9JEeoCbr952WrsVYD50HIN_lE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX39wQmkoME8Q+
 LYiN09NktCH05+aoBGM+Fv0cssuMgrs0H6boLQtyF6kkL7WPKE4rgbIpKPYyeIPu7EHJ4CYDjK4
 6nmJoGuhBXFxuTyX/xGbtIhenBdUOxKxo410KNBaKds5Qn3TDPXslfjargCAPVqFPtQm9GReWdK
 Sy7jfpbN1kSbEOBWdTUOGGLm3pXS1IPifR4LZr3RcKKYw+We8lvpH0xfKGoUWDsI0/vboMX2mPm
 B+ItixcrRQ5jb+q7FIJNVzKKkxl2T3SlzM9OwNiwZxY6PzkO3dRvVt2sYNfMMwKE6+aESJ70UD0
 MyXnxAUSXEM3wUkYh/NCaovQzZdSAbLN2DWdZa++BRZn2oHGjPNtm9HpDTCYFURZf7I0fKhDwGQ
 fY9ZH13psdKC3OP5GQnLMc/0ufV32JRiuMQyIEGrjeDZArIa/259Cy4TuJUT+wqog0UHaAnwR4t
 XCbBw6PvjqXNDi+Cvtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On 9/16/26 12:20 PM, Ziyue Zhang wrote:
> QCS8300 and SA8775p PCIe PHYs require dedicated vdda-refgen and refgen
> LDO supplies for QREF to provide a stable reference clock. Without these
> supplies, the PCIe PHYs cannot work properly. Mark them as required for
> the affected compatibles even though it breaks ABI.
> 
> vdda-refgen-supply is required for all three QCS8300 and SA8775p PHY
> compatibles. refgen-supply is required for QCS8300 only, as a workaround
> for a hardware issue where QREF actually depends on refgen3 rather than
> refgen2 as documented, so the PHY driver votes for refgen3 directly via
> this supply.
> 
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index b353b7bfb839..bd4c98784142 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -94,6 +94,11 @@ properties:
>  
>    vdda-qref-supply: true
>  
> +  vdda-refgen-supply: true

There's 2 REFGEN supplies (0p9, 1p2) and the sister Glymur patchset
defines both.

Konrad
