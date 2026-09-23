Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F1649C4BA
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160167; cv=none; b=WUc+6zPtI+u8AFvhMKNNFHASsUHjvwnVl40C38whl6+bs736q23XglVpWaAg1yYXxAM7Ts/4xadrZPwd8oomOCryD/7KgFLI/xfJdCeQCQQnxbDK01rAPI5N9nSnZnMVwuEB6CQ9FVKP2puxis45mPjcktJVHS6xie4u8MW/WkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160167; c=relaxed/simple;
	bh=y5yy7tHO9AIai9NsuLZcf+45dRBnZu4axEo1H5vLVZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jd7vMq+0VJrbidZdcAgnfkGJbmZEaPgG0rMWja0GAulk25sBi/aJVAu/9iXKSqqMzQmQe1QbgJNY0xALNR0uUXF+4lZF1HJtzQkl9g7//mLacgFgHmsvdX5V4KaulZ9c4ef0YdB+4sdz7C26vs93sMR5x6HKLZ6nHyRUu7Gw9Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSfo6A7J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPX+Oh7n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSfo6A7J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPX+Oh7n"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2vBg3409851
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSn/6ZldVFO+pNDo7FBbzphOZuuTROS0fYczJE55lPY=; b=aSfo6A7Jtm3cs4LS
	B9/LeXci8XLpznMbVGnYBGgxD3NLAICnh5aTeTqrcYP0bXT4n6fPmBBQEd4uwb3m
	ejT60GvvKSHa8I2pxZ1Rt0fPLv0WMwt+vTBLGBCXzc0mExdjbjvCHlRk0oODJ1py
	/8tX4+n3ZAnZCxm0r0BCdk/pocgB7u6H6dcAODU9SlFUZAUmZepGM1pg/Z/3hZDV
	BVxsSW6yFLkQKD4CGKWaVPlIsdERJIr1aCLZHvc3x/FKmv5VWyMNW99xqq2RJ0eZ
	FC5BwdWR+FIUQEY3/BPb2DDZRMJ2J9y8yIYfJWnJxOXc9C1HGI0vt8icYHamiYfV
	UIeBpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux863xs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:42:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so30942785a.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790160147; x=1790764947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSn/6ZldVFO+pNDo7FBbzphOZuuTROS0fYczJE55lPY=;
        b=DPX+Oh7ngvBX6FVtPwpKu1f0PrwXy7PzlfHM9JvXPvJxfgvh61axIuR0UOIMJJ/dEF
         qqimFT23/4thlas65r4Ebs1dkMM2SlrdkYrz4vWKXsQ/uSJeS9wjfq6OY/dP6U0ydqiF
         vgwImFU4uFMKml0D2BIuRx+wzGEqlt4Kw2w6wpT4QiP684udrqJzZtyp4PKvClmcddAG
         43KIP66UeLJQX/ldX9VJHF2OETpp+rW0GGRLwqr2kI0TWTiubElj4tPVl1Bbih2pdqE2
         3gsU6wVGqCRblxrbUwEhXB8Nn50eTr4TGwgqlm520TPmfjTq0UUTVPIyxRuhq1AonY2O
         PVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160147; x=1790764947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSn/6ZldVFO+pNDo7FBbzphOZuuTROS0fYczJE55lPY=;
        b=xUDVRnIHFIQZtq97icOOl7WEsgJvKJgFPfWkQMyFbRCmtFNYdFZLTHF0f/HqQ5AarS
         bDTIGQAXddmBB30pkbgHwsDAxqBtApxKGa/QMx/TGE7ADJJxudCEz7BnpM9PnB3NN26A
         OUfK7DKkqefS+kovqwUpwzbQJp9HrhAnQZchqRVMa4HEz54H8gb8wgNdUgrS5N7CKeZN
         rye0wG/AUyU42VdZ8yk5/0kXjTx1YJsp5UK3pe3AEq0psSofUxx5wfaJdJfJRrAWX2dI
         tHg83o1rPfDre5/CrJ5MrHTBmgJ9TqBJvjS5O709yb8pMf1Z6KSb9pTagNngcGT3X9NY
         kcHg==
X-Gm-Message-State: AFuF++mS6zu0N7iY+iESoNiKAdnrty1Sv6Mt0rwX1+c1KiR1iEeHSi3E
	xqXmb9OD1jNpLY46qvWgceZ8gql+FRXO+e/fh8y7Wd1+AOP1OFNj0lByFkgyOeoFdNWWxw4Z2kw
	2F+pXM0WYY99pGdld0oTGkxh1DEVSS9fTlr/MmwZPyWqsNgjeRZiVYZvAXwO5qIIW/QalKte3
X-Gm-Gg: AYBFou3m3ZbDvbEKMxxfZwxAymmWK4GjyuMqpes1ohuv0bUjgIim/+X1DtVL3GCVlWp
	QT8Z4bSFSbHx6jAyYadpZd/v4Sm3SJFChXxaZACa4eyrTCcuF/ebz5M/r15UWJIslpg8xWqel3q
	J4143hrR5nb+idFaw7GaKaDLHUESSth6etBBX+VIjVut15YXd56+neLH5eEW+FQhs0Y4aTLlJPQ
	EemJ79gvAjMki4qyILFgYhJSNBpSzx1D108o28P0ptpOFx0CVMQhGtyMBHDUx9EEkRkiR49Rn/7
	cALHhwOHobwkiKFr8kHfilWdzICcVeI/hcFJLRBpuMMciuKs4G/bzwExBXlqq0ri994H7S0m8/o
	s/5Q4sBahKGjA6yfZ5Wilhw==
X-Received: by 2002:a05:620a:8013:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93c2511c770mr281879185a.2.1790160146886;
        Wed, 23 Sep 2026 03:42:26 -0700 (PDT)
X-Received: by 2002:a05:620a:8013:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93c2511c770mr281876985a.2.1790160146449;
        Wed, 23 Sep 2026 03:42:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ab93a919fsm22378966b.41.2026.09.23.03.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:42:25 -0700 (PDT)
Message-ID: <b35858f4-10ee-43de-a211-3058eec6cc2b@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:42:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: hawi: Add base MTP board
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
 <20260923-hawi-dt-post-v1-4-e41473b6298b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-dt-post-v1-4-e41473b6298b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NK3DXlgZONNgns7KTaApsVz1F-jMq6DE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfXwvxYwd542HKa
 LOH8jU1QWNM+mslFrAniJS2TCKO57OFu7kON55toColRnXRjUXH1C7HzlQ7Hweh8DlFxElCbW+t
 uWL2xygFak3TQvNlYh6wEZ8LN7G+ozA=
X-Proofpoint-ORIG-GUID: NK3DXlgZONNgns7KTaApsVz1F-jMq6DE
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3ad13 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kiNFlXz_Q0Pc_Uqf8N0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfX4kfvYdv4GSGF
 qDOjw4H3RYCfcFCPaxbSvsCvIGqFAZDkh2iahM89lQ1+M2zNN5nPPbtu8L+3Yc7v+2K3jlzjEik
 EoTTIr2nY4X1j/PNbpCAiBi4LADiQVLljFR1Llz/zTdzSbFtU42SwQSjcPqaaFKTuatQdL+YenH
 pK/op4pJwfZljXHf9mzNcpAuh0WFmfWt+f9/HWCQxaRqoGCkxgaYXA3S8iFXaC/7UWVZLclaX+N
 QnsnAqiQIYlm0izN1ZN+lDvqTaFX+C+2rcCKwBTbH8unZtCNULh+014rAqarZCNbXCzwo2Hw5Ay
 d9bgcVjk1jrhFv2WNZ+6MKIepkzioaImcS8g6XWQJikNYbFrHo6ESgcMkzjgKUXsrQb0shzZm7D
 QDl2n29k5iezqvwd2aOaI4Ra5yTwrt1m84+6zCTdOXE1bbGs+Fz9lcHcS2dni4FVpg5/UPHXmuH
 h1NtUtPYsn7XKG9vTcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230042

On 9/22/26 10:18 PM, Mukesh Ojha wrote:
> Add initial support for Qualcomm Hawi MTP board which enables PCIe,
> SD Card, UFS, USB, remoteproc subsystems and booting to shell with
> UART console.
> 
> Written with help from Fenglin Wu (added PMIC), Palash Kambar
> (added UFS), Matthew Leung (added PCIe), Nitin Rawat (added SD Card)
> and Ronak Raheja (added USB).
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> +&remoteproc_soccp {
> +	firmware-name = "qcom/hawi/soccp.mbn",
> +			"qcom/hawi/soccp_dtb.mbn";
> +
> +	status = "okay";
> +};

SoCCP on by deafult, please

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
