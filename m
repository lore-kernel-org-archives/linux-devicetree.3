Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EBF415F12
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376047; cv=none; b=pmiNImi5Cs9J1klEdQfL6MABTRAgLRiZeLHcRdeRE2syekO79GiqWEo80j04UGgtoyl2bfrj5dkLlBdNfkWT1ep6EhFIVWgTJq13ctCh5IfXrx2HiiFeC76l9mxlMNwVTBT9aylHzmT4upAJlvdSw/zPwXTYfxthzlbsyZYut/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376047; c=relaxed/simple;
	bh=ANcMsf1hv9itPpj5HQUY4c4I9lP2MSHII9NGez4uWHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBDuexr4ccaB+yO+KsinNiOzsJb+CrsFc9ZPf931/HJUNSIw5DtOtwSMD3v2CeNVt3QiKrI9LMphIFQxPFjVqG2dSBkqDUCNc2X2WK/yTLFmYgGtg0TFWSsGDWS+ph84HiTImJZbcBoF2/5aGc2NkN6fLLeY37ZD/spB8syRkM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkT0Mt/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Us/dsg9r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkT0Mt/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Us/dsg9r"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8029K3490485
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xib6kAdN7wXOhJ3RTthmWZd1RIgwYetUlCX6bJwfoUY=; b=QkT0Mt/A5F+4dzdI
	DM4YwnHgp2KeGHEh2ZkFw4epOnczOKAKhZNl4GITHVn++RAWBA2IZdKFjfc2AmoS
	Sv6/VF3XKzxSK6Z2sJX5+lRgWXBUG01QggitDKyR38TqtqiffF7k7FLYQGGH3jGf
	hwJ0gOUPuxYIP+7zXxZd7D5qLKt1DK5VdP0mHOhjjHTzY6+s7LCetMPJLdugBBec
	L4uePynHxzeEejEWPviSd82A2j8vtQUQy+z+bGifSlGyqCHqQQMx8+a8qwG8GJtf
	8ZUEsrr4xQzuz7vYPh8JsjiU5QlNRkozGeZEK1IuxYozUBm7oJOx3ASSP7n6ZCae
	NzRUoA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f05us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:53:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so50134485a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376034; x=1789980834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xib6kAdN7wXOhJ3RTthmWZd1RIgwYetUlCX6bJwfoUY=;
        b=Us/dsg9rsl2kq8cpTUIfd7BVbEm1CVmCsDAKY4BEgzhO3PjngfZbTS9nDhbcZuMjLx
         892yAUZ5jCxIM3fHrP7sA+GWUZ62ODStP67JG+X25UlSMdXiQldbhOjakMP4FCDcULWh
         w3MuQv91X+OonqhOQ8pJe96vv/AWiEgVsDpkCQHg2Q1UC6BQsbfujHWgnnNas9qss7s0
         L0GGeX1Y+YZUeB9/GodEk8rEsHUNxxONKKuNqbFA+BLKxX/cuCtmGhnv05XECUQBKFwA
         S6nnJ2YadUuQFq85mbxWQ3+nAfI8lTcVWDUj6ujZc8+etzGKAAGqN53FKPsze6oIBR1z
         RU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376034; x=1789980834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xib6kAdN7wXOhJ3RTthmWZd1RIgwYetUlCX6bJwfoUY=;
        b=cqEmytkfh+3WcQ6JJxb5HcXCZ5I6L5czhlZLGuk3iFGhkJ90U4c2FmjdBNPn9xjc8T
         XywBXigKHqAee42GJ5pd4DApmX9b5Q1kJiJtfSbrnuxe5UOP+5sXF9BqfQJ0PJFs9KeQ
         QIaP+uhpLvnjUIZLkoapxWl4VRcD65Pig4LrjGiR+xToE081xPOvBeU6vIcon+43fTrr
         ttzYmKInpEluRRqB25yzfieVCY1c2BNOwMoDnyKxNYdCWHwDmbThuhHcB+qGiY9PnqGj
         O6QwmLkRZALN2pBfKZCEewGjsCLSODit/oh1XOmfCsIrMHsY/ZHhca4vpWwV9bm3Nd/Z
         L5ww==
X-Forwarded-Encrypted: i=1; AKwUvBw3EHdMtO0+p7DEHoDmI/TCE2k3U7y2e18FGvjYEf96Tc3hO/lw3KL2Eo51byUguE4akJ+XCMjQoFNn@vger.kernel.org
X-Gm-Message-State: AFuF++myKOeGwKH8PQaXg9mAFTyD8wZ4sNcBaEQ7ecZgTWDCI1Tw1atc
	lDJI1qOlQotpxpobJHnO8GOVdj0ors46Uv8EkojnJfIPymeHlomjHcR2CdyCDMpsoha2hHYZDAh
	Fi34ardM3hf+3m2sdI1xqRfzPP0Gd++nEpvWFamJs0hOMwRvN+G339RNajI3sEcxh
X-Gm-Gg: AYBFou0bCvDEMI0u/ytE8D1xqmz0p6lQ72ioDsuDh65OnvVZvLL+Q5xGq4p4aCMkStG
	GRBs07YN46CQO4tdgeAX4w6W6huPTxn+wYl6Ez9kGZX2oijWWUG+jnIp/NhlEe02DQrImj3H9dm
	4OD/RkGXRxmi7qjIZEKFmDJSAT59S+6DbUuSNnNPBwPdLTVe5PwurNTdZmOhFAYi6pey+tkBPnE
	hm984Ed049cyr1GF0d1mmgR6jfkA+jBeFnCkJ1hPDGwDDWWnhjChDnG4ByfLcSfI0WABeYY9J54
	IY+W7BrQPtdZJg9ak3jEIxT4mFHkHUYqZVla6u2LTtA2q2gJSGABahOITwoAmGUP413H/HobsEv
	9gC+zoKsrQb/hkOx1UlnfSA==
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr177828485a.5.1789376033680;
        Mon, 14 Sep 2026 01:53:53 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr177825785a.5.1789376033280;
        Mon, 14 Sep 2026 01:53:53 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660219d0sm389755466b.18.2026.09.14.01.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:53:52 -0700 (PDT)
Message-ID: <e59619ce-8ae4-4aae-b617-f0f51c339094@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:53:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord-rrd: Enable USB ports
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911142040.100263-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PHt62WDeN01P4Za1o8cy3MPneuo66B4d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNSBTYWx0ZWRfX/Lcvq9w3vUCZ
 ZYm8UivPl7kn5o8f68ik/URv4x9i/4lSVsiioKVCdidCW6BxrC1x5K2flfMxfM4FBAUkU2MLUDN
 CHdUedqU5PLhNsPnNRQV1/lkV60LQWY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNSBTYWx0ZWRfXwk/bChtJkO+U
 GnhuwVE6MFGiSOoKhj/hBAqHEQlsXBQKplQ1OPUTfni3VaOQekvcnjotmZvYIpZbUTCohaAojsO
 uIdgOnsFFh4vEvUTVgNU83dbUE4tlMmuA/S0D9PylrZiwtTPIwQTiYndydymd+t8u650H56gRPA
 0S9zvr2mRt6zFwTISto2n17RohWFeJQ1P59PjvxxNUFNCBD3esTbKD5Lw9si25hGJSS3XCJ6x8I
 3pc5PoXrL3IPQq71ox/++WpjuDPdqHkuWTGriggqoBOaZCCfgRAXW/1naltyARasdcsoY79YmZm
 Fj4HB4To7ARGDYD93XyoD/YKK/clKxf7ihI3/466yUx2+R0uRWSNd1OWANV648D/H5RBRM0ELoj
 jZQ/RyUQnb1OnyHgtDh5D8M6zQrm/VmnvGjh5mB5C2QCO+M5GRKnAnoGf8qgYdBYd5FZ37ngiQL
 9H1qAAt/vg3qbvUZBJQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7b622 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ReQrK21VLLPqOcHKNgQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: PHt62WDeN01P4Za1o8cy3MPneuo66B4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140125

On 9/11/26 4:20 PM, Shawn Guo wrote:
> Describe the RRD USB topology. Enable i2c9 and add the two NXP PTN3222
> eUSB2 repeaters for USB_0 and USB_1, supplied from vreg_l3l_1p8 and a new
> fixed 3.3 V pre-regulator, and reset through pmau0102_i GPIOs 9 and 10.
> 
> Add the onsemi FUSB15201 Type-C controller at 0x50 with its interrupt and
> pinctrl state on pmau0102_i gpio8. Unlike RIDE, only port A of
> the controller is wired on this board, to USB_0, so a single
> usb-c-connector is described and port B is left out. USB_0 is configured
> for OTG with usb-role-switch and its HS and SS endpoints are linked to
> the dwc3 HS endpoint and the QMP combo PHY SS output.
> 
> USB_1 is a fixed host port feeding an on-board Genesys Logic GL3590 USB
> 3.1 hub. Add the HS and SS hub pair as children of USB_1, linked with
> peer-hub, with the HS half reset via TLMM GPIO 170 and the SS half
> additionally supplied by a fixed 1.2 V rail.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +&usb_0 {
> +	dr_mode = "otg";

This is the default

> +	usb-role-switch;

And this is a property of the controller, please move it there

Konrad
