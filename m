Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D69848550F
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787671575; cv=none; b=b2nT17ikVNFx43mio6f9Dr333ET9XiJI7gSKqQDo6EgrDlvsw6hLs//NXD6sqYpBAWdXBiHVGf0tx6hZ9C7wXuBazMjoqA5gZ+Xs9jfDn1fv/qhQP+UkygoVCoBen07oZ5sQOSYXLNj/FwP2GFAb77MZ0WLVJOEaE1TEeAaS4lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787671575; c=relaxed/simple;
	bh=phpEkPZEUkUlFJpU8mOcSvNhHDcWnWX6PmAgg9Jp/W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=msqYtgDrHTU9VZQ02rnANPJsq77D6GxTLaYdk8l1vLOQj5zKFbntSV2KU9LC9X1kc/qUrA6KyC96fW7C6ze7CuZcg099HuXt2UWnGBoku4JJhdNLjCwSgQXSxlKzV1WCzcsQae88GuyUukWzGj7sHD1P+Ssj5mB+vtDMLNu3Tqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3WwPSb4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OyYDTQdb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3WwPSb4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OyYDTQdb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PEUWiF1153283
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 15:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmvOoqVI4nFK8bx8DmiZ00iFRmbAwyUfhcb0iHKmqrc=; b=K3WwPSb4pTyqf+t9
	B+JxmUqQo+yij2VfzIOCKrdIVeX3gEKMkGF2lE0x1Cz049+U1yLDwycYFSJQh2Xv
	P+nRFezLhjBdPmrVOEtBEIDQ3r7vvUjH0BgIjGBd9mok/lE3bM84RWHYDIGtoDCS
	SPvgjDH2M/Di4+DY9m7rVl12BeYQrVfThEZOTlsLd8cUlGU45jrKkqKLTLC9nuaG
	ofRsluKv7L0K1gNG0B34ZnGLCcfz+Pv2ja1YU8z379kwV98jHNFjBzl4kelX/Kyk
	M4QTVUT99LxoBhEfyNhHqs9wXms54mU+O8DmAsOKes6uZO1qFULro6jnflP56fCd
	ddT3+A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93xxtpb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 15:26:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7530aaa7212so179078137.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787671572; x=1788276372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmvOoqVI4nFK8bx8DmiZ00iFRmbAwyUfhcb0iHKmqrc=;
        b=OyYDTQdbPugPiCaHVVIq2Dpwzq9cTbmUDSEY2XiYm3IP9Uf4pN38UNaj/sR/ztR7SB
         IVhTyk2JPETdKYMzcN/14mRj1OcS3cn+Rtk347hOg2PfmO/tJGuO3Khp/AW82bwUi6mh
         Z1LpJ/M4igKeJQf8oQ3cFkyPaOvrFCXDrtz0R80TOAfBBFe6/ynysGIjiNyg5Nll0MIT
         VDyzGhKMElDUEVDvfrNGb+brewEY8DkkHZ9sNH6q3v/SxiDDZ/A9B/0i/LqgoofYMQ+m
         C3nzYrlmWSc2yLIA47GVCY/ecqJCLjHC+8oASylfswddPuHlcoKfPRsuzTJ2+jfw3HyO
         kA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787671572; x=1788276372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmvOoqVI4nFK8bx8DmiZ00iFRmbAwyUfhcb0iHKmqrc=;
        b=IjkfhbtFqXKIxX/aiaUjocSQnBm0PiaBnqKbWYdZL4Uj/d4WxOu4MO8Qm8Bt7FxlwG
         FzdSdp2YHuZP7vv1M8Uv/TcmhvEvXPYq1j0Ta4QSQQJb3AWZaozbAncZIzMQ2HMVPg/l
         p8/qE84phPiRgQQ30TY6E/yhlAkJA1ne3C/UTlDE5nyYkYNyWDQ4IGTpMGP3OIskCSvm
         7gYRehf8Yeb8yRmPrRrfcVPq8eKjErFJz/JvmbtnBlMRsQOC9m5wRA2zzXI3EwuA5JP5
         9io8/5g5TH9wR2739rcWZNpolXG5mdplWXEZhNU/ZWZF0R9Qgcb8X1Kv426R1hw4Rk+c
         WHEA==
X-Forwarded-Encrypted: i=1; AHgh+Rq8P9h1UPogf3tW1OBjrYazIu4lqRyJk0RPhF9lmMczDbyB0XVxsQjQH48ieo/ltglpqsOnbiqvb4gW@vger.kernel.org
X-Gm-Message-State: AFuF++m/28DpWdwNOXxoP2Xrj1Nq13lUYIPgEQ/18mx5BQZAcra7+RbP
	YuLaq75rM8B+lOO+Uoiax9VKbsFvdOqcNd4fg0ymvWYe9vD+PSUzwIjzNxE37lr0/WYbLJSAVb8
	TZWcKMVEbbUdho92pzRoZye+1eZiZyaK0d1aoVvlpbtaesxKg8xFOy+KbnjdJ7qMo
X-Gm-Gg: AR+sD12VlOB4e0DTTMRGMyBClr4qS8RiTOx0CNF8GluXKOwEqyTYdpIGOP14y7HR+Fl
	mXUSZp18V9D+KGDPKpVgs+/O0gCiNMlmb+gTrroz3UzzWgW1JiNw+f6vD9zD/i7bcq5HLiDnn86
	fFQSQSetZhWg/j6v6kwV3trE5W1hLsuSUSd15FEaDeFiRtFQ/BqX/Dtm2sAWZjKOK+HI8nP30pq
	aFyvOva80hzQ0hrpYnwCrU0ixxzJVtls2ymUHhNisaLIZqH3N/Bqy9DV0lEl4NwVT5TNcc5JjHs
	xVLS0/uhpn1Sf8NA8wHFQ40EbnkDBnXwnM6TSxxNAZHcritJWx2sggMQRk033HIyOJxkej+2jRA
	ZdEzErzG+zWcRSv6obbH6i1Yf
X-Received: by 2002:ac5:c906:0:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c642f47423mr936877e0c.1.1787671572676;
        Tue, 25 Aug 2026 08:26:12 -0700 (PDT)
X-Received: by 2002:ac5:c906:0:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c642f47423mr936866e0c.1.1787671572175;
        Tue, 25 Aug 2026 08:26:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8b641fsm247083a12.3.2026.08.25.08.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 08:26:11 -0700 (PDT)
Message-ID: <31c12756-50e1-41e1-8b01-67c1e0d6d8cf@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 17:26:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 Replace old sound nodes, enable DisplayPort audio
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260825-blackrock-audio-v2-0-659cc4724d57@oldschoolsolutions.biz>
 <20260825-blackrock-audio-v2-1-659cc4724d57@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-blackrock-audio-v2-1-659cc4724d57@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEzMSBTYWx0ZWRfX561vhxl5/YG9
 spuPYWC0MQ3c1KTY1KBwOTfdedRnQ8WY7KAsGKfNXayK0jDejUt1BZhlXa5UQhlnAKqZ4eMxOcz
 ClM4mpxCUaLk5kggDEABJyR0JF+bvaw=
X-Authority-Analysis: v=2.4 cv=EOg2FVZC c=1 sm=1 tr=0 ts=6a8db415 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=dFqHnVd931faZYylGH0A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=ODZdjJIeia2B_SHc_B0f:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: V4NryhpHLshD2itwEjcjYkDlLL1JrmTT
X-Proofpoint-ORIG-GUID: V4NryhpHLshD2itwEjcjYkDlLL1JrmTT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEzMSBTYWx0ZWRfXyMrgDWwyk95o
 CJXDa27jz0hKYHEHVFDmhzXW0mLpIFrQTtIiRPQyy9GTbT+OwYVr/pieDjUS4KUl9kUKy8rl+Sg
 QVp8oZwSt8Sl8gmgP7JB3iHcz/roIexMxN+4iTuZ+Ra7mnDjeu4m7bmqgVPbkM3e7/V9/aQV/1l
 dXyXdF+x10jgfNRUfD2c5DxRwG7D05sDHi4GtYZvapPOfxFw94Et+YZxKtFYtzTLEv34V12fnJi
 gN7ATtpTeKRKMsm4ABH2AeDP1duRfKdA2vPCVs0e06qaGCiHBO3aA7yv92i1qngKpgG47EkLZ1B
 Mafdf8C3S2pqwz9+gC2XRQppNOC+jJfyojjowP5FvtckQb3EIibli1b7ij0vKogg3hfRNcP5M7e
 bCPp9cz1tp1JHOgq8wLXGczaE4GZq6Ap5/CVq/hXpnHJ+bzJuMtJ7uRE4cWB4lZ2gBgF0zl+pvq
 r2Mikc3rnNSveaP7fFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250131

On 8/25/26 4:07 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Windows Dev Kit 2023 has no built-in speakers, microphones or
> headphone jack. Likewise the device with the same mainboard, Surface
> Pro 9 5G [1]. The previous WCD938x / WSA / VA sound card definition
> was therefore non-functional.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
