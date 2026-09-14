Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4499344AB9B
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388900; cv=none; b=ZUEAUE3pCPL+nszHkWx5RPhM846nTCo5jGkTMCLkH3Ovw8aUHXmMQg85Bl0q8BeYr4nKDvkBKarhZOp6JlN1dvSG2Z17AMeTV9EA4BP0Dp++/lzSVDcRWBpSqyElHD//5DAfl8G7RoapKxe1aVo5Sv+nIFJppqSaTVcZsdEfy1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388900; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onJA3EqTJlDFt/fI3dbGjWuSXd8jZFCFdiuYo5XyNOsfZk1cL/hV0mFkOvIIeM2X9hzLWKosChClKGssMPpkMeoNd/qjx0U2+0dV5knQoN3PGYFBhZ/HnwRth/+3naWm5wms+N/1US/QvC1LE6dlGKtMPo2nr/+aH5vCuvy2u0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=htZvU7Dh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUADb3GG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="htZvU7Dh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUADb3GG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmMfk4032519
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=htZvU7Dh0d/hRKb2
	eJiMky+eLQ59PhiG+BQbShGy8LGs8rQ4ljFOF378fgv+keKvyvq2FaW3BRGsbqPM
	AGj3GCXL6CuGsyMhYoEWmeNI6NS4DHBexPu7+R2djlmDCR3vyCDKG/3RPxk96H06
	2cI127QaazWiTAhO+yYtS8Vm3vwPJ45hiXxuRV0Ek86st29z0rNOI2y508yNWGBv
	PcgxGrlH5iwBf9luMyIAq2gjqAVnMJ05RAUAwEyIM+Fwx++l2BOODuSqfbppJLJ3
	k7VyW8oB6zhQfiwtDe5rzuuER/N9QdWWrU0Ak2SjIu5s0MtF+1DissO6vxOURF7W
	y1NlQg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8hck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:28:18 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-74ab6065f97so56405137.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388897; x=1789993697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=eUADb3GGIRgShGycPObjVXR3JBz03dpSrkNDoXyVaJgb00ZXly3sLhU1iRuTkVNkU9
         SVfzXWrvsdiFyGLLcwmn6l6YuiC8eGiko53QPfdt/OCKAHC4vZ3siciA8IuS/hOciC91
         DNeX3Rns9PmXMvSDVORAe7/8k6coPIg3p1YkiayxoYBky8mgCWBztJZHGzzDHhIV9xx5
         T3lDXXkMclQhGCt79sH1HYmF7z9JXegw0QAIn36UqVVn7KkF+Z4FtUDfaAvRpWG4ZQua
         YgMTnPYF4LYAhf3R4QunGrE09BIWn1DznNMnPP4ZoeO1fNLbVTSdj9IpaevOy3RchZ1k
         FkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388897; x=1789993697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=sTVD4GGNYcGuSwdQx36ZPsBfXYHOBzHNLyhFOB2NwNqhdk1hm9AN2q5qehy1XmDc+c
         rLpmZxGHps6PE/A3DTfd+IeTiWaDqpvekP/Y5kWpSt6hvzWX0uUIRZHUuUe7/iDDpf2n
         6tnaXt0lK3RwVeeS/wGpfFx9sKjpCIiifWuFe+dG5aWFxiCWbhLyqdxTPiLQmwjoQyid
         LczweOswgWIvc7292+wSb+82ZpjOYaU80RGK7Kq0gpHdJ7+d2FPNcPJO/GIaHbsDMPD2
         Np3+HEZ1DRIXqISQsYaiLdY+Z7ft/lafQ39jl4U8WedYOsoYBlLYLpdS0/ZPsNjsHwWn
         zoVg==
X-Forwarded-Encrypted: i=1; AKwUvByY9a6xF7d9C9cZZdbEVWYNYpfFkHX0TgcvYOsv00HiPZdcGYw55qojU8YQxiq8Dk3HxPbrskDoVv9b@vger.kernel.org
X-Gm-Message-State: AFuF++kJ5yOJqSeD1D7yERJWf+DvrBV1vBUtaBIF6Rv7PkcZQ4RESlJP
	v2oYPVFQXTYiOj1Vr+2IpU4Uy6r+vRmdnhsul0pfLU1wR2FDGqY+eWRWLHt+xFE+WL/3MU93C19
	VuscoFjd4oDrc72S724nxe9eacXIHQiXCQSvYYngDsF3TE1Ie/dqyT5kQoDy/KL/O
X-Gm-Gg: AYBFou3whsKcLlQ8bTJGtCYVp3iwoG6Bydzvk8T9b7StQfITSfn0lVOijy2U4IsoCNn
	6/lhgnhtHfdwAxikrbxDWCV8JZR8iS6fqwY7lBh95EeUAMnNNSnqDJZ7K61ZmsAJH0l5fr+zWpp
	pXWZSngvSfyENzKXZBsJR7ezf6lhmchCiu2FZ2/m+gAxPV7aRx88dRO/F7qMDivorQQn0hpScgw
	2ZBAUU2qF20qD52u73uyqYiG5wLxD+j0wma2NiaAmuhUisl10IyPeW6F8Px1njbb2SugXQ3Rzbw
	mqTEwA1KETNOSoi4+Kh+eDFr9mMRR4WHp4nfgYBBVH3dIM7Avu0g6EhdUOuUZQknOVb9ZtzO6pc
	z6/ypO/ySMJpLiDGxclPWQw==
X-Received: by 2002:a05:6102:54a9:b0:797:bbf2:197 with SMTP id ada2fe7eead31-79b58c77125mr326072137.1.1789388897604;
        Mon, 14 Sep 2026 05:28:17 -0700 (PDT)
X-Received: by 2002:a05:6102:54a9:b0:797:bbf2:197 with SMTP id ada2fe7eead31-79b58c77125mr326059137.1.1789388897215;
        Mon, 14 Sep 2026 05:28:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047fd4fsm2360273e87.82.2026.09.14.05.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:15 -0700 (PDT)
Message-ID: <28a63387-12c4-41a2-96d8-639471a89d56@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/31] arm64: dts: qcom: sar2130p: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-26-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-26-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXxf/xZHvzTSLo
 OV6D7wSv1N8UjX72gXIyD/81PDDlzTespy5Jyw7l4ebo+C8E8DroP4EXEpdv2+JRAT/5uTjpYsA
 lBdIOSoNx3fCMQUavekWDyZyRZU8UTD5UQKTWS2AfsW0CwZFpx8fdhTjHmbSi/hf414fGemXOL7
 +m+iAwAhmkQ1cqWZFBfMB2USCtzYIy2GlixHDygJ6yoprlSHM/JG2uXu2BzakGxZVRFQzIdmEMU
 ZdMBjIiAJ4cWn61ae1ILh6BRWhVTmUVdn0x7UdZYwMMeZ42bMd6PcDHg71vbFp+XgS6l8na1SEl
 LRop/JDXyd3ec3MlIJ5C3wZ4UZC3OcmsaLn4p8WpciLYVdOILNNaAZqRxSbzhgmvfBlqNH7Jl2r
 mIJdmOdeRGeXNMdhtz8ioBZrWCjsMPh8/IeICO8ZxnI4qKqAlUG7kiPz3P0HAXBKhcVuu35eIIp
 oS9wcKPJv6+dWrG0TRg==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7e862 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: H1whQRee9NJjnUgogGz6JrExtQQZUUIM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX+FDWdnaD4RUV
 McFQgijQGINGQbBE+fwNFE1UttbhNWV0xnw/ij+IEwNKL215nBddqg9mv1zSkBkwI6s+b0zMKCi
 Kf8aHbmxp9IyIhqbp3jXaxrVcziRZ7E=
X-Proofpoint-GUID: H1whQRee9NJjnUgogGz6JrExtQQZUUIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
