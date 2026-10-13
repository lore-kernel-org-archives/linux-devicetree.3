Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F5C395AE2
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883958; cv=none; b=ZW1lLbVTVPWioi5DfLA02FleZUCrQBvP+pUB3IsEdwfk/QqPdScQZzgI93bL6offwV2nMojIok3/bkxiwMM6FZAhMM2xwYeMc/CZTO4q03HRYnoxLaXZsLrX5kIjgU/VwhYjAi1k1R74pomXaZroWlnH82AcoNFZpAcktwEfpLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883958; c=relaxed/simple;
	bh=cbcFPermP78NZKc5qPlLyRAJgAr5+F3kxdBjMxXY43g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNAVOJe6h0eF7AjfrTkQssytJvuLp6nq8FinUFi0uqjvLQUliOnYnBIu5IFMA1rSyZj8BWrrNnx3uELv2BaCRG3plcxfwzLpEsrRjmxlLM/owBRTRNJ+NPr+thS2QnHTA5Zd7lcQuS1fu/7kLgJ/sUbpkYsbGQlrpQbO5QEQWrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etVYrReD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSW4zuDv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etVYrReD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSW4zuDv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OXSD015284
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCfanTdzF+SA3fKg/IDYE7BzKnCyd1eqz0NMWJFx8YE=; b=etVYrReDVvZXmCtg
	EZgl10pD21YhzzCw+uodd/0ss/dioKLuFBkeDrId7fPMOZHm932BI2YAOYwTI5sk
	3CDOr+ley1ubJsq8FMPXLlvfUHTyz688wxhpoaQNWrtveIBDrguiRq4leanj5Zuj
	L3OuMSeCeBjhg3G17NTUm8y9qbbSzBuOmSmgmqSpPtaKcUg3ViA4SxQRRw2BQadj
	NkDPVDtkc+gsv5tcpLwK0G8jUFxAWcynFSWdenu8a4EhgckCTAXK4dMvU9bI5GX/
	R9l1PhePSndWBskI8agjIkzwgGOv7zVrRcUE3ntUTWguXp2RVvNxCXI4dRChCRJF
	9t7eqQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugh7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:32:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so2738479a91.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791883956; x=1792488756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCfanTdzF+SA3fKg/IDYE7BzKnCyd1eqz0NMWJFx8YE=;
        b=OSW4zuDvAgogYNm5f/MIP01z7YIq7/fAtOIJYFAK7u5jrjZkGuZNOas5XMc/owhcwh
         /Xo62XzhM7zzmvobZ12tWee96KCfSJXgv6blfFlw1CuAb0rtxh/hO+pO7pbioyNHS+eE
         eGoQhMKiDXz22Q/jVsz57co074GhAxXw2FFPQEmcgYqig15UZo7xvdqZ3QsPv4o1fEI7
         Dd/puXZO6EYtBJby/mruwx9ns2c3Yc8XOvFShAVliwBznZzxsWGWRURPBDfiKHlVqAKO
         KOTwMxEI9htk5M65dEB3SYjQPTm1vEoEyz2UOYKp5O1oNYHfK2J3Yn01Egcp7slQ6Xk+
         /Rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883956; x=1792488756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCfanTdzF+SA3fKg/IDYE7BzKnCyd1eqz0NMWJFx8YE=;
        b=M3g7Tw3Br/+4rLZ1j4tmRXhWil753YOT2SYQPa6X3kYVbxy6t1pwIHNCj9Wr8g33tY
         i+uEBY7jrOnCeh1JjDrnMxu9/TpvzteimGcG+2x2riRkcuz33HCn3Us9GqVnD+s0UZiT
         Jnqq9AV1QIFiEMAmWD/nKknLrKEDpNxbpWTvG/s8mpGYEYjKcfKyBRglx3cLEuQKKJf0
         RO9qfgCSMmjqhqT7ZjDdscJ86kBprpWdPmpbtUYkIOpvkUpc40p31KHXqO2IQucjWxRB
         5wveaVptgn9GRvO1EGxi62ZilwYqsCnlTn4/sva7g+gmwH02EQyfL7KDn4SaW691jEZg
         +jwg==
X-Forwarded-Encrypted: i=1; AKwUvBwZLjewBjBRa2nv52V0IMiP8uOH7I0EP2idD+i7NODOzRldA9NtlTYguX1UFAfCHSh8ed9pKA5BhsU9@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+0IWGX/imKQvyiAiGB86q0DVz66nnFtlstzJKGXot0KxyMyqr
	j3H8kDJhpMqsSK0BhnhODO0/EetLuG+g4RC64Sk4HmcRRMJHwFDlR4lOh39ftdDCBjHoSfClUGv
	efDvgxB5ua1bFaiKW7pY00i5eGjlHkmrUyDxwNqZH3TVMTSjwqX02j592uyTj/nWX
X-Gm-Gg: AYBFou0ud9f7fsnn5kTcIb2i0CbenoBmKXTNGi6S0in1Apdb5AGzaK5sFTIbbaQU82T
	6Jo2BEjx8tKTsOgJaDpTaG4+R3soGY1cVjmMebkt0d1dkM6hV02xHmlAL2Fu8UTEt4R419o8aH7
	IRDVR8DfDt1r7cVHsDI48qbexAloLkIOnxGJNlvBhxRmS0K5q5xRkZVjUbXXhBFONq1iHivgAnM
	ORvaL6g3x+SOqNgfV9mfNmON16CE2EshZtKgWQ4zXYF4xsKAuX6w2A40RKyLNdJAp7cXdb5+6hf
	vzUWfCeEbO1iACQV7EfJwmTv4KdlNfP9bS1rJmDelDgXSEmKEAa8nWGCzG9j0y7ixXUw7SFk1Xy
	5M+RPeZzr9SNRexeBvVhyU4guOGzTzHkmYIdn
X-Received: by 2002:a17:90b:1d03:b0:39e:345b:3322 with SMTP id 98e67ed59e1d1-3ab3a60f97emr9055327a91.23.1791883956212;
        Tue, 13 Oct 2026 02:32:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1d03:b0:39e:345b:3322 with SMTP id 98e67ed59e1d1-3ab3a60f97emr9055311a91.23.1791883955654;
        Tue, 13 Oct 2026 02:32:35 -0700 (PDT)
Received: from [10.217.240.243] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm5141574a12.5.2026.10.13.02.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:32:35 -0700 (PDT)
Message-ID: <2c93f85d-a6f0-420a-9b7d-cd72a7963ab8@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:02:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-1-dcc9316ebb59@oss.qualcomm.com>
 <1cb252eb-a7d9-4eac-8d28-8d7781ea430d@kernel.org>
Content-Language: en-US
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
In-Reply-To: <1cb252eb-a7d9-4eac-8d28-8d7781ea430d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNyBTYWx0ZWRfXzvWE/VgGiWgV
 zsTSw0XwYsmOHFnRcNDYJK4ZRHB4URDtySrK0DqbT2Q31eSUTnRhtHo/5hdEh7glg/rXplH7JOk
 Mpe44kK3OTu2fk59iietlOIeUUhUc4cDoA8lytUeZv7HLsSBweox3YvyKQG3RQgXCyLwkcHH8Hw
 e9fAlRCG/V4jbkcfHigGHzKl+BJvzET7wM8fOfkEQCz2K+yVU1AjslREMLndjPYXn19X3gtNffD
 /VSBdpNfmimOh9h4ygfsBL4DeW5usVF2MORP2/gJkI70J0aLQ5MSXgKemLsSd94gPSuTklhto6H
 DE4/rcxszVGkawnkRZWpvBlB6YzG7AQhU2nS0z8qnicst3FWK5R0dBvCx6nKg7fwJs5PENc6E9E
 JYPl2tLn3iHwg5KnO3I1x3FReyl0pQJS+O8ABVc2Ew3e3yKa3nXhdTaYBNieXFj79Wa+sWyuLBo
 YemNHTqcknQOu5f+feQ==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6acdfab4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hQPrJiczcKPEErDkTKkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: KZ0Tc8Neu10AN9iOlp0GEzTawwnO0UWy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNyBTYWx0ZWRfX98vL02ClH2Uy
 RuPp/mvwpxCDMi3n+p+aN+5wXFrpLltFLQPDyMWcfXV0CaHYoaqmFNVVtJ34JnX0xTG3rZkrxxY
 fiweOBfHq56IzPAhlyQChJBN4Ue2H6A=
X-Proofpoint-GUID: KZ0Tc8Neu10AN9iOlp0GEzTawwnO0UWy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130037

Hi Krzysztof,

On 12-10-2026 16:54, Krzysztof Kozlowski wrote:
> On 12/10/2026 08:16, Ruchira Revdekar wrote:
>> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
>>
>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>> board, which pairs the Talos Lyra EVK SoM with a common carrier board.
>>
>> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> 
> No, this did not happen.
> 
> Please do not add inapplicable/fake tags.
> 
> 
> Best regards,
> Krzysztof

Apologies. The tag was added based on internal validation but Nirmesh
had not yet formally posted it to the mailing list at the time of
submission. That was a mistake on our part.

Nirmesh has since replied to this thread with his formal Tested-by:

Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>

will include it correctly in v3. The same applies to the identical
tag in patch 2.

Best regards,
Ruchira

