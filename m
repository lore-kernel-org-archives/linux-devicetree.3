Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CB53B6C0C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383826; cv=none; b=rhXm/vuuuvGfk1SvV2kwlPXzb4604Vj0L1jbBrdC8kNR8sXfLD6CY7JbXTiBJ9zy+cLdY6RstEpPLoGAOln42oI13U62pgeixDdjeNj1lSTGqQOH0ONheFDTxZHuu+arCIrGQD5MvzPJ8Dw4ErksDHYDINAYn9dKsWx//L+jhMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383826; c=relaxed/simple;
	bh=LdnGg9Y/sCirK3UPq/cK4ot6g435Wl3OPOEBy11frNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=et5ou65gjgOfE6hMidHuTq59LxcXe0cHCUCYV8qg1qORpAgpor0teItIn8x33XB7ALadMuo/JLrbuwGkZ9T/QT9VyzlrKlHd8FWbegAiiA3TxxEPuZpUPx1pSbk5bqN+k7zUnHFfFlBRhxDXuKeF7bqUXEwyZX1EFj3x211YYtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8Kw/H4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hnk0r2Em; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8Kw/H4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hnk0r2Em"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm2p3901949
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iIgpsk9T6xtVsG3/dTAVDmPRmbqXdTlp8Kt0v9V6kas=; b=p8Kw/H4gaihVLdVP
	+z9NGQLlj+tKdWKQqxbZV+gVaLw5jTVrYwl6nw6XRgMQqu1WduFL5BomDQ2F0Sjl
	LAF5PeBq7v1cYT7o1yD2fYauibjlGjRhVqXulg8vrddLoQYI0sO0flt7GZDefDXb
	io8+HuJdlK6WEXT5uvISPUWFeAr3lNSLRatGU2lDuQ08bCCAMvUgxkAgCfUeUbrb
	rjLcr3PiZxwQB5WVZGWwo0gg0UNUT9OiS8R/nIwyXu360rW7r1One+nfNrslZppl
	dMJicxxx5mQdDJuPGeOETBKYALXOO3H+bFR3iMRNlG56APK+J+ay+GLrA228JYCo
	DBeX7A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrj84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:03:40 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c8328eb979so102745e0c.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383820; x=1789988620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIgpsk9T6xtVsG3/dTAVDmPRmbqXdTlp8Kt0v9V6kas=;
        b=Hnk0r2EmpSE5nEdM+KqJq1EdYcBr3WWncJj4vkLAbv4qqnON1969lLbi12aEvaxFKQ
         Eo82xcLmXEVJqGtbH/ByvvGswuFdJN8qxeVITICnEdIZiuq9jov+YrzYSp3Lm5oA5kbA
         WtOW0H+mGkcM8gZ5CdB6MTi8GQAn0TR9Aqdp+MmgCC5UXV2biVX5Y1WfsdUG1zhziDYG
         GhuzS8at4et4n74pjHmErdFWdice4wL8L584Q6UNdJM3ethaKx0xMQ9Qtl4i9a9h2V6R
         Ekmo5xVreuvf1uMrVp6QW7dFhbC4EYTIqyLzuKN9p2zXyt2ueoDpa+pHu+2u+Bvpjy3V
         PTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383820; x=1789988620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIgpsk9T6xtVsG3/dTAVDmPRmbqXdTlp8Kt0v9V6kas=;
        b=Q6ixMJn3EZRJOpuCcYW4GIKGNahKACZpAjbmIFwYbD2IwvPYE47UJGu+zgdJNT3mBQ
         gZWnuB0V2rsAdS+BaPgtuO54dn3xYxVCGEs9H8gax3TinPVn9HH3EUzIgfyAQzOChKNV
         eHOWJTI8XqIfKUVfFNEn7SSHeaXtoMPAOH9u24qr15vqB/Sxowooy1wBpLJbmrwcYnhf
         Hc6BfaVj0CPfCsP3UAmNlLS6zfP/iSgJHBLVe0mwNAeqM8R5ZYC4z6amfSPRka2NroNS
         1bSE6d6Vkk3UF1Umk9gcJEEIEYq7EPX99sprtRviu7V2tHlNdEPnSsgcqaia9D9yb3mG
         dJzA==
X-Forwarded-Encrypted: i=1; AKwUvBy8HilQN9AUF2D9RMLEx/vpQn6Ufqf3bSQeTh7Kn7gZxjaV7yfyxIkuK2DlnpDhFJ8uWQQ7uU/KIHDy@vger.kernel.org
X-Gm-Message-State: AFuF++ncUGBQV1qx+ksMr/ozErX2kXqoyb9rk4MEgVUHbGctxtOr8Iww
	PkPE652GUgb37exmgMKsxMo87ft8RQ4sJ7aiDKjRQ/fzYgX/ACe9KhDJ+GXQFd0Sst+zZ2MEmH/
	ZTKtYSpOJDnE3ff8lyRjCPVPrp8brvtV7g572lXsRfWQSjFT463A5yoTvXQYT4DjA
X-Gm-Gg: AYBFou24zIa+AA3UtDBIF0BUJTFY84ISEuyrZ/B0P+oF1XE8UfMCfj+yjvB2EuMgzmF
	q+hgB28Ap4doLLl5HQmWKJVEDG6/MFKg5i22/ENi5weE8XX1UGQxutkVx1r8NKuCb48jXOF+0t3
	r3bgv01o4Hjj30lgufp/MP0Q7jGpwhlxnRsNdeLjoLFnaU5m3NmJVeSnCrvmIXHY0M80nfj0rU9
	AJ+KLgmcz1OuKe2bqiBz8+eNmCTueI1Ywy5YhDI107IlQGyOefXeDxNCHTZ7+T4jauyxxTFcxbq
	7X9xjsraCbFlTQXFzu1AFSpogJ88HAIIueFdTGPCP+oVKzTLDull4MDS4lFfLF92oG2G4ZLWgil
	nu9Q6gSU0rZTYOW0ocLmriw==
X-Received: by 2002:a05:6122:2cd:b0:5c6:829a:c369 with SMTP id 71dfb90a1353d-5c981d72af1mr277961e0c.2.1789383820145;
        Mon, 14 Sep 2026 04:03:40 -0700 (PDT)
X-Received: by 2002:a05:6122:2cd:b0:5c6:829a:c369 with SMTP id 71dfb90a1353d-5c981d72af1mr277943e0c.2.1789383819714;
        Mon, 14 Sep 2026 04:03:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58f8d27sm4024448a12.10.2026.09.14.04.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:03:38 -0700 (PDT)
Message-ID: <a0d2d7c2-6759-47c3-b430-26312d355810@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:03:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/34] arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-25-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-25-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 91SSptAnk0sx2K160JPE61lEiS2OaIAV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX3yDflxWwtQTC
 a3L+vLw4e3T9OrmEpomklufxtfmZnN6MudTeVXky5hFN7suz08gpA6yOTMwga7ta9R6uHgLAkla
 G5pAJ6IeeUm76B2fMHyaekGNLuwoTKg=
X-Proofpoint-GUID: 91SSptAnk0sx2K160JPE61lEiS2OaIAV
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7d48c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fmVD6mvdgdatrdQPAe4A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX40WrJIEJOry6
 KuVJy6eFTjk/e74xeTRA8lMZRjciVo4pfOSD8idE1CIEMFmv0qJ7BxhNul/oJsJO0YxLNUXMTDl
 8kAQoxO/wRoGo6rB2ntCAzaj0IuOvFphph2y8ID+f4tRSov7bSA5AAfD6DDAS5t+I3lOucVigjD
 a6EMs5KlnCVCQVsQ+KsdQh/9PU+mHUqF7XWoBl9NL+e2y4+7lb6siiSAaUfOhooFO7CFEEERHaQ
 Up6+FVrkWWni8cWjOOY5/VMzUpzFFbrP48Fycd0USq9JujNKLNbeDcpjjo2is6Wz8jfIZSQ7RL0
 7TY1xv/ZKy5/op3X07UqJPUTnQYlbo7gelfFfrpNgNt9JpZOvE068yyjTLyWk5hQYECR1XHPIOT
 3oo0u7cer8vN829kqtRc/VG3nAJSkDKhePU9EH5d6GFywL/TLDMDGULcX6gPpOHKQMoFYjND2XP
 SOX6jbj1S1AgT93tR5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 13 +++++++++----
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts    | 12 ++++++++----
>  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 14 ++++++--------
>  3 files changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 3e636926231d..27a0b90d2b7a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -618,15 +618,17 @@ &mss_pil {
>  
>  &pcie0 {
>  	status = "okay";
> -	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
> -
>  	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
>  
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pcie0_default_state>;
>  };
>  
> +&pcie0_port0 {

p'h'y < p'o'rt, just noticed other patches have the same issue, please
touch it up

Konrad
