Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6893EDE60
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561963; cv=none; b=OBPj7fE0A0dBYC5ZGZ2rDIf1iiESan6XLzDAnkI58998AP5bz6DT4Y9alxLbEXnekuIj0Lqf4VX56pI6XJsqvYAJVpnvUmsctBOhsOWxXPA1zB1IxgRtsTuVNpkITtAbMy/mPxXzoBesdbGVn+JTo+PeXO/bzo8KUBjzl4jBTZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561963; c=relaxed/simple;
	bh=9Yeg4pEJAq2y1vfd7BWO5GQQThMFfvnhf4s5AWl9EVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDz3gq0Ut9I+on2TjUDwd7Gj4ROQx/2qA7kQConW0uP+yEceulg9JaMi5to4n8zcjRoVpZM8DIVJLQSiHOhgPa8Tz9NsJwwMR/jHink55DU//utSadG3kTNQ7roQag++iCT05EkTsCdPGgBEa4NOYMHpuwbxLvkGuB3OrojDfTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdlAzuQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8sblAiT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdlAzuQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8sblAiT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R1QL1477021
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=; b=YdlAzuQVQpyMLmwr
	8zZx/r5jylDIESIHG7/yJft+Xi2E9KLzrKi1FRjZKAGGrY7ZvBshpymEhLnOw9Xq
	+MtQX6w1fgZuk5AqDO1bENgCyHpdT4EyNKlepIjE6wcB64k1ldB584NXWG3PIQkI
	JBlJ/NDxW7X1OX2LfFKYSUCDdIsaTAoo0KUqZlcsNvVKILb/sPecYkdZvSjw+7Nk
	4kLyODpIvZ1EyQiJ3XRwjK8IWtQW3NvW8G8N3IzZh/5jN8XCCt82sZSnAznOwo1C
	MPb59y0sIZUJ/OHH5IpC6JTxQ+zh1J1BYRBHPZOCioUl8R9ebcWzIugl2n+KI+eR
	jDP0+g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528p3br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:59:21 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-977c5e92ec6so32992241.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561961; x=1788166761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=;
        b=g8sblAiT4Sp8eQVN+U3iqDGjT3dX54FLIvFZr6a+M4iZAIgu1+gaDqrT4be0oObqWJ
         zqWDs10dz81i1CApfDQ2SbakXWrprkNF3gyMC3D496X1+e4YuMnOpQT5E+2DmWC1d4uN
         GBLfUWk05fwhhX+pp2JIpKWO7Ezjoc0RXSU38SQ0bLnEc5dnuot3PHTFWPG1gPMlU8aO
         KFKCTAMQRjcpPBn2sNSt4IeP+Ql2MuGDi3F/iSFid6JIKsVA4OuCNbbL2T/SU9lzkC4/
         I32QinwAUczrWweby4ngnscgSUAHHpRh15KWQNJq5mtjjSOB/LcJfAPE44p0ikkjaaYm
         xKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561961; x=1788166761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=;
        b=ay+3dMlegA0ZWV11CM/g3yTpQ5E5w0ErdWcinw/D/PZ/1ODMuKH/DlfPXOdEz7YXFc
         HwXSOA9zCEu7rmg/LNxaG7Q0Y+9+261BL5TZAe13cg9Bp8idxwMBQuq3Oj5zgtEo4gIp
         g/7e6Sbe3dQw4cK26wi4mSu3WpbaWUZ5lSC/tgcGc1X0umRAduuhPyE7iWzz86UAYRqB
         XCoiw2b4FD7fDHNWfpZsYK8FhP3Ou6MtLbQdKZrw2yNwZ5txlVG839VDeD0NmQIXjm95
         WRIE1BRJdoXveyL5JxetvFsEeJxaLUUWxr/GA14tPLzdRKivXcV4CQy89wqsF2xsPUSo
         18Jw==
X-Forwarded-Encrypted: i=1; AHgh+RoCNqp69b1OySo8i8Z3hfN+Cdo7EmaLUHcFYEbEbGtseKhIE7VBrn3JkxplMoQcoiHNUsAHKpzk52IU@vger.kernel.org
X-Gm-Message-State: AFuF++lcKNUDopaHRN27Aosi+CCIyQ/4WqSHfElZbGeX29HHCM1bfQKQ
	1a+BkJ08wjuubTEHXg9nH5ZnKGdVMOSNlqAkupLy9mHMHI2pqRyNg4dvu42mpQjn6InX+r5nYI5
	cG5df0yAKwrV5LhBIDyIC/GkoYZ/cYJt85M1TNGO+IQEud6YrrQ5ifEUsE2jxO5T+
X-Gm-Gg: AR+sD13gavV/kEkT1cZka06dGjMxC7os6zHf1raLhC/dj+3aa3npplbnMF/aRCBBoHF
	+gEagSvMJAuJXq7gPQclLQwEJ9REXDynkLX0bHsijy/iqvHQs0P6U8zWj031Q2qrUUhjccH0mPk
	8dm4Dq9wKzf2yZru/SvwsiklPabqLN2U11RHKK8mDZLZWA7HE6lXBgybVTR1J+8rhjUL3h/Dye1
	Qung5ju5bg8AsNRB1Ju5hjeZ5JvdVQMZ44uopMtLv304HUiHH/1ms9C345AL13jIGi1YzC3yRTP
	S3yqUgHuJHceyOQkSGrG9pzFa09tXnyhxZ1xwyFdwnT/Y9cPm9cWdQdpBHlD8dbXegCh2Y7WlPO
	WksGdufr5ZFFdMRoHLo1Rr787
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3657455137.0.1787561960755;
        Mon, 24 Aug 2026 01:59:20 -0700 (PDT)
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3657442137.0.1787561960402;
        Mon, 24 Aug 2026 01:59:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e001305sm8088185a12.4.2026.08.24.01.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:59:19 -0700 (PDT)
Message-ID: <2febee95-3c24-4244-8a21-1b769e90b003@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:59:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] arm64: dts: qcom: ipq5332: Flatten usb
 controller node
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-4-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-4-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8c07e9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: Jf955SPBwgmrJe4CSZ5inPgTTssXp-g9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX/8ck+r3WjPn3
 bqMarUN8B2EnuMljjVV1W6jZHyRYX3bbcBtFjuALhpypCuCjhUdkHIq8jq6VqqRsx/HKf9aLcaX
 sAOERYKacNVKu0WFLf1OcCTRY7FJhUUqZb3wSQXRGpneMPO82tI+V4HrGQNlmXiAxxW4LvZWA79
 RRtsxhkWbGTx4R/T0uCCaxhtbSH6mH9OCdu4Ym0nzucHhl8rIbZ6pAe7qKvBfN2J7dF6MpK9MKt
 6alEH2vMSbAygxWpE0LHswfjP1DtL09JsocHNetVLfX471yV05JrapeZESmshUfrLL5LDni4H2j
 /vTPm48rz2ruEitntXrGTQXq4irRrEY96bosLhY/WERMS3soui2yiaQU5An6RtBa7mfrDja36Yt
 2j4ZvEb3frOUhlM3VfOxsvpUxJmlH+m381Y0Rk39OnYm2egLfaKtQzPRv/ibC59xTrRsvzpKuj0
 896xh9di9lrK/1S9CmQ==
X-Proofpoint-ORIG-GUID: Jf955SPBwgmrJe4CSZ5inPgTTssXp-g9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX61CeXXLZcmpm
 y05wh8r8vC4fUOwATcX6GYp8vGSy+CH727FGVzu7+Oqnd/GxilW3MEil/Ni6PzA/f7F9wv3qZde
 iQ6HjnA/snDeJa1YV2cRAjyKr08lXGA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240078

On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller node and update to using latest bindings and
> flattened driver approach.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
