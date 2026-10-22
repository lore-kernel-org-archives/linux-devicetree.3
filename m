Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656375;
	b=hxs0s8dj15rTD9TJDzsGawC3f9s59V9BGjaaFPYL4DyICxOOvBSYlaBnt6rKsx8JPujQ
	 t05VN+tlMyYC8JfBMZmxzujvYn0yzPW2VG2JnzEjlaSxdDGvb+mJ/iUV2rdUB3MsFnQow
	 YxL2CW95zsvWsjSCfzQdoD5iTtN6NWRAl8/mNQT9y7jh+ttlDsz6dIjCivVXdhvYtnbHD
	 Pwz16Elt6dcDmktArlxPfNDnQpkh9gcxZvyvYJ/RWeYLggY3GuXImHlJ1YntoNaRvaW3N
	 BKE81wE0SfqGQHsvIn7q//y9BB1sBiLLDiH1fAvCLaaur9Yf5qJLwAYaTn8vT6tr+hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=;
	b=vWugsO8XR9sDvjSKTxUeRi/ZKMEqhZz+iBxUFdwEruBP3vUYaQUc4rXVN9AyWVG0phDh
	 ssPG/pcWtvvHa4Hx4yQgg4q9gqta4DNft6H1UJKiAAHYQmKQtmC9IlACFGgkoYlnQ2g4J
	 T9Q8j11BlzTARl454+WEKYmzI+zgH5s2V9IhfnP+V1aej9Cw7+XdIK9kyWQMDcWoOqcWf
	 SuYKy8naNLsrJNNs4jZcuM53U3vit7MBxe6D/eX4IZqGcGpCMaVA0evJS8EnQ8YROPxPG
	 sXsZYVRLQE6A6eg7hRnNktnW8x0xEnxgZER7QnjwIV4VQdqEr9ihQVMLTS53kj0LR7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLUPZfA8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dir1VyPC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E785606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E785606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLUPZfA8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dir1VyPC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M701ma1560322
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=; b=WLUPZfA8tRU+Ta4N
	Kjoa0tMB6NuojI2IfQxeCs2fnrqRH0GFmVxi44ALBlByDbHjIU8RRjVq7MQNUxMc
	3YNsIo/Uyza/fELUlZ0THDwT3146BSatc+pT7ivTuJLFwzH02PQ/s2uLGo3JOo10
	4kuR+LmjAIrF1MS3YGE92Ogygw+NAyVntECCqnJ1sY8cZWMCR2XEn66V54x/epGq
	AG9y/0ncZ+W/a12mEq5R1P8nWPEKyLjI56KMUVrxcG9YH8xKpC7Y2GjMXXMdWB5c
	GbHecWt5Nju/8DgADrWHeAFZm4bN8imXOJko8KXyA1MMSWaaKaisbPiWMvxFpvhk
	FuG/TQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahcus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:06:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530cd3dff25so2488921cf.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656373; x=1793261173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=;
        b=Dir1VyPCNQUfMOL4NlrRNQvKK4GyuHzD0HDHscMhmyvKJ1jhu/R5aozvbvlM1/8GOi
         YFUalT2xOrYmBrI6Y2+ko17q6LM5xk6dLNFyCIrGYO8siN/RI7wgnonXlcqpAPukIkRD
         XFTomLZF7zVAFHl5bMjx1/zbVPJEfImZEYY2qQOqe4ku3/qbfgLwFmst2+CDcwd5ivat
         mC5TS1FtDNkXfoSac5pL+wGA3uf/i1JwvobWLaIvf2DwaGYXyokrLCoJbRDq3pIug+tL
         i5dQseVYhz4L0S+pKyVrpjGiPf82loH1gjzpUnXnJU6H+s2uV/drGxiZ68dQtTECCfk6
         wr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656373; x=1793261173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=;
        b=qitDPX+WXWTkNoECHDBl2FUuhGJdObLz+SR0nyLPh5FMZPDPFpWlnuRKapsmYYjATd
         jECY2TRtJwZd5lIu8JgOGWivWpJNwPF4EnVT5XPY9FHcT4TowsoFoIqFrAviCohOWqoC
         lGLBya9PDcpcg5MUDAMqMOllUZ5hTILTEWwr9QHuJKWwx7l/GSOUCz87YzVKCkn4/vNa
         osAW7jGN2A7grJLae7W1JXrYtZEZDmgdujdWl9riKSnwppLSNuHBOMZ0iBBhFHsk5cJ5
         jWG0Fl+vn9+H8Qdy19Gg11ZYoM3WMMGiQLshzYFf2FTdE9Sh6b1pbbhEiwzH+2IPQpwo
         flBQ==
X-Forwarded-Encrypted: i=1; AKwUvByUoFoLARsa6lr1zY3TnXRwl+nk+fvGShFw8BBLeyBNpvCiRoBCdibnskIP5vlPIJoh+EryNWfQ3y4E@vger.kernel.org
X-Gm-Message-State: AFq9FYLUK+tLRFUv7ZEnkYY/jMUjDOEG6s32Afi/ZQ8h+H8mskx8mRvS
	KaPE2Gm27Hftr58kHlLhwwDPZlhy3h5Dr6XkHgCqjKMonXaenprw2OSVItVuPG1X9Bz+p/DBTkq
	ZY6RlHGqB9YNCbZeH/xJx8KxMurqi0g+GmocUqNSzq0DDNo4MlQaDES7l3neUXENq
X-Gm-Gg: AYBFou3z7czOG51Fswip7WJh3nadUo4GmUR28+Qfc8mD8htoF3bOvOc2XKXaHx2oTDg
	oSoqNiw0aUt2EiRsrceggeEX1Wkx8y6tv29nQDbqKMirmIamFUMSGi/5jMrdR8xoP0q5TdcTTST
	pPNIyech4GVTYcDEMyxgEWbdjDuvyvVyKfD7sJCDh+o5vxOx+bWfTMpfYmiLPCJj/3rpD3hXcai
	FrwvNc7hCqrivBA5jkJ//mDkBPHq/iduDomrI8EoThKNrluVJJbdNpZyTsVcuqkL8dXbnmTctdN
	68yQpbDWFJEYSx2HzqQDsf6eMGw4XhyeTdD3kNzn0pQwbifXj52iMLFIOLBIhMDGc7fHj4soYyE
	/VZNo9nVQ6/XjMqAdyIBICA==
X-Received: by 2002:a05:622a:138e:b0:536:662:3776 with SMTP id d75a77b69052e-5369b857ce9mr85542821cf.3.1792656373318;
        Thu, 22 Oct 2026 01:06:13 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:536:662:3776 with SMTP id d75a77b69052e-5369b857ce9mr85542531cf.3.1792656372807;
        Thu, 22 Oct 2026 01:06:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59a14csm78770466b.49.2026.10.22.01.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:06:11 -0700 (PDT)
Message-ID: <af0cf1d5-3b0e-4534-8a85-e373834e2f0d@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:06:09 +0200
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
Subject: Re: [PATCH 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
 panel overlay
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX57yAF2JU2btx
 w/p/4vr3MF+UnwucpKGx/YN/dZmH1az2mf42o1XQaEYajZTisL8l5ALlBozWhgxLh+iDzhNKzXn
 ql2J3qg49ZVFPn0KZKY8wXXm/vcZ0GcIPcs7RW1H8EMPJdYJzB9qt+vI86KUPGd9Y4Fyx02PZLm
 nzW0iY/6Aceg0zPwW4mjElWz2cma+SUb6szh+ZEl0D7dLrOv+I+5amsDpHGdNvH9gyolp1tvOsi
 1CBs5qoGJWbNQuSUBCWiOAh+OlSiY+Jpw1eXqySPDZz3o8NgJohKyiL+dPGd6ZTXDrmzZ/2PSm5
 CqqQ6gDVmkx9JFOvKS23y4z40ERlN2zwqWL/ZzMvZBc6iPFeJi4dXdBb+TyR5jqGL1gSYLwjMpV
 evR1w6BuG2U5GzAC2YHQ+CPCvnrawgSdOzno8wi/+9mJFClLzISAoHSrUwURu1IIjmHHm2XL6ZT
 /jZO+Hj9HOBBqLNZnOw==
X-Proofpoint-GUID: Dgub1PQDyW_C88kbjhnQM9vgYZh8Cls7
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9c3f6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=y-N8J18KE2yr1oCy9oYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Dgub1PQDyW_C88kbjhnQM9vgYZh8Cls7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX2CeEMLSLXCz4
 V/Y15yK7fws/PJTlXip/usJFHNAdIAbKsPgBfTE7mrGmhB0I9FaOZb2dKkjNqeTcXZQ2zQqbSJq
 yCudj9/+oFjw2OgXppZ9VvkmKFe8SQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
> Add a DT overlay for Talos Lyra EVK, to enable DLC0697 panel when
> DLC daughter card connected to DSI0_B2B on carrier card.

[...]

> +&{/} {
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
> +		default-on;

This is a little strange, doesn't it come on as the panel unblanks?

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
