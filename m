Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACF5445ACB
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224374; cv=none; b=Qelu5opJa/Vc3atxYz6PGsbKuh40HaZqFU+rkA6W5XcZOY4tGxX2gTojOQXeub5B3nX9a+tOYcMJ9zQbhHOa6lf5aPR08lyNG+1jS5vOJNDf9z0HYnI5NrfwzIX9YsgCYmxnhlAAAKRkGhJxVVoKo7sCh7fmhPIWcM1aH+lxRms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224374; c=relaxed/simple;
	bh=rkTsNKBe2vBiXaOmjysjswJE0ns/iDJRIFhgpdDbvxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLRwYJH7rHyZXqlThEmT8eNupIsXvZwnzDnvMmzf5DHr+8raAdLNWAKTfwNcSKkpDdda7GkiwtLBLvZYiU1F0kgOx/+ZXLug/kIi8mSkfqFpdRFrRTNygEGN6u3Bos2mAfI1REHYBGse/toQC/M+IvUBzi+wvW0Z9DDxQDuqEM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8rNpAKk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLWqXqza; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8rNpAKk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLWqXqza"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSgdu3154917
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTrz6opimXplFt5S+RSKD1iRdssxK/R83VmjAnjUxYE=; b=H8rNpAKk9LIDxm1Z
	TyousgKeiH1iMmpBS5G2ljyekzytTX34PlQOgpI1vAJDVYKffODXl2KUEndPQiTj
	PAi4JUoi5KDiARfBL8UD7GnZOUjse1neWlBmHONPdU+GWEzy6tEi/3Ddl/QOTHEN
	6HWd/3h6DX+gHmgvkoB336v/n8a1weqkE1Ej5BeZaLcObqRDfEP/5qechSelOfqT
	TdO70Gt/P0LqNSP1jeZ6DKnmlJ+ya1Ceh9dM9gPCvq4+JnorIV9kGzKJVQQoe4yN
	rRkQ9kPA0KVE5dW8xcmz25XyHv5LnANpXIT4vAGved3JOt2BiV6k+OjvmAU3MEd3
	aGmLsA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1we8p5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:52:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e21552dso96969785a.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784224371; x=1784829171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTrz6opimXplFt5S+RSKD1iRdssxK/R83VmjAnjUxYE=;
        b=GLWqXqzagUa/grx9CMiU0Ns88fxcwbREZHZ2d0e2dFNlqMb5JbdKphyxumfRky9IMs
         /9dRyyevdBzGysoJlA++Aqs+GJb0DXx7UQq5zuep0cGjrtROm/guAo10M3DscFY7v7y0
         rMdrlPjzrLCyzVpWqXVsQDxrrvl0Vwx/OtQBYfpqsNzYVlDjfd8ee0Zg4WmYcmAUI6sY
         6ZZz7/1Dp80wzQNkO1db9QMW32Tl1DX+Y0y/++573bdm5JKw5y2lUP0A1yXIBvGJplDj
         bvN1DtNm9WR7Is6IRJXGjw8TDWViKnpQcRJjWSDmynbdNs+0Wae9hLYhltnFRlgb9TCJ
         6m0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784224371; x=1784829171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTrz6opimXplFt5S+RSKD1iRdssxK/R83VmjAnjUxYE=;
        b=gIKbV2dwdkO5FtiFJfl0p+ewfAOw8FhD53xuOxB4aGXrbd3+axuvNmF5t2wl1Jmp8d
         Xff7hdCB+nhm2KPOxH9Zz3R2M+8bSFcND1Grvt+yY3W3wwFdEzhC9El3DaVrJOKvkcbB
         XN6QYBeI5qd5+LSkTFfm98Wl16j07omXq5NbXsP+iuxmCI/tCaXI7PpbLeWvNWfjbEWb
         DbemeGXJNfHknbV10JbjOyIVf7AzVTnzv6n3A3Czbrpib4/gZ3bDA0bFd/z9fqfGmS+J
         SNaERbh1sduxUtkqdhfp4/5c0ZmvHLNAC/rhnfZrIlQAcknwC1ffS3CdPZiAhwC4xrgq
         l2xw==
X-Forwarded-Encrypted: i=1; AHgh+RpuuFFsNHq6A/Sr1yZp5xYodH+DolKjnmaE4FtJSNNtiQOiH5y5ONcqYoqHr8O5mAimYIv1nmcFpENp@vger.kernel.org
X-Gm-Message-State: AOJu0YwFmyHqSeElNKK/k6rAwlJQ3JDtO/E7pxlsOcF1twJ+avUWAYcb
	xD9U/OmRIOpOopj0lP74QAa+9pXPspPkA5V3DyN+3aAtzvHBtkjvaLkMZU5cftGd3fYkb8UjNf+
	XScxt/TSQ4iKYmF5r3mpot+kJuH3dFqi7rutWMv1p4MCQFYyfiu4lr9GP4imBq9nXY1h9nvzg
X-Gm-Gg: AfdE7cklA0Kt2g7NgdO7SQDJUb675xmqnuEVfwOj0SQpT7QhG0v5dPs2U5LJT/x/EJ6
	/zDt7JrzxwURO43PWzbJ0hXCQWbJAm/MJTZx35jdVTdADT3NZfxCqvcKNIyCJv234plNKguGB+J
	BD6orR/PAbocVCfvfvLUCEFU4zsVTkk8z4LeajWfFiyIZ5trF+5iZqj//PeDcprTOTTAXEpsBCc
	rI16aJ2vlqRGYwO0V9MAEKaZLsMi23x9/OhWV454lPFdHvCX4hYpFvyt1J+0YNX8fAWw0pwBgw0
	E2I1hq9lwChKYdfnO74q55KI1x9uBeTGszlpy5cTH+/qzuIsvWbUSbAW40gVQh+P/IfxBgDfKeI
	UpS+DaT5Bi1QohT0YX6pizP8g
X-Received: by 2002:ac8:5d05:0:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51cbf170c31mr189542751cf.5.1784224371278;
        Thu, 16 Jul 2026 10:52:51 -0700 (PDT)
X-Received: by 2002:ac8:5d05:0:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51cbf170c31mr189542471cf.5.1784224370850;
        Thu, 16 Jul 2026 10:52:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168749d7e8sm245027066b.54.2026.07.16.10.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:52:49 -0700 (PDT)
Message-ID: <0a22d86a-b397-4244-8080-2ff4ff4b2a3d@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:52:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: ipq5424-rdp466: Enable quad SPI
 mode for SPI-NAND
To: Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
 <20260716-quad_dts-v1-2-74d86792944a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-quad_dts-v1-2-74d86792944a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MiBTYWx0ZWRfX7WF/+ElPPWcl
 DBb8twgLWMBrRXjIf4B+XFuY3206iJxaeQuip15JZKdwPBHFnuwaZJt0A3Cw79t+h0JdPf1wjQY
 59EMsb+px/MIoxWDSHRSqG394x6dT3jKM84cpgqrCQ7BdswXGAj9CT724oLIeDzKOphY19td4c8
 /gK1GRv1lzPFjPFs2tBv/+40YJzhrW2Qy3uSLKTKZ4HoKS26cPW7MjGwiS79VssLik8c8FKfXsk
 lDClcQtOnHKK/KcMS1D+tBFKaTBs3oZ+lH3xokIP883g9hinZhKuaFReaiCpILRi1+248igqAlp
 9WV1ZxgftrgLlnRE6svELs0zggnsk2Uf60aPwgiNbuC2DWJhSS1W1/3dpHxHLFGIMO7NOfRhAZW
 od19maqrW8tSIj7ZLfceXqcrfqFYY40mauBGuJLcTsr1DVOPlxxBSEtaT5T0dMG66AOpc8Tv8e4
 VYDFYghDalPoL1AXCGA==
X-Authority-Analysis: v=2.4 cv=JJ8LdcKb c=1 sm=1 tr=0 ts=6a591a74 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=t4MeD1I3O73H1IN0jCkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MiBTYWx0ZWRfX7fGkihifFlS+
 vVeV6nP2s0i1Xp11+mkM56p6QapX5McWUw8/90XkPOPBl63eSYaahCidFkf8dJXT5Yr2X8gYMqR
 655eTeP4jjvL4kkUKlLg1SqKrK+7VSM=
X-Proofpoint-ORIG-GUID: y5ILB9zt8gw7aRlDBNfaGygSjhCft67E
X-Proofpoint-GUID: y5ILB9zt8gw7aRlDBNfaGygSjhCft67E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160182

On 7/16/26 7:55 AM, Md Sadre Alam wrote:
> Enable quad SPI transfers for the SPI-NAND device by setting both spi-rx-
> bus-width and spi-tx-bus-width to 4.
> 
> Without these properties, the device uses the default single-bit bus width.
> Configure the board to use 4-bit read and write transfers so the controller
> and flash can operate in quad SPI mode.
> 
> Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

