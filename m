Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821704746A9
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818918; cv=none; b=SRYExgLaEDO5EBrqeLIU3r0kXivM8QVI4nJSOru8Wl78Q+qec18XYrbwN8i9Lrq8XFCiFcqSMORuhXFvZT97xi/eeslKxS5aNZTfZJ2nIK4myOIxNitjtjEm4DrRsbiIn9vMJCsxJIZJ5lEiGUE1uFp8zch1CAJhyLdErA1UPHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818918; c=relaxed/simple;
	bh=s/Mbf0x0sIgUm6VG+i/AMdI84Hw7nY61I9jfRK0CkHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0HV0TtK1PAuuIDAevY/o2ZfoUWhEYp+j8V6EoQ4VYfT/sB06+RM4d6OvT9W/DEQYKXCmvEa4KnhKg+gignA7m3YA+J8hkI6KAlEhjdjb3XIjOESWV+zKe9pPjm4pPHDxJ+DDpbZohJPOszaFM3NNeJ0rNTz3vfyFBfO5iAG5Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wxi0cwqH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPiBgaPC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wxi0cwqH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPiBgaPC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC09BT3292338
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=; b=Wxi0cwqHkAgKc/8H
	47z7krdHcKVLZp9+6FREziNJLMk0AzO382/usxOMx/yTSjtbPjpCZsbpc0oY8PEp
	0ZommoQuB3V2CvFWrYDmy/3pekK7bbsVRMoLamWDHFO2J6nhgfz7AJdFeuPse9X4
	RSbuIvV4OOkZCg1/x8Y8xEsylH3Fucd5NGkTF9er5pJcr4NOA7JClvK6yYAP9hlb
	kCCY/zo1QCXjd/6WQXyw7P6XRo5PE2lNs6nVXfcPIfQtytKhmfn39Pnkx7EttP9/
	YNspKQj2E483gkIUCSflf4j2gHr+L0Ppq3GhDwsYiYIMlh4Us1JmXC+GXOookB6L
	dlVMTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j280-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:28:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so20641985a.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818914; x=1792423714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=JPiBgaPCS8uN7GBLwuJEJQjPJdIUAEZbhAEIfDErVRRmh1fBS2wZO3QRdMXUNckbCX
         BGI9NAukeKxOVz70hegrRIyZ2x3qBTjf5aO3XnVQUAUWXCnA9HgIdnFtX2gjcebAgAkL
         2qpdPGYeI6DV2tznV95/EzPSCJ0InzE5JLx9Kfwihlqr/XLJPEVTxpnFpYFNnxUr9C06
         /h+m0BPsUfTfOjQx5N4AHVOcTsfJRKXgnnarnHZM3kOSLj9TImJ2oGoLamO3+Tq4xW1U
         I6gjyrsVPsHpwKBI6QEpX1pmvNtI4kX2f1XnCno4VOfrTUuwB7tafeR8QR4vXWtCBHMq
         ATIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818914; x=1792423714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=ZpPwQaknAZ6K2J6EPnR1ZKmbb1cREItYa78CG068IM8gSEmJW63k/tbldQtZBfXk3S
         YwnZx6gRs7dVU9JsQbcy3GHkOtljyMV5v8tzHjA7xkEjeNCYPqcU0cwasum6oZbNNUvW
         h0unGCWICMJPOWTlE6mMvutHONZKE9gQxNxLuZsu2iEnLGZB+qiEq5/qEfpmBRaRzX2L
         M8ZDOSirb9h8bAqq99yvFY/hIBJN5iMsEIH5vHaiJRK/iximXM+s+mv6VcNed4EB3jSg
         pDTQoo+fziOKrtZ9qJl6jXJs3UBVLfg6flRMK/fQ2j+NCMogsgqt0XrNALFKDBf+8R3a
         uU5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxiJCcxyMA/qnsCfwmA4yAulD75qt/xH4eza0/RRlFZAPAG+TJiJYdkYcDCI0Izi0lnXc+zaRjoIi24@vger.kernel.org
X-Gm-Message-State: AFq9FYJTRfFW1ci01+P0GjMT1tIqNv0mPreQp6xSF23nkH76nUmUsSRW
	/0VMbvxwFzqt33bAbSduyG6Z1lyn2UMS9jSFvx+7y0tipjmgqPGZe8xJYQyMzu5mtXLA9IICkf/
	L31D1vSzORET4CLwh8kj+gHI623/rZyieABUS/fsfIvWSwNwpbsLSKtRxWT1r/Wc/
X-Gm-Gg: AYBFou0ws/vwwwQC0Lf1wm7utK/6E3HdTMmzLNEJycfuKDQ1X8CJr7goM8oLGLsrD5q
	qK8wDxR0pIba6cx5h4NCL6T8BaFpL/dB6upYEWrtcSn8jK7OSNtzi0w8Gcx9gQieXOY9ZaIzNaM
	kWZKlvMimamCbgsox9a0xipKjjmu8mOEc+MeRfStO28A10fjI3ClxT4oYFYHwhlUyrXYILK3/4i
	ndk9jkDj64HTITqTyVbbvKaqUcmVNA0iVhhz3Oa99ni0O9y3n0RkjFrG4dF2C3Un3eQTfsjzsQO
	ZqzCa2Ozk9oAr1HIHIXasYE7L7XWjaBPM5FrUqVF4GgXEPE2g5MGvsg4g8xZcpaxoDFrveS+Tyi
	IK6gc0ozlr8B/dX9fCO5P8w==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr1710087885a.0.1791818913846;
        Mon, 12 Oct 2026 08:28:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr1710083285a.0.1791818913355;
        Mon, 12 Oct 2026 08:28:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac702fsm475916266b.65.2026.10.12.08.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:28:32 -0700 (PDT)
Message-ID: <2caed75e-ae69-4065-ae31-12d229de4b7b@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:28:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/38] arm: dts: qcom: ipq8064: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <c480d106c610e2c78b3e4c3f5e35fe19ccb067c8.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c480d106c610e2c78b3e4c3f5e35fe19ccb067c8.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX7cnGT2Pz1oFB
 pO0kGM03EyC5denfB7M2HjNZuZ/6xYEJBL/QfishkApnGYJhfcYUAghH3cX0G+uyabRnmfvdqP3
 eZiMUWcxVAQt2vGpDcH97PKEKmfGNxwj/IpkDEQKuTxcGzlW5KRiubru/VwsRVRBOZ8HxEJAnLG
 T8xkAukJsIC6bv0ThTLggAZM/AXECh46k2Vyv0hShnUZxOeKttNNM0nLyghi0reBR337IshHD1g
 rsddUBgmRJL2b/RhOa5JvBO7I3lLrVWT92dtzEbNusK58WKe56yN5PbEjXbsK7xG0hPl9VtCp9a
 KqU7kQhIzGE1HWgWud8rNMgeWfN1kwC3IQswu73EPXI9MgHmpGbyf/jYweOgCLjb5sCJFFhOogt
 rArIFxSlfiG30DX+tfnMrGnTpPlOa6mdvyp0lx7NP5uoRzJvFYQ4eJkOvH1A6dB4RtUQgu7hJnV
 opBLIdIYcTjk/Cu1JzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXx0sBXNuvxsm6
 azX4XdNoLhbHUs9FXSN7N4b4Be5/qsfMmeejmHvZluEzFG83pjgtU8mVIVZ3j6fQJogIomkt2TT
 o1svm1LlP0Hjb/zP8L+B/494obBR+k0=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfca2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Bz_mBq91WImKixDMOFkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: veiX6pJA30tWa_4Pv0RCyooJ4uTSR1Cv
X-Proofpoint-GUID: veiX6pJA30tWa_4Pv0RCyooJ4uTSR1Cv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
